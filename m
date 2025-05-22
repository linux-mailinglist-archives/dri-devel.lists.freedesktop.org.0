Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204CBAC1093
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 18:00:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37CA10E176;
	Thu, 22 May 2025 16:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oU+woLYe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2E010E176
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:00:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M86A7X024983
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7N+FGlZ9YEzA9ZHX/TLPLBdk4t047N0N1Qpwn5XXC+M=; b=oU+woLYeFfndo2kf
 XnuV1qbSDQvFkpe/i4K0ds7cZgeaASsDu0cuERuVSyLWg3+NepsviU8skqN5DkYN
 gmIi/OaSOfBIk1xi27BqZEhH04ZC25y9h4v/iaEWdvABy6jjFs/fkqxj9ov6HCxV
 e0Jh24a7094+GQ/2HhhF2wHE0TfU3s85xZr/oTvQwXgsy668Wk0R5XbAMpNracUC
 3QgKDA5ppl2jsWvDjJIwIJcOqc0FC+gQ9nEExPplBOolkIyALViUdgHHxkP1x74E
 5z91DRUyiczp/fkl7NaokpRWJgiPKkzL9MbKaA2GObfDjqTVe4RgVuP2N7daloGD
 3/4pBw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4xu92-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 16:00:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c555d4ad75so59017285a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 09:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747929616; x=1748534416;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7N+FGlZ9YEzA9ZHX/TLPLBdk4t047N0N1Qpwn5XXC+M=;
 b=O+OJXKEkuXe87ptQTYihytgYaLgbfoX6DEPET8QroY3tjb1dgYlqE0NufGoXa+astA
 kBuo/CcvdgmMYwOsn9D68+a3YR3ltlr6uHeWHV0TLE2v2d6BcFhMDNHQb4VY5ydNp9IP
 3mCZHgjWxzrcyFJZuDTkKHdC9ScA5riHTqCXEr/y2K1mNa5RWZkof5WAfnh5KvGwzlR9
 PJlnSpnqxAMHEbGOzBMt+qUcFAP9uwm9DS1hoXBk/75COkjfbnuBnYPS4HV1wTZsXujH
 jlEtJfmhjzzbFsY4pkTHhBCneoxmaWOPeLQRZDZ7ar41gijqlLraJsTmQFVAE3wYndrd
 Q1Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbzAzVwgSmvHnUs7hSbze60PsVlf4rypGqJqo49B7gKMHp8Ih+Kb5Bzh9ezJl+kEMXxEo/tQujtOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl3nOhm/V7b/rFV6OLl4JqjC7m/P1eqqSdrHoVG45ToBkYMiEj
 PpVMj6ta7XJJiBSUYRcx+JbXIdZg3Xnq7lfsJ9kpuLCU4poVLlPSto6o0DeRjLsbMF1YnLXw+g/
 Lvi8eSgDMqagoNgD7CYB6Dv5+mEjAajG1jvJWia/A5Av2A6pyjNz9j3mCzZ8W4028Hoi9tgw=
X-Gm-Gg: ASbGnctbXJJ2dH1KBEZ7chww2yAO0pSdyvfU3iYH3UHCa1q6CEBHA+SpB7sat9Cld2b
 zsFJpFW5ezyyYUncfGh6yW0SVRe2q6S66FVHB/yzKa+egp61g7jsY36v/Exai3/pbuZ9vvLy8Me
 6q7bhaDA/p+keSgsmWuIozBGA0Zdqb+DeHEmcCaFg0IB4gPt1uo3JAcwypWVlZvk5vUXOFmtgU2
 R7yXVp0jDXQdS+akHErIk2o9p8jF4qsXhJEb8hc8/dYQoqZ3XxvP/NbVpT7vnNFJYg/IW1UIyPo
 x/ZuuH66UxdVHOq3CkgIFGlVaJOkgFIaTDzHhVJrNF4q8C27YEeuPft9WpKc/kymeg==
X-Received: by 2002:a05:620a:690c:b0:7cd:2992:1fb7 with SMTP id
 af79cd13be357-7cd46706827mr1766209485a.1.1747929615737; 
 Thu, 22 May 2025 09:00:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5+tilRMybZTSJ2vZO7ClkxMjtcE63vyyPyT+Nkt9wppDzJGnDwFUds1W8+fXmRlfGibyqSg==
