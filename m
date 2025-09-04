Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64994B43B60
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 14:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37F010E9F4;
	Thu,  4 Sep 2025 12:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lF7F4rPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2790710E9F4
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 12:20:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7qb032158
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 12:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5K9lLVQuDJ+jtHy71mkQmBdSNzf+tzhKMiiJck53fBU=; b=lF7F4rPWrOffjepL
 rsGbLMBcrr/o0u1vA79M2CB/+mfH5wIj83TWwnJh+F+QRnx3WlwOJGXmt9JB1Zkd
 2P0xkeVRT2bFXFmBFSZKTH/UYUJUyn4x+bOy/okVY6d17h5B0U06b2zJC8zA37uA
 UBNmqU84QUn7dS6Bxqo0Gf8grPibg8Qt6jBVhF+gx7y1LLByeFw6AMM2BECys6zA
 TeJAqx3wbGlenM4lv4pmV8mWVWjT0CArCYPUy73HXYM1jiM9QjdbLWZnQW2bccaT
 bOFOk/lOnxPTxp6ipcWk1m3AWB10fildxvoYY14Q+N2zlJbD8v4AoACNSLqIR64Y
 EPePRA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpfje1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 12:20:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b3037bd983so4337771cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 05:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756988423; x=1757593223;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5K9lLVQuDJ+jtHy71mkQmBdSNzf+tzhKMiiJck53fBU=;
 b=AT0kuinJ3Kta+Yp5eQ7qcDSxxD2RCGYoft/J8Jqi1204gws2/X2NG02JCWQaGC4AEM
 BnJ1cKdWxULWDzp1l7EY39+xng91K2dGYNQeDFGuLb4RKD3l4mKODqyHI3liHNvmXdkc
 HxtcMBSilYZAd3MtIODt1ob7jFdqHkkW49iu5rKrib26B1DVXeDZZ8bWFhRLWh3hLJXE
 KkX+ZEULG3+rOWGDO922Oe5Alo0q7vYQiy491Hrs6RbLxUoUIxrsATEeWgXHaIVOCyUH
 8uUBaVp3wuLENoxsYuZHmFXWbODjhFvvCogASUH+ML3pk5Bh0k259v0aSZZq5KpOSeCZ
 ouaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMS7mu74YGk90H/lNGKO6MrC7zN85FCV2B4t7hg2SfCxQ9X4vXoM28qELbJTggms8sUcncnsfbYfg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzOG206PpJAmG049i8KSR9wTlTY6yF0/jmDqKgI/Dtu1RZJhfu
 oJHfgQARhbM3bnaClAK90C75Th6fZ7Jdya9pjPGADRkIF0841OlwiKRW1vUOKmtjmUh0+wvSMzc
 1UTatv2JXMMPcgm9FrEIlPoHgXu7+yey71K902suK6cZEF5irzHuGQD4RgSzkVGTfcnaU0v0=
X-Gm-Gg: ASbGncuv0Xbc9rSKHpHyoVA8HM4aIlwQ8juB58sAWSsF/SMmdjFs7ry9qHgsTcMFsNC
 /002JxUvRD5+dMghyGg2NgT61e/Yq38S8zwqPygCioTcxxNg5BYIWD+u+v1VjFfFtVRu6Ko4T+b
 OQSJKEXTOyxpILAb1EdVtfNaXA0q/EKaEPRGxi3v6zD7rj6TbZwQlu6EH0bBn/TZWGJfyDIJrnZ
 awPb7ErtBMr+fOtJzxFmilB4dr+6VsHewnZSYQx0su+o1zuwtQ9CIds/RZVJm3N61E9G7Ww8hdo
 NniiGrO2ptdRHN1l7MahPopXYLTMF0s1BrjwH3VshRcsyXpT6kK+dabJoUyf6Nylt9iEh8C+S/N
 X2+n7iLC2zkCbcUDRwJRqFA==
X-Received: by 2002:a05:622a:148:b0:4b5:dfdc:1f0c with SMTP id
 d75a77b69052e-4b5dfdc2c5amr6767281cf.12.1756988423071; 
 Thu, 04 Sep 2025 05:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq92zIM2PJ5tnKQijo/OGWPykJlP80988PfhS9zLD8jSYpTvRaC1PomVJTiMQsaS8+adW20A==
X-Received: by 2002:a05:622a:148:b0:4b5:dfdc:1f0c with SMTP id
 d75a77b69052e-4b5dfdc2c5amr6766811cf.12.1756988422416; 
 Thu, 04 Sep 2025 05:20:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0413ee67a3sm1164960266b.24.2025.09.04.05.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 05:20:21 -0700 (PDT)
Message-ID: <95b40735-367d-4702-b2e6-01c9c5604e5e@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/7] arm64: dts: qcom: Add initial support for MSM8937
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Robert Marko <robimarko@gmail.com>, Adam Skladowski
 <a_skl39@protonmail.com>, Sireesh Kodali <sireeshkodali@protonmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Dang Huynh <danct12@riseup.net>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
 <20250903-msm8937-v9-5-a097c91c5801@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250903-msm8937-v9-5-a097c91c5801@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _GnUxC8BWN9jySWvSJ0dZ6B6KuOLsR6y
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b98408 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=bBqXziUQAAAA:8 a=EUspDBNiAAAA:8
 a=OuZLqq7tAAAA:8 a=9HHfay7fNgEZ8udxRwkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: _GnUxC8BWN9jySWvSJ0dZ6B6KuOLsR6y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX6yWJOrk1J2Ki
 0n+VFmlL2+rJwrtth37A2wPT3/y75Ie0OZXtll9Ot01QYPT55hAIEaSez8oRYSgEUvEpEMTUxY5
 wA4shUEEwvnzE0fAZ0R+EqBpWmntl+5zxWygt+vM9xaGk5dV46YpPYSC6bycXwfaJApTauSfUJ/
 OWDF0j6oN6EThGvXYNWzZjPPMg1bQhIxHBacdxwlxaf3935TOnjFVlUqIryMyI+t9xUkIuwDm7q
 +JiB2llmhmFGQ5qEtn34i24EE2m4n7LIxAuGpSGdhwXD0XRvLsMPEQcuVBxqE4M7bliKMdfJL+7
 JUt8GW3gSM8oD1m3wcai9a1Pf0Wrj/T8tu2HiioMNLSq0Ox/YMKz6U12fgoXgpt1hs6k/fCjGqB
 u+B4AZcw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001
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

On 9/3/25 11:08 PM, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

If the bindings checker is happy, I'm generally happy as well

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
