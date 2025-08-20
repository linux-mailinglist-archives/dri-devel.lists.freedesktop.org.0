Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3FB2E76A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 23:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8757410E7F6;
	Wed, 20 Aug 2025 21:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="l1cZhgOY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9453110E7F6
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 21:21:44 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250820212142euoutp01e663f5f5d179712a849611efd54a26f6~dln8d6aY70941509415euoutp01N
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 21:21:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250820212142euoutp01e663f5f5d179712a849611efd54a26f6~dln8d6aY70941509415euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1755724902;
 bh=bzOYE+kgVQ7sV898e6UnW81jZJgCQvZA1FoovwYhFUM=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=l1cZhgOY+fLa7YfzarfqxkjeUUStpwv9DB8rd/lKFbcZTXTIU63pn4MPVIPxW5KJL
 O9IbHDTIKGRZumN2fEGx/RKqiEhT+/ABJT5C4hH63xaaUfN4nWfRlbZ4aEqVsJhOEt
 xeMzVip6hrg0XW2en5f7ubtUBPFTircl3bj+iKxI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250820212141eucas1p131afe48f85fd11f7e2ad68348e4ffa44~dln7qsQBS2028920289eucas1p1R;
 Wed, 20 Aug 2025 21:21:41 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250820212140eusmtip22ae5ae485a3d3111344df8eaf4ecf495~dln6jOSfv0934509345eusmtip2R;
 Wed, 20 Aug 2025 21:21:40 +0000 (GMT)
Message-ID: <4e6d1a0f-4270-4d25-86c5-e4ec3721c451@samsung.com>
Date: Wed, 20 Aug 2025 23:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
To: Icenowy Zheng <uwu@icenowy.me>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Drew
 Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner
 <heiko@sntech.de>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250814164048.2336043-4-uwu@icenowy.me>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250820212141eucas1p131afe48f85fd11f7e2ad68348e4ffa44
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250814164219eucas1p20aa2b3359085d5993dd1301a01d11b4e
X-EPHeader: CA
X-CMS-RootMailID: 20250814164219eucas1p20aa2b3359085d5993dd1301a01d11b4e
References: <20250814164048.2336043-1-uwu@icenowy.me>
 <CGME20250814164219eucas1p20aa2b3359085d5993dd1301a01d11b4e@eucas1p2.samsung.com>
 <20250814164048.2336043-4-uwu@icenowy.me>
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



