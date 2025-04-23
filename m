Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7577AA98C40
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 16:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6577B10E6B6;
	Wed, 23 Apr 2025 14:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqLJFhRC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8716D10E6B6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:04:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAM7VW007642
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HK4v2UxJbR5fXrAk1G29VWPj/UWIHaIHZOcZYqRxF9s=; b=gqLJFhRCUndtiYt7
 7nVFud9l/0MH6QpvE/kIW4J63tMdeelEMdTC1IAEuFA5K8jVzh0/d2qRdrDKK0pn
 GZ33/RXPMfhZ4ODI8LwwhwIjrHfe0CCVJ9oGBukOxpkpnVOdAvlmpDk6pQ9Yr6Sd
 sGmrczDi829QgGOBpgyZcaaTXhafCwhyZ5ukT4NVV2sYiNrr/zgOGkk/+us2b4qe
 PQ0B8HH0A/1PTId4jL0cQbCi2yPTJVav6wv3gPj9Mryc4kD+5qj9DW91th1v8CHe
 sqcBZzwfinKADXufKObWXY4eajJl+7rEEMVrYwYjd4EyLomAZtuIXhSz+/e8iXwP
 1ecJ8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5abjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 14:04:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c54be4b03aso108391585a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 07:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745417043; x=1746021843;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HK4v2UxJbR5fXrAk1G29VWPj/UWIHaIHZOcZYqRxF9s=;
 b=CeDoDU/Ltxt4gyVYZ5fOIYgkwjCD9z2ELqg+gNGLdgO+qTjVGNl/vvDMctZwKXu3O7
 UA8cfbiz5338W00PGzcxh84Nkz6ocn82+ZwVJ4uy+m5EBSnQMzzTuSZZgraGr698S0Rz
 4o0ScBgQPtJnTOgLuKNm7vH+RrLTcdSYN9v6isuFrD/6lgAl7cp+NxMAGcpqRNrfjhVx
 pfTJjzXe5gMLI9TjVkcOzU11pRXRvPpoigAeJr1UZggJ+AwQMg+AUBVBd/Un13cN0Ui2
 m33HUk/JEi7PL59ACpheXikhsUzSLKEQCNZfPXvybrP0/A8S6knGrDroXfst7GF2J819
 qffQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKrIXmfzOXdENmhyank0KuQTasso1nRUmJhsf7pmXdrMbI1AktCY0oRVRk+MzafNsJo1/CmKJSMLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcF8ObTZWEiULrBsAVOc0b5ZLuMJrlXO1VNA1w792VFxSgWBbu
 jKTo6tubY5EWwZ3vlvzmcPKCSWZwF/FBKtvKNBnLF+yBmGNqBpLlS0hi33/Uv0+TLqL7UJ+oec4
 z96r9lPKsdLNTJmd7e652BPyQ3Vl0AMSMdH2h2Af2jId9kZYV9xwXBT1b7YQE4afgWeQ=
X-Gm-Gg: ASbGnctHbZpUCKdDENDweWyIOokJ545j/c8e/je0gJSEIq+8PsVyDimKiwtqGHyWRqu
 +08u37Fhf7QershS/+V6TWONHwOyCXq6cPE2izMpw1Ykvw+Xwc/UYHZt+i3yu4izo9ZWThHTK4J
 6X82YtxcnAe7nuiwVnRq8s/TiyjFTI/knj52YBZr/AGcjjhTVpIkJWhXoxF0WdEUj17fSTSZesQ
 T7SHSV3TJZjGd1wC0Ny3QfAqDhmH/0evSjl1FKQfZH4t5iHVCKC3aaR5eHjox2swOZI9Kv/q+xY
 QnM7saVqmh1uJFeXnc/zL/eVayrhXiiUPOddDYR02LT6VdsjwDmZALSbQlrlk4FcBxA=
X-Received: by 2002:a05:620a:40c4:b0:7c3:bae4:2339 with SMTP id
 af79cd13be357-7c928038e5emr1063391985a.11.1745417043387; 
 Wed, 23 Apr 2025 07:04:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5Nmp61dxe3+g8XquReGtc6SZo2EBLqOi9MgrQLq0RCvHH8eZt76lUCj3q3b5DnYlZ2FEF3g==
X-Received: by 2002:a05:620a:40c4:b0:7c3:bae4:2339 with SMTP id
 af79cd13be357-7c928038e5emr1063386885a.11.1745417042771; 
 Wed, 23 Apr 2025 07:04:02 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec4d397sm808450266b.59.2025.04.23.07.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 07:04:02 -0700 (PDT)
Message-ID: <2e3d94a4-d9e1-429e-9f65-d004c80180e5@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: Add initial support for MSM8937
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
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250421-msm8937-v5-0-bf9879ef14d9@mainlining.org>
 <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250421-msm8937-v5-3-bf9879ef14d9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5OCBTYWx0ZWRfX+6oN+J91cCmI
 znuBguep2bS8mdvVmwbE6ULo15/P8S0cK+bP0Y8im/4IwI0CU2b/4PbUmh5UpwGPhrzLRhQ0jye
 9vqW3WtbY52CI6sGOMbEeVX+2Yih086P5lPejbdyUjhcMCNeQhVNrbAc9esJXsABHh7TdRXH4HV
 jHBgE4hrhLKoxLoaRw5HmP0z5HU5NsI7WoLsha4gnZ1VZxXppFt/4ho7trgMpOo7hdBZtXRWYya
 XJ3L3BqqLjY4yh3p4Q/PHqvCFKonWiKfUxN8+2TiSGGo17eUxvNZw0qqv/0XqCZCFQuq2Yztqyz
 ZD/8WkdXcSFqR3bT38fD+dATYtZwilB3ZElk0gJmdvYJ3TGEGrH1TVfvPp3qL18yLDiejHJHF3f
 iDW7czG5dHRO3AIeJ0fVo/OmO0s2qRiG1KUBzcDFh46R2joBs239rJk+jTAPd0Q+dVQxkT0H
X-Proofpoint-GUID: bCKOFLaqm2stiKIUeLxMRHY2r1dSywp3
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6808f354 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8
 a=GsLbDo3STCR25-WXoqoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=BjKv_IHbNJvPKzgot4uq:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: bCKOFLaqm2stiKIUeLxMRHY2r1dSywp3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230098
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

On 4/21/25 10:18 PM, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +			tsens_base1: base1@1d8 {
> +				reg = <0x1d8 1>;

The size part should be hex too

[...]

> +				wcss-wlan2-pins {
> +					pins = "gpio76";
> +					function = "wcss_wlan2";
> +					drive-strength = <6>;
> +					bias-pull-up;
> +
> +				};
> +
> +			};

random newline /\

[...]

> +		mdss: display-subsystem@1a00000 {
> +			compatible = "qcom,mdss";
> +			reg = <0x01a00000 0x1000>,
> +			      <0x01ab0000 0x1040>;

The latter region is 0x3000-long

> +			reg-names = "mdss_phys", "vbif_phys";

Please make reg-names a vertical list too

[...]


> +		gpu: gpu@1c00000 {
> +			compatible = "qcom,adreno-505.0", "qcom,adreno";
> +			reg = <0x1c00000 0x40000>;

Please pad the address part to 8 hex digits

[...]

> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-19200000 {
> +					opp-hz = /bits/ 64 <19200000>;
> +					opp-supported-hw = <0xff>;

The comment from the previous revision still stands

Konrad
