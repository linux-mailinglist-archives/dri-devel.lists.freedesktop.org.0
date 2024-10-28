Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4019B2EEB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED8AD10E47B;
	Mon, 28 Oct 2024 11:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O48pUA0f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39C110E47B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:31:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SAVqu1027014
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Fay1WfqSR5ZfNix8IeEA2i6PepY/ruW4Izlv+/bHV0A=; b=O48pUA0fHbAHs9On
 A0j2qJbEO+quqEysLo8jMe9xmB1AaO39EC43zjrhqCmbo+KwkaN03bDuY/4kEHj5
 0q56AdsX/T8s6epYeDPU/w1QshWLaoFh5Tj9XO1n1ExjjEjL/8kpNGXiq8GbR2HB
 vdC/Vrm+fvtqSBU1Nw37m14wASTPpKznP2Gr+863Td8RFDg9e/nEmSzbbgxxJOWW
 epA+v79Fl4OgWSfPr3h1HNAW8+qwLBV0gcEkCPqLVS/7gyZThC/Hhkd5F8HCs9fo
 PyVuYOUu9lrL9w3gozkW61DQ8CmJTBRfkUFOGwVaIz5L5smg33kYxy23LyCLk0YE
 fADK7A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgmp4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:31:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6cbf3f7273cso14512756d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 04:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730115115; x=1730719915;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fay1WfqSR5ZfNix8IeEA2i6PepY/ruW4Izlv+/bHV0A=;
 b=D5AWMUs31nL8Qag0B5YfuHpbHYK/cdazAj8cX/IEIjZyUVmQ3w3ZmoK2ugKN1OI/+O
 ldPpDrpgB6XIaGAkAoOvfun1SLhpGhoKL2VJ+PVhxh9s94mUWeYmwZO5vtRzbedu2E+l
 UxEeZiSiC/uHNjiR83pxTZSxGimx54bupJjCyotXIxIWbbk6GN/568MNNDMQcEEglQGt
 vYGYW7w5TLRGR6VnObW5QQR3yqXOj3TQTiumuYzn/spJ2kSN9nKAjFosqQi3ngLfmroP
 jUjrmrx8BG3IwUJvYZluBYFN7S0z47XXH/wB0H1cUcF/JkkmdOJYoABR3Sxj9r0hXnaP
 mrkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcWvdPFbtv36bm9ypfPasgGi7ZaNjrh6EBFXhXgrnY9R9OnhsbWMYb3eenQ5wWn3fd4LtpgF3Y7Qg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPGvarKMH3CMCKuL9pJWHHqMKhsPf6frr+uKwPXfyFCvEFAiqk
 v8ZC8us2t0TNazoMe2PzdLwIgXKGRO52yefr4/m4TAkzkjessgrs7HajVp7Bjpa1JX87TB7maGG
 K5wfB0N1uhO2M8X+UNTq9Y7mH/xLhgeH08eb70WulCPERdrzwovNiI752qdZ34yh0lqU=
X-Received: by 2002:a05:6214:2583:b0:6c5:3338:45d6 with SMTP id
 6a1803df08f44-6d18583be81mr55405626d6.11.1730115114827; 
 Mon, 28 Oct 2024 04:31:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkvgYqxpo2ACrB5DdSvsn7yzDd4MDBFRzTXO/ZPMds196WuLyzCIGXKaPWm/X4ux6U8JcyOw==
X-Received: by 2002:a05:6214:2583:b0:6c5:3338:45d6 with SMTP id
 6a1803df08f44-6d18583be81mr55405456d6.11.1730115114488; 
 Mon, 28 Oct 2024 04:31:54 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1e0b232dsm366494766b.26.2024.10.28.04.31.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 04:31:54 -0700 (PDT)
Message-ID: <27bea27a-9aa3-42f5-9b0a-df5744276966@oss.qualcomm.com>
Date: Mon, 28 Oct 2024 12:31:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
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
 <b7f72f38-2758-405b-abc7-60b73448d8bb@oss.qualcomm.com>
 <vtj3yahojkozge4bvq66ax2c2idbw27c3hs7l6cy3e7ucz4jqb@qge2nckj3mr4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vtj3yahojkozge4bvq66ax2c2idbw27c3hs7l6cy3e7ucz4jqb@qge2nckj3mr4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9FW5jNgWGXipH0AiSSnFz6HBL_2lzFRZ
X-Proofpoint-GUID: 9FW5jNgWGXipH0AiSSnFz6HBL_2lzFRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280093
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

On 28.10.2024 11:52 AM, Dmitry Baryshkov wrote:
> On Mon, Oct 28, 2024 at 11:36:15AM +0100, Konrad Dybcio wrote:
>> On 28.10.2024 11:27 AM, Dmitry Baryshkov wrote:
>>> On Mon, 28 Oct 2024 at 12:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
>>>>> On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
>>>>>> Clang-19 and above sometimes end up with multiple copies of the large
>>>>>> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
>>>>>> a6xx_hfi_send_bw_table() calls a number of device specific functions to
>>>>>> fill the structure, but these create another copy of the structure on
>>>>>> the stack which gets copied to the first.
>>>>>>
>>>>>> If the functions get inlined, that busts the warning limit:
>>>>>>
>>>>>> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
>>>>>>
>>>>>> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
>>>>>> the stack. Also, use this opportunity to skip re-initializing this table
>>>>>> to optimize gpu wake up latency.
>>>>>>
>>>>>> Cc: Arnd Bergmann <arnd@kernel.org>
>>>>>>
>>>>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
>>>>>>  2 files changed, 23 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>>>> index 94b6c5cab6f4..b4a79f88ccf4 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>>>>> @@ -99,6 +99,7 @@ struct a6xx_gmu {
>>>>>>      struct completion pd_gate;
>>>>>>
>>>>>>      struct qmp *qmp;
>>>>>> +    struct a6xx_hfi_msg_bw_table *bw_table;
>>>>>>  };
>>>>>>
>>>>>>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>>>>> index cdb3f6e74d3e..55e51c81be1f 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
>>>>>> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>>>>>>
>>>>>>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>>>>>>  {
>>>>>> -    struct a6xx_hfi_msg_bw_table msg = { 0 };
>>>>>> +    struct a6xx_hfi_msg_bw_table *msg;
>>>>>>      struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>>>>      struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>>>>>
>>>>>> +    if (gmu->bw_table)
>>>>>> +            goto send;
>>>>>> +
>>>>>> +    msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
>>>>>
>>>>> Is it necessary after being sent? Isn't it better to just kzalloc() it
>>>>> and then kfree() it at the end of the function?
>>>>
>>>> Keeping it around will help to cut down unnecessary work during
>>>> subsequent gpu wake ups.
>>>
>>> Then, I'd say, it is better to make it a part of the a6xx_gpu struct.
>>
>> I think a6xx_gmu makes more logical sense here.
>>
>> FWIW, the driver allocates both _gmu and _gpu for all GPUs regardless
> 
> Hmm, are we expected to handle / perform BW requests in case of GMU-less
> devices?

opp-table does that for us

In case of no gmu ("gmu wrapper"), Linux is the only entity that controls
things

Konrad
