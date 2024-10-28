Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC0A9B2CFC
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 11:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2731510E464;
	Mon, 28 Oct 2024 10:36:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFJMbP0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9357D10E461
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:36:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RMmWoW024458
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CH7JmnR4WoQC2OKYDorurQUr/WQqgAw1HO8xagcwjXY=; b=aFJMbP0Cfbwg1eTB
 G+c2VR8vLJLLVh3VXrzSwfBSQFbRRT5WNS/e6H+4Q44FmYNlgwad1A0Uj9nLJA6r
 JkJKukgPK5Qxpwpr2Df9on9/Vdk+ZmPB3XlvJ6jK+DpirQZL5QVawST2MasqCp/H
 WqjijgUc6vXxqqsL1hE7TkjWkpS4zT8z4tHKOyTNQM40oKPS9HVLomUQZF1Z9Xh7
 RB0Ivl7FgIQYMLece03yZBTfrVdaU1oRIujXdYbZSskexk3FdKGxYOwnPb4A55oY
 YkytiJ/EKtdca6Uduf9pxQJ6AygMgd6yBVfNVZnkPXsrZGWChugsXuc7MsXmq1eZ
 eQg8zA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x4gc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 10:36:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6cbe40565feso13177626d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 03:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111780; x=1730716580;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CH7JmnR4WoQC2OKYDorurQUr/WQqgAw1HO8xagcwjXY=;
 b=dY+PCTDoxO5ICoY4cIe/35xWmrq1D6cTPFEdF7OX/wLfL/b9SVuDNOrjpH8K8SdzmC
 kCVYAaPjZsaVLfiAXiMhCXmFKUMP6kb22aFai8obIxSzZp5CLVfubqx/BDEQPw5La2gd
 g43+343D+d8BSCI7oLNXDhF+DtvIimeBO3ciLAj7BmAt7BlLsq7oufAVTK/Gh4t3/ZA4
 hib2H/9GPP1vyS/cHk7P6U1ZJmXUKMs4iFrO28av9B8IkFurPljLPxZU+vvRVgzPiM7w
 XVoT463NMu1/lNZu4Qniqf5MdhAW5AR+9Sp2K3/tU2LCr4jaN9NEqgMX2XRQuIPI5UoR
 b+QQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9cyWKGwz4B61rq8XBfpBYltcUknXZcflfbJq6oshZMOevBluxncfueogz/GH4ycKGKBGfxh7Ij5g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDyhpMOQir86OKrTCZcodPfRVnJWno/+bAy5uVtBhX8jXWOeLy
 /V1uSno+BpF9Qy2J/UimnOAYp5WQc/ItdZoNSRk2RqVTlyHZam8R/sXhW5L+Mq4sb9PJV8XMhmQ
 jhl8I2Z/0JktXiNjq1Z57pNobG14hvx6aTv3rsCmQ1v8o+yOMiZOR9yByQzOdv+nyAfk=
X-Received: by 2002:a05:6214:194b:b0:6cb:f0f2:f56d with SMTP id
 6a1803df08f44-6d185680265mr57679236d6.4.1730111779788; 
 Mon, 28 Oct 2024 03:36:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENDTBpL5QFAQCGHq9cO4L85islHNim+U5PehHq1rXAjJQ4OzkNGTFXOdlvbMWSpBERyIw2Zg==
X-Received: by 2002:a05:6214:194b:b0:6cb:f0f2:f56d with SMTP id
 6a1803df08f44-6d185680265mr57678966d6.4.1730111779381; 
 Mon, 28 Oct 2024 03:36:19 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f028f36sm361269866b.63.2024.10.28.03.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 03:36:19 -0700 (PDT)
Message-ID: <b7f72f38-2758-405b-abc7-60b73448d8bb@oss.qualcomm.com>
Date: Mon, 28 Oct 2024 11:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Arnd Bergmann <arnd@kernel.org>
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts>
 <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
 <CAA8EJpodjP3rY0Twe9sP37LWwk5ppP36dyLC9WKD6CTDOtmwzA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAA8EJpodjP3rY0Twe9sP37LWwk5ppP36dyLC9WKD6CTDOtmwzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y3bJvYCgAusnSl4_N9IByQVa67cHUARx
X-Proofpoint-GUID: y3bJvYCgAusnSl4_N9IByQVa67cHUARx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280086
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

On 28.10.2024 11:27 AM, Dmitry Baryshkov wrote:
> On Mon, 28 Oct 2024 at 12:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>
>> On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
>>> On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
>>>> Clang-19 and above sometimes end up with multiple copies of the large
>>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
>>>> fill the structure, but these create another copy of the structure on
>>>> the stack which gets copied to the first.
>>>>
>>>> If the functions get inlined, that busts the warning limit:
>>>>
>>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
>>>>
>>>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
>>>> the stack. Also, use this opportunity to skip re-initializing this table
>>>> to optimize gpu wake up latency.
>>>>
>>>> Cc: Arnd Bergmann <arnd@kernel.org>
>>>>
>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
>>>>  2 files changed, 23 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>> index 94b6c5cab6f4..b4a79f88ccf4 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>>>>      struct completion pd_gate;
>>>>
>>>>      struct qmp *qmp;
>>>> +    struct a6xx_hfi_msg_bw_table *bw_table;
>>>>  };
>>>>
>>>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>>> index cdb3f6e74d3e..55e51c81be1f 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>>> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>>>
>>>>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>>>  {
>>>> -    struct a6xx_hfi_msg_bw_table msg = { 0 };
>>>> +    struct a6xx_hfi_msg_bw_table *msg;
>>>>      struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>      struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>
>>>> +    if (gmu->bw_table)
>>>> +            goto send;
>>>> +
>>>> +    msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
>>>
>>> Is it necessary after being sent? Isn't it better to just kzalloc() it
>>> and then kfree() it at the end of the function?
>>
>> Keeping it around will help to cut down unnecessary work during
>> subsequent gpu wake ups.
> 
> Then, I'd say, it is better to make it a part of the a6xx_gpu struct.

I think a6xx_gmu makes more logical sense here.

FWIW, the driver allocates both _gmu and _gpu for all GPUs regardless

Konrad
