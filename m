Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3B1726A13
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 21:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9270F10E53E;
	Wed,  7 Jun 2023 19:46:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D18010E53E;
 Wed,  7 Jun 2023 19:46:42 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 357JT57k000503; Wed, 7 Jun 2023 19:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5G6HDYV61owlTxtOzctRQ3nN88GKhOoD0XA1tYt2JAs=;
 b=PgOT/HZXCbQa1kGYbLsNeVg+XA/ISyVi7VDGg3iEazwC/5Gfgdx1eXNwPCgb2vxCRUYg
 3gnx+6a72JCWpsQx2wkXuma3aQ0Yl9cSOHZhfcQZrYd2GqiaDtz2pW5dORmuRmBF30iD
 m4W/81yuUyFrcOCcPCAZtZh4xH91i5IbPQH0fecYIj9nvPXErCeG9CEjwrhh2EQVAz8v
 FaM4I4iKG1OaQmuK7MTdx1vVSHOSN0Zi+JXlzM7EYJvJs58dk8c+mWMrUTkax3Iiq4ht
 zPgFNrXTwhu9k+NV+fxLc5Ug/xGurKqw9xYbo5SIQIbAv0RSWHVmisC5l/Z8m9hD7koC 1Q== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r2a7k2sm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jun 2023 19:46:36 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 357JkZ6e026091
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 7 Jun 2023 19:46:35 GMT
Received: from [10.110.54.114] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 7 Jun 2023
 12:46:34 -0700
Message-ID: <51712e34-c964-a5b3-3df8-1af10c7751f6@quicinc.com>
Date: Wed, 7 Jun 2023 12:46:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH v3 6/7] drm/msm/dsi: Add phy configuration for
 MSM8226
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>
References: <20230308-msm8226-mdp-v3-0-b6284145d67a@z3ntu.xyz>
 <20230308-msm8226-mdp-v3-6-b6284145d67a@z3ntu.xyz>
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230308-msm8226-mdp-v3-6-b6284145d67a@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: JfdO3l81FXQYiHJVxQ4Of-WTisJFXX7-
X-Proofpoint-GUID: JfdO3l81FXQYiHJVxQ4Of-WTisJFXX7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_09,2023-06-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070171
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/1/2023 10:00 AM, Luca Weiss wrote:
> MSM8226 uses a modified PLL lock sequence compared to MSM8974, which is
> based on the function dsi_pll_enable_seq_m in the msm-3.10 kernel.
> 
> Worth noting that the msm-3.10 downstream kernel also will try other
> sequences in case this one doesn't work, but during testing it has shown
> that the _m sequence succeeds first time also:
> 
>    .pll_enable_seqs[0] = dsi_pll_enable_seq_m,
>    .pll_enable_seqs[1] = dsi_pll_enable_seq_m,
>    .pll_enable_seqs[2] = dsi_pll_enable_seq_d,
>    .pll_enable_seqs[3] = dsi_pll_enable_seq_d,
>    .pll_enable_seqs[4] = dsi_pll_enable_seq_f1,
>    .pll_enable_seqs[5] = dsi_pll_enable_seq_c,
>    .pll_enable_seqs[6] = dsi_pll_enable_seq_e,
> 
> We may need to expand this in the future.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  3 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 97 ++++++++++++++++++++++++++++++
>   3 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index bb09cbe8ff86..9d5795c58a98 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -541,6 +541,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>   	  .data = &dsi_phy_28nm_hpm_famb_cfgs },
>   	{ .compatible = "qcom,dsi-phy-28nm-lp",
>   	  .data = &dsi_phy_28nm_lp_cfgs },
> +	{ .compatible = "qcom,dsi-phy-28nm-8226",
> +	  .data = &dsi_phy_28nm_8226_cfgs },
>   #endif
>   #ifdef CONFIG_DRM_MSM_DSI_20NM_PHY
>   	{ .compatible = "qcom,dsi-phy-20nm",
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 7137a17ae523..8b640d174785 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -46,8 +46,9 @@ struct msm_dsi_phy_cfg {
>   extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_28nm_hpm_famb_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
> -extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
>   extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 4c1bf55c5f38..ceec7bb87bf1 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -37,6 +37,7 @@
>   
>   /* v2.0.0 28nm LP implementation */
>   #define DSI_PHY_28NM_QUIRK_PHY_LP	BIT(0)
> +#define DSI_PHY_28NM_QUIRK_PHY_8226	BIT(1)
>   
>   #define LPFR_LUT_SIZE			10
>   struct lpfr_cfg {
> @@ -377,6 +378,74 @@ static int dsi_pll_28nm_vco_prepare_hpm(struct clk_hw *hw)
>   	return ret;
>   }
>   
> +static int dsi_pll_28nm_vco_prepare_8226(struct clk_hw *hw)
> +{
> +	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> +	struct device *dev = &pll_28nm->phy->pdev->dev;
> +	void __iomem *base = pll_28nm->phy->pll_base;
> +	u32 max_reads = 5, timeout_us = 100;
> +	bool locked;
> +	u32 val;
> +	int i;
> +
> +	DBG("id=%d", pll_28nm->phy->id);
> +
> +	pll_28nm_software_reset(pll_28nm);
> +
> +	/*
> +	 * PLL power up sequence.
> +	 * Add necessary delays recommended by hardware.
> +	 */
> +	dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_CAL_CFG1, 0x34);
> +
> +	val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
> +	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
> +
> +	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
> +	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 200);
> +
> +	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
> +	val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
> +	dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
> +
> +	for (i = 0; i < 7; i++) {
> +		/* DSI Uniphy lock detect setting */
> +		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
> +		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2,
> +				0x0c, 100);
> +		dsi_phy_write(base + REG_DSI_28nm_PHY_PLL_LKDET_CFG2, 0x0d);
> +
> +		/* poll for PLL ready status */
> +		locked = pll_28nm_poll_for_ready(pll_28nm,
> +						max_reads, timeout_us);
> +		if (locked)
> +			break;
> +
> +		pll_28nm_software_reset(pll_28nm);
> +
> +		/*
> +		 * PLL power up sequence.
> +		 * Add necessary delays recommended by hardware.
> +		 */
> +		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00, 50);
> +
> +		val = DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRDN_B;
> +		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_PWRGEN_PWRDN_B;
> +		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 100);
> +
> +		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_LDO_PWRDN_B;
> +		val |= DSI_28nm_PHY_PLL_GLB_CFG_PLL_ENABLE;
> +		dsi_phy_write_udelay(base + REG_DSI_28nm_PHY_PLL_GLB_CFG, val, 600);
> +	}
> +
> +	if (unlikely(!locked))
> +		DRM_DEV_ERROR(dev, "DSI PLL lock failed\n");
> +	else
> +		DBG("DSI PLL Lock success");
> +
> +	return locked ? 0 : -EINVAL;
> +}
> +
Could you please share the downstream reference you used to come up with 
this sequence?

