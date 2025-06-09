Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF8FAD20B7
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 16:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C7110E229;
	Mon,  9 Jun 2025 14:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgGY+WkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B0610E229
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jun 2025 14:17:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5598OgrV002424
 for <dri-devel@lists.freedesktop.org>; Mon, 9 Jun 2025 14:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aVI7bwlPGVd8Av54c0R1XNDW
 MOUYLmY37xlJhTSHOiY=; b=VgGY+WkXGoS8+3WLnJDc+9R3ASU1McKGz4DffR/v
 00K9+8PYYRTeFvLDBix/2Q31EYKhCmWogRfcfZrpQrbfXRKTS+mazgfw2anFgB1R
 BBTOrLcqvl28eQGhdfHCOc1v1ACGQv4npIxJm1w/w5xh229o5WvMX6iz7ulUuIK6
 O/1UokFeta5pvrujRqGRjTsZwzRAji9r3XBVTTYq4cZ9m3slcmIyij2rhr3Vd7I3
 bhMpfeDcAlxWNgE/YrYOpiRNS9X+77EJQxhPsTh4SDnuyu3ZL81lIeR1EMPaRccP
 yEPHcWvVos7adGwyqwWBBxY80iRTRRh11E+nsDNQTYj79A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y1128-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 14:17:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5f876bfe0so815179985a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jun 2025 07:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749478626; x=1750083426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVI7bwlPGVd8Av54c0R1XNDWMOUYLmY37xlJhTSHOiY=;
 b=hbHWSfqWo50wkOkrPkmQ7agwRK87lzZAAfHYIzQDJInkSW75oQbWCoW142xIYIpsg3
 cKnI73iuuPfxNPbixDuMPXEi4cKisctkb5TVErysDpnDABkzmZn9sAwCHOvwwmM43Fa/
 huLKDGzQrj7vwJn3wE2hnTfxf5ofopBWxSTcAggOAEW5zjPbt4l47M9zjTpfz7LweB2F
 TOe2HWGQB+nWZFJanFJinD/hjyE45E1iHgYZT44YYoewyiaHp4JMv75IFBuC8LQ1C/Uh
 75C+yVSMsrJZhi8fjrtKez2W7rmPZQElGIdlxCUukdjxwFWRR0HVzYDWyu/usRtZZuli
 qjmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8ljlZLr3Ecp5YATMVs7V0nTwaH54qzN0kLImSkTcOIZrTgO0UOowqqrn6XZ+FcaKEu/Ple0qxexQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvmDj4W9ShnWqrXXZ1JaT6KMxjekw+mdT4PDrfs6N8pIHPH4uy
 na9sv4/u5+ZbKZ/OMCVJ/PNx+Sh1FszAZP4S3Y8F//x0EzBhP9AgLj5mWSzOPtmNIAql4vUyFOx
 mZx6Ud+j080ZmAOkM3fZED/Vw/PF53mTqLiYom/QN8l8oPs+2ImNvNaTkNS+AaKJNnkXafjo=
X-Gm-Gg: ASbGncuQG3DP+lAdgtLMEej8SAVNHa8p0W3Du1LGaqWkLB6oR4IViT2QFATvBr7QL82
 mRBB0sh4C6i9vNlYUWAgnp6lSZXcN4jNcgwNKxFja93OnmbSxdFA4lfWbqPWGcTt4r5Xuc/Zkgf
 l+5kCJPPuWircOD8o+UMKqTl9fdB3qJROYVkqMrV9KadWT7XBgFeAGkVTfpaLuI2EThnZ03drBx
 6HzSBl3tWTy5l3ds8IvOoGYV/fuTEyVBpHoTFFejRRNQS9qDmlvnWEpvYgNqDcigAk4RPRyf3Cn
 Kp4Uxt8Za4Sn5tPhtjBWxqOGwzC2z12QQKDqQBKcoDthftl80oTddDfNXWeEkaRqafL4k1S7AZ4
 ooEldu+PVGA==
X-Received: by 2002:a05:620a:28ca:b0:7d0:eac6:6df8 with SMTP id
 af79cd13be357-7d22986ec80mr1995013885a.18.1749478625626; 
 Mon, 09 Jun 2025 07:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVnzslQ94N1zxxegjmppOQmspczMZd4IHKM4NH9MnXEl7WiguTQ9BljuHGN9i9ooyXLGUUCQ==
