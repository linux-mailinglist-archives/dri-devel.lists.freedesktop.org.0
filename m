Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E746A320C90
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 19:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C868A6E42F;
	Sun, 21 Feb 2021 18:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946C66E426;
 Sun, 21 Feb 2021 18:24:05 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECBD2BB2;
 Sun, 21 Feb 2021 19:24:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1613931844;
 bh=orousB+kOMLJsWZCvVHsBnccCXT5Cw7mZo7av0LIF8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wB6H8dAsvUMP7HUZKu5ZvNAtM49Zsy6DTGALbPMQh/6+5lMdTGFsls0KeJEunQtTR
 FfcpXAHVstN1ruLTTrBcJ+H+8KIZybo2eBjmomtz0W0uGx0Ta+t0mWvC/dCtlr6ofs
 kAJ90Er6X6Qjeru1iqmShQf2cRm/lCsfN5Fikndw=
Date: Sun, 21 Feb 2021 20:23:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 20/30] drm/dp: Pass drm_dp_aux to
 drm_dp*_link_train_channel_eq_delay()
Message-ID: <YDKlKXoDKI4P/aNb@pendragon.ideasonboard.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-21-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219215326.2227596-21-lyude@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Oleg Vasilev <oleg.vasilev@intel.com>, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>, Emil Velikov <emil.velikov@collabora.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Tanmay Shah <tanmay@codeaurora.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 open list <linux-kernel@vger.kernel.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude,

Thank you for the patch.

