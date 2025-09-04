Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA4B44A2F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 01:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 925FA10EAFA;
	Thu,  4 Sep 2025 23:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sggjo2rn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C718910EAF8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 23:07:08 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IPksE032158
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 23:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VQxgtvqlq0HzxRDkP5I5PrVUOxES5Rbtim81FxX4br8=; b=Sggjo2rnmTJNkjGq
 S46CyRNFro+vFR8zL2uwM4EP7SArfGwrsatiZ+jzKxuktCM/uN2TgeAR6JIfzCbn
 dACUqifR102jbX+Udb6eoSWuOT0K+GCiE5ZA/jvrtvC7B//z7hWyy838KV+TzwwR
 IXW1TYw1ZlhnACSRS26O6G1vV21IUCFZ8pf+NJEA6dou/uZ5kHQzPOUJEuDFvVO4
 KtQ83P8eZ0UpEWixZPB0hhmcF13o5FSZjxIdFHG8wQeYU5w+YaoN9Or/X1ZO76rY
 2pnM5V1LvQuLh0hkQwuLZ0faqxoo8E1rrcM03dT9RwetUKNQbRTnz/mYWAAKw+M/
 5M4IMw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnphahm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 23:07:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-244570600a1so19880305ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 16:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027227; x=1757632027;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VQxgtvqlq0HzxRDkP5I5PrVUOxES5Rbtim81FxX4br8=;
 b=P3HXppTTOxU8IO2/ZDKft+4JjFsQ7vbEcJUAMU7QySu6NrpfjrzR6ZOxM3tdM1S2eT
 bUzJot0D5HuAglujmsBxwk8yEE39ewGKS/p/IevqP/Modfne0BOYY3C9YgJ2AAUxw8kX
 9JKsxg12m9oGN5jYuWhBW8HMeKG2nWasU3I6HtZebuMvMfIwmBaal//07kLmY/fInTu+
 LDCD+t8BlzEQiSRF+kpWfGKCjIlqIiGhtmKEGdsdFgcXEHjjIVJTl4MQrLFnR2XPoChQ
 BuTTjqeFqiGdADKMiQRjI9rvIEbNWQdak120qUEgEjR819VsOlHVRuvDnKHToW77DSQp
 JBxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgCIXtZdoX43cBGiNAAfpl3XQOVB3ChmBfk8tBO9s4R8QomX3i6GOVbqJS3M5dptgpQhp2l++K+jM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdHsemF9CFKpr25WpsXgA4dhc8zu0Q0+FQZCAAYMFqcviPAJNX
 2ZB8FWOCpMmFIQzViBnBmXX2ybS2ms/g43CfNKulPTakZfKRHgy0xCWXdLIGAvI0tjqwhhRP46x
 FFZPtEflPwjTF3v7/Ljv2+7Yhb29f10PGlZrIIAgfr1V2ZtwB7hpknHyIrQMM9PB+73dwd8A=
X-Gm-Gg: ASbGncvuD/fD1CveKSkG7S/MiZGj1bDvN2QXHcsGCNBKrkwHeBNLB0/6Zy6de9Wwsi+
 BkFs/8ZCEa7Ub7DLOQnpFmxRyNWJfeSMX0+fgXyxemYjEf+bxtFHYB7WOA1seK3fLAiVhS8ARyd
 dVEQGv6HYz4cw4EYq+hUr8jeX7cYebDH08TObb/3hg3vixaQmRpzcWFtDjdeZa42Y1paScvuRDm
 8K8UnflTM8KGDhhNgqdje8/mC8wtOwoeKWm27A7HlkSHRYYJrWJZmuYqnSJ4LsiWcXsEO0wxcx+
 rXzqtGRngheNDafE5M9CG7jwicOlPmS3TBzRlCV1FFxve0i/1MwgH6miU5nMsfwF5nKenLgURDZ
 EcfxTcf4M/VgpKhUIWwlxhw==
X-Received: by 2002:a17:903:244f:b0:246:cf6a:f010 with SMTP id
 d9443c01a7336-24cedfa9098mr16776745ad.13.1757027226473; 
 Thu, 04 Sep 2025 16:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3a9adXc+OPNFqInEjRcz8beQaf9/kI61UkTE5l3c0GN008HPPd0XCUECzEsnDCx8AkRCd9A==
