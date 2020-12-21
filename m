Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE872DFC82
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 15:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E296E15C;
	Mon, 21 Dec 2020 14:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4463D6E15C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 14:00:53 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51AE72CF;
 Mon, 21 Dec 2020 15:00:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608559251;
 bh=fqkzhgsYvpmZM/4e1LXwV9L0/SihWrx8GpMzedHtcsU=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Uuz2PD7D9BfFZ4lvo8KdXWikyQcnBeS51nB9ScQm+hor89Zg3jh6D3ivD2s3S3emO
 3WKEXJYrpeHebYDrEDjsTUH+AnIKfiNuSFOnLPCgGWhbKnvZ3BLEJNmRfOLVuKXSXB
 /Kmq9d7njt3Ny4UJ58Neg4KrD3iOVgQOiDu4qEpo=
Subject: Re: [PATCH 2/4] drm: rcar-du: cmm: Provide 3D-CLU support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
References: <20201221015730.28333-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201221015730.28333-3-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <476c461a-b675-67ab-fb22-264eb1e7338d@ideasonboard.com>
Date: Mon, 21 Dec 2020 14:00:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201221015730.28333-3-laurent.pinchart+renesas@ideasonboard.com>
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 21/12/2020 01:57, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The CMM module provides a three-dimensional cubic look up table that
> converts three-color-component data into desired three color components
> by use of a lookup table.
> 
> While the 1D-LUT can only control each of three color components
> separately, the 3D-CLU can be used for specific color adjustment.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

For the updates since I wrote the patch:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_cmm.c | 52 ++++++++++++++++++++++++++++--
>  drivers/gpu/drm/rcar-du/rcar_cmm.h | 11 ++++---
>  2 files changed, 57 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.c b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> index ccc8c8b03bac..9a20728a3534 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.c
> @@ -17,9 +17,18 @@
>  
>  #define CM2_LUT_CTRL		0x0000
>  #define CM2_LUT_CTRL_LUT_EN	BIT(0)
> +
> +#define CM2_CLU_CTRL		0x0100
> +#define CM2_CLU_CTRL_CLU_EN	BIT(1)
> +#define CM2_CLU_CTRL_MVS	BIT(24)
> +#define CM2_CLU_CTRL_AAI	BIT(28)
> +
>  #define CM2_LUT_TBL_BASE	0x0600
>  #define CM2_LUT_TBL(__i)	(CM2_LUT_TBL_BASE + (__i) * 4)
>  
> +#define CM2_CLU_ADDR		0x0a00
> +#define CM2_CLU_DATA		0x0a04
> +
>  struct rcar_cmm {
>  	void __iomem *base;
>  
> @@ -30,6 +39,10 @@ struct rcar_cmm {
>  	struct {
>  		bool enabled;
>  	} lut;
> +
> +	struct {
> +		bool enabled;
> +	} clu;
>  };
>  
>  static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> @@ -72,13 +85,44 @@ static void rcar_cmm_lut_configure(struct rcar_cmm *rcmm,
>  	}
>  }
>  
> +static void rcar_cmm_clu_configure(struct rcar_cmm *rcmm,
> +				   const struct drm_color_lut *table)
> +{
> +	static const u32 cfg = CM2_CLU_CTRL_AAI
> +			     | CM2_CLU_CTRL_MVS
> +			     | CM2_CLU_CTRL_CLU_EN;
> +	bool enable = !!table;

Good, not sure why I was calculating this outside of the call.


> +
> +	if (rcmm->clu.enabled != enable) {
> +		rcar_cmm_write(rcmm, CM2_CLU_CTRL, enable ? cfg : 0);
> +		rcmm->clu.enabled = enable;
> +	}
> +
> +	if (table) {
> +		unsigned int i;
> +
> +		/* Utilise CM2_CLU_CTRL_AAI (auto-increment). */
> +		rcar_cmm_write(rcmm, CM2_CLU_ADDR, 0);
> +
> +		for (i = 0; i < CM2_CLU_SIZE; ++i) {
> +			const struct drm_color_lut *lut = &table[i];
> +
> +			u32 entry = drm_color_lut_extract(lut->red, 8) << 16
> +				  | drm_color_lut_extract(lut->green, 8) << 8
> +				  | drm_color_lut_extract(lut->blue, 8);
> +
> +			rcar_cmm_write(rcmm, CM2_CLU_DATA, entry);
> +		}
> +	}
> +}
> +
>  /*
>   * rcar_cmm_setup() - Configure the CMM unit
>   * @pdev: The platform device associated with the CMM instance
>   * @config: The CMM unit configuration
>   *
> - * Configure the CMM unit with the given configuration. Currently enabling,
> - * disabling and programming of the 1-D LUT unit is supported.
> + * Configure the CMM unit with the given configuration, handling both the
> + * 1-D LUT and the 3-D CLU.
>   *
>   * As rcar_cmm_setup() accesses the CMM registers the unit should be powered
>   * and its functional clock enabled. To guarantee this, before any call to
> @@ -96,6 +140,9 @@ int rcar_cmm_setup(struct platform_device *pdev,
>  	if (config->lut.update)
>  		rcar_cmm_lut_configure(rcmm, config->lut.table);
>  
> +	if (config->clu.update)
> +		rcar_cmm_clu_configure(rcmm, config->clu.table);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(rcar_cmm_setup);
> @@ -140,6 +187,7 @@ void rcar_cmm_disable(struct platform_device *pdev)
>  	struct rcar_cmm *rcmm = platform_get_drvdata(pdev);
>  
>  	rcar_cmm_lut_configure(rcmm, NULL);
> +	rcar_cmm_clu_configure(rcmm, NULL);
>  
>  	pm_runtime_put(&pdev->dev);
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_cmm.h b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> index f4b16535ec16..35f901158cec 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_cmm.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_cmm.h
> @@ -9,14 +9,15 @@
>  #define __RCAR_CMM_H__
>  
>  #define CM2_LUT_SIZE		256
> +#define CM2_CLU_SIZE		(17 * 17 * 17)
>  
>  struct drm_color_lut;
>  struct platform_device;
>  
>  /**
> - * struct rcar_cmm_table_config - CMM LUT configuration
> - * @update: When true, update the LUT configuration.
> - * @table: Table data. The LUT is enabled if non-NULL, and disabled
> + * struct rcar_cmm_table_config - CMM LUT and CLU configuration
> + * @update: When true, update the LUT or CLU configuration.
> + * @table: Table data. The LUT or CLU is enabled if non-NULL, and disabled
>   *	otherwise. The value is ignored if @update is false.
>   */
>  struct rcar_cmm_table_config {
> @@ -26,10 +27,12 @@ struct rcar_cmm_table_config {
>  
>  /**
>   * struct rcar_cmm_config - CMM configuration
> - * @lut: 1D-LUT configuration
> + * @lut: 1D LUT configuration
> + * @clu: 3D (cubic) LUT configuration
>   */
>  struct rcar_cmm_config {
>  	struct rcar_cmm_table_config lut;
> +	struct rcar_cmm_table_config clu;
>  };
>  
>  #if IS_ENABLED(CONFIG_DRM_RCAR_CMM)
> 

-- 
Regards
--
Kieran
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
