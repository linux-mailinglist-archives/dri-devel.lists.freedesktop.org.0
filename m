Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC5B449BF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 00:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C810EAF7;
	Thu,  4 Sep 2025 22:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0xc9Hbu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A414310E283
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 22:37:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584GUvT4018533
 for <dri-devel@lists.freedesktop.org>; Thu, 4 Sep 2025 22:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2CGO/REBGrWC8A5KfH2aLIvx
 abm8DykPfCUfiGYyhVQ=; b=V0xc9Hbuhc2tGRsfn1/3nVtLdGG6ZF5yrK5PI/qF
 F4fBSBcRPSy+N8haIrPO5ZPF4qZxuoJkUHSBju52L8A6isYULPllXhVJHH4G0A4p
 x/1uWmzWVvaXbwnJlak2x3kGr8iF0rOxoHPC+ma1IJvhR9bYy+xavTQqjnfw7ivm
 7PXpS2L4kc9OcYFY6kiEfwO/MeSQ2P10zE8Chc/PSjPU1s/g+LYjiqgX3Axl61bg
 wvLf/dNQJJxNSI+HsPCewE91P465xjdZqf8PId4sOE1oUo6nFjdMiqxHPGn09P8K
 1d/Nb4HT4Umlrs78/HwXg3vJ5ImaS6lq3+CRsGK+dEm8YA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48yeburx8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 22:37:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b31bea5896so17528631cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Sep 2025 15:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757025439; x=1757630239;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2CGO/REBGrWC8A5KfH2aLIvxabm8DykPfCUfiGYyhVQ=;
 b=HRztbTIjTNCYTUDmfseVNOXidaUkl8GAGmM64lwshY09eSPIuRZ5jzpzwKvkn7KQxa
 r5IiOtCximsSE+8nFH2ipdD7Rq1/BKn3H+CMdLBSGsn64be0sbTTU/ry+HfOlAChWDFH
 ST0TzIYI8yzGmRjznLY/kqidkT6mATorfd9Df1neVzSzqX1g7gR6AjFUlUTBjpREl4bS
 UQ4Ett04i/aEpfc/EUdB1hcV6QvLh8MFdJ+q4UNQqDJoeNvaavrE6TCxFiLMbIVoFuok
 D9v5sTEEzYwV0xOV5L7v3U6por7D3vbEJNaBX7ASXxl2w2XeNN4CB5cdYnIRsHAoxaKk
 lzkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwLMAem9FeKvQ1wCTzDGvdoMZoFjB2q7L367IEsCAxdtM7jN7PAVz5tFGZ25UEseHglktg4J+ZT7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2Le6iekb4OQucoCR8wRT90nr5J1g8uxd2wNO6gs7X9KoljrXJ
 wfUE8/qpY+6yEDJnnoVHBwc6buXf5csN50u63kfmTnwcKi5SP/KpUtWOCdCJZqtNFpcHcldy/YP
 n8AUOFGOGwd/7Z6olwxWBNciDK+2NIEu/ENJ7q9V2tysRG/IDx3LjXzVbECA2qYinlPZDupM=
X-Gm-Gg: ASbGncvsviuYRoz1XMVFfg8mqOScUiurmZxBP/WwbNdA6WNB7DOjPldo+a28qcRMaAu
 9+TvEiEPECK7T2V4Z/flyNFoqWlmA3QjY49CsCsGlhR/sevTesEQfXZ/AbE4jclic4K0jF7rnf9
 X4cMBhd6zRdJZBriM4HTyb0n+DYt4tfPHyVeQHmHRk6AUzesUyMevB722uos7mqLd6UorCrS8si
 sL57SDvJJSfW78LT2fxWpfvngq4xVNQ5rcqtaR9Rm+qsC0ifWuhZ6bAoeAGdocJ/HhTgqZMOqVh
 WKceQlcJzmYxtjlt+bUY6vMcGDbcHDfhrlCGE/GNsy5BtTsbn7W9S2NcdLni5sjKXqheZYbrK5B
 mresL0y4ntG6Qx8luvU+Zq9L+6r8gufqmNvqiLO3BNxAZW1HdzCB2
X-Received: by 2002:a05:622a:8c9:b0:4b3:14c:e0ea with SMTP id
 d75a77b69052e-4b31dcd5f14mr281730621cf.79.1757025438777; 
 Thu, 04 Sep 2025 15:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGRkrckqsL6cuoIERBEUVjYou+AKsBsGMaWClqZwQ9jBr3qfnwyiCR3nprT4Q6fdcGeWHpwg==
X-Received: by 2002:a05:622a:8c9:b0:4b3:14c:e0ea with SMTP id
 d75a77b69052e-4b31dcd5f14mr281730261cf.79.1757025438335; 
 Thu, 04 Sep 2025 15:37:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace7e2dsm1443558e87.69.2025.09.04.15.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 15:37:16 -0700 (PDT)
Date: Fri, 5 Sep 2025 01:37:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/12] drm/msm/disp: pull in common tiled YUV format
 parameters