X-Received: by 2002:a05:620a:28ca:b0:7d0:eac6:6df8 with SMTP id
 af79cd13be357-7d22986ec80mr1995009685a.18.1749478625147; 
 Mon, 09 Jun 2025 07:17:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d7118sm1173826e87.54.2025.06.09.07.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 07:17:04 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:17:02 +0300
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
Subject: Re: [PATCH v2 33/38] drm/msm: initialize DRM MST encoders for DP
 controllers
Message-ID: <hxqeilu5fcgsykghxwbhp4r3exu3o45n5lftzeupjxam7r7ux7@wdrfc6lor4gl>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNCBTYWx0ZWRfX2Fha1lMR2yJX
 Qu3zMHdUdqhZMBSc2j5DXtTUFedC3ef7uG7nIWrr4ew8N0hMmdGtUS5/MpyOo8UrHnlPPnCr5nD
 pKkIkDpRYF3E9ktKsl4cEWGTD4jboa0U6AjgIK1dQUv58sshF7J6UDM/3ByZLfZ63E0OtzSUN7M
 4ilj66JCvGyj/K733ppStO8x5ykXVUP7ue4lSWyKQg4a66UDWe6GVGsoOxpBUBN3m9gl6sNQdLd
 2VPLERlL1nydiIXUV7aVYxGvOFOWNfRQCXpQP/c9TNZ0Sd/qffTx8INGJIkFeQnXg6AVCDptbXB
 XFYFz3BJiHitImXuwvzHQKbH4hQ+4oFBwZCsEpBxfxNXAJICL6p4dApgtohlHZRxxF0vKjJY3rf
 Kp6vASefztK5ErEKrX1ST2+1ke2hs//4pGYJnBr6SHFEHLkh7tfSXRz15WVbYl4RbNtBy1Nr
X-Proofpoint-GUID: ClI4zzgTNgs6m6i_1fxBmVT0ER0CecSz
X-Proofpoint-ORIG-GUID: ClI4zzgTNgs6m6i_1fxBmVT0ER0CecSz
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=6846ece3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=3qYReTC3F8QknLo2NzEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090104
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

On Mon, Jun 09, 2025 at 08:21:52PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Initiliaze a DPMST encoder for each  MST capable DP controller
> and the number of encoders it supports depends on the number
> of streams it supports.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_display.c         | 14 ++++++++++++++

Please don't mix DP and DPU changes in a single patch.

>  drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
>  4 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index ca1ca2e51d7ead0eb34b27f3168e6bb06a71a11a..2eb4c39b111c1d8622e09e78ffafef017e28bbf6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -28,6 +28,7 @@
>   * @h_tile_instance:    Controller instance used per tile. Number of elements is
>   *                      based on num_of_h_tiles
>   * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> + * @stream_id		stream id for which the interface needs to be acquired
>   * @vsync_source:	Source of the TE signal for DSI CMD devices
>   */
>  struct msm_display_info {
> @@ -35,6 +36,7 @@ struct msm_display_info {
>  	uint32_t num_of_h_tiles;
>  	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>  	bool is_cmd_mode;
> +	int stream_id;
>  	enum dpu_vsync_source vsync_source;
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1fd82b6747e9058ce11dc2620729921492d5ebdd..45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -652,7 +652,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  	struct msm_display_info info;
>  	bool yuv_supported;
>  	int rc;
> -	int i;
> +	int i, stream_id;
> +	int stream_cnt;
>  
>  	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
>  		if (!priv->dp[i])
> @@ -675,6 +676,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>  			return rc;
>  		}
> +
> +		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
> +
> +		if (stream_cnt > 1) {
> +			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
> +				info.stream_id = stream_id;
> +				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> +				if (IS_ERR(encoder)) {
> +					DPU_ERROR("encoder init failed for dp mst display\n");
> +					return PTR_ERR(encoder);
> +				}
> +
> +				rc = msm_dp_mst_bridge_init(priv->dp[i], encoder);
> +				if (rc) {
> +					DPU_ERROR("dp mst bridge %d init failed, %d\n",
> +						  stream_id, rc);
> +					continue;
> +				}
> +			}
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 9dbcf4553cad70c9e3722160a87403fc815765d7..ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1417,6 +1417,20 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
>  	return connector_type;
>  }
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	struct msm_dp_display_private *dp_priv;
> +
> +	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp_priv->max_stream;
> +}
> +
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> +{
> +	return msm_dp_mst_drm_bridge_init(dp_display, encoder);

What's the point in this oneliner?

> +}
> +
>  static int msm_dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index a65077855201746c37ee742364b61116565f3794..dd403107b640ee5ef333d2773b52e38e3869155f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -372,6 +372,9 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>  			       const struct drm_display_mode *mode);
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
> +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -388,6 +391,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
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
