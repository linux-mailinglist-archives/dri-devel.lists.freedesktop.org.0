Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5A17C7D9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 22:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320476E512;
	Fri,  6 Mar 2020 21:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C2D6E512
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 21:28:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9D6222001E;
 Fri,  6 Mar 2020 22:28:10 +0100 (CET)
Date: Fri, 6 Mar 2020 22:28:09 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 03/22] drm/exynos: Use simple encoder
Message-ID: <20200306212809.GC17369@ravnborg.org>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305155950.2705-4-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=c5m9ZR8XE5dJf7741e4A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: hamohammed.sa@gmail.com, alexandre.belloni@bootlin.com, airlied@linux.ie,
 linux@armlinux.org.uk, paul@crapouillou.net, thierry.reding@gmail.com,
 krzk@kernel.org, sebastian.reichel@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, hjc@rock-chips.com,
 tomi.valkeinen@ti.com, abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org, ludovic.desroches@microchip.com,
 kgene@kernel.org, linux-imx@nxp.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, kraxel@redhat.com, rodrigosiqueiramelo@gmail.com,
 bbrezillon@kernel.org, jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 sw0312.kim@samsung.com, nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, zourongrong@gmail.com,
 linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 04:59:31PM +0100, Thomas Zimmermann wrote:
> The exynos driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/exynos/exynos_dp.c       | 8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 8 ++------
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c | 8 ++------
>  drivers/gpu/drm/exynos/exynos_hdmi.c     | 8 ++------
>  5 files changed, 10 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
> index d23d3502ca91..a61482af2998 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
> @@ -25,6 +25,7 @@
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  #include <drm/exynos_drm.h>
>  
>  #include "exynos_drm_crtc.h"
> @@ -135,10 +136,6 @@ static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
>  	.disable = exynos_dp_nop,
>  };
>  
> -static const struct drm_encoder_funcs exynos_dp_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
>  {
>  	int ret;
> @@ -174,8 +171,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
>  			return ret;
>  	}
>  
> -	drm_encoder_init(drm_dev, encoder, &exynos_dp_encoder_funcs,
> -			 DRM_MODE_ENCODER_TMDS, NULL);
> +	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
>  
>  	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> index 43fa0f26c052..7ba5354e7d94 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include <video/of_videomode.h>
>  #include <video/videomode.h>
> @@ -149,10 +150,6 @@ static const struct drm_encoder_helper_funcs exynos_dpi_encoder_helper_funcs = {
>  	.disable = exynos_dpi_disable,
>  };
>  
> -static const struct drm_encoder_funcs exynos_dpi_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  enum {
>  	FIMD_PORT_IN0,
>  	FIMD_PORT_IN1,
> @@ -201,8 +198,7 @@ int exynos_dpi_bind(struct drm_device *dev, struct drm_encoder *encoder)
>  {
>  	int ret;
>  
> -	drm_encoder_init(dev, encoder, &exynos_dpi_encoder_funcs,
> -			 DRM_MODE_ENCODER_TMDS, NULL);
> +	drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_TMDS);
>  
>  	drm_encoder_helper_add(encoder, &exynos_dpi_encoder_helper_funcs);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 669d3857502a..2986c93382e0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -30,6 +30,7 @@
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "exynos_drm_crtc.h"
>  #include "exynos_drm_drv.h"
> @@ -1524,10 +1525,6 @@ static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
>  	.disable = exynos_dsi_disable,
>  };
>  
> -static const struct drm_encoder_funcs exynos_dsi_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
>  
>  static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> @@ -1705,8 +1702,7 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>  	struct drm_bridge *in_bridge;
>  	int ret;
>  
> -	drm_encoder_init(drm_dev, encoder, &exynos_dsi_encoder_funcs,
> -			 DRM_MODE_ENCODER_TMDS, NULL);
> +	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
>  
>  	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index b320b3a21ad4..282467121699 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/exynos_drm.h>
>  
> @@ -369,10 +370,6 @@ static const struct drm_encoder_helper_funcs exynos_vidi_encoder_helper_funcs =
>  	.disable = exynos_vidi_disable,
>  };
>  
> -static const struct drm_encoder_funcs exynos_vidi_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  static int vidi_bind(struct device *dev, struct device *master, void *data)
>  {
>  	struct vidi_context *ctx = dev_get_drvdata(dev);
> @@ -406,8 +403,7 @@ static int vidi_bind(struct device *dev, struct device *master, void *data)
>  		return PTR_ERR(ctx->crtc);
>  	}
>  
> -	drm_encoder_init(drm_dev, encoder, &exynos_vidi_encoder_funcs,
> -			 DRM_MODE_ENCODER_TMDS, NULL);
> +	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
>  
>  	drm_encoder_helper_add(encoder, &exynos_vidi_encoder_helper_funcs);
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 3e5f1a77286d..302ffda5f297 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -38,6 +38,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "exynos_drm_crtc.h"
>  #include "regs-hdmi.h"
> @@ -1559,10 +1560,6 @@ static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs =
>  	.disable	= hdmi_disable,
>  };
>  
> -static const struct drm_encoder_funcs exynos_hdmi_encoder_funcs = {
> -	.destroy = drm_encoder_cleanup,
> -};
> -
>  static void hdmi_audio_shutdown(struct device *dev, void *data)
>  {
>  	struct hdmi_context *hdata = dev_get_drvdata(dev);
> @@ -1851,8 +1848,7 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
>  
>  	hdata->phy_clk.enable = hdmiphy_clk_enable;
>  
> -	drm_encoder_init(drm_dev, encoder, &exynos_hdmi_encoder_funcs,
> -			 DRM_MODE_ENCODER_TMDS, NULL);
> +	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
>  
>  	drm_encoder_helper_add(encoder, &exynos_hdmi_encoder_helper_funcs);
>  
> -- 
> 2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
