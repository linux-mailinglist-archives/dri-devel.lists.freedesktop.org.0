Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399AD61EA35
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 05:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD02F10E08F;
	Mon,  7 Nov 2022 04:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB3B10E08F;
 Mon,  7 Nov 2022 04:27:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A73ikK3011638; Mon, 7 Nov 2022 04:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JSizoXzr70KqY0WUH64+rkHsaXR10syEdTHNili8OCE=;
 b=CBuG9pFT45Hr+yCgo08ZqKS5eJUHHivx99HYjs8yXw9NdsNfF5vDAATaFaZ3tNxPm5hI
 FwXr60C7NEt17Zq6UZ7hkzPdWqEeo7QDqK/jRR0uEYcA1JCGT+/VCGqs9ClHD3h2GBd6
 WDPPE3RYnZ29Kx4RO/gzgJlDPOQ9cANvQXRoQNx7GxSojLNs/0w92qL3QRV1LF/udpyR
 7eDQYUW3At//bbOFphYkVqop//PegwZflnetLd3p71RP3UJnrIskVRq52zdrD5kcZzwa
 o5dYWnzhRJdJajjxbP3n0y5o4egGQ90+M8Aa4ztNgxTMEW1DZ5Ek/zdiAI6bkYCcYiJv Zg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kppndrc7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 04:27:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A74RDWI002014
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 7 Nov 2022 04:27:13 GMT
Received: from [10.111.172.54] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Sun, 6 Nov 2022
 20:27:09 -0800
Message-ID: <5b7492e2-e635-d3ea-6085-dacbc91db9cb@quicinc.com>
Date: Sun, 6 Nov 2022 20:27:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/5] drm/msm/dsi: add support for DSI-PHY on SM8350 and
 SM8450
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
 <20220922113016.355188-2-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220922113016.355188-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pWMrz64ix2q4u62ZVNkp9yoqB_vsMh42
X-Proofpoint-GUID: pWMrz64ix2q4u62ZVNkp9yoqB_vsMh42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_16,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211070035
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/22/2022 4:30 AM, Dmitry Baryshkov wrote:
> SM8350 and SM8450 use 5nm DSI PHYs, which share register definitions
> with 7nm DSI PHYs. Rather than duplicating the driver, handle 5nm
> variants inside the common 5+7nm driver.

I do realize that there is common code across PHYs but i am concerned 
about this type of unification of phy drivers.

If we have features which are PHY sequence dependent such as ULPS, this 
will just complicate things for us.

Also some PHY registers might get added some might get removed across 
chipsets as this is the most frequently changed component.

Even in this patch, I see this added to dsi_7nm_phy_disable()

 > +	/* Turn off REFGEN Vote */
 > +        dsi_phy_write(base + 
REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x0);
 > +        wmb();
 > +        /* Delay to ensure HW removes vote before PHY shut down */
 > +        udelay(2);
 > +

What would be the impact of writing this for the existing 7nm PHY?

I am having some access issues to check the software interface so wanted 
to check.