X-Received: by 2002:a17:903:244f:b0:246:cf6a:f010 with SMTP id
 d9443c01a7336-24cedfa9098mr16776305ad.13.1757027225874; 
 Thu, 04 Sep 2025 16:07:05 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24cb28c3110sm38258035ad.120.2025.09.04.16.07.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 16:07:05 -0700 (PDT)
Message-ID: <1865e8a7-9d9d-4671-8429-bff121ab6ac4@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:07:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] drm/msm/disp: pull in common YUV format parameters
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-6-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-6-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bTEj3iWVZUVbqkIJgsZ8efITFNIDex9k
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68ba1b9b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NxCvQ7sPRDO8UjZhUV8A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bTEj3iWVZUVbqkIJgsZ8efITFNIDex9k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXz4vLYOMilLF2
 apVyPRNOBGWt9D/leG/QPa0apszGbEB+xiuplkBzjfwgjPraiUvk6B2mSaRbriQGD88fhx6HS1s
 pYnhN6hkJbrH0LzfuUpqL73x7cc1Qp9Gk2bu3tEMXakalyifpfwrtebuJFe1EIHuNYA59wXc3PZ
 v/tK8i7ELwi4rnKwcCrgwRSohoRMLWRCc71AzGAqSHsmQ5guDjUpMNq+w2l7Goc2oeWPq/eND/o
 hf0+XgqlpdmJd+5Z/l14lOfsU0XJPsj84E7HZcP1w6YWk9mUzmvTtK1xwsrTIUrACN21odCgCf+
 A/xv9nuC3ZADocHPU8ICT2UTkePWdzIYz/37DFjaIbGXlhHtb550hzqsVqrWTv3xG1vvP6ogKpo
 mBn477Zz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
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



