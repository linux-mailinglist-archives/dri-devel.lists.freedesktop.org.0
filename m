Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C613B34C1D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 22:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D4610E55A;
	Mon, 25 Aug 2025 20:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PgXu6Sjt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA88510E363
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 20:35:36 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFflvX010519
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 20:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=yAvDexHvFvVoJW4KVsl9EQO3
 3UW9a1WIuE20kaTFqaA=; b=PgXu6SjtXcpQPUtmEFuPi341ur7MZqRobaTW5GXF
 uSUp7McW1hSPDkGCJh1Bjb/cJ3lDrDeB+7H2ID0j5O/82iICQbCLcUEJX04UEk4y
 0jaX/1CSNLIiCb8XF3I5FCwj2fYopopFQnRxodjjkIF2ymueFfs6ZdsRu3slGorf
 w4D5FnAHThKIfkRdbS/3ztFvrvTwUnp0K/xcg3/oqOFZon/Sv6ViMnJzc1Sp5pgd
 r7GL7cmG7mX4qjI4/SCInXBjEmHuT3QGm3Z6TqUnmtvnVsObo2I+DpwcfNzAXblZ
 K0J/5ChIsFvdOYLKIa1K+KGZC/Md32JJfSm9HWPZIBpu7Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thxdwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 20:35:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b295536c25so90663861cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 13:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756154135; x=1756758935;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yAvDexHvFvVoJW4KVsl9EQO33UW9a1WIuE20kaTFqaA=;
 b=SaS7SqmeLzYoy3rJlnfr+gJ1xGY11MYvVRazDaUAS/Af1h+D5pmolGO8NILUYCl/DU
 7IACGLMPPf6ZOQNKRogvaHE1cmwHYNCOzPTRFKWnKNVy89CL2GVG65Z+9PUMaIlcFueM
 hk3sMrgPfNaNCDWw6Wv78uZYDbenZlu5rme127hGS40Adu+Bvxji9PglBHaA94Hcu9k9
 6yzNATkeN0wTBznKkxdeXosp2h3wnO0K3Gi4QvZMoVAIcHGJ/NTPhOMH5XUrbcfftBrD
 6PH+F3nn9fCt3uQZXvZSjJ32A58deVhZjg24qorL/GzaT/S3Qn9yf+UC4EPYa5PphzeU
 mjHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyZvutiheRIKqglgnu4BgNoxSCYJ9QfkbezufN/rdcIQdNAayo3paiRlqdwj7ax8l9fQ1ZiDKRk+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbtV65bd8ZAapmPw9/cs4xWgt1kbc8JgoqXuxIXoA6u8BlXws2
 L3O/Hh8d1I7KuikADUp2xvY379KF75oCMlk1BcS+A9Q2be0OUq+q2Cgx8Q/ShOWe1YWvAQPYI8b
 267WWJrHvcFNMM4MK6NdDIry3YuQinzP99n0u96AXCHamAP/xB86pA5Q/ENFJ+rq1lWWxgYo=
X-Gm-Gg: ASbGncuPvRwipfp2JhRN+BiFw+W3FZ0c8SYjPcxbXnw65qbqGch1FsJREfYgFQZzTGm
 nA+JlbC/Y8ormM23E1gmsaoHwFq0QxtLO/O9K3E01KeOSQSab/w4Ma/zOHQJ1sOEckSxsEWR4RZ
 Zq3TAfv+ktyhC+TTpf/ltxkpKkolxId4BD8lR3czZ25kqcz27knx/jCrWdwy4/wfEiCPIqMsvVA
 i66c+H39bQKCTU8MaBKAnnK/4K6lABv2y99ffEZ85VG69zzE0fysmHeeDw+MS91RH13GemI8lxT
 3gRXY35QnKcMnMrN4n+0p2HQoCkDaPqcnpDcQLl793qd/GOnrofiknObqhP3BXuptKdC0orIFyJ
 Fm0NPpo9hb2s89xR1ZVtygK/JdHbOdbWf+nsta+ZP2nnUT54UHhqd
X-Received: by 2002:a05:622a:4c7:b0:4b0:61fa:19b4 with SMTP id
 d75a77b69052e-4b2aaaf9fd3mr148023091cf.46.1756154134846; 
 Mon, 25 Aug 2025 13:35:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTxiwt2uolX8Aw9ZSuuS6XRndHBCwOU955PX0YNpOUiIwP0WQiM9f0I04RKUylBqfzH/cMJg==
