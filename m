Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855CDBC6561
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF31610E8A2;
	Wed,  8 Oct 2025 18:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ShAk860b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD9010E8A2
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:49:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5SlH003269
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ODPOfu15xqG3giQgLQz8qy9q
 u7JTNTnroFNBqpeEc4M=; b=ShAk860bLdkRDmTXy9xSkwY5CSyE5qzM9u9Obzk6
 rcDMUNkLFauoBMVVA0bati67BruEFTLu+I0S+xLFxerQOU1DCmvejBHTC7Dgf3Eb
 jOxUu/ewFeqQOnp6J451/oZUU0GRrFT9b+wVB91S+CUFfeFX7Azmw1MxFVNoK/xp
 ncWA0gbrsrP/Tv0LiEzhbWjnAIkTuW2GpqvogFJxs+CIj1CxezZi93lUHg9KTBwR
 r3hSgMPJqvmk9tghmfuhKe9WAhIYjaWkTuUt77W0pf71mpfE1hlDs9W9r/2nvZ7s
 f1ofXV2SW18ZmrtMQ4ZW2ZgNGUlT/qhxK9e8ew2Zi+eqhw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m09rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:49:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4de53348322so7399861cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759949341; x=1760554141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODPOfu15xqG3giQgLQz8qy9qu7JTNTnroFNBqpeEc4M=;
 b=lE9XKrTdowim4cIMMTWOw5IZm2xg4R5/NDNLHNkacOvU/mckmjnVWFp2ZD1H91fbZd
 apXCr8lUVDYOgiMJoKi9Y1IAiCSFFKWIILEZ2m8eH5e4i0/j8xbp/uI9162eci9oECSZ
 CRTL6CdhEJltd9ppVRB0rZ8L0LpYb0EQJaEhwvaDzEUw/PNwMUnzZ86CEjg0gvioGSMZ
 5sEZN/oqHHS0eJ11j0RlVYj0T520uVaSRMWU+mqwNc4j0ySeXrmJt+LD7itnSG3HEny3
 nWL4WYVcSU5jfGPU4zP8APxh7AWxXzam0x/gKNzOz/V9hzPuX8avp5mJetQ+LtMIfjpK
 QpQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo1BtN6cbfyJdAnonHVobNwIDQB97ClvIxjGDZj9+16o5bOyM2Bq5OIlCwJHrx5InpisH6yaUUies=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeSLBxMxdJEl7Na6dcpLM0I7VCRNJLYY6tJEY2q9l+Wd5yUI4y
 u5DRd4qF8SU4KUAqAbRF22Gjy5cYU5TsaIG3zxW509OqKGe0nDad3R2DRkb3p8YxU/lzLItQZw3
 Ni5bHDXiKs2cY0Tbwrd2LHrFRaulGLRaDORLrGgXOG0q9YEG8rujRw7uLX5WRFbsct0hrlBE=
X-Gm-Gg: ASbGncvZCGcryMKeN2qfolFNgOYCFgBZncDX7mqYwI1qwYxeir6xAfGA8pHka58Ai+Z
 wmT/iWRHktl0Chn5LPgH+zht0SN8aUwf7Jq/7hiwKdHu7YeZN46w5OopppzJQM2JNl+XF2Jl+oK
 7wiMeYMlvtO+UEBBfc73N3lQmFUQgFGsMLHHMIAX3pVnLKxtMvcFRS1YO8riqNoJoG3iHukPQwi
 UjMq1BiMqU3gv+fGZ1haR82QSrAj79HdSMM8Sr9/oNDjFDLDZusBK01XC6BMGrblxJFpdBXDFEl
 ilefV+I8I6ElNh4L5mwQlFD9LqRNMNqyiUXJxN6+vyVUy3mp0mlcKm2Wa4XIH0QL9gKF9YuVi3R
 zomlDgT5uJr1HEh3HlwqVZ6TSh/UxEjkw1q6RHkxYEqVFbXu2nz7F+T0Q5g==
X-Received: by 2002:ac8:57c3:0:b0:4de:10a5:2c7f with SMTP id
 d75a77b69052e-4e6eada7dfamr74153991cf.84.1759949340735; 
 Wed, 08 Oct 2025 11:49:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB3TEGZ+Gflu/39qNY+/p7xX+0/YYfiskGcmubHdrhtp3slU9kmFASOY5QbLqqoFf3Gd89DA==
X-Received: by 2002:ac8:57c3:0:b0:4de:10a5:2c7f with SMTP id
 d75a77b69052e-4e6eada7dfamr74153531cf.84.1759949340077; 
 Wed, 08 Oct 2025 11:49:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-375f3b833d2sm22261501fa.51.2025.10.08.11.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:48:59 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:48:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 10/16] drm/msm: mdp5: Switch private_obj initialization
 to reset
Message-ID: <m3c3thrjbajskitjnkktmvp624v7qqfyluggcbmol5axvjno5n@aqnqk5nsu2zw>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-10-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-10-805ab43ae65a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwVdJxwdjPY09
 AISi133RLmrmW/d7o1a5SBowpO+8cEiyr/2SPXpR/QyW3+G77xZ+RqSKtPGVOQO0eBsKqHKfAKS
 PAzWTC0QdOjV2FailU7+Dr7iB9EiXx4T9D7ZEyiLYzSj9TBgBQayXy2jdz0+BYuBjgUbG9Q/cy7
 0qdd8Z8VsCbKZVTSyu1+DEjX6hvlbRXOKb+kzlnfK5CS4ZXhyHSfiZCXPeJJPbObvXZL0cUkegc
 XU27znEOsOoM6QYOa8jXbYDiQhACywY9VZrFCjucKK/WYKgIIavpqM4fzdLA9F26jsX6x6rJTR3
 LhXG+zZUc95zT5HbnIDHMmFpM+PBRoyBOmZZZeGzAe73Hjg6NjDkFt7DUbcpBeb3ZkOYzqtatQ3
 5TF4oOkmqzSTlrO6/oRoe5jqT9lYMg==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e6b21e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=MY5GpsA41Snrp9pqcaIA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 7_4ML22BiwoYukYEBzwsQKGVC_LVQpoF
X-Proofpoint-ORIG-GUID: 7_4ML22BiwoYukYEBzwsQKGVC_LVQpoF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Wed, Oct 08, 2025 at 02:04:08PM +0200, Maxime Ripard wrote:
> The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a reset implementation, let's migrate this
> instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
> 
>  
>  static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)

static void (up to you). Or just inline it.

>  {
> -	struct mdp5_global_state *state;
> -
> -	state = kzalloc(sizeof(*state), GFP_KERNEL);
> -	if (!state)
> -		return -ENOMEM;
> -
> -	state->mdp5_kms = mdp5_kms;
> -
>  	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
> -				    &state->base,
> +				    NULL,
>  				    &mdp5_global_state_funcs);
>  	return 0;
>  }
>  
>  static void mdp5_enable_commit(struct msm_kms *kms)
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
