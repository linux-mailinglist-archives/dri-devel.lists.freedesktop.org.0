Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB73A3309FC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 10:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF206E834;
	Mon,  8 Mar 2021 09:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3316E834
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 09:10:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12891mTe032543; Mon, 8 Mar 2021 10:10:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=tsMjJOhPvrssHU3XosBPfY8oVdtkhbbslA07x76rM/E=;
 b=wEdvm+Bfs6C54dQRSTGCLvURrvgrhWLVN2E8qQ07IA6sMQn8AVPYa1jkfem16bRcezwU
 K8LxNOzIzkmiFzd4gKNGhag3Mq/lpFlz9g+pzSbQPlnULX5wf50VSQbey1CVSsRQHGO4
 zFBcoq6FZnXIMktcGdi6gYvmPeiNF57QpRP37E3ne4VuCl3YR3uuQxvCe1rn3DQ8t2/O
 1JyN7N0uuh+0BdG1uAcs9BvOiKJ0/kWb9Mq8AbGbEvMk3hsqu2Loz0WbPPBP009/WmUk
 mUFusDjbt+6XATjrQm9xHX2jWD9hTq7kENTCnOCpmDXoV27v0a+M+n/TXNKx0lp58XL3 xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741y6h0rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 10:10:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1EB7010002A;
 Mon,  8 Mar 2021 10:10:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C2C123D713;
 Mon,  8 Mar 2021 10:10:22 +0100 (CET)
Received: from lmecxl0951.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Mar
 2021 10:10:20 +0100
Subject: Re: [PATCH 2/2] drm/stm: dsi: Use dev_ based logging
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>, "Yannick
 FERTRE" <yannick.fertre@st.com>, Philippe CORNU <philippe.cornu@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent ABRIOU
 <vincent.abriou@st.com>, Sam Ravnborg <sam@ravnborg.org>, Joe Perches
 <joe@perches.com>
References: <20210222092205.32086-1-raphael.gallais-pou@foss.st.com>
 <20210222092205.32086-3-raphael.gallais-pou@foss.st.com>
From: yannick Fertre <yannick.fertre@foss.st.com>
Message-ID: <c57f23df-4235-3cc0-bec2-9124546271d4@foss.st.com>
Date: Mon, 8 Mar 2021 10:10:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222092205.32086-3-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_04:2021-03-08,
 2021-03-08 signatures=0
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
Cc: Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

