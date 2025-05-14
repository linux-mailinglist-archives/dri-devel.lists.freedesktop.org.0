Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A79AB75C2
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 21:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888D510E622;
	Wed, 14 May 2025 19:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHA/JbaB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D7A10E064
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:23:01 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvQM030342
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mKY2kA0Hg4toLKxTT6H9DxX4
 STNTctz5Vp4Wq2VSocY=; b=NHA/JbaBtrnn8S1Mi7izXk+v+tDAebAEvZrsK2Uf
 q0GBIWoVBmku2nPWQyXU/RqRfyZhPM9MDpGg6YvFcNGsLfbiwnjMMsl3ZGBtmw5i
 3fXrcUH2ezo60TSqGK0aaSFxaMdmOvvhj04EZj+wQBtcidFO/lqqcJJ8vAF5HmuC
 wBr8HlzK6JsKSXod5ZbUC5yI+wdQ0gpsiB7mNixXytmL9QOkzG9FpP3IU7nKhQlc
 rYvNjgaX+FLoAd2oZrKejdzfEmO0Kj3MenBfd3qwMsIh2dpPCT2dZs3ydanmRDvh
 WHJEeynonl7ZBsZWWO9b0wenoVGt8FGxWjA7elO+b5nScA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnuuvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 19:23:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7caee990715so26508185a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250579; x=1747855379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mKY2kA0Hg4toLKxTT6H9DxX4STNTctz5Vp4Wq2VSocY=;
 b=nDTolTUkd5X+wl1fhSwKMTmUI+NTo6nuzCJn2OlEVOSpbODh7aako/5ZUCN+prM5s7
 6p8WqC7ZIwdzXktZSVoyzJ41d/RdNW6SilbtOosrmPwD3rPAKiONXj7aEdCfyFD5IG7N
 1XZlPFU+VogvL2eJKd5veLMPLRjaP7ffZS15RfKKistL+CJRhpYwo8nIgQVevgiUUlS4
 IuSfOIKnlaXi/bk66vJ66VH1/xfBKyBndh20G6M8OJdy1uyNB6qeKBVanRskue72+r/4
 ZkdDOa7tzQK2pww0qDwJYZCGBlOkmwVHeg8/6R1OJjN/FiesQ24h/lJO/XjVY1JnVdim
 Ypbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhXfTE3+AERY4eZEizkXjzSP0iFCeilh9PGnRFp6cl7KeIclr3LBF8Heko9S20rA2anrNUvO3szKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHdO/Ljzb11ScxolWajQGec+cdLq0OTexRVKbOebhXXxk196tv
 dG016x64Bssn/zDqfPe/aBUDjX67bgP+YYhDw1/0/lQ2/eHC0jabWgJH/EMk1jQmV7zj4qUNMGI
 0fo7q+ik23fzVBNLQ3a1hQTxa99CmwQgKzig+icIPFdFiJhaphWGE+KxlI6+RlbYjKoY4naNyRN
 k=
X-Gm-Gg: ASbGncsLDjMuQm3CEMRsh8Mzp3SR8U8pi4OpGtHw2SXPjkXATd6MHsYP6gbRNJkHOUS
 xAdfxvp6/g2DsNcONhT2e73f0t/Y1Eh6MPlvs/DxdXKll5bk3uihlhgFGLfQvVlOzWmnsaMECfI
 zngrlUf2bXmXuWEsLCoI64mBYiFxKc3hbifVm4XSLd+5vn7D8HQ3PPtXZJVxJ2j1faebr/Biw80
 RIVTsY/00C91ONynxrGFbQtbdKBoGuZazcL40AHPt7Da625MyfNZA/+rZhqV/gFWOeFJR8eMKyz
 5Ztf1Dn4YMDH5V69ra7DOGH0Znouz7BPAhnQ0pHqO1EBGP3qGHsFTKjk4PP+lMryPxrOi8KBoR8
 =
X-Received: by 2002:a05:620a:31a2:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7cd28846e95mr586959285a.43.1747250579145; 
 Wed, 14 May 2025 12:22:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYk5rRAMy+pvInB6ryC0ZgCWwQPsPkasd4Ia5p0Xo2g1JVmVd9E35s1zaspBWgK2FjvyRDqQ==
X-Received: by 2002:a05:620a:31a2:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7cd28846e95mr586954885a.43.1747250578639; 
 Wed, 14 May 2025 12:22:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c339a3c1sm21135191fa.1.2025.05.14.12.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:22:57 -0700 (PDT)
Date: Wed, 14 May 2025 22:22:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 11/15] drm/msm/adreno: Switch to the common UBWC
 config struct