On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> Pull common params of YUV formats into corresponding macro definitions,
> simplifying format table.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 120 ++++++++++++++++------------------
>   1 file changed, 56 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index d577b3d53fbebced63792b5c65f50dd45211c8ea..900b2de252a6eb2eac3d0670f1aaa77f7520fd77 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -244,27 +244,27 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   	.tile_height = MDP_TILE_HEIGHT_UBWC,                              \
>   }
>   
> -#define INTERLEAVED_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, e3,              \
> -alpha, chroma, count, bp, flg, fm, np)                                    \
> +#define INTERLEAVED_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, e3, chroma)     \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> -	.alpha_enable = alpha,                                            \
> +	.alpha_enable = false,                                            \
>   	.element = { (e0), (e1), (e2), (e3)},                             \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> +	.bpc_a = 0,                                                       \
>   	.chroma_sample = chroma,                                          \
> -	.unpack_count = count,                                            \
> +	.unpack_count = 4,                                                \
>   	.bpp = bp,                                                        \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> -	.num_planes = np,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_YUV,                                     \
> +	.num_planes = 1,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> -#define PSEUDO_YUV_FMT(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)      \
> +#define PSEUDO_YUV_FMT(fmt, r, g, b, e0, e1, chroma)                      \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
> @@ -273,13 +273,14 @@ alpha, chroma, count, bp, flg, fm, np)                                    \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> +	.bpc_a = 0,                                                       \
>   	.chroma_sample = chroma,                                          \
>   	.unpack_count = 2,                                                \
>   	.bpp = 2,                                                         \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> -	.num_planes = np,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_YUV,                                     \
> +	.num_planes = 2,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> @@ -303,7 +304,7 @@ flg, fm, np, th)                                                          \
>   	.tile_height = th                                                 \
>   }
>   
> -#define PSEUDO_YUV_FMT_LOOSE(fmt, a, r, g, b, e0, e1, chroma, flg, fm, np)\
> +#define PSEUDO_YUV_FMT_LOOSE(fmt, r, g, b, e0, e1, chroma)                \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
> @@ -312,13 +313,15 @@ flg, fm, np, th)                                                          \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> +	.bpc_a = 0,                                                       \
>   	.chroma_sample = chroma,                                          \
>   	.unpack_count = 2,                                                \
>   	.bpp = 2,                                                         \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
> -	.num_planes = np,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB |                       \
> +		 MSM_FORMAT_FLAG_DX |                                     \
> +		 MSM_FORMAT_FLAG_YUV,                                     \
> +	.num_planes = 2,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> @@ -342,23 +345,23 @@ flg, fm, np, th)                                                          \
>   	.tile_height = th                                                 \
>   }
>   
> -#define PLANAR_YUV_FMT(fmt, a, r, g, b, e0, e1, e2, alpha, chroma, bp,    \
> -flg, fm, np)                                                      \
> +#define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_PLANAR,                                   \
> -	.alpha_enable = alpha,                                            \
> +	.alpha_enable = false,                                            \
>   	.element = { (e0), (e1), (e2), 0 },                               \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
> -	.bpc_a = a,                                                       \
> +	.bpc_a = 0,                                                       \
>   	.chroma_sample = chroma,                                          \
>   	.unpack_count = 1,                                                \
>   	.bpp = bp,                                                        \
> -	.fetch_mode = fm,                                                 \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> -	.num_planes = np,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_YUV,                                     \
> +	.num_planes = 3,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> @@ -511,72 +514,61 @@ static const struct msm_format mdp_formats[] = {
>   
>   	/* 2 plane YUV */
>   	PSEUDO_YUV_FMT(NV12,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C2_R_Cr,
> -		CHROMA_420, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		CHROMA_420),
>   
>   	PSEUDO_YUV_FMT(NV21,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C2_R_Cr, C1_B_Cb,
> -		CHROMA_420, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		CHROMA_420),
>   
>   	PSEUDO_YUV_FMT(NV16,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C2_R_Cr,
> -		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		CHROMA_H2V1),
>   
>   	PSEUDO_YUV_FMT(NV61,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C2_R_Cr, C1_B_Cb,
> -		CHROMA_H2V1, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		CHROMA_H2V1),
>   
>   	PSEUDO_YUV_FMT_LOOSE(P010,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C2_R_Cr,
> -		CHROMA_420, MSM_FORMAT_FLAG_DX | MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		CHROMA_420),
>   
>   	/* 1 plane YUV */
> -	INTERLEAVED_YUV_FMT(VYUY,
> -		0, BPC8, BPC8, BPC8,
> +	INTERLEAVED_YUV_FMT(VYUY, 2,
> +		BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
> -		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 1),
> +		CHROMA_H2V1),
>   
> -	INTERLEAVED_YUV_FMT(UYVY,
> -		0, BPC8, BPC8, BPC8,
> +	INTERLEAVED_YUV_FMT(UYVY, 2,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
> -		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 1),
> +		CHROMA_H2V1),
>   
> -	INTERLEAVED_YUV_FMT(YUYV,
> -		0, BPC8, BPC8, BPC8,
> +	INTERLEAVED_YUV_FMT(YUYV, 2,
> +		BPC8, BPC8, BPC8,
>   		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
> -		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 1),
> +		CHROMA_H2V1),
>   
> -	INTERLEAVED_YUV_FMT(YVYU,
> -		0, BPC8, BPC8, BPC8,
> +	INTERLEAVED_YUV_FMT(YVYU, 2,
> +		BPC8, BPC8, BPC8,
>   		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
> -		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 1),
> +		CHROMA_H2V1),
>   
>   	/* 3 plane YUV */
> -	PLANAR_YUV_FMT(YUV420,
> -		0, BPC8, BPC8, BPC8,
> +	PLANAR_YUV_FMT(YUV420, 1,
> +		BPC8, BPC8, BPC8,
>   		C2_R_Cr, C1_B_Cb, C0_G_Y,
> -		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 3),
> +		CHROMA_420),
>   
> -	PLANAR_YUV_FMT(YVU420,
> -		0, BPC8, BPC8, BPC8,
> +	PLANAR_YUV_FMT(YVU420, 1,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C2_R_Cr, C0_G_Y,
> -		false, CHROMA_420, 1, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 3),
> +		CHROMA_420),
>   };
>   
>   /*
> 

