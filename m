Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5981B34EDD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 00:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAC910E599;
	Mon, 25 Aug 2025 22:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kkgf964o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5A110E37D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 22:18:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PHUX7Y021029
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 22:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6Ie393XGfhaHZ0Us6yXgzMFw
 LUpvRvDwsjf8xQ5Wbcs=; b=kkgf964oa7jkEbAPaxIw+eB7CnTrPrpjz6us7Qcr
 +FbgGWIflQnYdI5iW0RtNdz+od2nphnzOmgI2Eat5WdfYjtLZOGjz1BgQpI+n93V
 FfYbl09yvJepz9SPQOrdimTtpFLgd31QTqt+tY0LKe5UCkkX4Xl5i/SywG5HvNbL
 wJmNKvA6jGvh3d+lupwZSCiSeX0o2+16t7S7V5AflR590DBskfz3htTQHLEun48q
 WCCXfOWb7NOEuhayI7TLNGFRkAY8jodlge87/o45c8AVfKTvt84NRdH8wMydL/rK
 /3Yyw09eQPgZXF4PpphUjz0kxujUUdSK4P9nCUDDIiUEKw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x86n7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 22:18:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b109bd3fa0so49476941cf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 15:18:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756160310; x=1756765110;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Ie393XGfhaHZ0Us6yXgzMFwLUpvRvDwsjf8xQ5Wbcs=;
 b=eA+zaLfXsdHcs4Q84wEoga9MwyOgXTY3qtoXV8lVqvf/kzziuVHgN6Igb1lFSiI1j8
 Z3odU6NfL0ZEQ6cfWPLIlmbOVwq3uJ+n1R0IQ0vG7rAMQpSkGo3qxR0GPKk6mNwAfbTP
 bnriMEToV31FctnMrhqm1CevaegFqGK+Z+oVH/jbhxuaHzJ11NwgfnFvreEiGiLp7fkH
 faNL4rTV3liJkTiUcR8RVHdkVi025ZZ6fFToLgJX5L2MHGSlCWry7g+PKNJ/qA6h7rCh
 GklEnRAAamyRGi7HouOexSqa/vA27E9CbJ/7J+u6YlYK9xK5wgIFi/3ett/w28C1fEag
 fhJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU76vIjUz0r6ejD6/UQM5pOwwtvdQuXBpZinJa3WMIK6NMSmdvkqNHQLsW5jYl1p1hlwQexXtUSpdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrS0iL0cF7a3aSXiQy4OORXO3BCx6MWH4odbcCtHh+vadDHPiO
 6fIVBxfcJuf9ypJu8ONQUI2kP5va2VdlXW4oQH0NLYlz7/Aig/tax9joL+NzAQRFZVyXlCmA1uG
 JTLv6LHdzvsA9vw8XPyZafa5K7IzWuEzu4lF3oqgmmyI9ZkRf+QApJ34fmJi9L2nHb/RQcCQ=
X-Gm-Gg: ASbGnctTq+DK1I0mPRbJOC4BFB6K0JTgEM+Aw04/CIioW7xmdZffkOBIHD4BTs63aYG
 euIHNblEAIZSsGbm+JpP/00U0JtWf/C7AiGezxXobKMGHSJdZFvZC4E3y4botq2YjHeStIKuHI5
 o5o9SEvLaiM+HNo1PI6uzB4pkOVJRQFW9ciWbPmXWPlVk7qJrzIZFPt0pLeFRuRmZ3AgJCxmDFv
 FucnsaoeTOCJokRQ2o8Z/V8uwhrFxTEpx0NvUofkaf/FXLGYUtKDx93fJwt0UyPU1aP0YM/IVTc
 NLv6NjpNIOhUyyh6GKTlO7Et93lwOxL81h9mQ0Vb/mY2562fjlg+FCvlSElL6vbg2hXjFxybXBd
 fUQaEcn6MvRQ1lxGbHeXi3s8YXYq+HyctBr8LXhFtQUQgIycm0W59
X-Received: by 2002:a05:622a:494:b0:4b0:8eb3:7c9e with SMTP id
 d75a77b69052e-4b2aaa9507emr138550781cf.36.1756160310227; 
 Mon, 25 Aug 2025 15:18:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwgt1vEz2gXMrLQpWwvX6melW5EcGvji+K/cgoy8aqU+Ga0jrWISvg+KVNNOXH4k4qNO/GkQ==
X-Received: by 2002:a05:622a:494:b0:4b0:8eb3:7c9e with SMTP id
 d75a77b69052e-4b2aaa9507emr138550331cf.36.1756160309464; 
 Mon, 25 Aug 2025 15:18:29 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f3fe78b1fsm1327329e87.134.2025.08.25.15.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 15:18:28 -0700 (PDT)
Date: Tue, 26 Aug 2025 01:18:26 +0300
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
Subject: Re: [PATCH v3 23/38] drm/msm/dp: abstract out the dp_display stream
 helpers to accept a panel
