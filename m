Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C3BB34EF1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 00:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B9FC10E37D;
	Mon, 25 Aug 2025 22:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JSZbpPoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9F710E37D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 22:22:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PGNBaU032260
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 22:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=z+Sk1nW8oCFD8PIbPYjbRyQF
 1Kgwu4pmXehElHXwC2s=; b=JSZbpPoVmu8itHLHlDwDEpPPuMjNWlDxFCLc71fi
 mPmZSJsgCCHUjljxZniGy4fIsy91xXti3YoNGoQn0rJXHX3ktcFPjchXiB6TvDYA
 KB//geg9wxZ02hB9Wmyev9N3E9bZmUWud7od329U1Md3Zfur9bpKVYoKqHz0H7dH
 22J9KZwgxZHpscAsgcCzlSiqVyvT5pWUpoxzoWWrCV6+oAWhAt+gR2cLWvKU25CC
 tUKI7JU55mU4xFEARbcciZbbUwf5Hq1AiX4yQnhY1fzMUtuiazcKWCy4akN+l6T6
 Ecz9VcWlMGTEyqW7p3Rq5Vl11vZswAw7mBuZNePfXXRaeg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thxn0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 22:22:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b10993f679so134765351cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 15:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756160560; x=1756765360;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+Sk1nW8oCFD8PIbPYjbRyQF1Kgwu4pmXehElHXwC2s=;
 b=mK+GXY4EcoV5b03xtPaC/IKK37aFeTbmT9hPZMvKczOc+d2E1OLUlTutX0IOcXDnh0
 6r4LuVZazVoK4tYw70d1v0Ip6X1zgrP9wwbGp8rGk4cGJl5mDS8dQKDDvyiL+YAcPSDN
 EhvjMAGmrGQWH3E7TuHNQMs6YucjZnP0vYcV6Wg4dSgiZTwSfz5Cgt6fhKziDEIJhhSa
 O59s3Ol3L+/+DNB9//Cejgzhd4Gfn9S2rv3A2im71hJ8S0GWjf0NxSa7/IGpUjX3VzWF
 6/uSosXUznZ/2MxLXRfqElpw8+8fI84Z86f4eXDTVvkNeOeNIPlwhYJxCHOWbmxOjI2v
 iYXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0e3ARRXdSMhTbwPANtXQN0v2uQJOy39HiBmqypCl/PQF/0+TGA9bRZNK6O40wsrZi1MLXfHSqzls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxa/iTYq7Dp68lqmd4Mfa0I6wFBYLtuzJK0xwF6Cf0vi0IaOt+c
 3L8brR4WhSrch8qe1Mbe1PI7eqYg1LhdaKZDZQ2C9js+UnpPMWsUunHFvu7qWrjyyIwNpRueR86
 vAOZ4vPIoqSf4zguq0PmoQT3B1Y88L3QIr+H6VVPRPlkmMU2SkkbT/Qrx6oLEOIDlqEDbeYM=
X-Gm-Gg: ASbGncsL8VH8aDdtm+T22iueGw3tCwO50TQ1+vBuMzzuXMgF4cQocxa+JCqZinpzdfc
 IbOKIO/pQWpKhtk18VjQ/gd8VisZCTcccv8Lo0akz9pGfRoQ10P4NOSH3h/fSPSAhtGExbl/Ppk
 HVbo3FW+3dw0jhgZoedM/O0DCBvS/KcJmtbgomQp3k1748/cL37VqRj/wl8L+r+Nz5ESoiNh7tN
 oXVl/gwM2WnxOcEJ5LzJkOyvvjdhVz3IPo4z1oU1ILOMpb5YLKl8ZqFzeuwK59w517lQA9o5waE
 mbuX5etKJlMo5atTG0a56PBnUpZl3Nm1D0XuvqkotVQ9rG3SpFvWIp04ni0mv8MA+VA5sPRPAcT
 PqV1jHHRMBpSNM1v0qaG0JNQyqPTz6tTw+q7eBZNWudcWM1G/LShN
X-Received: by 2002:a05:622a:20b:b0:4af:1f06:6b41 with SMTP id
 d75a77b69052e-4b2aab09776mr142432231cf.59.1756160559836; 
 Mon, 25 Aug 2025 15:22:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqjwC4JyntFz/S1FDvtnJPuev1QpBFI6qoonjH8iJ3qO2TMVArvtg2gonaXQYthNOljvK2Dw==
