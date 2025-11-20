Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA9C72877
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 08:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE5710E6EE;
	Thu, 20 Nov 2025 07:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="buGMdNJy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14BB10E6ED;
 Thu, 20 Nov 2025 07:13:21 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AK4piQw3407991; Thu, 20 Nov 2025 07:13:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2xEGgaVY/dJMsn0NgTLcpNpIWQTC8RubSJ+fh/bkGZ4=; b=buGMdNJymGHPN5tV
 E3de6kJMr3BDbC/1I3j2UPU7I0jyopUfKxUTpQaQr8opuUFvE3o4MqrU/3EdXwOF
 XPbl8ClMD1YtvmHYVtxbKC3fHDVgUutI3gQIFAL63WezDUbLkzDzpuya70xdigBx
 2t37qG6l7d4ib99GYXFMBP+nTX9SFovNcON+r8ZtgGpmrm+ckt+XS5P2vI45ae0v
 yf3WBdxKOiSPk5/Os+loAVYYQASml6ElR8Rdde5XQ0vGNjYF7v8Xw0HPN3Zgnmkz
 FOoBJ55Dti0SIKU77RjAzeVdC/I/uWPk7lxrLvcmLlVLhaRD9ARfRNZm1YPIaRxF
 I29GEQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahm811qu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Nov 2025 07:13:14 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com
 [10.52.223.231])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AK7DD4h028531
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Nov 2025 07:13:13 GMT
Received: from [10.204.78.57] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 23:13:06 -0800
Message-ID: <110a5e50-327b-4db3-93bc-4c3fad5c7f5a@quicinc.com>
Date: Thu, 20 Nov 2025 12:43:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: lemans: add mdss1 displayPort
 device nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <marijn.suijten@somainline.org>, <swboyd@chromium.org>,
 <mripard@kernel.org>, <abel.vesa@linaro.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <robin.clark@oss.qualcomm.com>,
 <jessica.zhang@oss.qualcomm.com>, <abhinav.kumar@linux.dev>,
 <sean@poorly.run>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <alex.vinarskis@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <freedreno@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <quic_rajeevny@quicinc.com>, <quic_vproddut@quicinc.com>,
 <quic_riteshk@quicinc.com>, <quic_amitsi@quicinc.com>
References: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
 <20250926085956.2346179-3-quic_mkuntuma@quicinc.com>
 <kxy6p3fj656utoubj37ujzycmmszebmwb4c4u7zkb7t46ddwuk@xwg3xht5elj4>
Content-Language: en-US
From: Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>
In-Reply-To: <kxy6p3fj656utoubj37ujzycmmszebmwb4c4u7zkb7t46ddwuk@xwg3xht5elj4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: srG46lSQgobzr9FupC6y0GFo5pHcLB_i
X-Proofpoint-GUID: srG46lSQgobzr9FupC6y0GFo5pHcLB_i
X-Authority-Analysis: v=2.4 cv=SJ5PlevH c=1 sm=1 tr=0 ts=691ebf8a cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=t__oJxIELa5aI4MPX10A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA0MCBTYWx0ZWRfX4dulppsb8J2Q
 xH5tFnhq+QFveNv/ZuK9cwgiIcujSx1Mg6wGa9Tr1pcRTJBcZmRA8FzDfTlPSKgIzYXzEqXOcn+
 G2V266bGCG7UWjykkL5fkMb14eH3n5rUxYTJdnD9vYQTdJV4P8AwV2BYFte08qDmsusPCxvcBom
 FS7NevOiWIGhnxYO9Z0qcBNy1xHp4XsjVqvOylBIVU8h2vNxBDjIcBHhXXr8qOlnEmFKcR+/L6k
 Qoaj1WNGpZLIwSm4O7KBF4zZQP5L/Bfq9TNtjbKXzumOsTiXIkfmommlUxBmxxDJAvsUUAX1L46
 wbpzWRmjvssGbwB8K6N2u53tobDdHqVEejoKR0YD2hfJ85bRAqzYW1T7mA9Os9J9K5DRldFX5V4
 CnES9iBvaCTmJ23NqGGVrm2R6X0zsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200040
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



On 9/26/2025 7:23 PM, Dmitry Baryshkov wrote:
> On Fri, Sep 26, 2025 at 02:29:54PM +0530, Mani Chandana Ballary Kuntumalla wrote:
>> Add device tree nodes for the mdss1 DPTX0 and DPTX1 controllers
>> with their corresponding PHYs.
>>
>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/lemans.dtsi | 245 +++++++++++++++++++++++++++
>>   1 file changed, 245 insertions(+)
>>
> 
> Squash together with the series adding mdss1. There should be exactly
> three patches: fix for DP, addition of mdss1 to the lemans.dtsi,
> addition of mdss1 to lemans-ride.dtsi.
> 

Sure, we will update the patches as per your suggestion.