Message-ID: <476yq6wmrjfcejmuf65mlimwnly6pmjjetlj3fmkvfypifwgke@uqdvmdovwnhi>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-7-40f0bb31b8c8@oss.qualcomm.com>
 <cd389c5c-b290-47e8-a374-63ad1ae886df@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd389c5c-b290-47e8-a374-63ad1ae886df@oss.qualcomm.com>
X-Proofpoint-GUID: ceXECUkhUqZ_XAWajcLPSk4H87aRLkSv
X-Authority-Analysis: v=2.4 cv=X+ZSKHTe c=1 sm=1 tr=0 ts=68ba149f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8QVSaPe9EzaLP-9jffwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE2MyBTYWx0ZWRfX9QSfIPcnkBwT
 ISrMkSgi97zxEzW0I4Es9z8XoPZ5W4ABCTrxxvyEGWBoOD/HcemKJUPUpIHyJnk985lJqdxKijW
 Z5mRTqg6U4X6Mp+1UtXW1Nu+/q2XId4krPTUw2XZA69jBRR7foWCcWBi0AOzfuRBLwwE0Ozk88P
 RxjgOq8YLLhUP3PpZdohmqmThVahDhltBnVH+wzArmpzyPN5PIEYRoZaKrMU5UNChY9MLVQei2y
 niFwtP1g1TGY9b7MQxppPn1IBrI4vsZKXQA9uWm69grcYYIXS5Jn8+Osolia9loQwI94rRCMqGH
 g4nfNOSFCqtrlCYqLgq77g99zywSidlWHWKgqHK9EVgK0GCe9+F2M0ygPydt+kqgCGhmbYYvpYF
 bQ5cckLK
X-Proofpoint-ORIG-GUID: ceXECUkhUqZ_XAWajcLPSk4H87aRLkSv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
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

On Thu, Sep 04, 2025 at 03:22:55PM -0700, Jessica Zhang wrote:
> 
> 
> On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> > Pull common params of tiled YUV formats into corresponding macro
> > definitions, simplifying format table.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp_format.c | 28 +++++++++++++---------------
> >   1 file changed, 13 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> > index 900b2de252a6eb2eac3d0670f1aaa77f7520fd77..6f5af26d4e2d43414281197bf541e1ea3fe211f5 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> > @@ -284,8 +284,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
> >   	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
> >   }
> > -#define PSEUDO_YUV_FMT_TILED(fmt, a, r, g, b, e0, e1, chroma,             \
> > -flg, fm, np, th)                                                          \
> > +#define PSEUDO_YUV_FMT_TILED(fmt, r, g, b, e0, e1, chroma, flg, th)       \
> >   {                                                                         \
> >   	.pixel_format = DRM_FORMAT_ ## fmt,                               \
> >   	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
> > @@ -294,13 +293,15 @@ flg, fm, np, th)                                                          \
> >   	.bpc_g_y = g,                                                     \
> >   	.bpc_b_cb = b,                                                    \
> >   	.bpc_r_cr = r,                                                    \
> > -	.bpc_a = a,                                                       \
> > +	.bpc_a = 0,                                                       \
> >   	.chroma_sample = chroma,                                          \
> >   	.unpack_count = 2,                                                \
> >   	.bpp = 2,                                                         \
> > -	.fetch_mode = fm,                                                 \
> > -	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
> > -	.num_planes = np,                                                 \
> > +	.fetch_mode = MDP_FETCH_UBWC,                                     \
> > +	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT |                           \
> > +		 MSM_FORMAT_FLAG_DX |                                     \
> 
> Hi Dmitry,
> 
> This sets the DX flag for NV12 when it previously wasn't being set. Did you
> mean for it to be that way?

No :-(

> 
> Thanks,
> 
> Jessica Zhang
> 
> > +		 MSM_FORMAT_FLAG_COMPRESSED | flg,                        \
> > +	.num_planes = 4,                                                  \
> >   	.tile_height = th                                                 \
> >   }
> > @@ -623,19 +624,16 @@ static const struct msm_format mdp_formats_ubwc[] = {
> >   		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA),
> >   	PSEUDO_YUV_FMT_TILED(NV12,
> > -		0, BPC8, BPC8, BPC8,
> > +		BPC8, BPC8, BPC8,
> >   		C1_B_Cb, C2_R_Cr,
> > -		CHROMA_420, MSM_FORMAT_FLAG_YUV |
> > -				MSM_FORMAT_FLAG_COMPRESSED,
> > -		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_NV12),
> > +		CHROMA_420, 0,
> > +		MDP_TILE_HEIGHT_NV12),
> >   	PSEUDO_YUV_FMT_TILED(P010,
> > -		0, BPC8, BPC8, BPC8,
> > +		BPC8, BPC8, BPC8,
> >   		C1_B_Cb, C2_R_Cr,
> > -		CHROMA_420, MSM_FORMAT_FLAG_DX |
> > -				MSM_FORMAT_FLAG_YUV |
> > -				MSM_FORMAT_FLAG_COMPRESSED,
> > -		MDP_FETCH_UBWC, 4, MDP_TILE_HEIGHT_UBWC),
> > +		CHROMA_420, MSM_FORMAT_FLAG_DX,
> > +		MDP_TILE_HEIGHT_UBWC),
> >   };
> >   const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
> > 
> 

-- 
With best wishes
Dmitry
