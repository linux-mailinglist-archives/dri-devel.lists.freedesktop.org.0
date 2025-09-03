Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9059B41C1C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 12:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EAD210E268;
	Wed,  3 Sep 2025 10:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJW8bpRz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8525C10E25E
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 10:42:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AKJjI019738
 for <dri-devel@lists.freedesktop.org>; Wed, 3 Sep 2025 10:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AGfr4+Tq+pRH0dbxPVgty5UEqTX1thn/IcBnYM4r6iU=; b=cJW8bpRzr2Y7+x01
 iNMS27+r+sqcTDXL+XrKxJT3cQXqjvJMKjKzKxU+fBiOdnfs9fWUIf8ldx/1Kr4b
 y+LYgraHG7K320Iz8zsbrd7cyvQtUJPThi7U+sl8opq0KnGdH6NMCunDXifjHEdR
 6Dneq6ckqntEsWEnbmRsKz9w7ZZjugn2uZXipDArTh9qlNlmZfNhAhOEGpZXNgrm
 tr9/1jvcF9dDpl69xhqnx0r71dmFsA0DJaOSY09AaIY4V/xBAt0TucHfVgh5ci7C
 Bo5wc9B/G6qdPXgHPo0e4bBwp72j18xXWzPMnm+T2WFrquZhQ3B5Q16Gu/qjApDC
 Fqo2hg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw03ckb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 10:42:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b32216a52cso11163851cf.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 03:42:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756896165; x=1757500965;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AGfr4+Tq+pRH0dbxPVgty5UEqTX1thn/IcBnYM4r6iU=;
 b=ujXiv+E2HVqD4SiGYtcbiu8PQFimoiTSxVCrpAT/WM0kgl/o3Wh3X4+fibNucxzTU5
 KnfwujIRrDa7cZ8Rnz6BDQARQBXKnVakmryldcxtgro81IOHt+iy166+KPnwAj1o//gM
 0D47KfDk4usbLEG2O7duQX1p0A+UA74ieK9zDolIXp6hAmbJmPeMtp19/Xlg0sIWSKgO
 BpUs8TdrHw84D3sg0M10dCssOgVqaGsys4CgUw+nxJP7iG1Sk14is81P9AyK0KedPnA6
 GtE1IgSWc9wAszoozX+M21Z5wEWZVRhEQx93bedZCj6LncfZQ6UNnqbXeC4+grNZ5J0D
 oF/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeFyvvphnqvyHZEM4UxUKsDd3tFR92GQfNKH3zpTPCqsK+3glSVHBIoFC8tb2e52JVykqeMdWJvfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw392kybt++GLhFsuQep/o5EpsmCD/BORRAynyuWrIMWJ1xhu0q
 Scem3nL+9h34lHFUPJSVcqZjgHya8t6BmA0UVTQC0mj3WQ9uEhBLtdELFeVAJygN2+ukflBuRNJ
 0p1ONw8to9cC5BCvFMdkc6y2SOzTTLYckVzJ82ag9C7MCO0m9gPVK1QhQwNTYW/0vhMHHPBY=
X-Gm-Gg: ASbGncvpFpkvCvmGaofaYRj35wt3IuspzieLUtOedHHBt9mvXcceTP7WR2mokLaSXNM
 ffGUtweItMvETgDNjoC6yEdv1vAfsif3+c+jqTDBxqvDs/2H1w6PT4+A1fsQtKj4quNMk56LijN
 263DsKiCSbQwD+emNUYJX7ATnCk9eKkhwvCnpEOnHH/JN2bxSSKkFm7A2VL4j5nf21P4XJ3B49J
 5ghcHY1/GmsqHGJERyLljCCCiQ3n++ZJbnTBDEvdOnwA3NwWcKeMRLikYHVeMGb0el40mNRRkzY
 WYiHdYdsFGZrJBcI5dqJ4sx0KrvjM+LBTlNz1lEx6a9Oba03Vo4n58pY9Da2U/H5OB8fOiznw5a
 eZn9tsHJlUenQ3+9w+tz4YQ==
X-Received: by 2002:a05:622a:1895:b0:4ae:b029:cd7a with SMTP id
 d75a77b69052e-4b30e98a602mr156109511cf.9.1756896164638; 
 Wed, 03 Sep 2025 03:42:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVffWGT/P4HQ1hOU4OQt/ExG64VXiLoPZAGAGCtyi6SsM4nP3uvC3ksMYhqBwvHlyRLWq2nA==
X-Received: by 2002:a05:622a:1895:b0:4ae:b029:cd7a with SMTP id
 d75a77b69052e-4b30e98a602mr156108941cf.9.1756896164049; 
 Wed, 03 Sep 2025 03:42:44 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b046e6c630fsm78582266b.55.2025.09.03.03.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 03:42:43 -0700 (PDT)
Message-ID: <67aa2a1a-3adf-4c97-a7b8-865b5ca3b17e@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 12:42:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
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
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux@mainlining.org, Dang Huynh <danct12@riseup.net>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MM8YhV30Gj_o7_DAFJWIlJN7m3nc5VwR
X-Proofpoint-ORIG-GUID: MM8YhV30Gj_o7_DAFJWIlJN7m3nc5VwR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX3wteyJ+viQF0
 WCSeN4N5NDgswLSVPumZ53BKwdhWm3DaKEo2KsFbJvq2HvS8IQOXjWLUpZEN2/rcRBfawM94uA7
 EC6bwyqw5JvqgjC+zhnHTpeQ5wiIrbccI0E2on5peogYIgqoM20B4ntc8T7ndeXEezfTXCRmoMA
 C0jFheInWdHDGe1kqTQCO04eykabmlRL8Csxystmyq+lTuerWrXoaHDb/D/XSCKqOFWfRa8LukQ
 1Ln4NXIQM2auuSYa2z+PjFer/5/gqf1fiD3TJHDRYa7nGmeY94KuKlwYrgWXiLDsCNZGzbaBnTU
 nxIDY6RNOFDvmdEb1ND3xSxHGLZIVi/vaZ9aI3seebnrPoDizYdjTnfXvAOVb9eDYfBt5oFM+TY
 Sf8Szumi
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b81ba5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8
 a=sAN_IsTCchqKF9ABz68A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027
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

On 8/31/25 2:29 PM, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

[...]

> +		qfprom: qfprom@a4000 {
> +			compatible = "qcom,msm8937-qfprom", "qcom,qfprom";
> +			reg = <0x000a4000 0x1000>;

here you reserve 0x1000 for the qfprom

[...]

> +			gpu_speed_bin: gpu-speed-bin@601b {
> +				reg = <0x601b 0x1>;

and here you make way for OOB accesses

Make qfprom length 0x3000 with the current base and the gpu
speed bin should be at base+0x201b, I *think* (the docs aren't
super clear on that)

[...]

> +		mdss: display-subsystem@1a00000 {
> +			compatible = "qcom,mdss";
> +			reg = <0x01a00000 0x1000>,
> +			      <0x01ab0000 0x1040>;

In v5, I pointed out the size of vbif should be 0x3000.. and the random
newline below wcss-wlan2-pins {} is still there too

Konrad
