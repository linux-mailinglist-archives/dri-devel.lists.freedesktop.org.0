Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F73A990D3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5CB10E6E4;
	Wed, 23 Apr 2025 15:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM9E2ZUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB8010E6E4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 15:23:49 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NA59Fm024290
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 15:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 r3FIkxvIinGQIcn2H7NbkL17x51IYW6d98QsKUMr6mM=; b=OM9E2ZUy88IfGzVL
 FoatmTtvhHzimCX7SP40jD5dm4SdjRbCGLzLC8D/vnO3aIYKZF5HdjzMVGMlqZPy
 mqojsB0Jv2CVheREflSAupJj2e5l21D4FfGn1TWumer7Tl1a9jaLOy25UN6uze7V
 zszN9rfpfUXbRDR0Fl0KBeL/r4UmLVBi79RGr/jGus4XfKqWlRwbnQCIYC+LcK7k
 C77M7vBEehcysBHElXFFeR40tWqcdY/38hjCI3WEAz09wtb4JSBD2MH5VJm8YCHS
 ezXgBV7ZY56YWioqDuzBv9O7JUgJxRdcKQBRPwZ4R6GKUtufn7hvQv33ZgHsFT+k
 yFxR9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh12j02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 15:23:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c09f73873fso982950485a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 08:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745421828; x=1746026628;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r3FIkxvIinGQIcn2H7NbkL17x51IYW6d98QsKUMr6mM=;
 b=LJuDrTlpHuZzlmVTvI2sFUnQYDhDj6/LUB0M9LBe+rkSYpGo5JGCudeu4MH0xF8HKC
 NQsroI7BM/euIPUZ9b3jmVT6p0XD4dXeXMksKfIg5DL0T0vvVD/W/7nErOosgoAO8h4W
 nlzHnWGUlILfPhK4n3lLOJk1yIYuBPApG5MoOstZGBke8u39YRw+oBw2HmGoWBLQauRX
 9rSESaPiPjGlimh4Kjt/E8/Y66AGSfBdPGTqdokdjrAETm0AeEsBKWxA7TFhyVahAYTh
 ZEMo4CkAkhO23/Z2EZtYFY7GDcfmHUekUVvcvutglcniEOq6FMeJKSfPsqvcMVdZuGkm
 jCww==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+of45wbKZV9Z0d+PJWYn4QmVOq6SQSuOfIiwUbFxzTsdOgvB5c/JRJPSS3cBnvUdM4EO3TC2ThHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8DJN3QxVk0bO8K3aiHXm0wxqpa3OfK431zhpTtLNXeT3Jz4fD
 D5Z/tdc/74QxyG1AfkfWNz05JlBzAT7BLF1ici/A9sXCQNqmimNAg37jaM1AWWa4q6XEA9Uuc6d
 FCnTfSoW8iuWl4zb4RHPIedSPFaPGy1roPXThY0/0iL1D6l6sbbnpLn92axrk5t7wmIw=
X-Gm-Gg: ASbGncsdaZc8sp0bk+/wWH6QnTNXsrW6kNswk8QuZubv0ZpynzHyEijhwXots+hrIeY
 cwCS434fYn/s8wqZO17dv/mlj0rjhLsQ7FhDXeurSZxWc5h3qUrCmmIQuwLCsZWPq5k9NnvX2PQ
 0kG5IZxS7XyoqYPGFtQUthretmuibilsARM+YjrDmDuSyBhSrsugZ6eh5QgSnQ+ImJsjCO5HdlZ
 oh2EdHX0NiXDbaCJwMtT6T/EWbgOto4Vo2Z1FgJ0MSvoSrUjrK7gfPEMMMfGQxhYUr8T0esJKcd
 Qgrj+Uv6guJcDrpP3JilvnZNaHgtXNoD7rQ+xgciiqElyKED+B4JO+nAC29VO0om+/XARFlfsdK
 WDGMjCv6OkomIXE/NdNClsReoxt2wPOgsHfoLmLg+fd3U1D75vAas8EedBun1dWCA
X-Received: by 2002:a05:620a:4149:b0:7c5:3cf6:7838 with SMTP id
 af79cd13be357-7c92805dcd3mr3251754985a.49.1745421827620; 
 Wed, 23 Apr 2025 08:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4VINuu2Xy9f+Jgd9x+sEEy1ml8USXXDrXZs3i+/S1a0FB6ilwJUPYzKZPPdxuaxS+9i8laA==
