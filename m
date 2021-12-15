Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4051347668E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 00:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C7F10FB7A;
	Wed, 15 Dec 2021 23:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567D410FB78
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 23:35:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0709A3F6;
 Thu, 16 Dec 2021 00:35:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1639611307;
 bh=H51T6htQp2rWqAcUTAUazaCoHWQo+Tt50O7rqnloqnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r5OJn3x/nKWYmgh6sBxtmDAdiuDQUm9bxrhRMDSqj664EYEe73U4wGPRMNXxE1QKd
 DM6zrLQckv+sFcubsHRJ+1C8wE6dRNhhArwJWT/PU7C5F/TQOXxkqZqGpwzXJSezrH
 xA6ufouLRoaQ9brl8HJqV3M0ej2nO4G1tO1WSJ3w=
Date: Thu, 16 Dec 2021 01:35:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 00/60] drm: Make all drivers to honour the nomodeset
 parameter
Message-ID: <Ybp7qDs1p3x5GzNJ@pendragon.ideasonboard.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Edmund Dea <edmund.j.dea@intel.com>,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Marek Vasut <marex@denx.de>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Deepak Rawat <drawat.floss@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, Joel Stanley <joel@jms.id.au>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Qiang Yu <yuq825@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Lechner <david@lechnology.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Alison Wang <alison.wang@nxp.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>, Tian Tao <tiantao6@hisilicon.com>,
 Jyri Sarha <jyri.sarha@iki.fi>, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

Thank you for the patches.

On Wed, Dec 15, 2021 at 01:59:08AM +0100, Javier Martinez Canillas wrote:
> The nomodeset kernel command line parameter is used to prevent the KMS/DRM
> drivers to be registered/probed. But only a few drivers implement support
> for this parameter and most DRM drivers would just ignore it.
>
> This (huge) patch series makes all DRM drivers to honour this parameter. It
> is posted as separate patches to make easier for drivers maintainers to ack
> or pick them independently at their own pace.
> 
> Patches are quite trivial and just add an if (drm_firmware_drivers_only())
> check and return -ENODEV if that's true. The condition is checked as early
> as possible, that is in the module_init handler for drivers that have one
> or in the probe function for drivers that are using the module_*_driver()
> macros and don't have their own module init function.
> 
> I included all the DRM drivers that think makes sense. I only left the vc4
> and v3d drivers, that Maxime is already handling in another patch series
> and the vgem, vkms and simpledrm drivers that should ignore the param IMO.
> 
> I've built tested with 'make allmodconfig && make M=drivers/gpu/drm/', but
> only booted in a few devices with and without nomodeset in the cmdline. So
> testing and reviewing for all the drivers would be highly appreciated.

The fact that the series is so big makes me think it would be better to
handle this in the DRM core. Is there any way we could do so ? Otherwise
we'll chase this issue forever in new drivers, and will be plagued with
cargo cult problems.

