Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76893B44599
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 20:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B209310EABF;
	Thu,  4 Sep 2025 18:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmULmFZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E31010EABF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 18:38:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GUvCJ018533
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 18:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 rssL+6G8FN5LG7LMUBKmTSBofG0KyOBvcSbrEws4HPo=; b=JmULmFZW6lZ/mKn0
 8itMKEbCHe7M2BP6t61xJmYFLLjfXs5zmAMyU2y001q6fNpmcmUoZ/0GYH/A2xFU
 PwyJYF0C7iYAGmoP7UirkGTXNa1luXd9TkR5j33MI2lJts6LypbEkCipyTuc00Dt
 xekHIPqR2m7VZgqCLW/xzOfR8bxHnQYN6lMkvlgW9hl+BsFjwqruVd0qfsMvwk25
 KTJM9++3Dq6IPMYZ78d/C3QXrKOu7mP5S7uBn+k4ejlOFsS+9yEG4yqUdIsMw3RB
 Ks/NtjjC1yFH/25mQ55X7d2tM71NP+LWM02FCBU1cPWO44M66D6sPlcXvakoF5M2
 U6IQ2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yeburcvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 18:38:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24a94fef521so23943195ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 11:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757011098; x=1757615898;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rssL+6G8FN5LG7LMUBKmTSBofG0KyOBvcSbrEws4HPo=;
 b=at0l9S6CX3imEuRg9sf6WsCXqeJHvbYLs6ZQmHmfomAGEdrjlKcf2ahgzWs5xtS4rM
 5t8plgJn2aH37r3cR1jWwSZo+MPcXIqXye+E2kndiurN+8C0Aly9f2CkL7zOwjQJgJZQ
 +8iYHCF+Z1egqjNKtyfMUrMtoZ9zsruKiBhUA/A/T89bVGv4xEHkTzYZqXcKT8hcx2AQ
 Hosa7tyPEH33/c7UKg0g0mGBKLde1mume83p+jvVK72IAcoHjuLtzevxC+A8q6HmJSW8
 sCPJwCNGRx2xOoTNjQkxaBdTnmDAmG/e+m2mxk9HVTIny7oC5O8oVTS09VEr0c/rw46K
 TGaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxCbJ8I2sjgW62W0GH9BVrvXkFY/ZsHmB8CM6byj1rTjS4Y8qTF5gMU8PW/0ibf5pN9ZxZHaGsF20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyElI1mTbWFaXj42pWxIXZvJVXkQUh8ewH3XpfH6NjXo3z03ipJ
 pbm1Es7CzIamau0D2T7oLtUoJH6rFfONXJBhqGo3frv62H7dp4agF9339Vk2TxyqgPAokeph9P3
 MMOe3bmAZgoGrxbwtYAeYu2uYBsP1itInCTOMqJGIt9SLng+pPrwC3s90E5qRrgwBnAsibPo=
X-Gm-Gg: ASbGncsxUqB438q4y81ejZ6DdStKQBzdxDAqbZWQovQc8eAV9O/a2Su1QQ8K1YV2lfH
 3OcMLXszDKzRg56nxzVlJ0ydv2kRMC7/FoJBcbO0Y7wF2yxt1B2NJ2e9PSkBDEPd9kfrGDBkXE0
 Y/0sXk30Z7W4O85iUA3AetaGQk6W2aDyouK0Uw7tJQp1imHcImN9NdwbZMZiwQ3mcdOcje3TciG
 SAFwX88gWQF3zsE6I27POR0l9I6OYIr7LwYXca4E0CfhbTsF1VYp/FWM8dRKIqybDbyO6HVm8rj
 ECSoGTjAkFPpNjq0SfuoLQbwX9WhQ0hkFxldAQBJOvqmPDvZ0IxEhDzN3S+lEZqzdh3khVCRgyv
 b9iRv7hR+BLFQu/jmYKElIA==
X-Received: by 2002:a17:902:f542:b0:24b:1741:1a43 with SMTP id
 d9443c01a7336-24b17411e77mr130690585ad.58.1757011097857; 
 Thu, 04 Sep 2025 11:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrGZXs3Bk5vSSAzqcnUJQ1gGAx5Q/kY4Q2C+c3W9OYcx0iHZD5nnEJBxA6I/4YYx/XY+RokQ==
