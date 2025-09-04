Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5095CB448A1
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 23:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A65610EAEC;
	Thu,  4 Sep 2025 21:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdqixAeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7221D10EAEA
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 21:35:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584Iapda023895
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 21:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1XSGHjK5H5x+hvh6MnHParrtMNDsdad7xw0PkjMbZ+g=; b=mdqixAeoCJkWbooj
 iV81lDSVcjKJFNLnue60LYvsuNufsVhkyrkaHuZjCQ6xdYNP0O0KXjdv9VSrg0/Y
 2U46AT+05RG7V4DeTZRgeoss2aKXORmiJ4Apy79wl7F1DhF1jUfQLRjU5aiN8+EY
 8iOhu7ngq99teEifZeWsPCbYCe/Ow7tt710HQu6FDbfMfV6htbPCgfNXasAwRtYZ
 OEa4srooUnaggtqJ+z6gYfZHNtB7slNFqhoA2PL2fVx5SYXD6fniBIyhfbIesPX+
 SYYWl3K4zlwSwj0RUJWjJzlu6Q8biP0dNmLR2tUn4FF1+45ELwPLftvheg1mu9Od
 /9Nlsg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2frsx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 21:35:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32972a6db98so2027039a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 14:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757021715; x=1757626515;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1XSGHjK5H5x+hvh6MnHParrtMNDsdad7xw0PkjMbZ+g=;
 b=gNor0eyXntMELrb6WIoqKdOY1xzGDUEMRHAqdHlAzhBGcAh+8DEwKDTace9Ua32Jym
 AJ0gIUbe9Cu9cjz1V7/h/E2koGheRDneqbNESPpmO/GApj9CHZ9eMB0XyPiRIJMpST7N
 R75d2pXy8KLAIyXUyVkxaAsy6/ld2jn/kQBzPgp9ZavPnzKbwlwQZzBQCjK+vD2pm7MV
 guR1iABz412OSs8j79bSyJ8v5pCHtJzrlBXOEs+O9qB6MOiUWMzaYa8GFJPYk70g5ePK
 XOFd5WWjb4bAnXCfwb66QokBqzF2Ipa/M8IO8J7t6HuptNPGqY36y8nzAhu0AMQO45bA
 B0Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEF9pO+oZ5KzgSF3/N6SSw2UDhfpAMERU7CJrry3+/O1E4gIdeg4HfFb7tv6/QvhW2rgmxlyThn4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8V4VwGKYdHi0o82sN2K0nJs4tFSvfTplqBUmViQhQY6OHlkUv
 k1LplmTUPP4xxDaMQzaBYvs8sxg9QHe/ivgCvJoz/kfNYoZIJt0yn0kQ7UgxJ9jn94kIBrvcTaK
 69P5qHSiVNBlYFsLez87ZTt8HM/i7k2WsDEhBXWVH4S3ycBV04DhJBGGCPlGhDq3qghFIvd4=
X-Gm-Gg: ASbGnctX3oYxiVCebtiDbU8twWQn46jrQjYSLhSC65r0QfGeLwFr9391JIFbYdFq2jT
 aO51WKbkW8ky6UJREjmarxvhfMKszhPTJcGPcgpROfSVvvx80Sens51NnPUDCstitOa7LFHD5TG
 dw1O/d13N5xnIxH7UEIakTU1aUCvI8FWDZ4MStw/zGhP99f/2D/ZPiOO8P+dg54qgzB+pJk0omK
 CO9D3WmMXCxgLGrSHGWUhv6PCi4eRwmycXI9+ZjVhDAKjvTgc/EIGnifE6ltAR9UIUXqck1z/FM
 9tU0U0E/gALeXc/M4CNcWV/Zrz4445JD9CT1MOT7SNl/Xf8hDTQaTTTO8+yEfOsSD+ctdNHUa1U
 oRxEzcZP6R3ahMEQzy4fu3Q==
X-Received: by 2002:a17:903:2383:b0:246:570:2d9a with SMTP id
 d9443c01a7336-24944b1fc6emr283192315ad.59.1757021714797; 
 Thu, 04 Sep 2025 14:35:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp3igpntYcHLO4XqweUiLyIuxXfhO1KED/bu92vbMqGflTJz2eGcJkzb2pbmcEUuUIo7WMCQ==