Message-ID: <f6y7h2nikuqedo64nqzh27fjteyyvndfeqakqw3ce2cvcz4v7s@jmpwlgoqsw3i>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-23-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-23-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: a957sNDFVK7ZuktLxAGckXVhFiHsvirk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX71ZO+4IWEcUH
 8mRf79zXQUSVSkFJ7FWWQ7BVcGEhJUJicFQAigtgtYrXYjGnaVYb/T1BS0K/FlQYT3Svj5a3Tfb
 mEiHKmRqNDsvR6ZyOO4Igm/3vN70q2Q3kpKLxsCM1qqfyTOKey5uJNaFE0H7BAu/Mx/lNP3r3is
 lBYoSADpcnGiiimP7DXBHvuZqyyicsKHF/M/a51UQcDek3n8nKfLfMX7G+eUz0+yvEPy1d3uWZv
 hbrEt3lQ9+cD+OavWnYIChKEWQwhYVs9ez+NSJ4zQOxke9PRcT5XSQAthe+ZIJhgtGOOAc16WFC
 BDSxkpdVYl+Kpa2gYRwOJSBVKMLx6Qt08TVWmhrJXriP0EWqzhWv8Vq89MZv57UE4D2rghaYm/q
 tB/nk73T
X-Proofpoint-GUID: a957sNDFVK7ZuktLxAGckXVhFiHsvirk
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ace137 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=8K8LDW8wUMBAfiAu:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=8-mp4fwYeUK2sr-pB3oA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On Mon, Aug 25, 2025 at 10:16:09PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Currently the dp_display bridge helpers, in particular the
> dp_display_enable()/dp_display_disable() use the cached panel.
> To be able to re-use these helpers for MST use-case abstract the
> helpers to use the panel which is passed in to them.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 138 +++++++++++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  12 ++++
>  2 files changed, 102 insertions(+), 48 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e02ada7a3dc3b89618aeadd998e9a41236ee6bbf..0815973e6597492e09f33359d9777c0e8ce31e0d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -695,6 +695,11 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>  
>  	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
>  
> +	if (msm_dp_display->prepared) {

Why is it a part of this patch?

> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> +		return 0;
> +	}
> +
>  	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
>  	if (rc) {
>  		DRM_ERROR("failed to pm_runtime_resume\n");
> @@ -722,7 +727,8 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>  	return rc;
>  }
>  
> -static int msm_dp_display_enable(struct msm_dp_display_private *dp)
> +static int msm_dp_display_enable(struct msm_dp_display_private *dp,
> +				 struct msm_dp_panel *msm_dp_panel)

These changes look fine, but they raise an interesting question: should
we rework the interface, making the msm_dp_panel the top-level object,
which then controls the ctrl, link, etc.?

>  {
>  	int rc = 0;
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> @@ -733,7 +739,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>  		return 0;
>  	}
>  
> -	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel, dp->max_stream);
> +	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
>  	if (!rc)
>  		msm_dp_display->power_on = true;
>  
> @@ -779,37 +785,17 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
>  	msm_dp_display->audio_enabled = false;
>  }
>  
> -static int msm_dp_display_disable(struct msm_dp_display_private *dp)
> +static int msm_dp_display_disable(struct msm_dp_display_private *dp,
> +				  struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
>  	if (!msm_dp_display->power_on)
>  		return 0;
>  
> -	msm_dp_panel_disable_vsc_sdp(dp->panel);
> +	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
>  
> -	/* dongle is still connected but sinks are disconnected */
> -	if (dp->link->sink_count == 0) {
> -		/*
> -		 * irq_hpd with sink_count = 0
> -		 * hdmi unplugged out of dongle
> -		 */
> -
> -		/* set dongle to D3 (power off) mode */
> -		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
> -		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
> -		msm_dp_ctrl_off_link(dp->ctrl);
> -		/* re-init the PHY so that we can listen to Dongle disconnect */
> -		msm_dp_ctrl_reinit_phy(dp->ctrl);
> -	} else {
> -		/*
> -		 * unplugged interrupt
> -		 * dongle unplugged out of DUT
> -		 */
> -		msm_dp_ctrl_off_pixel_clk(dp->ctrl, dp->panel->stream_id);
> -		msm_dp_ctrl_off_link(dp->ctrl);
> -		msm_dp_display_host_phy_exit(dp);
> -	}
> +	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);

This doesn't seems to be a part of this patch. Maybe move it to the
previous patch, reworking this piece of code?

>  
>  	msm_dp_display->power_on = false;
>  
> @@ -1538,52 +1524,90 @@ void msm_dp_display_atomic_prepare(struct msm_dp *msm_dp_display)
>  	return;
>  }
>  
> -void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
> +void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp_display_private *dp;
>  	int rc = 0;
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0, 0);
> -

Please, don't mix different kinds of refactoring. You've promised to
bring in msm_dp_panel as an argument, but then you are also
restructuring functions. Try making your changes more logical or atomic.

