Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A507DAD1E0F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428A110E286;
	Mon,  9 Jun 2025 12:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppOgmj1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A2510E238
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 12:48:25 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598Og8s002426
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 12:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=cyXFr9Y7VCghsyBDYdoliPS4
 dImMk/Plhfn+EfNGrh8=; b=ppOgmj1UytR9V80yaQB3qZgPIFTj4AMrsnGFWyHP
 556ZFaJ1ECNjt/F2UBKpHd0rKAfqkWFhxkWnG5BTJuwJvU1cisPUiyXCFls8k4uH
 ffiApl5ovhv7z4r8u5VY8kg6FPGjeX2PDrS3zVesCxvB1vaRx5Ur3SVfSe43RLfg
 9TM0OHQA4WIbf9xsvdvQwoszPJQKwloPbp6OP5eAV3Okw18dsrua4JX4oDJErXwa
 UM3ZX0ETmXsHvD49XvZdndBoLOd+2VgZBq11/zDu9tXRNd5NpuDKs7eEoC+2Qi5D
 DIkJumhx2GVAzMAMU7zdkaCnGQ2ybpUIw638pfz/XFyrxQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y0sgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 12:48:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c53e316734so675988585a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 05:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749473303; x=1750078103;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cyXFr9Y7VCghsyBDYdoliPS4dImMk/Plhfn+EfNGrh8=;
 b=BCA3CHGIZnFH7H5L5U914plG+qXO0POKT9HlOFr+zptl1kDR1k5k5B9YA+UeqeCFet
 M6KaxA1LFdRuGoU89v0guY40yxoLvJ41ytSyHxGpPdoWEMRul+6Es66m7U2RfodDqY8o
 PXi1G2ncfvYL5UEFSM1yo04rvakStlEYMZRSsFeC53bzUT/NNXaKtVkG0zgvUGm/YFx2
 +u4HdsxBk3lpU1b/Lsdw/AaKpEVocf3+pka6zC5K5wVUxPWymvSGu+/xfAofGruzjLmm
 obcGKzmwMR0TRuFdzQXJDLj7jNM5ERHQWGD+q9/VoG3NIdFLLG9tE3MGFOkchnqBjR1V
 azkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDMTVe+s66cuuPGq4y6wIhQ+Adho6Ld1tMouGenk290RWxuj/pJau1CS7acCL104H1t9qJNAFXrg8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywt41Iaa1k6n1Sy/zCcXR/NuWFhMo8llB8K+Bw59advevUfdWG7
 K5yrmexVTBQdXfX2qyOCBn9e+Uop4baYYyHLqXliQPOgdd+fxecfvzvCPIq3sKIxwZFph74f06Q
 lyDFwubXVm72Mq7hO6IcMypYuBew725gouBbqKuALxuURzG6Fg60SMo0ps2E8zzHLKRDQ8ReV74
 yJEcE=
X-Gm-Gg: ASbGncuwEmHrn15C/kMSvAGOE0P0CNp0GidHO/V5wkeNjifrYybgCaLx9PxucEfOKYt
 DaP8ArSo0ErMA39+H2CoGwqDmO9gGVokOQgbGJJQva1X/fg+bAjmDqxy95af3/p50zSj7I5jfZ+
 +aM3Pfq1rXV143z/GbiM6WCGbuo2NQuSEpjqsB7lBitCEf2ngHNfaxRqGeKrMQir2dv/AqgcZYv
 m+Q887DUt+6ZlagZdzzvfDVDoE2vSZT4qJeQkvY2c15LszRNabeWe/o6sStENVru1vB0XJN25wZ
 4dCpBiayg9NC8YTRb8//h/w9FJrCkCtazluUuusbtNdGnty7WqADdcTiKCmjMqHnnf5/EkDz+82
 T1mc+XBm7tw==
