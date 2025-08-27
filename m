Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F6BB38274
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 14:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC6310E803;
	Wed, 27 Aug 2025 12:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kcT7r4cX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586A310E803
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:34:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kDuu018175
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 moILJAXmTfUtnXXDqDg1ejK2v0bi2+Kmg3gwvaT5IAU=; b=kcT7r4cX6jMCokX6
 iwDB+WNXSFWGceMUF1/OnZTS9fyIm6qKJE0Lmy/6kF50JJs1T7U7ogDkKTwVlxwD
 wnlq727cX+POJkQ0tCNjYo42Yq+ndV6ssHAJ856DW+EeUZ7MrCas/YiDta7CEa5H
 E8dIu+g1xAo35AKZFznsCuJFnuM4UOEmKZNIOkYsUU7OfyB9nPW+s1oozoUSF21d
 9Lm9RcE3E/p529g+bdRJP9XQoGCk+yKBO+1LbuZ4awAs1SK8n3GkI8iAalV+FVsU
 DSLsHM8kWmg5rJHgsUqhy0kZ7EppLCSGyL1MpP3tEi8pK4yhVyK/0wHammkjKleq
 ltdN9A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfmktv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 12:34:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24457f44a2aso15540005ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 05:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756298091; x=1756902891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=moILJAXmTfUtnXXDqDg1ejK2v0bi2+Kmg3gwvaT5IAU=;
 b=l4Z4/lT4QxF34nOQ7jNvhuT2FIPpwkYjhO+TNw5g7ftce7FwO5/pO9HeG3MZ688b5a
 75QN4t109EHk0zzDLEJo738iuMezt4d72uDm0WEvrvVBJ2RK8MRpxm+D1mMV0AWAyImE
 aMlGt3WB9M1f7kpoLJUGcqp56yHMJE6x4P6vPrht28MqudNE+U3wQTFVX1uUrgdfiO/A
 SdehcibKpYxRf4KLfQu8MOCRzV7Aj6qwze60jGjG8pw8BodZJaDu9UBk/uj3k8FzGzQE
 FMAKBiTCYstQLpfhthmacjBovU41Q9yynOT4yyhxUoPvJIP/wNbnJuAM7kpdnIAV0dwY
 WJBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr0IrAG+gPSiYJmeiSnnu6dHcJsoq8fnsIhiHE1otZFl0aM0524ExZXLmFLRhYonssFObOnRwsztM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTN5VFsZqooXa8TEdOLRko3YzH55OezjCzYAyUgyVrbxf7DOtz
 DsUVo5e5how8C3j7w6SfP5xGXV7iCfUuc03PZh5MdV1x2xjBcckN6rbfdFXYtWHlOHSjD06uQ3b
 FG2r9zIhsqrj1oP0K7EILsouSpmgjdB3CGGybbjyensJcTF1cW/JDznT/buEPqvaP14u792w=
X-Gm-Gg: ASbGncuZ7RnIvAHwvgUDfCV8ICIpfCHkfzTaQp9w4s7vI3CWg7s9r9y1fZ2gUVkj4ga
 e5x3JazYcQsceACEDfN0v7F95QjH2j5QgUSKq/ap+EWiXMXvsbr8KKh82e1MPuMLUAgzHCc7C3Y
 8DC8rnDqzoK1lUqBiCOyhMPk/22ukb64yB0LtT4q8qdxBtiDJNcrmTi82/aVT9CfyHV8bAK4Ycw
 iHDAwh2e/f34BmvEAlU2pHd6J2UoUYXZNaNCT6/muDqHdv7BnrEp9F3EfFUK02V6b+QuFI5ll/K
 hx/DADg5Sk3VUxjhSyWnPcBEICIExV3fsSFAZzsd1VH0ReLfP/mI69bDxs0jFTuTg76tbIFH8hl
 pFUNjmUv2IR5bif81BcbyyTfh/rQfIg==
