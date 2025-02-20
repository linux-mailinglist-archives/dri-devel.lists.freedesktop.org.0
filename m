Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37969A3CE3F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 01:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239C510E0E1;
	Thu, 20 Feb 2025 00:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HUA0S5hb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520B410E0CD;
 Thu, 20 Feb 2025 00:51:35 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JG2h05031359;
 Thu, 20 Feb 2025 00:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Rvg5fJvypgLrOzA+G5gGGSW10ruIAatc3OG1H6Aso1Y=; b=HUA0S5hbBJIZuOpE
 DJVeiFgbST1RqEFhxWWycq/MGZUr28zcgOa0v8IW03CLAznzu2wJkYwFTFlh90+q
 x5MPQgiVe7tcbcTvuoAAARB36WKo0SO7SKxFuJINN1zA9YzNAe0VgeD3+jKNH/uH
 AHgnvixVdZLDdUuVQpT5o4fX9h27bcddMVXDN9ulNUS53++J+c9TZCWUbR33Ix99
 41M4e1jb6I08rrU1Lj7NvmQpgJUFzpfB7N0adDyJaHNtDcq+zZCjXOwvfzkqPq7O
 Ngc5ElZFu3yzQIJ4sXn9QdEb0NgN+Fas99IHSKY81cAxxyoLLM88Um48TV056pCH
 k2+1vw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5cc2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2025 00:51:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K0pPE1022806
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Feb 2025 00:51:25 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 16:50:58 -0800
Message-ID: <e5b6b5cc-2afb-411d-903e-152a6a617d53@quicinc.com>
Date: Wed, 19 Feb 2025 16:50:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] drm/msm/dsi/phy: Add support for SM8750
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 "Marijn Suijten" <marijn.suijten@somainline.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek
 <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Srini Kandagatla
 <srinivas.kandagatla@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-11-d201dcdda6a4@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20250217-b4-sm8750-display-v2-11-d201dcdda6a4@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: VV-yU_mxzrB_kmmcSkyD8QBunU6gQzsD
X-Proofpoint-GUID: VV-yU_mxzrB_kmmcSkyD8QBunU6gQzsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200004
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



