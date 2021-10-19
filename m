Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 222F34335E6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 14:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47526EBA3;
	Tue, 19 Oct 2021 12:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27EB06EBA2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 12:26:59 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y12so12696893eda.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nf4thv4NywmSrS6ss9EOuZ/0ID+ILkEBujPnF06oQFw=;
 b=UYw+uTCk12NwPXHydgoaWCucf1NQGj8Ee83kX76opDg7+PoUlYqo8gTkFWUdKL1r5Y
 V5DIk3d3ormOxEv3UQwdYoBsl4K6rOCTOmCEKKZIqVUfejHG4GclUSG+cPpYnV9ZK7QG
 hF8p59Jhvg/cDHt02xrQXwjkVoXeh1CsRDDu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nf4thv4NywmSrS6ss9EOuZ/0ID+ILkEBujPnF06oQFw=;
 b=nryUmKjNVDysUseOh2Pzgl1vRZd6KEU4wyHSfGmfoONT+0l8boTmruCspFqr9xLNdw
 AA9chlMRJ/UaJuUf5ZuiCCtIO75Q2ZpMaSszkBXAx8g1cLNs0AbT3xfYNJaI5/jAbJZd
 gNsWmYbVt3zCRc6Zp4G00+VI8BobQAf5CtjhqgllxIGoMo86ZQWHgMn4BGV31cYxf8JY
 2m8VtCClpPH4MQVq+SwTfOpcAloKFhZPnn8l8deY7U7CXMuZ9iDH9MHRsAqVYuA9PS0S
 Lth0jPZHbqPk7WuFrcI77srwUVWa1ZJg1zKn1W63qqLB2n/ajjE/cCrBP34FGLp38W74
 1b7A==
X-Gm-Message-State: AOAM533ZGlDUSj5CgiS/H6zvNrDhpHaO/CfP9oDQ1L9T/JEGWQdthO46
 89Eq3lSPsRrlCONNWss4j+bMOA==
X-Google-Smtp-Source: ABdhPJwXHbUuvLALsKAY4PDc6rY/XZeEe4pvQz4KNLBuiilyfT81Bd92GDhxCfnksqslcEPkYrGWjQ==
X-Received: by 2002:a17:906:2a0d:: with SMTP id
 j13mr35498816eje.545.1634646417598; 
 Tue, 19 Oct 2021 05:26:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t18sm11727422edd.18.2021.10.19.05.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 05:26:57 -0700 (PDT)
Date: Tue, 19 Oct 2021 14:26:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: patrik.r.jakobsson@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/gma500: Remove generic DRM drivers in probe function
Message-ID: <YW65j25AgJA0x1dl@phenom.ffwll.local>
References: <20211019080942.24356-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211019080942.24356-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 19, 2021 at 10:09:42AM +0200, Thomas Zimmermann wrote:
> Gma500 currently removes generic fbdev drivers, but ignores
> generic DRM drivers. Use aperture helpers to remove all generic
> graphics drivers before loading gma500. Makes gma500 compatible
> with simpledrm.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/gma500/psb_drv.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
> index 7a10bb39ef0b..7ea82d7ddfcc 100644
> --- a/drivers/gpu/drm/gma500/psb_drv.c
> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> @@ -19,6 +19,7 @@
>  #include <acpi/video.h>
> 
>  #include <drm/drm.h>
> +#include <drm/drm_aperture.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_file.h>
> @@ -448,6 +449,17 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	struct drm_device *dev;
>  	int ret;
> 
> +	/*
> +	 * We cannot yet easily find the framebuffer's location in memory. So
> +	 * remove all framebuffers here.
> +	 *
> +	 * TODO: Refactor psb_driver_load() to map vdc_reg earlier. Then we
> +	 *       might be able to read the framebuffer range from the device.
> +	 */
> +	ret = drm_aperture_remove_framebuffers(true, &driver);
> +	if (ret)
> +		return ret;
> +
>  	ret = pcim_enable_device(pdev);
>  	if (ret)
>  		return ret;
> 
> base-commit: 762b53b56af425f89f892e99583dfd84c73d731c
> --
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