On 8/14/25 18:40, Icenowy Zheng wrote:
> This is a from-scratch driver targeting Verisilicon DC-series display
> controllers, which feature self-identification functionality like their
> GC-series GPUs.
> 
> Only DC8200 is being supported now, and only the main framebuffer is set
> up (as the DRM primary plane). Support for more DC models and more
> features is my further targets.
> 
> As the display controller is delivered to SoC vendors as a whole part,
> this driver does not use component framework and extra bridges inside a
> SoC is expected to be implemented as dedicated bridges (this driver
> properly supports bridge chaining).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/gpu/drm/Kconfig                       |   2 +
>  drivers/gpu/drm/Makefile                      |   1 +
>  drivers/gpu/drm/verisilicon/Kconfig           |  15 +
>  drivers/gpu/drm/verisilicon/Makefile          |   5 +
>  drivers/gpu/drm/verisilicon/vs_bridge.c       | 330 ++++++++++++++++++
>  drivers/gpu/drm/verisilicon/vs_bridge.h       |  40 +++
>  drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  47 +++
>  drivers/gpu/drm/verisilicon/vs_crtc.c         | 217 ++++++++++++
>  drivers/gpu/drm/verisilicon/vs_crtc.h         |  29 ++
>  drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 ++++
>  drivers/gpu/drm/verisilicon/vs_dc.c           | 233 +++++++++++++
>  drivers/gpu/drm/verisilicon/vs_dc.h           |  39 +++
>  drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
>  drivers/gpu/drm/verisilicon/vs_drm.c          | 177 ++++++++++
>  drivers/gpu/drm/verisilicon/vs_drm.h          |  29 ++
>  drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 ++++++++
>  drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
>  drivers/gpu/drm/verisilicon/vs_plane.c        | 102 ++++++
>  drivers/gpu/drm/verisilicon/vs_plane.h        |  68 ++++
>  .../gpu/drm/verisilicon/vs_primary_plane.c    | 166 +++++++++
>  .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
>  21 files changed, 1819 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
>  create mode 100644 drivers/gpu/drm/verisilicon/Makefile
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
>  create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f7ea8e895c0c0..33601485ecdba 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -396,6 +396,8 @@ source "drivers/gpu/drm/sprd/Kconfig"
>  
>  source "drivers/gpu/drm/imagination/Kconfig"
>  
> +source "drivers/gpu/drm/verisilicon/Kconfig"
> +
>  config DRM_HYPERV
>  	tristate "DRM Support for Hyper-V synthetic video device"
>  	depends on DRM && PCI && HYPERV
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 4dafbdc8f86ac..32ed4cf9df1bd 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -231,6 +231,7 @@ obj-y			+= solomon/
>  obj-$(CONFIG_DRM_SPRD) += sprd/
>  obj-$(CONFIG_DRM_LOONGSON) += loongson/
>  obj-$(CONFIG_DRM_POWERVR) += imagination/
> +obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon/
>  
>  # Ensure drm headers are self-contained and pass kernel-doc
>  hdrtest-files := \
> diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
> new file mode 100644
> index 0000000000000..0235577c72824
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config DRM_VERISILICON_DC
> +	tristate "DRM Support for Verisilicon DC-series display controllers"
> +	depends on DRM && COMMON_CLK
> +	depends on RISCV || COMPILER_TEST
> +	select DRM_CLIENT_SELECTION
> +	select DRM_GEM_DMA_HELPER
> +	select DRM_KMS_HELPER
> +	select DRM_BRIDGE_CONNECTOR
> +	select REGMAP_MMIO
> +	select VIDEOMODE_HELPERS
> +	help
> +	  Choose this option if you have a SoC with Verisilicon DC-series
> +	  display controllers. If M is selected, the module will be called
> +	  verisilicon-dc.
> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/verisilicon/Makefile
> new file mode 100644
> index 0000000000000..fd8d805fbcde1
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +verisilicon-dc-objs := vs_bridge.o vs_crtc.o vs_dc.o vs_drm.o vs_hwdb.o vs_plane.o vs_primary_plane.o
> +
> +obj-$(CONFIG_DRM_VERISILICON_DC) += verisilicon-dc.o
> diff --git a/drivers/gpu/drm/verisilicon/vs_bridge.c b/drivers/gpu/drm/verisilicon/vs_bridge.c
> new file mode 100644
> index 0000000000000..c8caf31fac7d6
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/vs_bridge.c
> @@ -0,0 +1,330 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
> +#include <uapi/linux/media-bus-format.h>
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "vs_bridge.h"
> +#include "vs_bridge_regs.h"
> +#include "vs_crtc.h"
> +#include "vs_dc.h"
> +
> +static int vs_bridge_attach(struct drm_bridge *bridge,
> +			    struct drm_encoder *encoder,
> +			    enum drm_bridge_attach_flags flags)
> +{
> +	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
> +
> +	return drm_bridge_attach(encoder, vbridge->next,
> +				 bridge, flags);
> +}
> +
> +struct vsdc_dp_format {
> +	u32 linux_fmt;
> +	bool is_yuv;
> +	u32 vsdc_fmt;
> +};
> +
> +static struct vsdc_dp_format vsdc_dp_supported_fmts[] = {
> +	/* default to RGB888 */
> +	{ MEDIA_BUS_FMT_FIXED, false, VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> +	{ MEDIA_BUS_FMT_RGB888_1X24, false, VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> +	{ MEDIA_BUS_FMT_RGB565_1X16, false, VSDC_DISP_DP_CONFIG_FMT_RGB565 },
> +	{ MEDIA_BUS_FMT_RGB666_1X18, false, VSDC_DISP_DP_CONFIG_FMT_RGB666 },
> +	{ MEDIA_BUS_FMT_RGB888_1X24, false, VSDC_DISP_DP_CONFIG_FMT_RGB888 },
> +	{ MEDIA_BUS_FMT_RGB101010_1X30,
> +	  false, VSDC_DISP_DP_CONFIG_FMT_RGB101010 },
> +	{ MEDIA_BUS_FMT_UYVY8_1X16, true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY8 },
> +	{ MEDIA_BUS_FMT_UYVY10_1X20, true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYVY10 },
> +	{ MEDIA_BUS_FMT_YUV8_1X24, true, VSDC_DISP_DP_CONFIG_YUV_FMT_YUV8 },
> +	{ MEDIA_BUS_FMT_YUV10_1X30, true, VSDC_DISP_DP_CONFIG_YUV_FMT_YUV10 },
> +	{ MEDIA_BUS_FMT_UYYVYY8_0_5X24,
> +	  true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY8 },
> +	{ MEDIA_BUS_FMT_UYYVYY10_0_5X30,
> +	  true, VSDC_DISP_DP_CONFIG_YUV_FMT_UYYVYY10 },
> +};
> +
> +static u32 *vs_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					unsigned int *num_output_fmts)
> +{
> +	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
> +	struct drm_connector *conn = conn_state->connector;
> +	u32 *output_fmts;
> +	unsigned int i;
> +
> +	if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DPI)
> +		*num_output_fmts = 1;
> +	else
> +		*num_output_fmts = ARRAY_SIZE(vsdc_dp_supported_fmts);
> +
> +	output_fmts = kcalloc(*num_output_fmts, sizeof(*output_fmts),
> +			      GFP_KERNEL);
> +	if (!output_fmts)
> +		return NULL;
> +
> +	if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DPI) {
> +		if (conn->display_info.num_bus_formats &&
> +		    conn->display_info.bus_formats)
> +			output_fmts[0] = conn->display_info.bus_formats[0];
> +		else
> +			output_fmts[0] = MEDIA_BUS_FMT_FIXED;
> +	} else {
> +		for (i = 0; i < *num_output_fmts; i++)
> +			output_fmts[i] = vsdc_dp_supported_fmts[i].linux_fmt;
> +	}
> +
> +	return output_fmts;
> +}
> +
> +static bool vs_bridge_out_dp_fmt_supported(u32 out_fmt)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(vsdc_dp_supported_fmts); i++)
> +		if (vsdc_dp_supported_fmts[i].linux_fmt == out_fmt)
> +			break;
> +
> +	return !(i == ARRAY_SIZE(vsdc_dp_supported_fmts));
> +}
> +
> +static u32 *vs_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
> +
> +	if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
> +	    !vs_bridge_out_dp_fmt_supported(output_fmt)) {
> +		*num_input_fmts = 0;
> +		return NULL;
> +	}
> +
> +	return drm_atomic_helper_bridge_propagate_bus_fmt(bridge, bridge_state,
> +							  crtc_state,
> +							  conn_state,
> +							  output_fmt,
> +							  num_input_fmts);
> +}
> +
> +static int vs_bridge_atomic_check(struct drm_bridge *bridge,
> +				  struct drm_bridge_state *bridge_state,
> +				  struct drm_crtc_state *crtc_state,
> +				  struct drm_connector_state *conn_state)
> +{
> +	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
> +
> +	if (vbridge->intf == VSDC_OUTPUT_INTERFACE_DP &&
> +	    !vs_bridge_out_dp_fmt_supported(bridge_state->output_bus_cfg.format))
> +		return -EINVAL;
> +
> +	vbridge->output_bus_fmt = bridge_state->output_bus_cfg.format;
> +
> +	return 0;
> +}
> +
> +static void vs_bridge_atomic_enable(struct drm_bridge *bridge,
> +				    struct drm_atomic_state *state)
> +{
> +	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
> +	struct drm_bridge_state *br_state = drm_atomic_get_bridge_state(state,
> +									bridge);
> +	struct vs_crtc *crtc = vbridge->crtc;
> +	struct vs_dc *dc = crtc->dc;
> +	unsigned int output = crtc->id;
> +	u32 dp_fmt;
> +	unsigned int i;
> +
> +	DRM_DEBUG_DRIVER("Enabling output %u\n", output);
> +
> +	switch (vbridge->intf) {
> +	case VSDC_OUTPUT_INTERFACE_DPI:
> +		regmap_clear_bits(dc->regs, VSDC_DISP_DP_CONFIG(output),
> +				  VSDC_DISP_DP_CONFIG_DP_EN);
> +		break;
> +	case VSDC_OUTPUT_INTERFACE_DP:
> +		for (i = 0; i < ARRAY_SIZE(vsdc_dp_supported_fmts); i++) {
> +			if (vsdc_dp_supported_fmts[i].linux_fmt ==
> +			    vbridge->output_bus_fmt)
> +				break;
> +		}
> +		WARN_ON_ONCE(i == ARRAY_SIZE(vsdc_dp_supported_fmts));
> +		dp_fmt = vsdc_dp_supported_fmts[i].vsdc_fmt;
> +		dp_fmt |= VSDC_DISP_DP_CONFIG_DP_EN;
> +		regmap_write(dc->regs, VSDC_DISP_DP_CONFIG(output), dp_fmt);
> +		regmap_assign_bits(dc->regs,
> +				   VSDC_DISP_PANEL_CONFIG(output),
> +				   VSDC_DISP_PANEL_CONFIG_YUV,
> +				   vsdc_dp_supported_fmts[i].is_yuv);
> +		break;
> +	}
> +
> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> +			  VSDC_DISP_PANEL_CONFIG_DAT_POL);
> +	regmap_assign_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> +			   VSDC_DISP_PANEL_CONFIG_DE_POL,
> +			   br_state->output_bus_cfg.flags &
> +			   DRM_BUS_FLAG_DE_LOW);
> +	regmap_assign_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> +			   VSDC_DISP_PANEL_CONFIG_CLK_POL,
> +			   br_state->output_bus_cfg.flags &
> +			   DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE);
> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> +			VSDC_DISP_PANEL_CONFIG_DE_EN |
> +			VSDC_DISP_PANEL_CONFIG_DAT_EN |
> +			VSDC_DISP_PANEL_CONFIG_CLK_EN);
> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> +			VSDC_DISP_PANEL_CONFIG_RUNNING);
> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
> +			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC);
> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_START,
> +			VSDC_DISP_PANEL_START_RUNNING(output));
> +
> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
> +			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
> +}
> +
> +static void vs_bridge_atomic_disable(struct drm_bridge *bridge,
> +				     struct drm_atomic_state *state)
> +{
> +	struct vs_bridge *vbridge = drm_bridge_to_vs_bridge(bridge);
> +	struct vs_crtc *crtc = vbridge->crtc;
> +	struct vs_dc *dc = crtc->dc;
> +	unsigned int output = crtc->id;
> +
> +	DRM_DEBUG_DRIVER("Disabling output %u\n", output);
> +
> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_START,
> +			  VSDC_DISP_PANEL_START_MULTI_DISP_SYNC |
> +			  VSDC_DISP_PANEL_START_RUNNING(output));
> +	regmap_clear_bits(dc->regs, VSDC_DISP_PANEL_CONFIG(output),
> +			  VSDC_DISP_PANEL_CONFIG_RUNNING);
> +
> +	regmap_set_bits(dc->regs, VSDC_DISP_PANEL_CONFIG_EX(crtc->id),
> +			VSDC_DISP_PANEL_CONFIG_EX_COMMIT);
> +}
> +
> +static const struct drm_bridge_funcs vs_bridge_funcs = {
> +	.attach = vs_bridge_attach,
> +	.atomic_enable = vs_bridge_atomic_enable,
> +	.atomic_disable = vs_bridge_atomic_disable,
> +	.atomic_check = vs_bridge_atomic_check,
> +	.atomic_get_input_bus_fmts = vs_bridge_atomic_get_input_bus_fmts,
> +	.atomic_get_output_bus_fmts = vs_bridge_atomic_get_output_bus_fmts,
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +};
> +
> +static int vs_bridge_detect_output_interface(struct device_node *of_node,
> +					     unsigned int output)
> +{
> +	int ret;
> +	struct device_node *remote;
> +
> +	remote = of_graph_get_remote_node(of_node, output,
> +					  VSDC_OUTPUT_INTERFACE_DPI);
> +	if (remote) {
> +		ret = VSDC_OUTPUT_INTERFACE_DPI;
> +	} else {
> +		remote = of_graph_get_remote_node(of_node, output,
> +						  VSDC_OUTPUT_INTERFACE_DP);
> +		if (remote)
> +			ret = VSDC_OUTPUT_INTERFACE_DP;
> +		else
> +			ret = -ENODEV;
> +	}
> +
> +	return ret;
> +}
> +
> +struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
> +				 struct vs_crtc *crtc)
> +{
> +	unsigned int output = crtc->id;
> +	struct vs_bridge *bridge;
> +	struct drm_bridge *next;
> +	enum vs_bridge_output_interface intf;
> +	int ret;
> +
> +	intf = vs_bridge_detect_output_interface(drm_dev->dev->of_node,
> +						 output);
> +	if (intf == -ENODEV) {
> +		dev_info(drm_dev->dev, "Skipping output %u\n", output);
> +		return NULL;
> +	}
> +
> +	bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
> +	if (!bridge)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bridge->crtc = crtc;
> +	bridge->intf = intf;
> +	bridge->base.funcs = &vs_bridge_funcs;

So I am trying to make it work on JH7110 as well, and here is the
problem:

[    5.564433] ------------[ cut here ]------------                                                                                                                                           
[    5.569161] refcount_t: addition on 0; use-after-free.                                                                                                                                     
[    5.574485] WARNING: CPU: 2 PID: 71 at lib/refcount.c:25 refcount_warn_saturate+0x110/0x162                                                                                                
[    5.574537] Modules linked in:                                                                                                                                                             
[    5.574560] CPU: 2 UID: 0 PID: 71 Comm: kworker/u17:2 Not tainted 6.17.0-rc1-g60ec647ec20c-dirty #77 NONE                                                                                  
[    5.574596] Hardware name: StarFive VisionFive 2 v1.2A (DT)                                                                                                                                
[    5.574613] Workqueue: events_unbound deferred_probe_work_func                                                                                                                             
[    5.574654] epc : refcount_warn_saturate+0x110/0x162                                                                                                                                       
[    5.574682]  ra : refcount_warn_saturate+0x110/0x162                                                                                                                                       
[    5.574710] epc : ffffffff81336608 ra : ffffffff81336608 sp : ffffffc6006e7530                                                                                                             
[    5.574732]  gp : ffffffff8514c1c0 tp : ffffffd6c14ba580 t0 : ffffffc6006e7134                                                                                                             
[    5.574753]  t1 : fffffffef0a29898 t2 : 5f746e756f636665 s0 : ffffffc6006e7550                                                                                                             
[    5.574774]  s1 : ffffffff83c058a8 a0 : 000000000000002a a1 : 0000000000000004                                                                                                             
[    5.574794]  a2 : 0000000000000000 a3 : ffffffff801ef586 a4 : 0000000000000000                                                                                                             
[    5.574813]  a5 : 0000000000000000 a6 : fffffffef0a29899 a7 : 0000000000000003                                                                                                             
[    5.574833]  s2 : ffffffd6c35e68e8 s3 : ffffffd6c35e6990 s4 : ffffffd6c33dc008                                                                                                             
[    5.574854]  s5 : 0000000000000000 s6 : 1ffffffad867b801 s7 : 0000000000000000                                                                                                             
[    5.574873]  s8 : ffffffd6c35e6990 s9 : 0000000000000000 s10: ffffffd6c3099058                                                                                                             
[    5.574894]  s11: 1ffffffad861320b t3 : 1ffffff8c00dce34 t4 : fffffffef0a29898                                                                                                             
[    5.574915]  t5 : fffffffef0a29899 t6 : ffffffc6006e6f38                                                                                                                                   
[    5.574933] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003                                                                                                     
[    5.574952] [<ffffffff81336608>] refcount_warn_saturate+0x110/0x162                                                                                                                        
[    5.574985] [<ffffffff8193a506>] drm_bridge_get+0x66/0x6e                                                                                                                                  
[    5.575022] [<ffffffff8001f26e>] drm_bridge_attach+0x54/0x5a2                                                                                                                              
[    5.575055] [<ffffffff8002740e>] vs_bridge_init+0x3bc/0x4ba                                                                                                                                
[    5.575087] [<ffffffff82313026>] vs_drm_initialize+0xe0/0x2f2                                                                                                                              
[    5.575126] [<ffffffff80027ca4>] vs_dc_probe+0x758/0x85c                                                                                                                                   
[    5.575156] [<ffffffff8233123c>] platform_probe+0xac/0x138                                                                                                                                 
[    5.575186] [<ffffffff8232b2a8>] really_probe+0x164/0x59e                                                                                                                                  
[    5.575221] [<ffffffff8232b818>] __driver_probe_device+0x136/0x266
[    5.575257] [<ffffffff8232bb18>] driver_probe_device+0x56/0x214
[    5.575292] [<ffffffff8232bdf0>] __device_attach_driver+0x11a/0x278
[    5.575329] [<ffffffff823272d8>] bus_for_each_drv+0xea/0x16e
[    5.575363] [<ffffffff8232c680>] __device_attach+0x160/0x2d4
[    5.575398] [<ffffffff8232ca06>] device_initial_probe+0xe/0x16
[    5.575434] [<ffffffff823291d8>] bus_probe_device+0xfe/0x134
[    5.575468] [<ffffffff82329c62>] deferred_probe_work_func+0x128/0x1d6
[    5.575503] [<ffffffff80126aae>] process_one_work+0x5c0/0xe76
[    5.575543] [<ffffffff80129da6>] worker_thread+0x6d4/0x1316
[    5.575572] [<ffffffff801429ce>] kthread+0x29a/0x570
[    5.575608] [<ffffffff8004693e>] ret_from_fork_kernel+0x10/0x9a
[    5.575643] [<ffffffff835f55f6>] ret_from_fork_kernel_asm+0x16/0x18
[    5.575682] ---[ end trace 0000000000000000 ]---


When a bridge is allocated with kzalloc, its kref count is initialized
to zero. The drm_bridge_attach() function then calls drm_bridge_get() on
this bridge, which sees the zero refcount and triggers a use-after-free
warning because it assumes the object has already been freed.

To fix this, the bridge's refcount must be initialized with kref_init()
after allocation and before it's attached.

> +
> +	next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
> +				      output, intf);
> +	if (IS_ERR(next)) {
> +		ret = PTR_ERR(next);
> +		goto err_free_bridge;
> +	}
> +
> +	bridge->next = next;
> +
> +	ret = drm_simple_encoder_init(drm_dev, &bridge->enc,
> +				      (intf == VSDC_OUTPUT_INTERFACE_DPI) ?
> +				      DRM_MODE_ENCODER_DPI :
> +				      DRM_MODE_ENCODER_NONE);
> +	if (ret) {
> +		dev_err(drm_dev->dev,
> +			"Cannot initialize encoder for output %u\n", output);
> +		goto err_free_bridge;
> +	}
> +
> +	bridge->enc.possible_crtcs = drm_crtc_mask(&crtc->base);
> +
> +	ret = drm_bridge_attach(&bridge->enc, &bridge->base, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret) {
> +		dev_err(drm_dev->dev,
> +			"Cannot attach bridge for output %u\n", output);
> +		goto err_cleanup_encoder;
> +	}
> +
> +	bridge->conn = drm_bridge_connector_init(drm_dev, &bridge->enc);
> +	if (IS_ERR(bridge->conn)) {
> +		dev_err(drm_dev->dev,
> +			"Cannot create connector for output %u\n", output);
> +		ret = PTR_ERR(bridge->conn);
> +		goto err_cleanup_encoder;
> +	}
> +	drm_connector_attach_encoder(bridge->conn, &bridge->enc);
> +
> +	return bridge;
> +
> +err_cleanup_encoder:
> +	drm_encoder_cleanup(&bridge->enc);
> +err_free_bridge:
> +	devm_kfree(drm_dev->dev, bridge);
> +
> +	return ERR_PTR(ret);
> +}


Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
