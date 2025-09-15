Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D97F5B576E2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 12:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A7A10E448;
	Mon, 15 Sep 2025 10:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZz7aImc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E4810E448
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:45:16 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FgjZ020550
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3q9UHllEUzo7emL0csxSsit2MUCrJ9I6itNrb0wCCSE=; b=FZz7aImcq32G0kDj
 Oa/v2b1+4ho8TvoVx33/+DXzLu6BhQ+T0y2fU2AyBKpZPlGY9Kk3B3T/s4UjJO3x
 noR9HzsHnCHE+qs5qXNp4LA5L38qpD8KRJuCcw3w/RcKtM9wFfXVtWC2ygn864pG
 6rGWIDOGU0AKw5IN5vhxFFne2Pc/Nh4htyRXVZYhuEhEUAumTfGHbmSoyqc//iri
 +LzLbhra0i3BdLPrYDkwj24dJQofMd10m8psh9gl40fmyJnQ5yXRiuy3sylmDUXj
 zlOs2iqquxLthxrORvtKbARxuKl1sCNtqZU9sIW8cVCoHU0oN7K3b+l7k6UKzjQK
 +0QCbA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv4mev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 10:45:14 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-25e24e75b1bso3838875ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 03:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757933112; x=1758537912;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3q9UHllEUzo7emL0csxSsit2MUCrJ9I6itNrb0wCCSE=;
 b=fpAPOIr+s+rgPSnF42gWwWB+D9HHv8Y5WWrIIdKDpeCPOdjJ6uf954IjmlJebMl+gO
 d9viQENNrkxm3wt4shrpzGJh0KyIw9WPT3GKkZqkmGxOCzUrOjO0tPCXk/a6wk24amfC
 AFSjBvQSixqVtUgGhCyndauMDQeMDsX7eTQTrjt/J7WTrVJxwH7XYeIE8mDWs3gFiC8t
 O7IrsHIZ3gUjE88QMlE+VKEEpQB3cOn8FgYQmQ1PQlGgBn/eZT15eklhIJtAL17bA6sj
 lAsbohspdHHX+ylYQ5lTr1PeGiXl2NfrzcK085bmZT8prK9qi4/w3RqJp2jzQIxczI5t
 bY5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkMHFpg1ndPSyIKxwUv6Pl5i+UVD2cnxWec1yzxLEWqv5x1pDka+sqS4PjtToAQhold4b/33a8BNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyYRGlbNWtnwSTKa6JAz82xG0wlVSG6zGhGD1J6RE1Z+7ijbT0C
 TWZKO6JZCfH5YM0HnUq7ThJbJVxi/b6ShApM3mr0sY8lQhhPoI6ElVcJc5QfTyJac2S96FS9jBR
 8M6aJpo8o57tub3JHsPTzsaq6VrNDAOArXlg5ymua9pjWD3vy+z89V9Vu7POYbBFPv7JDdpI=
X-Gm-Gg: ASbGnctaE28R/jKlLHiY78xjUC0893KU6u2LpZ2lmxamtmT6lf7uA/WudYxbpaemUfh
 vmcpTUViSU3l3wEXaBr9Ydo9Pb+x1qtwjzo5m8ygIRO8w+LvoNbhTkorEFbd7LCWZQFyKgLF+aa
 R3dymhT4GAeqi9qFj1Q33W7ulSWvt4020Uuzmb+N8fIHsGA5iJNzUDi2WMpRLg/rjxAyd6Kq6W1
 gMi/pgeQnUXWpT+EStNQI1+LTeEYrHFS1v+NW3m8FWN4aBAAHe+WBd+NCbHb7zcnyUf/mlG9u9j
 KHW2bA8PRDoWazGZBCWVbH0AzJMOFCyiSq54brozEIslLiFcsyhlJHfVn0RiF5WRJw1veg6zxlC
 GTbwT84VBwT1A+ATqqtvrmj5jc4gOaiDXrQ0=
X-Received: by 2002:a17:902:c94a:b0:262:923b:4e2e with SMTP id
 d9443c01a7336-262923b5125mr46665175ad.11.1757933112383; 
 Mon, 15 Sep 2025 03:45:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYdD9O4QdRiVJ5hAs101DS3Zf4FAq6fcZz1dgavqsmhdSqj3W4RYmxEazrWjBJJAH2vJCcqw==