On 2/22/21 10:23 AM, Raphael GALLAIS-POU - foss wrote:
> From: Yannick Fertre <yannick.fertre@st.com>
> 
> Standardize on the dev_ based logging.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 49 ++++++++++++++-------------
>   1 file changed, 26 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index 8399d337589d..a7226bb3d0e8 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -76,6 +76,7 @@ enum dsi_color {
>   
>   struct dw_mipi_dsi_stm {
>   	void __iomem *base;
> +	struct device *dev;
>   	struct clk *pllref_clk;
>   	struct dw_mipi_dsi *dsi;
>   	u32 hw_version;
> @@ -110,7 +111,8 @@ static inline void dsi_update_bits(struct dw_mipi_dsi_stm *dsi, u32 reg,
>   	dsi_write(dsi, reg, (dsi_read(dsi, reg) & ~mask) | val);
>   }
>   
> -static enum dsi_color dsi_color_from_mipi(enum mipi_dsi_pixel_format fmt)
> +static enum dsi_color dsi_color_from_mipi(struct dw_mipi_dsi_stm *dsi,
> +					  enum mipi_dsi_pixel_format fmt)
>   {
>   	switch (fmt) {
>   	case MIPI_DSI_FMT_RGB888:
> @@ -122,7 +124,7 @@ static enum dsi_color dsi_color_from_mipi(enum mipi_dsi_pixel_format fmt)
>   	case MIPI_DSI_FMT_RGB565:
>   		return DSI_RGB565_CONF1;
>   	default:
> -		DRM_DEBUG_DRIVER("MIPI color invalid, so we use rgb888\n");
> +		dev_dbg(dsi->dev, "MIPI color invalid, so we use rgb888\n");
>   	}
>   	return DSI_RGB888;
>   }
> @@ -205,14 +207,14 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>   	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_RRS,
>   				 SLEEP_US, TIMEOUT_US);
>   	if (ret)
> -		DRM_DEBUG_DRIVER("!TIMEOUT! waiting REGU, let's continue\n");
> +		dev_dbg(dsi->dev, "!TIMEOUT! waiting REGU, let's continue\n");
>   
>   	/* Enable the DSI PLL & wait for its lock */
>   	dsi_set(dsi, DSI_WRPCR, WRPCR_PLLEN);
>   	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_PLLLS,
>   				 SLEEP_US, TIMEOUT_US);
>   	if (ret)
> -		DRM_DEBUG_DRIVER("!TIMEOUT! waiting PLL, let's continue\n");
> +		dev_dbg(dsi->dev, "!TIMEOUT! waiting PLL, let's continue\n");
>   
>   	return 0;
>   }
> @@ -221,7 +223,7 @@ static void dw_mipi_dsi_phy_power_on(void *priv_data)
>   {
>   	struct dw_mipi_dsi_stm *dsi = priv_data;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	dev_dbg(dsi->dev, "\n");
>   
>   	/* Enable the DSI wrapper */
>   	dsi_set(dsi, DSI_WCR, WCR_DSIEN);
> @@ -231,7 +233,7 @@ static void dw_mipi_dsi_phy_power_off(void *priv_data)
>   {
>   	struct dw_mipi_dsi_stm *dsi = priv_data;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	dev_dbg(dsi->dev, "\n");
>   
>   	/* Disable the DSI wrapper */
>   	dsi_clear(dsi, DSI_WCR, WCR_DSIEN);
> @@ -267,11 +269,11 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>   
>   	if (pll_out_khz > dsi->lane_max_kbps) {
>   		pll_out_khz = dsi->lane_max_kbps;
> -		DRM_WARN("Warning max phy mbps is used\n");
> +		dev_warn(dsi->dev, "Warning max phy mbps is used\n");
>   	}
>   	if (pll_out_khz < dsi->lane_min_kbps) {
>   		pll_out_khz = dsi->lane_min_kbps;
> -		DRM_WARN("Warning min phy mbps is used\n");
> +		dev_warn(dsi->dev, "Warning min phy mbps is used\n");
>   	}
>   
>   	/* Compute best pll parameters */
> @@ -281,7 +283,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>   	ret = dsi_pll_get_params(dsi, pll_in_khz, pll_out_khz,
>   				 &idf, &ndiv, &odf);
>   	if (ret)
> -		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
> +		dev_warn(dsi->dev, "Warning dsi_pll_get_params(): bad params\n");
>   
>   	/* Get the adjusted pll out value */
>   	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
> @@ -299,13 +301,12 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>   
>   	/* Select the color coding */
>   	dsi_update_bits(dsi, DSI_WCFGR, WCFGR_COLMUX,
> -			dsi_color_from_mipi(format) << 1);
> +			dsi_color_from_mipi(dsi, format) << 1);
>   
>   	*lane_mbps = pll_out_khz / 1000;
>   
> -	DRM_DEBUG_DRIVER("pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n",
> -			 pll_in_khz, pll_out_khz, *lane_mbps);
> -
> +	dev_dbg(dsi->dev, "pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n",
> +			pll_in_khz, pll_out_khz, *lane_mbps);
>   	return 0;
>   }
>   
> @@ -352,11 +353,13 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   	if (!dsi)
>   		return -ENOMEM;
>   
> +	dsi->dev = dev;
> +
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	dsi->base = devm_ioremap_resource(dev, res);
>   	if (IS_ERR(dsi->base)) {
>   		ret = PTR_ERR(dsi->base);
> -		DRM_ERROR("Unable to get dsi registers %d\n", ret);
> +		dev_err(dev, "Unable to get dsi registers %d\n", ret);
>   		return ret;
>   	}
>   
> @@ -369,7 +372,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   
>   	ret = regulator_enable(dsi->vdd_supply);
>   	if (ret) {
> -		DRM_ERROR("Failed to enable regulator: %d\n", ret);
> +		dev_err(dev, "Failed to enable regulator: %d\n", ret);
>   		return ret;
>   	}
>   
> @@ -382,20 +385,20 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   
>   	ret = clk_prepare_enable(dsi->pllref_clk);
>   	if (ret) {
> -		DRM_ERROR("Failed to enable pllref_clk: %d\n", ret);
> +		dev_err(dev, "Failed to enable pllref_clk: %d\n", ret);
>   		goto err_clk_get;
>   	}
>   
>   	pclk = devm_clk_get(dev, "pclk");
>   	if (IS_ERR(pclk)) {
>   		ret = PTR_ERR(pclk);
> -		DRM_ERROR("Unable to get peripheral clock: %d\n", ret);
> +		dev_err(dev, "Unable to get peripheral clock: %d\n", ret);
>   		goto err_dsi_probe;
>   	}
>   
>   	ret = clk_prepare_enable(pclk);
>   	if (ret) {
> -		DRM_ERROR("%s: Failed to enable peripheral clk\n", __func__);
> +		dev_err(dev, "%s: Failed to enable peripheral clk\n", __func__);
>   		goto err_dsi_probe;
>   	}
>   
> @@ -404,7 +407,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   
>   	if (dsi->hw_version != HWVER_130 && dsi->hw_version != HWVER_131) {
>   		ret = -ENODEV;
> -		DRM_ERROR("bad dsi hardware version\n");
> +		dev_err(dev, "bad dsi hardware version\n");
>   		goto err_dsi_probe;
>   	}
>   
> @@ -445,7 +448,7 @@ static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
>   {
>   	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	dev_dbg(dsi->dev, "\n");
>   
>   	clk_disable_unprepare(dsi->pllref_clk);
>   	regulator_disable(dsi->vdd_supply);
> @@ -458,18 +461,18 @@ static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
>   	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
>   	int ret;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	dev_dbg(dsi->dev, "\n");
>   
>   	ret = regulator_enable(dsi->vdd_supply);
>   	if (ret) {
> -		DRM_ERROR("Failed to enable regulator: %d\n", ret);
> +		dev_err(dev, "Failed to enable regulator: %d\n", ret);
>   		return ret;
>   	}
>   
>   	ret = clk_prepare_enable(dsi->pllref_clk);
>   	if (ret) {
>   		regulator_disable(dsi->vdd_supply);
> -		DRM_ERROR("Failed to enable pllref_clk: %d\n", ret);
> +		dev_err(dev, "Failed to enable pllref_clk: %d\n", ret);
>   		return ret;
>   	}
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
