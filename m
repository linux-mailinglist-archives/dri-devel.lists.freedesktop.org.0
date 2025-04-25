Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B94A9C479
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6223A10E8FD;
	Fri, 25 Apr 2025 09:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bo60nUk9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98F410E8FD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:58:01 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T86I015714
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Vf/rLd4GFcJ3rfHcTZhJzseE/NW/DuE267IkH38ND9w=; b=bo60nUk9AriZpXIr
 8ljFtmcUnt1uRxZYBxGkQQlsIai1k8jsLguG+AwgraCpok0IcazIBJZjpNR0oJnG
 KvgS0pzEuAGog/4KSHfuQpdLZcO10pZC9b/uUF/Al2RV0NjruLsFzxsnbmG7Pxeu
 3PcJWrNtdoY+T5Oxq+sgEku3XYUqyme3hcVfzq+y469VFQI52PgGyM61PPtWmBkn
 WbIslN6eW1R5FoyNVOSuB1C5h3wS6fo1bXCfzeIlEE12BfWDz+t4D3cRvFV4mLTg
 1ijoB2emkUJJsQ+MaXJjDtnawqSHOjCg55JBOV420CiR2xDzhZitC5GczT/tgQcm
 5ga5zw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gjgw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:58:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e8f9c5af3dso3380976d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745575080; x=1746179880;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vf/rLd4GFcJ3rfHcTZhJzseE/NW/DuE267IkH38ND9w=;
 b=bq8paQird/IEN+WeQ5PEP553Z22CY406Pn4jhucovwac9T9Q8bdTh8nDxpr4AMgRNF
 Re+NKitDpFU1wuNKanGJNxCL6NPC3bmFC+8mzb7wkJG0NDmIl3YluooWCv5Fg7PdqJEN
 cJsTE+vMv9I1imWx4WEFaxt/nkzbBk2HsOm4biGkrpV02Lin1CzvYg5DtGaW6tG7qX4V
 JR5Sz20F1NMMVwBTfh+ybme+L7jjujMe5Oi+enjrHgwGu/Sbd2vVvy8mDnzvdf5HoJnk
 71wEfuH3dqiR6WpFyUCskAtFjOkoZ6/m4lYzOWBMPFkPBbAAm2l94GTWjZ67fZnRWVlw
 Sk8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG1tT6ZMNoJjQ7WftN9f4OZJeHseIA+dWSkId6RiXB9F/2YrAbd2rEtd9ZTdPr5VyZ762KH4lQCEA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsuUhHz2UbodEEl9kjC+NcdyL5lYaDVjja9j4MCo03Je/EvnM6
 R30h0tXIwordUNoX7WEbcu3C2xCHUvl405PG+DW1a3/czcl0nfT05IZsg5V/gMQtcY+I9nfdYd2
 NrSgydCX4ltGEFJpycL2yzbSl2V+Xl6SYRbRLaRe+lP7ELSYdF5cnEnIMAaCw5VjQHG0=
X-Gm-Gg: ASbGncsX5IWw3N6mRvc+fMpQkq8FEoY5yqtRhP09q1ugdX2mhKXef2TXuPhJRWK6VAq
 G7PvJhhXdy3Uc0b6HAmLmbYW+8pZxZu4j1ah7saQr5q34NHpPh1YgBOriFCxd8/Z7S/TuTFA9hl
 Dzpdj+7BFnr0XsToxQKUKmMrLeGBKgcsHd+7gtxXN24yTPxUYBS7U/GwQtfMGq56g57zPCS6G6u
 Whs4lUHlQMluGzXbpj0vP6LaZ6CKxkpEJiv830YnD6lnGw1JfQTwng11fDltGUYoLLEQTg6B5Sd
 A2dwzYrSoxhZExdI8eChReA1qwB7MOJO0VTSAtcmrLfRvWCGb0/b/3DdoAbapNZM
X-Received: by 2002:a05:6214:27ec:b0:6d8:ae2c:5053 with SMTP id
 6a1803df08f44-6f4cba5f634mr10002396d6.9.1745575079793; 
 Fri, 25 Apr 2025 02:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1aDrr9tIrGOVh+lPKRQPvx999AwcL22qiAWtArNF4QQ88HDa7YW9+wreCLFQKaTgC7b9wGQ==
X-Received: by 2002:a05:6214:27ec:b0:6d8:ae2c:5053 with SMTP id
 6a1803df08f44-6f4cba5f634mr10001956d6.9.1745575079389; 
 Fri, 25 Apr 2025 02:57:59 -0700 (PDT)
Received: from [192.168.65.5] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f7016f5342sm1032645a12.35.2025.04.25.02.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 02:57:58 -0700 (PDT)
Message-ID: <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 11:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
To: barnabas.czeman@mainlining.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, Adam Skladowski
 <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
 <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
 <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <790a0b7537e0b82b70bc4b32612ecee6@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MiBTYWx0ZWRfX6LHCU5293IN4
 Y/lYOoEkupMGaZRZ3gQlcr0D/JuZain6KcSDXNZ5FXzj8OoK6GsgOTuV4faC2XWMIKxpVjO9DY7
 WhXEEGD54YiS1WujXrRGarwl4B5j4gTwilw4BlGfPQbzQ8/zg/W9swt1fgDC1PIlWI+JgMLDQ1V
 +kM0IqVlhCLzaXf5HxV1VG6z7YhTl3MPGooP+JVbSyYnza4aniaxEhsVBsFvPiQBf1XOVeC+Zwi
 l/zPt/lsLDfO0psckmOvwf2kwq6T9FWeh8vLUZM3b5jg4awhbkFXYR6LMAxzfw53BT5AO0O1oR1
 tMwqH8jszDTe0KbWA1Vp9vMU0hTonqYNkuknvglZpm1LjEQRwMJeaDmLT66xGJXqWDv1m2rvP0q
 otMUTpBLt8p0OO7ZjbEvjBUBrqkSc6pfFNHUN9G8M+Uyh8YDGBq+dK8K8Oq4X+0k0ROEQtW1
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680b5ca9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=OuZLqq7tAAAA:8 a=bBqXziUQAAAA:8
 a=x_pH4qmy28IV03WXGqsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=AKGiAy9iJ-JzxKVHQNES:22
 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: ytwIa5cedCFMyodMNPrW9vll_HplJGtL
X-Proofpoint-GUID: ytwIa5cedCFMyodMNPrW9vll_HplJGtL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250072
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

On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-23 16:03, Konrad Dybcio wrote:
>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>> From: Dang Huynh <danct12@riseup.net>
>>>
>>> Add initial support for MSM8937 SoC.
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---

[...]

>>> +            gpu_opp_table: opp-table {
>>> +                compatible = "operating-points-v2";
>>> +
>>> +                opp-19200000 {
>>> +                    opp-hz = /bits/ 64 <19200000>;
>>> +                    opp-supported-hw = <0xff>;
>>
>> The comment from the previous revision still stands
> If i remove opp-supported-hw i will got -22 EINVAL messages and the opp will be not fine.

Right, I have a series pending to improve this situation a bit..

In the meantime, you should be able to define the nvmem cell and
fill in meaningful values for this platform

Konrad