X-Received: by 2002:a05:620a:31a3:b0:7d2:2a6:2dec with SMTP id
 af79cd13be357-7d22987e5a8mr2018509185a.30.1749473303315; 
 Mon, 09 Jun 2025 05:48:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKm0NMJWSaZh2z/7vc6FgW1171qs+SXoa6vIis6CtV0cigHkuKg7hRjWnXTpnl2/Cl7Qaj4A==
X-Received: by 2002:a05:620a:31a3:b0:7d2:2a6:2dec with SMTP id
 af79cd13be357-7d22987e5a8mr2018503685a.30.1749473302861; 
 Mon, 09 Jun 2025 05:48:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55367722172sm1154372e87.98.2025.06.09.05.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 05:48:21 -0700 (PDT)
Date: Mon, 9 Jun 2025 15:48:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v2 02/38] drm/msm/dp: remove dp_display's dp_mode and use
 dp_panel's instead
Message-ID: <kq6tb2wnte6v5z7uxgzc22kjwcevgvcdluzqbelvnbpbxlkotd@ltlv3u2guj4u>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-2-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-2-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5NSBTYWx0ZWRfXy9txZ7zEGHfO
 U1cmqVHXYlf5sRxCtuEIcOFfYZUxeYubq0bJ7EGnfeJaGQZDddGfnrGSGNq56A/vKJG7Pl+fqPO
 dPnnu2TprRmdQ+bZ+SMJpKlcTN3XmLU7JqH57eBW/OrevqsDoL6VG2aOlRNg6M5Ss4wa4mhZO6V
 cMRoXGwkk6bGFxvtvLb+c8zUaaQ6Yi41y8aSeowIg3TS7JtZsEZRxbRu2v/lVkdYSnBdiKg+lk9
 vB6N/aoW3vs3MG7eYzIrM4vdlxXljzZuIXL3QWosOSB95dCu56ZXqnfcjUWmVlljeuLt2ztiAiP
 ifLCA9lSSnGrWp9r6jCumiOwbfAofNRxqlkgeODukkOq38cG+ZNLIKpfRBZQ1dhCq/JAy5C8MSp
 6LqpRhRC1DWP9G27eB03c/o00iVcmRCXKkpMM3XTX0welubDkr8K6DdUJ4cPylSOiGBFz2Lb
X-Proofpoint-GUID: rpUU0wYMuDI2WPUChl0dESCs7oQ2W5Fr
X-Proofpoint-ORIG-GUID: rpUU0wYMuDI2WPUChl0dESCs7oQ2W5Fr
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846d818 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=LRmimyFsA7i-Op6yJAUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090095
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

On Mon, Jun 09, 2025 at 08:21:21PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display caches the current display mode and then passes it onto
> the panel to be used for programming the panel params. Remove this
> two level passing and directly populated the panel's dp_display_mode
> instead.

- Why do we need to cache / copy it anyway? Can't we just pass the
  corresponding drm_atomic_state / drm_crtc_state / drm_display_mode ?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 76 ++++++++++++++-----------------------