X-Received: by 2002:a17:902:f542:b0:24b:1741:1a43 with SMTP id
 d9443c01a7336-24b17411e77mr130690365ad.58.1757011097364; 
 Thu, 04 Sep 2025 11:38:17 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ce9dd9373sm5748535ad.85.2025.09.04.11.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 11:38:16 -0700 (PDT)
Message-ID: <c2d810bc-bdba-464b-9a05-49ca2e1c773b@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 11:38:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] drm/msm/dpu: use standard functions in
 _dpu_format_populate_plane_sizes_ubwc()
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
 <20250705-dpu-formats-v1-12-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-12-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c0UpJluEYDcyI4GIZbvFkR2uWy7CuMTC
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68b9dc9b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=vPUQ5TvUw8t84cJzJAUA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfX9BtNzehTvMWl
 r37/2y1Zc6EPfiwz5dE+C0vydGdt9vV9ifNWWD+wwfO+DafGaLk7lZFaDV7Bn0+jA+vKY1Lp4fz
 I/cTI/qUxTKa3Sd4jp5QodbnbBrh/HTHcrK6Sz84JsM4ztvgfL6jI0gTI5HLar13s2MQaNnA8dA
 4UDP25Y9YebzVIY/Nj50i+3pLui2ukgkp81Kcrn8VLejYYnyoEH56Z77r4Cj4BAlSZSkeS1Iwrq
 7GX4l2PMEoViQvgD0Z0gIQN/a3SR/r1fCSe6AAOUKROT+ynSj4BdOmJekrNHVlOyl76bE6Z6S+z
 dMrpNfmwz/+QlPsFPPGsH/o9JIW9ljUKZzkErKgtq/2fb2SLMGYTwAqVmHAjs5PAhemDumsR+or
 V2yrB14Z