X-Received: by 2002:a17:902:c94a:b0:262:923b:4e2e with SMTP id
 d9443c01a7336-262923b5125mr46664835ad.11.1757933111666; 
 Mon, 15 Sep 2025 03:45:11 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2664f0071e5sm27436305ad.68.2025.09.15.03.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 03:45:11 -0700 (PDT)
Message-ID: <8baa3f62-8069-42cb-810d-33e1ad61abbb@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 18:45:02 +0800
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
 <05e8069e-895c-48b2-8a25-a4a680728cfa@oss.qualcomm.com>
 <ykxl2xjrabsvs6llaf6p3cpiler2nhyrsbnhrbvhtl2is27cig@fbtj45n4e2yd>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ykxl2xjrabsvs6llaf6p3cpiler2nhyrsbnhrbvhtl2is27cig@fbtj45n4e2yd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XX31CuRWGQ2F1ix1FoepDzqH_6gT0yUz
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c7ee3a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=rsY2jHysN4_Lp2AvgbIA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: XX31CuRWGQ2F1ix1FoepDzqH_6gT0yUz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfX3wkor4y72Uqk
 MqRUc6U0RbdoIiy3P58Ck62TvxaamLjEknE50BlvMPZrFSNM8X43RAoEbprNeGuLGI0st19+NWg
 v5zQ4LqUz2M3kICtX0HiB/7FjK8FE9BV6rjya1IKNipGvqoSHRuE00OecG+3oDyAvNw1K8ZY1Vz
 KPY/IDatBL/kcfBcJ/kkHk8CrUeAl7sr4OC7fNE/oKd/eHWgc6lsiZppqF/cyCVDXhdJRBkvVGl
 YBUzevv+VoPxdcMPdTxiq+pW8C8/SCM/szlsWV4cWUhKsjXR0J79Glp6/MAsDSE9/lISPd0nHMt
 UI9MLcCXFQG0k1h1AiVpILkNpKglWyHPm0haGZwQpPaFCNau/CzqUMMR8odpudi+poVY4lzqxpM
 qLmSWW0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029
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


On 9/15/2025 6:14 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 06:02:19PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 8:08 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 12, 2025 at 08:00:14PM +0800, Xiangxu Yin wrote:
>>>> On 9/12/2025 6:19 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Sep 11, 2025 at 10:55:05PM +0800, Xiangxu Yin wrote:
>>>>>> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
>>>>>> Extend qmp_usbc_register_clocks and clock provider logic to support both
>>>>>> USB and DP instances.
>>>>>>
>>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 208 +++++++++++++++++++++++++++++--
>>>>>>  1 file changed, 195 insertions(+), 13 deletions(-)
>>>>>> +	default:
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +}
>>>>>> +
>>>>>> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
>>>>>> +{
>>>>>> +	int ret;
>>>>>>  
>>>>>> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
>>>>>> +	ret = phy_pipe_clk_register(qmp, np);
>>>>>>  	if (ret)
>>>>>>  		return ret;
>>>>>>  
>>>>>> -	/*
>>>>>> -	 * Roll a devm action because the clock provider is the child node, but
>>>>>> -	 * the child node is not actually a device.
>>>>>> -	 */
>>>>>> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
>>>>>> +	if (qmp->dp_serdes != 0) {
>>>>>> +		ret = phy_dp_clks_register(qmp, np);
>>>>>> +		if (ret)
>>>>>> +			return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
>>>>> Do you understand what did the comment (that you've removed) say? And
>>>>> why?
>>> And this was ignored :-(
>> Sorry for missing this part.
>>
>> For USB-C PHY, the legacy implementation only supports USB with a single
>> device node. The new driver for USB and DP also uses a single device node.
> There is no 'new driver'. It's about DT.
>
>> The function devm_of_clk_add_hw_provider internally handles both
>> of_clk_add_hw_provider and devres_add, and supports automatic resource
>> release.
>>
>> So I think using devm_of_clk_add_hw_provider allows us to remove
>> of_clk_add_hw_provider and devm_add_action_or_reset.
> Which node is passed to of_clk_add_hw_provider() in the legacy DT case?
> Which node is passed to of_clk_add_hw_provider() by
> devm_of_clk_add_hw_provider()?


Ohh, legacy is child node and devm is dev->of_node.

Will add that back for compatibility.


>> For combo PHY, the legacy implementation uses two device nodes: dp_np and
>> usb_np. To maintain forward compatibility, we need to keep support for
>> both nodes and retain the related logic.
