Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C021B37469
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 23:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0C210E2F8;
	Tue, 26 Aug 2025 21:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNIM5pfC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1374510E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 21:27:25 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDfR7l031911
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 21:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=bIo/bxAc1/HcsI6XoyI6p5b5
 8gGGdsJvr4jN4wNxvTA=; b=CNIM5pfClhqSsKo5Yp7stRbW59+cMz3Xqi3wYlNv
 Z6UhPbo1DzuE9oYk5djwmSJ0dnu4zDfNOd+quoVf6VY4622sLKIT6uxA2vYAlw7T
 6pnarV4O2Grt0fpSZkoD9OkFQtpCQkQPvF9YQnnKBScAY+Hk10c7CHMhqiUNy2Ni
 +5MhWfKnaQsuVR/VNceY57TPYE0MoUBOZONEZeAYLiLACGkPB/QStHDnJfYGmgjx
 jMPbzgDQubOo5kOjbQQqH/HVM8ki6uvfPdUGHpOfVhXsQ28Vtd/WJQ4MBIQZKHxI
 cHIArfK4riV+BcfnZQmbM7ovUxg34zAg0INdpWYp2BJqyA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16sesd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 21:27:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109bc5ecaso175029901cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 14:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756243643; x=1756848443;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bIo/bxAc1/HcsI6XoyI6p5b58gGGdsJvr4jN4wNxvTA=;
 b=CW/M1QV89++snl6Zny+lOCMuUH5LmHvhAp98IC8IyVyTAMyflBQSIWiqFvnpnfinvZ
 bn+OET3iWl095O4NIF7dntTU2ge0p7dtoXnaORmT35Y2Xva8nCB6FuP1xwMSm9XwaECU
 1kBm+4+NNnIoooySo6IT3AKbKFTG0NWEfU401l8It5jGreviToc3uBGYJEXqcS9JdV21
 x3WZZIgos2ernvlSrzkem5aUBFUKpXDtZdje767nchVECLFRUMyeUFuPgxAJK1+02kd4
 QpxQtlstErnjXVna1/BVkgMytrGoW/wokoEKAsr4MsGK9AVG2+Jy7QnNsaaZGEcM/CAC
 nfbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoMJNiVuEELbKQNhVoqG2E/VBKULv9IfvMw3gqQzP51oUTJzjphX6ThCpAsdfiYFYrJxWLOKGfXQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx23cAVjoJYASRK80xzkR84DCPn82ZeCRacFYwI7QITdClgOzP
 bqC/VUoSPxKbjUWBiD7wrNd09/wPz8JczKMmuMAJQTRuXaAGhofmGiujo1BX8QRAzL8GN3Fl4wL
 ne6qiGUxC+hP+fnmSd/YYFT/8Elsk6i/KXteIpmFQiBl7zeektwqUCDCjIhOlk23DuUtb/HA=
X-Gm-Gg: ASbGncsLzrASWOVm2FbS/uUuGw356hsZ4kzExQJwSTiB2EehbybD8zPi4xPyvh7OGCG
 vqGCKpPZYqfhv1LSEH9gpaAXoE4aTWmh9zDVkMBf4o8n/1xeo43PoMRRDgs0yWKFTjiytnChvjw
 z3zLt5Tx4jxxo769TxuObzeJKF0Uia7SnLx/oYL+Apt4Y8R+HzUANfJxRhLh0IAEqnjgt/IQa3/
 HECx24QjLIl2tXJjsePFSnSM6q0HGJJcj3yPmLJ/dK4+/j3B7CDQe8VwtuveuuioWxxNu3He/oq
 L2B/yorNRTkAn3fL7SX6TrDoTFt9N/79jcQULeE8i6TTl8/yne4JzhoO/jpNPljtzmsm9W8UK32
 A+OH/joxDnVjRYhFnD0K+1K68+TVjL3HqXUoBXXllUAEY571XvbTj
