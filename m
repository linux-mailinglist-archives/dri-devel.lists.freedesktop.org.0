Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1383A3BE2F3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 08:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02616E046;
	Wed,  7 Jul 2021 06:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3C46E046
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 06:13:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso864817wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 23:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=odt0jbZHZ7Fm2nPoaDhP3Dqf0zG4dR5TGlhg5EMNQlw=;
 b=2IBp2OQK5HpK3FQn+wc7Nykay6BSwETz+juSB+8NqwiTxLv9fjqJ96pHvmXwcVWPSJ
 OQ58lbsUEQMxex5ygeXfQqHdhnBqfdID1QtGnBFimD1pAvHjxVwH4DqJRi/s0kMaFHPz
 yhVjoeY4Xi01bdvr44r+ez/n8b49lP1e/L2kzUxrVGCjY4h2sh7RWNi6h8Qh1YR0bv0H
 HPNprkpNkjwpo3AA92s8K/MK97J6S0dGN9F6KGHhLi4TpX7l1nXD0wLRXZJWJcq5Z0Yp
 pPfB/NVBhF75aYZwTSKYWgihAoOlsmuqEQRTC1a4QP0lNOQxndRQvfycL91W4U2x9hy2
 LJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=odt0jbZHZ7Fm2nPoaDhP3Dqf0zG4dR5TGlhg5EMNQlw=;
 b=G3HNser5iGup1GJAWEanuxr82EfJoaJPEx6yc8jH0DLWQdh5rK4Dh2UFtvrXVhurBs
 nrJtTCZNdsQyoROCMvjPbVEaYtDuammDcLIKnazig0urklf98G78ZUziz+z0D389pK0n
 ZN3huViiCKsKSflWOw0WGANdn90Mi1QXEoS5B4S0sZ7c8IhJtv1yjyLyXhBbIXaLT0th
 vGd7bJAckP9MZYiLndqqtdmKp1cjSQM19pVCZv5t46NOcDliMzWu2DLeq4Smv64nNCuX
 2ZOlyNd4e6YB2JGWUlyDN7lG7shnb2FPTX1udv/MwpLnDxkP4gQ12xrqiRl+84UzQH9C
 8+BQ==
X-Gm-Message-State: AOAM533C0tthcQOdjos0QQbmGu0ULofAvPbTuanrBb8B3piwsYTU8MVr
 KP1PVMwAL6X2ia5ymTx1h6OseQ==
X-Google-Smtp-Source: ABdhPJzTNOuQs9xw3ntgNPVU+gGXeHa60Bz+hXBN8APBLYAtYALVVJJ1sELfK1Vum9ES59SqUldVCA==
X-Received: by 2002:a7b:c449:: with SMTP id l9mr4827330wmi.98.1625638384631;
 Tue, 06 Jul 2021 23:13:04 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b925:9854:af33:ad0d?
 ([2001:861:44c0:66c0:b925:9854:af33:ad0d])
 by smtp.gmail.com with ESMTPSA id h9sm17716724wmb.35.2021.07.06.23.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 23:13:04 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: Convert to Linux IRQ interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
References: <20210706074545.8763-1-tzimmermann@suse.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <84e08930-24a9-14f7-c2ad-9384a9bca86f@baylibre.com>
Date: Wed, 7 Jul 2021 08:13:02 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210706074545.8763-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le 06/07/2021 à 09:45, Thomas Zimmermann a écrit :
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 3d0ccc7eef1b..bc0d60df04ae 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -21,7 +21,6 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> -#include <drm/drm_irq.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> @@ -94,9 +93,6 @@ DEFINE_DRM_GEM_CMA_FOPS(fops);
>  static const struct drm_driver meson_driver = {
>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
>  
> -	/* IRQ */
> -	.irq_handler		= meson_irq,
> -
>  	/* CMA Ops */
>  	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(meson_dumb_create),
>  
> @@ -335,7 +331,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	if (ret)
>  		goto free_drm;
>  
> -	ret = drm_irq_install(drm, priv->vsync_irq);
> +	ret = request_irq(priv->vsync_irq, meson_irq, 0, drm->driver->name, drm);
>  	if (ret)
>  		goto free_drm;
>  
> @@ -354,7 +350,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>  	return 0;
>  
>  uninstall_irq:
> -	drm_irq_uninstall(drm);
> +	free_irq(priv->vsync_irq, drm);
>  free_drm:
>  	drm_dev_put(drm);
>  
> @@ -382,7 +378,7 @@ static void meson_drv_unbind(struct device *dev)
>  	drm_kms_helper_poll_fini(drm);
>  	drm_atomic_helper_shutdown(drm);
>  	component_unbind_all(dev, drm);
> -	drm_irq_uninstall(drm);
> +	free_irq(priv->vsync_irq, drm);
>  	drm_dev_put(drm);
>  
>  	if (priv->afbcd.ops) {
> 

Looks good !

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil
