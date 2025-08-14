Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B06B260EE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F6A10E822;
	Thu, 14 Aug 2025 09:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jVE2F0nw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0A310E2A3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:29:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9TI31031956
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FL3/ptxAPGZeetpJTOOhZsvI
 cBBm9/7MW4kBRnciYeI=; b=jVE2F0nwPKvxXlR1eGcue/VMfBEG2mSvHVwMi+/c
 QNf5QUQCJA/j8xmp6px+lmRQ9hC2La/INsHv08L04JljgzkkA4MtIKcSgT4xAJ8O
 Noatli7ZMmsain78kJR2Grx+VjTpljd4L5eFQZwIbTCtSvJElfx8pKYzSSTeg1xh
 iRou/TvAFxu41iabA37HFJoh7BZG6emm8Dsnbq07RSxRuuJs2iS7Z7bRO9TQ5PG6
 K7PtMStRvGZUNjyypACVSYZs9yx26KQFtLm1cCDsLNU+Eg9oVkBtQ6D0+dWfLrlO
 WTerNG2Qcu3ZOQvSYyZrclzVkUmrGtRCONVNZe08rdYaYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4k41e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:29:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109bb3e22so22464171cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163797; x=1755768597;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FL3/ptxAPGZeetpJTOOhZsvIcBBm9/7MW4kBRnciYeI=;
 b=hmNK8kOrZdXPmJtCVUU8Jo6Ni9B+nkcp4+a2TAGD/SjCjvYl1xgpOn4ooURVpJPbKV
 n+XY8MirL8Jg0r39QEFNMTJ3DWKVcXWkCZo8tMAt9rmamD659LzxsqIYb2VSAjls+7Tb
 MCu2MHdhr04M+c/yKJx+fWXsfGarI0br2Tq42b+GtE7o/7eE6a9Hw/hP8G0zO9vbsjlO
 9frO6yqyVmxebMfLl7xiNnd4rqs1kyXVUqemuJyiPLzOysCy2GMt8zH1hYI1m5mTzUbm
 YR0IN5igRvVBqsxO1yMuk3ktY8+qmXhbaxfA0qSsbWkjNpReioddZqR1AgI1wJpaX1un
 GciA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSpovuupA0ePtpDMojBOInndV4LMbKi3m0yYc5hK70QEprCB40FeLcc77uxxLw1+wzEKJN9xG8V78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGJcroeOTzbA+K4dzOKdEZspMgo/dU8ajS4ugxBJNtCLOUYWYP
 NWRqNhAy38SB/HTEK7heYJ6xj5eVIovFLtCJwKmJfdb7/LDFJeM2jDL5J7+6W84zroPhmud0ZVK
 OuAvaemBS8h5hCpufZ9vRwA50kYLB+ULmrWxblYfozJBGAMK3iwe14RpIm5Iq1JTX1nPIqYc=
X-Gm-Gg: ASbGnctCjEC3t41vLck52qpcOK3fyoeoy/CUggXfyOxXJUM3YdMo1TlMTb13zClQ7NU
 dVtaW0IPzRUJ+WNeemp0npK4b7Iix3l+BVlGGawlh8SRaoHXlf5O8lwF8KOuRa5ZjMcu6qzQnyZ
 FfCn+XD+TB8M9JG0etPdXsUfZGwp2movX+PCT1Hhwm91wl/FoabyFlc7LNMLTBtIwECi0J/Q/yP
 YOCU1cdkJVmNL8DOhruWmJWPUOdBvagceEkHT4AnD8pSnVb5V6itJTh7JUyxuYl3R5N+9LB1Qsj
 ljX+zjjybIV/9nR3Wvrdysfg87F74HKVq7lthzaPQTeNNasIZxEMjSmMpA7Sqbx9FlEM1jPiL44
 v/TYMenO8OxuAESb6xfizRld87BRqG0k8LLJ2kabUwV9Wm9VXCGiU
X-Received: by 2002:a05:622a:1803:b0:4b0:8633:f961 with SMTP id
 d75a77b69052e-4b10a7f1cf6mr38704111cf.0.1755163796514; 
 Thu, 14 Aug 2025 02:29:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9T5HYQtpktRO2l+LtxEy3BFQJdwJVqtkYfElbmhIzFfLJiWTx4n+elHd4coAchUyGuL9mJQ==
X-Received: by 2002:a05:622a:1803:b0:4b0:8633:f961 with SMTP id
 d75a77b69052e-4b10a7f1cf6mr38703771cf.0.1755163796002; 
 Thu, 14 Aug 2025 02:29:56 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bbc4sm5686391e87.15.2025.08.14.02.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:29:55 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:29:53 +0300
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
Message-ID: <ev76u4tzwvzb2gyp65a3ybng4uqyoxphprv5s35e5skkzcuv3d@m2br6djtzkdc>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-33-a54d8902a23d@quicinc.com>
 <hxqeilu5fcgsykghxwbhp4r3exu3o45n5lftzeupjxam7r7ux7@wdrfc6lor4gl>
 <01ccebf2-1a2c-4996-8b56-1fb951a6d8c6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01ccebf2-1a2c-4996-8b56-1fb951a6d8c6@quicinc.com>