X-Received: by 2002:ac8:7fc4:0:b0:4b2:f065:f335 with SMTP id
 d75a77b69052e-4b2f0660a97mr1489101cf.45.1756243643016; 
 Tue, 26 Aug 2025 14:27:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKIt6P0fuMEsH8NvyaiAVm/Kf2jDGyOZA1QvNb9R/GVo1OnUDlsUPq2uC7/OisC4xU3v5yIQ==
X-Received: by 2002:ac8:7fc4:0:b0:4b2:f065:f335 with SMTP id
 d75a77b69052e-4b2f0660a97mr1488301cf.45.1756243641588; 
 Tue, 26 Aug 2025 14:27:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c02201sm2449625e87.4.2025.08.26.14.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 14:27:20 -0700 (PDT)
Date: Wed, 27 Aug 2025 00:27:18 +0300
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
Subject: Re: [PATCH v3 35/38] drm/msm/dp: initialize dp_mst module for each
 DP MST controller
Message-ID: <yztpuhehjydmtefynpa7gt2keysdjpsdmrke6nkjsv7jnhkvkq@cve5yzs7v2sx>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-35-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-35-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-GUID: VbngL6wKH0Nm5K5gj46KqzsvgU-Lhi6B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX6/FNVJvy9+7v
 LzYchS8TtGrti+GfP6HyUz7n4CGEYIc4mTQT+LP1EJ3Lmn99uvwHeTfqmGvDfqU0nEoWFREaVph
 6PEMzGTqT87KNP/YDgSkAqC81SBWcJTABBeq75jEs31/hN/4u/bG+CVQtc7+BzO+AhiyS6SoHrc
 Xdb8E08XQgci/41O0sDzCx3F5+dJybFXwFCJUjsQEgZ/WRAjAmbShKoVCw0jYoSd8eyM0PUdAB9
 FkPr6kiyJ4PdFHLlBWqyiiSaWcjBpzmhCnwnpNPbiVfI1nnXsIvLDVCA9+6S/rjEDzp4C3oqRR/
 WWDq6Mm2LoVebk1+TzeucEzu2laUS9Vn8hEHKWVNxYekOjk9gUScFYDNrXpznuhsCVjW0IQg5I3
 ITvdqFHI
X-Proofpoint-ORIG-GUID: VbngL6wKH0Nm5K5gj46KqzsvgU-Lhi6B
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68ae26bc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lMSRVfgScpy8wSuMpmwA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120
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

On Mon, Aug 25, 2025 at 10:16:21PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For each MST capable DP controller, initialize a dp_mst module to
> manage its DP MST operations. The DP MST module for each controller
> is the central entity to manage its topology related operations as
> well as interfacing with the rest of the DP driver.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ++++++
>  drivers/gpu/drm/msm/dp/dp_display.c     | 9 +++++++++
>  drivers/gpu/drm/msm/msm_drv.h           | 6 ++++++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0b9d9207f4f69e0d0725ff265c624828b5816a8b..4036d3445946930e635401109ac4720ed2282c2f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -681,6 +681,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
>  
>  		if (stream_cnt > 1) {
> +			rc = msm_dp_mst_register(priv->kms->dp[i]);
> +			if (rc) {
> +				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
> +				return rc;
> +			}
> +
>  			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
>  				info.stream_id = stream_id;
>  				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 909c84a5c97f56138d0d62c5d856d2fd18d36b8c..897ef653b3cea08904bb3595e8ac10fd7fcf811f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1586,6 +1586,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
>  	return 0;
>  }
>  
> +inline int msm_dp_mst_register(struct msm_dp *msm_dp_display)

Why is it inline? Also please move this to a corresponding patch (the
one which adds msm_dp_mst_init).

> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return msm_dp_mst_init(msm_dp_display, dp->max_stream, dp->aux);
> +}
> +
>  void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 3e64ec7b7dbe1d1107e85def9aa80277131f40bf..c46c88cf06598df996a17c23631570fda078b371 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -365,6 +365,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
>  int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
>  int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +int msm_dp_mst_register(struct msm_dp *dp_display);
>  
>  #else
>  static inline int __init msm_dp_register(void)
> @@ -392,6 +393,11 @@ static inline int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct d
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_mst_register(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
>  static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
>  {
>  }
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
