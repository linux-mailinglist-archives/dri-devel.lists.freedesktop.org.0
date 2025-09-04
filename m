Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E118FB44A20
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 01:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD6D10E287;
	Thu,  4 Sep 2025 23:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ozpw9On3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C3E10E287
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 23:05:25 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IDOTu002543
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 23:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2BBqhUruX490OCtbVD9cWmg1K80ZzKKNurd2FslWoTo=; b=Ozpw9On3SMYkJxSP
 3ecE21clFXn46f9Q8xD79TVG4bqjY3apFcYWL/kSDdcoKkYZVZhkgLLwHotuUkSH
 RVGrYFv/dn2/cqVSPYYM7HYrySa/Fhm1YuYxDHKS/GDQGnl3kYxsodAME4//asXJ
 NGLPHt3Lol+LsPUvJOVsdUA/Wxu7JzTlJ+zb8jKB3FEuzDwGnPHC8Dd7rrGTC0Fw
 ReyWItNrFRhgXTBqzRap8b45vBEFJ4z91Q7DkNOa/3GSLy5EAhrID4qX+qt3dJw6
 0/rOlVnSdU5eew4bwVOo6h8qFOfZOBY366gkAa7E4HQDDBViZwqC3VCCdYfJaY9f
 AID4xw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush390na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 23:05:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-77264a9408cso2670952b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 16:05:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027124; x=1757631924;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2BBqhUruX490OCtbVD9cWmg1K80ZzKKNurd2FslWoTo=;
 b=p80J4rYp0Cdp0lXFwby67JbHiL9crhdG+ONZmnAZexzKMz5jbaiu5pDSvn1MTLxZbN
 ppWC7RGF/OMslgP+pVl1fwROXXGn7XowA4yGf05DGmcnzy7ZLS0Z9Kcz6LfgLXera9D1
 C56C3KVhviyQkXH2pWCrQ4hiGf77+/LLtNTMHUoqmRqlt7QMxNXitf3fSLBO6ZLuJGZ7
 Eftkx3kC2bFDgV6KlHN5HRaF9PKAskVvdeHzHJBKBmHRowdYDhJY9oy4r319f7kvKI96
 l0yMhNf3Y/pJYZqMU/sZmrfLn1hUFHT4Lp+aYN5r/xdya7x0pTQ+cYFcuqTz/V6i/ybk
 HDYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVdtbRrMdjFnDGgmErK0JrKOrG34ovZ6sx+ksKjSJokwNBppjCCf6cjxCkoY0/0Y+4iVRos3P/JQU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx3MmkjhlCazriV3JtU4+oOsehNeryNlyPdLoyLGEAt6k/TNyv
 srB7MXRjSJTOV5q5n4UNbrIBMcqJenJLlL92wsmr8Is/AoOiiN2k0hrSKPf11CQOy36IqwY4Db8
 CvqJr75xGK7KmUgAUzYPfGULw6evlDSnA1wbdd6UN4BO0QKFY1ABIJvvkhGNSzIlv+Ljv1eE=
X-Gm-Gg: ASbGncsedU2k0TlqDpRm9dVY/Kevt2MTeekrhL84IZMW9HhYphU/espzWQIX6grJJ2Y
 Edkv5yoT4YEEUuOrsEHwPcM+wbu4ZfHHcfmfDMBwuNnzmCwtozZ7RvHXJJdsudzBbVqyAvEFjrK
 quErpotZXF+FHULFPNhp0ERp5G4VV1Mypq9qltT9KuNlEGr6ypQSQqPeD0Lr0JdG24BCgFFldwY
 /tSarNsxJfaOdqqJMzOzR+B2LjOaTtLM/6Jjmj0/8LKEPhWgpBfrZMLqDJNGp39XG3Gc5zC6qYb
 SgPub4GqzIb7q4yORuMB7omV/97O/vtuUd3dNRK6/AAciZA4seAkDPYJa2dScbvK7lLtH3lmEz2
 EJzoXAmGwnJ6nqcBfdxqjgA==
X-Received: by 2002:a05:6a00:1d92:b0:772:4937:d43e with SMTP id
 d2e1a72fcca58-7724937d85emr26174589b3a.32.1757027124286; 
 Thu, 04 Sep 2025 16:05:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAsPYtFu6jW8n09u4WGEQzJcpHeOJw5wUGGzhcGysaJndyxg4QWO59eyJ3jU3jAg/KJlXtFQ==
X-Received: by 2002:a05:6a00:1d92:b0:772:4937:d43e with SMTP id
 d2e1a72fcca58-7724937d85emr26174563b3a.32.1757027123782; 
 Thu, 04 Sep 2025 16:05:23 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7741f5b3c1csm98269b3a.60.2025.09.04.16.05.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 16:05:23 -0700 (PDT)
Message-ID: <e15b8695-08dd-49b2-a0e4-f1957026bf8f@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:05:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/msm/disp: simplify RGB{,A,X} formats definitions
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
 <20250705-dpu-formats-v1-4-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-4-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXxBjY4fhy2zOA
 Vg6cYJ0/gKHhpDkg18h9zIQHBXDG1ajATl5Ve24ilY6psC+GDkvJT6J1R04KDeuT0e83qLtOAcA
 qb19DiMfXrX2kvwYCVdk767emKQ6rT5CdQV71zvW3zdrO1kNIPO9aTyIuuAXkDZgRgSPVfsS9Qs
 gxPODWnKHidkRA32pnFcrzNidwnsD8tXVw+E/zNQuOHc5wYNZrndSfS9x8ttx0EmLgjEhPaHCNx
 5+WJ6szXbgRJMhGPl23zf1WED7S7ViXPeX/eMI9ZTxWlI/dZvLfUkmkx38QuereDVNYoW6JlD1P
 TudYTZhUp55VqfnfmBV0c5pC8QKNI6w60Q09FsbSvY98brfwxjtKPToiINgZFqArgXdEAZsluOS
 dNJwOxSf
X-Proofpoint-ORIG-GUID: l011g-kq-ytJnwYpGPDRT615jCLnSXE8
X-Proofpoint-GUID: l011g-kq-ytJnwYpGPDRT615jCLnSXE8
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68ba1b35 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=D8afDwXF6kNTcx-T2tEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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
> Define several additional macros, capturing RGB format classes, in order
> to simplify defining particular RGB* format.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 275 +++++++++++++++++++---------------
>   1 file changed, 158 insertions(+), 117 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 09a5bffd838b8a4fd3c22622e82dcf9fb99b5117..28cef986f2d662484afd47440a79393c48256ff5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -66,22 +66,99 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   #define MDP_TILE_HEIGHT_UBWC	4
>   #define MDP_TILE_HEIGHT_NV12	8
>   
> -#define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
> -bp, flg)                                                                  \
> +#define INTERLEAVED_RGB_FMT(fmt, bp, r, g, b, e0, e1, e2)                 \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> -	.alpha_enable = alpha,                                            \
> +	.alpha_enable = false,                                            \
> +	.element = { (e0), (e1), (e2), 0 },                               \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = 0,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 3,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
> +	.num_planes = 1,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
> +}
> +
> +#define INTERLEAVED_RGBA_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)         \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = true,                                             \
>   	.element = { (e0), (e1), (e2), (e3) },                            \
>   	.bpc_g_y = g,                                                     \
>   	.bpc_b_cb = b,                                                    \
>   	.bpc_r_cr = r,                                                    \
>   	.bpc_a = a,                                                       \
>   	.chroma_sample = CHROMA_FULL,                                     \
> -	.unpack_count = uc,                                               \
> +	.unpack_count = 4,                                                \
>   	.bpp = bp,                                                        \
>   	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
> +	.num_planes = 1,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
> +}
> +
> +#define INTERLEAVED_RGBX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)         \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = false,                                            \
> +	.element = { (e0), (e1), (e2), (e3) },                            \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = a,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 4,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT,                            \
> +	.num_planes = 1,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
> +}
> +
> +#define INTERLEAVED_RGBA_DX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)      \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = true,                                             \
> +	.element = { (e0), (e1), (e2), (e3) },                            \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = a,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 4,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_DX,                                      \
> +	.num_planes = 1,                                                  \
> +	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
> +}
> +
> +#define INTERLEAVED_RGBX_DX_FMT(fmt, bp, a, r, g, b, e0, e1, e2, e3)      \
> +{                                                                         \
> +	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> +	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> +	.alpha_enable = false,                                            \
> +	.element = { (e0), (e1), (e2), (e3) },                            \
> +	.bpc_g_y = g,                                                     \
> +	.bpc_b_cb = b,                                                    \
> +	.bpc_r_cr = r,                                                    \
> +	.bpc_a = a,                                                       \
> +	.chroma_sample = CHROMA_FULL,                                     \
> +	.unpack_count = 4,                                                \
> +	.bpp = bp,                                                        \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_DX,                                      \
>   	.num_planes = 1,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
> @@ -225,185 +302,149 @@ flg, fm, np)                                                      \
>   }
>   
>   static const struct msm_format mdp_formats[] = {
> -	INTERLEAVED_RGB_FMT(ARGB8888,
> +	INTERLEAVED_RGBA_FMT(ARGB8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 4, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(ABGR8888,
> +	INTERLEAVED_RGBA_FMT(ABGR8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(XBGR8888,
> +	INTERLEAVED_RGBX_FMT(XBGR8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBA8888,
> +	INTERLEAVED_RGBA_FMT(RGBA8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 4, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGRA8888,
> +	INTERLEAVED_RGBA_FMT(BGRA8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 4, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(BGRX8888,
> +	INTERLEAVED_RGBX_FMT(BGRX8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 4, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(XRGB8888,
> +	INTERLEAVED_RGBX_FMT(XRGB8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 4, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBX8888,
> +	INTERLEAVED_RGBX_FMT(RGBX8888, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 4, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(RGB888,
> -		0, BPC8, BPC8, BPC8,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> -		false, 3, 0),
> +	INTERLEAVED_RGB_FMT(RGB888, 3,
> +		BPC8, BPC8, BPC8,
> +		C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGR888,
> -		0, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 3, 0),
> +	INTERLEAVED_RGB_FMT(BGR888, 3,
> +		BPC8, BPC8, BPC8,
> +		C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(RGB565,
> -		0, BPC5, BPC6, BPC5,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> -		false, 2, 0),
> +	INTERLEAVED_RGB_FMT(RGB565, 2,
> +		BPC5, BPC6, BPC5,
> +		C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGR565,
> -		0, BPC5, BPC6, BPC5,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 2, 0),
> +	INTERLEAVED_RGB_FMT(BGR565, 2,
> +		BPC5, BPC6, BPC5,
> +		C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(ARGB1555,
> +	INTERLEAVED_RGBA_FMT(ARGB1555, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 2, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(ABGR1555,
> +	INTERLEAVED_RGBA_FMT(ABGR1555, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 2, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBA5551,
> +	INTERLEAVED_RGBA_FMT(RGBA5551, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 2, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGRA5551,
> +	INTERLEAVED_RGBA_FMT(BGRA5551, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 2, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(XRGB1555,
> +	INTERLEAVED_RGBX_FMT(XRGB1555, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 2, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(XBGR1555,
> +	INTERLEAVED_RGBX_FMT(XBGR1555, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 2, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBX5551,
> +	INTERLEAVED_RGBX_FMT(RGBX5551, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 2, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGRX5551,
> +	INTERLEAVED_RGBX_FMT(BGRX5551, 2,
>   		BPC1A, BPC5, BPC5, BPC5,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 2, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(ARGB4444,
> +	INTERLEAVED_RGBA_FMT(ARGB4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 2, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(ABGR4444,
> +	INTERLEAVED_RGBA_FMT(ABGR4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 2, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBA4444,
> +	INTERLEAVED_RGBA_FMT(RGBA4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 2, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGRA4444,
> +	INTERLEAVED_RGBA_FMT(BGRA4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 2, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(XRGB4444,
> +	INTERLEAVED_RGBX_FMT(XRGB4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 2, 0),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(XBGR4444,
> +	INTERLEAVED_RGBX_FMT(XBGR4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 2, 0),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBX4444,
> +	INTERLEAVED_RGBX_FMT(RGBX4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 2, 0),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(BGRX4444,
> +	INTERLEAVED_RGBX_FMT(BGRX4444, 2,
>   		BPC4A, BPC4, BPC4, BPC4,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 2, 0),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(BGRA1010102,
> +	INTERLEAVED_RGBA_DX_FMT(BGRA1010102, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(RGBA1010102,
> +	INTERLEAVED_RGBA_DX_FMT(RGBA1010102, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
> -	INTERLEAVED_RGB_FMT(ABGR2101010,
> +	INTERLEAVED_RGBA_DX_FMT(ABGR2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(ARGB2101010,
> +	INTERLEAVED_RGBA_DX_FMT(ARGB2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(XRGB2101010,
> +	INTERLEAVED_RGBX_DX_FMT(XRGB2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX),
> +		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(BGRX1010102,
> +	INTERLEAVED_RGBX_DX_FMT(BGRX1010102, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX),
> +		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb),
>   
> -	INTERLEAVED_RGB_FMT(XBGR2101010,
> +	INTERLEAVED_RGBX_DX_FMT(XBGR2101010, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX),
> +		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
> -	INTERLEAVED_RGB_FMT(RGBX1010102,
> +	INTERLEAVED_RGBX_DX_FMT(RGBX1010102, 4,
>   		BPC8A, BPC8, BPC8, BPC8,
> -		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX),
> +		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr),
>   
>   	/* --- RGB formats above / YUV formats below this line --- */
>   
> 

