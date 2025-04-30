Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94484AA4B57
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 14:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5ABC10E76C;
	Wed, 30 Apr 2025 12:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCOo2aW/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F2510E76C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 12:35:42 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9PqHZ018627
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 12:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cnlo59KsvGmoAJK5ykVOnV/qLVIIalGNC4+OxntEXxE=; b=kCOo2aW/dNR4HZBi
 hTvCsRcyGXI6Sr5fc1x0GWYvFjc6V9Lq1WrSbyvVXEAapiPIGUqnXXq/Eneyuds/
 eMmWZvRyBYy7LH6j760UO+GOoWz7Ab76FhnNgd9hfZiKGT/EmUqy2/A+B1GxZkbD
 oLmAVhlvc1COl6Sd7pBlGZI89TgZ1fpax5qbsPgvdi5viqcmMLugbxWBgQSBiYRA
 uBfAg2trRUMJ1ISyL0mbv0s71nUP8F0BtGgvTISxIBaTqIE/BrhnQa/hAnXVBjg7
 BImfF0zodWtqi82nB3kQbmOe+b97rBBh5RtJKXPxdUG71gIDeY9mqGq0SFfdu87b
 QevxqA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6uaa4w9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 12:35:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4768b27fef3so12150331cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 05:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746016522; x=1746621322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cnlo59KsvGmoAJK5ykVOnV/qLVIIalGNC4+OxntEXxE=;
 b=DBTD4n7ick+nciUHaXpWvahUqQsceSlVP9F5WNEJImd8y3Yv5GB9myRoxbQbBE/KMt
 9zcZGzjjuVL3TRIVMfiKL1DrBclqKjfXXUTJdlrJPojWO1Oj01OPhY3RWVjYwMxkStPV
 WsMpmeUHrHJPkL83qzWT1cY9DG9sjgA7GnTpNyH6lczJRIJc47AKvuVxET4dgDMu2b3c
 3kZnm5krDLQAYCFKhuJRHBmu9mhgKVK7heYXRMchUT6HJDSgColJe534nRprBn6OWghi
 nikv/0ab5cB+qLkL+hcszza98m5fMUvLD3GJLiGsDmV8TdSnCtyn67c5ongwU3qKCE2V
 owTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmnYEGIoKRsiV2ifZYUDMyMcDNuAh77PySdqsMuuLxEHbsLo+MS67gL5pRpxLLcj7LpvDBhjj/4Tg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4dzaJNaN+jw4fTNZxGus2p+dE4prHXzYPr7WyhBaI1wzE99E+
 +5bSAjxyQyG3TfxajspBVLjfKx0CpK31dECGMLhxM8sD3Hp60gxrudqrpzFvL1am46++LJYxEvL
 6W1Y68awTWitoAzMI4nr5lDgt/Y9JwVWqEFfu3yiMfarmYqDMuMLad+HXdDM1Je7/pKI=
X-Gm-Gg: ASbGncurmdobRqw/thke8/PWAefIYqvveB2lUCN04jAp6LMFp3LZ/xrVADX7b3re28m
 lCHObCn4ngIEvEgi46Goz8MgrQ+vxYPVsfw9eFvRYNmz5oa5zXlnhEf1189fe8Uswc0LgRiisds
 t3b8Ct6j8f1EL8TQIiL3+QtQAYCCKy0dAPCvMAY5DaOhZobP7501/ZmywHkfE68ZgXbm6JCqkg3
 P7+cFOzD6sBDWgOBC4Jstnh9omfufcDQgFBqdKrwtZuXMLmDt/D3DIAClsQrhPKmEXsyHl9ikmI
 5ins9Yw1OODxk3AlltrDNBR7Xa43uPRJKnwOvdMCF24FtwBXfWCnkXchD+u3x24jcJc=
X-Received: by 2002:a05:620a:2722:b0:7c5:e283:7d0f with SMTP id
 af79cd13be357-7cac85a0299mr123370185a.8.1746016521541; 
 Wed, 30 Apr 2025 05:35:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5YnBbAS+ImgEHeNjfO53rm94FOWqBYpnXyEX6Ie1ldv17RmYfaWc5AhrZsf2uYwjVaJF4eg==
X-Received: by 2002:a05:620a:2722:b0:7c5:e283:7d0f with SMTP id
 af79cd13be357-7cac85a0299mr123368385a.8.1746016521141; 
 Wed, 30 Apr 2025 05:35:21 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6edae042sm913931766b.169.2025.04.30.05.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 05:35:20 -0700 (PDT)
Message-ID: <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 14:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BNizrEQG c=1 sm=1 tr=0 ts=6812191e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=_6aSloehX7qqCDj74gYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5MCBTYWx0ZWRfX0ePik98CHPxY
 zMK5TnoPiSBd3vrrR8h52vbJCTWoWM2eqRbki1UE3PWkL8Gzj1GWdE2drqD7Ki9siJJSxfDWweV
 50xRlARN4WJf6PA+QfxzYYDPKhA06A1Kb8ubyXXtvJI4Z6OBIdUFM47nqS+XdxtiwDTpAdNP9Kw
 fIzIIUB7wb5Ew4mj0XbNTf8pAbauJdudOUe4uTNBi4kqfQFhkfCP6N5gLU33cB0D4xGQx86gr2R
 W0EatPXys7mAR5XOvfdNZkH7g1/LhQwqfuAptWHslnkPHNLbM8Yj7qzXVezQfq1aOJTGmvOI/cW
 Zt1OfmDYbN203nSxUyLzxT5jYPHadm714NPHK4ghagZ3kYtrz4LZZZTefi6mvgej0aCj2GPaubg
 TjYd7jIcPVu+/cUXXgi6sMDU7ZekK8zpup7sUvAXf/iFoeuPEhRnRbtZ6WT6Z8qU+Yb98qe1
X-Proofpoint-GUID: 253Xet1AFgsO1OiC7I3tiZ3VvwzflRo4
X-Proofpoint-ORIG-GUID: 253Xet1AFgsO1OiC7I3tiZ3VvwzflRo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 phishscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300090
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

On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 30/04/2025 13:34, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>
>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>> should be speedbin 1", but what the values are for said "everything" are
>> not known, so that's an exercise left to the user..
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -11,6 +11,9 @@
>>   #include "a6xx.xml.h"
>>   #include "a6xx_gmu.xml.h"
>>   +#include <linux/soc/qcom/smem.h>
>> +#include <linux/soc/qcom/socinfo.h>
>> +
>>   static const struct adreno_reglist a612_hwcg[] = {
>>       {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>       {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>           },
>>           .address_space_size = SZ_16G,
>>           .preempt_record_size = 4192 * SZ_1K,
>> +        .speedbins = ADRENO_SPEEDBINS(
>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
> 
> I'm trying to understand this sentence. because reading patch 4, when there's no match
> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?

What I'm saying is that all other entries that happen to be possibly
added down the line are expected to be speedbin 1 (i.e. BIT(1))

> Before this change the fallback was speedbin = BIT(0), but this disappeared.

No, the default was to allow speedbin mask ~(0U)

Konrad
