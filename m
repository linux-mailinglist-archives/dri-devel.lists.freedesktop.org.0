Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD327322CC1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 15:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393E86E9BE;
	Tue, 23 Feb 2021 14:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD63B6E83B;
 Tue, 23 Feb 2021 14:49:35 +0000 (UTC)
IronPort-SDR: BoqfWG33OPFLA5i9yv/hlFwO2kFzpOCj2VEaj3lMOLaR2RB3phpaFCVouDwvokYMaMcPL3dig0
 pHunAGVLObWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="182339759"
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="182339759"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 06:49:35 -0800
IronPort-SDR: ysBhO+VHCeZJheQHhE4IO3P+32Wfl9YrV97tKizhglxPl9r9CEeixC5hOWBGMS4LHFNyjgigSR
 6uVLWCIPvmNQ==
X-IronPort-AV: E=Sophos;i="5.81,200,1610438400"; d="scan'208";a="423650236"
Received: from mmgoodso-mobl3.amr.corp.intel.com (HELO intel.com)
 ([10.212.211.76])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2021 06:49:30 -0800
Date: Tue, 23 Feb 2021 09:49:29 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [Intel-gfx] [PATCH 19/30] drm/dp: Pass drm_dp_aux to
 drm_dp_link_train_clock_recovery_delay()
Message-ID: <YDUV+SU7bSyfFqvw@intel.com>
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-20-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219215326.2227596-20-lyude@redhat.com>
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
 Oleg Vasilev <oleg.vasilev@intel.com>, Tanmay Shah <tanmay@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>, Chandan Uddaraju <chandanu@codeaurora.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 19, 2021 at 04:53:15PM -0500, Lyude Paul wrote:
> So that we can start using drm_dbg_*() in
> drm_dp_link_train_clock_recovery_delay().
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

I wonder if we could have a drm_dp so we encapsulate both aux and dpcd
related information...

But this one already solves the issue...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>



> ---
>  drivers/gpu/drm/amd/amdgpu/atombios_dp.c              | 2 +-
>  drivers/gpu/drm/drm_dp_helper.c                       | 3 ++-
>  drivers/gpu/drm/i915/display/intel_dp_link_training.c | 2 +-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c                      | 2 +-
>  drivers/gpu/drm/msm/edp/edp_ctrl.c                    | 2 +-
>  drivers/gpu/drm/radeon/atombios_dp.c                  | 2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c                      | 2 +-
>  include/drm/drm_dp_helper.h                           | 4 +++-
>  8 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> index 6d35da65e09f..4468f9d6b4dd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_dp.c
> @@ -611,7 +611,7 @@ amdgpu_atombios_dp_link_train_cr(struct amdgpu_atombios_dp_link_train_info *dp_i
>  	dp_info->tries = 0;
>  	voltage = 0xff;
>  	while (1) {
> -		drm_dp_link_train_clock_recovery_delay(dp_info->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(dp_info->aux, dp_info->dpcd);
>  
>  		if (drm_dp_dpcd_read_link_status(dp_info->aux,
>  						 dp_info->link_status) <= 0) {
> diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
> index 194e0c273809..ce08eb3bface 100644
> --- a/drivers/gpu/drm/drm_dp_helper.c
> +++ b/drivers/gpu/drm/drm_dp_helper.c
> @@ -132,7 +132,8 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
>  }
>  EXPORT_SYMBOL(drm_dp_get_adjust_request_post_cursor);
>  
> -void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
> +void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
> +					    const u8 dpcd[DP_RECEIVER_CAP_SIZE])
>  {
>  	unsigned long rd_interval = dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
>  					 DP_TRAINING_AUX_RD_MASK;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 892d7db7d94f..222073d46bdb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -441,7 +441,7 @@ static void intel_dp_link_training_clock_recovery_delay(struct intel_dp *intel_d
>  							enum drm_dp_phy dp_phy)
>  {
>  	if (dp_phy == DP_PHY_DPRX)
> -		drm_dp_link_train_clock_recovery_delay(intel_dp->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(&intel_dp->aux, intel_dp->dpcd);
>  	else
>  		drm_dp_lttpr_link_train_clock_recovery_delay();
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 36b39c381b3f..2501a6b326a3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1103,7 +1103,7 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
>  	tries = 0;
>  	old_v_level = ctrl->link->phy_params.v_level;
>  	for (tries = 0; tries < maximum_retries; tries++) {
> -		drm_dp_link_train_clock_recovery_delay(ctrl->panel->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
>  
>  		ret = dp_ctrl_read_link_status(ctrl, link_status);
>  		if (ret)
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 57af3d8b6699..6501598448b4 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -608,7 +608,7 @@ static int edp_start_link_train_1(struct edp_ctrl *ctrl)
>  	tries = 0;
>  	old_v_level = ctrl->v_level;
>  	while (1) {
> -		drm_dp_link_train_clock_recovery_delay(ctrl->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(ctrl->drm_aux, ctrl->dpcd);
>  
>  		rlen = drm_dp_dpcd_read_link_status(ctrl->drm_aux, link_status);
>  		if (rlen < DP_LINK_STATUS_SIZE) {
> diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
> index c50c504bad50..299b9d8da376 100644
> --- a/drivers/gpu/drm/radeon/atombios_dp.c
> +++ b/drivers/gpu/drm/radeon/atombios_dp.c
> @@ -680,7 +680,7 @@ static int radeon_dp_link_train_cr(struct radeon_dp_link_train_info *dp_info)
>  	dp_info->tries = 0;
>  	voltage = 0xff;
>  	while (1) {
> -		drm_dp_link_train_clock_recovery_delay(dp_info->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(dp_info->aux, dp_info->dpcd);
>  
>  		if (drm_dp_dpcd_read_link_status(dp_info->aux,
>  						 dp_info->link_status) <= 0) {
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 8272eee03adc..5cc295d8ba9f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -713,7 +713,7 @@ static int zynqmp_dp_link_train_cr(struct zynqmp_dp *dp)
>  		if (ret)
>  			return ret;
>  
> -		drm_dp_link_train_clock_recovery_delay(dp->dpcd);
> +		drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
>  		ret = drm_dp_dpcd_read_link_status(&dp->aux, link_status);
>  		if (ret < 0)
>  			return ret;
> diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> index 45ec74862212..e4681665231e 100644
> --- a/include/drm/drm_dp_helper.h
> +++ b/include/drm/drm_dp_helper.h
> @@ -29,6 +29,7 @@
>  #include <drm/drm_connector.h>
>  
>  struct drm_device;
> +struct drm_dp_aux;
>  
>  /*
>   * Unless otherwise noted, all values are from the DP 1.1a spec.  Note that
> @@ -1475,7 +1476,8 @@ u8 drm_dp_get_adjust_request_post_cursor(const u8 link_status[DP_LINK_STATUS_SIZ
>  #define DP_LTTPR_COMMON_CAP_SIZE	8
>  #define DP_LTTPR_PHY_CAP_SIZE		3
>  
> -void drm_dp_link_train_clock_recovery_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
> +void drm_dp_link_train_clock_recovery_delay(const struct drm_dp_aux *aux,
> +					    const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  void drm_dp_lttpr_link_train_clock_recovery_delay(void);
>  void drm_dp_link_train_channel_eq_delay(const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
>  void drm_dp_lttpr_link_train_channel_eq_delay(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
> -- 
> 2.29.2
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
