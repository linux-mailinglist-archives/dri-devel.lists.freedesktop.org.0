Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACCA9E83B2
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 06:45:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CCC710E32B;
	Sun,  8 Dec 2024 05:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WAqgsMd5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A094110E32B
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 05:45:14 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ffc1009a06so28403761fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 21:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733636713; x=1734241513; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7Fle41cIyCa2AFu7iBoMXJgQt0wW2JWBUvbsPg3liEc=;
 b=WAqgsMd5RXYC5w6z7aGuYXWZKcqDNW2hpgEmXaE7VJnGmT3Z/DlgyWxyaI7POAvCtL
 7Hl6Bc7U62pouYqxWZAxEfn85PxUd6KYBFf7TIqKHgUm+ybo6j3QZuEhluuOraFUKjnf
 cL2X8ve6UNw5Sj+Ql6nd2yRU6ZlqD2KUaniHeNCV72gGBVkFs5DZ45exN+dLBh/lCXUj
 veC8m8YsfWG0pI6yU42hFPyIY7rNlP3PQMNBGeXF5R19q3pMhhs8XRCgvBqJuWxBihzj
 8S9l2BOyqhwAVJWzZ9CTYrmEd9d6gGzv94pdhH66oQu/AJPElUAMAwK4x+htPKMRBXzR
 7iDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733636713; x=1734241513;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7Fle41cIyCa2AFu7iBoMXJgQt0wW2JWBUvbsPg3liEc=;
 b=DgFeZM5VCfuFmilFMwe651GS8JPH/AjQrsxL0mxYhxF5TeFVFxhv38BO1Mmb+lI9E+
 ythTUl3+Q3sJz6dIo2OUuP47x7VTcYnq/RejPA6jf7oB9Leck6hBkSWqbru/rL0zS2GN
 MNW889OTocSbBQt/w3vW+H06dXN/8cSvHpmN2gHGEpfM6gAMxnScMAZjV5U42Ch1igvc
 xeIeb/PT3+v5mz/B2Pe61dSsXQ/QvUbi2CHjCGdiV3tj3OvP8AaDnic7anFosezUqu+a
 +jZONLCy6IZr8151ErgbJrvv5v3Bfe9ke5VQ98lEIo1hcmAu0Xq8zI2a1MWBd8z+rR2X
 NgAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgwkC1K9umWxcFNfXtLs45j8gulUzEAYv5zBx3OiiXAy+xQnbibCEhBz9esE2KhoLyd7ZytIS5vro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1+ngGOM6GcTPpxBGudrOr5CQ8U8qlGxKN5/1es8MEZgodsSJr
 hacq86TVwbm/+lp5BF9w7TTkgiKU/9pcxsMelVlW10PckDlolVDqbJ5aXIgil8w=
X-Gm-Gg: ASbGncu1S5gl75f9DQVT900dXK9VZB68MqnO5DXnKxvqjZGbzzifEHLcwJbrVc4MJ0b
 LpUeBWcPB9Z3hQCEQqjokEk0+PshO9tmPcyQSIIJKlDnAjqbF8xnUBPrd7VYJqwduR8PXtDgkR6
 QP4886ws+nf8Wqmz4X8SfvwaMqCaKawrzsRcZLdPqLX5h1w8ohaZPb6mg1j4skdC1Z45coYQ4fo
 g9ZjUFqWhpBJF2ijl1TUN9qQY0k4A+yMZN3jFTk9cscqXKmZcYlF9xddGtajWV6Wz8cIxuTDmU5
 oDi34FN20rGNxlCoPKyBRyXMuF8gXA==
X-Google-Smtp-Source: AGHT+IGC5Xjo5gGspPBZLcvyJdqkRcpNB6yRjkeLampG39JkgzJPFZHmnBF0RK4tynS4xq4+GDxksQ==
X-Received: by 2002:a05:651c:210f:b0:300:25f6:9b3d with SMTP id
 38308e7fff4ca-3002f677456mr19192501fa.10.1733636712711; 
 Sat, 07 Dec 2024 21:45:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-301f2e48b01sm2611731fa.31.2024.12.07.21.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 21:45:11 -0800 (PST)
