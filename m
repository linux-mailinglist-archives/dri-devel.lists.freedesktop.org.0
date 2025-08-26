Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087CFB372A9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 20:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8724A10E6B4;
	Tue, 26 Aug 2025 18:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PFT3ct8R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36AC10E399
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:55:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDMgwP026177
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=E5rq4ut9ehlBWAv192l0XJWM
 U62GPIJhBkGB4MSE0rw=; b=PFT3ct8RRBTzRRTT1DM+WZWWCL9R1gyfOqiLdiQn
 R09w0nk014a9AhJtdQKFHRBa6tuAchdeCtI+RtrLUI3VKO4raaUUkobCojctb17E
 dJ575jtjPDhcf937ASY3+61E29bof7QWIOt7In37ttFMfz9VsgZSgH/XQGa4Xf8O
 I/zhD40zpnEyLjZNzc2Qx3IhDnOZgF8F07XulMljhoQkjp4+41b+9vNZ3pt+SG9t
 +ZwdEypAG90YL7wihqX4SK0l/bDdqgvkNe+i020IcQoQeUZanZc7iHP+jmmXDb/f
 qteoMOmtJiVC3ge2+I0zEICTThyjREzthMm/zR0slv7LFA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfj1xe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:55:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70d93f579ceso107552406d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 11:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756234504; x=1756839304;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E5rq4ut9ehlBWAv192l0XJWMU62GPIJhBkGB4MSE0rw=;
 b=eJQRDe/xBo3U6TfKRlH70c4SxI8CBOM30/Y1B1nOrMAN2u7E/FGhgM+wTigmWaTU1r
 I96cI0TNTWW5BEbytNYuciZ/823EGpGGhdVNYjfkud8lrHZFHBE0zRcMQdRG8Vhm4qyq
 ZDKq3pHq4jblu6w995bUbkLFjcD9WZu9r6yGXttZQOc9OrYPvE57b1rbfzsf6mow9D3z
 Ebn5ILTGr/aixt5KznPQBMaRirddeDjx3GQwC+VO8EgvL0/VU6s/rFaWk8a/2V/Usxct
 L8WbZX4BleZvA1eKnHNe9DzQQaPlGRIncrA1jOYTbllTFPuszsVVvW0HnAho5OT9U7LE
 4l+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXenb6btJ0EiuscqSq9GN1+8PYtU7WG2p5V2fGANF720oljtNFrUbbfHEHlCNhou87ozpS6BsiFHLU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDqOnksQbHXtp0ijQPQmfz7czCpsntFcyMYc4pJ7TEHnNOWQPD
 66FX15z9J4M6Zm2RuE5JZaUTmQmk5NeBUHxdAF+zrJevD9I2K9IZeNwXr4tZJu48mdwkzjgFmfE
 Ookxl5o+ycEVH08Z4QxKNmCsMFF+zdlxb9RAoR4PkngA09YlgpOetSaJ1J++ZBnirGsYPUEw=
X-Gm-Gg: ASbGncvGwr8YmFEuNEK2LegTl1mMBe0mvutSI87Bub5YFzXijVp+uZvmQuroxsdSfuq
 UzVdYK1crWFE+HUKnM7VL6DYj6L4s41pajVqcam5XzpDOLj6WNiSYZf0ZnswFQEszqnd4xvbty5
 jZfmwCwhqzBuUJPburfiC49GrjRKrEHt18S8TcHezFqLNbQSs7zsHf8WNSQWiMvJOkrxSMX+lh8
 01ByIZ1KaOvXxSmmW3R23Em7EAoAFhVEUXvhgTO6/zI3DXsNy3bXUi3LfaMpbT4hpA2x4scRsZN
 7UDAw14QVrhRyboFeocVqa2mQeNfbfFFmXfQZqq6p6cWqj5VmNIHM+USXdXKDZy+RcqdCKtHvZ2
 fZOpwxIRkOk9CvLSIuQCgCC4/A2XpwlFEP/tX7X9nWa157Ep6SbIJ
X-Received: by 2002:a05:6214:5191:b0:70d:6de2:50c5 with SMTP id
 6a1803df08f44-70d9737373emr197619066d6.66.1756234503971; 
 Tue, 26 Aug 2025 11:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpuM/d9fUYtlth82B55F0jDnkPx/LEP/ELC9XQq2Z1L5athx6E3diSRwjz7xdD859kW24smg==