> Javier Martinez Canillas (60):
>   drm/komeda: Add support for the nomodeset kernel parameter
>   drm/arm/hdlcd: Add support for the nomodeset kernel parameter
>   drm/malidp: Add support for the nomodeset kernel parameter
>   drm/armada: Add support for the nomodeset kernel parameter
>   drm/aspeed: Add support for the nomodeset kernel parameter
>   drm/atmel-hlcdc: Add support for the nomodeset kernel parameter
>   drm/etnaviv: Add support for the nomodeset kernel parameter
>   drm/exynos: Add support for the nomodeset kernel parameter
>   drm/fsl-dcu: Add support for the nomodeset kernel parameter
>   drm/gma500: Add support for the nomodeset kernel parameter
>   drm/gud: Add support for the nomodeset kernel parameter
>   drm/hisilicon/hibmc: Add support for the nomodeset kernel parameter
>   drm/hisilicon/kirin: Add support for the nomodeset kernel parameter
>   drm/hyperv: Add support for the nomodeset kernel parameter
>   drm/i810: Add support for the nomodeset kernel parameter
>   drm/imx/dcss: Add support for the nomodeset kernel parameter
>   drm/imx: Add support for the nomodeset kernel parameter
>   drm/ingenic: Add support for the nomodeset kernel parameter
>   drm/kmb: Add support for the nomodeset kernel parameter
>   drm/lima: Add support for the nomodeset kernel parameter
>   drm/mcde: Add support for the nomodeset kernel parameter
>   drm/mediatek: Add support for the nomodeset kernel parameter
>   drm/meson: Add support for the nomodeset kernel parameter
>   drm/mga: Add support for the nomodeset kernel parameter
>   drm/msm: Add support for the nomodeset kernel parameter
>   drm: mxsfb: Add support for the nomodeset kernel parameter
>   drm/omap: Add support for the nomodeset kernel parameter
>   drm/panel: ilitek-ili9341: Add support for the nomodeset kernel
>     parameter
>   drm/panfrost: Add support for the nomodeset kernel parameter
>   drm/pl111: Add support for the nomodeset kernel parameter
>   drm/r128: Add support for the nomodeset kernel parameter
>   drm: rcar-du: Add support for the nomodeset kernel parameter
>   drm/rockchip: Add support for the nomodeset kernel parameter
>   drm/savage: Add support for the nomodeset kernel parameter
>   drm/shmobile: Add support for the nomodeset kernel parameter
>   drm/sis: Add support for the nomodeset kernel parameter
>   drm/sprd: Add support for the nomodeset kernel parameter
>   drm/sti: Add support for the nomodeset kernel parameter
>   drm/stm: Add support for the nomodeset kernel parameter
>   drm/sun4i: Add support for the nomodeset kernel parameter
>   drm/tdfx: Add support for the nomodeset kernel parameter
>   drm/tegra: Add support for the nomodeset kernel parameter
>   drm/tidss: Add support for the nomodeset kernel parameter
>   drm/tilcdc: Add support for the nomodeset kernel parameter
>   drm/arc: Add support for the nomodeset kernel parameter
>   drm/gm12u320: Add support for the nomodeset kernel parameter
>   drm/hx8357d: Add support for the nomodeset kernel parameter
>   drm/ili9163: Add support for the nomodeset kernel parameter
>   drm/ili9225: Add support for the nomodeset kernel parameter
>   drm/ili9341: Add support for the nomodeset kernel parameter
>   drm/ili9486: Add support for the nomodeset kernel parameter
>   drm/mi0283qt: Add support for the nomodeset kernel parameter
>   drm/repaper: Add support for the nomodeset kernel parameter
>   drm/st7586: Add support for the nomodeset kernel parameter
>   drm/st7735r: Add support for the nomodeset kernel parameter
>   drm/tve200: Add support for the nomodeset kernel parameter
>   drm/udl: Add support for the nomodeset kernel parameter
>   drm/via: Add support for the nomodeset kernel parameter
>   drm/xen: Add support for the nomodeset kernel parameter
>   drm/xlnx: Add support for the nomodeset kernel parameter
> 
>  drivers/gpu/drm/arm/display/komeda/komeda_drv.c | 4 ++++
>  drivers/gpu/drm/arm/hdlcd_drv.c                 | 3 +++
>  drivers/gpu/drm/arm/malidp_drv.c                | 3 +++
>  drivers/gpu/drm/armada/armada_drv.c             | 3 +++
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         | 3 +++
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c    | 3 +++
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c           | 3 +++
>  drivers/gpu/drm/exynos/exynos_drm_drv.c         | 3 +++
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       | 3 +++
>  drivers/gpu/drm/gma500/psb_drv.c                | 3 +++
>  drivers/gpu/drm/gud/gud_drv.c                   | 3 +++
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 3 +++
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 3 +++
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 3 +++
>  drivers/gpu/drm/i810/i810_drv.c                 | 3 +++
>  drivers/gpu/drm/imx/dcss/dcss-drv.c             | 3 +++
>  drivers/gpu/drm/imx/imx-drm-core.c              | 3 +++
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c       | 3 +++
>  drivers/gpu/drm/kmb/kmb_drv.c                   | 3 +++
>  drivers/gpu/drm/lima/lima_drv.c                 | 3 +++
>  drivers/gpu/drm/mcde/mcde_drv.c                 | 3 +++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c          | 3 +++
>  drivers/gpu/drm/meson/meson_drv.c               | 3 +++
>  drivers/gpu/drm/mga/mga_drv.c                   | 3 +++
>  drivers/gpu/drm/msm/msm_drv.c                   | 3 +++
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c               | 3 +++
>  drivers/gpu/drm/omapdrm/omap_drv.c              | 3 +++
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c    | 3 +++
>  drivers/gpu/drm/panfrost/panfrost_drv.c         | 3 +++
>  drivers/gpu/drm/pl111/pl111_drv.c               | 3 +++
>  drivers/gpu/drm/r128/r128_drv.c                 | 3 +++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c           | 3 +++
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c     | 3 +++
>  drivers/gpu/drm/savage/savage_drv.c             | 3 +++
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c        | 3 +++
>  drivers/gpu/drm/sis/sis_drv.c                   | 3 +++
>  drivers/gpu/drm/sprd/sprd_drm.c                 | 3 +++
>  drivers/gpu/drm/sti/sti_drv.c                   | 3 +++
>  drivers/gpu/drm/stm/drv.c                       | 3 +++
>  drivers/gpu/drm/sun4i/sun4i_drv.c               | 3 +++
>  drivers/gpu/drm/tdfx/tdfx_drv.c                 | 3 +++
>  drivers/gpu/drm/tegra/drm.c                     | 3 +++
>  drivers/gpu/drm/tidss/tidss_drv.c               | 3 +++
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c             | 3 +++
>  drivers/gpu/drm/tiny/arcpgu.c                   | 3 +++
>  drivers/gpu/drm/tiny/gm12u320.c                 | 3 +++
>  drivers/gpu/drm/tiny/hx8357d.c                  | 3 +++
>  drivers/gpu/drm/tiny/ili9163.c                  | 3 +++
>  drivers/gpu/drm/tiny/ili9225.c                  | 3 +++
>  drivers/gpu/drm/tiny/ili9341.c                  | 3 +++
>  drivers/gpu/drm/tiny/ili9486.c                  | 3 +++
>  drivers/gpu/drm/tiny/mi0283qt.c                 | 3 +++
>  drivers/gpu/drm/tiny/repaper.c                  | 3 +++
>  drivers/gpu/drm/tiny/st7586.c                   | 3 +++
>  drivers/gpu/drm/tiny/st7735r.c                  | 3 +++
>  drivers/gpu/drm/tve200/tve200_drv.c             | 3 +++
>  drivers/gpu/drm/udl/udl_drv.c                   | 3 +++
>  drivers/gpu/drm/via/via_drv.c                   | 3 +++
>  drivers/gpu/drm/xen/xen_drm_front.c             | 3 +++
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c             | 3 +++
>  60 files changed, 181 insertions(+)

-- 
Regards,

Laurent Pinchart