>  	if (msm_dp_display->prepared) {
> -		rc = msm_dp_display_enable(dp);
> +		rc = msm_dp_display_enable(dp, msm_dp_panel);
>  		if (rc)
>  			DRM_ERROR("DP display enable failed, rc=%d\n", rc);
>  
>  		rc = msm_dp_display_post_enable(msm_dp_display);
>  		if (rc) {
>  			DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
> -			msm_dp_display_disable(dp);
> +			msm_dp_display_disable(dp, msm_dp_panel);
>  		}
>  	}
>  
>  	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
>  }
>  
> -void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
> +void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>  {
>  	struct msm_dp_display_private *dp;
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> -	msm_dp_ctrl_push_idle(dp->ctrl, dp->panel);
> +	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0, 0, 0);
> +
> +	msm_dp_display_enable_helper(msm_dp_display, dp->panel);
> +}
> +
> +void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
> +				   struct msm_dp_panel *msm_dp_panel)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	msm_dp_ctrl_push_idle(dp->ctrl, msm_dp_panel);
>  	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl,
>  		dp->max_stream);
>  	msm_dp_ctrl_mst_send_act(dp->ctrl);
>  }
>  
> -static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> +void msm_dp_display_atomic_disable(struct msm_dp *msm_dp_display)
>  {
> -	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	msm_dp_display_disable_helper(msm_dp_display, dp->panel);
> +}
> +
> +void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	if (!msm_dp_display->prepared) {
> +		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> +		return;
> +	}
> +
> +	/* dongle is still connected but sinks are disconnected */
> +	if (dp->link->sink_count == 0)
> +		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
> +
> +	msm_dp_ctrl_off_link(dp->ctrl);
> +
> +	/* re-init the PHY so that we can listen to Dongle disconnect */
> +	if (dp->link->sink_count == 0)
> +		msm_dp_ctrl_reinit_phy(dp->ctrl);
> +	else
> +		msm_dp_display_host_phy_exit(dp);
>  
>  	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
>  
>  	msm_dp_display->prepared = false;
>  }
>  
> -void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
> +void msm_dp_display_atomic_post_disable_helper(struct msm_dp *dp, struct msm_dp_panel *msm_dp_panel)
>  {
>  	struct msm_dp_display_private *msm_dp_display;
>  
> @@ -1597,28 +1621,46 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
>  
>  	msm_dp_display_audio_notify_disable(msm_dp_display);
>  
> -	msm_dp_display_disable(msm_dp_display);
> +	msm_dp_display_disable(msm_dp_display, msm_dp_panel);
> +
> +	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
> +}
> +
> +void msm_dp_display_atomic_post_disable(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	msm_dp_display_atomic_post_disable_helper(msm_dp_display, dp->panel);
>  
>  	msm_dp_display_unprepare(msm_dp_display);
> +}
>  
> -	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
> +void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp,
> +				    const struct drm_display_mode *mode,
> +				    const struct drm_display_mode *adjusted_mode,
> +				    struct msm_dp_panel *msm_dp_panel)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
> +
> +	msm_dp_display_set_mode(msm_dp, adjusted_mode, msm_dp_panel);
> +	/* populate wide_bus_support to different layers */
> +	dp->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
> +		false : dp->wide_bus_supported;
>  }
>  
> -void msm_dp_display_mode_set(struct msm_dp *dp,
> +void msm_dp_display_mode_set(struct msm_dp *msm_dp,
>  			     const struct drm_display_mode *mode,
>  			     const struct drm_display_mode *adjusted_mode)
>  {
> -	struct msm_dp_display_private *msm_dp_display;
> -	struct msm_dp_panel *msm_dp_panel;
> -
> -	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
> -	msm_dp_panel = msm_dp_display->panel;
> +	struct msm_dp_display_private *dp;
>  
> -	msm_dp_display_set_mode(dp, adjusted_mode, msm_dp_panel);
> +	dp = container_of(msm_dp, struct msm_dp_display_private, msm_dp_display);
>  
> -	/* populate wide_bus_support to different layers */
> -	msm_dp_display->ctrl->wide_bus_en = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ?
> -		false : msm_dp_display->wide_bus_supported;
> +	msm_dp_display_mode_set_helper(msm_dp, mode, adjusted_mode, dp->panel);
>  }
>  
>  void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index fa92f763d2304f15af7c4e1e7e8aab5a6ffd3459..20b7ed735b3f428e894b82ae2756d0efcfa47624 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -51,5 +51,17 @@ enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>  int msm_dp_display_set_stream_info(struct msm_dp *dp_display, struct msm_dp_panel *panel,
>  				   enum msm_dp_stream_id stream_id,
>  				   u32 start_slot, u32 num_slots, u32 pbn, int vcpi);
> +void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display,
> +				  struct msm_dp_panel *msm_dp_panel);
> +void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
> +				   struct msm_dp_panel *msm_dp_panel);
> +void msm_dp_display_mode_set_helper(struct msm_dp *msm_dp_display,
> +				    const struct drm_display_mode *mode,
> +				    const struct drm_display_mode *adjusted_mode,
> +				    struct msm_dp_panel *msm_dp_panel);
> +void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
> +					       struct msm_dp_panel *msm_dp_panel);
> +
> +void msm_dp_display_unprepare(struct msm_dp *dp);
>  
>  #endif /* _DP_DISPLAY_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
