Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47538A9D17A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0015210E99E;
	Fri, 25 Apr 2025 19:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D4RMZY/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03C610E9B0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:26:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuGF001348
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=; b=D4RMZY/YHGrtcRQw
 lVQYHp18r3mZtZ9ZsHHzxGCjgDID+iqFkDbxU4b+CzOWpSPob5qovR9UtF2y7i04
 Q9TyAar5JYujyG1OjGF0BmcsCIL2fQb0lY2c6ingVPmIh1p1CWFFVK7UuplXnaX9
 cbAbCc1ysortnRatYOjDgV4WedQXvO4/8SVgtuaviiWgw+VYspu3a7MYpDky3jKG
 MubdZPAed2QbA/CzjjVmfbfKOfTHHL75UC+ZznfpyoYZqoNunvuf8rJIezSTMtqB
 ke0u5kwSASdhQK7+3c2IforuyCKPF35xaWS7UECVzKKBxIliPe9HkLjWMHOLdsU1
 wFD1sA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j49w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:26:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-47983a580dbso5994081cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745609170; x=1746213970;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x60z15u9qYTj44f9RXgg75GrQ1qzg8Z2bmf5H/QyEJQ=;
 b=OsHnlecf8uWPie5vzYv2DCAwdfwICVp+T9tb/DfYSJ6/LGdfCMkgd52Umd0iLmVd0M
 vj278DM+r4IFBqOAqfJ7/wJ/mLQVGSDZTtI0wGpT9/ApkxSnPcYomULvijqDS3gvjgF2
 e87C1gAVcOLITp1tbBqz8Rz+3L4TRc/CBp4DckswDoWTzjtRvIrp1ppctcgEermUKrFO
 VJY3ysdk5KcC9WVwaZl3Ay/ngM5H3PiPcmjz8kVVhkmk7zQHs5/4CcF8EcmfdfVD47HI
 qXclNzpSTyN1qxra2bWRtYPbMKYRYNvcGLU54HG92ofIkQMkXU9SKLJAN0p9+lwN2u5o
 TmYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXihVzYy9ZDJWBQBnwN9jGXkjrTgunKGMjZ48zhap3l8AA4LOzZC22iJLSqnOZifUT4vDvdcqLSfjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzFevCv/SFm63p0RR4MmshINliXTAOQgJByXqEAgR45Ikq7YaB
 8S6VSHvFV03j8z+GVKdDKT9NGBP2QxG0/dQbyfiZkJvjR0oaRbTSpt560pfjrGu26b5s1kOFh59
 TGDd2nhgSum7CT5CuXqDBlc0PCb9C/4s+m34/9ksCso5rFTWv/CEK5pDG58HfzQZxE5U=
X-Gm-Gg: ASbGncvhvdNFjmDjzl+Ku/lX+LGcv0paiaS0bpXGlFMgn/+lfxf7iaVgtVSjV0pFgr9
 0ocUI090luwp+8rSl1Eaj6M5ISOJHXQSme2p0MCtNabVKLQ6eJal6KUKZoLEajZGcCr3Qpe4Edu
 GiZZ3/DGfJWuXMoO5qBGUN+74roUIl7FZgvobjMIBJ3gV998nZO4L/XE+PmioTaVUNDF/FA1KRa
 hkRf4oIMU8RH1dvdyLIb99OCSgPpSiUz/W9WUI07aQeCXhhDqKUJ1EZFYASr44RsQdihvZr6bOK
 OmT0ZItXfkmJd29l5Nyrj8zWT6nllCTclD7QCiittJ58AOYrplZo11DTqzJY+KIu7Bg=
X-Received: by 2002:ac8:5f94:0:b0:474:f9a1:ffb8 with SMTP id
 d75a77b69052e-4801e0172e5mr21297911cf.10.1745609169934; 
 Fri, 25 Apr 2025 12:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq2r9L2pHOoYHGaxcw9IGqNIifgrl5bAlz4s9wksJ/7yXxAXtbVK+GxNShhVnzb9jvGPXJzw==