X-Received: by 2002:a05:622a:20b:b0:4af:1f06:6b41 with SMTP id
 d75a77b69052e-4b2aab09776mr142431941cf.59.1756160559319; 
 Mon, 25 Aug 2025 15:22:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bb90sm1893913e87.98.2025.08.25.15.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 15:22:38 -0700 (PDT)
Date: Tue, 26 Aug 2025 01:22:36 +0300
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
Subject: Re: [PATCH v3 24/38] drm/msm/dp: replace power_on with
 active_stream_cnt for dp_display
Message-ID: <usgc35jyid32flqt2poc2yqaaw3zpji6eh7nqw2zngjslb2mlf@kk7g7sine5fy>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-24-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-24-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX1YYr8Ws/PAkS
 nmu3JAzosFT7ZLD5mOYgsytx4haqGPqxYB09p/20cct/ok3huunizGhQ8Lw6fYRRwyDfq7dEKwq
 xYI63aK8WsLPXY9jA+WWhjbkPAQRiY5ZuzdZTcJX/nk8Ax7qWi4ppuyiVCtgIJ5dmhiEx9nQgEy
 sr8JGHfTfhgb94t4qpVbi4lg3CK7Nz5cngxhRNDJEHmvfJWSS0VBHawdgtaQ51bK5JEmEZ0jwll
 YP/iGmEiHjHnU+W/67dOu+w5y+G3RtxjsUDAQX28aAV5LMouPi0B7d8fczAQq7ZGQb0JXeICE+5
 wujTbTh9V/w5uLP/669obxnDl+mha4glvMPTBf8VLgAYFsefdNohvzKoTnkVZz7d849BD/QzKds
 BNF5cKqj
X-Proofpoint-ORIG-GUID: EeJsiELArVBKjIucLMthOKNjZG9FbWyg
X-Proofpoint-GUID: EeJsiELArVBKjIucLMthOKNjZG9FbWyg
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ace231 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ZugQsj7WvWi4Az5TsbEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_10,2025-08-20_03,2025-03-28_01
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