X-Received: by 2002:a17:902:db0c:b0:240:9dcd:94c0 with SMTP id
 d9443c01a7336-2462edfb000mr126193995ad.2.1756298090586; 
 Wed, 27 Aug 2025 05:34:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmo8pGCrQnTIdRGu+JeUzJwBMxSLoH2t3e3ElN+ikXmyLBInIuVbe8SmuBSp+d9zO2wWMHGg==
X-Received: by 2002:a17:902:db0c:b0:240:9dcd:94c0 with SMTP id
 d9443c01a7336-2462edfb000mr126193655ad.2.1756298089987; 
 Wed, 27 Aug 2025 05:34:49 -0700 (PDT)
Received: from [10.133.33.166] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-248787e1bb2sm37623965ad.96.2025.08.27.05.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 05:34:49 -0700 (PDT)
Message-ID: <82d19340-b887-4093-9d24-4b2e19b99f8b@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 20:34:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/14] phy: qcom: qmp-usbc: Finalize USB/DP switchable
 PHY support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
 <jjsijdmh4hdbgd2boebtrmzvblvhz2hnl7mtv5ga76ine2fnsb@i72dz3r4lbjp>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <jjsijdmh4hdbgd2boebtrmzvblvhz2hnl7mtv5ga76ine2fnsb@i72dz3r4lbjp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5DrRZ+j7bnN+
 43r2+qsk6TemAqDy1GaIJ9a8BY85BGSOnv5BNMZR94IlhjHqFlDIXc9R5m2rn8YEde/zRlseP+f
 V5/4ltjyyg0XUQqkCps42CbWuC5juV07lo91HUkE2nLHVCQrtcvRwAuUPMh/9JvPfeK+LpRC4PA
 Xn4l6AMyZSJTx18qHum6f+CCO2tgCLA3tr/7XO9ndADNdSFXcuM4PM9z0g05z17ofWsvV9fQ2Me
 a/zJA9AV7NlXlIpgSQfNL+7kh1aAOOV+ZVsDIKGZPaq0WR1UhEzjAuSR3LtfILzYm8K9rXNpTlx
 DyWnYAQ7Q5X0lcim6JBS7NYXN6DYHWyNfY1zI5eqJZ3OSxlU/E9K+bB8R3sCzvxIR7+WOeMOQa0
 z8/NqXNz
X-Proofpoint-GUID: K0idZfIr1P0Z5OYXnBHRT1Zz-7aveJ0g
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68aefb6c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ecvn3kWp99I1lx1hcDoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: K0idZfIr1P0Z5OYXnBHRT1Zz-7aveJ0g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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


On 8/20/2025 7:42 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:53PM +0800, Xiangxu Yin wrote:
>> Complete USB/DP switchable PHY integration by adding DP clock
>> registration, aux bridge setup, and DT parsing. Implement clock
>> provider logic for USB and DP branches, and extend PHY translation
>> to support both USB and DP instances.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 331 ++++++++++++++++++++++++++++---
>>  1 file changed, 299 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 821398653bef23e1915d9d3a3a2950b0bfbefb9a..74b9f75c8864efe270f394bfbfd748793dada1f5 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -995,6 +995,11 @@ static int qmp_usbc_usb_power_on(struct phy *phy)
>>  	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
>>  		      cfg->serdes_tbl_num);
>>  
>> +	if (IS_ERR(qmp->pipe_clk)) {
>> +		return dev_err_probe(qmp->dev, PTR_ERR(qmp->pipe_clk),
>> +				     "pipe clock not defined\n");
>> +	}
> No, this should not be allowed.


Ok, will fix in next patch.


