Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482EF856299
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 13:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4477A10E6E8;
	Thu, 15 Feb 2024 12:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fuYqr2BA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910C810E6E8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 12:09:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-411f165ef9bso6989115e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 04:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707998963; x=1708603763; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oD1Kge1MAKO3hFilPPdHPuunG9YKQPJxbOfsT7xxHI8=;
 b=fuYqr2BAhNgjR/kSbIh5pGwCABUEkJBrfeRCRmQQdzr9pfsNhq1APajWz3sPuU36Ss
 mdcNYKX8iu/EK6JvEbTmZlC5PvN38SCmod7kgfUhM0XMls2VPzxdadZOvKcjYZmINWdR
 xVkpa7sERKrytLdQHR/ssEdFyJ5Vsk7p700EUv+2Rma6pbIbSX8m5tzm6/LoJP9pyz/l
 MXXW6LXKDtgy2DrOYpzgtjE2BM23iv6209dCUkNw3KoyvFUXX8Tlm+H9zgFtauJFbVGN
 yTHNcEdEQGlZHOFOzoTGza6RrqGdftI/vY4rJr8PEHmlcpg9rsCgSqOFSlYNRHcDrPRi
 GQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707998963; x=1708603763;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oD1Kge1MAKO3hFilPPdHPuunG9YKQPJxbOfsT7xxHI8=;
 b=rsWnMqsbSdm1Ggi7KGkuzs8t3sj6BExIjJq11S83s68PuqP5q06Sup4yuePGUEBTMj
 pM4bnuPxocx5BEgUE34bW/gAddFVEVEj+cvlcgUnxwXdZXvM1JpDpkfPfPbGMFNr1306
 wyJaquTCyt7+4vPtNg4sgMziDu3S0/TPXL9ocKeKy9pcst8gTZ9EesLshbYYBN7kTYTM
 P4MqUMgiPf/nel0yLWnYtu3wwJEDyCWzGohbk7rB97VB5vczyv8vu07/wGGdLS5QA1UG
 jhlErIPVvgp8piTTow3oGfIy+ja0O7cI9awib3ZJ8T1y+vNRo0xBRU3MdGbgA9sXS0oq
 jprA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhKZNF4u+5FP+cWH1ZAOTWKwOn6jfNfKGneOW+EmXd9P80sd13JQPCFlo6C3D9+SW8O5RriedxrannIkiYADbn4y95y2F9Jyj/oYbKIqqw
X-Gm-Message-State: AOJu0YxsWR88Eg0SHYn1Hocqg+EOmME6YAOJ2sKVxXwPdxukEgvD5sNT
 s/IQxoNvDlxv5x+D5uxWT5f48n+ZRnmH8ZOpP2U6AHh3TAZW0HAlA18s0hogpje0shlMSMpWTKJ
 zUrs=
X-Google-Smtp-Source: AGHT+IG2RWNKEhhSg5HPPp/aSl+Iy5VHARrddXWKFyyt57h+xu5XyxV2XCipKx1e6muRaSLbb7hNeA==
X-Received: by 2002:a05:600c:b87:b0:410:1da3:2ccf with SMTP id
 fl7-20020a05600c0b8700b004101da32ccfmr1211452wmb.21.1707998962990; 
 Thu, 15 Feb 2024 04:09:22 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b00411e3cc0e0asm1772092wmo.44.2024.02.15.04.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 04:09:22 -0800 (PST)
Date: Thu, 15 Feb 2024 12:09:20 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 10/10] backlight: Add controls_device callback to struct
 backlight_ops
Message-ID: <20240215120920.GK9758@aspen.lan>
References: <20240212162645.5661-1-tzimmermann@suse.de>
 <20240212162645.5661-11-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240212162645.5661-11-tzimmermann@suse.de>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 12, 2024 at 05:16:43PM +0100, Thomas Zimmermann wrote:
> Replace check_fb with controls_device in struct backlight_ops. The
> new callback interface takes a Linux device instead of a framebuffer.
> Resolves one of the dependencies of backlight.h on fb.h.
>
> The few drivers that had custom implementations of check_fb can easily
> use the framebuffer's Linux device instead. Update them accordingly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