>  1 file changed, 29 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4a9b65647cdef1ed6c3bb851f93df0db8be977af..9d2db9cbd2552470a36a63f70f517c35436f7280 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -92,7 +92,6 @@ struct msm_dp_display_private {
>  	struct msm_dp_panel   *panel;
>  	struct msm_dp_ctrl    *ctrl;
>  
> -	struct msm_dp_display_mode msm_dp_mode;
>  	struct msm_dp msm_dp_display;
>  
>  	/* wait for audio signaling */
> @@ -806,16 +805,29 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
>  }
>  
>  static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
> -			       struct msm_dp_display_mode *mode)
> +				   const struct drm_display_mode *adjusted_mode,
> +				   struct msm_dp_panel *msm_dp_panel)
>  {
> -	struct msm_dp_display_private *dp;
> +	u32 bpp;
>  
> -	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +	drm_mode_copy(&msm_dp_panel->msm_dp_mode.drm_mode, adjusted_mode);
> +
> +	if (msm_dp_display_check_video_test(msm_dp_display))
> +		bpp = msm_dp_display_get_test_bpp(msm_dp_display);
> +	else
> +		bpp = msm_dp_panel->connector->display_info.bpc * 3;
> +
> +	msm_dp_panel->msm_dp_mode.bpp = bpp;
> +
> +	msm_dp_panel->msm_dp_mode.v_active_low =
> +		!!(adjusted_mode->flags & DRM_MODE_FLAG_NVSYNC);
> +	msm_dp_panel->msm_dp_mode.h_active_low =
> +		!!(adjusted_mode->flags & DRM_MODE_FLAG_NHSYNC);
> +	msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 =
> +		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode) &&
> +		msm_dp_panel->vsc_sdp_supported;
>  
> -	drm_mode_copy(&dp->panel->msm_dp_mode.drm_mode, &mode->drm_mode);
> -	dp->panel->msm_dp_mode.bpp = mode->bpp;
> -	dp->panel->msm_dp_mode.out_fmt_is_yuv_420 = mode->out_fmt_is_yuv_420;
> -	msm_dp_panel_init_panel_info(dp->panel);
> +	msm_dp_panel_init_panel_info(msm_dp_panel);
>  	return 0;
>  }
>  
> @@ -1431,10 +1443,13 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *msm_dp_display,
>  bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
>  {
>  	struct msm_dp_display_private *dp;
> +	struct msm_dp_panel *dp_panel;
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
> +	dp_panel = dp->panel;
> +
> +	if (dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		return false;
>  
>  	return dp->wide_bus_supported;
> @@ -1496,10 +1511,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  	bool force_link_train = false;
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> -	if (!msm_dp_display->msm_dp_mode.drm_mode.clock) {
> -		DRM_ERROR("invalid params\n");
> -		return;
> -	}
>  
>  	if (dp->is_edp)
>  		msm_dp_hpd_plug_handle(msm_dp_display, 0);
> @@ -1517,15 +1528,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		return;
>  	}
>  
> -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> -	if (rc) {
> -		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> -		mutex_unlock(&msm_dp_display->event_mutex);
> -		return;
> -	}

It should be done other way around: keep this call and drop
msm_dp_bridge_mode_set().

> -
> -	hpd_state =  msm_dp_display->hpd_state;
> -
>  	if (hpd_state == ST_CONNECTED && !dp->power_on) {
>  		msm_dp_display_host_phy_init(msm_dp_display);
>  		force_link_train = true;
> @@ -1604,33 +1606,13 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  	msm_dp_panel = msm_dp_display->panel;
>  
> -	memset(&msm_dp_display->msm_dp_mode, 0x0, sizeof(struct msm_dp_display_mode));
> -
> -	if (msm_dp_display_check_video_test(dp))
> -		msm_dp_display->msm_dp_mode.bpp = msm_dp_display_get_test_bpp(dp);
> -	else /* Default num_components per pixel = 3 */
> -		msm_dp_display->msm_dp_mode.bpp = dp->connector->display_info.bpc * 3;
> -
> -	if (!msm_dp_display->msm_dp_mode.bpp)
> -		msm_dp_display->msm_dp_mode.bpp = 24; /* Default bpp */
> -
> -	drm_mode_copy(&msm_dp_display->msm_dp_mode.drm_mode, adjusted_mode);
> -
> -	msm_dp_display->msm_dp_mode.v_active_low =
> -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> -
> -	msm_dp_display->msm_dp_mode.h_active_low =
> -		!!(msm_dp_display->msm_dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> -
> -	msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 =
> -		drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> -		msm_dp_panel->vsc_sdp_supported;
> +	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
>  
>  	/* populate wide_bus_support to different layers */
> -	msm_dp_display->ctrl->wide_bus_en =
> -		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
> -	msm_dp_display->catalog->wide_bus_en =
> -		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
> +	msm_dp_display->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
> +		false : msm_dp_display->wide_bus_supported;
> +	msm_dp_display->catalog->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
> +		false : msm_dp_display->wide_bus_supported;
>  }
>  
>  void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