>> +
>>  	ret = clk_prepare_enable(qmp->pipe_clk);
>>  	if (ret) {
>>  		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
>> @@ -1365,11 +1370,13 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
>>  	if (ret)
>>  		return ret;
>>  
>> -	ret = clk_prepare_enable(qmp->pipe_clk);
>> -	if (ret) {
>> -		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
>> -		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>> -		return ret;
>> +	if (!IS_ERR(qmp->pipe_clk)) {
> Similarly.


Ack.


>> +		ret = clk_prepare_enable(qmp->pipe_clk);
>> +		if (ret) {
>> +			dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
>> +			clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
>> +			return ret;
>> +		}
>>  	}
>>  
>>  	qmp_usbc_disable_autonomous_mode(qmp);
>> @@ -1422,9 +1429,23 @@ static int qmp_usbc_clk_init(struct qmp_usbc *qmp)
>>  	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
>>  }
>>  
>> -static void phy_clk_release_provider(void *res)
>> +static struct clk_hw *qmp_usbc_clks_hw_get(struct of_phandle_args *clkspec, void *data)
>>  {
>> -	of_clk_del_provider(res);
>> +	struct qmp_usbc *qmp = data;
>> +
>> +	if (clkspec->args_count == 0)
>> +		return &qmp->pipe_clk_fixed.hw;
>> +
>> +	switch (clkspec->args[0]) {
>> +	case QMP_USB43DP_USB3_PIPE_CLK:
>> +		return &qmp->pipe_clk_fixed.hw;
>> +	case QMP_USB43DP_DP_LINK_CLK:
>> +		return &qmp->dp_link_hw;
>> +	case QMP_USB43DP_DP_VCO_DIV_CLK:
>> +		return &qmp->dp_pixel_hw;
>> +	}
>> +
>> +	return ERR_PTR(-EINVAL);
>>  }
>>  
>>  /*
>> @@ -1453,8 +1474,11 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>>  
>>  	ret = of_property_read_string(np, "clock-output-names", &init.name);
>>  	if (ret) {
>> -		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
>> -		return ret;
>> +		char name[64];
>> +
>> +		/* Clock name is not mandatory. */
>> +		snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(qmp->dev));
>> +		init.name = name;
>>  	}
>>  
>>  	init.ops = &clk_fixed_rate_ops;
>> @@ -1463,19 +1487,7 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>>  	fixed->fixed_rate = 125000000;
>>  	fixed->hw.init = &init;
>>  
>> -	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
>> -	if (ret)
>> -		return ret;
>> -
>> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
>> -	if (ret)
>> -		return ret;
>> -
>> -	/*
>> -	 * Roll a devm action because the clock provider is the child node, but
>> -	 * the child node is not actually a device.
>> -	 */
>> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
>> +	return devm_clk_hw_register(qmp->dev, &fixed->hw);
>>  }
>>  
>>  #if IS_ENABLED(CONFIG_TYPEC)
>> @@ -1660,6 +1672,235 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>>  	return 0;
>>  }
>>  
>> +static int qmp_usbc_parse_usb3dp_dt(struct qmp_usbc *qmp)
>> +{
>> +	struct platform_device *pdev = to_platform_device(qmp->dev);
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	const struct qmp_usbc_offsets *offs = cfg->offsets;
>> +	struct device *dev = qmp->dev;
>> +	void __iomem *base;
>> +	int ret;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	qmp->dp_serdes = base + offs->dp_serdes;
>> +	qmp->dp_tx = base + offs->dp_txa;
>> +	qmp->dp_tx2 = base + offs->dp_txb;
>> +	qmp->dp_dp_phy = base + offs->dp_dp_phy;
> Squash this into qmp_usbc_parse_dt(). Set these fields if
> dp_serdes != 0.


Ack.


>> +	qmp->serdes = base + offs->serdes;
>> +	qmp->pcs = base + offs->pcs;
>> +	if (offs->pcs_misc)
>> +		qmp->pcs_misc = base + offs->pcs_misc;
>> +	qmp->tx = base + offs->tx;
>> +	qmp->rx = base + offs->rx;
>> +
>> +	qmp->tx2 = base + offs->tx2;
>> +	qmp->rx2 = base + offs->rx2;
>> +
>> +	ret = qmp_usbc_clk_init(qmp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	qmp->pipe_clk = devm_clk_get(dev, "pipe");
>> +	if (IS_ERR(qmp->pipe_clk)) {
>> +		/* usb3dp allow no pipe clk define */
>> +		if (cfg->type == QMP_PHY_USBC_USB3_ONLY)
>> +			return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
>> +						"failed to get pipe clock\n");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Display Port PLL driver block diagram for branch clocks
>> + *
>> + *              +------------------------------+
>> + *              |         DP_VCO_CLK           |
>> + *              |                              |
>> + *              |    +-------------------+     |
>> + *              |    |   (DP PLL/VCO)    |     |
>> + *              |    +---------+---------+     |
>> + *              |              v               |
>> + *              |   +----------+-----------+   |
>> + *              |   | hsclk_divsel_clk_src |   |
>> + *              |   +----------+-----------+   |
>> + *              +------------------------------+
>> + *                              |
>> + *          +---------<---------v------------>----------+
>> + *          |                                           |
>> + * +--------v----------------+                          |
>> + * |    dp_phy_pll_link_clk  |                          |
>> + * |     link_clk            |                          |
>> + * +--------+----------------+                          |
>> + *          |                                           |
>> + *          |                                           |
>> + *          v                                           v
>> + * Input to DISPCC block                                |
>> + * for link clk, crypto clk                             |
>> + * and interface clock                                  |
>> + *                                                      |
>> + *                                                      |
>> + *      +--------<------------+-----------------+---<---+
>> + *      |                     |                 |
>> + * +----v---------+  +--------v-----+  +--------v------+
>> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
>> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
>> + * |              |  |              |  |               |
>> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
>> + * +-------+------+  +-----+--------+  +--------+------+
>> + *         |                 |                  |
>> + *         v---->----------v-------------<------v
>> + *                         |
>> + *              +----------+-----------------+
>> + *              |   dp_phy_pll_vco_div_clk   |
>> + *              +---------+------------------+
>> + *                        |
>> + *                        v
>> + *              Input to DISPCC block
>> + *              for DP pixel clock
>> + *
>> + */
>> +static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
>> +{
>> +	switch (req->rate) {
>> +	case 1620000000UL / 2:
>> +	case 2700000000UL / 2:
>> +	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
>> +		return 0;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>> +{
>> +	const struct qmp_usbc *qmp;
>> +	const struct phy_configure_opts_dp *dp_opts;
>> +
>> +	qmp = container_of(hw, struct qmp_usbc, dp_pixel_hw);
>> +
>> +	dp_opts = &qmp->dp_opts;
>> +
>> +	switch (dp_opts->link_rate) {
>> +	case 1620:
>> +		return 1620000000UL / 2;
>> +	case 2700:
>> +		return 2700000000UL / 2;
>> +	case 5400:
>> +		return 5400000000UL / 4;
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +static const struct clk_ops qmp_dp_pixel_clk_ops = {
>> +	.determine_rate	= qmp_dp_pixel_clk_determine_rate,
>> +	.recalc_rate	= qmp_dp_pixel_clk_recalc_rate,
>> +};
>> +
>> +static int qmp_dp_link_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
>> +{
>> +	switch (req->rate) {
>> +	case 162000000:
>> +	case 270000000:
>> +	case 540000000:
>> +		return 0;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static unsigned long qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>> +{
>> +	const struct qmp_usbc *qmp;
>> +	const struct phy_configure_opts_dp *dp_opts;
>> +
>> +	qmp = container_of(hw, struct qmp_usbc, dp_link_hw);
>> +	dp_opts = &qmp->dp_opts;
>> +
>> +	switch (dp_opts->link_rate) {
>> +	case 1620:
>> +	case 2700:
>> +	case 5400:
>> +		return dp_opts->link_rate * 100000;
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>> +static const struct clk_ops qmp_dp_link_clk_ops = {
>> +	.determine_rate	= qmp_dp_link_clk_determine_rate,
>> +	.recalc_rate	= qmp_dp_link_clk_recalc_rate,
>> +};
>> +
>> +static int phy_dp_clks_register(struct qmp_usbc *qmp, struct device_node *np)
>> +{
>> +	struct clk_init_data init = { };
>> +	char name[64];
>> +	int ret;
>> +
>> +	snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
>> +	init.ops = &qmp_dp_link_clk_ops;
>> +	init.name = name;
>> +	qmp->dp_link_hw.init = &init;
>> +	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_link_hw);
>> +	if (ret < 0) {
>> +		dev_err(qmp->dev, "link clk reg fail ret=%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->dev));
>> +	init.ops = &qmp_dp_pixel_clk_ops;
>> +	init.name = name;
>> +	qmp->dp_pixel_hw.init = &init;
>> +	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_pixel_hw);
>> +	if (ret) {
>> +		dev_err(qmp->dev, "pxl clk reg fail ret=%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
>> +{
>> +	int ret;
>> +
>> +	if (!IS_ERR(qmp->pipe_clk)) {
>> +		ret = phy_pipe_clk_register(qmp, np);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
> if dp_serdes != 0


Ack.


>> +		ret = phy_dp_clks_register(qmp, np);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
>> +}
>> +
>> +static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
>> +{
>> +	struct qmp_usbc *qmp = dev_get_drvdata(dev);
>> +
>> +	if (args->args_count == 0)
>> +		return qmp->usb_phy;
>> +
>> +	switch (args->args[0]) {
>> +	case QMP_USB43DP_USB3_PHY:
>> +		return qmp->usb_phy;
>> +	case QMP_USB43DP_DP_PHY:
>> +		return qmp->dp_phy;
>> +	}
>> +
>> +	return ERR_PTR(-EINVAL);
>> +}
>> +
>>  static int qmp_usbc_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -1703,16 +1944,32 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return ret;
>>  
>> -	/* Check for legacy binding with child node. */
>> -	np = of_get_child_by_name(dev->of_node, "phy");
>> -	if (np) {
>> -		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
>> -	} else {
>> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
> Should not be necessary.


Got it. I’ll merge the parsing logic into a single qmp_usbc_parse_dt function.

Also, I checked the compatible strings in the dtsi files for this PHY series
looks like no current product uses the legacy binding. 
I’ll drop qmp_usbc_parse_usb_dt_legacy in the next version.


>>  		np = of_node_get(dev->of_node);
>> -		ret = qmp_usbc_parse_usb_dt(qmp);
>> +
>> +		ret = qmp_usbc_parse_usb3dp_dt(qmp);
>> +		if (ret) {
>> +			dev_err(qmp->dev, "parse DP dt fail ret=%d\n", ret);
>> +			goto err_node_put;
>> +		}
>> +
>> +		ret = drm_aux_bridge_register(dev);
>> +		if (ret) {
>> +			dev_err(qmp->dev, "aux bridge reg fail ret=%d\n", ret);
>> +			goto err_node_put;
>> +		}
>> +	} else {
>> +		/* Check for legacy binding with child node. */
>> +		np = of_get_child_by_name(dev->of_node, "phy");
>> +		if (np) {
>> +			ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
>> +		} else {
>> +			np = of_node_get(dev->of_node);
>> +			ret = qmp_usbc_parse_usb_dt(qmp);
>> +		}
>> +		if (ret)
>> +			goto err_node_put;
>>  	}
>> -	if (ret)
>> -		goto err_node_put;
>>  
>>  	pm_runtime_set_active(dev);
>>  	ret = devm_pm_runtime_enable(dev);
>> @@ -1724,7 +1981,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>  	 */
>>  	pm_runtime_forbid(dev);
>>  
>> -	ret = phy_pipe_clk_register(qmp, np);
>> +	ret = qmp_usbc_register_clocks(qmp, np);
>>  	if (ret)
>>  		goto err_node_put;
>>  
>> @@ -1737,9 +1994,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>  
>>  	phy_set_drvdata(qmp->usb_phy, qmp);
>>  
>> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
> if dp_serdes != 0


Ack.


>> +		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
>> +		if (IS_ERR(qmp->dp_phy)) {
>> +			ret = PTR_ERR(qmp->dp_phy);
>> +			dev_err(dev, "failed to create PHY: %d\n", ret);
>> +			goto err_node_put;
>> +		}
>> +		phy_set_drvdata(qmp->dp_phy, qmp);
>> +	}
>> +
>>  	of_node_put(np);
>>  
>> -	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
>>  
>>  	return PTR_ERR_OR_ZERO(phy_provider);
>>  
>>
>> -- 
>> 2.34.1
>>
