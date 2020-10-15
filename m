Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2134328F32C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 15:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD016ECFE;
	Thu, 15 Oct 2020 13:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB7596ECFE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 13:27:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FDQxtv012959; Thu, 15 Oct 2020 15:26:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=4lg19kwcV/DkO8PZfoEA4b+u0/FIjuInIWGXRPQPkck=;
 b=yGGMasMj3SR0QCa/zeUBGBoqCkfNmVXEBl/zSnzqC7+teeI7i4IAplp5UWl69HA38jjD
 vy+aX/o3TjMBXG2wxKHoLWFU5Mscht0N2Bm/UOZX2a1BmaoZZyvQ+9G9Aza3DLunBItB
 mtljXzeaTSUkI4MAC0IPrGAEINj12+m/fwo/+Fk3/uyKV14hPskBKgSx4lPtoFigXj+Q
 Np7p+FtwkUC8zBEFDMz8lQ4771gpWtKjDTAgXYmYr5uJ4D2KC/ulYWmSatJCjQjjcAFk
 U5e51onekUez8JRR6qdJrbayDQV4X7nD1tmnn0T76cRXoh1Y0QNdUeiL28FIoJdd7T5/ 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3455c8sv0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 15:26:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EFF810002A;
 Thu, 15 Oct 2020 15:26:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node1.st.com [10.75.127.1])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3E90E2A558D;
 Thu, 15 Oct 2020 15:26:51 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG1NODE1.st.com
 (10.75.127.1) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 15:26:50 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Thu, 15 Oct 2020 15:26:50 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Antonio BORNEO
 <antonio.borneo@st.com>, Thierry Reding <thierry.reding@gmail.com>, "Sam
 Ravnborg" <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/stm: dsi: Use dev_ based logging
Thread-Topic: [PATCH v2] drm/stm: dsi: Use dev_ based logging
Thread-Index: AQHWoTZUiUdL8rRkXE2yfHM09kUQBKmYibkA
Date: Thu, 15 Oct 2020 13:26:50 +0000
Message-ID: <dd1b6916-db7e-3087-ffd9-5a22c85313d1@st.com>
References: <20201013075605.5103-1-yannick.fertre@st.com>
In-Reply-To: <20201013075605.5103-1-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.50]
Content-ID: <85DEFE9F44586F4892A65E091ECEE11B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_08:2020-10-14,
 2020-10-15 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/13/20 9:56 AM, Yannick Fertre wrote:
> Standardize on the dev_ based logging.
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
> Changes in v2:
> 	- restore function dsi_color_from_mipi.
> 	- reword commit.
> 
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 55 ++++++++++++++-------------
>   1 file changed, 29 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index 164f79ef6269..a5a87c89aa07 100644
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
> @@ -299,12 +301,12 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
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
> +	dev_dbg(dsi->dev, "pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n", pll_in_khz, pll_out_khz,
> +		*lane_mbps);

Hi Yannick,
And thank you for your patch.

You forgot to take into account the minor comment from Joe Perches.

Anyway,
Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
Thank you
Philippe :-)

>   
>   	return 0;
>   }
> @@ -352,11 +354,13 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
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
> @@ -364,13 +368,13 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   	if (IS_ERR(dsi->vdd_supply)) {
>   		ret = PTR_ERR(dsi->vdd_supply);
>   		if (ret != -EPROBE_DEFER)
> -			DRM_ERROR("Failed to request regulator: %d\n", ret);
> +			dev_err(dev, "Failed to request regulator: %d\n", ret);
>   		return ret;
>   	}
>   
>   	ret = regulator_enable(dsi->vdd_supply);
>   	if (ret) {
> -		DRM_ERROR("Failed to enable regulator: %d\n", ret);
> +		dev_err(dev, "Failed to enable regulator: %d\n", ret);
>   		return ret;
>   	}
>   
> @@ -378,27 +382,26 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   	if (IS_ERR(dsi->pllref_clk)) {
>   		ret = PTR_ERR(dsi->pllref_clk);
>   		if (ret != -EPROBE_DEFER)
> -			DRM_ERROR("Unable to get pll reference clock: %d\n",
> -				  ret);
> +			dev_err(dev, "Unable to get pll reference clock: %d\n", ret);
>   		goto err_clk_get;
>   	}
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
> @@ -407,7 +410,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   
>   	if (dsi->hw_version != HWVER_130 && dsi->hw_version != HWVER_131) {
>   		ret = -ENODEV;
> -		DRM_ERROR("bad dsi hardware version\n");
> +		dev_err(dev, "bad dsi hardware version\n");
>   		goto err_dsi_probe;
>   	}
>   
> @@ -420,7 +423,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   	if (IS_ERR(dsi->dsi)) {
>   		ret = PTR_ERR(dsi->dsi);
>   		if (ret != -EPROBE_DEFER)
> -			DRM_ERROR("Failed to initialize mipi dsi host: %d\n", ret);
> +			dev_err(dev, "Failed to initialize mipi dsi host: %d\n", ret);
>   		goto err_dsi_probe;
>   	}
>   
> @@ -449,7 +452,7 @@ static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
>   {
>   	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
>   
> -	DRM_DEBUG_DRIVER("\n");
> +	dev_dbg(dsi->dev, "\n");
>   
>   	clk_disable_unprepare(dsi->pllref_clk);
>   	regulator_disable(dsi->vdd_supply);
> @@ -462,18 +465,18 @@ static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
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
