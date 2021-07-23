Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAAF3D3726
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 10:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCDC6EC06;
	Fri, 23 Jul 2021 08:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019886EC06
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 08:58:00 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ga41so2496974ejc.10
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 01:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Er7rrO3VXDV8MEeyCemkTCvZuHjD9GgJn0xYZR7oa/I=;
 b=QlHkGqnlYTa9/nzQ23TV+lGMxBPmSyU4dQKNZKNwkQwawRS2V3MXRvJUkMtl0Fp5hy
 yyymbC76w36nZfZvtDwKPSdHs/29P1/XdJea4iegOBS0x1SIJiLp5s4b3921oebg1uJl
 3Gmr0ljh7x7D+B7enzQahJaEOqXdNcZALuAkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Er7rrO3VXDV8MEeyCemkTCvZuHjD9GgJn0xYZR7oa/I=;
 b=q1DTIPO0e4HGxQIEd6fdk/Z3Bb6XCIuy6zR9GoQjDMKhx1oAW0FkVDE9JZjGIuBwt5
 boCyK+x1H82TbELTHkdVW7ThBPZIFIkPhVgUtOgxjixtiJfJwqiDS1m744YqtAhb+rvA
 LKHWaMEQer8qEAUSfZxzk6NbNsAlX6/zQHeX0+hA9PD3WoFTvi38bGBHGxDInb2mfDsQ
 W3A6oCP/8s3MSaw6XUdjk4N9xUOgN4AkfPE10+6UI5yz9r/pnw6xBJAw1d7tJiW10/la
 o3g9Y5lrrvHYlCJad9acHHiFVAkOmA0P9IsSJz2Y4eLWc0yzaPstTWeuP7ZntgcXMwUp
 Ljcw==
X-Gm-Message-State: AOAM530mQKxfuabJhNTBzviMwfNzU2GIvGm3qZOkB1vNX+oJEp7HV9ue
 q7NN7q/lNroDvQRG3DS9+BNzpA==
X-Google-Smtp-Source: ABdhPJyf2nHaj2Ip7utMdRqkd81wwBuwH5qgYOxKae8IfB1AWPREsQqiH3tPVtRuuN+/5IMZOhe/qA==
X-Received: by 2002:a17:906:6dcb:: with SMTP id
 j11mr3658768ejt.202.1627030679439; 
 Fri, 23 Jul 2021 01:57:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id jo19sm10386766ejb.59.2021.07.23.01.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 01:57:58 -0700 (PDT)
Date: Fri, 23 Jul 2021 10:57:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: lichenyang <lichenyang@loongson.cn>
Subject: Re: [PATCH v3 1/3] drm/loongson: Add DRM Driver for Loongson 7A1000
 bridge chip
Message-ID: <YPqElHRxMSvrzzqs@phenom.ffwll.local>
References: <20210723031251.200686-1-lichenyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723031251.200686-1-lichenyang@loongson.cn>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Huacai Chen <chenhuacai@kernel.org>, dri-devel@lists.freedesktop.org,
 devel@linuxdriverproject.org, Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 11:12:49AM +0800, lichenyang wrote:
> From: Chenyang Li <lichenyang@loongson.cn>
> 
> This patch adds an initial DRM driver for the Loongson LS7A1000
> bridge chip(LS7A). The LS7A bridge chip contains two display
> controllers, support dual display output. The maximum support for
> each channel display is to 1920x1080@60Hz.
> At present, DC device detection and DRM driver registration are
> completed, the crtc/plane/encoder/connector objects has been
> implemented.
> On Loongson 3A4000 CPU and 7A1000 system, we have achieved the use
> of dual screen, and support dual screen clone mode and expansion
> mode.
> 
> v9:
> - Optimize the error handling process.
> - Remove the useless flags parameter.
> - Fix some incorrect use of variables and constructs.
> 
> v8:
> - Update the atomic_update function interface.
> 
> v7:
> - The pixel clock is limited to less than 173000.
> 
> v6:
> - Remove spin_lock in mmio reg read and write.
> - TO_UNCAC is replac with ioremap.
> - Fix error arguments in crtc_atomic_enable/disable/mode_valid.
> 
> v5:
> - Change the name of the chip to LS7A.
> - Change magic value in crtc to macros.
> - Correct mistakes words.
> - Change the register operation function prefix to ls7a.
> 
> v4:
> - Move the mode_valid function to the crtc.
> 
> v3:
> - Move the mode_valid function to the connector and optimize it.
> - Fix num_crtc calculation method.
> 
> v2:
> - Complete the case of 32-bit color in CRTC.
> 
> Signed-off-by: Chenyang Li <lichenyang@loongson.cn>

Somehow this simple driver is at v9 and still not landed. Do you have
someone from the drm maintainers/committers who's guiding you through all
this? I'm not seeing you Cc: a specific person, without that there's good
chances your contribution gets lost. I'm swamped myself, which is why I've
ignored this and hope you'd fine someone else and stick to them.

