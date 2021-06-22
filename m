Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 983FA3B08C8
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 17:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6A56E58B;
	Tue, 22 Jun 2021 15:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803DF6E591
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 15:24:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id i94so24128803wri.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 08:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZeqWuXtX2BrYCzJWvhQ3y4KbulOq0QYwwBD94QW58/k=;
 b=ZlqWM+jail8wVe6yddVhoDkll94K1QcrO1qPfcnvA5ZgF7O5UWGiwgAoirgPr5VThQ
 PxLEoFhDthsBu11VLuKNyZ4t3jV2oXfE2AjGKpc2koo0GT0EP0wz7tBbPjapFZRbS4qF
 iL45agNDVjpfa14ecS7F0zPBWAmsGHIs8s5iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZeqWuXtX2BrYCzJWvhQ3y4KbulOq0QYwwBD94QW58/k=;
 b=OMnux7bTF/OQumxg9UB6koscd1fvutwS5pY6T0dEJfE4tZuk5u/tY2VlR41DfmMzkL
 xzM6PYedZH+2SrUjGouWs5VpXNGUjdITpsmVa+qVJfSm3TwznGFLuqzztMHtfl9V9IY4
 jLlGJ/dNmzi+FN79Fx0iVs3JzjtNrleQLemnzr4Ajj4H1gNBI3SWj6rBwcQesoUkcj5A
 GLq/7l0cM6oreAebHS81ZFqNVBXwb6Fo+qKxfcYmwrS1lRI5vNsosmb4Sy31bxH+dorM
 klG2H3g83vsf4jfoEr9j9rpzRt+LwF8I7V1Egjh1VlNJdwhFeMD3yqpzOhJ7bRKi86IU
 pwaA==
X-Gm-Message-State: AOAM531WS+gnLTnywonPscscsAOGpB5RBXEPpy7i3Ye8SiPa3Rm03xzO
 lxefRrJPsBZafJH5nVLNvSrzfA==
X-Google-Smtp-Source: ABdhPJxIsS4KMhI+Y3KiogSWjdDWrVZYSvpp7dXLHAVjT9HzjIzI+eRKdkXYHvp6Rq+N7hy/RDRSKg==
X-Received: by 2002:a05:6000:128b:: with SMTP id
 f11mr5556353wrx.171.1624375465147; 
 Tue, 22 Jun 2021 08:24:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a24sm2852645wmj.30.2021.06.22.08.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 08:24:24 -0700 (PDT)
Date: Tue, 22 Jun 2021 17:24:21 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/22] Deprecate struct drm_device.irq_enabled
Message-ID: <YNIApfAnFCsCHoYK@phenom.ffwll.local>
References: <20210622141002.11590-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622141002.11590-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: emma@anholt.net, airlied@linux.ie, nouveau@lists.freedesktop.org,
 liviu.dudau@arm.com, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 mihail.atanassov@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wens@csie.org, jernej.skrabec@gmail.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com,
 tomba@kernel.org, jyri.sarha@iki.fi, yannick.fertre@foss.st.com,
 Xinhui.Pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 christian.koenig@amd.com, kyungmin.park@samsung.com,
 philippe.cornu@foss.st.com, alexander.deucher@amd.com, tiantao6@hisilicon.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 04:09:40PM +0200, Thomas Zimmermann wrote:
> Remove references to struct drm_device.irq_enabled from modern
> DRM drivers and core.
> 
> KMS drivers enable IRQs for their devices internally. They don't
> have to keep track of the IRQ state via irq_enabled. For vblanking,
> it's cleaner to test for vblanking support directly than to test
> for enabled IRQs.
> 
> This used to be a single patch, [1] but it's now a full series.
> 
> The first 3 patches replace instances of irq_enabled that are not
> required.
> 
> Patch 4 fixes vblank ioctls to actually test for vblank support
> instead of IRQs.
> 
> THe rest of the patchset removes irq_enabled from all non-legacy
> drivers. The only exception is omapdrm, which has an internal
> dpendency on the field's value. For this drivers, the state gets
> duplicated internally.
> 
> With the patchset applied, drivers can later switch over to plain
> Linux IRQ interfaces and DRM's IRQ midlayer can be declared legacy.
> 
> v2:
> 	* keep the original test for legacy drivers in
> 	  drm_wait_vblank_ioctl() (Daniel)
> 
> [1] https://lore.kernel.org/dri-devel/20210608090301.4752-1-tzimmermann@suse.de/

