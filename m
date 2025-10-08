Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BBEBC4ACC
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D48C10E7DE;
	Wed,  8 Oct 2025 12:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIMRSor3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53EC10E7DE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:01:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890NiA009328
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 12:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YUe30woE5xEimZOnT9raXvhiVzii7F5/lJXV/+rQmpU=; b=eIMRSor3s8f0HqdA
 pkeP+CNNNqq715YMCOKDIEvIXhzK21rEAyE8AKxeGV11sFtZfcRSEWqiWYOV6l31
 CLFJOgcKqXCKvLzgnXLH0MLaL1IiJjrT58mDzQvQZWYfiOmU1MSSdWVsnCF/0GmF
 24SSvVe5dkZRObBoMxoeoc6XnfDZJoTq5N5OC7hOgDuV2LrGeLjqslpcpdvtsSBv
 PaXMMVUSqf8eH7v6YNIhQ2uNOdysGj8ioXnzOt1TGs6jNoNQNQnjGVfPLyCMnGdk
 V1EDZok9m9WVpHqCc8TtZuOo+U/kvJtxr0J1HRlQ2GVaXM6DoXflM1gj63gLWR/X
 j5vGwg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junuab5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 12:01:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-8920ba68a79so81027241.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 05:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759924870; x=1760529670;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YUe30woE5xEimZOnT9raXvhiVzii7F5/lJXV/+rQmpU=;
 b=GR5E1qhk7L+5DX3I2Ya19tivGqqaMQw3nJj442yLjbPKXSym8Xz2jBtXmQdhS9WPGo
 r8LoqHwX0VBk4qQyF4ULilYT89jKT8h9LCMs2xR7U9iq8PxAu71YkIwYqjDMXGcV4I1E
 5Ptugr7Es4QQhbzB1HYQPYOOrDofOGCNDdvbDlB19wgCQHRsbFUvVcRzyxaI3ewuzZxs
 wdp5PlfO0I/37lVrAgrMbNL+dW+GY/4UYfSVYOleL1edOWSjPI7X84gxyTV4bUccMQA3
 TUw5aGcxuyoiD02HvPL2vzyFmyCZ+FocGqf48+eIsOFJYeUwsYnZu+2o+T/UMJ6pe8a3
 spnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm7jbGph8Wbxk6ryfc/j3xGhcrdDN/3iQAb4/8Hwg9EB2HexTNk//YEj4kqAGs4lGxzGz7b81EcPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwErDzO/jnrPiScL/+4RnTyPqUbXMHWG6HX2FWmwFzAh0bPAbkm
 aX07kmngwB+mcWpMy90OmKxVQgC/Kw69Y5XFX+wkH26PSh0WEpeGivDKwtIxXx6jbzAbBTl434j
 WL/4+iIqRXJGJbWUWrG0Lrp3WcT7F8RPVISzN8UiKJZvwTY4z/XAxNAdMhLIVnodUoVVvDLs=
X-Gm-Gg: ASbGncvEdq0YvC9rkTPN3jA2C6e1eQazxHW63uB1Wh0v/HF4rP736wDkRy+0lvyi2Q5
 HyNDKd5pp4ZGpcJm+Yf3d4zFTk4ARX1G+O1uj8W43nUEuayipjMghLtEJIkRuA4P4NrGX640Pod
 QN0i1v4VN8qDTOGJCZ6ZxT+aolOHMI3MMIdmaykYi8JZBclujy86n17Lplkx8IcC2Wxo0Y9IeWV
 peyOPAB4bI3rmpTRf8ETCmcc4jNFm01zYfJ5Xnq+ocF+hCr1ODSCaSvImw3fWIKsDxfq5WzfK3D
 x1faG+dfkqkks9QPAD1uCjlcT0KscmGzsslpQ5Wa1+91l4qgX9edmXIdzzqWZ7CTsjLvecO+1fH
 ep1cmwF7qEya3RXevtB7z8125Jnc=
