Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8CA55AA12
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 14:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D5D11A7D7;
	Sat, 25 Jun 2022 12:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB5F11A7D7
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 12:45:57 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so4710301wma.4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y70bEuRHOkxxUZ0wqjxpIYT5Q0JSpCuiukC2RrSqg7g=;
 b=Tcu42CE0/ZmVde99u1BY1z0/lJj5YDCMHJuRQRaMVPM8qJesrGmAuwBa9861K6OM5G
 89k1V/goOLRzO0rzXGVFPve8x1FEwQar2kVCLWCxos005889+K5jRuc0apg0MJ8OJcWw
 FhRsfeiKKjuy2q9H5NNAQOzZUYSXR/1YpDwAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y70bEuRHOkxxUZ0wqjxpIYT5Q0JSpCuiukC2RrSqg7g=;
 b=YQTBAU/GHtn+h29UbSQHVEQ5+jA/ydgA4PKrSRQgYPGp1S7dCeLKn4ghepfy5M8ecw
 JUliuVcZOexManlTE1hOkK+lmqvljoh+4e3nEL3jHL3HB+/Jlwk90vhnNl5ZOZr+qlYI
 7S4lFp6iRZ+vSixg7qom1XGdnb2JoG3TrkA8529Q1QenP8IGAZLrYH4Zh1+tYnNCBmQz
 IG/gqG2OYJbVanmTz7Nqa2lKVmZSaKvcmGciteAKC8u8KDCY4lb1hs8CYNM9ILZNgd5Z
 +mRApBMF9QP1C6hFQu/4oWKAG1JQln5/zwutIRMo2yv92gecFnoyOv2u0eu7xHIgJSOC
 wUDg==
X-Gm-Message-State: AJIora/GLrkLJMv2OjBCGMMekkcMFpf7FlX1zXWYqOyCvFuKSMoVk6KW
 d9jI6pG9zGrZp+a80VeXVwb9ug==
X-Google-Smtp-Source: AGRyM1v6xW+A+MlXOW5DqxzeePWfJRGMwxlPH88PAxgwKhE6ciVzFhoxZsjPPO+UKQum8gYyezWRHA==
X-Received: by 2002:a7b:c017:0:b0:3a0:355d:a965 with SMTP id
 c23-20020a7bc017000000b003a0355da965mr9003857wmb.173.1656161156433; 
 Sat, 25 Jun 2022 05:45:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c4f0e00b003942a244f40sm10736813wmq.25.2022.06.25.05.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 05:45:55 -0700 (PDT)
Date: Sat, 25 Jun 2022 14:45:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 1/4] fbcon: Disallow setting font bigger than screen
 size
Message-ID: <YrcDgjpgeqSZtSOE@phenom.ffwll.local>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-2-deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220625122502.68095-2-deller@gmx.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 25, 2022 at 02:24:59PM +0200, Helge Deller wrote:
> Prevent that users set a font size which is bigger than the physical screen.
> It's unlikely this may happen (because screens are usually much larger than the
> fonts and each font char is limited to 32x32 pixels), but it may happen on
> smaller screens/LCD displays.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v4.14+
> ---
>  drivers/video/fbdev/core/fbcon.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index c4e91715ef00..e162d5e753e5 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2469,6 +2469,11 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
>  	if (charcount != 256 && charcount != 512)
>  		return -EINVAL;
> 
> +	/* font bigger than screen resolution ? */
> +	if (font->width  > FBCON_SWAP(info->var.rotate, info->var.xres, info->var.yres) ||
> +	    font->height > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
> +		return -EINVAL;

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Maybe as a safety follow up patch, we have a few copies of the below:

	cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
	rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
	cols /= vc->vc_font.width;
	rows /= vc->vc_font.height;

Might be good to extract that into a helper and also add

	WARN_ON(!cols);
	WARN_ON(!rows);

to make sure we really didn't screw this up and give syzkaller et all an
easier time finding bugs - it doesn't need to discover the full exploit,
only needs to get to this here.

Also maybe even check that cols/rows is within reasons, like smaller than
BIT(24) or so (so that we have a bunch of headroom for overflows).

Anyway just an idea.
-Daniel

> +
>  	/* Make sure drawing engine can handle the font */
>  	if (!(info->pixmap.blit_x & (1 << (font->width - 1))) ||
>  	    !(info->pixmap.blit_y & (1 << (font->height - 1))))
> --
> 2.35.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
