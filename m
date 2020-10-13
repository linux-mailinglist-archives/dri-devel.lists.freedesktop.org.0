Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BFF28C8EA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 09:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4496E892;
	Tue, 13 Oct 2020 07:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403136E892
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 07:02:27 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09D6geo3027240; Tue, 13 Oct 2020 09:02:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=S2nHNvHbMokopb0Ic/PtvigwRTmfr5MwwhZRlZEscX8=;
 b=gcLw5U5LFjsWdpqtKA0GSh0ZaSyFTQ5mPA3sXcbhjO6RlR1Lupws9O15GB0PYI0e0hj3
 r7L5BnwiQHb96J7dOjIOnE7OsXQ43wjSmmQE7w2Mq0fJY8jQ0cKmlLAJNe5mmdyzzWs7
 /Qe6iarjFIpducTdOM8IMryiI0O6CyV+76yQcZ5S9GdHDQ25PST0tPIUvU2Y/+VXArdB
 Imkz7PdsaXAtn38W/V6ddL8oiUKKHOiXfZaV+kFMJrrEExczrvE+bq1tebhabfcrs/Zw
 u7Z+4lkxI1RqWUl3xRgxB0xLKslS78ZZTWcXvcphiQ1zKs/LAtqXtbQ0gQXOSTFxNm88 1w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3455c88npv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 09:02:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3433810002A;
 Tue, 13 Oct 2020 09:02:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag1node2.st.com [10.75.127.2])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3271B21E20E;
 Tue, 13 Oct 2020 09:02:19 +0200 (CEST)
Received: from SFHDAG2NODE1.st.com (10.75.127.4) by SFHDAG1NODE2.st.com
 (10.75.127.2) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 13 Oct
 2020 09:02:18 +0200
Received: from SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90]) by
 SFHDAG2NODE1.st.com ([fe80::4413:c8c:992b:bb90%20]) with mapi id
 15.00.1473.003; Tue, 13 Oct 2020 09:02:18 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/stm: dsi: Use dev_ based logging
Thread-Topic: [PATCH] drm/stm: dsi: Use dev_ based logging
Thread-Index: AQHWkyXKfX9abUar20eb4rtFyqzMOal5TviAgBvGx4A=
Date: Tue, 13 Oct 2020 07:02:18 +0000
Message-ID: <9bcaaa2a-1a84-9d64-14a3-75b5f3094483@st.com>
References: <20200925102233.18016-1-yannick.fertre@st.com>
 <20200925145149.GB1929717@ravnborg.org>
In-Reply-To: <20200925145149.GB1929717@ravnborg.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <249A09F460513341BEDEFDBB61763CB4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-13_02:2020-10-13,
 2020-10-13 signatures=0
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
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Antonio BORNEO <antonio.borneo@st.com>, Philippe CORNU <philippe.cornu@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,
thanks for the review. I'll send a new patch with the revert of function 
dsi_color_from_mipi.

Best regards

Yannick

