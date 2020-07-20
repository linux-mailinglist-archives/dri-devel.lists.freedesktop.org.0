Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F55422657F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 17:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F19D89D60;
	Mon, 20 Jul 2020 15:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C216789D60
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 15:55:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g75so16920wme.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9loMMk4AmgL39kq2nHKTL54p5LAIvezlxMI8Wqiloh0=;
 b=iU+vSMgoggzN79PqiedjZBwG1jpwM5ahTMH3sMRyNxJEnwbLec3H/U9ybGdenZHEnx
 e9KFL69kntgW2I9V2MSHHeYSA1ndT10Cdo5+P/QZW+rYcScdCzXQ/kZP1GUMF7YSj62j
 cmc36anUbZNrXDXzPLm4t4Fhr2iMWJuzUa/Kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9loMMk4AmgL39kq2nHKTL54p5LAIvezlxMI8Wqiloh0=;
 b=VPUpKsyD4rz8XfrMexA2dwjT3/X6R66kOmGvVNcHn7wq0ghs1R0moL/Mfg3WCwqi7R
 AKbTmTWYdRm8oS+paH2luRjd9p9hPNEZ2Tjkkxf9k4Y9030osUljx7pf967ffDXMb8rw
 Mb3lfjDiQBtpcptC0jgrzXodEQFe5u9UoaxRzD2OI/JNznGJV58/Z2COd+ssj8nVS1w5
 dK+rQnz0yBbd2U4pVmQqoqQ4cbvI3n8Lc0YlQBtoB6biyX4bVoZ8cio4+OLDASk5hRF0
 F8QDz+Wc7OEL1KkJErlgDrbPvknQYKlICDrcMD3ZvsDjuOgk5eC0vDC8luVeim6cBdg7
 btvw==
X-Gm-Message-State: AOAM532oU9KhlRhp082wekoucQ3oQJIUSqWY3t2DTOPuNGs28gXkm6bR
 VY94MURJCpEwz5u/7X+97oFEFCzlclc=
X-Google-Smtp-Source: ABdhPJwqBHy1SmhV0ZuWV4+kRUTMo3ruiksVzDNa2NfsMPv7Qa2EyMfJ4Y09yo03FpESm1rEWTCAWg==
X-Received: by 2002:a1c:345:: with SMTP id 66mr29680wmd.31.1595260546396;
 Mon, 20 Jul 2020 08:55:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z1sm34222803wru.30.2020.07.20.08.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 08:55:45 -0700 (PDT)
Date: Mon, 20 Jul 2020 17:55:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] drm: pl111: Update documentation
Message-ID: <20200720155543.GY3278063@phenom.ffwll.local>
References: <20200720130327.92364-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720130327.92364-1-linus.walleij@linaro.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 03:03:27PM +0200, Linus Walleij wrote:
> Remove notes about migrating from the old driver which is
> retired as all users are now migrated.
> 
> Update the text to reflect that we support PL110 and PL111
> alike.
> 
> Drop the bullet on memory bandwidth scaling: this has been
> implemented.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Fix up the documentation rst link as well so we don't
>   get build failures in the documentation.

I'm always happy when people take care of the docs.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  Documentation/gpu/pl111.rst       |  8 ++++----
>  drivers/gpu/drm/pl111/pl111_drv.c | 20 +++++---------------
>  2 files changed, 9 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/gpu/pl111.rst b/Documentation/gpu/pl111.rst
> index 9b03736d33dd..6d9a1b59a545 100644
> --- a/Documentation/gpu/pl111.rst
> +++ b/Documentation/gpu/pl111.rst
> @@ -1,6 +1,6 @@
> -==========================================
> - drm/pl111 ARM PrimeCell PL111 CLCD Driver
> -==========================================
> +====================================================
> + drm/pl111 ARM PrimeCell PL110 and PL111 CLCD Driver
> +====================================================
>  
>  .. kernel-doc:: drivers/gpu/drm/pl111/pl111_drv.c
> -   :doc: ARM PrimeCell PL111 CLCD Driver
> +   :doc: ARM PrimeCell PL110 and PL111 CLCD Driver
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
> index 96e58fda75d8..46b0d1c4a16c 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -10,18 +10,11 @@
>   */
>  
>  /**
> - * DOC: ARM PrimeCell PL111 CLCD Driver
> + * DOC: ARM PrimeCell PL110 and PL111 CLCD Driver
>   *
> - * The PL111 is a simple LCD controller that can support TFT and STN
> - * displays.  This driver exposes a standard KMS interface for them.
> - *
> - * This driver uses the same Device Tree binding as the fbdev CLCD
> - * driver.  While the fbdev driver supports panels that may be
> - * connected to the CLCD internally to the CLCD driver, in DRM the
> - * panels get split out to drivers/gpu/drm/panels/.  This means that,
> - * in converting from using fbdev to using DRM, you also need to write
> - * a panel driver (which may be as simple as an entry in
> - * panel-simple.c).
> + * The PL110/PL111 is a simple LCD controller that can support TFT
> + * and STN displays. This driver exposes a standard KMS interface
> + * for them.
>   *
>   * The driver currently doesn't expose the cursor.  The DRM API for
>   * cursors requires support for 64x64 ARGB8888 cursor images, while
> @@ -29,16 +22,13 @@
>   * cursors.  While one could imagine trying to hack something together
>   * to look at the ARGB8888 and program reasonable in monochrome, we
>   * just don't expose the cursor at all instead, and leave cursor
> - * support to the X11 software cursor layer.
> + * support to the application software cursor layer.
>   *
>   * TODO:
>   *
>   * - Fix race between setting plane base address and getting IRQ for
>   *   vsync firing the pageflip completion.
>   *
> - * - Use the "max-memory-bandwidth" DT property to filter the
> - *   supported formats.
> - *
>   * - Read back hardware state at boot to skip reprogramming the
>   *   hardware when doing a no-op modeset.
>   *
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
