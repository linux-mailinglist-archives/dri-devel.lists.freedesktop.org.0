Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE6AAB8C32
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 18:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C76110E90D;
	Thu, 15 May 2025 16:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qzhs6woK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531D810E264
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:21:10 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFDNW020890
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JTTwAwIwQWjmD8gLCq4Q+1jUTZITLoJMG79zsA19CmE=; b=Qzhs6woKqgLcQM4F
 mo3bSRNGgibENom+M/j8TlDg+uKulhCrhAa71MSSZxBpQZUZ3z/0aLoT0kbfBtdf
 +lMZ8I+/nLGHa23jAiWkuyYhGHz9XXz4Aok5pddGEOoK1w+bhY5ltH6RPAH79Mqv
 NZB6EQ6QBKK+sGTuYkt/HOgG/2yHkFb/KyCJD3/UTwwSCKDaK7YKggtEO/e41tkZ
 ib+NahtjwEukfPr8GpHJ4BW0R1uqd6wS1PyjlXxLmP2f7TG80CNeEpU6JMu3mE4U
 wcKhdE54Sx2jUuWuWIkmsLeCc2u15HR6cV9/oosEbUMue8gpXr+rcVv9OoAmM++o
 c+xYKQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew6qw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 16:21:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f6e7c6a3fbso27770996d6.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747326068; x=1747930868;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JTTwAwIwQWjmD8gLCq4Q+1jUTZITLoJMG79zsA19CmE=;
 b=p0MwaZQqe6lOFm4tGGKfVH4phYKvVkCYFraEENSNLWKaXrnvWYCfBQJjsk2IPa9v2N
 hAMna3CW5PZvKrxZJHilYRXogi9qe9On0VGctE3oRXxjzkLlsmZ/sfLJ4y+2KXuq+CW1
 PTTfouIHedxn3YemN7sJgGkdbR7WnO+P6j8tZGraz4RcKjqMzyme8IY3Hj2FqS72Johe
 uCGJV4nyKzhugeQ00qN5By4HO4V5VKlifOn+hBq3Zh7uj76MaLiMPZBDOKfIV9wM99V2
 mmZpZrE/I/Vo6umKzkSEOY32Ds1fiMsuDK3o9lkBhs6J4Ummix48QFRQrMX6YcKkfoo0
 6m1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7h8q4VttD9P1c1BWSmS5y2+7OELvV67YHiTVjRxvz7XVw8V9g6CSe6JH+CRhKIhO0+t0HqP6toEU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNoySROfT6DScCpoE9UcFlV5wdWjS4pvXDuQNGKaeeOzXu+Msl
 RSLtP+IaW8ySOd9bLamYpAgffdIvgPz8/7Jo6byFzbxLVN+ncxwemM0dbE9VOfbqGnuH5io8pDA
 McohZ5CLM5X29cAbJxbTSuI/zkbdwFZxQ5gVtu0h7VbX/AV7lB9bm9Uvo1lir7ZF9GXjm/ag=
X-Gm-Gg: ASbGncswQ18bVJWlEdSLomjWZ9RK2JUi32HOMTXNwOkkTG28Xnoo9OauFlLatDuj6Z+
 co7CZ0Wt3jUBiiRq9lrOLcVnXCi1znG27hDtOKPJE0P4Lnv6u64r6jqghsovWga+wAomQLxDW4X
 HL8GSn0mcTGuPE6pagIPZqadYpGeo2+FK1n8pWTniRfaF9q9JdKLl0S3cDLZDNkJ32mjCHkr0wU
 DAGktyTCCrX2OqAns0dh//MdAOgg46edmob7BUzcDAGFwaF39C0HRX+p2n2HbsjKQSzy1hlJGWO
 9v8rduliy1hI6hg2B0Grf1w8kkNQgkdCNzT5Rs73wPjv7Qm+7uwNU49DokfaTem1IaWiVTOyD88
 zzeeGuWa611WC/w==
X-Received: by 2002:a05:6214:2602:b0:6f4:c422:53e6 with SMTP id
 6a1803df08f44-6f8b083535dmr5196646d6.1.1747326068388; 
 Thu, 15 May 2025 09:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECqqbNfcUEPKfdTCgqfKl4Z0zZC1Q0WBDRWwk2WXOPhNGQkHsa6MQR6aSQ0s64MqRrX5qcBg==
