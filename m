Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BFCAB5F20
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 00:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C805510E5F3;
	Tue, 13 May 2025 22:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iG2fw2id";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D0810E5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 22:11:41 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIS5jh013044
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 22:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QuIBju/bfcvSH9aFOhrzW1870PZVgl8/kD81ju5wzh0=; b=iG2fw2id1IOkZA8h
 0hE7DbARmiWn1fxBv7lVsNAyIs2h4byXpCjOv4iY1EulQUx7Wag1PWcWvG+cOvGU
 c1dEP/iWCX+f0lWyRSXFIyU1pa42b8qDVUUACMtv4sWV73WSyGtjjcagZja9Twvd
 S72J/I8I7PDtnFoHrS3jDn4MKAgYpc+DLYiCU+K0JqrjvALXWi0FOrCcqi4xBUJH
 1naxbwIboeUDfr5c2tkdW1Xueb6AtDAfpNgD8QFXK7Zl2/5Kwdbdqk/jgKO1nofU
 tyreaLGfOU28Pztf4PSlDFJI+em2Kx8ehw76rOvlbpSPLx49CYuBvEBl48gRqY/1
 rm4nIQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp8j6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 22:11:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c555d4ad75so57828685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 15:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747174285; x=1747779085;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QuIBju/bfcvSH9aFOhrzW1870PZVgl8/kD81ju5wzh0=;
 b=vKsMOQ4AslAFwSqgsgqDZ9H15vqqNz6Hw2x9g5cDzZJkmNMx+rcSMZ7EcGNK3wwArs
 GmaRNIinbiHOQHp4oOfNaq+j4Y/YRs4+myIOZhy8SBoz53hgY9eFsM+7te42Oj5eEBll
 BC8BP+DJivZIxmTXEHbBbrotFuzsvLVQCuRWxleMpz9+yxPqgr1hifrdvqYXGDDfa+3y
 CbfDwSqa4qu6QS5WSLWEKQMNzTNEMQhA2k8hjYbaMptILOwk/yrjeen0CGJ8z7MeNQen
 SVnbQjrrIsZ3lkFY8G2gf64wPLgxdR/JttIJIUrTh9G0vR/1dVJtL3eIFgDRKjmdalsp
 W9/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK60jrnpu5M1Ryd1f3OAc4Ez+/7ELFnHu7EgU/PlGIv2GEUDjrETMuFNTIhFKMU+Gecsb5w/moWsI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyE7oQHaxClMPkkLR5Bb65t9rpFPG9279HDdUASLrXExd457d+6
 URdKDVFN58IU3ccPzDjKLKqOANtVXdAHJN7CKGtL8fR0b3Iqfsqu/Me5NPycb5ttuTheDvyft4w
 9U+lp4Qjgg91qTQCEL13GC8gn30BcDmOSg0uOxynwylhLJ5mB83A5nL7CaAnUnnQpGeo=
X-Gm-Gg: ASbGnctOrCDKRWqJD51dfTJhb20Arln+6ww/L4cIcnnUWjKunHXbrDtVSvbRWoAnmAX
 klngycrkUYyfz6w+7gkiYkGSVYz1n6iPMZ6tC8FetkAT4zmEz8Zsi7icPw6kLG2q0MH5NyNis99
 yMeacGDAmARcR9//DZ+acM4MuGtx2/Z55Y7HFbbfwhdh4wu2hYqu1pkgs+Chvb5ep7QHd9na5YD
 OBssf2OKKHw+Yp6QXp16zZbkCMjkLrzjdsTpaa2sE4+bE7XurAAGrKnLf+ZVyg7Qh696qfethrt
 mIL5A3O42aEvIliKnreIj88NxxMyUAUGqOJk28hhOyW9rlpkpPsuZm1tbW5aOzQmRA==
X-Received: by 2002:a05:620a:4902:b0:7cd:2992:1fb7 with SMTP id
 af79cd13be357-7cd2992200fmr24749385a.1.1747174285165; 
 Tue, 13 May 2025 15:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoxVDAJLBl9VwPhZr5BfNm1jaShPv13zbF6MvwOx2I5M4qz0J8tyiQARWXPmbeg+uDu4tdyQ==
X-Received: by 2002:a05:620a:4902:b0:7cd:2992:1fb7 with SMTP id
 af79cd13be357-7cd2992200fmr24747885a.1.1747174284714; 
 Tue, 13 May 2025 15:11:24 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad24677c9e1sm511489866b.88.2025.05.13.15.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 15:11:24 -0700 (PDT)