On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

But I've only done a very light reading of this, so please wait for driver
folks to have some time to check their own before merging.

I think a devm_ version of drm_irq_install might be helpful in further
untangling here, but that's definitely for another series.
-Daniel

> 
> Thomas Zimmermann (22):
>   drm/amdgpu: Track IRQ state in local device state
>   drm/hibmc: Call drm_irq_uninstall() unconditionally
>   drm/radeon: Track IRQ state in local device state
>   drm: Don't test for IRQ support in VBLANK ioctls
>   drm/komeda: Don't set struct drm_device.irq_enabled
>   drm/malidp: Don't set struct drm_device.irq_enabled
>   drm/exynos: Don't set struct drm_device.irq_enabled
>   drm/kirin: Don't set struct drm_device.irq_enabled
>   drm/imx: Don't set struct drm_device.irq_enabled
>   drm/mediatek: Don't set struct drm_device.irq_enabled
>   drm/nouveau: Don't set struct drm_device.irq_enabled
>   drm/omapdrm: Track IRQ state in local device state
>   drm/rockchip: Don't set struct drm_device.irq_enabled
>   drm/sti: Don't set struct drm_device.irq_enabled
>   drm/stm: Don't set struct drm_device.irq_enabled
>   drm/sun4i: Don't set struct drm_device.irq_enabled
>   drm/tegra: Don't set struct drm_device.irq_enabled
>   drm/tidss: Don't use struct drm_device.irq_enabled
>   drm/vc4: Don't set struct drm_device.irq_enabled
>   drm/vmwgfx: Don't set struct drm_device.irq_enabled
>   drm/xlnx: Don't set struct drm_device.irq_enabled
>   drm/zte: Don't set struct drm_device.irq_enabled
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c         |  6 +++---
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.c |  4 ----
>  drivers/gpu/drm/arm/malidp_drv.c                |  4 ----
>  drivers/gpu/drm/drm_irq.c                       | 10 +++-------
>  drivers/gpu/drm/drm_vblank.c                    | 13 +++++++++----
>  drivers/gpu/drm/exynos/exynos_drm_drv.c         | 10 ----------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  3 +--
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c |  2 --
>  drivers/gpu/drm/imx/dcss/dcss-kms.c             |  3 ---
>  drivers/gpu/drm/imx/imx-drm-core.c              | 11 -----------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  6 ------
>  drivers/gpu/drm/nouveau/nouveau_drm.c           |  3 ---
>  drivers/gpu/drm/omapdrm/omap_drv.h              |  2 ++
>  drivers/gpu/drm/omapdrm/omap_irq.c              |  6 +++---
>  drivers/gpu/drm/radeon/radeon_fence.c           |  2 +-
>  drivers/gpu/drm/radeon/radeon_irq_kms.c         | 16 ++++++++--------
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  6 ------
>  drivers/gpu/drm/sti/sti_compositor.c            |  2 --
>  drivers/gpu/drm/stm/ltdc.c                      |  3 ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c               |  2 --
>  drivers/gpu/drm/tegra/drm.c                     |  7 -------
>  drivers/gpu/drm/tidss/tidss_irq.c               |  3 ---
>  drivers/gpu/drm/vc4/vc4_kms.c                   |  1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_irq.c             |  8 --------
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c             |  2 --
>  drivers/gpu/drm/zte/zx_drm_drv.c                |  6 ------
>  26 files changed, 30 insertions(+), 111 deletions(-)
> 
> 
> base-commit: 8c1323b422f8473421682ba783b5949ddd89a3f4
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> --
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
