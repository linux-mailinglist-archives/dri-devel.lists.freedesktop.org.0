Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C160A9C2BB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2BB10E8DC;
	Fri, 25 Apr 2025 09:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VK31//24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6740210E314
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:05:22 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TGef016184
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eBp/Sktf2CJhOpU3vnuL93wkEwguX+kdhkqReJ8UHEc=; b=VK31//24CTcu+YHy
 G2FqZiJIRqkAdrUZPK5ArXf1xd7AQWXw9b01MdWhNno4vzJf4o8zgARCjj1is6YN
 E0yQGAqF8VgD3E6Ejpb9Gg8Yi/96NdN2VSSGwBnxnFb01+3we8eIXzP5iftLyCXZ
 jVB9nRrgBuxQAIQ9qXrV2ZXbRhsBmt0hdL5pe/Zvi9FYITOoddNU2gQjJ6pUFdu0
 gJxYi8hZg0JiIwJma4DSo7opZPvLDDgG6PzFxmx5c61pw7xDh1lvivniIxRgVHEN
 JyLRIkbp4PdxYRq0REb/w8XJ52nFHvNBDp4C13kHg8XtUXbJcmySDiovK+lMdIIq
 mtHkQg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh08e9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:05:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-476783cbdb8so4751161cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:05:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745571919; x=1746176719;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eBp/Sktf2CJhOpU3vnuL93wkEwguX+kdhkqReJ8UHEc=;
 b=P3GA5ruaxssTcqwxkp/PbVtZdMW3zE/uvzdNTJjORrehAyPtCVddbzU8MY86ubU3YP
 fBeNrDz2c0BV47i7+lK0XuqSis6o38rdmbmr3gfxgl4Uh9ZLauzFypyFNH882UvWyyIa
 qm7Sn3ZK13MCvZAXbz0rIt81UXtjUpU0NabF9iFVAtkcArSgt1zelTq+yQxue9CVQaoG
 IDCWKsh+zn9r/cN+pfARovxoa5wsoa2GhbY3ng4wLCRddXpGpYcFiqVfsob41UWMV3kX
 1JxTezNsPhHs1SOyrRj4ZIn+lKwqxEWy1Hi6sE2Ih/93zqZcuMDnOgCDC4uMY7sBtkS5
 y5Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcfkokkqDvLFpTuyWOTDZ0cK93l4+K2pH7ynifsfLqL0ihvNwAScpxqnoez7TypnsNAV0lw4Q5tl4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoNnccCdvz3Tg5Gqc6pLqnb9ORTErYjvH05NbOoShZ94T2moBc
 s+hyRtyLvyPXelIrgWjQGXk5rB5Fcqnj3f9OJ3buKZUKYgp71iYymiT/hcwMEW2HwEpKA9C4LvH
 YviXBM89xs4w2ma4CBsKgq3/ZRzA8qSHIYZ9JeiiuCHk7Yq9Dnjt/nA4Nq4MFKDSa6+A=
X-Gm-Gg: ASbGncsuZBCpo3Pohes65wWjGwiH9yVGHZ206uEI1dcaWwa9j0X0lQpIRm+t1eDfVS5
 uUDbFfUj39iNXXHEMdynQZzmGAW0UvHdoj6dzjm2Mnv6VAxunFrlp2f6UkniIJiZ5GuLv74hu91
 vS8uPrx6nTFIwNALMMHiYGTBaW3msJ+32mnF2uQIHuB5JjVBS1Asxx1Fj5oIG63X2tvTzPhCvzw
 MlWhbthTNE3z/XKb/kQOcR56akunLyMBf50jSvSQdJ0Ath0Qtt9X9Y1+I1VCGF07/tgArC55XxA
 zPPmch8bareQ6ABymJ4VvBmBgr1UB/xe2E7IQzoIYjxL6XSzGFuHKVuqZL04XQRU