> 
> Co-developed-by: Robert Foss <robert.foss@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/Kconfig               |   6 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |   4 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |   2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 132 ++++++++++++++++++++--
>   4 files changed, 131 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 4e0cbd682725..e6c5dfbad009 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -140,12 +140,12 @@ config DRM_MSM_DSI_10NM_PHY
>   	  Choose this option if DSI PHY on SDM845 is used on the platform.
>   
>   config DRM_MSM_DSI_7NM_PHY
> -	bool "Enable DSI 7nm PHY driver in MSM DRM"
> +	bool "Enable DSI 7nm/5nm PHY driver in MSM DRM"
>   	depends on DRM_MSM_DSI
>   	default y
>   	help
> -	  Choose this option if DSI PHY on SM8150/SM8250/SC7280 is used on
> -	  the platform.
> +	  Choose this option if DSI PHY on SM8150/SM8250/SM8350/SM8450/SC7280
> +	  is used on the platform.
>   
>   config DRM_MSM_HDMI
>   	bool "Enable HDMI support in MSM DRM driver"
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 7fc0975cb869..97cf6b8b34cc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -567,6 +567,10 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>   	  .data = &dsi_phy_7nm_8150_cfgs },
>   	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
>   	  .data = &dsi_phy_7nm_7280_cfgs },
> +	{ .compatible = "qcom,dsi-phy-5nm-8350",
> +	  .data = &dsi_phy_5nm_8350_cfgs },
> +	{ .compatible = "qcom,dsi-phy-5nm-8450",
> +	  .data = &dsi_phy_5nm_8450_cfgs },
>   #endif
>   	{}
>   };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 60a99c6525b2..654cbfa14d6e 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -56,6 +56,8 @@ extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
>   
>   struct msm_dsi_dphy_timing {
>   	u32 clk_zero;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 9e7fa7d88ead..1696ff150b9e 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -39,8 +39,14 @@
>   #define VCO_REF_CLK_RATE		19200000
>   #define FRAC_BITS 18
>   
> +/* Hardware is pre V4.1 */
> +#define DSI_PHY_7NM_QUIRK_PRE_V4_1	BIT(0)
>   /* Hardware is V4.1 */
> -#define DSI_PHY_7NM_QUIRK_V4_1		BIT(0)
> +#define DSI_PHY_7NM_QUIRK_V4_1		BIT(1)
> +/* Hardware is V4.2 */
> +#define DSI_PHY_7NM_QUIRK_V4_2		BIT(2)
> +/* Hardware is V4.3 */
> +#define DSI_PHY_7NM_QUIRK_V4_3		BIT(3)
>   
>   struct dsi_pll_config {
>   	bool enable_ssc;
> @@ -116,7 +122,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
>   	dec_multiple = div_u64(pll_freq * multiplier, divider);
>   	dec = div_u64_rem(dec_multiple, multiplier, &frac);
>   
> -	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1))
> +	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)
>   		config->pll_clock_inverters = 0x28;
>   	else if (pll_freq <= 1000000000ULL)
>   		config->pll_clock_inverters = 0xa0;
> @@ -197,16 +203,25 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
>   	void __iomem *base = pll->phy->pll_base;
>   	u8 analog_controls_five_1 = 0x01, vco_config_1 = 0x00;
>   
> -	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> +	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
>   		if (pll->vco_current_rate >= 3100000000ULL)
>   			analog_controls_five_1 = 0x03;
>   
> +	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>   		if (pll->vco_current_rate < 1520000000ULL)
>   			vco_config_1 = 0x08;
>   		else if (pll->vco_current_rate < 2990000000ULL)
>   			vco_config_1 = 0x01;
>   	}
>   
> +	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) ||
> +	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3)) {
> +		if (pll->vco_current_rate < 1520000000ULL)
> +			vco_config_1 = 0x08;
> +		else if (pll->vco_current_rate >= 2990000000ULL)
> +			vco_config_1 = 0x01;
> +	}
> +
>   	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_ANALOG_CONTROLS_FIVE_1,
>   		      analog_controls_five_1);
>   	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_VCO_CONFIG_1, vco_config_1);
> @@ -231,9 +246,9 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
>   	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PFILT, 0x2f);
>   	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT, 0x2a);
>   	dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_IFILT,
> -		  pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1 ? 0x3f : 0x22);
> +		  !(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) ? 0x3f : 0x22);
>   
> -	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> +	if (!(pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)) {
>   		dsi_phy_write(base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
>   		if (pll->slave)
>   			dsi_phy_write(pll->slave->phy->pll_base + REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE, 0x22);
> @@ -788,7 +803,7 @@ static void dsi_phy_hw_v4_0_lane_settings(struct msm_dsi_phy *phy)
>   	const u8 *tx_dctrl = tx_dctrl_0;
>   	void __iomem *lane_base = phy->lane_base;
>   
> -	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1)
> +	if (!(phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1))
>   		tx_dctrl = tx_dctrl_1;
>   
>   	/* Strength ctrl settings */
> @@ -844,6 +859,12 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   	if (dsi_phy_hw_v4_0_is_pll_on(phy))
>   		pr_warn("PLL turned on before configuring PHY\n");
>   
> +	/* Request for REFGEN READY */
> +	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
> +		dsi_phy_write(phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x1);
> +		udelay(500);
> +	}
> +
>   	/* wait for REFGEN READY */
>   	ret = readl_poll_timeout_atomic(base + REG_DSI_7nm_PHY_CMN_PHY_STATUS,
>   					status, (status & BIT(0)),
> @@ -858,23 +879,53 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   	/* Alter PHY configurations if data rate less than 1.5GHZ*/
>   	less_than_1500_mhz = (clk_req->bitclk_rate <= 1500000000);
>   
> -	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
> -		vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
> +	if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) {
> +		if (phy->cphy_mode) {
> +			vreg_ctrl_0 = 0x51;
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
> +			glbl_str_swi_cal_sel_ctrl = 0x00;
> +			glbl_hstx_str_ctrl_0 = 0x00;
> +		} else {
> +			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
> +			glbl_str_swi_cal_sel_ctrl = 0x00;
> +			glbl_hstx_str_ctrl_0 = 0x88;
> +		}
> +	} else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_2) {
> +		if (phy->cphy_mode) {
> +			vreg_ctrl_0 = 0x51;
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x01;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3b;
> +			glbl_str_swi_cal_sel_ctrl = 0x00;
> +			glbl_hstx_str_ctrl_0 = 0x00;
> +		} else {
> +			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3c :  0x00;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x39;
> +			glbl_str_swi_cal_sel_ctrl = 0x00;
> +			glbl_hstx_str_ctrl_0 = 0x88;
> +		}
> +	} else if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_1) {
>   		if (phy->cphy_mode) {
> +			vreg_ctrl_0 = 0x51;
>   			glbl_rescode_top_ctrl = 0x00;
>   			glbl_rescode_bot_ctrl = 0x3c;
>   		} else {
> +			vreg_ctrl_0 = less_than_1500_mhz ? 0x53 : 0x52;
>   			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3d :  0x00;
>   			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x39 :  0x3c;
>   		}
>   		glbl_str_swi_cal_sel_ctrl = 0x00;
>   		glbl_hstx_str_ctrl_0 = 0x88;
>   	} else {
> -		vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
>   		if (phy->cphy_mode) {
> +			vreg_ctrl_0 = 0x51;
>   			glbl_str_swi_cal_sel_ctrl = 0x03;
>   			glbl_hstx_str_ctrl_0 = 0x66;
>   		} else {
> +			vreg_ctrl_0 = less_than_1500_mhz ? 0x5B : 0x59;
>   			glbl_str_swi_cal_sel_ctrl = less_than_1500_mhz ? 0x03 : 0x00;
>   			glbl_hstx_str_ctrl_0 = less_than_1500_mhz ? 0x66 : 0x88;
>   		}
> @@ -883,7 +934,6 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   	}
>   
>   	if (phy->cphy_mode) {
> -		vreg_ctrl_0 = 0x51;
>   		vreg_ctrl_1 = 0x55;
>   		glbl_pemph_ctrl_0 = 0x11;
>   		lane_ctrl0 = 0x17;
> @@ -1017,6 +1067,13 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>   		pr_warn("Turning OFF PHY while PLL is on\n");
>   
>   	dsi_phy_hw_v4_0_config_lpcdrx(phy, false);
> +
> +	/* Turn off REFGEN Vote */
> +        dsi_phy_write(base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10, 0x0);
> +        wmb();
> +        /* Delay to ensure HW removes vote before PHY shut down */
> +        udelay(2);
> +
>   	data = dsi_phy_read(base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>   
>   	/* disable all lanes */
> @@ -1079,6 +1136,7 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs = {
>   	.max_pll_rate = 3500000000UL,
>   	.io_start = { 0xae94400, 0xae96400 },
>   	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_PRE_V4_1,
>   };
>   
>   const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
> @@ -1102,3 +1160,57 @@ const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs = {
>   	.num_dsi_phy = 1,
>   	.quirks = DSI_PHY_7NM_QUIRK_V4_1,
>   };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs = {
> +	.has_phy_lane = true,
> +	.reg_cfg = {
> +		.num = 1,
> +		.regs = {
> +			{"vdds", 37550, 0},
> +		},
> +	},
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae94400, 0xae96400 },
> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V4_2,
> +};
> +
> +const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
> +	.has_phy_lane = true,
> +	.reg_cfg = {
> +		.num = 1,
> +		.regs = {
> +			{"vdds", 97800, 0},
> +		},
> +	},
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae94400, 0xae96400 },
> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
> +};
