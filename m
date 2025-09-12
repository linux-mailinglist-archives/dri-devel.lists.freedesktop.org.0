Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53107B5494A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 12:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B657A10EBF5;
	Fri, 12 Sep 2025 10:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C4+R0dLt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F3310EBF5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:19:14 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fCxS018529
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+8BSRPhlzIdQp9y41D5xs6eH
 qedfNxQ0XWH6TT8qk+k=; b=C4+R0dLtc/nLAf2A6VgC54MT9HbrdeDyVK13a/Z1
 PEIUskUXc1uO1YjMazZiUE5+NXV1y8wDStE96FPmCHy2mLS7NktygpJf4xehUJXf
 KpyWMq0ySs4JXvyhhKvTkNCBzEbb3fhMq/TXCNV8rr5Y1vMq2OGN2xTB5mj072us
 /T5jcwsU0HALTeQmHKE/HYWPdlk3AcXq1vS9Pmv2V8+RL1FXOMWtg/+QkuTLjNvs
 Qg1MsCni9U3nnZ2CY49OApKBJg1vm8QdxnfnJOt5ebchQDq7LfHn8a65R359n5ei
 QskQueW2QmZhueOgjo+CW7dX9RXAGXRY8WQwCORKH1F04A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ak50w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 10:19:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b32d323297so37605111cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 03:19:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757672352; x=1758277152;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8BSRPhlzIdQp9y41D5xs6eHqedfNxQ0XWH6TT8qk+k=;
 b=Q2jhoCRaNUouSpZW+vIeq2f8cvk55gkJNYVZAcqgCfbnIZSrM9Cn4Y/g8IQxvMogNf
 ql7S2SbKcRqj5yK/QvjFPVXZ0nDKXmHjkpNdoKZaazr2Hxmb3/f4YF9nmozb1FJKIVQS
 uhh9Re4fhOg3UdMNBM7PlTK8pQlAgW85ICAQcj4QkCsBQqv8mlJp/FOHmMHjMlwudS2s
 s7KAFl3InMys5gHTOk5YlXIVreKebkp+8qunMDz07FcbJN5ukNhR6qUfwY60FhixYBrk
 w+3gnzRdDqoYDx8giQSjO4/NkfGeAes2C3Mvf0hpeyBLvplJfziwEpEAHHwSjo6Yq56T
 agEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeHZsnFF0rDs7SXhEnBVhjWiN92CPz5d6aacbpaKuZRzY7P/iQSdd0dhjIx9Ka2NLaQbI9xAKyPKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtjKmryTcvtpJjbp7VvpDECXlqYRNMNk3QrtNgdP8nPV8N3urs
 6DfXQ9lypKUWf3hNElpuyqmZZ27VzEqVxHxav9TJcHy/a8VodKuV3n25N4Ok5buBd4LQ8uMYxnl
 FOHMgOHGEsqDRJdTt3sWROufOCPg+2dEdEqg4rI2pp8G+OUPo8YGoMzWuCqfdTfjvdcuJ7Js=
X-Gm-Gg: ASbGncuHjEVPaQhuT3WJzOwyScOiVhJ7Kq0mohCRCba7OqgoHBbruLnevaV8EHHlHm5
 ZRMHYjT/B5VFRcqpcewfm0zqHJU9d1uwc2UvawBFgEPQonqz7X0hkH0kDTa4JXk5I5b0eWU16CC
 xS/t9ocChk0qiLlLhI7Gdcdmt+0mJVPUDzkwwQJ5RgO+Xg6optu73yFLlhvuwnsqNBO9nK69EAL
 vriQMXge8YEBh4jKhX4fenvB+O2U+gP+obX8BTMaevxk7ZZUplnZ9LFeMM6+aaSzHsIaMInlgXD
 9245Chkn20nbUXHX+/03mDDNhgCkNJGL2PHeWii4bPosb8la3KQ3gH65ZchfueQXyNW7HGCE5zY
 srd+k2URGuTYEP1D5sDrEC9O0S4ipadiqYbv4vXsTYQ1ZMso+glbE
X-Received: by 2002:ac8:5d51:0:b0:4b5:4874:4fa5 with SMTP id
 d75a77b69052e-4b77d07ee69mr30002861cf.18.1757672352010; 
 Fri, 12 Sep 2025 03:19:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDr/xf3Xq/zG3qRRgOoMRE9GeT+a6DC6K2ISKAktnMWoKUg/v0LpRmDDlLQEuN+IJgK34ztQ==
X-Received: by 2002:ac8:5d51:0:b0:4b5:4874:4fa5 with SMTP id
 d75a77b69052e-4b77d07ee69mr30002371cf.18.1757672351305; 
 Fri, 12 Sep 2025 03:19:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e6460f138sm1035638e87.111.2025.09.12.03.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:19:10 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:19:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 08/13] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
