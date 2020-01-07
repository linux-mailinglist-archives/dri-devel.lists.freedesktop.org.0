Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001B1133CD6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297AC6E861;
	Wed,  8 Jan 2020 08:12:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C324E6E05D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 12:46:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so41182700wru.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2020 04:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=pLuEHRJGyuYZ21es9PhlN9IhZbnDG1epHKk/DRLbj4E=;
 b=YaNRA9k08R1pyZK09tCeQxl8Arnavxri5xC0gsDRXbAiUxyVOQpGXRc3FHRxwn3Zpd
 LF4sv6GM/30QdDCv4c2Ihhv9wglO6/HC/llT+fc1pm6YIPkPQiwzEza3gmF2MwLk+HGo
 5TuTsH/VANEjPnN+bza3IAP4zU61ZQvj0oi2BBIEXCmSWN91PD0yscxKl2ddi/I3G2pw
 rzBC7E6AhBBDrU7ZVUJAtNt2VCB/PXmwiEWpMmgelzxepQrck9ng+CHO5Xc+3XajxkE5
 pBEZD+JQCrau8mRQU/zEA38MfzgjTYE+FUm0DwHSnlnxYFkQSCE+WawTGb0uP4co3A0Q
 Cokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:date:to:cc:subject:in-reply-to
 :message-id:references:user-agent:mime-version;
 bh=pLuEHRJGyuYZ21es9PhlN9IhZbnDG1epHKk/DRLbj4E=;
 b=BdL5TgRl1mxvoviBcyIwU+HV+KzJYjwlW5EJlS3ucMy4MMlcMy5QMxiSveqA9f+cUi
 GFe0gszru02g2iiLnDGAGWw06yzVlMp8qW455uF+sMsJ9v5Tb3uu2XwPQxksFzMG+LZu
 twHTqw5XVsYznseFJFO20GmrxoQha9KoxtFVxcsWmvmI/EJViRS1ReiDj6pnDWrZcHFx
 1OuwNXZI9k7rt1O1Wc/dTlTGBi+Jmj7rq4KhYfGl2L0OG0cnQxx0ZZxfqOTlB1Lyxb3z
 gt7T5u+7XwC+aXvJbZkFkuZAj9+WoJ9uCAWmELgYpuVj5zwo2Kb6SXDx8w91gNaA7xt2
 7J3Q==
X-Gm-Message-State: APjAAAWPWjx0za3Hmvj9xZ5yV8G3dEUlypbzn3sGi1zoTB/7RzRvDy3q
 V8TzQXwKojiQ82mr4axCnS0=
X-Google-Smtp-Source: APXvYqzXnMjxG69Kfig7l7SnYmCyuET+NmyKxhHkb2al/g3bEBoEPhgKL3QN9Mtg5f9bOgNyUbNtKg==
X-Received: by 2002:a05:6000:11c5:: with SMTP id
 i5mr106966437wrx.102.1578401163499; 
 Tue, 07 Jan 2020 04:46:03 -0800 (PST)
Received: from wambui.local ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm26702237wmm.15.2020.01.07.04.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 04:46:02 -0800 (PST)
From: Wambui Karuga <wambui@karuga.xyz>
X-Google-Original-From: Wambui Karuga <wambui@wambui>
Date: Tue, 7 Jan 2020 15:45:55 +0300 (EAT)
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/sun4i: use PTR_ERR_OR_ZERO macro.
In-Reply-To: <20200107115737.ybaxsjyvfaledfje@gilmour>
Message-ID: <alpine.LNX.2.21.99999.375.2001071545160.6077@wambui>
References: <20200106140052.30747-1-wambui.karugax@gmail.com>
 <20200107115737.ybaxsjyvfaledfje@gilmour>
User-Agent: Alpine 2.21.99999 (LNX 375 2019-10-29)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, Wambui Karuga <wambui.karugax@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Tue, 7 Jan 2020, Maxime Ripard wrote:

> Hi,
>
> On Mon, Jan 06, 2020 at 05:00:52PM +0300, Wambui Karuga wrote:
>> Replace the use of IS_ERR and PTR_ZERO macros by returning the
>> PTR_ERR_OR_ZERO macro.
>> Changes suggested by coccinelle.
>>
>> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>
> Unfortunately, that patch came up a number of time and shouldn't have
> been a coccinelle script in the first place.
>
> I've sent a patch to remove that script:
> https://lore.kernel.org/lkml/20200107073629.325249-1-maxime@cerno.tech/
>
Okay, thanks for the review.
> Maxime
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
