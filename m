Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8116B5756F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C33A10E3C9;
	Mon, 15 Sep 2025 10:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdXkj1dq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B1410E34A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:02:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8G3GM006505
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RTisw5ByyI4F3Zifb2Z49clSLFGezt1mwX++Bhg1W20=; b=HdXkj1dqqcFsFQUK
 AIZ04BaOkDvwUVOHs2RB2vPjqIwH1Cy9KnkD+KJkaBgvJtX4V3y6R90jebdwix8S
 CLxfOOOmNmuMy12wY1MDPJtThE8mVXxT6bByMsJfuGFxjT78dSZvGvAANylZMZF0
 c8F0j6dm7bJsBEVzDXYYi3Btpaah+v9cb/qrhT8HzPAajtIyTJR7TJB/gJIGxpKs
 kN9MvvjNdQRINiNUs/grX5aVQWopX2hNo9DgjmWCU7uMyq8DHr/2dKpMtV/3FVRQ
 Konw9X0nVZQfB48+P/wmRJ3bYDel+k/fTa1vVQgdJ9imFCtyYaevqcVJ2DSG+hz2
 uIPHxA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chcdky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:02:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24cedbddd35so17686785ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 03:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757930550; x=1758535350;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RTisw5ByyI4F3Zifb2Z49clSLFGezt1mwX++Bhg1W20=;
 b=iAjy0FfxO5m26oYl8G7ZOfCET3eBkFVCTxrPBWMAlOJJThv5FCRMw2Y7+RpBQbrmi9
 c4guMRE8XyOY9ImPOseUfN+dFFoYxO+Qb3Cx6CjZGjtMqcJbJlttc9HtUysXfQqLd2Lt
 Kuq9DTLpWrLGZZAZGyN8eQzwnMJnwILf88JMh6fH34onjFLyeguVwQAWBK5y26LeUFO5
 6viueOmRB/5SGGWy4kacGgHh3aLA8giUuy0wTj5R+EaR1SFW5Io7F83gCNuy7vV+2rq5
 ZiXYB4aoZvwZJTLPzxrgt78vJAlmoJ5ipxj8U8KEdD3qAN+WAvG8KYa2MQtQB6EoaEax
 /rkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDSU6GzFvAMXtdmNc80YB7ciZJGnvtq4pyLXR9IstIU8vUXly6Osgziv8gzVPVGkJEvvcuMPvG354=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX9cQQGcxlw4phXI2QwK3i07uhOgzXGHuKPIBCnkkRvexlIMZW
 GlIfnrBiorATT/rLVBePJ+XB6NIMeCs1nHxJTZtB4IJNrAC+6IMWOqPGp1I0axUuXOPQDXrazBh
 sP2OVNQqMI3BicmFgKGBSDKvfnQw/mN0w/YI/XsJ0AGPztjg0lzfMeYc8dc0lIzw6yWPVNcg=
X-Gm-Gg: ASbGncutxi+j/aUxeq469AuDl0r7lIRJZuSi24a1WGGwEJpsB1ZEydDKqu4RHnMex09
 glZ5YixquI7nRDkGkaIEiYOOdtDEmRsK6LGI7uwQcWY/Yv3rC4IiFS8wIJIvp+xrIk/iOewp1KW
 806Y/BBXU+ZWqv0TxVpiYMHt3U9N0F5vAFr+9GnJoekycM7o5NY7yvIhkq8M5GeLulWcvAVYkhR
 6+Mp7VfDnd86U5J02yGrgTEzmU1yqOvPSct0OTA04NJqkP9LZ2tnYRH0z9mz0BiiEiRWv1ic4FK
 ni2oNsKsuow000sYoXjAXjLv+K/VIxvGwkqmfBHiwsgWhd8JKen9v2WYuvpbRShVkFC3uUCvWqY
 iqyN53yzJ2PDU0I7tMRBWUpNCaCJM0PxcPp8=
X-Received: by 2002:a17:903:1245:b0:248:dd61:46e8 with SMTP id
 d9443c01a7336-25d25a7294bmr75003365ad.5.1757930550176; 
 Mon, 15 Sep 2025 03:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlN8SXzL/M7lGiB6fe82u+OD/VJPAV8UoBvXqWaww58FVu70TKBhRJPMQALRvqJffcvDnBdw==
X-Received: by 2002:a17:903:1245:b0:248:dd61:46e8 with SMTP id
 d9443c01a7336-25d25a7294bmr75002895ad.5.1757930549486; 
 Mon, 15 Sep 2025 03:02:29 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-264277e8bc2sm42618715ad.138.2025.09.15.03.02.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 03:02:29 -0700 (PDT)