Date: Sun, 8 Dec 2024 07:45:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 18/45] drm/msm/dp: add support to send ACT packets for MST
Message-ID: <qhvaqqzam3ru74r3ydfxyachedsgizilnx4op4bt73ie72pmhy@g4oedv27jp4q>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-18-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-18-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:49PM -0800, Abhinav Kumar wrote:
> Whenever virtual channel slot allocation changes, the DP
> source must send the action control trigger sequence to notify
> the sink about the same. This would be applicable during the
> start and stop of the pixel stream. Add the infrastructure
> to be able to send ACT packets for the DP controller when
> operating in MST mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  4 ++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 36 ++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 +++++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  3 +++
>  7 files changed, 70 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index e6f6edf617898241c74580eb0ae6bc58f06a154f..88d6262a972ef2d30c467ef5ff5c58ef3299ae7d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -1078,6 +1078,27 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
>  	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
>  }
>  
> +void msm_dp_catalog_trigger_act(struct msm_dp_catalog *msm_dp_catalog)
> +{
> +	struct msm_dp_catalog_private *catalog;
> +
> +	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
> +
> +	msm_dp_write_link(catalog, REG_DP_MST_ACT, 0x1);
> +
> +	/* make sure ACT signal is performed */
> +	wmb();
> +}
> +
> +bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *msm_dp_catalog)
> +{
> +	struct msm_dp_catalog_private *catalog;
> +
> +	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
> +
> +	return msm_dp_read_link(catalog, REG_DP_MST_ACT);
> +}
> +

Hopefully after [1] this becomes inline in the corresponding dp_ctrl
functions.

[1] https://patchwork.freedesktop.org/patch/626816/?series=141074&rev=2

>  void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
>  				struct drm_display_mode *drm_mode)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index c020b7cfa008241e937f6a53764b136431f1dbd9..c91c52d40209b8bcb63db9c0256f6ef721dace8a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -135,4 +135,8 @@ void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *catalog);
>  void msm_dp_catalog_audio_init(struct msm_dp_catalog *catalog);
>  void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_exit_level);
>  
> +/* DP MST APIs */
> +void msm_dp_catalog_trigger_act(struct msm_dp_catalog *dp_catalog);
> +bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *dp_catalog);
> +
>  #endif /* _DP_CATALOG_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index ba39b009032dd6f5cb708988963cd6acb6838e4a..2bfe2aac3c02b02b12713dbd98e79ed4a75b85d0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -97,6 +97,8 @@ struct msm_dp_ctrl_private {
>  
>  	bool core_clks_on;
>  	bool link_clks_on;
> +
> +	bool mst_active;
>  	bool stream_clks_on[DP_STREAM_MAX];
>  };
>  
> @@ -1625,6 +1627,26 @@ static int msm_dp_ctrl_deinitialize_mainlink(struct msm_dp_ctrl_private *ctrl)
>  	return 0;
>  }
>  
> +int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +	bool act_complete;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	msm_dp_catalog_trigger_act(ctrl->catalog);
> +	msleep(20); /* needs 1 frame time */
> +
> +	act_complete = msm_dp_catalog_read_act_complete_sts(ctrl->catalog);
> +
> +	if (!act_complete)
> +		DRM_ERROR("mst ACT trigger complete SUCCESS\n");
> +	else
> +		drm_dbg_dp(ctrl->drm_dev, "mst ACT trigger complete failed\n");
> +
> +	return 0;
> +}
> +
>  static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>  {
>  	int ret = 0;
> @@ -1643,6 +1665,9 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
>  
>  	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
>  
> +	if (ctrl->mst_active)
> +		msm_dp_ctrl_mst_send_act(&ctrl->msm_dp_ctrl);
> +
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  end:
>  	return ret;
> @@ -1745,7 +1770,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>  	msm_dp_ctrl_stream_clk_off(&ctrl->msm_dp_ctrl, msm_dp_panel);
>  	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl);
>  
> -	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl);
> +	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, ctrl->mst_active);
>  	if (ret) {
>  		DRM_ERROR("failed to enable DP link controller\n");
>  		return ret;
> @@ -1825,7 +1850,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
>  	return drm_dp_channel_eq_ok(link_status, num_lanes);
>  }
>  
> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active)
>  {
>  	int rc = 0;
>  	struct msm_dp_ctrl_private *ctrl;
> @@ -1844,6 +1869,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  	rate = ctrl->panel->link_info.rate;
>  	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
>  
> +	ctrl->mst_active = mst_active;
>  	msm_dp_ctrl_core_clk_enable(&ctrl->msm_dp_ctrl);
>  
>  	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
> @@ -2035,6 +2061,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
>  
> +	if (ctrl->mst_active)
> +		msm_dp_ctrl_mst_send_act(msm_dp_ctrl);
> +
>  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>  	if (ret)
>  		return ret;
> @@ -2104,6 +2133,8 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  
>  	msm_dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>  
> +	ctrl->mst_active = false;
> +
>  	dev_pm_opp_set_rate(ctrl->dev, 0);
>  	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
>  
> @@ -2264,6 +2295,7 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
>  	ctrl->catalog  = catalog;
>  	ctrl->dev      = dev;
>  	ctrl->phy      = phy;
> +	ctrl->mst_active = false;
>  
>  	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index d422fd683b65d6f5e459710d0327e472a12c30b0..81c05b1b2baac63e1f1888f3f517e62a98e230a7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -17,7 +17,7 @@ struct msm_dp_ctrl {
>  
>  struct phy;
>  
> -int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
>  int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
> @@ -46,5 +46,6 @@ void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl,
>  				   struct msm_dp_panel *msm_dp_panel);
>  void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
> +int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *ctrl);
>  
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5fa6c003cf6c51eae77573549a555a00dc33f476..e19860ef3493fb100afbf04b09d14a136fd6b887 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -370,6 +370,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
>  	const struct drm_display_info *info = &connector->display_info;
>  	int rc = 0;
> +	struct msm_dp *dp_display = &dp->msm_dp_display;
>  
>  	rc = msm_dp_panel_read_link_caps(dp->panel, connector);
>  	if (rc)
> @@ -399,7 +400,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
> -	rc = msm_dp_ctrl_on_link(dp->ctrl);
> +	rc = msm_dp_ctrl_on_link(dp->ctrl, dp_display->mst_active);
>  	if (rc) {
>  		DRM_ERROR("failed to complete DP link training\n");
>  		goto end;
> @@ -1628,6 +1629,9 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
>  	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
> +
> +	if (dp->mst_active)
> +		msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
>  }
>  
>  static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 8ce8ba254b1bfe5b4c000df83eceef5823772780..38ca25491b1ccfd95e027a9c8f659abb3cd576d3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -22,6 +22,7 @@ struct msm_dp {
>  	bool audio_enabled;
>  	bool power_on;
>  	bool prepared;
> +	bool mst_active;
>  	unsigned int connector_type;
>  	bool is_edp;
>  	bool internal_hpd;
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 6c534fde6034fced2cb428e9a29de31ed5c5fcc4..46400973eb499066e9e805b16df759b1db34cf22 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -330,6 +330,9 @@
>  #define REG_DP_PHY_AUX_BIST_CFG			(0x00000050)
>  #define REG_DP_PHY_AUX_INTERRUPT_STATUS         (0x000000BC)
>  
> +/* DP MST related registers */
> +#define REG_DP_MST_ACT                          (0x00000500)

This looks completely out of place.

> +
>  /* DP HDCP 1.3 registers */
>  #define DP_HDCP_CTRL                                   (0x0A0)
>  #define DP_HDCP_STATUS                                 (0x0A4)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