X-Received: by 2002:a05:620a:690c:b0:7cd:2992:1fb7 with SMTP id
 af79cd13be357-7cd46706827mr1766204685a.1.1747929615145; 
 Thu, 22 May 2025 09:00:15 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d4908cesm1101387166b.132.2025.05.22.09.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 09:00:14 -0700 (PDT)
Message-ID: <b2057f2d-3dfd-48e4-9f1e-539604b5e891@oss.qualcomm.com>
Date: Thu, 22 May 2025 18:00:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE
To: Connor Abbott <cwabbott0@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250520-msm-reset-context-state-v1-0-b738c8b7d0b8@gmail.com>
 <20250520-msm-reset-context-state-v1-2-b738c8b7d0b8@gmail.com>
 <1d615331-2d60-415b-8f53-0d3a7b5d5fe4@oss.qualcomm.com>
 <CACu1E7G2sYoGZcFG8YTHp+UXk1fLFTAG=uX+mdU==SxwPntmAQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7G2sYoGZcFG8YTHp+UXk1fLFTAG=uX+mdU==SxwPntmAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: y982wBBl6u1dB0Zg3ODbODpuHgOrXeHq
X-Proofpoint-ORIG-GUID: y982wBBl6u1dB0Zg3ODbODpuHgOrXeHq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2MiBTYWx0ZWRfX2+VCRqs5NdDZ
 pVpRtQAYarNVXpKFqDsgla0oIL0xl755WX7SWW/AV1EcNxqpjyEI+6wqVNeHCctLNrhlx2kBWWg
 DTNFSTR9hvUKGpAPaBhF5HJena+quMMwVLHcYCXVOBBlRg7YguNk6MaAtmRpVkWiNxfn8I9Wstc
 MIUHlkPR7LWPDVWi/M9Qy6AHptc6yWgCrBoXtv3sQQcw35bzCo8CAcrXKYrmj9hLhJjJIu4tA40
 ec/+PxfkyeHCjBeg32px36/h2H4YBWP6ErTidUE1ISG95R5HIiu1P/gfCMPzk2AbMnR+i+/Ytou
 ddXTsbIzkAwDpxeCANu5yD3F+NtEQvPvvyy64qXn94OW5YxWV0gy3ahEcnuYnCAqp9/eviv2nkH
 vbs/BuHwUS1kABk5YCC/vCw4WdXWW5UDVxC1nq17apDsyk05cLnbD+8rG57C40bAnCdh2fYy
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f4a10 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=PwPGRmcspp1eyaL06aAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220162
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

On 5/22/25 5:53 PM, Connor Abbott wrote:
> On Thu, May 22, 2025 at 11:46 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/21/25 12:28 AM, Connor Abbott wrote:
>>> Calling this packet is necessary when we switch contexts because there
>>> are various pieces of state used by userspace to synchronize between BR
>>> and BV that are persistent across submits and we need to make sure that
>>> they are in a "safe" state when switching contexts. Otherwise a
>>> userspace submission in one context could cause another context to
>>> function incorrectly and hang, effectively a denial of service (although
>>> without leaking data). This was missed during initial a7xx bringup.
>>>
>>> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
>>> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..f776e9ce43a7cdbb4ef769606ec851909b0c4cdd 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -130,6 +130,20 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>>>               OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
>>>               OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
>>>               OUT_RING(ring, submit->seqno - 1);
>>> +
>>> +             OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>>> +             OUT_RING(ring, CP_SET_THREAD_BOTH);
>>
>> Downstream does CP_SYNC_THREADS | CP_SET_THREAD_BOTH, fwiw
>>
>> Konrad
> 
> Unfortunately the rest of the sequence downstream is slightly
> different so I had to adapt this somewhat. Downstream does this as the
> very first thing whereas we have a CP_SYNC_THREADS | CP_SET_THREAD_BR
> beforehand so the threads are already synced, and there were a few
> other minor differences iirc.

Seems you're right, thanks for confirming!

Konrad