Message-ID: <05e8069e-895c-48b2-8a25-a4a680728cfa@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 18:02:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
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
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-8-2702bdda14ed@oss.qualcomm.com>
 <6p43oxn57kke5eotoqtt5gqtmhmgeteoymewqm3ko5q5veyegs@krkh4dwdno5i>
 <335ffce5-19c6-409d-8386-686fe9e5dea5@oss.qualcomm.com>
 <7ozv3u7xuvtz2x5q3pp5kdeydtsu5jlrgwjnxpxxiuh7przr2z@35uo7t3b4ze2>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <7ozv3u7xuvtz2x5q3pp5kdeydtsu5jlrgwjnxpxxiuh7przr2z@35uo7t3b4ze2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c7e437 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Jnl8Gmoy9ed6ZAd_i4cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: a67FxmFab23yQhGNsWxEEg6fVJG0Oq0d
X-Proofpoint-GUID: a67FxmFab23yQhGNsWxEEg6fVJG0Oq0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX8ulyKl2vmAm9
 rx+YAdpiSI/9fe7huj5wtxtcOZ0tMwz+UkRRhvMv1rUDX3RyutAdBvoXXTB1aO1+oZH3MGIGGU0
 XCHOCk/qBWFsk4oc4yYT9ffO7Gho0aAxGglWcrtvWKhiR3XI/oZBD7nqQSodzMw9LTtPX2gpErX
 yiJ0Xf8eIlT/i22X+e9EgVMxyEvVfMOWaRcRdQtshLmVlAJdXDgaSqLWJmHKsrrbgksNL/6uIcz
 qPc0niuNlCF6yXtZ5WrTL3US3JEvmkUjw05de6SO0OI3sz7++I1afyH/epmu2upj1axOLqR6pPb
 1L3YFoXMPdcpo1IzhbiDAmQvM7+hL2Dr6sTQcMzvhMth6t8t/NIpxytULZ0gbVwIY52lxniu18+
 DBPH9PWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036
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


On 9/12/2025 8:08 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 12, 2025 at 08:00:14PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 6:19 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 11, 2025 at 10:55:05PM +0800, Xiangxu Yin wrote:
>>>> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
>>>> Extend qmp_usbc_register_clocks and clock provider logic to support both
>>>> USB and DP instances.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 208 +++++++++++++++++++++++++++++--
>>>>  1 file changed, 195 insertions(+), 13 deletions(-)
>>>>
>>>> @@ -1276,8 +1291,11 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>>>>  
>>>>  	ret = of_property_read_string(np, "clock-output-names", &init.name);
>>>>  	if (ret) {
>>>> -		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
>>>> -		return ret;
>>>> +		char name[64];
>>>> +
>>>> +		/* Clock name is not mandatory. */
>>>> +		snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(qmp->dev));
>>>> +		init.name = name;
>>>>  	}
>>> Do we have any guarantees that memory for 'name' exists beyond this point?
>>
>> If the previous of_property_read_string() call succeeded, could 'name'
>> still be empty? or you means 'char name[64]' will be release after '}'?
>>
>> From local verification, I can see 88e8000.phy::pipe_clk node from clk_summary.
> char name[64] belong to a stack frame that is not guaranteed to exist
> after you've close this bracked. So it can be easily overwritten with
> other values.


You are right, will move char name[64] declaration to beginning of function.


