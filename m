Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501C973DE71
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 14:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AA610E1F2;
	Mon, 26 Jun 2023 12:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D5010E1F4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 12:06:42 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b69923a715so22202201fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 05:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687781200; x=1690373200;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iFvDHdE+E4ebpoenEHV9zlHSfy8p8BTczqjB+kJdiLo=;
 b=DSGuCTu1Dmfr6HAKsE9vi2AVSbNoNCbJ+FSKvglLf93pHrhYSH1rJLq2KtVowOe6NB
 VegrgKyezlJSggar7La91Y3oy10q1WfzCj9DhdxR6n7XA86+Br4q4i+UZjUjabBENUCR
 a3CvlKqsGoXGeSs8reSY7k/j+yphSVy+neIbuN9tSdHVLumFUs5qFbo9Y60QjmFhWokD
 +Xg7aGMDrT64mY1fK3rBP/SXL4fhKh7zs9jK/AVhsErASdMgWBK4LHZCd2P5q53CZ1w1
 BDVZvm7fLgZrdGVTldL7sCHhZ9zDzrJ/H/YbSPIGAvP8ue+0duS99u2ZoHQgyvWUDOkg
 PMVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687781200; x=1690373200;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iFvDHdE+E4ebpoenEHV9zlHSfy8p8BTczqjB+kJdiLo=;
 b=PTuIr87zj1z/CmYGPUGjnaDGolhl0hHaaQW2y6KsDaDmLdL+ona5cPmS27P7VNlQqe
 Ze/GkaZaqVLK1inrtSEiPBsEVs0b1QFoSWA2HLHo6SRmfkGkxRT6WM09yLOuaLUDKHvX
 IbzjhmyCVVK8hLEqk+JKCzNBYsZTlqhk8JncUPIa96U90KkFdajVR4Nhk6ashWr1STDR
 Sal3tbpv3fzGjthZ0ThEHc3B4fWtvKdkoVrAA0lkw9q4lMCd3s40DNP5FIERG3AX2UH+
 iz063Hhh60IxFMnbtVn4uCvSI07B0sWgKsX5ssyeS6HFsvXxIcr3gsm5oJId7/QWCuUy
 Ahxg==
X-Gm-Message-State: AC+VfDwbbARA1gOY3x+RmDNTkn1LHy1DFzS5NPDh5Swfgk9Gtm6ogn0T
 Tx0M/GDMrMsN8z5Sh65KFMiA8g==
X-Google-Smtp-Source: ACHHUZ4oS5zejTHtP+Rs3l8FcwLkuHjFLyjkve0ESWA1mf5wmeIXXPp+UsFn0DruoeFLkiOTzGtaQw==
X-Received: by 2002:a2e:8296:0:b0:2b5:a31d:499 with SMTP id
 y22-20020a2e8296000000b002b5a31d0499mr3914499ljg.52.1687781200164; 
 Mon, 26 Jun 2023 05:06:40 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a2e9617000000b002aeeda05382sm1194217ljh.29.2023.06.26.05.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 05:06:39 -0700 (PDT)
Message-ID: <1513ea17-2807-4f7c-30f2-6158b5f3e55e@linaro.org>
Date: Mon, 26 Jun 2023 14:06:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
 <20230625114222.96689-3-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 02/15] phy: qualcomm: add QMP HDMI PHY driver
In-Reply-To: <20230625114222.96689-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-phy@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.06.2023 13:42, Dmitry Baryshkov wrote:
> Port Qualcomm QMP HDMI PHY to the generic PHY framework. Split the
> generic part and the msm8996 part. When adding support for msm8992/4 and
> msm8998 (which also employ QMP for HDMI PHY), one will have to provide
> the PLL programming part only.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
[...]

> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Ltd.
> + */
> +
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +
> +#include "phy-qcom-qmp-hdmi.h"
> +
> +int qmp_hdmi_phy_init(struct phy *phy)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
> +
> +	return pm_runtime_resume_and_get(hdmi_phy->dev);
> +}
> +
> +int qmp_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> +{
> +        const struct phy_configure_opts_hdmi *hdmi_opts = &opts->hdmi;
> +	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
Misaligned

> +        int ret = 0;
> +
> +        memcpy(&hdmi_phy->hdmi_opts, hdmi_opts, sizeof(*hdmi_opts));
> +
> +        return ret;
> +}
> +
> +int qmp_hdmi_phy_exit(struct phy *phy)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
> +
> +	pm_runtime_put_noidle(hdmi_phy->dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused qmp_hdmi_runtime_resume(struct device *dev)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_bulk_prepare_enable(ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
> +	if (ret)
> +		goto out_disable_supplies;
> +
> +	return 0;
> +
> +out_disable_supplies:
> +	regulator_bulk_disable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused qmp_hdmi_runtime_suspend(struct device *dev)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = dev_get_drvdata(dev);
> +
> +	clk_bulk_disable_unprepare(ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
> +	regulator_bulk_disable(ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
> +
> +	return 0;
> +}
> +
> +static int qmp_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct clk_init_data init = {
> +		.name = "hdmipll",
> +		.parent_data = (const struct clk_parent_data[]) {
> +			{ .fw_name = "xo", .name = "xo_board" },
> +		},
> +		.flags = CLK_GET_RATE_NOCACHE,
> +		.num_parents = 1,
> +	};
> +	const struct qmp_hdmi_cfg *cfg = of_device_get_match_data(&pdev->dev);
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct qmp_hdmi_phy *hdmi_phy;
> +	int ret, i;
> +
> +	hdmi_phy = devm_kzalloc(dev, sizeof(*hdmi_phy), GFP_KERNEL);
> +	if (!hdmi_phy)
> +		return -ENOMEM;
> +
> +	hdmi_phy->dev = dev;
> +
> +	hdmi_phy->serdes = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(hdmi_phy->serdes))
> +		return PTR_ERR(hdmi_phy->serdes);
> +
> +	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
> +		hdmi_phy->tx[i] = devm_platform_ioremap_resource(pdev, 1 + i);
> +		if (IS_ERR(hdmi_phy->tx[i]))
> +			return PTR_ERR(hdmi_phy->tx[i]);
> +	}
> +
> +	hdmi_phy->phy_reg = devm_platform_ioremap_resource(pdev, 5);
Please create an enum with all the reg indices

> +	if (IS_ERR(hdmi_phy->phy_reg))
> +		return PTR_ERR(hdmi_phy->phy_reg);
> +
> +	hdmi_phy->clks[0].id = "iface";
> +	hdmi_phy->clks[1].id = "ref";
> +	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(hdmi_phy->clks), hdmi_phy->clks);
> +	if (ret)
> +		return ret;
> +
> +	hdmi_phy->supplies[0].supply = "vddio";
> +	hdmi_phy->supplies[0].init_load_uA = 100000;
> +	hdmi_phy->supplies[1].supply = "vcca";
> +	hdmi_phy->supplies[1].init_load_uA = 10000;
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hdmi_phy->supplies), hdmi_phy->supplies);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, hdmi_phy);
> +
> +	ret = devm_pm_runtime_enable(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	init.ops = cfg->pll_ops;
> +	hdmi_phy->pll_hw.init = &init;
> +	ret = devm_clk_hw_register(hdmi_phy->dev, &hdmi_phy->pll_hw);
> +	if (ret)
> +		goto err;
> +
> +	ret = devm_of_clk_add_hw_provider(hdmi_phy->dev, of_clk_hw_simple_get, &hdmi_phy->pll_hw);
> +	if (ret)
> +		goto err;
> +
> +	hdmi_phy->phy = devm_phy_create(dev, pdev->dev.of_node, cfg->phy_ops);
> +	if (IS_ERR(hdmi_phy->phy)) {
> +		ret = PTR_ERR(hdmi_phy->phy);
> +		goto err;
> +	}
> +
> +	phy_set_drvdata(hdmi_phy->phy, hdmi_phy);
> +
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +
> +err:
> +	pm_runtime_put_noidle(&pdev->dev);
> +	return ret;
> +}
> +
> +static const struct of_device_id qmp_hdmi_of_match_table[] = {
> +	{
> +		.compatible = "qcom,hdmi-phy-8996", .data = &qmp_hdmi_8996_cfg,
> +	},
{ .compatible ... },
?

> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, qmp_hdmi_of_match_table);
> +
> +DEFINE_RUNTIME_DEV_PM_OPS(qmp_hdmi_pm_ops,
> +			  qmp_hdmi_runtime_suspend,
> +			  qmp_hdmi_runtime_resume,
> +			  NULL);
> +
> +static struct platform_driver qmp_hdmi_driver = {
> +	.probe		= qmp_hdmi_probe,
> +	.driver = {
> +		.name	= "qcom-qmp-hdmi-phy",
> +		.of_match_table = qmp_hdmi_of_match_table,
> +		.pm     = &qmp_hdmi_pm_ops,
> +	},
> +};
> +
> +module_platform_driver(qmp_hdmi_driver);
> +
> +MODULE_AUTHOR("Dmitry Baryshkov <dmitry.baryshkov@linaro.org>");
> +MODULE_DESCRIPTION("Qualcomm QMP HDMI PHY driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c
> new file mode 100644
> index 000000000000..27ffa70d0faa
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c
> @@ -0,0 +1,441 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Ltd.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/iopoll.h>
> +#include <linux/phy/phy.h>
> +
> +#include "phy-qcom-qmp-hdmi.h"
> +#include "phy-qcom-qmp-qserdes-com.h"
> +#include "phy-qcom-qmp-qserdes-txrx.h"
> +
> +#define HDMI_VCO_MAX_FREQ			12000000000UL
> +#define HDMI_VCO_MIN_FREQ			8000000000UL
> +
> +#define HDMI_PCLK_MAX_FREQ			600000000UL
> +#define HDMI_PCLK_MIN_FREQ			25000000UL
> +
> +#define HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD	3400000000UL
> +#define HDMI_DIG_FREQ_BIT_CLK_THRESHOLD		1500000000UL
> +#define HDMI_MID_FREQ_BIT_CLK_THRESHOLD		750000000UL
> +#define HDMI_DEFAULT_REF_CLOCK			19200000
> +#define HDMI_PLL_CMP_CNT			1024
> +
> +#define HDMI_PLL_POLL_MAX_READS			100
> +#define HDMI_PLL_POLL_TIMEOUT_US		150
> +
> +#define REG_HDMI_8996_PHY_CFG					0x00000000
> +#define REG_HDMI_8996_PHY_PD_CTL				0x00000004
> +#define REG_HDMI_8996_PHY_MODE					0x00000008
> +#define REG_HDMI_8996_PHY_MISR_CLEAR				0x0000000c
> +#define REG_HDMI_8996_PHY_TX0_TX1_BIST_CFG0			0x00000010
> +#define REG_HDMI_8996_PHY_TX0_TX1_BIST_CFG1			0x00000014
> +#define REG_HDMI_8996_PHY_TX0_TX1_PRBS_SEED_BYTE0		0x00000018
> +#define REG_HDMI_8996_PHY_TX0_TX1_PRBS_SEED_BYTE1		0x0000001c
> +#define REG_HDMI_8996_PHY_TX0_TX1_BIST_PATTERN0			0x00000020
> +#define REG_HDMI_8996_PHY_TX0_TX1_BIST_PATTERN1			0x00000024
> +#define REG_HDMI_8996_PHY_TX2_TX3_BIST_CFG0			0x00000028
> +#define REG_HDMI_8996_PHY_TX2_TX3_BIST_CFG1			0x0000002c
> +#define REG_HDMI_8996_PHY_TX2_TX3_PRBS_SEED_BYTE0		0x00000030
> +#define REG_HDMI_8996_PHY_TX2_TX3_PRBS_SEED_BYTE1		0x00000034
> +#define REG_HDMI_8996_PHY_TX2_TX3_BIST_PATTERN0			0x00000038
> +#define REG_HDMI_8996_PHY_TX2_TX3_BIST_PATTERN1			0x0000003c
> +#define REG_HDMI_8996_PHY_DEBUG_BUS_SEL				0x00000040
> +#define REG_HDMI_8996_PHY_TXCAL_CFG0				0x00000044
> +#define REG_HDMI_8996_PHY_TXCAL_CFG1				0x00000048
> +#define REG_HDMI_8996_PHY_TX0_TX1_LANE_CTL			0x0000004c
> +#define REG_HDMI_8996_PHY_TX2_TX3_LANE_CTL			0x00000050
> +#define REG_HDMI_8996_PHY_LANE_BIST_CONFIG			0x00000054
> +#define REG_HDMI_8996_PHY_CLOCK					0x00000058
> +#define REG_HDMI_8996_PHY_MISC1					0x0000005c
> +#define REG_HDMI_8996_PHY_MISC2					0x00000060
> +#define REG_HDMI_8996_PHY_TX0_TX1_BIST_STATUS0			0x00000064
> +#define REG_HDMI_8996_PHY_TX0_TX1_BIST_STATUS1			0x00000068
> +#define REG_HDMI_8996_PHY_TX0_TX1_BIST_STATUS2			0x0000006c
> +#define REG_HDMI_8996_PHY_TX2_TX3_BIST_STATUS0			0x00000070
> +#define REG_HDMI_8996_PHY_TX2_TX3_BIST_STATUS1			0x00000074
> +#define REG_HDMI_8996_PHY_TX2_TX3_BIST_STATUS2			0x00000078
> +#define REG_HDMI_8996_PHY_PRE_MISR_STATUS0			0x0000007c
> +#define REG_HDMI_8996_PHY_PRE_MISR_STATUS1			0x00000080
> +#define REG_HDMI_8996_PHY_PRE_MISR_STATUS2			0x00000084
> +#define REG_HDMI_8996_PHY_PRE_MISR_STATUS3			0x00000088
> +#define REG_HDMI_8996_PHY_POST_MISR_STATUS0			0x0000008c
> +#define REG_HDMI_8996_PHY_POST_MISR_STATUS1			0x00000090
> +#define REG_HDMI_8996_PHY_POST_MISR_STATUS2			0x00000094
> +#define REG_HDMI_8996_PHY_POST_MISR_STATUS3			0x00000098
> +#define REG_HDMI_8996_PHY_STATUS				0x0000009c
> +#define REG_HDMI_8996_PHY_MISC3_STATUS				0x000000a0
> +#define REG_HDMI_8996_PHY_MISC4_STATUS				0x000000a4
> +#define REG_HDMI_8996_PHY_DEBUG_BUS0				0x000000a8
> +#define REG_HDMI_8996_PHY_DEBUG_BUS1				0x000000ac
> +#define REG_HDMI_8996_PHY_DEBUG_BUS2				0x000000b0
> +#define REG_HDMI_8996_PHY_DEBUG_BUS3				0x000000b4
> +#define REG_HDMI_8996_PHY_PHY_REVISION_ID0			0x000000b8
> +#define REG_HDMI_8996_PHY_PHY_REVISION_ID1			0x000000bc
> +#define REG_HDMI_8996_PHY_PHY_REVISION_ID2			0x000000c0
> +#define REG_HDMI_8996_PHY_PHY_REVISION_ID3			0x000000c4
> +
> +struct qmp_hdmi_8996_post_divider {
> +	u64 vco_freq;
> +	int hsclk_divsel;
> +	int vco_ratio;
> +	int tx_band_sel;
> +};
> +
> +static inline u32 qmp_hdmi_8996_pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
> +{
> +	u64 dividend = HDMI_PLL_CMP_CNT * fdata;
HDMI_PLL_CMP_CNT should be ULL

> +	u32 divisor = ref_clk * 10;
> +	u32 rem;
> +
> +	rem = do_div(dividend, divisor);
> +	if (rem > (divisor >> 1))
> +		dividend++;
> +
> +	return dividend - 1;
> +}
> +
> +static int qmp_hdmi_8996_pll_get_post_div(struct qmp_hdmi_8996_post_divider *pd, u64 bclk)
> +{
> +	int ratio[] = { 2, 3, 4, 5, 6, 9, 10, 12, 14, 15, 20, 21, 25, 28, 35 };
> +	int hs_divsel[] = { 0, 4, 8, 12, 1, 5, 2, 9, 3, 13, 10, 7, 14, 11, 15 };
> +	int tx_band_sel[] = { 0, 1, 2, 3 };
> +	u64 vco_freq[60];
60 -> ARRAY_SIZE() * ARRAY_SIZE()?

> +	u64 vco, vco_optimal;
> +	int half_rate_mode = 0;
> +	int vco_optimal_index, vco_freq_index;
> +	int i, j;
Reverse-Christmas-tree?

> +
> +retry:
> +	vco_optimal = HDMI_VCO_MAX_FREQ;
> +	vco_optimal_index = -1;
> +	vco_freq_index = 0;
> +	for (i = 0; i < 15; i++) {
> +		for (j = 0; j < 4; j++) {
> +			u32 ratio_mult = ratio[i] << tx_band_sel[j];
> +
> +			vco = bclk >> half_rate_mode;
> +			vco *= ratio_mult;
> +			vco_freq[vco_freq_index++] = vco;
> +		}
> +	}
> +
> +	for (i = 0; i < 60; i++) {
> +		u64 vco_tmp = vco_freq[i];
> +
> +		if ((vco_tmp >= HDMI_VCO_MIN_FREQ) &&
> +		    (vco_tmp <= vco_optimal)) {
> +			vco_optimal = vco_tmp;
> +			vco_optimal_index = i;
> +		}
> +	}
> +
> +	if (vco_optimal_index == -1) {
> +		if (!half_rate_mode) {
> +			half_rate_mode = 1;
> +			goto retry;
> +		}
> +
> +		return -EINVAL;
> +	}
> +
> +	pd->vco_freq = vco_optimal;
> +	pd->tx_band_sel = tx_band_sel[vco_optimal_index % 4];
> +	pd->vco_ratio = ratio[vco_optimal_index / 4];
> +	pd->hsclk_divsel = hs_divsel[vco_optimal_index / 4];
> +
> +	return 0;
> +}
> +
> +static int qmp_hdmi_8996_phy_set_rate(struct qmp_hdmi_phy *hdmi_phy)
> +{
> +	unsigned long parent_rate = HDMI_DEFAULT_REF_CLOCK;
HDMI_DEFAULT_REF_CLOCK could be UL for completeness

> +	unsigned long rate = hdmi_phy->hdmi_opts.pixel_clk_rate * 1000;
> +	struct qmp_hdmi_8996_post_divider pd;
> +	bool gen_ssc = false;
> +	u64 bclk;
> +	u64 dec_start;
> +	u64 frac_start;
> +	u64 fdata;
> +	u32 pll_divisor;
> +	u32 rem;
> +	u32 integloop_gain;
> +	u32 pll_cmp;
> +	int i, ret;
This list is very long, perhaps collapse some common-type var definitions

> +
> +	bclk = ((u64)rate) * 10;
19.2 mil * 10 will not overflow u32

> +	ret = qmp_hdmi_8996_pll_get_post_div(&pd, bclk);
> +	if (ret) {
> +		dev_err(hdmi_phy->dev, "PLL calculation failed\n");
> +		return ret;
> +	}
> +
> +	dec_start = pd.vco_freq;
> +	pll_divisor = 4 * parent_rate;
> +	do_div(dec_start, pll_divisor);
> +
> +	frac_start = pd.vco_freq * (1 << 20);
> +
> +	rem = do_div(frac_start, pll_divisor);
> +	frac_start -= dec_start * (1 << 20);
> +	if (rem > (pll_divisor >> 1))
> +		frac_start++;
> +
> +	fdata = pd.vco_freq;
> +	do_div(fdata, pd.vco_ratio);
> +
> +	pll_cmp = qmp_hdmi_8996_pll_get_pll_cmp(fdata, parent_rate);
> +
> +	/* Initially shut down PHY */
> +	dev_dbg(hdmi_phy->dev, "Disabling PHY");
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_PD_CTL, 0x0);
> +	udelay(500);
usleep_range

https://www.kernel.org/doc/Documentation/timers/timers-howto.txt

> +
> +	/* Power up sequence */
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_BG_CTRL, 0x04);
> +
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_PD_CTL, 0x1);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_RESETSM_CNTRL, 0x20);
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_TX0_TX1_LANE_CTL, 0x0f);
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_TX2_TX3_LANE_CTL, 0x0f);
> +
> +	hdmi_tx_chan_write(hdmi_phy, 0, QSERDES_TX_LANE_MODE, 0x43);
> +	hdmi_tx_chan_write(hdmi_phy, 2, QSERDES_TX_LANE_MODE, 0x43);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SYSCLK_BUF_ENABLE, 0x1e);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x07);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SYSCLK_EN_SEL, 0x37);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SYS_CLK_CTRL, 0x02);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_CLK_ENABLE1, 0x0e);
> +
> +	if (frac_start != 0 || gen_ssc) {
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_CCTRL_MODE0, 0x28);
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_RCTRL_MODE0, 0x16);
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_CP_CTRL_MODE0,
> +			       11000000 / (parent_rate/ 20));
> +		integloop_gain = (64 * parent_rate) / HDMI_DEFAULT_REF_CLOCK;
do_div

