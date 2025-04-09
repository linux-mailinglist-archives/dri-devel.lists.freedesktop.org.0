Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E792A82A0C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 17:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B4710E93A;
	Wed,  9 Apr 2025 15:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FWte/KnC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261F510E93A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 15:22:34 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398S3ak023665
 for <dri-devel@lists.freedesktop.org>; Wed, 9 Apr 2025 15:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iCuvAY1136gR39qITiq/pHL207Ayurzq2f2+DfiLkY8=; b=FWte/KnCblohf2nC
 y2Vv4N1lU7dFggpsR0imf8eDB8KJptYiL0xhNftuZaEItLjxG8ewnvVIFZ2Iy0Op
 AGeezaP9MxthirZHk7Lp2E+dmRvWXBcS39QJ+7bQ0iDPphp0gdbg1lG7sm3ows6p
 qEVqF26UgPbhX7OCFdYoHoEPlUtLufIkEykMeK7FKXk31hd8xwg80S7K4p1DTcFa
 7/lRpO4eYLmsN7PQyOF52HmMvt54VjTYp4LRVsafx8fSAiBqE1vq1OoZxuODsRzG
 /eJaGSqaqN6Zec4tGCm/ywAskOF08oom6xvINDw12St3Cw3hkuzZvhBPA5HGzP7f
 0lrrLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd03wjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 15:22:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5466ca3e9so99340485a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 08:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744212152; x=1744816952;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iCuvAY1136gR39qITiq/pHL207Ayurzq2f2+DfiLkY8=;
 b=ERr5F1nH2dPgVqyFMtDuRQ25A9Zf3eHBUsCp8zMp2vQMBwBmhBRkqfz1bXrk6zoK3I
 RYNxiPQGD571rsvptYdSvYWwhkmwTW7ZMeMw6fqoKfqRSQlgFDvCoFxeFwFgQ6i6XY6j
 JfpdA4FXVu5vY2C6BOZo+zAhHK+hJx7JQGHq4AtyNuA5RNzoBUzk6jGQdDI9bjfI9xvp
 fltx5QhxOaQaBlSlimPkDngDgeIWeofiVgcGcF6qebZFwiyCNDhpYIo1ijYLmbJfQocm
 4WXHmw0uPi7xDpes6SJAGxWrq1NJnRURvUDrnytVZu5yl5n/5EL9SpuyOJVwKfvt0Up3
 IIzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpKFmSajLzB9wggO0q4F1J1IeeiwuPYzczxnXAgvrdEi8iKrYF+/6znRyZeOqGhk5Mq4PDYq2GQvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxL9TUTrEx84nBcwotwZBZc6Nf3etcxwa26QGBLQLObqCvWROz9
 /yfcYK4r3F42+XS7Ej37sKZ1FrNm+Hn9GnOBTOzCU94opeIkP/On7ZYL6KCaudogpffgpUp1vJQ
 jxzfamftnc+RG9WuosK9ivEq75j2FppXH5dxD9ehK16Tj1tWZr2tv9oIBNI1klVYlV5o=
X-Gm-Gg: ASbGncu7iB52aY646ElLAPRcMXizlj8dhcyMsurGruerPXvVQRd72bSTxSG2WXnIuUm
 nIdjWleHVYjJ3z0vf4DU8ICMg2BKA6aZX0T2yTJzsv1/z/uFgTPK2kPPgptLwLrQk4ZgzFxXBrE
 XvjMYlXA1XUH5+XRIjbDiw/Qx7UzvyXo4UUBCaUSW3OgBg1wr6H/jAhpgtGPfHpwo1ZvT231TXt
 SyTewo2USLUHheezXRHcS9VKhaLBjjyf3ySKJJHpQyZWaihqnQAF+9qJdJeo2NVUQvpJEhLurWw
 FD3wBMve7CRSooXgf2Cksnu8Rb5AUKmcgnR2OMszyHqi4RRAM2L39JWovLlxOr3jTw==
X-Received: by 2002:a05:620a:2616:b0:7c0:add8:1736 with SMTP id
 af79cd13be357-7c79cc4b3f1mr182217285a.13.1744212152376; 
 Wed, 09 Apr 2025 08:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu16PD6OWFhO9+2EVDMjvLbDZARn5f6zRS1+14nIt+zna7yAHulu/WcriBf7XUUO62wWUHLA==
X-Received: by 2002:a05:620a:2616:b0:7c0:add8:1736 with SMTP id
 af79cd13be357-7c79cc4b3f1mr182216085a.13.1744212152091; 
 Wed, 09 Apr 2025 08:22:32 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb414dsm109595366b.121.2025.04.09.08.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 08:22:31 -0700 (PDT)
Message-ID: <c2dac38b-bbe5-4cd1-9d33-b4bba629d54b@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/a6xx: Get HBB dynamically, if available
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <20250409-topic-smem_dramc-v1-3-94d505cd5593@oss.qualcomm.com>
 <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7GMf0Mx2ZX_t76h+b1CPin49LGix7c5uvoWaJZC3dKyOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4HH2rdIUK0x5GSbOGIxmHs43BItWxIXR
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f690b9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Z2wkywZrCN8y_YYJSgYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 4HH2rdIUK0x5GSbOGIxmHs43BItWxIXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090097
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

On 4/9/25 5:12 PM, Connor Abbott wrote:
> On Wed, Apr 9, 2025 at 10:48 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The Highest Bank address Bit value can change based on memory type used.
>>
>> Attempt to retrieve it dynamically, and fall back to a reasonable
>> default (the one used prior to this change) on error.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 22 ++++++++++++++++------
>>  1 file changed, 16 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..0cc397378c99db35315209d0265ad9223e8b55c7 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/firmware/qcom/qcom_scm.h>
>>  #include <linux/pm_domain.h>
>>  #include <linux/soc/qcom/llcc-qcom.h>
>> +#include <linux/soc/qcom/smem.h>
>>
>>  #define GPU_PAS_ID 13
>>
>> @@ -669,17 +670,22 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>  static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>  {
>>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +       u32 hbb = qcom_smem_dram_get_hbb();
>> +       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>> +       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>> +       u32 hbb_hi, hbb_lo;
>> +
>>         /*
>>          * We subtract 13 from the highest bank bit (13 is the minimum value
>>          * allowed by hw) and write the lowest two bits of the remaining value
>>          * as hbb_lo and the one above it as hbb_hi to the hardware.
>>          */
>> -       BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>> -       u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
>> -       u32 hbb_hi = hbb >> 2;
>> -       u32 hbb_lo = hbb & 3;
>> -       u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>> -       u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>> +       if (hbb < 0)
>> +               hbb = adreno_gpu->ubwc_config.highest_bank_bit;
> 
> No. The value we expose to userspace must match what we program.
> You'll break VK_EXT_host_image_copy otherwise.

I didn't know that was exposed to userspace.

The value must be altered either way - ultimately, the hardware must
receive the correct information. ubwc_config doesn't seem to be const,
so I can edit it there if you like it better.

Konrad