>>
>>>>  
>>>>  	init.ops = &clk_fixed_rate_ops;
>>>> @@ -1286,19 +1304,176 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>>>>  	fixed->fixed_rate = 125000000;
>>>>  	fixed->hw.init = &init;
>>>>  
>>>> -	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
>>>> -	if (ret)
>>>> +	return devm_clk_hw_register(qmp->dev, &fixed->hw);
>>>> +}
>>>> +
>>>> +
>>>> +/*
>>>> + * Display Port PLL driver block diagram for branch clocks
>>>> + *
>>>> + *              +------------------------------+
>>>> + *              |         DP_VCO_CLK           |
>>>> + *              |                              |
>>>> + *              |    +-------------------+     |
>>>> + *              |    |   (DP PLL/VCO)    |     |
>>>> + *              |    +---------+---------+     |
>>>> + *              |              v               |
>>>> + *              |   +----------+-----------+   |
>>>> + *              |   | hsclk_divsel_clk_src |   |
>>>> + *              |   +----------+-----------+   |
>>>> + *              +------------------------------+
>>>> + *                              |
>>>> + *          +---------<---------v------------>----------+
>>>> + *          |                                           |
>>>> + * +--------v----------------+                          |
>>>> + * |    dp_phy_pll_link_clk  |                          |
>>>> + * |     link_clk            |                          |
>>>> + * +--------+----------------+                          |
>>>> + *          |                                           |
>>>> + *          |                                           |
>>>> + *          v                                           v
>>>> + * Input to DISPCC block                                |
>>>> + * for link clk, crypto clk                             |
>>>> + * and interface clock                                  |
>>>> + *                                                      |
>>>> + *                                                      |
>>>> + *      +--------<------------+-----------------+---<---+
>>>> + *      |                     |                 |
>>>> + * +----v---------+  +--------v-----+  +--------v------+
>>>> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
>>>> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
>>>> + * |              |  |              |  |               |
>>>> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
>>>> + * +-------+------+  +-----+--------+  +--------+------+
>>>> + *         |                 |                  |
>>>> + *         v---->----------v-------------<------v
>>>> + *                         |
>>>> + *              +----------+-----------------+
>>>> + *              |   dp_phy_pll_vco_div_clk   |
>>>> + *              +---------+------------------+
>>>> + *                        |
>>>> + *                        v
>>>> + *              Input to DISPCC block
>>>> + *              for DP pixel clock
>>>> + *
>>>> + */
>>>> +static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
>>>> +{
>>>> +	switch (req->rate) {
>>>> +	case 1620000000UL / 2:
>>>> +	case 2700000000UL / 2:
>>>> +	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
>>>> +		return 0;
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +}
>>>> +
>>>> +static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>>> +{
>>>> +	const struct qmp_usbc *qmp;
>>>> +	const struct phy_configure_opts_dp *dp_opts;
>>>> +
>>>> +	qmp = container_of(hw, struct qmp_usbc, dp_pixel_hw);
>>>> +
>>>> +	dp_opts = &qmp->dp_opts;
>>>> +
>>>> +	switch (dp_opts->link_rate) {
>>>> +	case 1620:
>>>> +		return 1620000000UL / 2;
>>>> +	case 2700:
>>>> +		return 2700000000UL / 2;
>>>> +	case 5400:
>>>> +		return 5400000000UL / 4;
>>> No HBR3 support? Then why was it mentioned few lines above?


Yes, no HBR3 support, will update annotation in qmp_dp_pixel_clk_determine_rate


>>>> +	default:
>>>> +		return 0;
>>>> +	}
>>>> +}
>>>> +
>>>> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
>>>> +{
>>>> +	int ret;
>>>>  
>>>> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
>>>> +	ret = phy_pipe_clk_register(qmp, np);
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> -	/*
>>>> -	 * Roll a devm action because the clock provider is the child node, but
>>>> -	 * the child node is not actually a device.
>>>> -	 */
>>>> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
>>>> +	if (qmp->dp_serdes != 0) {
>>>> +		ret = phy_dp_clks_register(qmp, np);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
>>> Do you understand what did the comment (that you've removed) say? And
>>> why?
>
> And this was ignored :-(

Sorry for missing this part.

For USB-C PHY, the legacy implementation only supports USB with a single
device node. The new driver for USB and DP also uses a single device node.

The function devm_of_clk_add_hw_provider internally handles both
of_clk_add_hw_provider and devres_add, and supports automatic resource
release.

So I think using devm_of_clk_add_hw_provider allows us to remove
of_clk_add_hw_provider and devm_add_action_or_reset.

For combo PHY, the legacy implementation uses two device nodes: dp_np and
usb_np. To maintain forward compatibility, we need to keep support for
both nodes and retain the related logic.


>>>>  }
>>>>  
>>>>  #if IS_ENABLED(CONFIG_TYPEC)
>>>> @@ -1429,6 +1604,13 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
>>>>  	if (IS_ERR(base))
>>>>  		return PTR_ERR(base);
>>>>  
>>>> +	if (offs->dp_serdes != 0) {
>>>> +		qmp->dp_serdes = base + offs->dp_serdes;
>>>> +		qmp->dp_tx = base + offs->dp_txa;
>>>> +		qmp->dp_tx2 = base + offs->dp_txb;
>>>> +		qmp->dp_dp_phy = base + offs->dp_dp_phy;
>>>> +	}
>>>> +
>>>>  	qmp->serdes = base + offs->serdes;
>>>>  	qmp->pcs = base + offs->pcs;
>>>>  	if (offs->pcs_misc)
>>>> @@ -1537,7 +1719,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>>>  	 */
>>>>  	pm_runtime_forbid(dev);
>>>>  
>>>> -	ret = phy_pipe_clk_register(qmp, np);
>>>> +	ret = qmp_usbc_register_clocks(qmp, np);
>>>>  	if (ret)
>>>>  		goto err_node_put;
>>>>  
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