> +	} else {
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_CCTRL_MODE0, 0x01);
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_RCTRL_MODE0, 0x10);
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_CP_CTRL_MODE0, 0x23);
> +		integloop_gain = (1022 * parent_rate) / (100 * 1000 * 1000);
> +	}
> +
> +	/* Bypass VCO calibration */
> +	if (bclk > HDMI_DIG_FREQ_BIT_CLK_THRESHOLD) {
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_SVS_MODE_CLK_SEL, 1);
> +		integloop_gain <<= 1;
> +	} else {
> +		hdmi_pll_write(hdmi_phy, QSERDES_COM_SVS_MODE_CLK_SEL, 2);
> +		integloop_gain <<= 2;
> +	}
> +
> +	integloop_gain = min_t(u32, integloop_gain, 2046);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_BG_TRIM, 0x0f);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_PLL_IVCO, 0x0f);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_VCO_TUNE_CTRL, 0);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_BG_CTRL, 0x06);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_CLK_SELECT, 0x30);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_HSCLK_SEL, 0x20 | pd.hsclk_divsel);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_LOCK_CMP_EN, 0x0);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_DEC_START_MODE0, dec_start);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_DIV_FRAC_START1_MODE0,
> +		       frac_start & 0xff);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_DIV_FRAC_START2_MODE0,
> +		       (frac_start >> 8) & 0xff);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_DIV_FRAC_START3_MODE0,
> +		       (frac_start >> 16) & 0xf);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_INTEGLOOP_GAIN0_MODE0,
> +		       integloop_gain & 0xff);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_INTEGLOOP_GAIN1_MODE0,
> +		       (integloop_gain >> 8) & 0xff);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_LOCK_CMP1_MODE0,
> +		       pll_cmp & 0xff);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_LOCK_CMP2_MODE0,
> +		       (pll_cmp >> 8) & 0xff);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_LOCK_CMP3_MODE0,
> +		       (pll_cmp >> 16) & 0x3);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_VCO_TUNE_MAP, 0x00);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_CORE_CLK_EN, 0x2c);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_CORECLK_DIV, 5);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_CMN_CONFIG, 0x02);
> +
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_RESCODE_DIV_NUM, 0x15);
> +
> +	/* TX lanes setup (TX 0/1/2/3) */
> +	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
> +		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_CLKBUF_ENABLE, 0x03);
> +		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_BAND, pd.tx_band_sel + 4);
> +		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_RESET_TSYNC_EN, 0x03);
> +		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_VMODE_CTRL1, 0x00);
> +		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_DRV_LVL_OFFSET, 0x00);
> +		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_RES_CODE_LANE_OFFSET, 0x00);
> +		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TRAN_DRVR_EMP_EN, 0x03);
> +		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_PARRATE_REC_DETECT_IDLE_EN, 0x40);
> +		hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_HP_PD_ENABLES,
is this a misspelt 'ENABLED'?

