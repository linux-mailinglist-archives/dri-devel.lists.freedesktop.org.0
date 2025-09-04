Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8ACB44A5A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 01:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF76910EAFB;
	Thu,  4 Sep 2025 23:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dJ5x9/nD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D358810E347
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 23:19:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584JA18Q023899
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 23:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uLamEPOoB01f6VolYXkg33VIoUWF3PW3lIXHLO79ORM=; b=dJ5x9/nDwqG0I6nG
 swbb8GiZTVtrD56ZTwIxLLIiuVNeDZ8Sc1Y61i0vOAyqhpBwmNMmVZIAfzslWWQr
 60uHkHujJSkMDb34pNGdci5ha/9K4O3u4rQPWHM7LX3V3aPoBz1NLT8SxkziKNcf
 b5kBirlxilwwF7Ti+OCxUHL0SvrvgrqRs8DCHqsapazATKeLFuhX3iRehFaHrXDg
 DWQ4oKbZt9PJQGC1Ppfzn7osLpOj5LjDZNyWyirm/8SviFNp8cbqFSAGnkgKmLVm
 WFt768rDvUC67QQU4hbSp2c+XsiwUse5SkUR8IFMK0E/R4XT67f8xZG2CRPqeOfV
 3a8Y0w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fs0gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 23:19:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-329dca88b5aso3258463a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 16:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757027961; x=1757632761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uLamEPOoB01f6VolYXkg33VIoUWF3PW3lIXHLO79ORM=;
 b=tWh34Ci6rkjwR4oNw5Nx3w0ziybyDoQ2/O9RMMxcMR3Q27r4RZEY+35OfBSSNaWnyW
 iCerqu8sFTP1cHr7I1kEQxGvJpD2Hd0QkOuFZtsSTP2XyElPvYLVMbRJHycAxuQQqD72
 ZY3GgBOST7I3Up2w0PeTUuuaOBQwUH5kqmWN4GKDZQ5wqHiSLjo6tduY14W7ZGEGLw9F
 k4+Dunlry6I8jL6IUEoedmaa8JgTMjFeBBW4+Kg6mHvtZ9gSWEouytPKTkmiIMM2juzv
 B6S5OxxB6AorOkJ998D1DQzeACV0hhTWI9FzHl97z2b01RKPYjtn94KVjhJ1oiXr41f2
 mkgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW38R4MflZOWyHMNvUP7oPLblrHdGh7aYZ66T3hXpIq12Gife38+JavDiDxCRb6g7sdku5SphTqlbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+kziCqGtJJPpOmKuUmLkE/hkmdyx+3kb6tAhUTJ1UTN7/GhMY
 e8N0d6U9JqA+Wl0sMkTqLr5NR6EpnO1X9117Qaz+I6vX1I48f5/l+1xDvtHJqvP90ia60bvzVJS
 U+SNcgmLFeTqsE5OHRjd0SWAWoMOu7GdXWW/oMTPliDiEmlAkws/qL5FTWpImEGpmchhoCHQ=
X-Gm-Gg: ASbGncs5ZFZHRqRHbHY4wGqwj7Dfo8fpu43oh5hQaUEE8K2wtSnj1LeTiLwOnICQIZY
 R62IQ5WEYlX5M2OmObOf5hDN/2NtKsE2k4poamYajGEV1bqvDbjOBNNreZKeG1QYHxVGGrYrdYL
 kdEzh8iqmORofuxWAJV4whe5Nh7tQGYOS2bEL9oBv68fZVqhc2bP3knP0Hy8XQCUwvwlshG28zg
 a0T47dlfUu2+RUFBpRKzUVS5r8fQo98++tv9i9fNl0XBroXjeVUxgwl/waFstzCafEFd62j+kUt
 1G4TFrNBKnYU3O2lwACpNYS5dXLPqwKytfsyqENNnAestCe9mvaMSGUOeAEJkV5/Yr/Lc9x0R//
 LYmpsQvtqThgNR+rycK2KXg==
X-Received: by 2002:a17:90b:1dc1:b0:325:4aa4:fbc5 with SMTP id
 98e67ed59e1d1-32bbe21494bmr1348044a91.14.1757027961308; 
 Thu, 04 Sep 2025 16:19:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG14iUJGLqN5Efv5E0YS8iVGtsqzNk5BuOTvAdvDoQ8LeCJbUThTNVtbm48oZSXTCF0CmSDPw==
X-Received: by 2002:a17:90b:1dc1:b0:325:4aa4:fbc5 with SMTP id
 98e67ed59e1d1-32bbe21494bmr1348016a91.14.1757027960807; 
 Thu, 04 Sep 2025 16:19:20 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3276f57ab9esm26872664a91.4.2025.09.04.16.19.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 16:19:20 -0700 (PDT)
