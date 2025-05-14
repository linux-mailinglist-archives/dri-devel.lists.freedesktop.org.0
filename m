Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34AFAB7723
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3A110E740;
	Wed, 14 May 2025 20:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KRfCfxKj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1ABF10E73F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:33:28 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKWukF020194
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 haOjUL/2+ahDhniM3KOvCsqIZkIBtousQPG30cDhYgg=; b=KRfCfxKjLypETTfn
 9PsRkmNFb6gePGIfesMsI0hmolJOWNPr0Bd4B5DJGq3LateHOPS7cYKNPP9cjJgB
 htOgzofJ46Eti3/0HdhsysiY2YMxyN9TVjmYozD9aWyIbp1hNIuQPB0Om8DirGOM
 NjB7KhvVP1gNAT8BUWaKv6djl0/nJFo1Pj+AxTOQtg4lPUoPMRGAhFx0KpHJtZ59
 PxMHQdUCboPwRgLu6Z7Wfd5PscD56U8cjtaKlB/hq/XUr6VDcOG+mKYP9Co/6o/Z
 Idnu/f19v2zStpHKNCQU+NDH3vFBsaqNlgC73Cdo8iw/ypSqtlL0iuPMctOFLaei
 W9MKzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnkyqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:33:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so49381385a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 13:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747254807; x=1747859607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=haOjUL/2+ahDhniM3KOvCsqIZkIBtousQPG30cDhYgg=;
 b=kwFxaDQ8B2MVZrICV5ef7rLhWa0poYQk26nkMcHXfXibhEOgW6mEAkuzn5b0EyQyuj
 J1NxRqLsadyOKGZ0OFecz0ONB3VZs6M//ZMh3J1gZO+JQTxuQ4SrmscYepJIS92B/UPC
 665wOPeU3x9RtFgwvLJLYLBVG1ekHPDh3Bv/sU28nLUczxewTKrnUkzAXvtj3pLPRQ9k
 Liwx4xJb7joDjFjTZJ6FA7b1HwZH1UWrI1ZiioSBly+1GpiwUM1Jt1+ZoPxSggAru9h2
 rjMpxWQ6BoukhQP0TXsO5MAXfqKLcRUQDHVyKcN2sGfCu3PbB6LgxB7qxZr7P9AB7cZC
 SO3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOdvDcyw+cac4CqlXqAxKOnEsHbc4osL58t7DuvPc60/h4NZWjNRNnqX+yu94wjYreEgWyoW0/SN0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywpSjIfdR6unWAOQTUzEfvRhYmXwr1EGtn9gFnPdRZvjqledLp
 JoJHFN07lvA5LDhF4gZNlvGVIcFjFUZ4bG7QH6Ul8b196RDJIBTbo+lBbGMf1/1qf2u5VbHtR+n
 Gt1ufyOvlt+jyKCaKQnYNImxkPmK5zwOtT0MgQz5uoOKYVjow+R+1tnKZ/cqDNO+I89k=
X-Gm-Gg: ASbGnctUd2srR+Yfv7b++Js5+puw0QahIPeYhMlskKAacdyIQG/t0uYY2KCzBZ2zAJY
 z9Fv6KjleCrUhTZx5FFKk7armfkgu/nopOIio+ZzrQWDPULVoGoT2t3OqFLWsHdV/S5us4KstjE
 +nCdDORJ+RvcGhNu7xRs0fQQLdSa0VxQRVsqG8DzKadQqK6W2kvTUlr1zyO5UJ2VcBywfeSrStP
 ONksw9AmeLfZ72O590o9xKZ3DEktyTzzAMiR8IcuKwN3L9/E7tn+lqFQUOBi5yCF84avw7Fveyh
 hBV1/WJCFM3rJuUhWkM/ZfunscVNqt+W5JFr9c+ihPF91c3Ao9dax75tnTvEq5Z1a1W4vWNGi/Z
 L3gi6YHJr6fttGy8m1HijLInGKvJbVyonoPa/uiwJsACQ+YXM+uL5NjFiGmOvz60i
X-Received: by 2002:a05:620a:4507:b0:7c5:3c62:804c with SMTP id
 af79cd13be357-7cd287e189bmr703170885a.21.1747254806985; 
 Wed, 14 May 2025 13:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOV4okwXjWWNwSu4MIXwUq+SAGOmRck3i9Le6o13lfAoJLhiKhy7BYP8PQCZVJ5tU8Kv5hww==
