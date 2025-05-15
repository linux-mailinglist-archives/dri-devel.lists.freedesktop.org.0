Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E447AAB8C26
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AB310E909;
	Thu, 15 May 2025 16:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BF3cvFgJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA9F10E909
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:18:36 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFNiY032701
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qX+FKmvWae7qk6ZxShDL/DRRc09xp5kjpRbX5MzVt+8=; b=BF3cvFgJQh0FUiNG
 Ha8PNY81gbzM3nBFoNq6K4IgbvECb3TRxgAcOYMl7gfyB3IPggYT6NQGz0z9iNjK
 C5wniCpHjaCmOw3V6Mv2HrL67z+CAKVcpInvglt7fpmpun1aMHVux4pjFBYy5xEN
 wnv77ppz+7FvqJzhA5T/EUghYpQfRXf0X1BstFeUqYdmfhdBY8PrqVNQC1thF3Xx
 tek/PPOqSgp5qE5SESZE+3YGyhEw6HZO0JwzI748WpvJ/2Aq9V4vtiDTAk11wrx7
 N6c8TyJZXt0frd/NXNaWuPlil6Aeu4qwVe3KAA/i38ydmfcoBjwM0ObufZmJt9wX
 k2HJPw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxscb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:18:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f899c646afso3651876d6.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747325913; x=1747930713;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qX+FKmvWae7qk6ZxShDL/DRRc09xp5kjpRbX5MzVt+8=;
 b=m1ykt8//GbAx1JpTFovzhcKn9ZZpR516cSMXiUwrbVgjeI44AlpXMXqxpX8D1bh3lQ
 /OtezkYoMUoXe1oLwRVo/GfvQ1cZgqXcDmNPwF/8QgTmGpLstwGPAhIxzvvnePUutDdt
 q+Z7WxGS0yOQcl1QeqH8qQ9gjvy1Y6yM5VLfTHw59klFg+U3+KXqoXBwZgw3qTGu91MW
 Kjs3GDfxhzUdh4W1vBbRMrsGi5NGV2VInIVCt+PvRBWdPrd/psHnQ3njoqTR5hgUv46q
 7Sk7GVbSbVBS8Wa05qs6E83RmBfNjYXSWZRdtiRjWBqecNu+xlLxcq5Y9b6HySeJSwDR
 mgEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3ciDk7CdLdZhn3f/vEYzwo8cvfq/W5w+vJx5KXNmGi7tsw0vf7jOHPDnUJCDGq95+PouruKs/+Jo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbXNz5jLvL+sVr8tprV936WrDG5ejyAC+jBSSHQNjgsyyLm7ie
 hiOV3KAFgX5ZkGfvD2fBWx4ZC/vCP9emp9B+pqHvr+5Yyjkju4J2UxjvRiE+mat+MuzeSSzqZSz
 sAoKg75E98wfa7AIZbPPE1P9FsiXfivG9I16uDSbm3hKJ/yFinC3con5kK1ZLp3Bc2AWkRwI=
X-Gm-Gg: ASbGncuk/h55PF1v/rjnt/12bIjI9bHK4ehUKn8Xt9af0IPGz8UCv8ynikvaf+Vdm0m
 WfLEyq/L0RSzwPwP7895qoViIh+R/4uRTrJ8OEXSg6aC7M/hpLWdBbFHlcm3bGMe5KdT/L5Rh2C
 wdVNzIj+GPmMgE2GMB+CaGZ1eRd0v02QG5UpGdEjKX2g/G1Tuu3sdTC6rOMN8cWahwKXgmP/1Oe
 +npfiDfVB8J0i1vWQLJLMmcrm81qykPdyt2us3c39Kv6FVEEVQBhiRgaO2r4kKamdxLaxGd3fN8
 ad1IE7GfAWpjKyLk+zXMRgaSmawh47giYJfaeZVOwRVNyBrKFEV3i0XkXP3ZqhsGhQ==
X-Received: by 2002:a05:6214:f0c:b0:6e4:501d:4129 with SMTP id
 6a1803df08f44-6f8b09398f4mr1585856d6.11.1747325913509; 
 Thu, 15 May 2025 09:18:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs5o7TMvuHlAVqEVKuzoLrDE2O7PdxwnnYC6+0RPVnhmYXHkLwqwBcqjjj6lsYHcU9JpqmmA==
X-Received: by 2002:a05:6214:f0c:b0:6e4:501d:4129 with SMTP id
 6a1803df08f44-6f8b09398f4mr1585516d6.11.1747325912806; 
 Thu, 15 May 2025 09:18:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d441fb5sm9987466b.108.2025.05.15.09.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 09:18:32 -0700 (PDT)
Message-ID: <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
Date: Thu, 15 May 2025 18:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-13-09ecbc0a05ce@oss.qualcomm.com>
 <lkkwnmnk32igcev3gykmtxsohyskj6ehylaypg2dyxbedvksee@lnuc4lfmzrkm>
 <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
 <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 43yw5JpucxWJ3Nl9GWkD7e4Wkxhz8zzy
X-Proofpoint-ORIG-GUID: 43yw5JpucxWJ3Nl9GWkD7e4Wkxhz8zzy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MiBTYWx0ZWRfX27qpOoUfE/CJ
 cqbiFPsNK36vjjykvoqzflSmtESgcTLrLEfoPC4o/PlKqMJuctXaRn23e1CZhYkEbHvfQ2+9h8t
 w2TemjZLM4s+jZtueiZVmGzQuxpNTvlgcwCjIfwCrduqMwUg+H4pr+MlhEBPsMtmt5VcfLRFBke
 FyobXLSewhbfB9MKHKNstNyXdZoGsao/93z+HQv72YTCXuMeO9UWBwO3UJ+Fax7gDy6XWoWr9Dl
 RAnOMzlbHdVxGVsAAx9W3xVfwlRfQtC9fEOIHGP4N93qnoxOFCiy5yqYdk89VJFTScMaLYHpxKJ
 tQQir46jaCaP34g+Ue/WwEL2E1znvKxlfCZm+/4eD6IW9P+u4nd92qffkS5pMJL5e7MyS2aQtBQ
 DSeuMVpjbRrnKbWWAb4K57gF6pZazDTJRKpxKA53V268os6YvUJ3pQE1o+WSD2rWRdFOlziH
X-Authority-Analysis: v=2.4 cv=Gp9C+l1C c=1 sm=1 tr=0 ts=682613da cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=4UHGY1WjEP5fiMyc6oEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150162
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

On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
> On 14/05/2025 23:05, Konrad Dybcio wrote:
>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>> 1.0 encoder).
>>>>
>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>> bits, as they weren't consumed on this platform).
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> ---
>>>>   drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>   static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>       .ubwc_enc_version = UBWC_1_0,
>>>>       .ubwc_dec_version = UBWC_3_0,
>>>> -    .ubwc_swizzle = 1,
>>>> +    .ubwc_swizzle = 7,
>>>>       .highest_bank_bit = 14,
>>>>   };
>>>
>>> Add a comment and squash into the patch 1.
>>
>> I don't think that's a good idea, plus this series should be merged
>> together anyway
> 
> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
> 
> - MDSS: offset HBB by 13 (patch 2)
> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
> - get a handle (patch 4)
> - resolve / simplify (patches 5-10, not squashed)
> - fix sm6125 (patch 13)
> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)

Does this bring any functional benefit? This series is unfun to remix

Konrad