X-Received: by 2002:a05:6214:2602:b0:6f4:c422:53e6 with SMTP id
 6a1803df08f44-6f8b083535dmr5196206d6.1.1747326067958; 
 Thu, 15 May 2025 09:21:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9?
 (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328042e18a4sm1346261fa.14.2025.05.15.09.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 09:21:07 -0700 (PDT)
Message-ID: <4ec678b4-9e69-4ba0-a59d-f2e0948a73ce@oss.qualcomm.com>
Date: Thu, 15 May 2025 19:21:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v2 13/15] soc: qcom: ubwc: Fix SM6125's ubwc_swizzle
 value
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <466148c9-2461-4140-9ba9-5a3427ec6461@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WtG4blVdT8Wymww9RRSyYbgLGLqtaCCT
X-Proofpoint-ORIG-GUID: WtG4blVdT8Wymww9RRSyYbgLGLqtaCCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MiBTYWx0ZWRfX1GMFKYmfvKOY
 21AMKwkMVChjYvZRff23R/Jt13yTnEkft0PArp6DpAVFkDibffKcQEMXyqodo/0jAToKjwtI2OP
 RlpiV7N5hL6AFq+0cOYT/9y6j3sGHAild1a8i9F0lAmsBJHcQ/g7m6tPTxNCYWc+ZH6Guio38Cz
 ygKttY8tsJdzP3pN7NoBxjdgT/B0h9eM+hQ0mGaTr1BHkt/4YHDOB7JhQIyGtHyD7GVjIueTpg7
 vLpEEGeaJXQ0u7Qb0VcVGgIjO41zN1754JFbCKbsrj66pjPshrXF2yZVTV42RRrYg8Mz83nrPGR
 1fUaOU42tqO5rauiMvDxbt0IJuNwH1c7i67y1FQXUNgxOJLax3NVzi/AhlALc4aEXU4lJj0sXgP
 /Ng+TjxfPCxKQie1jpY1EM0p/zlcw1R+y80aQXX/WmbFMquxsy8/3NibFpgPgJuVYMu9+mgh
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68261475 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GOhw9KrRKE3HJMKjvYgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On 15/05/2025 19:18, Konrad Dybcio wrote:
> On 5/14/25 10:33 PM, Dmitry Baryshkov wrote:
>> On 14/05/2025 23:05, Konrad Dybcio wrote:
>>> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>>>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>>>> swizzling) is what we want on this platform (and others with a UBWC
>>>>> 1.0 encoder).
>>>>>
>>>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>>>> bits, as they weren't consumed on this platform).
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/soc/qcom/ubwc_config.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>>>> --- a/drivers/soc/qcom/ubwc_config.c
>>>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>>>    static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>>>        .ubwc_enc_version = UBWC_1_0,
>>>>>        .ubwc_dec_version = UBWC_3_0,
>>>>> -    .ubwc_swizzle = 1,
>>>>> +    .ubwc_swizzle = 7,
>>>>>        .highest_bank_bit = 14,
>>>>>    };
>>>>
>>>> Add a comment and squash into the patch 1.
>>>
>>> I don't think that's a good idea, plus this series should be merged
>>> together anyway
>>
>> Well... Granted Rob's comment, I really think the patches should be reordered a bit:
>>
>> - MDSS: offset HBB by 13 (patch 2)
>> - switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
>> - get a handle (patch 4)
>> - resolve / simplify (patches 5-10, not squashed)
>> - fix sm6125 (patch 13)
>> - WARN_ON (swizzle != swizzle) or (HBB != HBB)
>> - switch to common R/O config, keeping WARN_ON for the calculated values (with the hope to drop them after testing)
> 
> Does this bring any functional benefit? This series is unfun to remix

I know the pain.

The functional benefit is to have the WARN_ON and side-by-side 
comparison of common_ubwc_config vs computed ubwc_config for HBB and 
swizzle.

You can say that I dislike the idea of copying & modifying config as 
this is the code that we will drop later (hopefully).



-- 
With best wishes
Dmitry
