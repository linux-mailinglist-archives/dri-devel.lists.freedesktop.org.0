Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B76B4497A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 00:23:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3787B10EAF5;
	Thu,  4 Sep 2025 22:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJxRcTlo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5789410E27C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 22:22:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584HeQ7f032207
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 22:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 T6BQ9Pk/W7/QRXtSw70pm2qXXKdryxxnOLt/6BC1K9c=; b=mJxRcTloftSiJWaC
 /l20kdxZrp9R0Kem2AeMIFksKtFCi0f7wb7qPg3g4AoQG0QltOxyjOvoltfH58Oi
 DTpQoCG8iVrAJwKw/C7gEPJtjnC7L9/h6ic/fA+G3Wg/98vTKHvSY894NbUbOWKm
 XfBh0xL9JPlul/ArlA3aG6eppHBUsV3cN0TQNK3BZq6HZddk1LSQVOaFggvXagD6
 ZxCvI6RQAXdsIarsL0YJSlNZHwB4ISpluYTMy22Xw0pBWvqvgmOpkU9AzNfKxE6V
 2n/NFhmm1JbnW74ahUUibdtgfZjl7yatJaQZy7ZPDH/sBCWO0Q1fji/pU/G9ijI3
 K8frtw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnph7r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 22:22:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b471737c5efso1055546a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 15:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757024577; x=1757629377;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T6BQ9Pk/W7/QRXtSw70pm2qXXKdryxxnOLt/6BC1K9c=;
 b=ldAhNhRHPgkr6j6yOK9bzwFXFYVKdWybA7/V7eX2Rf1R85Cj2IXVj4QKNuIEkciAGC
 G/7CPtpMK1WcGZdu1QrrdG3a5FMDUqvC33ZG8YfHvYZxTTF1p8TMu/Y1suLZWatZ7oxt
 4P2ZvJIrrbbUEvhyD4xwMVJ3pa2LHMgBW7xPWGNt1XjFpqnc37FDwRexYLlD8wLIt9Ph
 Ea4Vjd2t1gxydfwLxbLuN+u/b5iLbVPRigIr8+4543JWZ4srD0DcooomBo0eTwSm57TF
 Oaphb8oPTdDONMqLvd9MagQDkcOewFD1jq90+g43eTMJDhIdewGwF5Sm65JpFr8UuVWB
 FXzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAXQQsVTtgutTApLcJm7gxEIu0G6Dz3dTrSYJOPmeYncLV3NzeE+XWL5F5etIEMHbHwStXW61uljE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2V5HX5HJsGfvokQUjKCn9NB6iBO4E+NopOyVxxEO8llhEM5aD
 BKNcy96YWbVhT6o4nJiXYxWc7R1Dq/b6Aq8X5JbL9XoO0RHYD+W1rBEL66WhvwMIOVaVNDZ9Udo
 4vyU3s2/uplTwS3AtIJxh0J2grdig+/NFDyyJwNTTCCU/vf6luA4vvS5B7OaVgF/Zz1LB4rM=
X-Gm-Gg: ASbGncvKpFaT3wDgWZlKHoAQyILF+Owt1RH15BaO85F+F9CjCYWuISTLXPd+M4aUwTn
 5jR8TdE1NcZfDHWH8jB57WSO3/FGJq4u5z1uLdMb11NzcVzYUtyyI7/tRDUaz2w5zxwZf/anhhO
 JvrmAFzWCJfYbJk+aEx0XTP5oOqE6Ra8oxD4jsCQPVeifwbhOi5cqeTAyrJvfN2TKFmA/Arj0NP
 1N2NXYysu9N1u52WtNi8pahBgFEcjVN7rvo20bUDkKJA5DRreLEidVv/7xUx3A3/GEWLIO7TaaZ
 JPCWzarESrv04K529ZG/AGkEmHth9NdaxRRjCA3B7awemNKEF9AbK40qFncgEUmfUAmzAM3f4Ts
 ineKjLHNTnHCvtzANLKphCw==
X-Received: by 2002:a05:6a21:33a4:b0:24e:84c9:e9b3 with SMTP id
 adf61e73a8af0-24e84c9eb66mr1434640637.23.1757024577023; 
 Thu, 04 Sep 2025 15:22:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXk2IILCRiDCwe85NGpxmu9U8/4IpQp/VXSQsdCKv+Z4yDzlFW4SikH0f683nftipIhLfVHg==
