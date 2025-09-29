Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3927BA8251
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124D310E20B;
	Mon, 29 Sep 2025 06:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="WhdhsdC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C25E10E20B;
 Mon, 29 Sep 2025 06:38:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNZL8A024951;
 Mon, 29 Sep 2025 06:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0Wwp0ui9LZTjW5hEyOqQaARM+F1QT11GdHJo1HDYoFo=; b=WhdhsdC8Jj64C7Hp
 CO1QsBfCtx4WE0OZnLlnmh7edAoXHFin258qcNUaefCNBmnEXbLOHHYzJyYui43F
 auKIdC/qy7C14khFJmuvEqjwaS3nNKo3/2GZa3QbmNaVn3prXV+yFAYfF+nWwm+z
 WhDnv16d9lTEZbR0kRCVrXiW/gdztL5SRuRU02s+505sFZhXPPD2Y15U56upk47y
 lGsJu0cjo9kZqdXZbAO3oQVAXoQNFHTkBQtC+Mr0XM+ylNuWVx1mvxnHBLq1CXXB
 NG/VBRG53xwJhAoZyWBs7yPGVvumeaOMMDcrJ4JS+odTBvYQhlvtjc4z/Tpf9i0f
 m0QmAQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqv5y7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Sep 2025 06:38:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58T6cGRA027933
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Sep 2025 06:38:16 GMT
Received: from [10.206.97.61] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Sun, 28 Sep
 2025 23:38:09 -0700
Message-ID: <fba96ad1-9a1f-40a7-981e-3c229439802f@quicinc.com>
Date: Mon, 29 Sep 2025 12:07:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <marijn.suijten@somainline.org>,
 <andersson@kernel.org>, <robh@kernel.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <konradybcio@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
 <quic_jesszhan@quicinc.com>
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com>
 <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
 <8c248bf8-2f25-443d-a08f-6504c349b72b@quicinc.com>
 <5irzdmwxs2j4ppti35hc5235yxqq576doerrrk6fhcpj7f726a@eh5rl2jwb5kg>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <5irzdmwxs2j4ppti35hc5235yxqq576doerrrk6fhcpj7f726a@eh5rl2jwb5kg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MhvssdpWc1qvW-6-i1FZq1gxjdZj_yb9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX5islXWVO58xw
 V1/f3sV3sJt6AVJEIKHNuxEaWTfU5/5iX0q1e7Qb/zMzHTD2oEXUgUp63HHDD94axh6zOH7Uh5F
 7KBrDBoWbhVmcn9CpytOYTEJOuszFwjU9z0Vhgkn7edwM0Gg2kfnnO3iua+22qk07W1hVxAGUwd
 C5Xrtgh14hQGRg1AfAYobTly+Ba8S5qGSu6Es2K/6csSCzD1+uaGBWwpC4naKP8l6knWuXoup8I
 oeCrhJauugb3VkzgFdLICGqDySYYCKMizhu5O2RI+UVI0s97l4EYnIenEFDm+CEl0HzSWnrkiA1
 8SvfCNBr/Vbjq1dM1SkSYN1pR0jtl6bGEZIxtfC88fa4z89WX/r/or8hsogsD8p1qRPZ0XIzfop
 v3ynDl370wBlFTeGrtYWkgEPB9KuCw==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68da2959 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8
 a=KT0Ug_tu4a8vaQS03oYA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: MhvssdpWc1qvW-6-i1FZq1gxjdZj_yb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_02,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
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



On 9/26/2025 7:35 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 02:55:19PM +0530, Ayushi Makhija wrote:
>> On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
>>>> Add device tree nodes for the DSI0 controller with their corresponding
>>>> PHY found on Qualcomm QCS8300 SoC.
>>>>
>>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 95 ++++++++++++++++++++++++++-
>>>>  1 file changed, 94 insertions(+), 1 deletion(-)
>>>>
>>>> +
>>>> +			mdss_dsi0_phy: phy@ae94400 {
>>>> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
>>>
>>> Add qcs8300-specific compatible and use sa8775p as a fallback
>>>
>>
>> Hi Dmitry,
>>
>> I have one doubt, even though the ctrl and phy versions for sa8775p(LeMans) and qcs8300(Monaco) are same.
>> Why can't we use the same compatible string that we have used for LeMans ctrl and phy ? what is the need to define a separate
>> compatible string for monaco ctrl and phy ?
> 
> Konrad responded with the reason. But also, this question should have
> been asked when you took a first look at the qcom,qcs8300-mdss.yaml.
> It has two compats for DPU, DP and eDP PHY blocks (for exactly the same
> reason).
> 

Hi Dmitry/Konard,

The previous explanation regarding the use of two compatible strings for DPU/DP was unclear, but it is now well understood. Thanks, for the clarification. 

Thanks,
Ayushi