X-Received: by 2002:a05:620a:4149:b0:7c5:3cf6:7838 with SMTP id
 af79cd13be357-7c92805dcd3mr3251749885a.49.1745421827190; 
 Wed, 23 Apr 2025 08:23:47 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ce:6a0b:b501:c51a:e775:2fe5?
 (2001-14bb-ce-6a0b-b501-c51a-e775-2fe5.rev.dnainternet.fi.
 [2001:14bb:ce:6a0b:b501:c51a:e775:2fe5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-31090822c3asm19762901fa.65.2025.04.23.08.23.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 08:23:46 -0700 (PDT)
Message-ID: <6233171a-2964-4d57-986c-d3f1725eacd6@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 18:23:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Rob Clark <robdclark@gmail.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-hardening@vger.kernel.org, dri-devel
 <dri-devel@lists.freedesktop.org>, freedreno@lists.freedesktop.org
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
 <20250410-topic-smem_dramc-v2-3-dead15264714@oss.qualcomm.com>
 <20911703-ab4e-4eb2-8611-294730a06d2f@quicinc.com>
 <CACu1E7HDmQXDNtEQCXpHXsOKPCOgrWgo+_kcgizo9Mp1ntjDbA@mail.gmail.com>
 <1282bf58-e431-4a07-97e5-628437e7ce5f@quicinc.com>
 <CACu1E7GwMCt6+JJQGgSvJObTMMWYLPd69owyFo7S=sxu_EEsUw@mail.gmail.com>
 <16845de2-a40a-4e3d-b3aa-c91e7072b57f@quicinc.com>
 <CAF6AEGvyeRLHFBYmxkevgT+hosXGiH_w8Z+UjQmL+LdbNfVZ+w@mail.gmail.com>
 <acd1c8dd-286b-40b7-841d-e53e2d155a61@oss.qualcomm.com>
 <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SusmnRA-FLwemIRJJ5TokuLPaitDu0jl
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=68090604 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=INHOtyMNgn4pQtdJY3IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: SusmnRA-FLwemIRJJ5TokuLPaitDu0jl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwNyBTYWx0ZWRfX2dJasvs+G0jJ
 Ekl/HT8pS8+la+ltJoRnnVrMY7YNIRS8FFQM4LNG1/IfXgWkodYqsUVk5BOMrHdGlZiv4zfNbwY
 64UwjFYlUuprISAsGodw9hHXY9NHbmkmgQ5y2Db9BkdGthfvDM7hx7cDlxHz4DaVWOP3j5kdJbn
 E9Xj4XKkLUUgOoV9mQxCFsRpatAtpbOK3CMo1onW3H3J0u1tTxU2zq31KMDApPBRSv36Bb2x1MC
 uL3BVpc7D+C90kot/L0pQHyVFjJevYfqYfyjIO4xAqDkuHfv/yu4WCllGdBAiAC/1k4bCIOuMpt
 9LDLTpVhp9caQqfj6DR9UC/9+vrOfhA8C5PKytIx5lcu1ujSM0qBOHqjTm+M3VVLt9P/OXwCaSP
 G8QdYA9pDfBUENrQ+kHGYRwFfCPYwpwK1Sl4f8xVfLCAk5JxnHqsSIX2paopMtXd1ch10e2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_09,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230107
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

On 23/04/2025 17:55, Rob Clark wrote:
> On Tue, Apr 22, 2025 at 4:57 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 4/21/25 10:13 PM, Rob Clark wrote:
>>> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>
>>>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>
>>>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>
>>>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>
>>>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>>>
>>>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>>>> default (the one used prior to this change) on error.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>> ---
>>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>>   #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>>>   #include <linux/pm_domain.h>
>>>>>>>>>   #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>>>
>>>>>>>>>   #define GPU_PAS_ID 13
>>>>>>>>>
>>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>>>
>>>>>>>>>   static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>   {
>>>>>>>>> +     int hbb;
>>>>>>>>> +
>>>>>>>>>        gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>>>        gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>>>        gpu->ubwc_config.min_acc_len = 0;
>>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>            adreno_is_a690(gpu) ||
>>>>>>>>>            adreno_is_a730(gpu) ||
>>>>>>>>>            adreno_is_a740_family(gpu)) {
>>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>>>                gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>>>                gpu->ubwc_config.amsbc = 1;
>>>>>>>>>                gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>                gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>>>                gpu->ubwc_config.min_acc_len = 1;
>>>>>>>>>        }
>>>>>>>>> +
>>>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>>>> +     if (hbb < 0)
>>>>>>>>> +             return;
>>>>>>>>> +
>>>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>>>
>>>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>>>
>>>>>>> To be clear about this, from the moment we introduced host image
>>>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>>>> here.
>>>>>>
>>>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>>>> is unused in production.
>>>>>
>>>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>>>> clear up any confusion about Mesa.
>>>>>
>>>>> Although, IIRC kgsl did set different values for a650 depending on
>>>>> memory type... do you know what source that used?
>>>>
>>>> KGSL relies on an undocumented devicetree node populated by bootloader
>>>> to detect ddrtype and calculates the HBB value based on that.
>>>
>>> Would it be reasonable to use the smem value, but if we find the
>>> undocumented dt property, WARN_ON() if it's value disagrees with smem?
>>>
>>> That would at least give some confidence, or justified un-confidence
>>> about the smem values
>>
>> The aforementioned value is populated based on the data that this
>> driver reads out, and only on the same range of platforms that this
>> driver happens to cater to
> 
> Did I understand that correctly to mean that the dt property is based
> on the same smem value that you are using?  In that case, there should
> be no argument against using the smem value as the source of truth.

It is, but is done by the bootloader that knows exact format of the data.


-- 
With best wishes
Dmitry
