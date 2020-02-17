Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AA6160E8B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 10:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110E36E8E0;
	Mon, 17 Feb 2020 09:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D646E8E0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 09:30:05 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id t14so17583430wmi.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 01:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=zKg7XiJ/GLLJjLdRvNSgFQgROKwiVOwcJdz0oi8UtDo=;
 b=Hh/ThQirk64sRarp4K2nfV4nfY4B76979U0ugyExyBI6OMsR6In8ElqUATCwZqCdax
 4DbZZbbZy0qQorECO3iNk49pN/U8GtlYX9MAwIE5xOyu8DqGOJp/3Nr4IOBYt0Mj1vLq
 Xt5uRZwZaShRcNvwJRR1hZ7srQe75Ho9rUyQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=zKg7XiJ/GLLJjLdRvNSgFQgROKwiVOwcJdz0oi8UtDo=;
 b=RrjzHkgC3eaM+WQule7QpvV/eRlCKaYWmalQQZ0/jvtI3bcZouEOWgmJ3fyD4NN180
 ddzs28+FBZY7JqeeVyUqAPnKZDQtEfDSzvOtMnapAep/e/lIP5Raimuz564C1tGbdoda
 pB1Juw7zS0U1azPmZWsnxIJQ60xZAs7nGMaXQEJX6s5Cod0ePWeZGTx1CAEnxljseo95
 He/Wis5G2y5y7D69fudLppqy903wYwsspal2fjCPaBdxomZ3Lb5jpM3plm9/MJgFBYge
 hXOQLIdtyu30o6CA8+XiDPdI1udZYWByK+xnJz6jVArmTObnMoR8lG1jVz84j0EQaVtW
 y3IQ==
X-Gm-Message-State: APjAAAXVFay767hN8/gCBe17EHyKU0ClzQr2wXXrhpUqIzT8sEmnk9NM
 fCdtj+eExrE9WzunpAZpPLL/Xg==
X-Google-Smtp-Source: APXvYqykVR15o/hfxeC2vzZ33YgzV4NVTjQMaDTRPmaqE/aR1B/Va/SX6ImZfiG9GAu0dPqCvPPmoA==
X-Received: by 2002:a1c:660a:: with SMTP id a10mr21088262wmc.122.1581931804205; 
 Mon, 17 Feb 2020 01:30:04 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a62sm20406877wmh.33.2020.02.17.01.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 01:30:03 -0800 (PST)
Date: Mon, 17 Feb 2020 10:30:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/3] gpu/drm: ingenic: Switch emulated fbdev to 16bpp
Message-ID: <20200217093001.GG2363188@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200216155811.68463-1-paul@crapouillou.net>
 <20200216155811.68463-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216155811.68463-2-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 16, 2020 at 12:58:10PM -0300, Paul Cercueil wrote:
> The fbdev emulation is only ever used on Ingenic SoCs to run old SDL1
> based games at 16bpp (rgb565). Recent applications generally talk to
> DRM directly, and can request their favourite pixel format; so we can
> make everybody happy by switching the emulated fbdev to 16bpp.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
> index 034961a40e98..9aa88fabbd2a 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
> @@ -808,7 +808,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
>  		goto err_devclk_disable;
>  	}
>  
> -	ret = drm_fbdev_generic_setup(drm, 32);
> +	ret = drm_fbdev_generic_setup(drm, 16);

If you're really bored, could we make everyone even more happy by exposing
format switching in the drm fbdev emulation? Only for the drivers which
have a full format list on the primary plane (gets too tricky otherwise).
And obviously only formats that have lower bpp than the one we booted with
(can't reallocate the framebuffer because fbdev).

Just as an idea, this shouldn't be too horrible amounts of work to wire
up. But ofc more than this oneliner :-)

Cheers, Daniel

>  	if (ret)
>  		dev_warn(dev, "Unable to start fbdev emulation: %i", ret);
>  
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