X-Proofpoint-ORIG-GUID: c0UpJluEYDcyI4GIZbvFkR2uWy7CuMTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509040163
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
> The _dpu_format_populate_plane_sizes_ubwc() used MSM_MEDIA_ALIGN() and
> MSM_MEDIA_ROUNDUP(), macros inherited from the previous implementation,
> msm_media_info.h. Replace them with the standard Linux macros,
> round_up() and DIV_ROUND_UP() respectively.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 62 ++++++++++++-----------------
>   1 file changed, 26 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 67bc5a6eeb43dcf113dea9eccdb778cd52b1ad40..6a0426ed1460c5af4822844d7a7b0c51739df875 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -10,16 +10,6 @@
>   #include "dpu_kms.h"
>   #include "dpu_formats.h"
>   
> -#ifndef MSM_MEDIA_ALIGN
> -#define MSM_MEDIA_ALIGN(__sz, __align) (((__align) & ((__align) - 1)) ?\
> -	((((__sz) + (__align) - 1) / (__align)) * (__align)) :\
> -	(((__sz) + (__align) - 1) & (~((__align) - 1))))
> -#endif
> -
> -#ifndef MSM_MEDIA_ROUNDUP
> -#define MSM_MEDIA_ROUNDUP(__sz, __r) (((__sz) + ((__r) - 1)) / (__r))
> -#endif
> -
>   #define DPU_UBWC_PLANE_SIZE_ALIGNMENT	4096
>   
>   /*
> @@ -80,57 +70,57 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   		    fmt->pixel_format == DRM_FORMAT_P010) {
>   			if (MSM_FORMAT_IS_DX(fmt)) {
>   				if (fmt->flags & MSM_FORMAT_FLAG_UNPACK_TIGHT) {
> -					stride = MSM_MEDIA_ALIGN(fb->width, 192);
> -					stride = MSM_MEDIA_ALIGN(stride * 4 / 3, 256);
> +					stride = round_up(fb->width, 192);

Hi Dmitry,

It seems like the usage of round_up() here might be incorrect -- the 
docs say "round up to next specified power of 2".

Maybe we should use roundup() instead here?

The rest of the patch LGTM.

Thanks,

Jessica Zhang

> +					stride = round_up(stride * 4 / 3, 256);
>   					y_tile_width = 48;
>   				} else {
> -					stride = MSM_MEDIA_ALIGN(fb->width * 2, 256);
> +					stride = round_up(fb->width * 2, 256);
>   					y_tile_width = 32;
>   				}
>   
> -				sclines = MSM_MEDIA_ALIGN(fb->height, 16);
> +				sclines = round_up(fb->height, 16);
>   				y_tile_height = 4;
>   			} else {
> -				stride = MSM_MEDIA_ALIGN(fb->width, 128);
> +				stride = round_up(fb->width, 128);
>   				y_tile_width = 32;
>   
> -				sclines = MSM_MEDIA_ALIGN(fb->height, 32);
> +				sclines = round_up(fb->height, 32);
>   				y_tile_height = 8;
>   			}
>   		}
>   
>   		layout->plane_pitch[0] = stride;
> -		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
> +		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
>   			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
>   		layout->plane_pitch[1] = stride;
> -		layout->plane_size[1] = MSM_MEDIA_ALIGN(layout->plane_pitch[1] *
> +		layout->plane_size[1] = round_up(layout->plane_pitch[1] *
>   			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
>   		if (!meta)
>   			return 0;
>   
> -		y_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, y_tile_width);
> -		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(y_meta_stride, 64);
> +		y_meta_stride = DIV_ROUND_UP(fb->width, y_tile_width);
> +		layout->plane_pitch[2] = round_up(y_meta_stride, 64);
>   
> -		y_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, y_tile_height);
> -		y_meta_scanlines = MSM_MEDIA_ALIGN(y_meta_scanlines, 16);
> -		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
> +		y_meta_scanlines = DIV_ROUND_UP(fb->height, y_tile_height);
> +		y_meta_scanlines = round_up(y_meta_scanlines, 16);
> +		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
>   			y_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
> -		uv_meta_stride = MSM_MEDIA_ROUNDUP((fb->width+1)>>1, y_tile_width / 2);
> -		layout->plane_pitch[3] = MSM_MEDIA_ALIGN(uv_meta_stride, 64);
> +		uv_meta_stride = DIV_ROUND_UP((fb->width+1)>>1, y_tile_width / 2);
> +		layout->plane_pitch[3] = round_up(uv_meta_stride, 64);
>   
> -		uv_meta_scanlines = MSM_MEDIA_ROUNDUP((fb->height+1)>>1, y_tile_height);
> -		uv_meta_scanlines = MSM_MEDIA_ALIGN(uv_meta_scanlines, 16);
> -		layout->plane_size[3] = MSM_MEDIA_ALIGN(layout->plane_pitch[3] *
> +		uv_meta_scanlines = DIV_ROUND_UP((fb->height+1)>>1, y_tile_height);
> +		uv_meta_scanlines = round_up(uv_meta_scanlines, 16);
> +		layout->plane_size[3] = round_up(layout->plane_pitch[3] *
>   			uv_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   	} else {
>   		unsigned int rgb_scanlines, rgb_meta_scanlines, rgb_meta_stride;
>   
> -		layout->plane_pitch[0] = MSM_MEDIA_ALIGN(fb->width * fmt->bpp, 256);
> -		rgb_scanlines = MSM_MEDIA_ALIGN(fb->height, 16);
> -		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
> +		layout->plane_pitch[0] = round_up(fb->width * fmt->bpp, 256);
> +		rgb_scanlines = round_up(fb->height, 16);
> +		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
>   			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
>   		if (!meta)
> @@ -139,13 +129,13 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   		/* uAPI leaves plane[1] empty and plane[2] as meta */
>   		layout->num_planes += 1;
>   
> -		rgb_meta_stride = MSM_MEDIA_ROUNDUP(fb->width, 16);
> -		layout->plane_pitch[2] = MSM_MEDIA_ALIGN(rgb_meta_stride, 64);
> +		rgb_meta_stride = DIV_ROUND_UP(fb->width, 16);
> +		layout->plane_pitch[2] = round_up(rgb_meta_stride, 64);
>   
> -		rgb_meta_scanlines = MSM_MEDIA_ROUNDUP(fb->height, 4);
> -		rgb_meta_scanlines = MSM_MEDIA_ALIGN(rgb_meta_scanlines, 16);
> +		rgb_meta_scanlines = DIV_ROUND_UP(fb->height, 4);
> +		rgb_meta_scanlines = round_up(rgb_meta_scanlines, 16);
>   
> -		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
> +		layout->plane_size[2] = round_up(layout->plane_pitch[2] *
>   			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   	}
>   
> 