X-Received: by 2002:a05:620a:4507:b0:7c5:3c62:804c with SMTP id
 af79cd13be357-7cd287e189bmr703167085a.21.1747254806624; 
 Wed, 14 May 2025 13:33:26 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a1:fdf5:e1fa:2d19:970e:af5b?
 (2001-14bb-a1-fdf5-e1fa-2d19-970e-af5b.rev.dnainternet.fi.
 [2001:14bb:a1:fdf5:e1fa:2d19:970e:af5b])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c358ae77sm20785521fa.108.2025.05.14.13.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 13:33:25 -0700 (PDT)
Message-ID: <d7417290-a245-422c-ba00-3532661ea02d@oss.qualcomm.com>
Date: Wed, 14 May 2025 23:33:24 +0300
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
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <9a05d545-1bf2-4f66-8838-b6969ba37baa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KOYFONxCTRxz3ULeiiIA4Jpz3zs19xXx
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824fe17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=NiyHvUd7E2bjcOnzke4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: KOYFONxCTRxz3ULeiiIA4Jpz3zs19xXx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE4OSBTYWx0ZWRfX1MwlqokzsvtF
 oXW5NIYDmgYCm+T1y42Vq5Zlx0b0ZDLBBo2YtcVsjthR1peMsagoqnPBXd/dgqik674lHfN47OQ
 JVdiUsC3iBnYOn49QwZoq6lkpv4wWuT+lhAiDt8/qS+HbHeaBXYfRZem3mi6y9wp0SisZlD/eaN
 KHD/coBy6heAd8PeN0grn4lCs/D8wTnNa3511CI+2NZUmtPZ1gLtzYBBMxYszlr/gnajUOh0N+L
 B1K/CNiKg2Bl8zpQ6USB1hfZwOX9Bm53UCN2pVOq0FJF7NdJA4ihXRfALM2182DPjEM7L0uwXU/
 V38m5B5KmjNSq8AEpHIb+8tRio8wZ0Lpo5iYJusM3GCXAI1khmGEMq2dU1DZevt9RgC1D9bd9oa
 snuU//Eec3pTtuNvkpL50I9beThcofNbhkg2J6UA3rXmYwaeP8nE37xel+xJGSZRx7HYkwDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140189
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

On 14/05/2025 23:05, Konrad Dybcio wrote:
> On 5/14/25 9:23 PM, Dmitry Baryshkov wrote:
>> On Wed, May 14, 2025 at 05:10:33PM +0200, Konrad Dybcio wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> The value of 7 (a.k.a. GENMASK(2, 0), a.k.a. disabling levels 1-3 of
>>> swizzling) is what we want on this platform (and others with a UBWC
>>> 1.0 encoder).
>>>
>>> Fix it to make mesa happy (the hardware doesn't care about the 2 higher
>>> bits, as they weren't consumed on this platform).
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>>   drivers/soc/qcom/ubwc_config.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
>>> index 9caecd071035ccb03f14464e9b7129ba34a7f862..96b94cf01218cce2dacdba22c7573ba6148fcdd1 100644
>>> --- a/drivers/soc/qcom/ubwc_config.c
>>> +++ b/drivers/soc/qcom/ubwc_config.c
>>> @@ -103,7 +103,7 @@ static const struct qcom_ubwc_cfg_data sm6115_data = {
>>>   static const struct qcom_ubwc_cfg_data sm6125_data = {
>>>   	.ubwc_enc_version = UBWC_1_0,
>>>   	.ubwc_dec_version = UBWC_3_0,
>>> -	.ubwc_swizzle = 1,
>>> +	.ubwc_swizzle = 7,
>>>   	.highest_bank_bit = 14,
>>>   };
>>
>> Add a comment and squash into the patch 1.
> 
> I don't think that's a good idea, plus this series should be merged
> together anyway

Well... Granted Rob's comment, I really think the patches should be 
reordered a bit:

- MDSS: offset HBB by 13 (patch 2)
- switch drm/msm/mdss and display to common DB (patches 1+3 squashed)
- get a handle (patch 4)
- resolve / simplify (patches 5-10, not squashed)
- fix sm6125 (patch 13)
- WARN_ON (swizzle != swizzle) or (HBB != HBB)
- switch to common R/O config, keeping WARN_ON for the calculated values 
(with the hope to drop them after testing)

WDYT?


-- 
With best wishes
Dmitry