Message-ID: <6p43oxn57kke5eotoqtt5gqtmhmgeteoymewqm3ko5q5veyegs@krkh4dwdno5i>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-8-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-8-2702bdda14ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c3f3a1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Prb7D_9PTKkpd4Urf3EA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: Jt1Zn3-O1rLVdiBWGfBbBQjHIKvzV9m3
X-Proofpoint-ORIG-GUID: Jt1Zn3-O1rLVdiBWGfBbBQjHIKvzV9m3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX88st0dDmzlZb
 eA4/lJqvs/namKxA5eNej87/1UkuGItTiqUH0uCV5/XJrhCmQnH/DAm8zYL55iv4Mhd6hXmka8v
 MjsM4bk4iMXsegzdWhTM+xyBpKEvSZR2E2rHBJ4NJ+klJNuS2LLluyTihCIBHBuCazLkfYg5MI1
 tkzHZaO8wjU4ptLBfAxR5wFs0yWuqW8WoK2J+FfVuIxbeB4KR+RiQiDIG8cgMTPXAkFV4pHBMIp
 BNEbGVTC0hJR6WiR9+5B9rT/Rl/DuUski/VVZdF2909dC8DUomoLbZuh4wgsh2cM0uBfPevlWBC
 Y/kmwXqbxVN/s/6J3cs+XTyoPlB3/n+sOrpbeUuBXE7Iwniij5vP+eKqqkGZ70vSryijmzpPPmf
 cmyjHBpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On Thu, Sep 11, 2025 at 10:55:05PM +0800, Xiangxu Yin wrote:
> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
> Extend qmp_usbc_register_clocks and clock provider logic to support both
> USB and DP instances.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 208 +++++++++++++++++++++++++++++--
>  1 file changed, 195 insertions(+), 13 deletions(-)
> 
> @@ -1276,8 +1291,11 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>  
>  	ret = of_property_read_string(np, "clock-output-names", &init.name);
>  	if (ret) {
> -		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
> -		return ret;
> +		char name[64];
> +
> +		/* Clock name is not mandatory. */
> +		snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(qmp->dev));
> +		init.name = name;
>  	}

Do we have any guarantees that memory for 'name' exists beyond this point?

>  
>  	init.ops = &clk_fixed_rate_ops;
> @@ -1286,19 +1304,176 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>  	fixed->fixed_rate = 125000000;
>  	fixed->hw.init = &init;
>  
> -	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
> -	if (ret)
> +	return devm_clk_hw_register(qmp->dev, &fixed->hw);
> +}
> +
> +
> +/*
> + * Display Port PLL driver block diagram for branch clocks
> + *
> + *              +------------------------------+
> + *              |         DP_VCO_CLK           |
> + *              |                              |
> + *              |    +-------------------+     |
> + *              |    |   (DP PLL/VCO)    |     |
> + *              |    +---------+---------+     |
> + *              |              v               |
> + *              |   +----------+-----------+   |
> + *              |   | hsclk_divsel_clk_src |   |
> + *              |   +----------+-----------+   |
> + *              +------------------------------+
> + *                              |
> + *          +---------<---------v------------>----------+
> + *          |                                           |
> + * +--------v----------------+                          |
> + * |    dp_phy_pll_link_clk  |                          |
> + * |     link_clk            |                          |
> + * +--------+----------------+                          |
> + *          |                                           |
> + *          |                                           |
> + *          v                                           v
> + * Input to DISPCC block                                |
> + * for link clk, crypto clk                             |
> + * and interface clock                                  |
> + *                                                      |
> + *                                                      |
> + *      +--------<------------+-----------------+---<---+
> + *      |                     |                 |
> + * +----v---------+  +--------v-----+  +--------v------+
> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
> + * |              |  |              |  |               |
> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
> + * +-------+------+  +-----+--------+  +--------+------+
> + *         |                 |                  |
> + *         v---->----------v-------------<------v
> + *                         |
> + *              +----------+-----------------+
> + *              |   dp_phy_pll_vco_div_clk   |
> + *              +---------+------------------+
> + *                        |
> + *                        v
> + *              Input to DISPCC block
> + *              for DP pixel clock
> + *
> + */
> +static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	switch (req->rate) {
> +	case 1620000000UL / 2:
> +	case 2700000000UL / 2:
> +	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	const struct qmp_usbc *qmp;
> +	const struct phy_configure_opts_dp *dp_opts;
> +
> +	qmp = container_of(hw, struct qmp_usbc, dp_pixel_hw);
> +
> +	dp_opts = &qmp->dp_opts;
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +		return 1620000000UL / 2;
> +	case 2700:
> +		return 2700000000UL / 2;
> +	case 5400:
> +		return 5400000000UL / 4;

No HBR3 support? Then why was it mentioned few lines above?

> +	default:
> +		return 0;
> +	}
> +}
> +


> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
> +{
> +	int ret;
>  
> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
> +	ret = phy_pipe_clk_register(qmp, np);
>  	if (ret)
>  		return ret;
>  
> -	/*
> -	 * Roll a devm action because the clock provider is the child node, but
> -	 * the child node is not actually a device.
> -	 */
> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
> +	if (qmp->dp_serdes != 0) {
> +		ret = phy_dp_clks_register(qmp, np);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);

Do you understand what did the comment (that you've removed) say? And
why?

>  }
>  
>  #if IS_ENABLED(CONFIG_TYPEC)
> @@ -1429,6 +1604,13 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> +	if (offs->dp_serdes != 0) {
> +		qmp->dp_serdes = base + offs->dp_serdes;
> +		qmp->dp_tx = base + offs->dp_txa;
> +		qmp->dp_tx2 = base + offs->dp_txb;
> +		qmp->dp_dp_phy = base + offs->dp_dp_phy;
> +	}
> +
>  	qmp->serdes = base + offs->serdes;
>  	qmp->pcs = base + offs->pcs;
>  	if (offs->pcs_misc)
> @@ -1537,7 +1719,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	 */
>  	pm_runtime_forbid(dev);
>  
> -	ret = phy_pipe_clk_register(qmp, np);
> +	ret = qmp_usbc_register_clocks(qmp, np);
>  	if (ret)
>  		goto err_node_put;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