X-Received: by 2002:a05:620a:2907:b0:7c3:e399:3289 with SMTP id
 af79cd13be357-7c9607027e7mr84155985a.4.1745571919079; 
 Fri, 25 Apr 2025 02:05:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZ4HrzculVF+OYsrWB/QeY6ey0mgBw9+RURDMEsUzYNwrj4ge+kGalkHQyVtPOx4qELkRAtg==
X-Received: by 2002:a05:620a:2907:b0:7c3:e399:3289 with SMTP id
 af79cd13be357-7c9607027e7mr84152185a.4.1745571918443; 
 Fri, 25 Apr 2025 02:05:18 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41bc41sm104938866b.24.2025.04.25.02.05.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 02:05:17 -0700 (PDT)
Message-ID: <c6cff2a7-4497-44b3-a019-60e3c6034d4f@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:05:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
 <20240709-topic-smem_speedbin-v5-1-e2146be0c96f@linaro.org>
 <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20240715200419.l47ng6efa25in6sg@hu-akhilpo-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NSBTYWx0ZWRfX4P/q7k10tCQr
 fBNpE8k7/HOWedCjWaXRRTMOl0zNCl1K2MSFvBg8w26xdeqvQuE7AlDyYsu/P9gxHa9ny0CEiKL
 nbk61zeVpBt6F+ZW/m5CxQ1FysU3BwFGvUfi6jztZbMtAEFS+t7vvJKlfB146TjfhzN8E0hNZFQ
 SsIb5oRBcWxhGRXRFchOfbLu8bEsZMdkW3tFfdc3yij0uEFTzsZgMNLl0V26/b+NdpyPHq6p2GF
 gQELfYN+1oJzWMPsOJj/E2/eDxbfT89M2b+1yrmlrPAbWVgvV0uQP+JdYceGLKr6L7zQgHE0oT3
 /757lcaWFve5VpPBskFCCeiW6mn24uxNxOOGNF4DYVicDI7FDXCZjwvHAW/Az+02yClxV+5mxwm
 Y1vA0s9L/0QmUiiMobMfdWb/9De7r3I00YViW5cvIXujMUWQRzRQ8CQ1IdNBftW1m6OvBvoy
X-Proofpoint-GUID: v0rO_4TTPeu7Jw06Vbqa-Bljox4LJBon
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680b504f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=RALOh4QmxscuBpg08HYA:9
 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: v0rO_4TTPeu7Jw06Vbqa-Bljox4LJBon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=947 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250065
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

On 7/15/24 10:04 PM, Akhil P Oommen wrote:
> On Tue, Jul 09, 2024 at 12:45:29PM +0200, Konrad Dybcio wrote:
>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>> abstracted through SMEM, instead of being directly available in a fuse.
>>
>> Add support for SMEM-based speed binning, which includes getting
>> "feature code" and "product code" from said source and parsing them
>> to form something that lets us match OPPs against.
>>
>> Due to the product code being ignored in the context of Adreno on
>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>>  
>>  int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>> @@ -1102,9 +1136,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>>  			devm_pm_opp_set_clkname(dev, "core");
>>  	}
>>  
>> -	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
>> +	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
>>  		speedbin = 0xffff;
>> -	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
>> +	adreno_gpu->speedbin = speedbin;
> 
> There are some chipsets which uses both Speedbin and Socinfo data for
> SKU detection [1]. We don't need to worry about that logic for now. But
> I am worried about mixing Speedbin and SKU_ID in the UABI with this patch.
> It will be difficult when we have to expose both to userspace.
> 
> I think we can use a separate bitfield to expose FCODE/PCODE. Currently,
> the lower 32 bit is reserved for chipid and 33-48 is reserved for speedbin,
> so I think we can use the rest of the 16 bits for SKU_ID. And within that
> 16bits, 12 bits should be sufficient for FCODE and the rest 8 bits
> reserved for future PCODE.

So I revisited this patchset and had another thought - maybe we could just
extend the speedbin bitfield to cover [63:32] and worry about filling these
higher bits in the future, when adding the platforms you mentioned?

Do we still have plans to use *both* SMEM and fuse encoding on them?

Konrad
