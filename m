Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD51DC3F081
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 09:52:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A97D10EA43;
	Fri,  7 Nov 2025 08:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGoLrxx3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UdQHSC03";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF00610EA40
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 08:52:22 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A78NDhh3749162
 for <dri-devel@lists.freedesktop.org>; Fri, 7 Nov 2025 08:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WUI8aI9SboATxAMC3sIcJDvYj3bfuIckkF3N8VBA0fI=; b=eGoLrxx35ZUoDT9Z
 ojzyFKD3egXl3TYbOqb4VCjB3J5rna4/qatWTyyJvhBZdNYwu49xzA3H7IGfRU99
 4Au1rMkZyH6V3+gsUEUs/IgdbIkefAOznBM0eWlB9voKiDQSwHf2opkxtWtEAIy6
 5i70dPmGLLoeGLNn5IhsGllk4R0VvcxNoy2uvUd8HsyqcLButSzbnQsJwFUM3Yno
 Gkc2SIl+Q5chgk8GapalxY1FAKiaz0jovH8UsGCbIj6lP0cEZPFcRsiI4lYq3dUr
 XZcLK/GzFg1hjwaasZiLLTe3gwS4oluiLNmxTrNSHXkwpLLxFPYUzvj/agFM7mrb
 LokUKQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8sy6kkpj-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 08:52:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4e8a35e1923so1641011cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 00:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762505540; x=1763110340;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WUI8aI9SboATxAMC3sIcJDvYj3bfuIckkF3N8VBA0fI=;
 b=UdQHSC03NhnqcJkun12LKEQYxggipUytGaslmR9GwERGK3xkAb9VCJgNrwlZpreODB
 gLBW2k7p6gvwwXaflwG5kePAgk9ksUXB5EmZdOpEW2ZOeCfvfShicBtwd1RatgCR4HoZ
 +yQn/Pk88tZsdwveiieG/D1i0GvI/bQzCiQTebnkEjNqdge7iZJUiabSw8Zkwhd8bKPZ
 worvmp0OvqH/n+dNik4Y3fcqwqf9yNZk3sHBOBoTGvjIQZIZKp5Iy0kQHrduLzPqqi47
 L1pA68g6yfrEfugEOLM9CXiO/+IlivxUYzUR6k4pvZuLicayD4aGDc7mOTucqP7yNWO0
 rYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762505540; x=1763110340;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WUI8aI9SboATxAMC3sIcJDvYj3bfuIckkF3N8VBA0fI=;
 b=Lg1oPLMln++RrEU4ZSwjssxIyVh7ZwRpRvRIivY1hVffA5tJjwTiGpzEb3c52ScPKA
 xLM5MgGI4vShjB5mMqWQCoLPglHGylirqLONGXJqU39fjJzOne0K4SopUJFNZ2tjqQMU
 F6Il0hafA0ecVIsKb9Re0fI9opz1p/9t2xRDckvywmwMHHfmqJkX58tyughkuanS4zMS
 yEB1Oc2c0If7bn86JETSroX0TmTdsKsH0FpmLj2pbabgBaUSQ0TwoaXPDE3NF02dxT4X
 9oeN/CE6El4qAUnHTxcumLVJbvLWuzPNY7bun2s4xtxHM18BskOi2ngUAEGaVxasutfy
 zJZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBo/PECsWLZNFEyJmGmqDeyXhcdjltcA1wT7cO8pTy4mDO4xQLZOIf0Axy1/j4NWC1Vk/9Y3D9i18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXx79WzOYGSXqaB6gKKDqM9SBtOJ4YP/tBk3Xi9PCG8sylL/jE
 ZG7ZK8nU1zyY25fi3bol7JKj59Esba7Ry+5PaHMr7Bs/XS3Nlj1HY9sphF1O+2jnaxQuAbIAsvz
 tA9xpClVpH5rEOSWFFCZ071Ty3QQadGMvfChUadsalUz9wdZJd5pEQz9YCTdWw/+EBCUlXn8=
X-Gm-Gg: ASbGnctblDgWxO35jE/qGaCnbx/ChR6K2xOIArn4JmvoqcWdiPFTqHxcPCVxHDeGrkf
 R7rp+nTFC1DPbPchIiNdOQRml61BR+BE5qFrFstdrf2rDUSJarCCLtbEtUh0WfDncCC5a76Rmp4
 RfVAQOOeg+U3B5ZHB4Wfuug3PFLMCNex9QzdVPSOXbt3nXs+nq/XoqbIZF7iAHxpEqp0bq3kXkC
 107dE7NNQvADpZLpcxQbGRN2EQYN47h+fEqAZmXwEiqaKU6RA/884Eg6akYj0+hZaz0UGR6E0Rq
 orQGFTnWuds5e0yOUd5fKIeVH+g/jdO8My0+QFK/Hq0GJsKQLKRmhtgdHDi5OIalJqbkJ5oxhn+
 weLyOE9MXJvGe1Cx2XpqH/drR99x9soX2rpHMLRIO9mTvyTHl3XJCPCIE
X-Received: by 2002:a05:622a:24e:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4ed949f2c3fmr17320091cf.7.1762505540427; 
 Fri, 07 Nov 2025 00:52:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3kG67QsZQNvhXXJLPvhwblVTCY2za9wLcF0KdPzPtUN0EkUbjgVeOtcVYxRajcJ/PwybTKQ==
X-Received: by 2002:a05:622a:24e:b0:4e8:a001:226d with SMTP id
 d75a77b69052e-4ed949f2c3fmr17319881cf.7.1762505539996; 
 Fri, 07 Nov 2025 00:52:19 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf9bd741sm177667766b.57.2025.11.07.00.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 00:52:19 -0800 (PST)
Message-ID: <83cafa2f-8fc3-4506-8987-1b5e10d8eff6@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 09:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Support for Adreno 612 GPU - Respin
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>, Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AYu83nXG c=1 sm=1 tr=0 ts=690db345 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=glulLz7CSyDjeoE76BMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA3MCBTYWx0ZWRfX4f/RBYtzXS5a
 Wt6t08WEsCor9HkktUP7AD6GAnKVCC4z6XVhryfNCzcfIrB5QhOt/S2pDBT73GsR+0pMo1Juzrr
 C7fqM2DjPpv3PYh6bqcW6c1qyxx+cQuWSRVAkbL85CERAqtz5AnM0/emM+8Zuk8yK6Uwng9We2d
 2kTP0eG9eLDPFEbjcezMACUJhZZTn4rsnIjiEvVXabR3xqdZ+HGNUNeiUKI1MH5UVwFHRK0nsr/
 WOY6g8zSSGQBE64YzT5Wf+onLfUGDcW93tc5B0YQHJgJjX2z5h6bwYr73UPdAhcCrMePGBwXdwM
 HI97/Wz1yWul8I7QtW/5VPG1hMnkH0CpE6NiHC5jPtmaSOPEC2/jtOmDVge7dgXvpkNq8WqP+FP
 GQBUTDG+VdG7g/xoowjq9V3jG7U6mA==
X-Proofpoint-ORIG-GUID: xiV4psW0bLUVRaBbTCZZNeF9JD7uA-gb
X-Proofpoint-GUID: xiV4psW0bLUVRaBbTCZZNeF9JD7uA-gb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070070
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

On 11/6/25 9:50 PM, Akhil P Oommen wrote:
> This is a respin of an old series [1] that aimed to add support for
> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
> have consolidated the previously separate series for DT and driver
> support, along with some significant rework.

[...]

> Changes in v2:
> - Rebased on next-20251105
> - Fix hwcg configuration (Dan)
> - Reuse a few gmu-wrapper routines (Konrad)
> - Split out rgmu dt schema (Krzysztof/Dmitry)
> - Fixes for GPU dt binding doc (Krzysztof)
> - Removed VDD_CX from rgmu dt node. Will post a separate series to
> address the gpucc changes (Konrad)
> - Fix the reg range size for adreno smmu node and reorder the properties (Konrad)

The size stayed the same

Konrad