X-Received: by 2002:a05:6122:6c01:b0:544:6d56:eef1 with SMTP id
 71dfb90a1353d-554b8b9dafcmr382804e0c.2.1759924869728; 
 Wed, 08 Oct 2025 05:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT9kYombhVn9vLwV8HVqDP5rHDdMKek8m1Ph8xI5IlH4fvXAiDJcCahZY6sxIbEptqVVlYDA==
X-Received: by 2002:a05:6122:6c01:b0:544:6d56:eef1 with SMTP id
 71dfb90a1353d-554b8b9dafcmr382725e0c.2.1759924868891; 
 Wed, 08 Oct 2025 05:01:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652aa040sm1634050866b.20.2025.10.08.05.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:01:08 -0700 (PDT)
Message-ID: <f7f2189b-b182-4616-bba3-ad1a0af3e4da@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 14:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] drm/msm/adreno: Introduce A8x GPU Support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-12-73530b0700ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: MMm0VBD73zMDnRMddWupk968KAcHSiax
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX5j6x9YmElEuc
 /HNiZgqr7xg2FJjgxFhEvMi3MM4B9cAnPFkII5PuOIscPh7EVp7mKA4GFq47tnjXmfJJ74WDJW6
 xGoqhoeGN34av7p5ThdqEQGWZ0L40jp7oZx9fdeE+FSfGrHcRJqaJvFtca3xftTsHwMdtBZChgt
 2UwQpbvaiULergLxCzJDLMfofGkMELz/5LbW18ITlKFlU0cJXMPTkzAAcLHcgZ3R+wbRGKYZEcv
 ZQBaA3wlBWLKxilH8+GyGdh20/eqdaIIEJDZlQQf7Gse5DFk36ory2k7Eyr98NZqxeDEzqyUKwf
 qTAYguOXt8kCpNLRTmU6hCjSm+LaJoD0hDdno97isf8PfA4zJAXpoEQkX0QjljvKk/vd7jbmAf1
 0IhfAyLgDZsciz9cYGCnfJE9NC3k6Q==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e65286 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=C_0j-PAzlxBuy3Ei6pAA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: MMm0VBD73zMDnRMddWupk968KAcHSiax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023
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

On 9/30/25 7:48 AM, Akhil P Oommen wrote:
> A8x is the next generation of Adreno GPUs, featuring a significant
> hardware design change. A major update to the design is the introduction
> of Slice architecture. Slices are sort of mini-GPUs within the GPU which
> are more independent in processing Graphics and compute workloads. Also,
> in addition to the BV and BR pipe we saw in A7x, CP has more concurrency
> with additional pipes.
> 
> From a software interface perspective, these changes have a significant
> impact on the KMD side. First, the GPU register space has been extensively
> reorganized. Second, to avoid  a register space explosion caused by the
> new slice architecture and additional pipes, many registers are now
> virtualized, instead of duplicated as in A7x. KMD must configure an
> aperture register with the appropriate slice and pipe ID before accessing
> these virtualized registers.
> 
> This patch adds only a skeleton support for the A8x family. An A8x GPU
> support will be added in an upcoming patch.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

[...]

> +static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 slice)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	u32 val;
> +
> +	val = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe) | A8XX_CP_APERTURE_CNTL_HOST_SLICEID(slice);
> +
> +	if (a6xx_gpu->cached_aperture == val)
> +		return;
> +
> +	gpu_write(gpu, REG_A8XX_CP_APERTURE_CNTL_HOST, val);

unless the effect is instantenous, this needs a readback

[...]

> +static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
> +{
> +	return ffs(a6xx_gpu->slice_mask) - 1;
> +}

#define instead?

Perhaps also move it closer to the user


> +static void a8xx_set_ubwc_config(struct msm_gpu *gpu)

You modified a6xx_calc_ubwc_config() earlier in the patch

is one of them unnecessary?

[...]

> +static int a8xx_zap_shader_init(struct msm_gpu *gpu)

You can borrow this from a6xx_gpu

Perhaps moving such common functions to a separate file would be
even better, I glanced over the change and there is probably some
potential to commonize

Konrad