X-Received: by 2002:a17:903:2383:b0:246:570:2d9a with SMTP id
 d9443c01a7336-24944b1fc6emr283191985ad.59.1757021714309; 
 Thu, 04 Sep 2025 14:35:14 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ccd76e157sm22652365ad.107.2025.09.04.14.35.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 14:35:13 -0700 (PDT)
Message-ID: <c80e6933-8985-4da4-8498-66cedaa87b1f@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 14:35:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] drm/msm/disp: set num_planes and fetch_mode in
 INTERLEAVED_RGB_FMT
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
 <20250705-dpu-formats-v1-2-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-2-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX0osthSivAUI6
 xXgnKFCwdz7qy/3imMjkCRupZ197mLYTqMegsdZYp0YjW4CHgkqHoeCHyJUrSA2Uq4zuBaawX+K
 xHebh1vGH7wx7U6VCkrZ9X2GLj3Q4a8uIybyXFssLALr2niNg1TJpOEVNHsoBW3kwJ1NAfip6/C
 RSoqYPCZKnCTjsdCmXdaS66uRb3JEaP6sjND1nJvpRFpol91GfpiurvBVnF7mKwhB1oaZ/MQGvg
 AMuHHAs2Eak6DSkqaqQytVi9p2g4FroQtJAwEZ2BS/0d7xd59tdPqclPGI7o8fVtBcDZTUgFHhA
 MW0+cxHfug34cGb9M0ttlyZDcIRDhcgV151fP6mBEZ95LMx2ARNXd7tI/GM7mSDu6MSGAqyRYE/
 ++ueAAzY
X-Proofpoint-ORIG-GUID: m4-YDzpbTIfsSNd9pX7JHcBBZt5D4Gh6
X-Proofpoint-GUID: m4-YDzpbTIfsSNd9pX7JHcBBZt5D4Gh6
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68ba061a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2YQhiLfsl84BKudLmi8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_07,2025-09-04_01,2025-03-28_01
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
> All interleaved RGB formats use only 1 plane and MDP_FETCH_LINEAR.
> Specify num_planes and fetch_mode directly in the macro and remove
> unused parameters.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 114 ++++++++++++----------------------
>   1 file changed, 39 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index eebedb1a2636e76996cf82847b7d391cb67b0941..26be35572fd2ee7456401aa525cc36025bc52ee4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -67,7 +67,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   #define MDP_TILE_HEIGHT_NV12	8
>   
>   #define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
> -bp, flg, fm, np)                                                          \
> +bp, flg)                                                                  \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
> @@ -80,9 +80,9 @@ bp, flg, fm, np)                                                          \
>   	.chroma_sample = CHROMA_FULL,                                     \
>   	.unpack_count = uc,                                               \
>   	.bpp = bp,                                                        \
> -	.fetch_mode = fm,                                                 \
> +	.fetch_mode = MDP_FETCH_LINEAR,                                   \
>   	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> -	.num_planes = np,                                                 \
> +	.num_planes = 1,                                                  \
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> @@ -228,218 +228,182 @@ static const struct msm_format mdp_formats[] = {
>   	INTERLEAVED_RGB_FMT(ARGB8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(ABGR8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(XBGR8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBA8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRX8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(XRGB8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBX8888,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 4, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGB888,
>   		0, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> -		false, 3, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 3, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGR888,
>   		0, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 3, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 3, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGB565,
>   		0, BPC5, BPC6, BPC5,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGR565,
>   		0, BPC5, BPC6, BPC5,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ARGB1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ABGR1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBA5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XRGB1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XBGR1555,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBX5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRX5551,
>   		BPC1A, BPC5, BPC5, BPC5,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ARGB4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(ABGR4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBA4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XRGB4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(XBGR4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(RGBX4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRX4444,
>   		BPC4A, BPC4, BPC4, BPC4,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 2, 0,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 2, 0),
>   
>   	INTERLEAVED_RGB_FMT(BGRA1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(RGBA1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(ABGR2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(ARGB2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		true, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		true, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(XRGB2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(BGRX1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(XBGR2101010,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	INTERLEAVED_RGB_FMT(RGBX1010102,
>   		BPC8A, BPC8, BPC8, BPC8,
>   		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
> -		false, 4, MSM_FORMAT_FLAG_DX,
> -		MDP_FETCH_LINEAR, 1),
> +		false, 4, MSM_FORMAT_FLAG_DX),
>   
>   	/* --- RGB formats above / YUV formats below this line --- */
>   
> 

