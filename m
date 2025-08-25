Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0300B3485D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A49010E512;
	Mon, 25 Aug 2025 17:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mk8agO8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83D110E269
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:13:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFcgro010324
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7KZRtqKWnJbLSwQpwonaaONT
 oh9dnHVWnrg2acQzYvo=; b=Mk8agO8O4C2cyO+k9l7Xj0Eov1Gkf4uCPjuPRQSM
 4wQ6fsbjA/YpiVyRM8YA/ObGP8v2DaDKOjLcdm0yfOwhCC31FgHCcCD5HitKkhay
 vIuQ0Mb013VlU6lCNuJvVMH1tR2sbQAOn3BHCvKKjLs5/wVdfy/Ns+YqlnAE7rdm
 mE9MK91Y1t/PRgwMNhPuZwHR7TFdI2L6cV/jzJlIfF72naZvrVFatNoA2YPok41w
 fc1NEGOOqiqtdFFe/7f+YCKDKd+5HqE0hIBMukLyEt56/EHYikvNlHB46tdfICQ8
 66GtpfCd20l8YHMVnQsoSCDKyKx9AnuNUzcQ6r2A2r+coA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2p0yp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:13:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70d9eb2e970so87495226d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756142038; x=1756746838;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7KZRtqKWnJbLSwQpwonaaONToh9dnHVWnrg2acQzYvo=;
 b=mpx2wmU4uv/yaG6YnHfAYjfiZgVFBadnsGylJjWuBy56ardo9MC4wrAk/Mvs2D/cYW
 br/UvidyKw3H4IrQGC+lCNGIDyiyVHD2SEr9QCNQdV6Y/+gtoy6kjKG5JDKXs4yomnVu
 lPeWFSwc1WSwsW/9uk/eMZrl86xkz66+MP86uWTdonMpGjaicauq6quDJ5HhrTAUzTcN
 l5y1lL7Ii5Syq0rqKJb2GHtGmd9qkSuL4ygvwESZ5QOZ3k0+xI+y9mtlkSe5TxisoWcc
 HGY0vuz8RsI/CcuUqiPHkcUZMbNB02pzMhR2SY+mHeAYCpJo4Hycj64Tv1FQ05tmgwsY
 WDzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsx+kDm8VUv0GJIwmIMaCY2p0LVT5nWjWw32CvNA1rFDQM/TU5b4HEghPRDhRnPKuJWvSp70XlcpU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEYGzEQjZgAiEvpRP8CP9D2PeoPURAep8et1XxPQtRR2+iSviA
 6lw4+zT4eDxUHGRPlZa3oz3YH7yzfpXB73Dxcwoc+VgYelQNlsupKjBExcTrBa0u1Sa0bJPhEuw
 3lz+kFQlkvHgfq7ipHsieJF411iwNrpdmoTk5dregFh9d5zIiQHYv96ps20W0xBXntYO/9vw=
X-Gm-Gg: ASbGnct8oNjsJyaBpNHtShyaUbemhjrf47creOc+fXCOWGmZ9cHetsQrAv4lk6NA6O9
 eZNbYayF2QnvR8vaPYGPtiwsPJRIpvj5lEeBOE/sqWiV/H69VHIuiAzGSh2PtMuGkKNslN5fp9w
 wg+ZEBDOshQXpRzFkUetv7UaX0rUZEw3CGE/jKYFgnBVM8ku4zHV+wIT8ObfjWvU8GkC9M+Oe7c
 JA4jFTNnEgIWWEyLuBWoOHujAFjZAyr77E4WAtUbQiXZ6wiJ5OoShDtDI2lHWt98PXHFk7RmoCF
 7s6bssAafpBTzPl3+1lgH8jsJUuRgviB5QJ9RhYBy8vCcLKabxQ6dz82p+v5lBiyyXaxsTTjqgu
 38Jpe9RrCQLur5LIjZS8cdGVGCUK1jEpEUTacpJ72Pl2bha4PFPxo
X-Received: by 2002:a05:6214:d8c:b0:70d:6df4:1b0f with SMTP id
 6a1803df08f44-70d973bae47mr165335656d6.61.1756142037813; 
 Mon, 25 Aug 2025 10:13:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdj+FFZ2fiH2yMSwN4KYEuhBhcuKZOiJBSCzLyu+64VlJ0OHTuoJtak8qkNW7VvT0uU7U8+g==
X-Received: by 2002:a05:6214:d8c:b0:70d:6df4:1b0f with SMTP id
 6a1803df08f44-70d973bae47mr165335226d6.61.1756142037066; 
 Mon, 25 Aug 2025 10:13:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e5d1b1asm17681701fa.50.2025.08.25.10.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:13:56 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:13:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 03/38] drm/msm/dp: break up dp_display_enable into two
 parts
Message-ID: <xwvuajrm76flwhnciclz3bxzj6vmvladm4t73mr2pyrblczi6e@wbyq3x2yabrk>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-3-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-3-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ac99d7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ryBzyUWMAq7bL-B5d80A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4YP8Q5G3SarY
 sYJkEZvmiGvzbsNS8/VWWlK5D4XVR1w90IJDez4M5HpZPQnIK4ziNV4rk6hH1Gy1K1nlqJyr+fQ
 1xm6Cu82DwDky6+vR742xHafnLVFxfaHrbOcto6RniO7GXN8vCHaYr/iL9SkkSYUqtdUmUg3NeM
 hXzu/uj/T7ZVKmuZ/abHvojmJ4y8a3IhJuOebNQSyv4cZd+4dXHC6SatqWNzwHyH9p1sdXuh1/C
 h4BTFf6tbqxGDLR8sJHa4rFku0faYBFIRGwqbalDrnF/iTZWfADBECqqOfDs4CjC3Zp8HIibu8z
 fx991ZvK4cRhaRRo8Ks5nZIn7WZtiQXJUzKF3Rq6PjBd2yRFVuG3Zr7hMDgSSAE3BaGQgefiflP
 pEUoKpgP
X-Proofpoint-GUID: Gndp9OP9V4eiUFiGRDN5inKcpco7x3rr
X-Proofpoint-ORIG-GUID: Gndp9OP9V4eiUFiGRDN5inKcpco7x3rr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:15:49PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> dp_display_enable() currently re-trains the link if needed and then
> enables the pixel clock, programs the controller to start sending the
> pixel stream. Split these two parts into prepare/enable APIs, to support
> MST bridges_enable insert the MST payloads funcs between enable
> stream_clks and program register.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  51 ++++++++++------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   3 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 113 ++++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |   1 +
>  4 files changed, 113 insertions(+), 55 deletions(-)
> 
>  void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 60094061c1029bc7a06ffaa80d9403b40aa07eb1..2fbf16f27842bb7639efaa2baecac7bdf8908432 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -20,6 +20,7 @@ struct msm_dp {
>  	bool link_ready;
>  	bool audio_enabled;
>  	bool power_on;
> +	bool prepared;

Why do you need this? The msm_dp_display_prepare() function can only be
called from within the atomic_enable() callback, which is not supposed
to fail and which is always called in pairs with the atomic_disable()
callback.

>  	unsigned int connector_type;
>  	bool is_edp;
>  	bool internal_hpd;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