> +				   i != 3 ? 0xc : 0x3);
> +	}
> +
> +	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD) {
> +		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
> +			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_DRV_LVL,
> +					   i != 3 ? 0x25 : 0x22);
> +			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_EMP_POST1_LVL,
> +					   i != 3 ? 0x23 : 0x27);
> +			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_VMODE_CTRL2,
> +					   i != 3 ? 0x0d : 0x00);
> +		}
> +	} else if (bclk > HDMI_MID_FREQ_BIT_CLK_THRESHOLD) {
> +		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
> +			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_DRV_LVL, 0x25);
> +			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_EMP_POST1_LVL, 0x23);
> +			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_VMODE_CTRL2,
> +					   i != 3 ? 0x0d : 0x00);
> +		}
> +	} else {
> +		for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
> +			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_DRV_LVL, 0x20);
> +			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_TX_EMP_POST1_LVL, 0x20);
> +			hdmi_tx_chan_write(hdmi_phy, i, QSERDES_TX_VMODE_CTRL2, 0x0e);
> +		}
> +	}
> +
> +	if (bclk > HDMI_HIGH_FREQ_BIT_CLK_THRESHOLD)
> +		hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_MODE, 0x10);
> +	else
> +		hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_MODE, 0x00);
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_PD_CTL, 0x1f);
> +
> +	return 0;
> +}
> +
> +static int qmp_hdmi_8996_phy_power_on(struct phy *phy)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
> +	u32 status;
> +	int i, ret = 0;
Reverse-Christmas-tree?

