Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F68984E5CC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 17:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8400810E9A2;
	Thu,  8 Feb 2024 16:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Xso+MMgb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E51E10E9A2;
 Thu,  8 Feb 2024 16:59:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 418FR5Yv021218; Thu, 8 Feb 2024 16:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=vJ0Ng4GpEOGSL5tkjSsKqvDm5yvMqpG8nwhhwyAVv08=; b=Xs
 o+MMgbMSB8SPIwYQA4mp1kEIQsT4hfWJQy+7LhSav2nSphTQtHiizceK/WvkdS+C
 +aJg9KtGt7NcG+f8/4zkTQmCdgG1/hpJCXJXa3wgfHbhv8KYchWVfRzZRS/R0D39
 mJUWuXAFNUcl9+otbzZ13kvydue+NLjMrueBEWcNzRr0Zh3c1hsRu8bzolj1U5IA
 vZkRwWpCxTRTPmpmXCcd2aMUQwMTIJAOskQXDKQqWOkUUA5WE5Y77ZUt2siCeoV2
 ZPjrkpW+pEE9cdaCzl3mXf1/VCChIjGRPQR7o+9W3Yn2lmpi7xL2CNlcCc9YYoJU
 hmseroI4JV/KNVIOB3MA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w4rk81sre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Feb 2024 16:59:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 418GxjS3006929
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 8 Feb 2024 16:59:45 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 8 Feb
 2024 08:59:44 -0800
Message-ID: <66ecb179-a878-bfe0-af8d-0640560e0a9b@quicinc.com>
Date: Thu, 8 Feb 2024 08:59:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] drm/msm: mdss: Add X1E80100 support
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-3-0d9eb8254df0@linaro.org>
 <CAA8EJponbo2vvuj2ftCQuxtrZp0w7JQqJ_ADF80Wd2y1V74BzA@mail.gmail.com>
 <ZcTZL+fls7A8O9P0@linaro.org>
 <CAA8EJpr3p286ff1pHhhBdF7GA=g8Pnv9yWDukwnnNaOuykPcTQ@mail.gmail.com>
 <ZcTbNGVGT/Kwtc68@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ZcTbNGVGT/Kwtc68@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: QP1-8XBNzTm3HdoaeKnLEIa-nx0-FWo1
X-Proofpoint-ORIG-GUID: QP1-8XBNzTm3HdoaeKnLEIa-nx0-FWo1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_07,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402080090
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



On 2/8/2024 5:46 AM, Abel Vesa wrote:
> On 24-02-08 15:42:04, Dmitry Baryshkov wrote:
>> On Thu, 8 Feb 2024 at 15:37, Abel Vesa <abel.vesa@linaro.org> wrote:
>>>
>>> On 24-01-29 17:11:25, Dmitry Baryshkov wrote:
>>>> On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
>>>>>
>>>>> Add support for MDSS on X1E80100.
>>>>>
>>>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>>>> ---
>>>>>   drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
>>>>>   1 file changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
>>>>> index 455b2e3a0cdd..eddf7fdbb60a 100644
>>>>> --- a/drivers/gpu/drm/msm/msm_mdss.c
>>>>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
>>>>> @@ -564,6 +564,15 @@ static const struct msm_mdss_data sdm670_data = {
>>>>>          .highest_bank_bit = 1,
>>>>>   };
>>>>>
>>>>> +static const struct msm_mdss_data x1e80100_data = {
>>>>> +       .ubwc_enc_version = UBWC_4_0,
>>>>> +       .ubwc_dec_version = UBWC_4_3,
>>>>> +       .ubwc_swizzle = 6,
>>>>> +       .ubwc_static = 1,
>>>>> +       .highest_bank_bit = 2,
>>>>> +       .macrotile_mode = 1,
>>>>
>>>> Missing .reg_bus_bw, LGTM otherwise
>>>
>>> Dmitry, I do not have the exact value yet.
>>>
>>> Can I come back with a subsequent (different) patch to add it at a later stage
>>> when I have that information?
>>>
>>> I see no point in holding display support any further since it works
>>> fine with the default bandwith.
>>>
>>> If yes, I'll respin this series right away, but without the reg_bus_bw.
>>
>> Please add a TODO or FIXME comment there.
> 
> Sure thing. Thanks.
> 

I have not heard back from the clock team on the values.

But, what I can confirm at this point is for basic functional display 
support, we could let it go back to the default value which we have 
hard-coded and fill up this entry later.

>>
>>>
>>>>
>>>>> +};
>>>>> +
>>>>>   static const struct msm_mdss_data sdm845_data = {
>>>>>          .ubwc_enc_version = UBWC_2_0,
>>>>>          .ubwc_dec_version = UBWC_2_0,
>>>>> @@ -655,6 +664,7 @@ static const struct of_device_id mdss_dt_match[] = {
>>>>>          { .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
>>>>>          { .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
>>>>>          { .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
>>>>> +       { .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
>>>>>          {}
>>>>>   };
>>>>>   MODULE_DEVICE_TABLE(of, mdss_dt_match);
>>>>>
>>>>> --
>>>>> 2.34.1
>>>>>
>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry
