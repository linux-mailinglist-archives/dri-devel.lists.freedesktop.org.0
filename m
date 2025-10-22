Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A130BFB950
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 13:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24C310E757;
	Wed, 22 Oct 2025 11:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHRMhbOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EBD10E758
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:16:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M9SG0H020413
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2/XKwr4n4TC+ITwBrL2OP0RDLGxOxAW/3WtJ2aFNP9o=; b=RHRMhbOxHPMQOxKJ
 0bC5I2cBeDk3Q/JzcE/rDJ2OcrA+AFH5rjuOiFPotYhxJzUX4UBKkPgxTKCsG5mE
 6EasLvQxRsV/HistJlTJw5CqLGVmAe0zsRcgHgeQgDWGj6fNrxEX4eZ/ekmfJXla
 L3zRHLZILCndOWCHF4nbhNObm4zyzt3kAf8yzaXWVpCZwBD2UkcyajdYKwC/UEgy
 xWhPc8drdVA5nEunzehj4S/YwjcOb4gh43QiDqq14MZd73k/HSPF/nSjd2MAMuCj
 TMmh8VVjWXfRRA04QWiGv+HQylTuuPue6lmorNQM7O1Fu2h8mkJvkJFX126aQwh7
 ZhDdpQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3444dqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 11:16:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-87df3a8cab8so4285916d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 04:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761131796; x=1761736596;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/XKwr4n4TC+ITwBrL2OP0RDLGxOxAW/3WtJ2aFNP9o=;
 b=Ml7scWxOAamnlHh+UPUfV6Q5kn8IvZbufdQKKDg9xe3AOqfsdbPWjFS4DAbRT0qnZI
 0t8Y73Y17K0/nSl1dNJCeU7pfcs/ZFmx6l9n8ePY4s1oPM3GV3s+b3raTgepRo5kquYV
 RpHLita2u3QlMkpc60u0ued7EJFx/as4ktpwPfsG3mjJLp0MTldycKOWKAqv4XL5Hcuh
 Fc0wTYAdF3pqUfeMMKH4vCagaGTUDPvGg/KBVyjrA6dhXod/pJRKDkkWX+fkHmGkD5q5
 kTkPtvwxJN+yRy9CGbyRHDzvalaRift1PAuTRVpxFIF0MkqfiVtqEcnbY7JgI2F8d7ar
 V2OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7EylQcCDzSHH34Gyhaw53Sn1MiTNVF42hfSLOI4qrzJ3YSLEcIVhxjp2w6emgKj2wagz21i8oWNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0V70A7JAU6CktbWxO2zuiwwBuOoTx+BMO4zzcCQR6CcmDdNDf
 e6zIgfuefz+2ezCrI5zYW9zdo6VZUP3l5bYHyuuvajMhq0I8J980fdwcPGukmGTmuPhcGZ3dOb6
 rOhmQytRGr7CnwZ4h24/ZjZra1araJcgEXu1VvpWadSefzHkSibjrKb5Y6q3EqAr+80N5Afs=
X-Gm-Gg: ASbGncu9+VxI6AkXfW5bi5KmrDsUgstqsDLlQ+Khk3+SWnYKakPddDsHrCSGv+Y8ycV
 0Pc565kwQ4RbtQlY1TvXb3IhPphNFeN56dq537Hbql2EfE9eueB6xTZe4kGFNfkWw2UZ4HjLVCI
 QsXBVoEZG4hCSkW+nBJJMiEQFQN/aqEGU6SKK70O+Qq8l0NVixIn5I28hUavKoWADBnxF1yF0rg
 HIBdSwwFRBwz9h7WQwgTEnMzdoCydd6k+/BxEqshhT/17L4XIEs+xF5e6IASeaFlXH4vBuysAp0
 SW7bfG9pfc4MM6W9zSnSyuXKIRz538vomKX4l5EZ7JVAT6fiiu8xivEg/z/0hiEz4MgAek32dIF
 gq7fnhLAdTUi1edEPtQgmcdRjzvHC0hmEfrOKsw/RWj9uqKdaP72vYYWu
X-Received: by 2002:ac8:7c4e:0:b0:4b2:b591:4602 with SMTP id
 d75a77b69052e-4ea117a5b7fmr52762741cf.9.1761131795786; 
 Wed, 22 Oct 2025 04:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeA3+PEnZOUseZLDtXfAVmeVdOnmr0b8PKWtvHThf68jn90VUbNoN9ykrr/MODPrJ/wV25QA==
X-Received: by 2002:ac8:7c4e:0:b0:4b2:b591:4602 with SMTP id
 d75a77b69052e-4ea117a5b7fmr52762431cf.9.1761131795294; 
 Wed, 22 Oct 2025 04:16:35 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65eb725f3fsm1315242266b.68.2025.10.22.04.16.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 04:16:34 -0700 (PDT)
Message-ID: <349b031b-7e2c-479d-92ed-52b7ae0d15bb@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 13:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm/msm: Add display support for Glymur platform
To: Abel Vesa <abel.vesa@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251020-astonishing-zebra-of-respect-1c2eca@kuoka>
 <d6ivp57mh77gxybjvvwpmqoc5fsy52yydtvs23bepwdxgkxhzj@ahryeick6yaw>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d6ivp57mh77gxybjvvwpmqoc5fsy52yydtvs23bepwdxgkxhzj@ahryeick6yaw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 58oXMs7AW_FUBCN2itXV46mADYj3ix0n
X-Proofpoint-ORIG-GUID: 58oXMs7AW_FUBCN2itXV46mADYj3ix0n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX31DRLLcY/bxT
 xt+J+kHhSnkAELFtSQb/xI/hLhrmUIzZpPckFsN6GHE0gQOQEgoGJHs+xxpE0ZILmLXn3gnCTcy
 SIlfcyOGpE1icyavFvoshaSwOaknAVQWv+VgyYa3St/DKZmNWgaBVyGs1Cql25bd7tJce6lP9KW
 CxMEBIzFpd6M05hkc1u6EH8M4HNC6VGSXkIEdCwbTiNYIeYdnEcv3BhXAUCuk0S2198wceqC6Yz
 +Ul84mvGnkVEdMnIuuj3skTBAhhU3PXQ61l7gMC6JyqZL1i8js5Y/uPs4MwpmmQnLmIsE+vhbLh
 gGOBmHBnjA27OrnUAFWvzkUbe7pR2t4nmS+7ho4JxHn3phmzWMT1Oc4GhmT+Xd9yYjgOkLePtI8
 kKxuT7oGA6WqASJJsD2/LsVn/N43BA==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f8bd15 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=3ACIv-cKCvEmzLgNCBYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023
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

On 10/22/25 12:51 PM, Abel Vesa wrote:
> On 25-10-20 12:40:24, Krzysztof Kozlowski wrote:
>> On Tue, Oct 14, 2025 at 03:38:25PM +0300, Abel Vesa wrote:
>>> The Glymur MDSS is based on the one found in SM8750, with 2 minor number
>>> version bump. Differences are mostly in the DPU IP blocks numbers.
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>> Changes in v2:
>>>  - Picked-up Krzysztof's and Dmitry's R-b tags.
>>>  - Fixed the bindings check reported by Rob.
>>>  - Fixed indentation reported by Krzysztof.
>>>  - Re-worded the commits to better explain the incompatibility
>>>    with previous platforms.
>>>  - Add the UBWC config patch, as suggested by Dmitry.
>>
>> Where are lore links? b4 provides them automatically.
>>
> 
> This patchset was enrolled with b4 due to logistical reasons
> which lead to losing initial kernel tree.
> 
> I thought the b4 prep -e should be the one to use in this case,
> but now I realized that has a different purpose. My bad.

b4 prep -e base_commit has always worked for me

git config alias.last 'describe --abbrev=0'

-> b4 prep -e $(git last)

really handy

Konrad
