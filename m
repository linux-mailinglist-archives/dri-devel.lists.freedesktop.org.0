Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F5A4CD70
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 22:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A4810E4D4;
	Mon,  3 Mar 2025 21:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Cdex1G6L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BDC610E23F;
 Mon,  3 Mar 2025 21:24:00 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AP2bf019978;
 Mon, 3 Mar 2025 21:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7ty50yskNa4pYew6F6vyuvTbJ7taysYiM7S/eCucEBE=; b=Cdex1G6Lyyx8+TYb
 sSrzs1L/nSugkKtyoYxe3JSPFDJXiPs/4kRV4wJ11U0jiyHUcuU1CbyVvILem9RO
 /TlFhRHdoltrCZTM00SzFqj9VMOhwglNEKlJ2Shc7kHyP1gjFhBX/6UsccXPXN4i
 vLZQtsq1L6LYAAIg7CLG+v9rEJ8VqCs6ZICshH3ncYa8oGn8oNSMP6OJhZMWY1iK
 j+FXiyj6rE3z54ErXmVFDKm6VcUFs0yNyJpsIbPyEVQQ/fGELLvp+pFmBMTDnwiz
 mkp6v/14DWylOwNao9k1k+0LS4EAUYH4gFtix1c9IHgnu1c04bmHMbqgsbjVGmER
 ntpFnA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t95x5vm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Mar 2025 21:23:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523LNqnR001016
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Mar 2025 21:23:52 GMT
Received: from [10.110.69.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Mar 2025
 13:23:51 -0800
Message-ID: <8c0c0935-3a20-4c6a-a6fb-556e14ecedda@quicinc.com>
Date: Mon, 3 Mar 2025 13:23:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/16] dt-bindings: display/msm: dp-controller: Add
 SM8750
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Jonathan Marek
 <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Srini
 Kandagatla" <srinivas.kandagatla@linaro.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-5-d201dcdda6a4@linaro.org>
 <aqpuik4zitdfuk4pahn4wyzxdvxldy4dcqjs3mhr6fqtxpoxhf@ssfzzbfce2nu>
 <2dfe466c-ad94-4683-a2e9-a49e77a61f4f@linaro.org>
 <h2shpen65r7v4in54avsez7qtlwojbt2cthyomqrsgs5ewprwb@bn53suqrzkac>
 <4e82404a-0ea5-4641-829a-bba666edd352@quicinc.com>
 <CAA8EJpoWEuqKkreUTu1gO-Pr=VFNNP_vBfNZpitJiJH728vjPA@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpoWEuqKkreUTu1gO-Pr=VFNNP_vBfNZpitJiJH728vjPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: U0A0gXsukuszRPuGJAxn_2wPnvZt7M3G
X-Proofpoint-GUID: U0A0gXsukuszRPuGJAxn_2wPnvZt7M3G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_10,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030165
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



On 2/24/2025 7:14 PM, Dmitry Baryshkov wrote:
> On Mon, 24 Feb 2025 at 20:59, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/19/2025 9:08 AM, Dmitry Baryshkov wrote:
>>> On Wed, Feb 19, 2025 at 06:02:20PM +0100, Krzysztof Kozlowski wrote:
>>>> On 17/02/2025 19:58, Dmitry Baryshkov wrote:
>>>>> On Mon, Feb 17, 2025 at 05:41:26PM +0100, Krzysztof Kozlowski wrote:
>>>>>> Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
>>>>>> fully compatible with earlier SM8650 variant.
>>>>>
>>>>> As that became a question for QCS8300, does SM8750 also support exactly
>>>>> two MST streams?
>>>>
>>>> v1.5 of DP (starting from SA8775p , then SM8650 and SM8750) support 4x
>>>> MST for DPTX0 and 2x MST for DPTX1.
>>>>
>>>> The DP in SM8650 and SM8750 are identical, according to datasheet (v1.5.1).
>>>
>>> Hmm. This also means that QCS8300 is compatible with SM8650. I'll let
>>> Abhinav comment here.
>>>
>>
>> DP version by itself is not a good measure of whether the controller can
>> support 4 streams or not.
>>
>> Firstly, sm8650/sm8750 do not have a DPTX1 so we are only discussing
>> about DP TX0.
>>
>> Coming to the QCS8300 Vs sm8650/sm8750, even though the DP controller
>> version is the same, there is no HW support for more than 2 streams on
>> sm8650/sm8750 because there are no INTF blocks to drive 4 streams.
>>
>> On sm8650/sm8750, only INTF_0 and INTF_3 can be used for DP. Hence 2
>> streams.
>>
>> Whereas on Monaco, we have INTF_0, INTF_3, INTF_6 and INTF_7 capable of
> 
> No idea what Monaco is, most likely it is some platform. Please use
> SoC names in public.
> 

Monaco is indeed QCS8300. I usually do use SoC names, in this instance 
just intuitively ended up using the internal one as I use it often.

>> driving DP. Hence 4 streams.
>>
>> Let me know if there are more questions.
> 
> How many stream clocks are present on those platforms? I'm asking
> because there is a small, but not non-existing difference between 'DPs
> are not completely compatible / the same' and 'DPs are fully
> compatible but different DPU blocks impose different restrictions on
> the number of MST streams'.
> 

I have confirmed this internally. sm8650/sm8750 have only 2 stream 
clocks and not 4.



