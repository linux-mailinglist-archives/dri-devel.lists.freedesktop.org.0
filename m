Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64022D9D26
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 18:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E8C6E079;
	Mon, 14 Dec 2020 17:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0431D6E079
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 17:02:39 +0000 (UTC)
Received: from [192.168.0.217]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E966A96;
 Mon, 14 Dec 2020 18:02:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607965356;
 bh=z8GyPglPcj9uAZ1/S+NlVLpegHDnF+BKem46K6Db2NU=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LA54MwRQI+1f/94IBXFg5ge1UJ8jpUh7pbzSnheczrukISmKvqY7kQQRhpe8m7CUl
 gQtNKJVpHdfewARzItlJI/sCukbCsBAq1AjXCQAZo+5fLwNSl0qMe9Kbzb8LvvBoCl
 Aq63XRSEI7lnjUZ4f4OqEC1dHJhBxOZL1PpHdTh8=
Subject: Re: [PATCH 6/9] drm: rcar-du: Embed drm_device in rcar_du_device
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-7-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <d1b4fa84-85b2-9353-b0f9-5b4f3ccb829a@ideasonboard.com>
Date: Mon, 14 Dec 2020 17:02:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201204220139.15272-7-laurent.pinchart+renesas@ideasonboard.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 04/12/2020 22:01, Laurent Pinchart wrote:
> Embedding drm_device in rcar_du_device allows usage of the DRM managed
> API to allocate both structures in one go, simplifying error handling.

No point making multiple allocations unnecessarily...