Thanks and Regards,
Jeykumar S.
>   static int dsi_pll_28nm_vco_prepare_lp(struct clk_hw *hw)
>   {
>   	struct dsi_pll_28nm *pll_28nm = to_pll_28nm(hw);
> @@ -471,6 +540,15 @@ static const struct clk_ops clk_ops_dsi_pll_28nm_vco_lp = {
>   	.is_enabled = dsi_pll_28nm_clk_is_enabled,
>   };
>   
> +static const struct clk_ops clk_ops_dsi_pll_28nm_vco_8226 = {
> +	.round_rate = dsi_pll_28nm_clk_round_rate,
> +	.set_rate = dsi_pll_28nm_clk_set_rate,
> +	.recalc_rate = dsi_pll_28nm_clk_recalc_rate,
> +	.prepare = dsi_pll_28nm_vco_prepare_8226,
> +	.unprepare = dsi_pll_28nm_vco_unprepare,
> +	.is_enabled = dsi_pll_28nm_clk_is_enabled,
> +};
> +
>   /*
>    * PLL Callbacks
>    */
> @@ -536,6 +614,8 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>   
>   	if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
>   		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_lp;
> +	else if (pll_28nm->phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_8226)
> +		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_8226;
>   	else
>   		vco_init.ops = &clk_ops_dsi_pll_28nm_vco_hpm;
>   
> @@ -820,3 +900,20 @@ const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs = {
>   	.quirks = DSI_PHY_28NM_QUIRK_PHY_LP,
>   };
>   
> +const struct msm_dsi_phy_cfg dsi_phy_28nm_8226_cfgs = {
> +	.has_phy_regulator = true,
> +	.regulator_data = dsi_phy_28nm_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_28nm_regulators),
> +	.ops = {
> +		.enable = dsi_28nm_phy_enable,
> +		.disable = dsi_28nm_phy_disable,
> +		.pll_init = dsi_pll_28nm_init,
> +		.save_pll_state = dsi_28nm_pll_save_state,
> +		.restore_pll_state = dsi_28nm_pll_restore_state,
> +	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
> +	.io_start = { 0xfd922b00 },
> +	.num_dsi_phy = 1,
> +	.quirks = DSI_PHY_28NM_QUIRK_PHY_8226,
> +};
> 
