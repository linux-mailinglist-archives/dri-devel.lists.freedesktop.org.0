Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7287B17EEAD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 03:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B276E143;
	Tue, 10 Mar 2020 02:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 703316E143
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 02:37:31 +0000 (UTC)
X-UUID: f7731083a6bb467bbae773dcdd098d58-20200310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hLjlW65hQN7C6KTZ0z09rF1NUbZS3I5Rt9C9E6AC1dM=; 
 b=G4KZOYec4ghBtwfsRhvrArSWXtZAwYe4JjBpGHXb9+7rCrAdo9glAWfc+rs29ZiVD/VFgnBHP5+ZyGA5D5YH/qzIflNEDnMJiZqom53+YHdzLinubIkWdcK9EtM/HqZHjASUg19eGgFkpWhXt+M8gLjkwl1HyaMN2aF1avXJQpA=;
X-UUID: f7731083a6bb467bbae773dcdd098d58-20200310
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2051755948; Tue, 10 Mar 2020 10:37:26 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 10:36:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Mar 2020 10:36:31 +0800
Message-ID: <1583807844.30143.0.camel@mtksdaap41>
Subject: Re: [PATCH 10/22] drm/mediatek: Use simple encoder
From: CK Hu <ck.hu@mediatek.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 10 Mar 2020 10:37:24 +0800
In-Reply-To: <20200305155950.2705-11-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
 <20200305155950.2705-11-tzimmermann@suse.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
 krzk@kernel.org, sam@ravnborg.org, sebastian.reichel@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, hjc@rock-chips.com,
 abrodkin@synopsys.com, kong.kongxinwei@hisilicon.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, ludovic.desroches@microchip.com, kgene@kernel.org,
 linux-imx@nxp.com, linux-rockchip@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 puck.chen@hisilicon.com, s.hauer@pengutronix.de, alison.wang@nxp.com,
 jsarha@ti.com, matthias.bgg@gmail.com, wens@csie.org, kernel@pengutronix.de,
 jernej.skrabec@siol.net, kraxel@redhat.com, rodrigosiqueiramelo@gmail.com,
 tomi.valkeinen@ti.com, bbrezillon@kernel.org, jingoohan1@gmail.com,
 dri-devel@lists.freedesktop.org, sw0312.kim@samsung.com,
 nicolas.ferre@microchip.com, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, zourongrong@gmail.com,
 linux-mediatek@lists.infradead.org, shawnguo@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Thomas:

On Thu, 2020-03-05 at 16:59 +0100, Thomas Zimmermann wrote:
> The mediatak driver uses empty implementations for its encoders. Replace
> the code with the generic simple encoder.
> 

Acked-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 14 +++-----------
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 14 +++-----------
>  2 files changed, 6 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 14fbe1c09ce9..9c90c58e5acd 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -20,6 +20,7 @@
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "mtk_dpi_regs.h"
>  #include "mtk_drm_ddp_comp.h"
> @@ -509,15 +510,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	return 0;
>  }
>  
> -static void mtk_dpi_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	drm_encoder_cleanup(encoder);
> -}
> -
> -static const struct drm_encoder_funcs mtk_dpi_encoder_funcs = {
> -	.destroy = mtk_dpi_encoder_destroy,
> -};
> -
>  static bool mtk_dpi_encoder_mode_fixup(struct drm_encoder *encoder,
>  				       const struct drm_display_mode *mode,
>  				       struct drm_display_mode *adjusted_mode)
> @@ -596,8 +588,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>  		return ret;
>  	}
>  
> -	ret = drm_encoder_init(drm_dev, &dpi->encoder, &mtk_dpi_encoder_funcs,
> -			       DRM_MODE_ENCODER_TMDS, NULL);
> +	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
> +				      DRM_MODE_ENCODER_TMDS);
>  	if (ret) {
>  		dev_err(dev, "Failed to initialize decoder: %d\n", ret);
>  		goto err_unregister;
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 0ede69830a9d..a9a25087112f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -22,6 +22,7 @@
>  #include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
>  
>  #include "mtk_drm_ddp_comp.h"
>  
> @@ -787,15 +788,6 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
>  	dsi->enabled = false;
>  }
>  
> -static void mtk_dsi_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	drm_encoder_cleanup(encoder);
> -}
> -
> -static const struct drm_encoder_funcs mtk_dsi_encoder_funcs = {
> -	.destroy = mtk_dsi_encoder_destroy,
> -};
> -
>  static bool mtk_dsi_encoder_mode_fixup(struct drm_encoder *encoder,
>  				       const struct drm_display_mode *mode,
>  				       struct drm_display_mode *adjusted_mode)
> @@ -888,8 +880,8 @@ static int mtk_dsi_create_conn_enc(struct drm_device *drm, struct mtk_dsi *dsi)
>  {
>  	int ret;
>  
> -	ret = drm_encoder_init(drm, &dsi->encoder, &mtk_dsi_encoder_funcs,
> -			       DRM_MODE_ENCODER_DSI, NULL);
> +	ret = drm_simple_encoder_init(drm, &dsi->encoder,
> +				      DRM_MODE_ENCODER_DSI);
>  	if (ret) {
>  		DRM_ERROR("Failed to encoder init to drm\n");
>  		return ret;

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