A few comments below.
> ---
>  drivers/gpu/drm/Kconfig                       |   2 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  drivers/gpu/drm/loongson/Kconfig              |  14 +
>  drivers/gpu/drm/loongson/Makefile             |  14 +
>  drivers/gpu/drm/loongson/loongson_connector.c |  46 +++
>  drivers/gpu/drm/loongson/loongson_crtc.c      | 249 ++++++++++++++++
>  drivers/gpu/drm/loongson/loongson_device.c    |  35 +++
>  drivers/gpu/drm/loongson/loongson_drv.c       | 278 ++++++++++++++++++
>  drivers/gpu/drm/loongson/loongson_drv.h       | 140 +++++++++
>  drivers/gpu/drm/loongson/loongson_encoder.c   |  37 +++
>  drivers/gpu/drm/loongson/loongson_plane.c     |  97 ++++++
>  11 files changed, 913 insertions(+)
>  create mode 100644 drivers/gpu/drm/loongson/Kconfig
>  create mode 100644 drivers/gpu/drm/loongson/Makefile
>  create mode 100644 drivers/gpu/drm/loongson/loongson_connector.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_crtc.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_device.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_drv.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_drv.h
>  create mode 100644 drivers/gpu/drm/loongson/loongson_encoder.c
>  create mode 100644 drivers/gpu/drm/loongson/loongson_plane.c
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 7ff89690a976..08562d9be6e3 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -365,6 +365,8 @@ source "drivers/gpu/drm/xen/Kconfig"
>  
>  source "drivers/gpu/drm/vboxvideo/Kconfig"
>  
> +source "drivers/gpu/drm/loongson/Kconfig"
> +
>  source "drivers/gpu/drm/lima/Kconfig"
>  
>  source "drivers/gpu/drm/panfrost/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index a118692a6df7..29c05b8cf2ad 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -119,6 +119,7 @@ obj-$(CONFIG_DRM_PL111) += pl111/
>  obj-$(CONFIG_DRM_TVE200) += tve200/
>  obj-$(CONFIG_DRM_XEN) += xen/
>  obj-$(CONFIG_DRM_VBOXVIDEO) += vboxvideo/
> +obj-$(CONFIG_DRM_LOONGSON) += loongson/
>  obj-$(CONFIG_DRM_LIMA)  += lima/
>  obj-$(CONFIG_DRM_PANFROST) += panfrost/
>  obj-$(CONFIG_DRM_ASPEED_GFX) += aspeed/
> diff --git a/drivers/gpu/drm/loongson/Kconfig b/drivers/gpu/drm/loongson/Kconfig
> new file mode 100644
> index 000000000000..3cf42a4cca08
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config DRM_LOONGSON
> +	tristate "DRM support for LS7A bridge chipset"
> +	depends on DRM && PCI
> +	depends on CPU_LOONGSON64
> +	select DRM_KMS_HELPER
> +	select DRM_VRAM_HELPER
> +	select DRM_TTM
> +	select DRM_TTM_HELPER
> +	default n
> +	help
> +	  Support the display controllers found on the Loongson LS7A
> +	  bridge.
> diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
> new file mode 100644
> index 000000000000..22d063953b78
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/Makefile
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Makefile for loongson drm drivers.
> +# This driver provides support for the
> +# Direct Rendering Infrastructure (DRI)
> +
> +ccflags-y := -Iinclude/drm
> +loongson-y := loongson_drv.o \
> +	loongson_crtc.o \
> +	loongson_plane.o \
> +	loongson_device.o \
> +	loongson_connector.o \
> +	loongson_encoder.o
> +obj-$(CONFIG_DRM_LOONGSON) += loongson.o
> diff --git a/drivers/gpu/drm/loongson/loongson_connector.c b/drivers/gpu/drm/loongson/loongson_connector.c
> new file mode 100644
> index 000000000000..a571f9ef4266
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_connector.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +
> +static int loongson_get_modes(struct drm_connector *connector)
> +{
> +	int count;
> +
> +	count = drm_add_modes_noedid(connector, 1920, 1080);
> +	drm_set_preferred_mode(connector, 1024, 768);
> +
> +	return count;
> +}
> +
> +static const struct drm_connector_helper_funcs loongson_connector_helper = {
> +	.get_modes = loongson_get_modes,
> +};
> +
> +static const struct drm_connector_funcs loongson_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +int loongson_connector_init(struct loongson_device *ldev, int index)
> +{
> +	struct drm_connector *connector;
> +	struct loongson_connector *lconnector;
> +
> +	lconnector = kzalloc(sizeof(struct loongson_connector), GFP_KERNEL);
> +	if (!lconnector)
> +		return -ENOMEM;
> +
> +	lconnector->ldev = ldev;
> +	lconnector->id = index;
> +
> +	ldev->mode_info[index].connector = lconnector;
> +	connector = &lconnector->base;
> +	drm_connector_init(ldev->dev, connector, &loongson_connector_funcs,

Hm we don't have a drmm_connector_alloc helper like for the others, would
be really nice to fix this.

> +			   DRM_MODE_CONNECTOR_Unknown);
> +	drm_connector_helper_add(connector, &loongson_connector_helper);
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/loongson_crtc.c b/drivers/gpu/drm/loongson/loongson_crtc.c
> new file mode 100644
> index 000000000000..163e24d85b02
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_crtc.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +
> +static void try_each_loopc(u32 clk, u32 pstdiv, u32 frefc,
> +			   struct pix_pll *pll_config)
> +{
> +	u32 loopc;
> +	u32 clk_out;
> +	u32 precision;
> +	u32 min = 1000;
> +	u32 base_clk = 100000L;
> +
> +	for (loopc = LOOPC_MIN; loopc < LOOPC_MAX; loopc++) {
> +		if ((loopc < FRE_REF_MIN * frefc) ||
> +		    (loopc > FRE_REF_MAX * frefc))
> +			continue;
> +
> +		clk_out = base_clk * loopc / frefc;
> +		precision = (clk > clk_out) ? (clk - clk_out) : (clk_out - clk);
> +		if (precision < min) {
> +			pll_config->l2_div = pstdiv;
> +			pll_config->l1_loopc = loopc;
> +			pll_config->l1_frefc = frefc;
> +		}
> +	}
> +}
> +
> +static void cal_freq(u32 pixclock, struct pix_pll *pll_config)
> +{
> +	u32 pstdiv;
> +	u32 frefc;
> +	u32 clk;
> +
> +	for (pstdiv = 1; pstdiv < PST_DIV_MAX; pstdiv++) {
> +		clk = pixclock * pstdiv;
> +		for (frefc = DIV_REF_MIN; frefc <= DIV_REF_MAX; frefc++)
> +			try_each_loopc(clk, pstdiv, frefc, pll_config);
> +	}
> +}
> +
> +static void config_pll(struct loongson_device *ldev, unsigned long pll_base,
> +		       struct pix_pll *pll_cfg)
> +{
> +	u32 val;
> +	u32 count = 0;
> +
> +	/* clear sel_pll_out0 */
> +	val = ls7a_io_rreg(ldev, pll_base + 0x4);
> +	val &= ~(1UL << 8);
> +	ls7a_io_wreg(ldev, pll_base + 0x4, val);
> +
> +	/* set pll_pd */
> +	val = ls7a_io_rreg(ldev, pll_base + 0x4);
> +	val |= (1UL << 13);
> +	ls7a_io_wreg(ldev, pll_base + 0x4, val);
> +
> +	/* clear set_pll_param */
> +	val = ls7a_io_rreg(ldev, pll_base + 0x4);
> +	val &= ~(1UL << 11);
> +	ls7a_io_wreg(ldev, pll_base + 0x4, val);
> +
> +	/* clear old value & config new value */
> +	val = ls7a_io_rreg(ldev, pll_base + 0x4);
> +	val &= ~(0x7fUL << 0);
> +	val |= (pll_cfg->l1_frefc << 0); /* refc */
> +	ls7a_io_wreg(ldev, pll_base + 0x4, val);
> +	val = ls7a_io_rreg(ldev, pll_base + 0x0);
> +	val &= ~(0x7fUL << 0);
> +	val |= (pll_cfg->l2_div << 0); /* div */
> +	val &= ~(0x1ffUL << 21);
> +	val |= (pll_cfg->l1_loopc << 21); /* loopc */
> +	ls7a_io_wreg(ldev, pll_base + 0x0, val);
> +
> +	/* set set_pll_param */
> +	val = ls7a_io_rreg(ldev, pll_base + 0x4);
> +	val |= (1UL << 11);
> +	ls7a_io_wreg(ldev, pll_base + 0x4, val);
> +	/* clear pll_pd */
> +	val = ls7a_io_rreg(ldev, pll_base + 0x4);
> +	val &= ~(1UL << 13);
> +	ls7a_io_wreg(ldev, pll_base + 0x4, val);
> +
> +	while (!(ls7a_io_rreg(ldev, pll_base + 0x4) & 0x80)) {
> +		cpu_relax();
> +		count++;
> +		if (count >= 1000) {
> +			DRM_ERROR("loongson-7A PLL lock failed\n");
> +			break;
> +		}
> +	}
> +
> +	val = ls7a_io_rreg(ldev, pll_base + 0x4);
> +	val |= (1UL << 8);
> +	ls7a_io_wreg(ldev, pll_base + 0x4, val);
> +}
> +
> +static void loongson_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct loongson_device *ldev = dev->dev_private;
> +	struct loongson_crtc *lcrtc = to_loongson_crtc(crtc);
> +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> +	const struct drm_format_info *format;
> +	struct pix_pll pll_cfg;
> +	u32 hr, hss, hse, hfl;
> +	u32 vr, vss, vse, vfl;
> +	u32 pix_freq;
> +	u32 reg_offset;
> +
> +	hr = mode->hdisplay;
> +	hss = mode->hsync_start;
> +	hse = mode->hsync_end;
> +	hfl = mode->htotal;
> +
> +	vr = mode->vdisplay;
> +	vss = mode->vsync_start;
> +	vse = mode->vsync_end;
> +	vfl = mode->vtotal;
> +
> +	pix_freq = mode->clock;
> +	reg_offset = lcrtc->reg_offset;
> +	format = crtc->primary->state->fb->format;
> +
> +	ls7a_mm_wreg(ldev, FB_DITCFG_REG + reg_offset, 0);
> +	ls7a_mm_wreg(ldev, FB_DITTAB_LO_REG + reg_offset, 0);
> +	ls7a_mm_wreg(ldev, FB_DITTAB_HI_REG + reg_offset, 0);
> +	ls7a_mm_wreg(ldev, FB_PANCFG_REG + reg_offset, FB_PANCFG_DEF);
> +	ls7a_mm_wreg(ldev, FB_PANTIM_REG + reg_offset, 0);
> +
> +	ls7a_mm_wreg(ldev, FB_HDISPLAY_REG + reg_offset, (hfl << 16) | hr);
> +	ls7a_mm_wreg(ldev, FB_HSYNC_REG + reg_offset,
> +		     FB_HSYNC_PULSE | (hse << 16) | hss);
> +
> +	ls7a_mm_wreg(ldev, FB_VDISPLAY_REG + reg_offset, (vfl << 16) | vr);
> +	ls7a_mm_wreg(ldev, FB_VSYNC_REG + reg_offset,
> +		     FB_VSYNC_PULSE | (vse << 16) | vss);
> +
> +	switch (format->format) {
> +	case DRM_FORMAT_RGB565:
> +		lcrtc->cfg_reg |= 0x3;
> +		break;
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_XRGB8888:
> +	case DRM_FORMAT_ARGB8888:
> +	default:
> +		lcrtc->cfg_reg |= 0x4;
> +		break;
> +	}
> +	ls7a_mm_wreg(ldev, FB_CFG_REG + reg_offset, lcrtc->cfg_reg);
> +
> +	cal_freq(pix_freq, &pll_cfg);
> +	config_pll(ldev, LS7A_PIX_PLL + reg_offset, &pll_cfg);
> +}
> +
> +static void loongson_crtc_atomic_enable(struct drm_crtc *crtc,
> +					struct drm_atomic_state *old_state)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct loongson_device *ldev = dev->dev_private;
> +	struct loongson_crtc *lcrtc = to_loongson_crtc(crtc);
> +	u32 reg_offset = lcrtc->reg_offset;
> +
> +	lcrtc->cfg_reg |= CFG_ENABLE;
> +	ls7a_mm_wreg(ldev, FB_CFG_REG + reg_offset, lcrtc->cfg_reg);
> +}
> +
> +static void loongson_crtc_atomic_disable(struct drm_crtc *crtc,
> +					 struct drm_atomic_state *old_state)
> +{
> +	struct drm_device *dev = crtc->dev;
> +	struct loongson_device *ldev = dev->dev_private;
> +	struct loongson_crtc *lcrtc = to_loongson_crtc(crtc);
> +	u32 reg_offset = lcrtc->reg_offset;
> +
> +	lcrtc->cfg_reg &= ~CFG_ENABLE;
> +	ls7a_mm_wreg(ldev, FB_CFG_REG + reg_offset, lcrtc->cfg_reg);
> +}
> +
> +static enum drm_mode_status loongson_mode_valid(struct drm_crtc *crtc,
> +						const struct drm_display_mode *mode)
> +{
> +	if (mode->hdisplay > 1920)
> +		return MODE_BAD;
> +	if (mode->vdisplay > 1080)
> +		return MODE_BAD;
> +	if (mode->hdisplay % 64)
> +		return MODE_BAD;
> +	if (mode->clock >= 173000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_crtc_helper_funcs loongson_crtc_helper_funcs = {
> +	.mode_valid = loongson_mode_valid,
> +	.atomic_enable = loongson_crtc_atomic_enable,
> +	.atomic_disable = loongson_crtc_atomic_disable,
> +	.mode_set_nofb = loongson_crtc_mode_set_nofb,
> +};
> +
> +static const struct drm_crtc_funcs loongson_crtc_funcs = {
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +int loongson_crtc_init(struct loongson_device *ldev, int index)
> +{
> +	struct loongson_crtc *lcrtc;
> +	int ret;
> +
> +	lcrtc = kzalloc(sizeof(struct loongson_crtc), GFP_KERNEL);
> +	if (!lcrtc)
> +		return -ENOMEM;
> +
> +	lcrtc->ldev = ldev;
> +	lcrtc->reg_offset = index * REG_OFFSET;
> +	lcrtc->cfg_reg = CFG_RESET;
> +	lcrtc->crtc_id = index;
> +
> +	ret = loongson_plane_init(lcrtc);
> +	if (ret)
> +		goto free_lcrtc;
> +
> +	ret = drm_crtc_init_with_planes(ldev->dev, &lcrtc->base, &lcrtc->plane,
> +					NULL, &loongson_crtc_funcs, NULL);

Please use the drmm_crtc version here and don't kzalloc yourself. That
simplifies the cleanup (since atm you're just leaking this memory).

Also loongson hw looks a like like something which should use the simple
kms helpers since you're embedding the single plane into your crtc struct:

https://dri.freedesktop.org/docs/drm/gpu/drm-kms-helpers.html#simple-kms-helper-reference

Also at that point your driver is probabyl small enough that single source
file is the right thing, and you should move it into drivers/gpu/drm/tiny.
It would be the first simple/tiny drm driver with 2 outputs.

Rule of thumb we have is that if it's below 1kloc, a single file and
putting it into drm/tiny is best.

Cheers, Daniel

> +	if (ret) {
> +		DRM_ERROR("failed to init crtc %d\n", index);
> +		goto cleanup_plane;
> +	}
> +
> +	drm_crtc_helper_add(&lcrtc->base, &loongson_crtc_helper_funcs);
> +
> +	ldev->mode_info[index].crtc = lcrtc;
> +
> +	return 0;
> +
> +cleanup_plane:
> +	drm_plane_cleanup(&lcrtc->plane);
> +free_lcrtc:
> +	kfree(lcrtc);
> +
> +	return ret;
> +}
> +
> diff --git a/drivers/gpu/drm/loongson/loongson_device.c b/drivers/gpu/drm/loongson/loongson_device.c
> new file mode 100644
> index 000000000000..a79d64fc1a06
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_device.c
> @@ -0,0 +1,35 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +
> +u32 loongson_gpu_offset(struct drm_plane_state *state,
> +			struct loongson_device *ldev)
> +{
> +	struct drm_gem_vram_object *gbo;
> +	u32 gpu_addr;
> +
> +	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
> +	gpu_addr = ldev->vram_start + drm_gem_vram_offset(gbo);
> +
> +	return gpu_addr;
> +}
> +
> +u32 ls7a_io_rreg(struct loongson_device *ldev, u32 offset)
> +{
> +	return readl(ldev->io + offset);
> +}
> +
> +void ls7a_io_wreg(struct loongson_device *ldev, u32 offset, u32 val)
> +{
> +	writel(val, ldev->io + offset);
> +}
> +
> +u32 ls7a_mm_rreg(struct loongson_device *ldev, u32 offset)
> +{
> +	return readl(ldev->mmio + offset);
> +}
> +
> +void ls7a_mm_wreg(struct loongson_device *ldev, u32 offset, u32 val)
> +{
> +	writel(val, ldev->mmio + offset);
> +}
> diff --git a/drivers/gpu/drm/loongson/loongson_drv.c b/drivers/gpu/drm/loongson/loongson_drv.c
> new file mode 100644
> index 000000000000..c84494f7aabb
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_drv.c
> @@ -0,0 +1,278 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Loongson LS7A1000 bridge chipset drm driver
> + */
> +
> +#include <linux/console.h>
> +#include <linux/pci.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include "loongson_drv.h"
> +
> +/* Interface history:
> + * 0.1 - original.
> + */
> +#define DRIVER_MAJOR 0
> +#define DRIVER_MINOR 1
> +
> +static const struct drm_mode_config_funcs loongson_mode_funcs = {
> +	.fb_create = drm_gem_fb_create,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +	.output_poll_changed = drm_fb_helper_output_poll_changed,
> +	.mode_valid = drm_vram_helper_mode_valid
> +};
> +
> +static int loongson_device_init(struct drm_device *dev)
> +{
> +	struct loongson_device *ldev = dev->dev_private;
> +	struct pci_dev *pdev = to_pci_dev(dev->dev);
> +	struct pci_dev *gpu_pdev;
> +	resource_size_t aper_base;
> +	resource_size_t aper_size;
> +	resource_size_t mmio_base;
> +	resource_size_t mmio_size;
> +	int ret;
> +
> +	/* GPU MEM */
> +	/* We need get 7A-gpu pci device information for ldev->gpu_pdev */
> +	/* dev->pdev save 7A-dc pci device information */
> +	gpu_pdev = pci_get_device(PCI_VENDOR_ID_LOONGSON,
> +				  PCI_DEVICE_ID_LOONGSON_GPU, NULL);
> +	ldev->gpu_pdev = gpu_pdev;
> +	ret = pci_enable_device(ldev->gpu_pdev);
> +	if (ret)
> +		return ret;
> +	pci_set_drvdata(ldev->gpu_pdev, dev);
> +
> +	aper_base = pci_resource_start(gpu_pdev, 2);
> +	aper_size = pci_resource_len(gpu_pdev, 2);
> +	ldev->vram_start = aper_base;
> +	ldev->vram_size = aper_size;
> +
> +	if (!devm_request_mem_region(ldev->dev->dev, ldev->vram_start,
> +				     ldev->vram_size, "loongson_vram")) {
> +		DRM_ERROR("Can't reserve VRAM\n");
> +		return -ENXIO;
> +	}
> +
> +	/* DC MEM */
> +	mmio_base = pci_resource_start(pdev, 0);
> +	mmio_size = pci_resource_len(pdev, 0);
> +	ldev->mmio = devm_ioremap(dev->dev, mmio_base, mmio_size);
> +	if (!ldev->mmio) {
> +		drm_err(dev, "Cannot map mmio region\n");
> +		return -ENOMEM;
> +	}
> +
> +	if (!devm_request_mem_region(ldev->dev->dev, mmio_base,
> +				     mmio_size, "loongson_mmio")) {
> +		DRM_ERROR("Can't reserve mmio registers\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* DC IO */
> +	ldev->io = devm_ioremap(dev->dev, LS7A_CHIPCFG_REG_BASE, 0xf);
> +	if (!ldev->io)
> +		return -ENOMEM;
> +
> +	DRM_INFO("DC mmio base 0x%llx size 0x%llx io 0x%llx\n",
> +		 mmio_base, mmio_size, *(u64 *)ldev->io);
> +	DRM_INFO("GPU vram start = 0x%x size = 0x%x\n",
> +		 ldev->vram_start, ldev->vram_size);
> +
> +	return 0;
> +}
> +
> +int loongson_modeset_init(struct loongson_device *ldev)
> +{
> +	struct drm_encoder *encoder;
> +	struct drm_connector *connector;
> +	int i;
> +	int ret;
> +
> +	ldev->dev->mode_config.allow_fb_modifiers = true;
> +
> +	for (i = 0; i < 2; i++) {
> +		ret = loongson_crtc_init(ldev, i);
> +		if (ret) {
> +			DRM_WARN("loongson crtc%d init failed\n", i);
> +			continue;
> +		}
> +
> +		ret = loongson_encoder_init(ldev, i);
> +		if (ret) {
> +			DRM_ERROR("loongson_encoder_init failed\n");
> +			return ret;
> +		}
> +
> +		ret = loongson_connector_init(ldev, i);
> +		if (ret) {
> +			DRM_ERROR("loongson_connector_init failed\n");
> +			return ret;
> +		}
> +
> +		encoder = &ldev->mode_info[i].encoder->base;
> +		connector = &ldev->mode_info[i].connector->base;
> +		drm_connector_attach_encoder(connector, encoder);
> +		ldev->num_crtc++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int loongson_drm_load(struct drm_device *dev)
> +{
> +	struct loongson_device *ldev;
> +	int ret;
> +
> +	ldev = devm_kzalloc(dev->dev, sizeof(*ldev), GFP_KERNEL);

Please don't use devm_kzalloc here, but instead embedde the struct
drm_device into your struct looongson_device.
-Daniel

> +	if (!ldev)
> +		return -ENOMEM;
> +
> +	dev->dev_private = ldev;
> +	ldev->dev = dev;
> +
> +	ret = loongson_device_init(dev);
> +	if (ret)
> +		goto err;
> +
> +	ret = drmm_vram_helper_init(dev, ldev->vram_start, ldev->vram_size);
> +	if (ret) {
> +		drm_err(dev, "Error initializing vram %d\n", ret);
> +		goto err;
> +	}
> +
> +	drm_mode_config_init(dev);
> +	dev->mode_config.funcs = (void *)&loongson_mode_funcs;
> +	dev->mode_config.min_width = 1;
> +	dev->mode_config.min_height = 1;
> +	dev->mode_config.max_width = 4096;
> +	dev->mode_config.max_height = 4096;
> +	dev->mode_config.preferred_depth = 32;
> +	dev->mode_config.prefer_shadow = 1;
> +	dev->mode_config.fb_base = ldev->vram_start;
> +
> +	ret = loongson_modeset_init(ldev);
> +	if (ret) {
> +		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
> +		goto err;
> +	}
> +
> +	drm_kms_helper_poll_init(dev);
> +	drm_mode_config_reset(dev);
> +
> +	return 0;
> +
> +err:
> +	kfree(ldev);
> +	drm_err(dev, "failed to initialize drm driver: %d\n", ret);
> +	return ret;
> +}
> +
> +static void loongson_drm_unload(struct drm_device *dev)
> +{
> +	drm_vram_helper_release_mm(dev);
> +	drm_mode_config_cleanup(dev);
> +	dev->dev_private = NULL;
> +	dev_set_drvdata(dev->dev, NULL);
> +}
> +
> +DEFINE_DRM_GEM_FOPS(fops);
> +
> +static struct drm_driver loongson_drm_driver = {
> +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +	.fops = &fops,
> +	DRM_GEM_VRAM_DRIVER,
> +
> +	.name = DRIVER_NAME,
> +	.desc = DRIVER_DESC,
> +	.date = DRIVER_DATE,
> +	.major = DRIVER_MAJOR,
> +	.minor = DRIVER_MINOR,
> +};
> +
> +static int loongson_pci_probe(struct pci_dev *pdev,
> +			      const struct pci_device_id *ent)
> +{
> +	int ret;
> +	struct drm_device *dev;
> +
> +	DRM_INFO("Start loongson drm probe\n");
> +	dev = drm_dev_alloc(&loongson_drm_driver, &pdev->dev);
> +	if (IS_ERR(dev)) {
> +		DRM_ERROR("failed to allocate drm_device\n");
> +		return PTR_ERR(dev);
> +	}
> +
> +	pci_set_drvdata(pdev, dev);
> +
> +	ret = pci_enable_device(pdev);
> +	if (ret) {
> +		drm_err(dev, "failed to enable pci device: %d\n", ret);
> +		goto err_free;
> +	}
> +
> +	ret = loongson_drm_load(dev);
> +	if (ret) {
> +		drm_err(dev, "failed to load loongson: %d\n", ret);
> +		goto err_pdev;
> +	}
> +
> +	ret = drm_dev_register(dev, 0);
> +	if (ret) {
> +		drm_err(dev, "failed to register drv for userspace access: %d\n",
> +			ret);
> +		goto loongson_drm_unload;
> +	}
> +
> +	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
> +
> +	return 0;
> +
> +loongson_drm_unload:
> +	loongson_drm_unload(dev);
> +err_pdev:
> +	pci_disable_device(pdev);
> +err_free:
> +	drm_dev_put(dev);
> +	return ret;
> +}
> +
> +static void loongson_pci_remove(struct pci_dev *pdev)
> +{
> +	struct drm_device *dev = pci_get_drvdata(pdev);
> +
> +	drm_dev_unregister(dev);
> +	loongson_drm_unload(dev);
> +	drm_dev_put(dev);
> +}
> +
> +static struct pci_device_id loongson_pci_devices[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, PCI_DEVICE_ID_LOONGSON_DC) },
> +	{0,}
> +};
> +
> +static struct pci_driver loongson_drm_pci_driver = {
> +	.name = DRIVER_NAME,
> +	.id_table = loongson_pci_devices,
> +	.probe = loongson_pci_probe,
> +	.remove = loongson_pci_remove,
> +};
> +
> +static int __init loongson_drm_init(void)
> +{
> +	return pci_register_driver(&loongson_drm_pci_driver);
> +}
> +
> +static void __exit loongson_drm_exit(void)
> +{
> +	pci_unregister_driver(&loongson_drm_pci_driver);
> +}
> +
> +module_init(loongson_drm_init);
> +module_exit(loongson_drm_exit);
> +
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/loongson/loongson_drv.h b/drivers/gpu/drm/loongson/loongson_drv.h
> new file mode 100644
> index 000000000000..e4ebb9026afd
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_drv.h
> @@ -0,0 +1,140 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __LOONGSON_DRV_H__
> +#define __LOONGSON_DRV_H__
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_encoder.h>
> +
> +/* General customization:
> + */
> +#define DRIVER_AUTHOR "Loongson graphics driver team"
> +#define DRIVER_NAME "loongson-drm"
> +#define DRIVER_DESC "Loongson LS7A DRM driver"
> +#define DRIVER_DATE "20200915"
> +
> +#define to_loongson_crtc(x) container_of(x, struct loongson_crtc, base)
> +#define to_loongson_encoder(x) container_of(x, struct loongson_encoder, base)
> +
> +#define LS7A_CHIPCFG_REG_BASE (0x10010000)
> +#define PCI_DEVICE_ID_LOONGSON_DC 0x7a06
> +#define PCI_DEVICE_ID_LOONGSON_GPU 0x7a15
> +#define LS7A_PIX_PLL (0x04b0)
> +#define REG_OFFSET (0x10)
> +#define FB_CFG_REG (0x1240)
> +#define FB_ADDR0_REG (0x1260)
> +#define FB_ADDR1_REG (0x1580)
> +#define FB_STRI_REG (0x1280)
> +#define FB_DITCFG_REG (0x1360)
> +#define FB_DITTAB_LO_REG (0x1380)
> +#define FB_DITTAB_HI_REG (0x13a0)
> +#define FB_PANCFG_REG (0x13c0)
> +#define FB_PANTIM_REG (0x13e0)
> +#define FB_HDISPLAY_REG (0x1400)
> +#define FB_HSYNC_REG (0x1420)
> +#define FB_VDISPLAY_REG (0x1480)
> +#define FB_VSYNC_REG (0x14a0)
> +
> +#define CFG_FMT GENMASK(2, 0)
> +#define CFG_FBSWITCH BIT(7)
> +#define CFG_ENABLE BIT(8)
> +#define CFG_FBNUM BIT(11)
> +#define CFG_GAMMAR BIT(12)
> +#define CFG_RESET BIT(20)
> +
> +#define FB_PANCFG_DEF 0x80001311
> +#define FB_HSYNC_PULSE (1 << 30)
> +#define FB_VSYNC_PULSE (1 << 30)
> +
> +/* PIX PLL */
> +#define LOOPC_MIN 24
> +#define LOOPC_MAX 161
> +#define FRE_REF_MIN 12
> +#define FRE_REF_MAX 32
> +#define DIV_REF_MIN 3
> +#define DIV_REF_MAX 5
> +#define PST_DIV_MAX 64
> +
> +struct pix_pll {
> +	u32 l2_div;
> +	u32 l1_loopc;
> +	u32 l1_frefc;
> +};
> +
> +struct loongson_crtc {
> +	struct drm_crtc base;
> +	struct loongson_device *ldev;
> +	u32 crtc_id;
> +	u32 reg_offset;
> +	u32 cfg_reg;
> +	struct drm_plane plane;
> +};
> +
> +struct loongson_encoder {
> +	struct drm_encoder base;
> +	struct loongson_device *ldev;
> +	struct loongson_crtc *lcrtc;
> +};
> +
> +struct loongson_connector {
> +	struct drm_connector base;
> +	struct loongson_device *ldev;
> +	u16 id;
> +	u32 type;
> +};
> +
> +struct loongson_mode_info {
> +	struct loongson_device *ldev;
> +	struct loongson_crtc *crtc;
> +	struct loongson_encoder *encoder;
> +	struct loongson_connector *connector;
> +};
> +
> +struct loongson_device {
> +	struct drm_device *dev;
> +	struct drm_atomic_state *state;
> +
> +	void __iomem *mmio;
> +	void __iomem *io;
> +	u32 vram_start;
> +	u32 vram_size;
> +
> +	u32 num_crtc;
> +	struct loongson_mode_info mode_info[2];
> +	struct pci_dev *gpu_pdev; /* LS7A gpu device info */
> +};
> +
> +/* crtc */
> +int loongson_crtc_init(struct loongson_device *ldev, int index);
> +
> +/* connector */
> +int loongson_connector_init(struct loongson_device *ldev, int index);
> +
> +/* encoder */
> +int loongson_encoder_init(struct loongson_device *ldev, int index);
> +
> +/* plane */
> +int loongson_plane_init(struct loongson_crtc *lcrtc);
> +
> +/* device */
> +u32 loongson_gpu_offset(struct drm_plane_state *state,
> +			struct loongson_device *dev);
> +u32 ls7a_mm_rreg(struct loongson_device *ldev, u32 offset);
> +void ls7a_mm_wreg(struct loongson_device *ldev, u32 offset, u32 val);
> +u32 ls7a_io_rreg(struct loongson_device *ldev, u32 offset);
> +void ls7a_io_wreg(struct loongson_device *ldev, u32 offset, u32 val);
> +
> +#endif /* __LOONGSON_DRV_H__ */
> diff --git a/drivers/gpu/drm/loongson/loongson_encoder.c b/drivers/gpu/drm/loongson/loongson_encoder.c
> new file mode 100644
> index 000000000000..b64ff3bf610b
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_encoder.c
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +
> +static void loongson_encoder_destroy(struct drm_encoder *encoder)
> +{
> +	struct loongson_encoder *lencoder = to_loongson_encoder(encoder);
> +
> +	drm_encoder_cleanup(encoder);
> +	kfree(lencoder);
> +}
> +
> +static const struct drm_encoder_funcs loongson_encoder_funcs = {
> +	.destroy = loongson_encoder_destroy,
> +};
> +
> +int loongson_encoder_init(struct loongson_device *ldev, int index)
> +{
> +	struct drm_encoder *encoder;
> +	struct loongson_encoder *lencoder;
> +
> +	lencoder = kzalloc(sizeof(struct loongson_encoder), GFP_KERNEL);
> +	if (!lencoder)
> +		return -ENOMEM;
> +
> +	lencoder->lcrtc = ldev->mode_info[index].crtc;
> +	lencoder->ldev = ldev;
> +	encoder = &lencoder->base;
> +	encoder->possible_crtcs = 1 << index;
> +
> +	drm_encoder_init(ldev->dev, encoder, &loongson_encoder_funcs,
> +			 DRM_MODE_ENCODER_DAC, NULL);

Please use the drmm_encoder version here too.

> +
> +	ldev->mode_info[index].encoder = lencoder;
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/loongson/loongson_plane.c b/drivers/gpu/drm/loongson/loongson_plane.c
> new file mode 100644
> index 000000000000..679d6981fece
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_plane.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +
> +static void loongson_plane_atomic_update(struct drm_plane *plane,
> +					 struct drm_atomic_state *state)
> +{
> +	struct loongson_crtc *lcrtc;
> +	struct loongson_device *ldev;
> +	struct drm_plane_state *lstate = plane->state;
> +	u32 gpu_addr = 0;
> +	u32 fb_addr = 0;
> +	u32 reg_val = 0;
> +	u32 reg_offset;
> +	u32 pitch;
> +	u8 depth;
> +	u32 x, y;
> +
> +	if (!lstate->crtc || !lstate->fb)
> +		return;
> +
> +	pitch = lstate->fb->pitches[0];
> +	lcrtc = to_loongson_crtc(lstate->crtc);
> +	ldev = lcrtc->ldev;
> +	reg_offset = lcrtc->reg_offset;
> +	x = lstate->crtc->x;
> +	y = lstate->crtc->y;
> +	depth = lstate->fb->format->cpp[0] << 3;
> +
> +	gpu_addr = loongson_gpu_offset(lstate, ldev);
> +	reg_val = (pitch + 255) & ~255;
> +	ls7a_mm_wreg(ldev, FB_STRI_REG + reg_offset, reg_val);
> +
> +	switch (depth) {
> +	case 12 ... 16:
> +		fb_addr = gpu_addr + y * pitch + ALIGN(x, 64) * 2;
> +		break;
> +	case 24 ... 32:
> +	default:
> +		fb_addr = gpu_addr + y * pitch + ALIGN(x, 64) * 4;
> +		break;
> +	}
> +
> +	ls7a_mm_wreg(ldev, FB_ADDR0_REG + reg_offset, fb_addr);
> +	ls7a_mm_wreg(ldev, FB_ADDR1_REG + reg_offset, fb_addr);
> +	reg_val = lcrtc->cfg_reg | CFG_ENABLE;
> +	ls7a_mm_wreg(ldev, FB_CFG_REG + reg_offset, reg_val);
> +}
> +
> +static const uint32_t loongson_formats[] = {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +};
> +
> +static const uint64_t loongson_format_modifiers[] = { DRM_FORMAT_MOD_LINEAR,
> +						      DRM_FORMAT_MOD_INVALID };
> +
> +static const struct drm_plane_funcs loongson_plane_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> +	.destroy = drm_plane_cleanup,
> +	.disable_plane = drm_atomic_helper_disable_plane,
> +	.reset = drm_atomic_helper_plane_reset,
> +	.update_plane = drm_atomic_helper_update_plane,
> +};
> +
> +static const struct drm_plane_helper_funcs loongson_plane_helper_funcs = {
> +	.prepare_fb	= drm_gem_vram_plane_helper_prepare_fb,
> +	.cleanup_fb	= drm_gem_vram_plane_helper_cleanup_fb,
> +	.atomic_update = loongson_plane_atomic_update,
> +};
> +
> +int loongson_plane_init(struct loongson_crtc *lcrtc)
> +{
> +	struct loongson_device *ldev;
> +	int crtc_id;
> +	int ret;
> +
> +	ldev = lcrtc->ldev;
> +	crtc_id = lcrtc->crtc_id;
> +
> +	ret = drm_universal_plane_init(ldev->dev, &lcrtc->plane, BIT(crtc_id),
> +				       &loongson_plane_funcs, loongson_formats,
> +				       ARRAY_SIZE(loongson_formats),
> +				       loongson_format_modifiers,
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret) {
> +		DRM_ERROR("fail to init planed crtc %d\n", crtc_id);
> +		return ret;
> +	}
> +
> +	drm_plane_helper_add(&lcrtc->plane, &loongson_plane_helper_funcs);
> +
> +	return 0;
> +}
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