Message-ID: <6e8b5af4-c4c3-4354-84ce-5d35475032ac@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 16:19:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] drm/msm/dpu: simplify
 _dpu_format_populate_plane_sizes_*
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
 <20250705-dpu-formats-v1-9-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-9-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX0xBzS2s0ZSpw
 NxDpsXeAs4cfMlWZYhTW8VgE5dzR39h8xqV30oFFSKjZ6bdClrGEPQHJlPenTWXcKFe+AVrLLdi
 CpvxpFHyM7z4nCCnetVH49KY0uQ7Q1X1gHwuCpn947gtLEAjx3ptIiezEZZEJ/PFV4w9GX66M9z
 oGy+jQrDS5a9tNcUringKB0JX3aVTwD6sQR0DBH18B7aFJIDUynKii8hCOXLDJrRbPGAVcU5wme
 y9AqYZ4yRjwV8ZAMfEYee2iJdWBi8r88Ol4/2VjSsDyNLiHRk9gQFvGWV8WK6dL6JMQZpr6xShE
 9q/Q7TjsV1ZYfisyx8j3L08IMaCpd2rzIYp34Ccmz6D+SNLar2O/MaE+CicJy967kFgJcOq5x2g
 DgiHlj7i
X-Proofpoint-ORIG-GUID: 6PtGumAt6kfPulk56SOpmYhHCZiAQKgi
X-Proofpoint-GUID: 6PtGumAt6kfPulk56SOpmYhHCZiAQKgi
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68ba1e7a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=4y6PIlbho9MLiPufaWQA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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
> Move common bits of _dpu_format_populate_plane_sizes_ubwc() and
> _linear() to dpu_format_populate_plane_sizes(), reducing unnecessary
> duplication and simplifying code flow fror the UBWC function.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 41 +++++++++++++----------------
>   1 file changed, 19 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> index 59c9427da7dda07b8e8ee3d070d2dfb3c165698e..195a6b7c4075eef40e7a5d0fee208168421cee35 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
> @@ -95,15 +95,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   		struct drm_framebuffer *fb,
>   		struct dpu_hw_fmt_layout *layout)
>   {
> -	int i;
>   	int color;
>   	bool meta = MSM_FORMAT_IS_UBWC(fmt);
>   
> -	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
> -	layout->width = fb->width;
> -	layout->height = fb->height;
> -	layout->num_planes = fmt->num_planes;
> -
>   	color = _dpu_format_get_media_color_ubwc(fmt);
>   	if (color < 0) {
>   		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
> @@ -128,7 +122,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
>   		if (!meta)
> -			goto done;
> +			return 0;
>   
>   		layout->num_planes += 2;
>   		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
> @@ -152,7 +146,8 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   			rgb_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   
>   		if (!meta)
> -			goto done;
> +			return 0;
> +
>   		layout->num_planes += 2;
>   		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
>   		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
> @@ -160,10 +155,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
>   			rgb_meta_scanlines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
>   	}
>   
> -done:
> -	for (i = 0; i < DPU_MAX_PLANES; i++)
> -		layout->total_size += layout->plane_size[i];
> -
>   	return 0;
>   }
>   
> @@ -174,11 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
>   {
>   	int i;
>   
> -	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
> -	layout->width = fb->width;
> -	layout->height = fb->height;
> -	layout->num_planes = fmt->num_planes;
> -
>   	/* Due to memset above, only need to set planes of interest */
>   	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
>   		layout->num_planes = 1;
> @@ -235,9 +221,6 @@ static int _dpu_format_populate_plane_sizes_linear(
>   		}
>   	}
>   
> -	for (i = 0; i < DPU_MAX_PLANES; i++)
> -		layout->total_size += layout->plane_size[i];
> -
>   	return 0;
>   }
>   
> @@ -254,6 +237,7 @@ int dpu_format_populate_plane_sizes(
>   		struct dpu_hw_fmt_layout *layout)
>   {
>   	const struct msm_format *fmt;
> +	int ret, i;
>   
>   	if (!layout || !fb) {
>   		DRM_ERROR("invalid pointer\n");
> @@ -268,10 +252,23 @@ int dpu_format_populate_plane_sizes(
>   
>   	fmt = msm_framebuffer_format(fb);
>   
> +	memset(layout, 0, sizeof(struct dpu_hw_fmt_layout));
> +	layout->width = fb->width;
> +	layout->height = fb->height;
> +	layout->num_planes = fmt->num_planes;
> +
>   	if (MSM_FORMAT_IS_UBWC(fmt) || MSM_FORMAT_IS_TILE(fmt))
> -		return _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
> +		ret = _dpu_format_populate_plane_sizes_ubwc(fmt, fb, layout);
> +	else
> +		ret = _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
>   
> -	return _dpu_format_populate_plane_sizes_linear(fmt, fb, layout);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < DPU_MAX_PLANES; i++)
> +		layout->total_size += layout->plane_size[i];
> +
> +	return 0;
>   }
>   
>   static void _dpu_format_populate_addrs_ubwc(struct msm_gem_address_space *aspace,
> 