LGTM.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c      |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c       | 33 +++++++++------------
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h       |  5 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c   |  4 +--
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c       |  4 +--
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c     |  6 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c       |  6 ++--
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c |  2 +-
>  8 files changed, 29 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index e23b9c7b4afe..9a099c0fe1d4 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -1251,7 +1251,7 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>  	else
>  		primary = &rgrp->planes[swindex % 2].plane;
>  
> -	ret = drm_crtc_init_with_planes(rcdu->ddev, crtc, primary, NULL,
> +	ret = drm_crtc_init_with_planes(&rcdu->ddev, crtc, primary, NULL,
>  					rcdu->info->gen <= 2 ?
>  					&crtc_funcs_gen2 : &crtc_funcs_gen3,
>  					NULL);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 1490ec182646..4ab99ac49891 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -18,10 +18,11 @@
>  #include <linux/wait.h>
>  
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
> -#include <drm/drm_drv.h>
>  #include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  
>  #include "rcar_du_drv.h"
> @@ -529,14 +530,14 @@ static int rcar_du_pm_suspend(struct device *dev)
>  {
>  	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
>  
> -	return drm_mode_config_helper_suspend(rcdu->ddev);
> +	return drm_mode_config_helper_suspend(&rcdu->ddev);
>  }
>  
>  static int rcar_du_pm_resume(struct device *dev)
>  {
>  	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
>  
> -	return drm_mode_config_helper_resume(rcdu->ddev);
> +	return drm_mode_config_helper_resume(&rcdu->ddev);
>  }
>  #endif
>  
> @@ -551,7 +552,7 @@ static const struct dev_pm_ops rcar_du_pm_ops = {
>  static int rcar_du_remove(struct platform_device *pdev)
>  {
>  	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
> -	struct drm_device *ddev = rcdu->ddev;
> +	struct drm_device *ddev = &rcdu->ddev;
>  
>  	drm_dev_unregister(ddev);
>  
> @@ -565,14 +566,14 @@ static int rcar_du_remove(struct platform_device *pdev)
>  static int rcar_du_probe(struct platform_device *pdev)
>  {
>  	struct rcar_du_device *rcdu;
> -	struct drm_device *ddev;
>  	struct resource *mem;
>  	int ret;
>  
>  	/* Allocate and initialize the R-Car device structure. */
> -	rcdu = devm_kzalloc(&pdev->dev, sizeof(*rcdu), GFP_KERNEL);
> -	if (rcdu == NULL)
> -		return -ENOMEM;
> +	rcdu = devm_drm_dev_alloc(&pdev->dev, &rcar_du_driver,
> +				  struct rcar_du_device, ddev);
> +	if (IS_ERR(rcdu))
> +		return PTR_ERR(rcdu);
>  
>  	rcdu->dev = &pdev->dev;
>  	rcdu->info = of_device_get_match_data(rcdu->dev);
> @@ -586,12 +587,7 @@ static int rcar_du_probe(struct platform_device *pdev)
>  		return PTR_ERR(rcdu->mmio);
>  
>  	/* DRM/KMS objects */
> -	ddev = drm_dev_alloc(&rcar_du_driver, &pdev->dev);
> -	if (IS_ERR(ddev))
> -		return PTR_ERR(ddev);
> -
> -	rcdu->ddev = ddev;
> -	ddev->dev_private = rcdu;
> +	rcdu->ddev.dev_private = rcdu;
>  
>  	ret = rcar_du_modeset_init(rcdu);
>  	if (ret < 0) {
> @@ -601,25 +597,24 @@ static int rcar_du_probe(struct platform_device *pdev)
>  		goto error;
>  	}
>  
> -	ddev->irq_enabled = 1;
> +	rcdu->ddev.irq_enabled = 1;
>  
>  	/*
>  	 * Register the DRM device with the core and the connectors with
>  	 * sysfs.
>  	 */
> -	ret = drm_dev_register(ddev, 0);
> +	ret = drm_dev_register(&rcdu->ddev, 0);
>  	if (ret)
>  		goto error;
>  
>  	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
>  
> -	drm_fbdev_generic_setup(ddev, 32);
> +	drm_fbdev_generic_setup(&rcdu->ddev, 32);
>  
>  	return 0;
>  
>  error:
> -	rcar_du_remove(pdev);
> -
> +	drm_kms_helper_poll_fini(&rcdu->ddev);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 71732fc5df8f..e5b6f456357e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -13,6 +13,8 @@
>  #include <linux/kernel.h>
>  #include <linux/wait.h>
>  
> +#include <drm/drm_device.h>
> +
>  #include "rcar_cmm.h"
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_group.h"
> @@ -21,7 +23,6 @@
>  struct clk;
>  struct device;
>  struct drm_bridge;
> -struct drm_device;
>  struct drm_property;
>  struct rcar_du_device;
>  struct rcar_du_encoder;
> @@ -80,7 +81,7 @@ struct rcar_du_device {
>  
>  	void __iomem *mmio;
>  
> -	struct drm_device *ddev;
> +	struct drm_device ddev;
>  
>  	struct rcar_du_crtc crtcs[RCAR_DU_MAX_CRTCS];
>  	unsigned int num_crtcs;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 7c491ff72cd2..e4f35a88d00f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -120,12 +120,12 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  		}
>  	}
>  
> -	ret = drm_encoder_init(rcdu->ddev, encoder, &rcar_du_encoder_funcs,
> +	ret = drm_encoder_init(&rcdu->ddev, encoder, &rcar_du_encoder_funcs,
>  			       DRM_MODE_ENCODER_NONE, NULL);
>  	if (ret < 0)
>  		goto error;
>  
> -	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_encoder_release,
> +	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_encoder_release,
>  				       renc);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 72dda446355f..57bb0dc22807 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -583,7 +583,7 @@ static int rcar_du_properties_init(struct rcar_du_device *rcdu)
>  	 * or enable source color keying (1).
>  	 */
>  	rcdu->props.colorkey =
> -		drm_property_create_range(rcdu->ddev, 0, "colorkey",
> +		drm_property_create_range(&rcdu->ddev, 0, "colorkey",
>  					  0, 0x01ffffff);
>  	if (rcdu->props.colorkey == NULL)
>  		return -ENOMEM;
> @@ -752,7 +752,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  		DU0_REG_OFFSET, DU2_REG_OFFSET
>  	};
>  
> -	struct drm_device *dev = rcdu->ddev;
> +	struct drm_device *dev = &rcdu->ddev;
>  	struct drm_encoder *encoder;
>  	unsigned int dpad0_sources;
>  	unsigned int num_encoders;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index a0021fc25b27..5f69ff4502c1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -773,9 +773,9 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>  
>  		plane->group = rgrp;
>  
> -		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
> -					       &rcar_du_plane_funcs, formats,
> -					       ARRAY_SIZE(formats),
> +		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
> +					       crtcs, &rcar_du_plane_funcs,
> +					       formats, ARRAY_SIZE(formats),
>  					       NULL, type, NULL);
>  		if (ret < 0)
>  			return ret;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 78a886651d9f..53221d8473c1 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -375,7 +375,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  
>  	vsp->vsp = &pdev->dev;
>  
> -	ret = drmm_add_action_or_reset(rcdu->ddev, rcar_du_vsp_cleanup, vsp);
> +	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_vsp_cleanup, vsp);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -402,8 +402,8 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  		plane->vsp = vsp;
>  		plane->index = i;
>  
> -		ret = drm_universal_plane_init(rcdu->ddev, &plane->plane, crtcs,
> -					       &rcar_du_vsp_plane_funcs,
> +		ret = drm_universal_plane_init(&rcdu->ddev, &plane->plane,
> +					       crtcs, &rcar_du_vsp_plane_funcs,
>  					       rcar_du_vsp_formats,
>  					       ARRAY_SIZE(rcar_du_vsp_formats),
>  					       NULL, type, NULL);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> index 04efa78d70b6..c79d1259e49b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_writeback.c
> @@ -204,7 +204,7 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
>  	drm_connector_helper_add(&wb_conn->base,
>  				 &rcar_du_wb_conn_helper_funcs);
>  
> -	return drm_writeback_connector_init(rcdu->ddev, wb_conn,
> +	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
>  					    &rcar_du_wb_conn_funcs,
>  					    &rcar_du_wb_enc_helper_funcs,
>  					    writeback_formats,
> 

-- 
Regards
--
Kieran
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