On Mon, Aug 25, 2025 at 10:16:10PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> For DP MST, the link clock and power domain resources stay on until
> both streams have been disabled OR we receive hotplug. Introduce an
> active_stream_cnt to track the number of active streams and necessary
> state handling. Replace the power_on variable with active_stream_cnt
> as power_on boolean works only for a single stream.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 50 ++++++++++++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  3 ++-
>  3 files changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index 41018e82efa10ec863eb4b60d8df66c23c432fa5..e84c8b8e83d9ec689c0d29e8ac69860a745a4877 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -284,7 +284,7 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
>  	 * such cases check for connection status and bail out if not
>  	 * connected.
>  	 */
> -	if (!msm_dp_display->power_on) {
> +	if (!msm_dp_display_get_active_stream_cnt(msm_dp_display)) {

Why can't it be a part of the public structure?

>  		rc = -EINVAL;
>  		goto end;
>  	}
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 0815973e6597492e09f33359d9777c0e8ce31e0d..e2e6b0ea2f9dbfe49a599ca19b1d205669365c4c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -73,6 +73,8 @@ struct msm_dp_display_private {
>  
>  	bool wide_bus_supported;
>  
> +	u32 active_stream_cnt;
> +
>  	struct msm_dp_audio *audio;
>  
>  	void __iomem *ahb_base;
> @@ -175,6 +177,15 @@ static const struct of_device_id msm_dp_dt_match[] = {
>  	{}
>  };
>  
> +int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display)
> +{
> +	struct msm_dp_display_private *dp;
> +
> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
> +
> +	return dp->active_stream_cnt;
> +}
> +
>  static struct msm_dp_display_private *dev_get_dp_display_private(struct device *dev)
>  {
>  	struct msm_dp *dp = dev_get_drvdata(dev);
> @@ -709,15 +720,17 @@ static int msm_dp_display_prepare(struct msm_dp_display_private *dp)
>  	if (dp->link->sink_count == 0)
>  		return rc;
>  
> -	if (msm_dp_display->link_ready && !msm_dp_display->power_on) {
> +	if (msm_dp_display->link_ready && !dp->active_stream_cnt) {
>  		msm_dp_display_host_phy_init(dp);
>  		force_link_train = true;
>  	}
>  
> -	rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
> -	if (rc) {
> -		DRM_ERROR("Failed link training (rc=%d)\n", rc);
> -		msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
> +	if (!dp->active_stream_cnt) {

Such changes need at least some explanation in the commit message or,
better, split to a separate patch.

> +		rc = msm_dp_ctrl_on_link(dp->ctrl, msm_dp_display->mst_active);
> +		if (rc) {
> +			DRM_ERROR("Failed link training (rc=%d)\n", rc);
> +			msm_dp_display->connector->state->link_status = DRM_LINK_STATUS_BAD;
> +		}
>  	}
>  
>  	rc = msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
> @@ -731,17 +744,10 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp,
>  				 struct msm_dp_panel *msm_dp_panel)
>  {
>  	int rc = 0;
> -	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
>  	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
> -	if (msm_dp_display->power_on) {
> -		drm_dbg_dp(dp->drm_dev, "Link already setup, return\n");
> -		return 0;
> -	}
>  
>  	rc = msm_dp_ctrl_on_stream(dp->ctrl, msm_dp_panel, dp->max_stream);
> -	if (!rc)
> -		msm_dp_display->power_on = true;
>  
>  	return rc;
>  }
> @@ -788,16 +794,14 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
>  static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>  				  struct msm_dp_panel *msm_dp_panel)
>  {
> -	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> -
> -	if (!msm_dp_display->power_on)
> +	if (!dp->active_stream_cnt)
>  		return 0;
>  
>  	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
>  
>  	msm_dp_ctrl_off_pixel_clk(dp->ctrl, msm_dp_panel->stream_id);
>  
> -	msm_dp_display->power_on = false;
> +	dp->active_stream_cnt--;
>  
>  	drm_dbg_dp(dp->drm_dev, "sink count: %d\n", dp->link->sink_count);
>  	return 0;
> @@ -934,7 +938,7 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
>  	 * power_on status before dumping DP registers to avoid crash due
>  	 * to unclocked access
>  	 */
> -	if (!dp->power_on)
> +	if (!msm_dp_display->active_stream_cnt)
>  		return;
>  
>  	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
> @@ -1543,6 +1547,8 @@ void msm_dp_display_enable_helper(struct msm_dp *msm_dp_display, struct msm_dp_p
>  		}
>  	}
>  
> +	dp->active_stream_cnt++;

This should be a part of the 'stream_on' function. Also, which locking
ensures that there is no concurrent modification of this var?

> +
>  	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
>  }
>  
> @@ -1564,6 +1570,11 @@ void msm_dp_display_disable_helper(struct msm_dp *msm_dp_display,
>  
>  	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>  
> +	if (!dp->active_stream_cnt) {
> +		drm_dbg_dp(dp->drm_dev, "no active streams\n");
> +		return;
> +	}
> +
>  	msm_dp_ctrl_push_idle(dp->ctrl, msm_dp_panel);
>  	msm_dp_ctrl_mst_stream_channel_slot_setup(dp->ctrl,
>  		dp->max_stream);
> @@ -1590,6 +1601,11 @@ void msm_dp_display_unprepare(struct msm_dp *msm_dp_display)
>  		return;
>  	}
>  
> +	if (dp->active_stream_cnt) {
> +		drm_dbg_dp(dp->drm_dev, "stream still active, return\n");
> +		return;
> +	}
> +
>  	/* dongle is still connected but sinks are disconnected */
>  	if (dp->link->sink_count == 0)
>  		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 20b7ed735b3f428e894b82ae2756d0efcfa47624..b1ea027438d952c94f3ae80725c92e46c631bdb2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -19,7 +19,6 @@ struct msm_dp {
>  	struct drm_bridge *bridge;
>  	bool link_ready;
>  	bool audio_enabled;
> -	bool power_on;
>  	bool prepared;
>  	bool mst_active;
>  	unsigned int connector_type;
> @@ -64,4 +63,6 @@ void msm_dp_display_atomic_post_disable_helper(struct msm_dp *msm_dp_display,
>  
>  void msm_dp_display_unprepare(struct msm_dp *dp);
>  
> +int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp_display);
> +
>  #endif /* _DP_DISPLAY_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