Message-ID: <qhmayxvlyz2txum5rs5vaf3iqzniz6nktr4zatru6bhgp6tdah@uq24obw2ro5f>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-11-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-11-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: REcHOU7CoZaBBTg0MFFIZlChl91oxFhl
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6824ed95 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=UGnGT-y4eEc3t3GJXRIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NyBTYWx0ZWRfXz3jQh6LTCU+G
 4Sgmotf8atEm9KYA20axLu5HB+9bq52XTcHV/OueJ1g+XL/RNk0+tPzpM52JAEymZYfMRiZJfh/
 GUim96rH8kq0Z7IbA0Dl8L9C/F1EtbxeY2wbQut/lqlWqqQJs1dH7YY13C9qXXh8XJhX4nqG82b
 cJUUgBxgp3ZQVcHiPJg4BzEoZe/HbfRi8y3dyMkvKVdJnfDRcMywc0kY4v1QjeX4508xx1hvc73
 CdxPn5HEDSxL9WRzNXJC97ovtkma8ykLcPc8AZYhQGFUdEM8OaLxWb+J7pCgjkK20ajBcGO/FA2
 8P4ofYnoXJutDQeEA5dji0/o1iOtG2fVoxUw5BcKuChYZeURsMzT+xySffdgP1flmIKls32RmuK
 lzfzKT+yXPRWvMyEHglaAqQs2rWrSyuYw6w961OwplTsFtlGI9qGJVNigz/n6xKidho2uuvW
X-Proofpoint-GUID: REcHOU7CoZaBBTg0MFFIZlChl91oxFhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140177
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

On Wed, May 14, 2025 at 05:10:31PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that Adreno specifics are out of the way, use the common config
> (but leave the HBB hardcoding in place until that is wired up on the
> other side).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 20 +++++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 ++++++++++++++++-----------------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 45 ++++-------------------
>  4 files changed, 50 insertions(+), 85 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 650e5bac225f372e819130b891f1d020b464f17f..611e0eb26d0e19d431673d08e042162375fd400f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -833,8 +833,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
>  
>  	gpu_write(gpu, REG_A5XX_RBBM_AHB_CNTL2, 0x0000003F);
>  
> -	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
> -	hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	BUG_ON(adreno_gpu->ubwc_config->highest_bank_bit < 13);
> +	hbb = adreno_gpu->ubwc_config->highest_bank_bit - 13;
>  
>  	gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, hbb << 7);
>  	gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, hbb << 1);
> @@ -1754,6 +1754,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
>  	struct adreno_platform_config *config = pdev->dev.platform_data;
> +	const struct qcom_ubwc_cfg_data *common_cfg;
>  	struct a5xx_gpu *a5xx_gpu = NULL;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -1790,15 +1791,14 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  	/* Set up the preemption specific bits and pieces for each ringbuffer */
>  	a5xx_preempt_init(gpu);
>  
> -	/* Set the highest bank bit */
> -	if (adreno_is_a540(adreno_gpu) || adreno_is_a530(adreno_gpu))
> -		adreno_gpu->ubwc_config.highest_bank_bit = 15;
> -	else
> -		adreno_gpu->ubwc_config.highest_bank_bit = 14;
> +	/* Inherit the common config and make some necessary fixups */
> +	common_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(common_cfg))
> +		return ERR_PTR(-EINVAL);
>  
> -	/* a5xx only supports UBWC 1.0, these are not configurable */
> -	adreno_gpu->ubwc_config.macrotile_mode = 0;
> -	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
> +	adreno_gpu->_ubwc_config = *common_cfg;
> +	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;

Ugh. I'd rather keep the ubwc config r/o.

>  
>  	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index fdc843c47c075a92ec8305217c355e4ccee876dc..ae0bb7934e7ed203aa3b81e28767de204f0a4d60 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -587,64 +587,62 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>  
>  static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  {
> +	const struct qcom_ubwc_cfg_data *common_cfg;
> +	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
> +
>  	/* Inherit the common config and make some necessary fixups */
> -	gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
> -	if (IS_ERR(gpu->common_ubwc_cfg))
> +	common_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(common_cfg))
>  		return -EINVAL;
>  
> -	gpu->ubwc_config.ubwc_swizzle = 0x6;
> -	gpu->ubwc_config.macrotile_mode = 0;
> -	gpu->ubwc_config.highest_bank_bit = 15;
> +	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
> +	*cfg = *common_cfg;
> +
> +	cfg->ubwc_swizzle = 0x6;
> +	cfg->highest_bank_bit = 15;
>  

This begs for WARN_ON(cfg->ubwc_swizzle !=
gpu->common_ubwc_cfg->ubwc_swizzle) and similar change for HBB. Then
after testing we should be able to drop r/w part of the config.


>  	if (adreno_is_a610(gpu)) {
> -		gpu->ubwc_config.highest_bank_bit = 13;
> -		gpu->ubwc_config.ubwc_swizzle = 0x7;
> +		cfg->highest_bank_bit = 13;
> +		cfg->ubwc_swizzle = 0x7;
>  	}
>  
> 

-- 
With best wishes
Dmitry