X-Received: by 2002:a05:6214:5191:b0:70d:6de2:50c5 with SMTP id
 6a1803df08f44-70d9737373emr197618766d6.66.1756234503385; 
 Tue, 26 Aug 2025 11:55:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f53b30d1asm61898e87.152.2025.08.26.11.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 11:55:02 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:55:00 +0300
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
Subject: Re: [PATCH v3 34/38] drm/msm: initialize DRM MST encoders for DP
 controllers
Message-ID: <npxu4ybwj2dztn3dbvmkxiwqw27wyr57g7ps72ndst7cful6n7@vuk2rizlz356>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-34-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-34-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX70gJzwinvay/
 9U469YCEkGpT9C9oMHWHTxc6Y8zIwQhVMhmFpcZ63ZBieGV8uRxpqQYOiH4Un7VkUyYD+cpdsnd
 lDP9Q4REtWV6Nh8Am6YzhzfOlOLZExdTNXhZGjUZkPOWKBHcS0iNphDdDWN99MQOePY/BS1UsaP
 5hRFoHXtRjqMTjqNciamsnhoeYa73iU9PUT0a4OUSXOfwAEiTOeXFd7P/2ZPKe/zxaw6KpM2Q9e
 befXJBknQRZk2+d8DoXn48s8Ei5MMkxjQjIeLoAk8t65eA+t9e3t5H8fEKoVKcv+qk69GfHdNd4
 FKZRSKfL1PAAr3lhnn8PaJkdet0Hq/jgmMVUgWyMmd1HPPVNUemB+bFq6KZEiMtQgHg4xoaoi0Y
 6x8+2i/S
X-Proofpoint-GUID: MvVGNeN_a1pH-omNVbGLYOGHovyDXGXq
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ae0309 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=OHzwUTK691SzpBSaeAAA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MvVGNeN_a1pH-omNVbGLYOGHovyDXGXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
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

On Mon, Aug 25, 2025 at 10:16:20PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Initialize a DPMST encoder for each  MST capable DP controller
> and the number of encoders it supports depends on the number
> of streams it supports.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h         |  2 --
>  drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
>  4 files changed, 37 insertions(+), 3 deletions(-)
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
> index 12dcb32b472497f9e59619db4e810abfbf610c7c..0b9d9207f4f69e0d0725ff265c624828b5816a8b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -653,7 +653,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  	struct msm_display_info info;
>  	bool yuv_supported;
>  	int rc;
> -	int i;
> +	int i, stream_id;
> +	int stream_cnt;
>  
>  	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
>  		if (!priv->kms->dp[i])
> @@ -676,6 +677,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>  			return rc;
>  		}
> +
> +		stream_cnt = msm_dp_get_mst_max_stream(priv->kms->dp[i]);
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
> +				rc = msm_dp_mst_drm_bridge_init(priv->kms->dp[i], encoder);

This is an implementation detail. We should be asking to init MST, which
might or might not be a bridge.

> +				if (rc) {
> +					DPU_ERROR("dp mst bridge %d init failed, %d\n",

DP, MST, no 'bridge'.

> +						  stream_id, rc);
> +					continue;
> +				}
> +			}
> +		}
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index 8fe6cbbe741da4abb232256b3a15ba6b16ca4f3e..d73e3f908439094532e88945ed4d41ed092051c9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -82,8 +82,6 @@ struct msm_dp_mst_connector {
>  	struct msm_dp_panel *dp_panel;
>  };
>  

> -int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
> -

Squash this and the next chunks to the corresponding patches.

>  int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
>  
>  void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 985db9febd98e35dfed51d39dac1a522abe5a351..3e64ec7b7dbe1d1107e85def9aa80277131f40bf 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -363,6 +363,9 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
>  			       const struct drm_display_mode *mode);
>  bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
>  
> +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
> +int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> +
>  #else
>  static inline int __init msm_dp_register(void)
>  {
> @@ -379,6 +382,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
>  	return -EINVAL;
>  }
>  
> +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> +{
> +	return -EINVAL;
> +}
> +
> +static inline int msm_dp_mst_drm_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
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
