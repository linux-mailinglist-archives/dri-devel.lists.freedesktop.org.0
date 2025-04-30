Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B391BAA4CC8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 15:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4AB10E796;
	Wed, 30 Apr 2025 13:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TdPTRbew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AD510E011
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:09:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U98c2X032081
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:09:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vRMOzQ1+a8EQloSooTZ1VPQWAuenrRDcnTPBGwn0XDk=; b=TdPTRbewAN+TNHGe
 NxnkUu8cl0q+5/I3KAw4TNDDFaIwyp6ja6iYQjo/dcbF7M2ZgapbqAw/H5dyN3iI
 VQex1vfjt+ogLMbv9q7yyFrTPbRhIOvSiDB5kQP1kE4mWkIIp/geLeT7Ifbc7VG0
 wLIgT07RMsu9I/+9m/bO76jk3zYPrSC3ONZd9EmtdmiKvogGZpDMvG+UORF+sxQw
 XnZM+IoXtcz+vduJPvPN5ckLfWNxX1k78wy28emvabbeMxJ7mNxmJrjrGRaaLiwV
 0l4xRDGklngle0GNSdXfGPJie1Q5hIImVQN7cry34YwqVA8D5SJysTQ3QFH/Ro/V
 iE0zhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u72aqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 13:09:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c54be4b03aso102801285a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 06:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746018585; x=1746623385;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vRMOzQ1+a8EQloSooTZ1VPQWAuenrRDcnTPBGwn0XDk=;
 b=j3de8n+b1K/BOgvt2UBElSlDotxX5HzCC48gOHK7zHtJsfehu+/mWgqk7uZ5duJbT3
 Qh5z40lTcILU5Hl5HERcvmPJ9M1qtZ6wifw4SQfayPc1somQj7Ve1hYue44uun7l1wpz
 xYLMJWcPbbulosy1Xp0fcZ0Z+Gm30EueZNEfrz14ogbISFVrRhZpXdXL7pmONEnY/IJ0
 6YtlNSzVJNry3Kl8jgk/xZtBE4HsFc1Q7b2VefY8Xn27g89pGhuSS1SYsSH19ni4EbNk
 NAFrq/VxXMeHNm5ShUZKQD/OlRDW7eBC9co0hMJq9ZxY9yphAD6aV7u1tI2rMw2gZ5GN
 Kiqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYAejOL0lHmV58VlQnfHJ66TwTSKNElYaOyw4niReVfBkGOxdu/sQqtdTs26O4Meuel2ZnMQnvxJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycxxQDc8rlPmOV80OC40H+jnPUmAl1ki2ENb09Y4AoPUTjlkFh
 KOEIn0FBpvtPo0M2z/Q40ooi4bi3J6g0npGMNwVsknLTajjNUpfQV8ARScwo8dRbKY1JZDKUIpK
 g9Zydhf4QqDR3CKkCEe4YQtwP+irO/VaAPzvwbehfiZKCc/eqWzHUNWbSpHn9hPxk8v0=
X-Gm-Gg: ASbGncvRt3FMFc1tUiJQFOFP6Vn5YtzxtjxbSAC3rIq1vfked87frRrY3/tA5mKtYlD
 BvqrpUVTGoDf334cZ8sqCkR3qem61MmkMG/3ds7kpfKu86GWl44Q/fWaJcKf+Rid5sRSb4wQxZU
 WGbhQtU2uv0ER7KeP0VfY6C+lBRRf5R5YdH3euzixailE5eC2p45E0bdOh5AKELnvzV2wBBIdk9
 0+VEidAh82jPcKwy/yHt35PLXacdaX1UGkdQF+zLHnjOZMkT93c/wSUTZ8sAV5ujv5rrnMZFQyB
 vxpTKBlOUTvbSK20GLFKagTchX9iDU6QMdSCm5SUh2JGAG4WQfBAY5NJHYkTSk90Ovw=
X-Received: by 2002:a05:620a:4494:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7cacc172af5mr26593285a.3.1746018584834; 
 Wed, 30 Apr 2025 06:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO097WTrfuIxU7CNWA83CThbCdCAbQ6J4gL7u3jo8Kby/5gjdIscRtpOeE3Q1bQkyisdevfw==
X-Received: by 2002:a05:620a:4494:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7cacc172af5mr26591185a.3.1746018584214; 
 Wed, 30 Apr 2025 06:09:44 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e4cd79dsm920573466b.38.2025.04.30.06.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 06:09:43 -0700 (PDT)
Message-ID: <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 15:09:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: neil.armstrong@linaro.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
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
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA5MyBTYWx0ZWRfX+s8rSw8lV+4Z
 i13jIEyEyJtlfNeiz54LEc17G9bZ1UqTd4sVkrfpAOy8nOis+mt/lA7kKqO7R7yR9lzv4wB+p21
 W4TsXwZF8RQguHYBXuYF3h/0Z/DoILWnFLdV1u0MICi8+H2yZmHrsMfD+B3HCsnnROfQJ3rAXrF
 FDH+c+GyYjWBUodAG6IFEyrMIpgKw8ndr+7Zo6u3VwW1fMHdlgvm1hhKn9i/4YMdOM0o1gs6/8C
 X5zErK231HLHPpUySXH78DxRTrz6w13fg6uyC/RWvSyLukNsDk/K5ucPqYiLEgvIUKlbbBGXlCZ
 V5VBqUrbDer1dhF65eZi2cQNcW07iDIyngPL5OVAInLeFZci3Fy4hNlEj3H54nwFbGK59fV9V9O
 S2buqxVzd9nccB7w09unGvy+m/NSUGuikanARec+EcNnigB0AKW3og7plm3etaPhom8UZIul
X-Proofpoint-GUID: Jq8wTckA_uUsNTtVPACP-5BNworG8ndW
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6812211a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=aak9J4RPMLM6hOP-xocA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Jq8wTckA_uUsNTtVPACP-5BNworG8ndW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300093
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

On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 14:35, Konrad Dybcio wrote:
>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>> Hi,
>>>
>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>
>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>
>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>> should be speedbin 1", but what the values are for said "everything" are
>>>> not known, so that's an exercise left to the user..
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -11,6 +11,9 @@
>>>>    #include "a6xx.xml.h"
>>>>    #include "a6xx_gmu.xml.h"
>>>>    +#include <linux/soc/qcom/smem.h>
>>>> +#include <linux/soc/qcom/socinfo.h>
>>>> +
>>>>    static const struct adreno_reglist a612_hwcg[] = {
>>>>        {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>        {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>            },
>>>>            .address_space_size = SZ_16G,
>>>>            .preempt_record_size = 4192 * SZ_1K,
>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>
>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>
>> What I'm saying is that all other entries that happen to be possibly
>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>
>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>
>> No, the default was to allow speedbin mask ~(0U)
> 
> Hmm no:
> 
>     supp_hw = fuse_to_supp_hw(info, speedbin);
> 
>     if (supp_hw == UINT_MAX) {
>         DRM_DEV_ERROR(dev,
>             "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>             speedbin);
>         supp_hw = BIT(0); /* Default */
>     }
> 
>     ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>     if (ret)
>         return ret;

Right, that's my own code even..

in any case, the kernel can't know about the speed bins that aren't
defined and here we only define bin0, which doesn't break things

the kernel isn't aware about hw with bin1 with or without this change
so it effectively doesn't matter

Konrad
