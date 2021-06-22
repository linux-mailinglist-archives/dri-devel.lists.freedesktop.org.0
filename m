Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3165F3B0A25
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8768999A;
	Tue, 22 Jun 2021 16:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Tue, 22 Jun 2021 16:18:27 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3F68999A;
 Tue, 22 Jun 2021 16:18:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C99E10C5;
 Tue, 22 Jun 2021 18:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624378705;
 bh=VZRaHkXmbWt79g3HywVIeyxN42SRIqciWe7F8pv0Ohc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PAFCiMffBQrxmL9kbXF04+tAFxSNJSey1X3TgZSJElZPT76zpOsJr1VxvVuS+2pLs
 jEuQdHa3Te4yK0fbtauEH5RYNqkMlGX9ety09L1TcAb/y8wrcCehVwWI0z+5zEyTxS
 Ek7I/w21y8yHUPn5eB+PAvMDVy77oMs0oniYqpo4=
Date: Tue, 22 Jun 2021 19:17:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/22] Deprecate struct drm_device.irq_enabled
Message-ID: <YNINNfQjAd3R2H+0@pendragon.ideasonboard.com>
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <YNILtLMkI3uoH7mJ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YNILtLMkI3uoH7mJ@pendragon.ideasonboard.com>
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
 amd-gfx@lists.freedesktop.org, benjamin.gaignard@linaro.org,
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
 mcoquelin.stm32@gmail.com, hyun.kwon@xilinx.com, tomba@kernel.org,
 jyri.sarha@iki.fi, yannick.fertre@foss.st.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, christian.koenig@amd.com,
 kyungmin.park@samsung.com, philippe.cornu@foss.st.com,
 alexander.deucher@amd.com, tiantao6@hisilicon.com, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 22, 2021 at 07:11:33PM +0300, Laurent Pinchart wrote:
> Hi Thomas,
> 
> Thank you for the patches.
> 
> On Tue, Jun 22, 2021 at 04:09:40PM +0200, Thomas Zimmermann wrote:
> > Remove references to struct drm_device.irq_enabled from modern
> > DRM drivers and core.
> > 
> > KMS drivers enable IRQs for their devices internally. They don't
> > have to keep track of the IRQ state via irq_enabled. For vblanking,
> > it's cleaner to test for vblanking support directly than to test
> > for enabled IRQs.
> > 
> > This used to be a single patch, [1] but it's now a full series.
> > 
> > The first 3 patches replace instances of irq_enabled that are not
> > required.
> > 
> > Patch 4 fixes vblank ioctls to actually test for vblank support
> > instead of IRQs.
> > 
> > THe rest of the patchset removes irq_enabled from all non-legacy
> > drivers. The only exception is omapdrm, which has an internal
> > dpendency on the field's value. For this drivers, the state gets
> > duplicated internally.
> > 
> > With the patchset applied, drivers can later switch over to plain
> > Linux IRQ interfaces and DRM's IRQ midlayer can be declared legacy.
> > 
> > v2:
> > 	* keep the original test for legacy drivers in
> > 	  drm_wait_vblank_ioctl() (Daniel)
> > 
> > [1] https://lore.kernel.org/dri-devel/20210608090301.4752-1-tzimmermann@suse.de/
> > 
> > Thomas Zimmermann (22):
> >   drm/amdgpu: Track IRQ state in local device state
> >   drm/hibmc: Call drm_irq_uninstall() unconditionally
> >   drm/radeon: Track IRQ state in local device state
> >   drm: Don't test for IRQ support in VBLANK ioctls
> >   drm/komeda: Don't set struct drm_device.irq_enabled
> >   drm/malidp: Don't set struct drm_device.irq_enabled
> >   drm/exynos: Don't set struct drm_device.irq_enabled
> >   drm/kirin: Don't set struct drm_device.irq_enabled
> >   drm/imx: Don't set struct drm_device.irq_enabled
> >   drm/mediatek: Don't set struct drm_device.irq_enabled
> >   drm/nouveau: Don't set struct drm_device.irq_enabled
> >   drm/omapdrm: Track IRQ state in local device state
> >   drm/rockchip: Don't set struct drm_device.irq_enabled
> >   drm/sti: Don't set struct drm_device.irq_enabled
> >   drm/stm: Don't set struct drm_device.irq_enabled
> >   drm/sun4i: Don't set struct drm_device.irq_enabled
> >   drm/tegra: Don't set struct drm_device.irq_enabled
> >   drm/tidss: Don't use struct drm_device.irq_enabled
> >   drm/vc4: Don't set struct drm_device.irq_enabled
> >   drm/vmwgfx: Don't set struct drm_device.irq_enabled
> >   drm/xlnx: Don't set struct drm_device.irq_enabled
> >   drm/zte: Don't set struct drm_device.irq_enabled
> 
> The list seems to be missing armada, rcar-du and vkms. It would also be
> nice to address i915 if possible.

In addition to this, for all the existing patches,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> >  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c         |  6 +++---
> >  drivers/gpu/drm/arm/display/komeda/komeda_kms.c |  4 ----
> >  drivers/gpu/drm/arm/malidp_drv.c                |  4 ----
> >  drivers/gpu/drm/drm_irq.c                       | 10 +++-------
> >  drivers/gpu/drm/drm_vblank.c                    | 13 +++++++++----
> >  drivers/gpu/drm/exynos/exynos_drm_drv.c         | 10 ----------
> >  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  3 +--
> >  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c |  2 --
> >  drivers/gpu/drm/imx/dcss/dcss-kms.c             |  3 ---
> >  drivers/gpu/drm/imx/imx-drm-core.c              | 11 -----------
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  6 ------
> >  drivers/gpu/drm/nouveau/nouveau_drm.c           |  3 ---
> >  drivers/gpu/drm/omapdrm/omap_drv.h              |  2 ++
> >  drivers/gpu/drm/omapdrm/omap_irq.c              |  6 +++---
> >  drivers/gpu/drm/radeon/radeon_fence.c           |  2 +-
> >  drivers/gpu/drm/radeon/radeon_irq_kms.c         | 16 ++++++++--------
> >  drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  6 ------
> >  drivers/gpu/drm/sti/sti_compositor.c            |  2 --
> >  drivers/gpu/drm/stm/ltdc.c                      |  3 ---
> >  drivers/gpu/drm/sun4i/sun4i_drv.c               |  2 --
> >  drivers/gpu/drm/tegra/drm.c                     |  7 -------
> >  drivers/gpu/drm/tidss/tidss_irq.c               |  3 ---
> >  drivers/gpu/drm/vc4/vc4_kms.c                   |  1 -
> >  drivers/gpu/drm/vmwgfx/vmwgfx_irq.c             |  8 --------
> >  drivers/gpu/drm/xlnx/zynqmp_dpsub.c             |  2 --
> >  drivers/gpu/drm/zte/zx_drm_drv.c                |  6 ------
> >  26 files changed, 30 insertions(+), 111 deletions(-)
> > 
> > 
> > base-commit: 8c1323b422f8473421682ba783b5949ddd89a3f4
> > prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> > prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24

-- 
Regards,

Laurent Pinchart
