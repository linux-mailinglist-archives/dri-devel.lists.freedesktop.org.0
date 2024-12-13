Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E912F9F0C8A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 13:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD8810E30D;
	Fri, 13 Dec 2024 12:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G01sJSyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9617D10E30D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 12:39:55 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDA3hv8012465
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 12:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9F9F/oa6KnYOh6nwKXJwdcyz5bofoAigh7/wW+YIVsE=; b=G01sJSyOMKdSWUKy
 LaCXcxmPGtWXLZkNLxN/OCa9XxxDNu7ei8eByZAdk18rLtcpxnrwU7Gd92Isvup7
 kIk+SVcD4Zf+7mUZocVQdDRDowFqcUxhM8XwKhAC6i0NpF+Jjhnwxbk+y3hEyNlm
 N8x62F31eEzjEmleNo6p69MLg8WHRounLOLeTnRKCnY9OW/G2RhPR8e7a5zsGwjp
 fpgXZ4mAAujWmyZkV+TycHu56tr9QW+I67eiu5kyEjLszvFehebxW4IoDCSL51kp
 Bmphb+AEcFvWkt6aFn3/W9WUqv07FOpaAO9FARsf3ewJ6T7tpe/plhUUm0lo0tEB
 DBw0rQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjudgepm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 12:39:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-46748e53285so3432811cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 04:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734093593; x=1734698393;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9F9F/oa6KnYOh6nwKXJwdcyz5bofoAigh7/wW+YIVsE=;
 b=TKB9trYFX+EjPiR/EcYZiazKzCShzGyuwA8PKc9iG/dHEeN1et+JLqaL6yFJJU0xmP
 Nl4ZU6tFOls4RPlBAQcg6Rf6wyqddEufLqfUPApcqeN0oXq4OVqp6Bd3EfnmkTnlyGyc
 HMuTvDWmEpjPwuAmyB+5JoW/trGfk4g2crFj5KY0a9c7lk0IffbvYf2GoZm3MHI7A2jm
 AnWRIxx+OeYn8ORvfAWboZrjarOMuUqOgxVOiUDyNZAg94MJAg13EmttBIG8divIsjqq
 XxGwkNxf5nArdHzuy4fBWjOhrJPizzN5U+FhM1KqcA56H8BwKoxWU1F0/BTv/6KdjEOv
 j5nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb0IMwT7jl0bcwutqKfMZK3Oluai1/gI/McF1u1Iu+9Jpc109A39bDgn1+R0LmdV1ymTqLEXSaqHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaWgbCISHD74+jL7Uatr0wHfIn1XuP5VGpuS5ZLtd8yg0iEgLu
 Zvk8ylAeyGpbU6gSxfRwP+28c/RzeUtCnY+7TPEuQlDlDZUzDJGtkjzP0ZGrVLLLThCcmKmSES+
 2NvTA4pK87hbom+Hcdux4Kv3galuyR/HTX7CVOof48WEhXpVNxjhIsi/LTKvARQcH1Zc=
X-Gm-Gg: ASbGncsu1K0nk99Dm7RmATAB1h/RV7je1Z01t9K5cI1LjSwTRXhyHc8eqX2WqSf0QEw
 +tC+FoOqAE0mWKLFC9vPD4VyoyneBwsUWUbXMXyjfUP2YGfiwlRZ7KFE1ATI7oVBTvhlcP8Q0+K
 GCe+D776WvWMvIKLi0wo30q57s4yARaXQpqiCVyTn69CCfTbWB5R2TQYN2swfoI+jrVx9JA8dU6
 zlUZpy37ILtbHIJQm4w2DjfB2sNIDR2qTdzXLBtRkYxwVqY1iphGRQWuwFJfKr+BYGr05xcnosH
 ZOUJ4rODAe/NSYDS4gXuyAleuSn54/qwqOX/
X-Received: by 2002:a05:620a:4410:b0:7b6:dc4f:8874 with SMTP id
 af79cd13be357-7b6fbf3d252mr140862785a.12.1734093593057; 
 Fri, 13 Dec 2024 04:39:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHizu5Ba85DKQuxdTDo+aKc1Ajo8QrAOao/BfP4OE0LSBLUvAIPd8kr45CvfnT9+hDRFnKKFg==
X-Received: by 2002:a05:620a:4410:b0:7b6:dc4f:8874 with SMTP id
 af79cd13be357-7b6fbf3d252mr140859185a.12.1734093592599; 
 Fri, 13 Dec 2024 04:39:52 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d149a49dc6sm11352497a12.31.2024.12.13.04.39.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 04:39:52 -0800 (PST)
Message-ID: <230eb99b-b223-4d5f-92f6-27edc6827cb0@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 13:39:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
To: neil.armstrong@linaro.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-5-6112f9f785ec@linaro.org>
 <31264e68-2cdc-41b2-8d84-459dc257f0f5@oss.qualcomm.com>
 <76592f0b-85f4-4c84-b45b-859d55c4e87d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <76592f0b-85f4-4c84-b45b-859d55c4e87d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jS35m0LJ55YZE4SStZ-q5dF9UGfwylLY
X-Proofpoint-ORIG-GUID: jS35m0LJ55YZE4SStZ-q5dF9UGfwylLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130089
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

On 12.12.2024 10:36 PM, Neil Armstrong wrote:
> On 12/12/2024 21:32, Konrad Dybcio wrote:
>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
>>> is in place, declare the Bus Control Modules (BCMs) and the
>>> corresponding parameters in the GPU info struct.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>> @@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>               .pwrup_reglist = &a7xx_pwrup_reglist,
>>>               .gmu_chipid = 0x7020100,
>>>               .gmu_cgc_mode = 0x00020202,
>>> +            .bcms = (const struct a6xx_bcm[]) {
>>> +                { .name = "SH0", .buswidth = 16 },
>>
>> All a7xx targets use the same BCMs with the only difference being
>> the ACV voting mask. You may want to make these non-anonymous structs.
> 
> it can be done in a second step
> 
>>
>>> +                { .name = "MC0", .buswidth = 4 },
>>> +                {
>>> +                    .name = "ACV",
>>> +                    .fixed = true,
>>> +                    .perfmode = BIT(3),
>>> +                    .perfmode_bw = 16500000,
>>
>> I think perfmode is simply supposed to be set when bw == max_bw
> 
> Not for a750

Akhil, is there any way to determine a suitable OPP for this
dynamically?

Konrad