On 2/17/2025 8:41 AM, Krzysztof Kozlowski wrote:
> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with an
> incompatible hardware interface change:
> 
> ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> offsets were just switched.  Currently these registers are not used in
> the driver, so the easiest is to document both but keep them commented
> out to avoid conflict.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1.
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 79 ++++++++++++++++++++--
>   .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 14 ++++
>   4 files changed, 90 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index c0bcc68289633fd7506ce4f1f963655d862e8f08..60571237efc4d332959ac76ff1d6d6245f688469 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -593,6 +593,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>   	  .data = &dsi_phy_4nm_8550_cfgs },
>   	{ .compatible = "qcom,sm8650-dsi-phy-4nm",
>   	  .data = &dsi_phy_4nm_8650_cfgs },
> +	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
> +	  .data = &dsi_phy_3nm_8750_cfgs },
>   #endif
>   	{}
>   };
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 8985818bb2e0934e9084a420c90e2269c2e1c414..fdb6c648e16f25812a2948053f31186d4c0d4413 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -60,6 +60,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
>   
>   struct msm_dsi_dphy_timing {
>   	u32 clk_zero;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 6d287cfb0148bdb0b1c64675dfe7fa69d3faba2d..b626989cb3d505f1c53f212dba130e3d685fe59c 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -50,6 +50,8 @@
>   #define DSI_PHY_7NM_QUIRK_V4_3		BIT(3)
>   /* Hardware is V5.2 */
>   #define DSI_PHY_7NM_QUIRK_V5_2		BIT(4)
> +/* Hardware is V7.0 */
> +#define DSI_PHY_7NM_QUIRK_V7_0		BIT(5)
>   
>   struct dsi_pll_config {
>   	bool enable_ssc;
> @@ -128,9 +130,30 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_7nm *pll, struct dsi_pll_config
>   	dec_multiple = div_u64(pll_freq * multiplier, divider);
>   	dec = div_u64_rem(dec_multiple, multiplier, &frac);
>   
> -	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1)
> +	if (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_PRE_V4_1) {
>   		config->pll_clock_inverters = 0x28;
> -	else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
> +	} else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
> +		if (pll_freq < 163000000ULL)
> +			config->pll_clock_inverters = 0xa0;
> +		else if (pll_freq < 175000000ULL)
> +			config->pll_clock_inverters = 0x20;
> +		else if (pll_freq < 325000000ULL)
> +			config->pll_clock_inverters = 0xa0;
> +		else if (pll_freq < 350000000ULL)
> +			config->pll_clock_inverters = 0x20;
> +		else if (pll_freq < 650000000ULL)
> +			config->pll_clock_inverters = 0xa0;
> +		else if (pll_freq < 700000000ULL)
> +			config->pll_clock_inverters = 0x20;
> +		else if (pll_freq < 1300000000ULL)
> +			config->pll_clock_inverters = 0xa0;
> +		else if (pll_freq < 2500000000ULL)
> +			config->pll_clock_inverters = 0x20;
> +		else if (pll_freq < 4000000000ULL)
> +			config->pll_clock_inverters = 0x00;
> +		else
> +			config->pll_clock_inverters = 0x40;
> +	} else if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>   		if (pll_freq <= 1300000000ULL)
>   			config->pll_clock_inverters = 0xa0;
>   		else if (pll_freq <= 2500000000ULL)
> @@ -249,7 +272,8 @@ static void dsi_pll_config_hzindep_reg(struct dsi_pll_7nm *pll)
>   			vco_config_1 = 0x01;
>   	}
>   
> -	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
> +	if ((pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
> +	    (pll->phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
>   		if (pll->vco_current_rate < 1557000000ULL)
>   			vco_config_1 = 0x08;
>   		else
> @@ -624,6 +648,7 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>   static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>   {
>   	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(phy->vco_hw);
> +	void __iomem *base = phy->base;

Hi Krzysztof,

I see that this line was only previously removed in a patch that was in 
an older revision of your PHY_CMN_CLK_CFG[01] improvements series 
("drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk 
source").

Did you mean for this patch/series to be dependent on that patch? If so, 
can you make a note of that in the cover letter?

Thanks,

Jessica Zhang

>   	u32 data = 0x0;	/* internal PLL */
>   
>   	DBG("DSI PLL%d", pll_7nm->phy->id);
> @@ -633,6 +658,9 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>   		break;
>   	case MSM_DSI_PHY_MASTER:
>   		pll_7nm->slave = pll_7nm_list[(pll_7nm->phy->id + 1) % DSI_MAX];
> +		/* v7.0: Enable ATB_EN0 and alternate clock output to external phy */
> +		if (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)
> +			writel(0x07, base + REG_DSI_7nm_PHY_CMN_CTRL_5);
>   		break;
>   	case MSM_DSI_PHY_SLAVE:
>   		data = 0x1; /* external PLL */
> @@ -914,7 +942,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   
>   	/* Request for REFGEN READY */
>   	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
> -	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
> +	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
> +	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
>   		writel(0x1, phy->base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
>   		udelay(500);
>   	}
> @@ -948,7 +977,20 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   		lane_ctrl0 = 0x1f;
>   	}
>   
> -	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
> +	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
> +		if (phy->cphy_mode) {
> +			/* TODO: different for second phy */
> +			vreg_ctrl_0 = 0x57;
> +			vreg_ctrl_1 = 0x41;
> +			glbl_rescode_top_ctrl = 0x3d;
> +			glbl_rescode_bot_ctrl = 0x38;
> +		} else {
> +			vreg_ctrl_0 = 0x56;
> +			vreg_ctrl_1 = 0x19;
> +			glbl_rescode_top_ctrl = less_than_1500_mhz ? 0x3c :  0x03;
> +			glbl_rescode_bot_ctrl = less_than_1500_mhz ? 0x38 :  0x3c;
> +		}
> +	} else if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
>   		if (phy->cphy_mode) {
>   			vreg_ctrl_0 = 0x45;
>   			vreg_ctrl_1 = 0x41;
> @@ -1010,6 +1052,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   
>   	/* program CMN_CTRL_4 for minor_ver 2 chipsets*/
>   	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
> +	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0) ||
>   	    (readl(base + REG_DSI_7nm_PHY_CMN_REVISION_ID0) & (0xf0)) == 0x20)
>   		writel(0x04, base + REG_DSI_7nm_PHY_CMN_CTRL_4);
>   
> @@ -1124,7 +1167,8 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>   
>   	/* Turn off REFGEN Vote */
>   	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V4_3) ||
> -	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
> +	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2) ||
> +	    (phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V7_0)) {
>   		writel(0x0, base + REG_DSI_7nm_PHY_CMN_GLBL_DIGTOP_SPARE10);
>   		wmb();
>   		/* Delay to ensure HW removes vote before PHY shut down */
> @@ -1341,3 +1385,26 @@ const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs = {
>   	.num_dsi_phy = 2,
>   	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
>   };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_98000uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
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
> +	.io_start = { 0xae95000, 0xae97000 },
> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
> +};
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> index d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367..d62411961f5673e0a7a37b90cfc99962de83659e 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> @@ -26,6 +26,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>   	<reg32 offset="0x00028" name="CTRL_1"/>
>   	<reg32 offset="0x0002c" name="CTRL_2"/>
>   	<reg32 offset="0x00030" name="CTRL_3"/>
> +	<reg32 offset="0x001b0" name="CTRL_5"/>
>   	<reg32 offset="0x00034" name="LANE_CFG0"/>
>   	<reg32 offset="0x00038" name="LANE_CFG1"/>
>   	<reg32 offset="0x0003c" name="PLL_CNTRL"/>
> @@ -191,11 +192,24 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>   	<reg32 offset="0x01b0" name="COMMON_STATUS_ONE"/>
>   	<reg32 offset="0x01b4" name="COMMON_STATUS_TWO"/>
>   	<reg32 offset="0x01b8" name="BAND_SEL_CAL"/>
> +	<!--
> +	Starting from SM8750, offset moved from 0x01bc to 0x01cc, however
> +	we keep only one register map.  That's not a problem, so far,
> +        because this register is not used.  The register map should be split
> +        once it is going to be used.  Comment out the code to prevent
> +	any misuse due to the change in the offset.
>   	<reg32 offset="0x01bc" name="ICODE_ACCUM_STATUS_LOW"/>
> +	<reg32 offset="0x01cc" name="ICODE_ACCUM_STATUS_LOW"/>
> +	-->
>   	<reg32 offset="0x01c0" name="ICODE_ACCUM_STATUS_HIGH"/>
>   	<reg32 offset="0x01c4" name="FD_OUT_LOW"/>
>   	<reg32 offset="0x01c8" name="FD_OUT_HIGH"/>
> +	<!--
> +	Starting from SM8750, offset moved from 0x01cc to 0x01bc, however
> +	we keep only one register map.  See above comment.
>   	<reg32 offset="0x01cc" name="ALOG_OBSV_BUS_STATUS_1"/>
> +	<reg32 offset="0x01bc" name="ALOG_OBSV_BUS_STATUS_1"/>
> +	-->
>   	<reg32 offset="0x01d0" name="PLL_MISC_CONFIG"/>
>   	<reg32 offset="0x01d4" name="FLL_CONFIG"/>
>   	<reg32 offset="0x01d8" name="FLL_FREQ_ACQ_TIME"/>
> 
> -- 
> 2.43.0
> 

