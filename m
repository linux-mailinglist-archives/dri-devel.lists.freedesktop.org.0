Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4651396A156
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 16:56:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF50910E0EA;
	Tue,  3 Sep 2024 14:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xUwuGXzZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B6110E0EA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 14:56:01 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c263118780so1668956a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 07:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725375360; x=1725980160; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mq4PoI0gorkAyyaCZit32i3NT28bgDnJGv+7A3joxoc=;
 b=xUwuGXzZcVBrlYE0xbSULkpkTkrDhTRh6jRz3qOlGrljvcXZRY8SC2nwCBmbWVj7xv
 ICL5BzcmhAzKZ/UoJ9nPCb5yLiAURgkkWvhUBqnp6u/nowBPQi26Q+k4oENIHMxDk5Ra
 /kpSQuC5FZ5iIoDKs/3YBrOtIswfgjmkNMnLPjtnCzB1+nG0YdN+/6iyVHueId2S0wx7
 tBKFzH6SSnrSbSOwgF1nzRj0HHuUoEgq0gyhFR61DXGFfh61zvF+xky3SAjfi/VpF5S1
 SFBPG30RBK9vK1B7BTDSDGuoFkevhuvca0vWeVOA/0gpFmEKHpIKG8gmdC5UTd4+IUlx
 EVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725375360; x=1725980160;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mq4PoI0gorkAyyaCZit32i3NT28bgDnJGv+7A3joxoc=;
 b=fwzv8CPH8xeFXark7OWIsG8/7LLpAP2dI4TLO6ShXSOMRgE71N8BCWmbT+vEmo+cWL
 l7WhgZirlVZxzyTyZw5Q+TFde0ltAcSWna9ZWtSWgV8RgrOFjBQtXtt09eh1DSwI3fI2
 PVRRsR+VLZQW3Yiqag3p9ilnzPVrvX9wlyX6Iv1o/P56RsoeRAFgWRmNdktH85LJptYU
 hODu2QxOO8RtSDJGuirwnqHf30+LNaJpjnP28GguYR9ok8GZLSDlLRufN7sJM80tMJhx
 3whXOMKLuVOFEZkLanJGwzRmB8iD5Bv0MN3Hpg98phU448Pc+4l+i41dp6G38Cd9qKUV
 a+XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/7u9SL87wJ+yzKeJ4bBc4A1ObBuMW5mRiLdBNE0aanWlD1FzAVbOuGENwMWdPQ+1yacMy0sF55WY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzL/VBmwcK8IQwTLVMFjvVrjX+xCNpVTijq4ny2K6gYfZOP96Yc
 rTjjHz0XArSrC2dlroPiO4NWZMk4ZZX4AEl2tIPW3PxkK66lTMvWYAQu1XR7cCg=
X-Google-Smtp-Source: AGHT+IFmCIy4WjsM9TxpFUwCZ5NOUizVwi6W7Jj6qImaS1/dW13DdSWn/EnFrWRnxL1i31++KvAcsw==
X-Received: by 2002:a17:907:e91:b0:a86:8ac7:2b5e with SMTP id
 a640c23a62f3a-a8a1d58a5d5mr322181966b.65.1725375359706; 
 Tue, 03 Sep 2024 07:55:59 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891b9e7dsm693567466b.104.2024.09.03.07.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 07:55:59 -0700 (PDT)
Date: Tue, 3 Sep 2024 15:55:57 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
 shc_work@mail.ru, s.hauer@pengutronix.de, kernel@pengutronix.de,
 shawnguo@kernel.org, festevam@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 26/28] backlight: lcd: Replace check_fb with
 controls_device
Message-ID: <20240903145557.GD12939@aspen.lan>
References: <20240820093452.68270-1-tzimmermann@suse.de>
 <20240820093452.68270-27-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820093452.68270-27-tzimmermann@suse.de>
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

On Tue, Aug 20, 2024 at 11:23:04AM +0200, Thomas Zimmermann wrote:
> Rename check_fb in struct lcd_ops with controls_device. The callback
> is not independent from fbdev's struct fb_info and tests is an lcd
> device controls a hardware display device. The new naming and semantics
> follow similar funcionality for backlight devices.

Nitpicking but...

s/funcionality/functionality/


Daniel.
