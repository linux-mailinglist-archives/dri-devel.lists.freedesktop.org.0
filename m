Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B41F9A9B930
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 22:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C734410E864;
	Thu, 24 Apr 2025 20:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FuFXDoxV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75F010E21F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 20:29:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmfLA006917
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 20:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AE6pFsekqcqEpjtxscTH0U9yzSRkz2si1yg/1Rn6R0I=; b=FuFXDoxVcgsmKjY8
 bMlQIDCswn+OWe9kpnZwSVbK/gROM10pRlRH+jjoT2NZ5o/BOvs/L1U1fk1WWelN
 PRAh8+BzNJfrzr9fjgBU79QOpCGmwZYm+W1sV7zsUPL3NQdMRvYyiP7G8DTeL7Xo
 AbUP/VmKBR4jeBQDSbtnSSP5o4SwTFVC+P4vVf3f7v9RAMugBeJaZghvaHOISPZF
 xt1j+Ew1XUisdTeuFo1SjnkT9XeScVZoIyhBhD51u/phtHzuvgVgG/tWK563h3s7
 G8tHf8aMxpPFSjY1c5DLX+RAXQ9EfWgmRbt8+ljbSB6cjvJfE9oQ9/ZrRpn3BwlV
 rn4QDg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2evu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 20:29:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c53d5f85c9so29119385a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 13:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745526542; x=1746131342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AE6pFsekqcqEpjtxscTH0U9yzSRkz2si1yg/1Rn6R0I=;
 b=wH835FldGCe89dg39FXFQfdKo1YuRMe+FWpaL3z7T0+m7SOWIPHICUsFI39pS64T+a
 VtVINk1YjW9f5fxpJSfrTAk2wNbxrAwzQtuo0gRQAqWsbP4mHz1+VWieR5hjObSqnNBy
 Csonp+z5pLZxPwQbGy1kdZT39QfqieOBJnJL7IaHYN93sa6V1kHEjNVEVKzkm51bX4Ej
 TV328T94GWizMuYp+MCW5/qxJFNQSRAj3eHdHCDvM3pEBDybCJcnRK/Mo4sKlauA2XtA
 cye7en8mpxTkVGXSVzH7H6XSWJ+GbeN2ybA1X2OQcZAQwCgYQz3+brZxEpfTcH4KtCcm
 32UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIw/N3Y6SofCYsq3qhimDP33+qgn3ocodgHyaSWzFqWtrjTHU4MDG31a2VRfYrOFDO8Hg9vSdZIRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiS5EbQa9OcWitTIiSLkJeJEjwIL92EeW/JDicBT5hDbXhGZrb
 eyIak/wgg7rB3zLNRVMy0I8cEc9s5XAOM11/qQndFBw5H/aNUGtWNLDpevpG+YZRsgqyAd72Sbs
 oA3B9R09ItXI670Hr+1NKWdrdwtli45Y1GFz/TZCQQerEPqNf94qQZCllGy4kWkqG1rk=
X-Gm-Gg: ASbGncu2mdRbMjsOIXwFbZzYQpb1PAytFrBapbUnT9YGxRIdleMiaOxqeEUDDJbzgNB
 0ubDK9NAryN/C0Jk04DRYSuxOqvgIXQE/u7SI0FDG/gyNdDglzFo2DxZ0G0l/5wIiLQxflNbYnn
 c9Wd33gJrMNHPwjvK48YdlJoG+4nBsrdf0PAQlFFlWcVtaxyeANU1V/jCsQ6T2dfMm5UgZ58HhL
 kn3Lp/BG3qqhb3tXhKMHU1EGtQAs2nj/jFlYy0KN4c6mcGqxubjKyHQZy4/v7UWfyW/kRd1/0MI
 LNuTdgkFb3/eovAiiq8Dhgmhc7/LPxtavFPw8uy3r+96+D6RIPraXjk01ULZ//vPqlE=
X-Received: by 2002:a05:620a:390a:b0:7c0:b106:94ba with SMTP id
 af79cd13be357-7c956efd7fdmr209394585a.7.1745526541810; 
 Thu, 24 Apr 2025 13:29:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5WXJS8NaqdeMt/+KLcu9ZSJwqsayh1efliZCQC90ik+AnNBQkVEBnW9Khoq4PWXzzmvC+AQ==
X-Received: by 2002:a05:620a:390a:b0:7c0:b106:94ba with SMTP id
 af79cd13be357-7c956efd7fdmr209392885a.7.1745526541344; 
 Thu, 24 Apr 2025 13:29:01 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4e7ccbsm17442766b.59.2025.04.24.13.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 13:29:00 -0700 (PDT)