X-Received: by 2002:a05:622a:4c7:b0:4b0:61fa:19b4 with SMTP id
 d75a77b69052e-4b2aaaf9fd3mr148022881cf.46.1756154134337; 
 Mon, 25 Aug 2025 13:35:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c99ff5sm1778909e87.117.2025.08.25.13.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 13:35:33 -0700 (PDT)
Date: Mon, 25 Aug 2025 23:35:31 +0300
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
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/38] drm/msm/dp: Add catalog support for 3rd/4th
 stream MST
Message-ID: <j6n7jntsapy53ojyackylfctouuyu762pjf5dsbjhwoti6cos6@5ppukry35xo5>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-16-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-16-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX3G29QFpvrf1q
 5ZVL+gHPa7CJnz3UgKU5dIIku0CG0lpZuR9WxMQTqDH4AQA7qFPhrzOP+nXoWB1mnxGDeBKElM+
 BaHvgIlvimDJMyoU+a8Qkd9UOpeT8leU4sYX3nz3JF+u4fa+r3Njw7svcXVr55HCMl3uHRFC1yf
 rELS73XY9m9joPMEyuw9OHG5nQuvJ3IfCvSKat8FG5dThZoe/nqAwIqZ1Exv1cdzqOhGQeLeZY1
 kSVSuk+emq1aXZ/2FL9hIc+Q4ZLguIOhP5E3cr+8K+yRMGrI7GhABc9DFRHo5X2REquHT1TSIyy
 l0xmwGy5WwUM2j7v43CGzaz8E0JgHpUorsYz32/l02SJTMJl3frxVYgRWm5HlLMAt/pNrGuhzP6
 oBy1Z8us
X-Proofpoint-ORIG-GUID: EhxV941phFOyWTUNoxIRPImtkUkVNmKA
X-Proofpoint-GUID: EhxV941phFOyWTUNoxIRPImtkUkVNmKA
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68acc918 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=-oqhLQCYqG34RGAAmHUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_09,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
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

On Mon, Aug 25, 2025 at 10:16:02PM +0800, Yongxing Mou wrote:
> To support 4-stream MST, the link clocks for stream 3 and stream 4
> are controlled by MST_2_LCLK and MST_3_LCLK. These clocks share the
> same register definitions but use different base addresses.
> 
> This patch adds catalog support to enable programming of these blocks.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  82 ++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  24 ++++++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 138 ++++++++++++++++++++++++++++++------
>  drivers/gpu/drm/msm/dp/dp_panel.h   |   4 +-
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  14 ++++
>  6 files changed, 230 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index b8b6a09966aed96f705bdd54cb16ea63e5f0141f..608a1a077301b2ef3c77c271d873bb4364abe779 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -118,6 +118,8 @@ struct msm_dp_ctrl_private {
>  	struct msm_dp_link *link;
>  	void __iomem *ahb_base;
>  	void __iomem *link_base;
> +	void __iomem *mst2link_base;
> +	void __iomem *mst3link_base;
>  
>  	struct phy *phy;
>  
> @@ -172,6 +174,40 @@ static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
>  	writel(data, ctrl->link_base + offset);
>  }
>  
> +static inline u32 msm_dp_read_mstlink(struct msm_dp_ctrl_private *ctrl,
> +				       enum msm_dp_stream_id stream_id, u32 offset)
> +{
> +	switch (stream_id) {
> +	case DP_STREAM_2:
> +		return readl_relaxed(ctrl->mst2link_base + offset);
> +	case DP_STREAM_3:
> +		return readl_relaxed(ctrl->mst3link_base + offset);
> +	default:
> +		DRM_ERROR("error stream_id\n");
> +		return 0;

I'd totally prefer having a single set of wrappers which can handle all
4 streams. Having separate call sequences is not a good idea and it
makes it hard to change / extend it.

> +	}
> +}
> +
> +static inline void msm_dp_write_mstlink(struct msm_dp_ctrl_private *ctrl,
> +			       enum msm_dp_stream_id stream_id, u32 offset, u32 data)
> +{
> +	/*
> +	 * To make sure link reg writes happens before any other operation,
> +	 * this function uses writel() instread of writel_relaxed()
> +	 */
> +	switch (stream_id) {
> +	case DP_STREAM_2:
> +		writel(data, ctrl->mst2link_base + offset);
> +		break;
> +	case DP_STREAM_3:
> +		writel(data, ctrl->mst3link_base + offset);
> +		break;
> +	default:
> +		DRM_ERROR("error stream_id\n");
> +		break;
> +	}
> +}
> +
>  static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
>  					struct msm_dp_link_info *link)
>  {
> @@ -386,7 +422,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  	u32 config = 0, tbd;
>  	u32 reg_offset = 0;
>  
> -	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> +	if (msm_dp_panel->stream_id < DP_STREAM_2)
> +		config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> +
> +	if (msm_dp_panel->stream_id == DP_STREAM_1)
> +		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
>  
>  	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>  		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> @@ -401,8 +441,11 @@ static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
>  
>  	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
>  
> -	if (msm_dp_panel->stream_id == DP_STREAM_1)
> -		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
> +	if (msm_dp_panel->stream_id > DP_STREAM_1)
> +		msm_dp_write_mstlink(ctrl, msm_dp_panel->stream_id,
> +			REG_DP_MSTLINK_CONFIGURATION_CTRL, config);
> +	else
> +		msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL + reg_offset, config);
>  }
>  
>  static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)