On Fri, Feb 19, 2021 at 04:53:16PM -0500, Lyude Paul wrote:
> So that we can start using drm_dbg_*() for
> drm_dp_link_train_channel_eq_delay() and
> drm_dp_lttpr_link_train_channel_eq_delay().
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c           |  2 +-
>  drivers/gpu/drm/drm_dp_helper.c                    | 14 +++++++++-----
>  .../gpu/drm/i915/display/intel_dp_link_training.c  |  4 ++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  4 ++--
>  drivers/gpu/drm/msm/edp/edp_ctrl.c                 |  4 ++--
>  drivers/gpu/drm/radeon/atombios_dp.c               |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                   |  2 +-
>  include/drm/drm_dp_helper.h                        |  6 ++++--
>  8 files changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> index 4468f9d6b4dd..59ce6f620fdc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> @@ -676,7 +676,7 @@ amdgpu_atombios_dp_link_train_ce(struct amdgpu_atombios_dp_link_train_info *dp_i
>  	dp_info->tries = 0;
>  	channel_eq = false;
>  	while (1) {
> -		drm_dp_link_train_channel_eq_delay(dp_info->dpcd);
> +		drm_dp_link_train_channel_eq_delay(dp_info->aux, dp_info->dpcd);
>  
>  		if (drm_dp_dpcd_read_link_status(dp_info->aux,
>  						 dp_info->link_status) <= 0) {
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index ce08eb3bface..a9316c1ecb52 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -151,7 +151,8 @@ void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
>  }
>  EXPORT_SYMBOL(drm_dp_link_train_clock_recovery_delay);
>  
> -static void __drm_dp_link_train_channel_eq_delay(unsigned long rd_interval)
> +static void __drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
> +						 unsigned long rd_interval)
>  {
>  	if (rd_interval > 4)
>  		DRM_DEBUG_KMS("AUX interval %lu, out of range (max 4)\n",
> @@ -165,9 +166,11 @@ static void __drm_dp_link_train_channel_eq_delay(unsigned long rd_interval)
>  	usleep_range(rd_interval, rd_interval * 2);
>  }
>  
> -void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +void drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
> +					const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
> -	__drm_dp_link_train_channel_eq_delay(dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> +	__drm_dp_link_train_channel_eq_delay(aux,
> +					     dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
>  					     DP_TRAINING_AUX_RD_MASK);
>  }
>  EXPORT_SYMBOL(drm_dp_link_train_channel_eq_delay);
> @@ -183,13 +186,14 @@ static u8 dp_lttpr_phy_cap(const u8 phy_cap[DP_LTTPR_PHY_CAP_SIZE], int r)
>  	return phy_cap[r - DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1];
>  }
>  
> -void drm_dp_lttpr_link_train_channel_eq_delay(const u8 phy_cap[DP_LTTPR_PHY_CAP_SIZE])
> +void drm_dp_lttpr_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
> +					      const u8 phy_cap[DP_LTTPR_PHY_CAP_SIZE])
>  {
>  	u8 interval = dp_lttpr_phy_cap(phy_cap,
>  				       DP_TRAINING_AUX_RD_INTERVAL_PHY_REPEATER1) &
>  		      DP_TRAINING_AUX_RD_MASK;
>  
> -	__drm_dp_link_train_channel_eq_delay(interval);
> +	__drm_dp_link_train_channel_eq_delay(aux, interval);
>  }
>  EXPORT_SYMBOL(drm_dp_lttpr_link_train_channel_eq_delay);
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 222073d46bdb..fe8b5a5d9d1a 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -593,11 +593,11 @@ intel_dp_link_training_channel_equalization_delay(struct intel_dp *intel_dp,
>  						  enum drm_dp_phy dp_phy)
>  {
>  	if (dp_phy == DP_PHY_DPRX) {
> -		drm_dp_link_train_channel_eq_delay(intel_dp->dpcd);
> +		drm_dp_link_train_channel_eq_delay(&intel_dp->aux, intel_dp->dpcd);
>  	} else {
>  		const u8 *phy_caps = intel_dp_lttpr_phy_caps(intel_dp, dp_phy);
>  
> -		drm_dp_lttpr_link_train_channel_eq_delay(phy_caps);
> +		drm_dp_lttpr_link_train_channel_eq_delay(&intel_dp->aux, phy_caps);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 2501a6b326a3..33df288dd4eb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1184,7 +1184,7 @@ static int dp_ctrl_link_lane_down_shift(struct dp_ctrl_private *ctrl)
>  static void dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
>  {
>  	dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
> -	drm_dp_link_train_channel_eq_delay(ctrl->panel->dpcd);
> +	drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
>  }
>  
>  static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
> @@ -1215,7 +1215,7 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
>  	dp_ctrl_train_pattern_set(ctrl, pattern | DP_RECOVERED_CLOCK_OUT_EN);
>  
>  	for (tries = 0; tries <= maximum_retries; tries++) {
> -		drm_dp_link_train_channel_eq_delay(ctrl->panel->dpcd);
> +		drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
>  
>  		ret = dp_ctrl_read_link_status(ctrl, link_status);
>  		if (ret)
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 6501598448b4..4fb397ee7c84 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -665,7 +665,7 @@ static int edp_start_link_train_2(struct edp_ctrl *ctrl)
>  		return ret;
>  
>  	while (1) {
> -		drm_dp_link_train_channel_eq_delay(ctrl->dpcd);
> +		drm_dp_link_train_channel_eq_delay(ctrl->drm_aux, ctrl->dpcd);
>  
>  		rlen = drm_dp_dpcd_read_link_status(ctrl->drm_aux, link_status);
>  		if (rlen < DP_LINK_STATUS_SIZE) {
> @@ -743,7 +743,7 @@ static int edp_clear_training_pattern(struct edp_ctrl *ctrl)
>  
>  	ret = edp_train_pattern_set_write(ctrl, 0);
>  
> -	drm_dp_link_train_channel_eq_delay(ctrl->dpcd);
> +	drm_dp_link_train_channel_eq_delay(ctrl->drm_aux, ctrl->dpcd);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
> index 299b9d8da376..4c1e551d9714 100644
> --- a/drivers/gpu/drm/radeon/atombios_dp.c
> +++ b/drivers/gpu/drm/radeon/atombios_dp.c
> @@ -743,7 +743,7 @@ static int radeon_dp_link_train_ce(struct radeon_dp_link_train_info *dp_info)
>  	dp_info->tries = 0;
>  	channel_eq = false;
>  	while (1) {
> -		drm_dp_link_train_channel_eq_delay(dp_info->dpcd);
> +		drm_dp_link_train_channel_eq_delay(dp_info->aux, dp_info->dpcd);
>  
>  		if (drm_dp_dpcd_read_link_status(dp_info->aux,
>  						 dp_info->link_status) <= 0) {
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 5cc295d8ba9f..f6f2293db18d 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -778,7 +778,7 @@ static int zynqmp_dp_link_train_ce(struct zynqmp_dp *dp)
>  		if (ret)
>  			return ret;
>  
> -		drm_dp_link_train_channel_eq_delay(dp->dpcd);
> +		drm_dp_link_train_channel_eq_delay(&dp->aux, dp->dpcd);
>  		ret = drm_dp_dpcd_read_link_status(&dp->aux, link_status);
>  		if (ret < 0)
>  			return ret;
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index e4681665231e..2151aeb6c279 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -1479,8 +1479,10 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
>  void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
>  					    const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  void drm_dp_lttpr_link_train_clock_recovery_delay(void);
> -void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> -void drm_dp_lttpr_link_train_channel_eq_delay(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> +void drm_dp_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
> +					const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> +void drm_dp_lttpr_link_train_channel_eq_delay(const struct drm_dp_aux *aux,
> +					      const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
>  
>  u8 drm_dp_link_rate_to_bw_code(int link_rate);
>  int drm_dp_bw_code_to_link_rate(u8 link_bw);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