On 9/25/20 4:51 PM, Sam Ravnborg wrote:
> Hi Yannick.
> 
> On Fri, Sep 25, 2020 at 12:22:33PM +0200, Yannick Fertre wrote:
>> Standardize on the dev_ based logging and drop the include of drm_print.h.
> The patchs filas to drop the include mentioned here.
> 
>> Remove useless dsi_color_from_mipi function.
> IMO the dsi_color_from_mipi() was nice, and inlining the helper
> is no gain for readability.
> 
> 	Sam
> 
>>
>> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
>> ---
>>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 87 ++++++++++++++-------------
>>   1 file changed, 45 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>> index 164f79ef6269..93fa8bfd3127 100644
>> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>> @@ -76,6 +76,7 @@ enum dsi_color {
>>   
>>   struct dw_mipi_dsi_stm {
>>   	void __iomem *base;
>> +	struct device *dev;
>>   	struct clk *pllref_clk;
>>   	struct dw_mipi_dsi *dsi;
>>   	u32 hw_version;
>> @@ -110,23 +111,6 @@ static inline void dsi_update_bits(struct dw_mipi_dsi_stm *dsi, u32 reg,
>>   	dsi_write(dsi, reg, (dsi_read(dsi, reg) & ~mask) | val);
>>   }
>>   
>> -static enum dsi_color dsi_color_from_mipi(enum mipi_dsi_pixel_format fmt)
>> -{
>> -	switch (fmt) {
>> -	case MIPI_DSI_FMT_RGB888:
>> -		return DSI_RGB888;
>> -	case MIPI_DSI_FMT_RGB666:
>> -		return DSI_RGB666_CONF2;
>> -	case MIPI_DSI_FMT_RGB666_PACKED:
>> -		return DSI_RGB666_CONF1;
>> -	case MIPI_DSI_FMT_RGB565:
>> -		return DSI_RGB565_CONF1;
>> -	default:
>> -		DRM_DEBUG_DRIVER("MIPI color invalid, so we use rgb888\n");
>> -	}
>> -	return DSI_RGB888;
>> -}
>> -
>>   static int dsi_pll_get_clkout_khz(int clkin_khz, int idf, int ndiv, int odf)
>>   {
>>   	int divisor = idf * odf;
>> @@ -205,14 +189,14 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>>   	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_RRS,
>>   				 SLEEP_US, TIMEOUT_US);
>>   	if (ret)
>> -		DRM_DEBUG_DRIVER("!TIMEOUT! waiting REGU, let's continue\n");
>> +		dev_dbg(dsi->dev, "!TIMEOUT! waiting REGU, let's continue\n");
>>   
>>   	/* Enable the DSI PLL & wait for its lock */
>>   	dsi_set(dsi, DSI_WRPCR, WRPCR_PLLEN);
>>   	ret = readl_poll_timeout(dsi->base + DSI_WISR, val, val & WISR_PLLLS,
>>   				 SLEEP_US, TIMEOUT_US);
>>   	if (ret)
>> -		DRM_DEBUG_DRIVER("!TIMEOUT! waiting PLL, let's continue\n");
>> +		dev_dbg(dsi->dev, "!TIMEOUT! waiting PLL, let's continue\n");
>>   
>>   	return 0;
>>   }
>> @@ -221,7 +205,7 @@ static void dw_mipi_dsi_phy_power_on(void *priv_data)
>>   {
>>   	struct dw_mipi_dsi_stm *dsi = priv_data;
>>   
>> -	DRM_DEBUG_DRIVER("\n");
>> +	dev_dbg(dsi->dev, "\n");
>>   
>>   	/* Enable the DSI wrapper */
>>   	dsi_set(dsi, DSI_WCR, WCR_DSIEN);
>> @@ -231,7 +215,7 @@ static void dw_mipi_dsi_phy_power_off(void *priv_data)
>>   {
>>   	struct dw_mipi_dsi_stm *dsi = priv_data;
>>   
>> -	DRM_DEBUG_DRIVER("\n");
>> +	dev_dbg(dsi->dev, "\n");
>>   
>>   	/* Disable the DSI wrapper */
>>   	dsi_clear(dsi, DSI_WCR, WCR_DSIEN);
>> @@ -244,6 +228,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>>   {
>>   	struct dw_mipi_dsi_stm *dsi = priv_data;
>>   	unsigned int idf, ndiv, odf, pll_in_khz, pll_out_khz;
>> +	enum mipi_dsi_pixel_format fmt;
>>   	int ret, bpp;
>>   	u32 val;
>>   
>> @@ -267,11 +252,11 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>>   
>>   	if (pll_out_khz > dsi->lane_max_kbps) {
>>   		pll_out_khz = dsi->lane_max_kbps;
>> -		DRM_WARN("Warning max phy mbps is used\n");
>> +		dev_warn(dsi->dev, "Warning max phy mbps is used\n");
>>   	}
>>   	if (pll_out_khz < dsi->lane_min_kbps) {
>>   		pll_out_khz = dsi->lane_min_kbps;
>> -		DRM_WARN("Warning min phy mbps is used\n");
>> +		dev_warn(dsi->dev, "Warning min phy mbps is used\n");
>>   	}
>>   
>>   	/* Compute best pll parameters */
>> @@ -281,7 +266,7 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>>   	ret = dsi_pll_get_params(dsi, pll_in_khz, pll_out_khz,
>>   				 &idf, &ndiv, &odf);
>>   	if (ret)
>> -		DRM_WARN("Warning dsi_pll_get_params(): bad params\n");
>> +		dev_warn(dsi->dev, "Warning dsi_pll_get_params(): bad params\n");
>>   
>>   	/* Get the adjusted pll out value */
>>   	pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
>> @@ -297,14 +282,31 @@ dw_mipi_dsi_get_lane_mbps(void *priv_data, const struct drm_display_mode *mode,
>>   	/* Select video mode by resetting DSIM bit */
>>   	dsi_clear(dsi, DSI_WCFGR, WCFGR_DSIM);
>>   
>> +	switch (format) {
>> +	case MIPI_DSI_FMT_RGB888:
>> +		fmt = DSI_RGB888;
>> +		break;
>> +	case MIPI_DSI_FMT_RGB666:
>> +		fmt = DSI_RGB666_CONF2;
>> +		break;
>> +	case MIPI_DSI_FMT_RGB666_PACKED:
>> +		fmt = DSI_RGB666_CONF1;
>> +		break;
>> +	case MIPI_DSI_FMT_RGB565:
>> +		fmt = DSI_RGB565_CONF1;
>> +		break;
>> +	default:
>> +		fmt = DSI_RGB888;
>> +		dev_err(dsi->dev, "MIPI color invalid, so we use rgb888\n");
>> +	}
>> +
>>   	/* Select the color coding */
>> -	dsi_update_bits(dsi, DSI_WCFGR, WCFGR_COLMUX,
>> -			dsi_color_from_mipi(format) << 1);
>> +	dsi_update_bits(dsi, DSI_WCFGR, WCFGR_COLMUX, fmt << 1);
>>   
>>   	*lane_mbps = pll_out_khz / 1000;
>>   
>> -	DRM_DEBUG_DRIVER("pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n",
>> -			 pll_in_khz, pll_out_khz, *lane_mbps);
>> +	dev_dbg(dsi->dev, "pll_in %ukHz pll_out %ukHz lane_mbps %uMHz\n", pll_in_khz, pll_out_khz,
>> +		*lane_mbps);
>>   
>>   	return 0;
>>   }
>> @@ -352,11 +354,13 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>>   	if (!dsi)
>>   		return -ENOMEM;
>>   
>> +	dsi->dev = dev;
>> +
>>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>   	dsi->base = devm_ioremap_resource(dev, res);
>>   	if (IS_ERR(dsi->base)) {
>>   		ret = PTR_ERR(dsi->base);
>> -		DRM_ERROR("Unable to get dsi registers %d\n", ret);
>> +		dev_err(dev, "Unable to get dsi registers %d\n", ret);
>>   		return ret;
>>   	}
>>   
>> @@ -364,13 +368,13 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>>   	if (IS_ERR(dsi->vdd_supply)) {
>>   		ret = PTR_ERR(dsi->vdd_supply);
>>   		if (ret != -EPROBE_DEFER)
>> -			DRM_ERROR("Failed to request regulator: %d\n", ret);
>> +			dev_err(dev, "Failed to request regulator: %d\n", ret);
>>   		return ret;
>>   	}
>>   
>>   	ret = regulator_enable(dsi->vdd_supply);
>>   	if (ret) {
>> -		DRM_ERROR("Failed to enable regulator: %d\n", ret);
>> +		dev_err(dev, "Failed to enable regulator: %d\n", ret);
>>   		return ret;
>>   	}
>>   
>> @@ -378,27 +382,26 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>>   	if (IS_ERR(dsi->pllref_clk)) {
>>   		ret = PTR_ERR(dsi->pllref_clk);
>>   		if (ret != -EPROBE_DEFER)
>> -			DRM_ERROR("Unable to get pll reference clock: %d\n",
>> -				  ret);
>> +			dev_err(dev, "Unable to get pll reference clock: %d\n", ret);
>>   		goto err_clk_get;
>>   	}
>>   
>>   	ret = clk_prepare_enable(dsi->pllref_clk);
>>   	if (ret) {
>> -		DRM_ERROR("Failed to enable pllref_clk: %d\n", ret);
>> +		dev_err(dev, "Failed to enable pllref_clk: %d\n", ret);
>>   		goto err_clk_get;
>>   	}
>>   
>>   	pclk = devm_clk_get(dev, "pclk");
>>   	if (IS_ERR(pclk)) {
>>   		ret = PTR_ERR(pclk);
>> -		DRM_ERROR("Unable to get peripheral clock: %d\n", ret);
>> +		dev_err(dev, "Unable to get peripheral clock: %d\n", ret);
>>   		goto err_dsi_probe;
>>   	}
>>   
>>   	ret = clk_prepare_enable(pclk);
>>   	if (ret) {
>> -		DRM_ERROR("%s: Failed to enable peripheral clk\n", __func__);
>> +		dev_err(dev, "%s: Failed to enable peripheral clk\n", __func__);
>>   		goto err_dsi_probe;
>>   	}
>>   
>> @@ -407,7 +410,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>>   
>>   	if (dsi->hw_version != HWVER_130 && dsi->hw_version != HWVER_131) {
>>   		ret = -ENODEV;
>> -		DRM_ERROR("bad dsi hardware version\n");
>> +		dev_err(dev, "bad dsi hardware version\n");
>>   		goto err_dsi_probe;
>>   	}
>>   
>> @@ -420,7 +423,7 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>>   	if (IS_ERR(dsi->dsi)) {
>>   		ret = PTR_ERR(dsi->dsi);
>>   		if (ret != -EPROBE_DEFER)
>> -			DRM_ERROR("Failed to initialize mipi dsi host: %d\n", ret);
>> +			dev_err(dev, "Failed to initialize mipi dsi host: %d\n", ret);
>>   		goto err_dsi_probe;
>>   	}
>>   
>> @@ -449,7 +452,7 @@ static int __maybe_unused dw_mipi_dsi_stm_suspend(struct device *dev)
>>   {
>>   	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
>>   
>> -	DRM_DEBUG_DRIVER("\n");
>> +	dev_dbg(dsi->dev, "\n");
>>   
>>   	clk_disable_unprepare(dsi->pllref_clk);
>>   	regulator_disable(dsi->vdd_supply);
>> @@ -462,18 +465,18 @@ static int __maybe_unused dw_mipi_dsi_stm_resume(struct device *dev)
>>   	struct dw_mipi_dsi_stm *dsi = dw_mipi_dsi_stm_plat_data.priv_data;
>>   	int ret;
>>   
>> -	DRM_DEBUG_DRIVER("\n");
>> +	dev_dbg(dsi->dev, "\n");
>>   
>>   	ret = regulator_enable(dsi->vdd_supply);
>>   	if (ret) {
>> -		DRM_ERROR("Failed to enable regulator: %d\n", ret);
>> +		dev_err(dev, "Failed to enable regulator: %d\n", ret);
>>   		return ret;
>>   	}
>>   
>>   	ret = clk_prepare_enable(dsi->pllref_clk);
>>   	if (ret) {
>>   		regulator_disable(dsi->vdd_supply);
>> -		DRM_ERROR("Failed to enable pllref_clk: %d\n", ret);
>> +		dev_err(dev, "Failed to enable pllref_clk: %d\n", ret);
>>   		return ret;
>>   	}
>>   
>> -- 
>> 2.17.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