X-Received: by 2002:a05:6a21:33a4:b0:24e:84c9:e9b3 with SMTP id
 adf61e73a8af0-24e84c9eb66mr1434621637.23.1757024576572; 
 Thu, 04 Sep 2025 15:22:56 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4f2c990296sm13300475a12.39.2025.09.04.15.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 15:22:56 -0700 (PDT)
Message-ID: <cd389c5c-b290-47e8-a374-63ad1ae886df@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 15:22:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/msm/disp: pull in common tiled YUV format
 parameters
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
 <20250705-dpu-formats-v1-7-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-7-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9rbzVvBamOjwBMZZ2ZoAReBxT-9eadfe
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68ba1142 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=AtzOqZUtkYz0lm2cLFcA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 9rbzVvBamOjwBMZZ2ZoAReBxT-9eadfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfXz3UjvWjFyeYX
 gPc+Qj6YzWXg2drfD26kPPnMrBklM3Mb99rN6Z2hwgT+i7kF+b0YlyUNaP67CL5uvsfyBgAB6l4
 ySO9Nkla2PFCue4QuwNTAZ1SYGvASCDW9zuP6+sRHDnnN5SICxopKj4SmRdDd+Xc7arkP59vfhI
 tFtV9CfZCykVjb2wOoGLBEt3vIZLZb+iB+acKlyj99YxWTxb6yv7diBQ4RlDxQsyE2KN1qyNboM
 3e9RCHTY+MsdWylJsEToca1e6U5RByBZLyz8FhXU/zlKdL+81hbqW/afIrWD0VIMsgryMVZQonY
 rlUylBDfUUAZkSvvhQmpEre/WAbanC3LoW2xB8ZCSTpRMr4+l2PjX3n4270thau+VF/e2M7efAD
 mjQJ7/6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_07,2025-09-04_01,2025-03-28_01
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
> Pull common params of tiled YUV formats into corresponding macro
> definitions, simplifying format table.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..6f5af26d4e2d43414281197bf541e1ea3fe211f5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -284,8 +284,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
>   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
>   }
>   
> -#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
> -flg, fm, np, th)                                                          \
> +#define PSEUDO_YUV_FMT_TILED(fmt, r, g, b, e0, e1, chroma, flg, th)       \
>   {                                                                         \
>   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
>   	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
> @@ -294,13 +293,15 @@ flg, fm, np, th)                                                          \
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
> +	.fetch_mode = MDP_FETCH_UBWC,                                     \
> +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> +		 MSM_FORMAT_FLAG_DX |                                     \

Hi Dmitry,

This sets the DX flag for NV12 when it previously wasn't being set. Did 
you mean for it to be that way?

Thanks,

Jessica Zhang

> +		 MSM_FORMAT_FLAG_COMPRESSED | flg,                        \
> +	.num_planes = 4,                                                  \
>   	.tile_height = th                                                 \
>   }
>   
> @@ -623,19 +624,16 @@ static const struct msm_format mdp_formats_ubwc[] = {
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
>   
>   	PSEUDO_YUV_FMT_TILED(NV12,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C2_R_Cr,
> -		CHROMA_420, MSM_FORMAT_FLAG_YUV |
> -				MSM_FORMAT_FLAG_COMPRESSED,
> -		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_NV12),
> +		CHROMA_420, 0,
> +		MDP_TILE_HEIGHT_NV12),
>   
>   	PSEUDO_YUV_FMT_TILED(P010,
> -		0, BPC8, BPC8, BPC8,
> +		BPC8, BPC8, BPC8,
>   		C1_B_Cb, C2_R_Cr,
> -		CHROMA_420, MSM_FORMAT_FLAG_DX |
> -				MSM_FORMAT_FLAG_YUV |
> -				MSM_FORMAT_FLAG_COMPRESSED,
> -		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_UBWC),
> +		CHROMA_420, MSM_FORMAT_FLAG_DX,
> +		MDP_TILE_HEIGHT_UBWC),
>   };
>   
>   const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
> 