X-Proofpoint-GUID: qPLAJ6nLxI_IYOca8H_FtD9nP5hJa1eY
X-Proofpoint-ORIG-GUID: qPLAJ6nLxI_IYOca8H_FtD9nP5hJa1eY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX0S+oG4ZBhEVh
 EiMtjwJ1lMLFCQ0IYG7MLlY7sLhXtk15MSoKFEz+5Is8FQDrZOojNIMEftYJPO0zUN19BbZgzqz
 NXfZZJQnC3HgmFAk7y6DOanvA9pkgnB+V4FnmvKp8QB+3tus+kKy4yUz1j4VfUJ1ABEoAO7+wk/
 TN9+qJaDrxaBl5w8P1Xe5WNKaPg4ArasF4rDTJzIwujgEbDff+NouN0aqDe1q3+NzKnSXd2OkbW
 KtXiXBIikg3xLAHz7lKkE9xsJ/b+1TGrKS7zwdWGA6x6EK8s/kQ4Z1qqLRMHCxi0f4uMMUEAzpl
 U8NIb3v/TFLsWduQGQIdled28W81NRuNltE6KZf/q5hXFsxxkaAtzs+KoR4EzsLfnLPN33iUK/w
 prf/8M5y
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689dac95 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=XsrrDBSZIwLvDsITJuUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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

On Thu, Aug 14, 2025 at 05:11:13PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/6/9 22:17, Dmitry Baryshkov wrote:
> > On Mon, Jun 09, 2025 at 08:21:52PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Initiliaze a DPMST encoder for each  MST capable DP controller
> > > and the number of encoders it supports depends on the number
> > > of streams it supports.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 23 ++++++++++++++++++++++-
> > >   drivers/gpu/drm/msm/dp/dp_display.c         | 14 ++++++++++++++
> > 
> > Please don't mix DP and DPU changes in a single patch.
> > 
> Got it, thanks, will separate it.
> > >   drivers/gpu/drm/msm/msm_drv.h               | 13 +++++++++++++
> > >   4 files changed, 51 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > index ca1ca2e51d7ead0eb34b27f3168e6bb06a71a11a..2eb4c39b111c1d8622e09e78ffafef017e28bbf6 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> > > @@ -28,6 +28,7 @@
> > >    * @h_tile_instance:    Controller instance used per tile. Number of elements is
> > >    *                      based on num_of_h_tiles
> > >    * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
> > > + * @stream_id		stream id for which the interface needs to be acquired
> > >    * @vsync_source:	Source of the TE signal for DSI CMD devices
> > >    */
> > >   struct msm_display_info {
> > > @@ -35,6 +36,7 @@ struct msm_display_info {
> > >   	uint32_t num_of_h_tiles;
> > >   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> > >   	bool is_cmd_mode;
> > > +	int stream_id;
> > >   	enum dpu_vsync_source vsync_source;
> > >   };
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > index 1fd82b6747e9058ce11dc2620729921492d5ebdd..45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > @@ -652,7 +652,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> > >   	struct msm_display_info info;
> > >   	bool yuv_supported;
> > >   	int rc;
> > > -	int i;
> > > +	int i, stream_id;
> > > +	int stream_cnt;
> > >   	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
> > >   		if (!priv->dp[i])
> > > @@ -675,6 +676,26 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> > >   			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> > >   			return rc;
> > >   		}
> > > +
> > > +		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
> > > +
> > > +		if (stream_cnt > 1) {
> > > +			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
> > > +				info.stream_id = stream_id;
> > > +				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
> > > +				if (IS_ERR(encoder)) {
> > > +					DPU_ERROR("encoder init failed for dp mst display\n");
> > > +					return PTR_ERR(encoder);
> > > +				}
> > > +
> > > +				rc = msm_dp_mst_bridge_init(priv->dp[i], encoder);
> > > +				if (rc) {
> > > +					DPU_ERROR("dp mst bridge %d init failed, %d\n",
> > > +						  stream_id, rc);
> > > +					continue;
> > > +				}
> > > +			}
> > > +		}
> > >   	}
> > >   	return 0;
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 9dbcf4553cad70c9e3722160a87403fc815765d7..ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -1417,6 +1417,20 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
> > >   	return connector_type;
> > >   }
> > > +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> > > +{
> > > +	struct msm_dp_display_private *dp_priv;
> > > +
> > > +	dp_priv = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
> > > +
> > > +	return dp_priv->max_stream;
> > > +}
> > > +
> > > +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> > > +{
> > > +	return msm_dp_mst_drm_bridge_init(dp_display, encoder);
> > 
> > What's the point in this oneliner?
> > 
> Emm, here we consider declaring the msm_dp_mst_drm_bridge_init() in
> msm_drv.h and drop the one-line wrapper.

Just do it, please.

> 
> 
> > > +}
> > > +
> > >   static int msm_dp_display_probe(struct platform_device *pdev)
> > >   {
> > >   	int rc = 0;
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > > index a65077855201746c37ee742364b61116565f3794..dd403107b640ee5ef333d2773b52e38e3869155f 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.h
> > > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > > @@ -372,6 +372,9 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
> > >   			       const struct drm_display_mode *mode);
> > >   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> > > +int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
> > > +int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
> > > +
> > >   #else
> > >   static inline int __init msm_dp_register(void)
> > >   {
> > > @@ -388,6 +391,16 @@ static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
> > >   	return -EINVAL;
> > >   }
> > > +static inline int msm_dp_get_mst_max_stream(struct msm_dp *dp_display)
> > > +{
> > > +	return -EINVAL;
> > > +}
> > > +
> > > +static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder)
> > > +{
> > > +	return -EINVAL;
> > > +}
> > > +
> > >   static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
> > >   {
> > >   }
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry
