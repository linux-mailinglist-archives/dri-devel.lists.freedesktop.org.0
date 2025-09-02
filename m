Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1371FB4065C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CAC10E74B;
	Tue,  2 Sep 2025 14:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="idsb4DJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DDD10E74B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:15:40 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Anc1j016548
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 14:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Mlie5F52Ht3HYOWTj4ogGL6rzgMYQ/jMzQdCkcJA/LM=; b=idsb4DJVLCwHX/wd
 dLBEgRWQ5XfjnjoPCs7vnuCRGJDdRCLaAbT5T9svXWbSJnjAlyb3/SWGWuOXj3nU
 Qf062q356QCUP7EggKRkCFJpFN80p5bOLKePqvMQ+knYwQUYRK4AOeYvjlNkcp0B
 Mc0bbXRe13v93zHGHvugMaUGyLlbRd+iWqVdOTLObCSNW4oStfcXJFow81/iP6hy
 oTt7Qq42AOjVxo4tLmcNly88otHG5A1q5+jjW/t6ic29337YqqsxkJ8cJ8NkDG21
 ReeAlq5PVBOhG5ubWXO+i1jNO66SVUvqRx9IF/hi/OGahlLGwyFigblyPUyCj8B9
 XN0p8A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw002xt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 14:15:39 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-890190be902so486942241.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 07:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756822539; x=1757427339;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mlie5F52Ht3HYOWTj4ogGL6rzgMYQ/jMzQdCkcJA/LM=;
 b=Pp2LkWFgcoRoqr+93ZkD+EuA4xsYQhC6Ro2jAYqgxsq+4riYXejaJBlIZ9uyd7VBCL
 RLLaY5MxhR0u1pBNlofsQ6V9HzRvLLYGlHG7ynNNYc14dOPAlathgAO5F+2w7IENRNKS
 2QyvaO/ooyOu5ls0FuoZMRoKoDHGxKsww73/Wl/eb8zatBsOnffQ9pCuXtGI/P1eSA2G
 Mt7SJqrbFnX42U3Af/Lmd5uejR0PKLQIrPfEw+KSPRlnWY5rM8uqE0oP+czfmwOzw/55
 q98X6BdHr4s/mI45/A9JIslpvRRf2uqbx2JdH4RrB8KquKcbWCD/OOf3alCe8DLrR8JQ
 9kbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgerVHHt5ElNLbiJDvpqdS4dag5cpDh7L0SSdSJyoRmnrE/wyaMmOvHLg6WcotJ+3ZhJ1EXI8ITlw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/fzF3CLYCx8erR8ENx3CBVLpp7PErFjknm3jQkwY4m6yUDb9F
 g/gSuMv0lpEjESJuUTkUdbkB2aGmwiJ1YukcBZE4I5XWlkQGljSty4pyylBPn23NGbCSp72Je5j
 m6jbc5KZDi6IN43kkRzA2DLj0j5ULrr8qXEthxDQgjjxKDmAGmDqTfmJWzk30N3LV5MgaY74=
X-Gm-Gg: ASbGncusAMee5e05Yoet5hvgiNX5dMwcHLP1vgnXaDiGNhrBWCZwbZ2wtKIhO0eYSnP
 /LqgBfUsKLGc4EHEiVd1OKe0pKetf7BiysvghO25cE/IAVQXgYn2VDonWGaVoFc10i/mrcSyuus
 Ns+YZzSllQTFswD5xpQkmIWhE4pVbfm7zBRbsQwo3zRXH2smqVF7w3zWz2bMJcd38/06pcpkUI0
 +SYAG5lhrAGLD5gOksNFso3oO+Zv+VgWpEszGWJj/tpygPaBg3ALeMeX0EwX13Gy7Pl5F6GzMdK
 hILKJpocpo/wsWNPEHD/NHw4n6dIf9wzVzepf3eb9Lpq/zBQ2GFz+HQb9wAJqm9tJ7FUpt4sU6E
 8iONIES5bt6SQrKIPyEhTS/usH/rprUdd2wL/qSxnD8g/oGgefM93
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id
 ada2fe7eead31-530f666561bmr570527137.20.1756822537099; 
 Tue, 02 Sep 2025 07:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNjsqepLP76zUIqTQQBX9Us4UoXPo5VPCLW3VzTnrFgAj+u/0dS6AteoLKyMgNUBFdMU3pqQ==
X-Received: by 2002:a05:6102:4613:b0:530:f657:c5d with SMTP id
 ada2fe7eead31-530f666561bmr570468137.20.1756822536291; 
 Tue, 02 Sep 2025 07:15:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827b1df6sm730194e87.143.2025.09.02.07.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 07:15:35 -0700 (PDT)
Date: Tue, 2 Sep 2025 17:15:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
 Dang Huynh <danct12@riseup.net>
Subject: Re: [PATCH v8 5/7] arm64: dts: qcom: Add initial support for MSM8937
Message-ID: <gkkxxd45xclwjs6cp2loj4male7wobeacbshvjasolr4accz64@vux2ou4wa2wa>
References: <20250831-msm8937-v8-0-b7dcd63caaac@mainlining.org>
 <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250831-msm8937-v8-5-b7dcd63caaac@mainlining.org>
X-Proofpoint-GUID: ZGbYNFeIStPBx0VLA5M2hrN10jjsko6H
X-Proofpoint-ORIG-GUID: ZGbYNFeIStPBx0VLA5M2hrN10jjsko6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX2+wvvcw9OskL
 ZYY8hpIzVKdFGg1gwyU0ynjU/wMr45mn20UFOQL8JC1KdqilxxkVaCAEVHgtXL3melzlXJwzfRl
 G4cXn/Yu1X2aipWQ2/T/xzlqA5Hpp4QnvqdyFzFXe9H+6GRDwWEjU1Zs9Bi4u0bE5rCP0veLj/p
 NmIznFGnAaki6PuLfZs1D2NWO2Z5v+R3EocFwUESIDxSb0WUpVrEc610MRh9VZ3cXIz7PTEBNtl
 YN9i9M16Ko2MRuxHJV4olAzcYXBjKLvkLUhWKDIpLEAfNgVch9JohOQ5wSMjq8IJl/GFR+4leKR
 40tQzLAKKlAV2X7RUnk9X44h/vxF4m8mceh3p1sIf4WSKm7mwtYd7iWn26k2zhaEGqhzsJsFN2T
 qAR9DqiM
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b6fc0b cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=bBqXziUQAAAA:8 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=9HHfay7fNgEZ8udxRwkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=BjKv_IHbNJvPKzgot4uq:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
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

On Sun, Aug 31, 2025 at 02:29:28PM +0200, Barnabás Czémán wrote:
> From: Dang Huynh <danct12@riseup.net>
> 
> Add initial support for MSM8937 SoC.
> 
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Co-developed-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8937.dtsi | 2134 +++++++++++++++++++++++++++++++++
>  1 file changed, 2134 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
