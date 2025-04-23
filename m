Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2AAA98E90
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7344210E6D2;
	Wed, 23 Apr 2025 14:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nvTunfoH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2086510E6D2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:57:25 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAkCcE022002
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2NRWiVsbvNnHIcTKizG+XsT0FlriKnOrULiycN0aiQQ=; b=nvTunfoHTEC8X1zn
 QR3LnOD5QTP/KHCQnZIJv82ptdIsFjV36ZOl9IqTjeni4mcK0UCSfuaHotPOtdnQ
 LRFlVnVToEzL/RCq+yzS+kr2blw2jFwvXFhdz1hQQ/9qt9Dc8OfwsgqoVeFmd8P0
 gdLz0Oo7Hce459E4OKdZUpawGnoL2D7NN+k6qIvtAUU7P1Zk2tvJTYcj5JxUl8FF
 s6nOSZToJuSFP7JaE6GVZcAVym+2VVsadr+VQe2maYe42hf6PQ18LWVglfEwW+4z
 vV5t2kd+cJL4Fylk9oegXYXAfP5TBW0weF6VZQeubaNApbLei7NRMQv+xJ0veAhj
 Ll0R6w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh12ff4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:57:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c54734292aso124772485a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745420238; x=1746025038;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2NRWiVsbvNnHIcTKizG+XsT0FlriKnOrULiycN0aiQQ=;
 b=pLmUg31xVFFcd+hT2gOwDYv3Zg3eQciipK43cdfWGR3Ewk4QZ14tCSs+ZPv80KcBeq
 MLOTaZq+gyyAeQJvV2FF0+7p++uNLyss8w11UoWO3YnlpDYUR5qi5rPp//vB6zmaYVAt
 PET2Umv7ioXHB7uXI95/nAaCQHBDTFLKJKpgP1dK+5W7aSIhIi12Lyuoxpz4sm3jh1yc
 g/AKDzx2bdB2Ybhu+USKR46At0yZvKyTecU+ao+8aZnUhr286bW1ZedZf9mvAU9B7yuR
 jWQopTUjtmvGE1CDPwUg4eeKCsP4/pqkf/6fULtdjj1YJIyQglOZMjxz3pbc5497eteO
 A4lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm2lCAYpQWaJ159C8/MhM01u3sj8Y3Dz/GKn2hEV5cOxQUBBHEYkGBR/ZXI04yhwm97ltSnqDXAhU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOLWZeMgKqDEf7+czlXkihGJnhTHtcA2copdQOjiNGNBKFXkqr
 izwBG3T1PpNhgIiN+KXd4AIN6PnQTH+LWF42nLv4yGLK9LIRTk2i9nGv4n287xD+cUACrSWCe0u
 0RhgcmwaagkqB3e2YeApIw5kEeXE9fRPDeCrNwnxw5XXukHWhseHCWEllCsmBx6XdkZ0=
X-Gm-Gg: ASbGncvp6WXf5CIaAvv6jch2MUGnkaTxnN7YA/xKy7ZkOfadXZ+pPk5nHqHQDoy7+8x
 H1+JF3vWXL6UWvvKPbyys08pbb/dKQOVaBj+U4JvLh5WsXlcokp56jEirh5GsFRep9IzkaGnmoB
 jakhy5kLHPUMNNQz6vx2e8bFfTF5UMaS1ob2yFWOY9/YKSSYnKf9+yDOY4k7aRrERUVUnA6Eyfd
 JRAuJM9NRRUCHI9IcjTJnCSAsfp2OKrKO62JZanJiG9PCrwR8n1g01b50sT0nNAVOShkz3yyVgC
 Z78SIBXLKcltIWOArJKEkoWRPgnpcod02NDirvuH15Oss1950IuxFbTOtSh/Mhfd040=
X-Received: by 2002:a05:620a:1a83:b0:7c0:c024:d5 with SMTP id
 af79cd13be357-7c94d298995mr245301485a.8.1745420238255; 
 Wed, 23 Apr 2025 07:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7NASz5S114ThP0dvyExe5F00+leMGaZwFVeXLrWh9p/BkVwDIsMC0C1e5A37iHj6HGPixnA==