Message-ID: <fd7747c5-1e16-400c-95c5-e1209f58352b@oss.qualcomm.com>
Date: Wed, 14 May 2025 00:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
 <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
 <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
 <b7bd0f7a-854b-4464-abd6-51f932ee2998@oss.qualcomm.com>
 <CAF6AEGuDBdmyS+N4pR3gEYz0mSLkKqYZjCASk8am2atdGKq5UA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGuDBdmyS+N4pR3gEYz0mSLkKqYZjCASk8am2atdGKq5UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o1CAuPUxMiTJMKCl6IGkyVMKB0ITfokw
X-Proofpoint-ORIG-GUID: o1CAuPUxMiTJMKCl6IGkyVMKB0ITfokw
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6823c39d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=oFLY9Wx-2Yq6dO1YmhEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIxMCBTYWx0ZWRfX1F7ryePJRxCL
 9EF/lZycfeVSAjlvSYhuAoV4HtWhaIfn5oFCFwrdnIVS9cQXPAOCQRt90fFDqNmZWg6/InuHZBV
 CEJeQFVBko/m5y4FKBVte93OXeBhOPnFvnR/tgsaK77p4HwjC2et2eBVRTKf2H0csMXIs9ZHy7O
 9i7i2/3GwL9JpbE1FyEv33umPhXQzwExxWKBi460S+0OwsXzafEXygbAgR2JbQUkD7/K4clwORy
 mveNoWXtFFnhtNGhUt0Z7QS5voRkhkoaeDCYTJJJvSJ2ak+PBXgNGLvpsNi6+70l85nT0lkueCz
 YFMAXfMSTDr+VCHmGkOVl+TBdM3tOJgWE/1OBZT+RJaeji4MdPrAJEuX6BnO68//E7tVCBAMUEN
 O7DD5cBfhUUa/To6PACs9AEuy/nPJ9FBX96OfpK2Qf2ZtD+MtoSdGYGoZExrOjyWaJYew7G6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505130210
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

On 5/14/25 12:06 AM, Rob Clark wrote:
> On Fri, May 9, 2025 at 10:00 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/9/25 3:52 PM, Rob Clark wrote:
>>> On Fri, May 9, 2025 at 5:31 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 5/8/25 8:41 PM, Rob Clark wrote:
>>>>> On Thu, May 8, 2025 at 11:13 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>>>
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> Start the great despaghettification by getting a pointer to the common
>>>>>> UBWC configuration, which houses e.g. UBWC versions that we need to
>>>>>> make decisions.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>>>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>>>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>>>>>>  3 files changed, 23 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366cfbd22d5bcf4bc7 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>>>>>>  }
>>>>>>
>>>>>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>  {
>>>>>> +       /* Inherit the common config and make some necessary fixups */
>>>>>> +       gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
>>>>>
>>>>> This does look a bit funny given the devm_kzalloc() below.. I guess
>>>>> just so that the ptr is never NULL?
>>>>
>>>> Yeah, would you prefer this is changed?
>>>
>>> I think having an all zeros ubwc cfg isn't really going to work
>>> anyways, so probably drop the kzalloc().  Or if there is a case that
>>> I'm not thinking of offhand where it makes sense to have an all 0's
>>> cfg, then add a comment to avoid future head scratching, since
>>> otherwise it looks like a bug to be fixed.
>>
>> So my own lack of comments bit me.
>>
>> Without the allocation this will fall apart badly..
>> I added this hunk:
>>
>> ---------------------
>> /* Inherit the common config and make some necessary fixups */
>> common_cfg = if (IS_ERR(common_cfg))
>>         return ERR_PTR(-EINVAL);
>>
>> *adreno_gpu->ubwc_config = *common_cfg;
>> ---------------------
>>
>> to get the common data but take away the const qualifier.. because
>> we still override some HBB values and we can't yet fully trust the
>> common config, as the smem getter is not yet plumbed up.
> 
> So I get that common_ubwc_cfg is the const thing without fixups (and
> agree that it should say const), and ubwc_config is the fixed up
> thing.  But don't see how that necessitates the zeroalloc.  Couldn't
> you just:
> 
> 
>   if (!IS_ERR_OR_NULL(adreno_gpu->common_ubwc_cfg)
>     adreno_gpu->ubwc_config = *adreno_gpu->common_ubwc_cfg;

Aaaah I read into what me-a-week-ago thought and realized I did that so
that I can still make overrides in a5xx_gpu.c (where this data is
*always* hardcoded up until now) - I can simply squash the last patch
with this one and we should be gtg without the zeroalloc

>> I can add a commit discarding all the HBB overrides (matching or not)
>> or we can keep the zeroalloc around for some time (i'd rather keep
>> the function returning const so that when things are ready nobody gets
>> to poke at the source of *truth*)
> 
> We can keep the overrides to start (although the goal should be to
> remove them).. but qcom_ubwc_config_get_data() not finding anything
> seems like more or less a fatal condition.

Indeed

Konrad
