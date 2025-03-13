Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52152A5F3E1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C66CF10E874;
	Thu, 13 Mar 2025 12:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KjZHgtMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CD910E873;
 Thu, 13 Mar 2025 12:10:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D7CAmG019811;
 Thu, 13 Mar 2025 12:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c7UkRMW05zKg8RDl3mwjjPVBN91r1eiT1QbA7lGZtpA=; b=KjZHgtMQ4FccHN6q
 cMJ3mkAz/0+eZDAqqFbNquykWNWZuzhDQizsUJPq8sYxzG491d8EBzV0ERnLi+su
 NZmYf7bDVGjmZGEuZJDP1zathfnmDkP8rcZKXd7Dhd2XVjf2ae2XcH6ApMpT3WG6
 4vsJUHnK9SKQMQM6FNFTOT3Eruu5bkZWT57lNprYHUPYKHweH5xzVrot+5ayFw6X
 YYMpRra51u4o5iMe9hpHVPPXlCCjw9zHoKuuvuOTLXNrKYmJ8YbKD9qfqNb+nipL
 JJ7Gno+rBp66gmXmomgyZrV9lVpo9QbWnPIIFbLi8gFLRN41gERlIsSrEPqVNQ92
 0wvrzg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bts0gu45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Mar 2025 12:10:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DCAHEO015684
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Mar 2025 12:10:17 GMT
Received: from [10.204.66.137] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 13 Mar
 2025 05:10:10 -0700
Message-ID: <d64bf3b3-7c4d-490e-8bd7-1ad889aa7472@quicinc.com>
Date: Thu, 13 Mar 2025 17:40:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
 <marijn.suijten@somainline.org>, <andersson@kernel.org>,
 <robh@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
 <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_abhinavk@quicinc.com>, <quic_rajeevny@quicinc.com>,
 <quic_vproddut@quicinc.com>, <quic_jesszhan@quicinc.com>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-8-quic_amakhija@quicinc.com>
 <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20250312-athletic-cockle-of-happiness-e88a3a@krzk-bin>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6BtJ98pGmkmWzLj0xA-sndcThuicNPoa
X-Authority-Analysis: v=2.4 cv=DNSP4zNb c=1 sm=1 tr=0 ts=67d2cb2a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=UXIAUNObAAAA:8
 a=COk6AnOGAAAA:8 a=2y1opo3hKBB_uxp-C3oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFq2RbqkfqsA:10
 a=a1s67YnXd6TbAZZNj1wK:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6BtJ98pGmkmWzLj0xA-sndcThuicNPoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130095
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

On 3/12/2025 5:18 PM, Krzysztof Kozlowski wrote:
> On Tue, Mar 11, 2025 at 05:54:42PM +0530, Ayushi Makhija wrote:
>> Add anx7625 DSI to DP bridge device nodes.
>>
>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 208 ++++++++++++++++++++-
>>  1 file changed, 207 insertions(+), 1 deletion(-)
>>
> 
> So you just gave up after one comment? Context of every email should be
> trimmed, so if it is not trimmed means something is still there. I know
> there are reviewers who respond with huge unrelated context, but that's
> just disrespectful to our time and don't take it as normal.
> 
> <form letter>
> This is a friendly reminder during the review process.
> 
> It seems my or other reviewer's previous comments were not fully
> addressed. Maybe the feedback got lost between the quotes, maybe you
> just forgot to apply it. Please go back to the previous discussion and
> either implement all requested changes or keep discussing them.
> 
> Thank you.
> </form letter>
> 

Hi Krzysztof,

Thanks, for the review.

I apologize for any confusion or oversight regarding the recent review comments.
Thank you for your patience and understanding. I value your time and feedback and will work to improve the review process.

Below are the comments on the patch 7 and patch 8 of the version 1 of the series, that I have addressed in version 2 of patch 7 of the series.
Let me know, If I did some mistake or if you have any other suggestions.

Comments from Konard:

comment 1

> -	pinctrl-0 = <&qup_i2c18_default>;
> +	pinctrl-0 = <&qup_i2c18_default>,
> +			<&io_expander_intr_active>,
> +			<&io_expander_reset_active>;

Please align the '<'s

comment 2

> +		interrupt-parent = <&tlmm>;
> +		interrupts = <98 IRQ_TYPE_EDGE_BOTH>;

use interrupts-extended, here and below

These above two comments were from the konard in patch 7 in version 1 of the series.
I have addressed both the above comments in the version 2 of patch 7 of the series.



Comments from Krzysztof:

comment 1

> +
> +		dsi0_int_pin: gpio2_cfg {
No underscores, see DTS coding style.

I have corrected the above comment in the version 2 of patch 7 of the series.

comment 2

> +
> +			anx_bridge_1: anx7625@58 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

In this I have changed the node name as anx_bridge1 : anx7625@58.
Let me know, if I did some mistake or you have any other suggestion over the node name.

I have took the reference from below:
linux/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi at 629c635eafbaf18260c8083360745c71674640d2 · torvalds/linux · GitHub

comment 3

> +				enable-gpios = <&io_expander 1 0>;
> +				reset-gpios = <&io_expander 0 0>;
Use proper defines.

For this above comment,  I have changed above lines into below lines in patch 7 of version 2 of the series.

> +				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
> +				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;

comment 4

> +
> +			anx_bridge_2: anx7625@58 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

In this I have changed the node name as anx_bridge2 : anx7625@58.
Let me know, if I did some mistake or you have any other suggestion over the node name.

I have took the reference from below:
linux/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi at 629c635eafbaf18260c8083360745c71674640d2 · torvalds/linux · GitHub

comment 5

And as Rob's bot pointed out: insufficient testing. :(
Please be 100% sure everything is tested before you post new version.
You shouldn't use reviewers for the job of tools, that's quite waste of
our time.

Fixed the  above warning from DT checker against DT binding in patch 7 of version 2 of the series.


Comments from Dmitry:

comment 1

Missing dp-connector devices. Please add them together with the bridges. 

comment 2

Please squash into the previous patch. It doesn't make a lot of sense separately.

These both above commented from Dmitry I have addressed in the version 2 of patch 7 of the series.
I have squash patch 8 into patch 7 of version 1 into patch 7 of version 2 of the series.


Thanks,
Ayushi