X-Received: by 2002:ac8:5f94:0:b0:474:f9a1:ffb8 with SMTP id
 d75a77b69052e-4801e0172e5mr21297581cf.10.1745609169507; 
 Fri, 25 Apr 2025 12:26:09 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf7397sm180940066b.92.2025.04.25.12.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 12:26:08 -0700 (PDT)
Message-ID: <68e2c0ee-d5e2-40fd-9ca0-262ed3270628@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:26:04 +0200
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
 <70635d75-03f9-49ea-8098-57cb144fda94@oss.qualcomm.com>
 <5ccb39f9393b44761127717096a38a46@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5ccb39f9393b44761127717096a38a46@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzOSBTYWx0ZWRfX/7TdrxrSDtlu
 JlUS4RA7vkt24kLy0gUzsutx2aGOS/RZdwgTYKQAB1SXReGI8cUwJX6tCqDOvDb8ipxGazZjS31
 UyrPutfdc7FQJQ96WU6uMWAQUmKVJNEi8h1Z+52pJqPqufciFmcYlEfOOX9nlyaUpzbC8onSLOW
 xmqEsSLlNQXXNWyJbNayl67P6GP78/v+nzVjMpL3JhrsgmUx3m42xym4YHOpUh4H2qLhK0yV++k
 qOpM3dht7iXtsm+nksDe9RXj+lt/fXTvB9CQn9dozfrYy9uux9x9Fu7/GGvx5+vKa4mAlNi2ikx
 XdK94Zb7tDyWANcYQREB5tGZpqx4z8m2mOvI0KI618GMQu6ktA5B0r4zmebORNeGhiST3lxE1yH
 qibiFL7Fe6pwTqQ/jwY2UY4TG4D0rS9zTcLqbRrvfxfg/T9vabf0qxr87+X3t/hRG3anoPsE
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680be1d3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=OuZLqq7tAAAA:8
 a=bBqXziUQAAAA:8 a=uxr0c4oy3NFgYiDcH2kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=AKGiAy9iJ-JzxKVHQNES:22 a=BjKv_IHbNJvPKzgot4uq:22
X-Proofpoint-ORIG-GUID: a9j5qDC4YBTTWyUW1OJShasV6qAjDqJj
X-Proofpoint-GUID: a9j5qDC4YBTTWyUW1OJShasV6qAjDqJj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250139
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

On 4/25/25 5:13 PM, barnabas.czeman@mainlining.org wrote:
> On 2025-04-25 11:57, Konrad Dybcio wrote:
>> On 4/23/25 4:46 PM, barnabas.czeman@mainlining.org wrote:
>>> On 2025-04-23 16:03, Konrad Dybcio wrote:
>>>> On 4/21/25 10:18 PM, Barnabás Czémán wrote:
>>>>> From: Dang Huynh <danct12@riseup.net>
>>>>>
>>>>> Add initial support for MSM8937 SoC.
>>>>>
>>>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>>>> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>>>> ---
>>
>> [...]
>>
>>>>> +            gpu_opp_table: opp-table {
>>>>> +                compatible = "operating-points-v2";
>>>>> +
>>>>> +                opp-19200000 {
>>>>> +                    opp-hz = /bits/ 64 <19200000>;
>>>>> +                    opp-supported-hw = <0xff>;
>>>>
>>>> The comment from the previous revision still stands
>>> If i remove opp-supported-hw i will got -22 EINVAL messages and the opp will be not fine.
>>
>> Right, I have a series pending to improve this situation a bit..
>>
>> In the meantime, you should be able to define the nvmem cell and
>> fill in meaningful values for this platform
> As I wrote in the previous revision there is no nvmem for GPU on msm8937 only on msm8940.

This seems not to be the case

https://github.com/penglezos/android_kernel_xiaomi_msm8953/blob/pie/arch/arm/boot/dts/qcom/msm8937.dtsi#L2046-L2191

Konrad