> +
> +	ret = qmp_hdmi_8996_phy_set_rate(hdmi_phy);
> +	if (ret) {
> +		dev_err(hdmi_phy->dev, "Setting pixel clock rate failed\n");
> +		return ret;
> +	}
> +
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_CFG, 0x1);
> +	udelay(100);
usleep_range

> +
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_CFG, 0x19);
> +	udelay(100);
usleep_range

> +
> +	ret = readl_poll_timeout(hdmi_phy->serdes + QSERDES_COM_C_READY_STATUS,
> +				 status, status & BIT(0),
> +				 HDMI_PLL_POLL_TIMEOUT_US,
> +				 HDMI_PLL_POLL_MAX_READS * HDMI_PLL_POLL_TIMEOUT_US);
> +
> +	if (ret) {
> +		dev_warn(hdmi_phy->dev, "HDMI PLL is not locked\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++)
> +		hdmi_tx_chan_write(hdmi_phy, i,
> +				   QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN,
> +				   0x6f);
> +
> +	/* Disable SSC */
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SSC_PER1, 0x0);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SSC_PER2, 0x0);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SSC_STEP_SIZE1, 0x0);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SSC_STEP_SIZE2, 0x0);
> +	hdmi_pll_write(hdmi_phy, QSERDES_COM_SSC_EN_CENTER, 0x2);
> +
> +	ret = readl_poll_timeout(hdmi_phy->phy_reg + REG_HDMI_8996_PHY_STATUS,
> +				 status, status & BIT(0),
> +				 HDMI_PLL_POLL_TIMEOUT_US,
> +				 HDMI_PLL_POLL_MAX_READS * HDMI_PLL_POLL_TIMEOUT_US);
> +	if (ret) {
> +		dev_warn(hdmi_phy->dev, "HDMI PLL is not locked\n");
> +		return ret;
> +	}
> +
> +	/* Restart the retiming buffer */
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_CFG, 0x18);
> +	udelay(1);
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_CFG, 0x19);
> +
> +	return 0;
> +}
> +
> +static int qmp_hdmi_8996_phy_power_off(struct phy *phy)
> +{
> +	struct qmp_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
> +
> +	hdmi_phy_write(hdmi_phy, REG_HDMI_8996_PHY_CFG, 0x6);
> +	usleep_range(100, 150);
> +
> +	return 0;
> +}
> +
> +static long qmp_hdmi_8996_pll_round_rate(struct clk_hw *hw,
> +				     unsigned long rate,
> +				     unsigned long *parent_rate)
> +{
> +	return clamp(rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
> +}
> +
> +static unsigned long qmp_hdmi_8996_pll_recalc_rate(struct clk_hw *hw,
> +					       unsigned long parent_rate)
> +{
> +	struct qmp_hdmi_phy *phy = hw_clk_to_pll(hw);
> +	u32 cmp1, cmp2, cmp3, pll_cmp;
> +
> +	cmp1 = hdmi_pll_read(phy, QSERDES_COM_LOCK_CMP1_MODE0);
> +	cmp2 = hdmi_pll_read(phy, QSERDES_COM_LOCK_CMP2_MODE0);
> +	cmp3 = hdmi_pll_read(phy, QSERDES_COM_LOCK_CMP3_MODE0);
> +
> +	pll_cmp = cmp1 | (cmp2 << 8) | (cmp3 << 16);
FIELD_PREP to avoid overflows if hw returns garbage?
Or is it supposed to overflow by design?

> +
> +	return mult_frac(pll_cmp + 1, parent_rate, HDMI_PLL_CMP_CNT);
> +}
> +
> +static int qmp_hdmi_8996_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct qmp_hdmi_phy *phy = hw_clk_to_pll(hw);
> +	u32 status;
> +	int pll_locked;
Reverse-Christmas-tree?

Konrad
> +
> +	status = hdmi_pll_read(phy, QSERDES_COM_C_READY_STATUS);
> +	pll_locked = status & BIT(0);
> +
> +	return pll_locked;
> +}
> +
> +static const struct clk_ops qmp_hdmi_8996_pll_ops = {
> +	.recalc_rate = qmp_hdmi_8996_pll_recalc_rate,
> +	.round_rate = qmp_hdmi_8996_pll_round_rate,
> +	.is_enabled = qmp_hdmi_8996_pll_is_enabled,
> +};
> +
> +static const struct phy_ops qmp_hdmi_8996_phy_ops = {
> +	.init		= qmp_hdmi_phy_init,
> +	.configure	= qmp_hdmi_phy_configure,
> +	.power_on	= qmp_hdmi_8996_phy_power_on,
> +	.power_off	= qmp_hdmi_8996_phy_power_off,
> +	.exit		= qmp_hdmi_phy_exit,
> +	.owner		= THIS_MODULE,
> +};
> +
> +const struct qmp_hdmi_cfg qmp_hdmi_8996_cfg = {
> +	.pll_ops = &qmp_hdmi_8996_pll_ops,
> +	.phy_ops = &qmp_hdmi_8996_phy_ops,
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h
> new file mode 100644
> index 000000000000..25d307a8f287
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023, Linaro Ltd.
> + */
> +
> +#ifndef PHY_QCOM_QMP_HDMI_H
> +#define PHY_QCOM_QMP_HDMI_H
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-hdmi.h>
> +
> +#define MAX_CLKS 2
> +#define MAX_SUPPLIES 2
> +
> +#define HDMI_NUM_TX_CHANNEL 4
> +
> +struct qmp_hdmi_phy {
> +	struct device *dev;
> +	struct phy *phy;
> +	void __iomem *serdes;
> +	void __iomem *tx[HDMI_NUM_TX_CHANNEL];
> +	void __iomem *phy_reg;
> +
> +	struct phy_configure_opts_hdmi hdmi_opts;
> +
> +	struct clk_hw pll_hw;
> +	struct clk_bulk_data clks[MAX_CLKS];
> +	struct regulator_bulk_data supplies[MAX_SUPPLIES];
> +};
> +
> +struct qmp_hdmi_cfg {
> +	const struct clk_ops *pll_ops;
> +	const struct phy_ops *phy_ops;
> +};
> +
> +#define hw_clk_to_pll(x) container_of(x, struct qmp_hdmi_phy, pll_hw)
> +
> +static inline void hdmi_phy_write(struct qmp_hdmi_phy *phy, int offset,
> +				  u32 data)
> +{
> +	writel(data, phy->phy_reg + offset);
> +}
> +
> +static inline u32 hdmi_phy_read(struct qmp_hdmi_phy *phy, int offset)
> +{
> +	return readl(phy->phy_reg + offset);
> +}
> +
> +static inline void hdmi_pll_write(struct qmp_hdmi_phy *phy, int offset,
> +				  u32 data)
> +{
> +	writel(data, phy->serdes + offset);
> +}
> +
> +static inline u32 hdmi_pll_read(struct qmp_hdmi_phy *phy, int offset)
> +{
> +	return readl(phy->serdes + offset);
> +}
> +
> +static inline void hdmi_tx_chan_write(struct qmp_hdmi_phy *phy, int channel,
> +				      int offset, int data)
> +{
> +	writel(data, phy->tx[channel] + offset);
> +}
> +
> +int qmp_hdmi_phy_init(struct phy *phy);
> +int qmp_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts);
> +int qmp_hdmi_phy_exit(struct phy *phy);
> +
> +extern const struct qmp_hdmi_cfg qmp_hdmi_8996_cfg;
> +
> +#endif