Message-ID: <eac33841-4796-43bf-affe-31901344c5ff@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 22:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>
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
 <6233171a-2964-4d57-986c-d3f1725eacd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6233171a-2964-4d57-986c-d3f1725eacd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dTatGJAoOdfyIeBio6jkLCXXrkpA7G5m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE0MyBTYWx0ZWRfX4I3S3vaYzziq
 W15+WGMXU/9dKumVfcZ4wfX+n9c7TjlDCha07aTba6r67E1AWLicfpxj+2/814kdILWrawyIzr1
 wxp+UIffKHpr5k0m/PnL4ClWBj3P8xAaYWeAkLwh+sTe3+xwqJJ+FnAleaFy5edWyxbSZQ+4ivV
 3Of6stj+BlY1snwxdEIU0MvB2xP7GSZfay0BvivOZcyMNT+/kih7KITgYm5ptt6cZYzHCR21p2Q
 g3qjfw2w+8buRb/+Fyvgsq+P//TXscTi3XJQQrasDwcZmgv3evmoz8vU7JHkVHyZcLf48IuG1IY
 IedEEJS/7jyA+0Lv22AlotmOb5xXAPTH9hdIlJe/vqxzf7KOV7EXehidREuI34EEzT5xwNXdUIk
 K+M3pZH7/LxKu2j2NZalbLkBXnbS3YW/7215oO6Aa+tT3gJbOLuM3yRV7E/Lj/lKYQsDVFt0
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680a9f0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=U4o27yoWPFISaBf6hsEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: dTatGJAoOdfyIeBio6jkLCXXrkpA7G5m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240143
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

On 4/23/25 5:23 PM, Dmitry Baryshkov wrote:
> On 23/04/2025 17:55, Rob Clark wrote:
>> On Tue, Apr 22, 2025 at 4:57 PM Konrad Dybcio
>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>
>>> On 4/21/25 10:13 PM, Rob Clark wrote:
>>>> On Fri, Apr 18, 2025 at 9:00 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>
>>>>> On 4/18/2025 6:40 AM, Connor Abbott wrote:
>>>>>> On Thu, Apr 17, 2025, 1:50 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>
>>>>>>> On 4/17/2025 9:02 PM, Connor Abbott wrote:
>>>>>>>> On Thu, Apr 17, 2025 at 3:45 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>> On 4/10/2025 11:13 PM, Konrad Dybcio wrote:
>>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>>
>>>>>>>>>> The Highest Bank address Bit value can change based on memory type used.
>>>>>>>>>>
>>>>>>>>>> Attempt to retrieve it dynamically, and fall back to a reasonable
>>>>>>>>>> default (the one used prior to this change) on error.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>>> ---
>>>>>>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>>>   #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>>>>   #include <linux/pm_domain.h>
>>>>>>>>>>   #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>>>>
>>>>>>>>>>   #define GPU_PAS_ID 13
>>>>>>>>>>
>>>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>>>>
>>>>>>>>>>   static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>>   {
>>>>>>>>>> +     int hbb;
>>>>>>>>>> +
>>>>>>>>>>        gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>>>>        gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>>>>        gpu->ubwc_config.min_acc_len = 0;
>>>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>>            adreno_is_a690(gpu) ||
>>>>>>>>>>            adreno_is_a730(gpu) ||
>>>>>>>>>>            adreno_is_a740_family(gpu)) {
>>>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>>>>                gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>>>>                gpu->ubwc_config.amsbc = 1;
>>>>>>>>>>                gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>>                gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>>>>                gpu->ubwc_config.min_acc_len = 1;
>>>>>>>>>>        }
>>>>>>>>>> +
>>>>>>>>>> +     /* Attempt to retrieve the data from SMEM, keep the above defaults in case of error */
>>>>>>>>>> +     hbb = qcom_smem_dram_get_hbb();
>>>>>>>>>> +     if (hbb < 0)
>>>>>>>>>> +             return;
>>>>>>>>>> +
>>>>>>>>>> +     gpu->ubwc_config.highest_bank_bit = hbb;
>>>>>>>>>
>>>>>>>>> I am worried about blindly relying on SMEM data directly for HBB for
>>>>>>>>> legacy chipsets. There is no guarantee it is accurate on every chipset
>>>>>>>>> and every version of firmware. Also, until recently, this value was
>>>>>>>>> hardcoded in Mesa which matched the value in KMD.
>>>>>>>>
>>>>>>>> To be clear about this, from the moment we introduced host image
>>>>>>>> copies in Mesa we added support for querying the HBB from the kernel,
>>>>>>>> explicitly so that we could do what this series does without Mesa ever
>>>>>>>> breaking. Mesa will never assume the HBB unless the kernel is too old
>>>>>>>> to support querying it. So don't let Mesa be the thing that stops us
>>>>>>>> here.
>>>>>>>
>>>>>>> Thanks for clarifying about Mesa. I still don't trust a data source that
>>>>>>> is unused in production.
>>>>>>
>>>>>> Fair enough, I'm not going to argue with that part. Just wanted to
>>>>>> clear up any confusion about Mesa.
>>>>>>
>>>>>> Although, IIRC kgsl did set different values for a650 depending on
>>>>>> memory type... do you know what source that used?
>>>>>
>>>>> KGSL relies on an undocumented devicetree node populated by bootloader
>>>>> to detect ddrtype and calculates the HBB value based on that.
>>>>
>>>> Would it be reasonable to use the smem value, but if we find the
>>>> undocumented dt property, WARN_ON() if it's value disagrees with smem?
>>>>
>>>> That would at least give some confidence, or justified un-confidence
>>>> about the smem values
>>>
>>> The aforementioned value is populated based on the data that this
>>> driver reads out, and only on the same range of platforms that this
>>> driver happens to cater to
>>
>> Did I understand that correctly to mean that the dt property is based
>> on the same smem value that you are using?  In that case, there should
>> be no argument against using the smem value as the source of truth.
> 
> It is, but is done by the bootloader that knows exact format of the data.

Right, so the only point of concern here is the handwavy matching-by-size
logic.

Konrad
