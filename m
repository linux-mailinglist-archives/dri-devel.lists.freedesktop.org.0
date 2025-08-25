Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1F9B34915
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DDC10E51C;
	Mon, 25 Aug 2025 17:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXqurqiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC6E10E51C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:42:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGfjbS004306
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:42:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NwZKoiB17+RzcYdQtzPEWYcl
 qT54d7+6tCe4wXrETLw=; b=oXqurqiy/ry0fDEjB8N+cp+O9iBBGReyv7E6gTTm
 r3ADwD4ZHC2PeapULGvo7fbVPGpkuJn5ZAj3lTZ9ctFFB103EybPFpEvFsFs6TeZ
 qHcCS7ak0rqJouVN+pZZFi7AFZZy/3xiGJh7qaoKcwLvAtsKvNCUQNRq7O10FkUE
 TcTmNrsipGCt6HtYNdJcv+ul8gvr3uVNjoq4dy5bPcsblPpcSY4mi/7Lb+BNewEo
 ZvVWKJKOqMlxD4RG9a6ET2dn9h/1Ta+GBJq7bR4Zd0KPlwwUg0Ny9sxRzppkWzqQ
 vTfu8TSUc2KkaBPw3bY7WSQuSPLGSNTpQqS+nNO4B/NnIQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdwv8c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 17:42:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109bf1f37so101767621cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 10:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143730; x=1756748530;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NwZKoiB17+RzcYdQtzPEWYclqT54d7+6tCe4wXrETLw=;
 b=L/6uVOqhOeJENpauUh8HqQc/qh5W7YQoh0TCb3xFUEULDkuck7xlsRtcWLGT4dHuee
 DoV5courPm6TLgROHmPRzwqI/9EQvG0MyXKVd12HKvNCCeI1e0CHmXq2uzUWjAXVNOGm
 VKJYU7XmNyZ9/NoI5mUyi+8Zdp6hLMjGRU5AEPvWvMAtHTDVEQDmLQY+Y2V/NMkz+3nQ
 W4FRGD57q3+9KAPh8H9qUJGLjWiB/KYpmBfl4NGKuk1QcDhwPGjUcQbdB/Oqu6jm4406
 vdOLMZgShi3JPSqEs/Mw5knVh4ASXtkBqWqxty+/cEfrmM4XKO2QjrCpTLGkGBDMmTPe
 2Dqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDNBV41AA4mS0IDFB85R5hJeuEk07qJgJYTqdY4DgxdvOn/FFR2WA13QKsPRb+ZIEJRfCRYzXhD8k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUBo0UghMmCZisKa3LiLCcJ/x++jY60trLs9d6bP9En3hsDN+m
 ew/wFHMVVLgQ4kNCQSLgmSye9Uj4wIyPcC1uvMiSP3M87RIJkfLqQ0wrE+ttAcwp5BY3tOZNdVZ
 gWXrJUu2DRfygJymyKxHkVRX6jmMl6kuvt5JldBAZQrJYWCFVDu8hRS/cx/XWUJ8TJX6C0VY=
X-Gm-Gg: ASbGncv/i9yHb72tguNsPnC5rme8kD/MMEyMkQz8KmT/wos/6hA+QacpzLA2to+wrEp
 Ux87Jp4pwOxWcIuGKm4Nq4n9J675w2wJlQ4D/dpe7pQN89xzo4fNUDMdlnchj6k2mvLFrmBYJ2u
 TSCm5p3A8cE1r5CGCazA5+SCH25ul/Mf1jDLTgwuzVBX654eim9e9sdnZ2p761P3ciqZfQIJTqq
 a1m0JEAUK+UnpHDQf/TD5GR1a7eA+ofAfQeYyMm9H/SeIIoua6nUdgUqFwihpwUM7LPo6zB6T3p
 zITfl7/i2Lxc4KW/MA++FiJxbieXBce+yzipTwFHhb0cBEpFdn39kGXqnjrZtrZ9mCMCUAAhBad
 mH+RC16/540a18filM/zx4OasON/A4kF8Bh74+UL+02GKteFoq/V7
X-Received: by 2002:a05:622a:211:b0:4b2:a07c:d728 with SMTP id
 d75a77b69052e-4b2aaa2b1d3mr173862361cf.27.1756143729882; 
 Mon, 25 Aug 2025 10:42:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeCzCtDd568aAnN/B2JcD7EdU/1ndGpfZU0hZl1xPRFEteCvWyj6thJySnvMEtk6k9eUZZiQ==
X-Received: by 2002:a05:622a:211:b0:4b2:a07c:d728 with SMTP id
 d75a77b69052e-4b2aaa2b1d3mr173861471cf.27.1756143728641; 
 Mon, 25 Aug 2025 10:42:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bbedsm1749862e87.85.2025.08.25.10.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:42:07 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:42:06 +0300
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
Subject: Re: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
Message-ID: <ltlmp5ytl2f7no7aqq7sl54pwd4f53fuema23xnuwu5uthhbg3@7wamwvv22nle>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: wkZxVvU8v327KrYI8uv4U8QWbgcl_8co
X-Proofpoint-ORIG-GUID: wkZxVvU8v327KrYI8uv4U8QWbgcl_8co
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX3DyO7LnyIsFK
 R3cuvp8AxuuwdEcrw6p4jxf3BpeAuz8p/LnxmrvhIAyxruzEAq+psn6N8CUGDpgimgVwPQ26FiS
 wy+k2R4VJD3b7XQBh//jeI/WzlNvruk4n0ueok/4YeFy9cE1/sPXG7So40ePrPF2FMUrBc4jXYb
 nqG5DZw/I6MytH81uMCyge1XPvlEvy7Oumcojntino95ahLYAUmT7ROgtoDxgpOVvUfsjxT7U/X
 2CdGvOetf03RykyKT4SrhG11rCXTQjTdJEFEDy4GHgVvpa7aGokEB9Kr0P8wG37GL17Y1Era57K
 aOOqwMWn+6sNtPg3CkFpCUeD7Mj7KORNTMNu7QbVVQQfcEgR4ucY+PfK5QTOsA5bxqufMUPTg5P
 H4Q0hd2q
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68aca073 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KSwXNKDnAPCPISpuv5EA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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

On Mon, Aug 25, 2025 at 10:15:58PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Introduce the `mst_streams` field in each DP controller descriptor to
> specify the number of supported MST streams. Most platforms support 2 or
> 4 MST streams, while platforms without MST support default to a single
> stream (`DEFAULT_STREAM_COUNT = 1`).
> 
> This change also accounts for platforms with asymmetric stream support,
> e.g., DP0 supporting 4 streams and DP1 supporting 2.

How?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 78d932bceb581ee54116926506b1025bd159108f..a8477a0a180137f15cbb1401c3964636aa32626c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -33,6 +33,7 @@ module_param(psr_enabled, bool, 0);
>  MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
>  
>  #define HPD_STRING_SIZE 30
> +#define DEFAULT_STREAM_COUNT 1
>  
>  enum {
>  	ISR_DISCONNECTED,
> @@ -52,6 +53,7 @@ struct msm_dp_display_private {
>  	bool core_initialized;
>  	bool phy_initialized;
>  	bool audio_supported;
> +	bool mst_supported;

Why do we need the separate boot field here? Isn't it enough to check the max_stream?

>  
>  	struct drm_device *drm_dev;
>  
> @@ -84,12 +86,15 @@ struct msm_dp_display_private {
>  
>  	void __iomem *p0_base;
>  	size_t p0_len;
> +
> +	int max_stream;
>  };
>  
>  struct msm_dp_desc {
>  	phys_addr_t io_start;
>  	unsigned int id;
>  	bool wide_bus_supported;
> +	int mst_streams;
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> @@ -1213,6 +1218,15 @@ static int msm_dp_display_get_io(struct msm_dp_display_private *display)
>  	return 0;
>  }
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp->max_stream;
> +}
> +
>  static int msm_dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
> @@ -1239,6 +1253,13 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>  	dp->msm_dp_display.is_edp =
>  		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>  	dp->hpd_isr_status = 0;
> +	dp->max_stream = DEFAULT_STREAM_COUNT;

Just use 1 it's not that magic to define it.

> +	dp->mst_supported = FALSE;
> +
> +	if (desc->mst_streams > DEFAULT_STREAM_COUNT) {
> +		dp->max_stream = desc->mst_streams;
> +		dp->mst_supported = TRUE;
> +	}
>  
>  	rc = msm_dp_display_get_io(dp);
>  	if (rc)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 37c6e87db90ce951274cdae61f26d76dc9ef3840..7727cf325a89b4892d2370a5616c4fa76fc88485 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -29,6 +29,7 @@ struct msm_dp {
>  	bool psr_supported;
>  };
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_modes(struct msm_dp *msm_dp_display);
>  bool msm_dp_display_check_video_test(struct msm_dp *msm_dp_display);
>  int msm_dp_display_get_test_bpp(struct msm_dp *msm_dp_display);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