X-Received: by 2002:a05:620a:1a83:b0:7c0:c024:d5 with SMTP id
 af79cd13be357-7c94d298995mr245297785a.8.1745420237855; 
 Wed, 23 Apr 2025 07:57:17 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f62594985bsm7594334a12.74.2025.04.23.07.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 07:57:17 -0700 (PDT)
Message-ID: <4b1f9228-2600-4d97-a60e-9099878b3f2a@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:57:14 +0200
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
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGts5rWvgyZy8RtAaUOsad362AG-uNjxF9vyj4szg=b5Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KW50XY9NqamYK7bU27gwiEtLcWGLEE6n
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=6808ffcf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=INHOtyMNgn4pQtdJY3IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: KW50XY9NqamYK7bU27gwiEtLcWGLEE6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwNSBTYWx0ZWRfX9D0m6ML2FJZ7
 w9BT6UNSoR7zkyXNxOKm1jD2Aoiy8OiecPEKsIbUL0QrK/6vgyyMUl7UrM7DKjkcsSn8Watq5qH
 /tk9cBPE1zysdkwFztucU6/FbLCEeSRskSgQ/cHkQLgapLSSsWOlUQ6zedvapuPkNOVm/rKLPus
 VKp8DPkDkyx7ksWeOOhOC2s8m/ibR+Tx8fdXq7XjgNBljKaU1k9LlVybpu022r2JgGyBhcLWGxs
 ELU2VQe/R47qk7vAJAQhI318mGd6/SahZYrjQ2VMRRGZ4bOK1yd+8RrkR7zAaCuGk71QGks8lCu
 rPAPqwGO4GYQ6tYraxap9A8QVkQV0skphWq98+uADKZzI8SJ9xWR2dUWMuMQaCFkghg88o/my7x
 MHO6S8PsrX5fmrR8wr3c+mzLmuEydor3zRkpnH0Q7+xsMmpGFn4enwdMjR+wI2xzgohqWpU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230105
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

On 4/23/25 4:55 PM, Rob Clark wrote:
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
>>>>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++++++++++-
>>>>>>>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..a6232b382bd16319f20ae5f8f5e57f38ecc62d9f 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>>>>> @@ -13,6 +13,7 @@
>>>>>>>>>  #include <linux/firmware/qcom/qcom_scm.h>
>>>>>>>>>  #include <linux/pm_domain.h>
>>>>>>>>>  #include <linux/soc/qcom/llcc-qcom.h>
>>>>>>>>> +#include <linux/soc/qcom/smem.h>
>>>>>>>>>
>>>>>>>>>  #define GPU_PAS_ID 13
>>>>>>>>>
>>>>>>>>> @@ -587,6 +588,8 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>>>>
>>>>>>>>>  static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>  {
>>>>>>>>> +     int hbb;
>>>>>>>>> +
>>>>>>>>>       gpu->ubwc_config.rgb565_predicator = 0;
>>>>>>>>>       gpu->ubwc_config.uavflagprd_inv = 0;
>>>>>>>>>       gpu->ubwc_config.min_acc_len = 0;
>>>>>>>>> @@ -635,7 +638,6 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>           adreno_is_a690(gpu) ||
>>>>>>>>>           adreno_is_a730(gpu) ||
>>>>>>>>>           adreno_is_a740_family(gpu)) {
>>>>>>>>> -             /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 16;
>>>>>>>>>               gpu->ubwc_config.amsbc = 1;
>>>>>>>>>               gpu->ubwc_config.rgb565_predicator = 1;
>>>>>>>>> @@ -664,6 +666,13 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>>>>               gpu->ubwc_config.highest_bank_bit = 14;
>>>>>>>>>               gpu->ubwc_config.min_acc_len = 1;
>>>>>>>>>       }
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
> on the same smem value that you are using?

Yes, abl reads it out and modifies the FDT based on what's in there

Konrad

>  In that case, there should
> be no argument against using the smem value as the source of truth.
> 
> BR,
> -R