[...]

> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 43a9ce0539906e1f185abf250fdf161e462d9645..a806d397ff9d9ad3830b1f539614bffcc955a786 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -142,6 +142,7 @@
>  
>  #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
>  #define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
> +#define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)

Please don't mix registers from different register spaces, it's
confusing.

>  #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
>  #define DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN (0x00000002)
>  #define DP_CONFIGURATION_CTRL_P_INTERLACED	(0x00000004)
> @@ -163,12 +164,19 @@
>  #define REG_DP1_SOFTWARE_MVID			(0x00000414)
>  #define REG_DP1_SOFTWARE_NVID			(0x00000418)
>  #define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
> +#define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
> +#define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
> +#define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
>  #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
> +#define REG_DP_MSTLINK_START_HOR_VER_FROM_SYNC	(0x0000004C)
>  #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
> +#define REG_DP_MSTLINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
>  #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
> +#define REG_DP_MSTLINK_ACTIVE_HOR_VER		(0x00000054)
>  
>  #define REG_DP_MISC1_MISC0			(0x0000002C)
>  #define REG_DP1_MISC1_MISC0			(0x0000042C)
> +#define REG_DP_MSTLINK_MISC1_MISC0		(0x00000058)
>  #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
>  #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
>  #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
> @@ -236,9 +244,11 @@
>  
>  #define MMSS_DP_SDP_CFG				(0x00000228)
>  #define MMSS_DP1_SDP_CFG			(0x000004E0)
> +#define MMSS_DP_MSTLINK_SDP_CFG		(0x0000010c)
>  #define GEN0_SDP_EN				(0x00020000)
>  #define MMSS_DP_SDP_CFG2			(0x0000022C)
>  #define MMSS_DP1_SDP_CFG2			(0x000004E4)
> +#define MMSS_DP_MSTLINK_SDP_CFG2		(0x0000011c)
>  #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
>  #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
>  #define GENERIC0_SDPSIZE_VALID			(0x00010000)
> @@ -248,6 +258,7 @@
>  
>  #define MMSS_DP_SDP_CFG3			(0x0000024c)
>  #define MMSS_DP1_SDP_CFG3			(0x000004E8)
> +#define MMSS_DP_MSTLINK_SDP_CFG3		(0x00000114)
>  #define UPDATE_SDP				(0x00000001)
>  
>  #define MMSS_DP_EXTENSION_0			(0x00000250)
> @@ -297,6 +308,9 @@
>  #define MMSS_DP_GENERIC1_8			(0x00000348)
>  #define MMSS_DP_GENERIC1_9			(0x0000034C)
>  #define MMSS_DP1_GENERIC0_0			(0x00000490)
> +#define MMSS_DP_MSTLINK_GENERIC0_0		(0x000000BC)
> +#define MMSS_DP_MSTLINK_GENERIC0_1		(0x000000C0)
> +#define MMSS_DP_MSTLINK_GENERIC0_2		(0x000000C4)
>  
>  #define MMSS_DP_VSCEXT_0			(0x000002D0)
>  #define MMSS_DP_VSCEXT_1			(0x000002D4)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
