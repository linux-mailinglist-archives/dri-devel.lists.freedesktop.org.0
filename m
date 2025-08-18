Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A91B29A96
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 09:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D9610E3D4;
	Mon, 18 Aug 2025 07:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="glmIizsz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD4A10E3D4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:13:45 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HJOiS1011409
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eO7wadraGhre+LJhTfVeJor488W/8ImtdDnMyxSeuN8=; b=glmIizszRqn3/+U+
 AQB6xcC8EP+OqOJ7w+DsAbFyuSIbb5/21T7AShl/+fevJU6Z2rOWZxz2SpccdLe5
 oqcdd4L5ua0fZZqDr7GPdOPWpph+zDF49+S/Q5OkOoGkMV/iMgfVkenf0vRapAKc
 yVuMIthwebhXF9OBg40/SrJiLng9n5MuhPrePLkKBcqkJ4hWYf444lReEOkEfWkR
 pSf1OBbqx6o6CNGgY5/g2+9MXxhGMDOzILaBIBF3Ad4mEOcdoxgo6xtxcQ3NIEFp
 wM01PcoiibPISy38rnrAxcaJUotGB/eqHBfo8679ErvBGg2efl6+HkpoeJ2OpUYR
 1OUPKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfpf3y3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:13:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2445806eab4so38392855ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 00:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755501224; x=1756106024;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eO7wadraGhre+LJhTfVeJor488W/8ImtdDnMyxSeuN8=;
 b=Z0p8EsXaGTfRsngeg4HxQJLeYuskbzl2IkNTNHVy4H1wDQdlLmrGLHPOjtPNGWNBXN
 NiAE+M+Tun8x8Vk4QtghYjjokHyoqgchZ6sfqoQnYZijwfj3tB/pwhXJOuTjDLuPietf
 fxgI4Lj2KZcV8qnH81u5aGHVLtI+ZDS7xBCjmkWPmFiHrnoHIoE/9tI8F0woIt2xkQiT
 i3UJBDkHA2qJJO8H0aVcC//b2h/sUTdI93lruDmze3HOq0oXsrqvXneEQQt81NL7KhTh
 7RaZB8ZLuUl23DRYuHh9O+cFBNFYUrrrR+AGRkTQ7mIGzcZrlKDf7f/HTtv+iItO9dyJ
 JRZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUybqZKgnCXZ73OrdNh4+K/G65frEn26abcsmEnL+Z3HWb+PMj3a4hOuO+olB86FhZOQPpRa95DY94=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh+NlQQcCkPs2By6Oew0o3FrfICkQPjuTKVfzkU+EmasDP6gqX
 EbRffRwTPS3Ed+Oy4XKs6m0KJdqg3oFjRubiyFtLDj20mu1g75JwceABpBofir3Y9A+isLnmWSo
 rlkTY6G1TBQRh8+5ZT87DD3v2BcWlqQ5LmXHIFviY9KRy05V9//b2UEzxzyTAsBZEQ6Sk5x8=
X-Gm-Gg: ASbGnctbaZc/dDOhPT/vNWGMV9TPZYoEfC0vnJ5HYDGlUSZScmgdcK4iWS+H1sXg2EN
 NloyvmaorR91/o1aHwPUBNqoXrr4OfDbdmRDfkaUThs0rkFBneqxjmfxrJTn1PE+F4C2C22fVpv
 F2oxZ0Bl6RmTnEg77mFch4DoIvN58/aKw+aZhiaoEZjtQZ4p3xY8fzrlENPUcdrLgUu4G3RL0GI
 oHPxGyBXBTzImLDmee6b8+XPgel2aYyN3BAguNTeT03ovwYHgp5mW/SXxURo8sf3cpaMSu9Ew+3
 PlcEDeK9/KnE6kXxmfiFonPpOWOWGAO0Oi2MAF9R1R7mNuAeiJE918OubM+Mkp43
X-Received: by 2002:a17:903:2d0:b0:226:38ff:1d6a with SMTP id
 d9443c01a7336-2446d6e4c8fmr162951855ad.7.1755501224262; 
 Mon, 18 Aug 2025 00:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKK/VsGw2K363BINLgo4z0OW/kcKqNy2Al0tPXrsMMCPgwF+XIrPg9LBdfU+0MmAtu3XKsaA==
X-Received: by 2002:a17:903:2d0:b0:226:38ff:1d6a with SMTP id
 d9443c01a7336-2446d6e4c8fmr162951415ad.7.1755501223816; 
 Mon, 18 Aug 2025 00:13:43 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446ca9d043sm71010145ad.12.2025.08.18.00.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 00:13:43 -0700 (PDT)
Message-ID: <026b1a09-c8db-4a5d-af43-3be4fe24a824@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:43:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o2zb4291QI-_-3dDVscf7wm5tp5vWk1H
X-Proofpoint-GUID: o2zb4291QI-_-3dDVscf7wm5tp5vWk1H
X-Authority-Analysis: v=2.4 cv=X9tSKHTe c=1 sm=1 tr=0 ts=68a2d2a9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1B6o04Z4kyHWbw-D5gsA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwNSBTYWx0ZWRfX2KTINWsltzB+
 T8OFxAwzE+zbPHydzHOEbWhwhgjyH2zkMpeuey7g2qcCIxlvoZAsfXx3dEb26tKm49wlG+KbwTS
 g75uqBPjQpL2Xp5ciHa0elgDRKBHNSzT9Lx7GKhIpnBqKX8vICz3GRDbcstC0qgQBBQIF2EOrm5
 lBbJCNEimejBCYZf0YWRqBuHwXpOyyaNbY/nH0Ez+dZ3DRCkpr6N1/+xL8so4YQUXbxjRh/3Fxs
 /yWnqSZx0o3gW0wGdXhxWtQcOkxj200aqsByKfie7eticPBDPv/IkihvTBfehjBvfQ9lYVSOI0j
 h67DNQR7/YIePy2u5tR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2508160005
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

On 7/25/2025 2:05 PM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
> Changes in v2:
> - Used proper ACV perfmode bit/freq
> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(3),
> +					.perfmode_bw = 16500000,
> +				},
> +				{ /* sentinel */ },
> +			},
>  		},
>  		.preempt_record_size = 4192 * SZ_1K,
>  		.speedbins = ADRENO_SPEEDBINS(
> 
> ---
> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
> 
> Best regards,

