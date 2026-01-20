Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LxsEAUqib2mWDgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:42:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8BB46696
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8C10E60E;
	Tue, 20 Jan 2026 14:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1734F10E60E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 14:46:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BC4B1476
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 06:46:47 -0800 (PST)
Received: from e142607.local (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 6B1163F694
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 06:46:53 -0800 (PST)
Date: Tue, 20 Jan 2026 14:45:51 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 amd-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 15/15] drm/atomic: Remove state argument to
 drm_atomic_private_obj_init
Message-ID: <aW-VH0JN8WOlsiyb@e142607>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
 <20260119-drm-private-obj-reset-v3-15-b931abe3a5e3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260119-drm-private-obj-reset-v3-15-b931abe3a5e3@redhat.com>
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
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:tomi.valkeinen@ideasonboard.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:paul@crapouillou.net,m:thierry.reding@gmail.com,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:dave.stevenson@raspberrypi.com,m:siqueira@igalia.com,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:abhinav.kumar@linux.dev,m:jessica.zhang@oss.qualcomm.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,m:amd-gfx@lists.freedesktop.org,m:linux-mips@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:thierryreding@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,oss.qualcomm.com,ideasonboard.com,intel.com,linaro.org,kernel.org,crapouillou.net,nvidia.com,raspberrypi.com,igalia.com,kwiboo.se,linux.dev,poorly.run,somainline.org,vger.kernel.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 5E8BB46696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 01:50:11PM +0100, Maxime Ripard wrote:
> Now that all drm_private_objs users have been converted to use
> atomic_create_state instead of the old ad-hoc initialization, we can
> remove the state parameter from drm_private_obj_init and the fallback
> code.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> 
> To: Liviu Dudau <liviu.dudau@arm.com>
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Paul Cercueil <paul@crapouillou.net>
> To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Thierry Reding <thierry.reding@gmail.com>
> To: Mikko Perttunen <mperttunen@nvidia.com>
> To: Jonathan Hunter <jonathanh@nvidia.com>
> To: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: "Maíra Canal" <mcanal@igalia.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  1 -
>  .../drm/arm/display/komeda/komeda_private_obj.c    | 16 ++++++++--------

For the komeda part:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  drivers/gpu/drm/display/drm_dp_mst_topology.c      |  1 -
>  drivers/gpu/drm/display/drm_dp_tunnel.c            |  2 +-
>  drivers/gpu/drm/drm_atomic.c                       | 22 +++++-----------------
>  drivers/gpu/drm/drm_bridge.c                       |  1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-ipu.c              |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  1 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  1 -
>  drivers/gpu/drm/omapdrm/omap_drv.c                 |  2 +-
>  drivers/gpu/drm/tegra/hub.c                        |  2 +-
>  drivers/gpu/drm/vc4/vc4_kms.c                      |  4 +---
>  include/drm/drm_atomic.h                           |  1 -
>  14 files changed, 19 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index a97e1bf1bfdc6384a6ac83f907878807bb3b62a0..cff3d00a367728449b4a4de4cc9f3c9036e3924f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -4932,11 +4932,10 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
>  	/* indicates support for immediate flip */
>  	adev_to_drm(adev)->mode_config.async_page_flip = true;
>  
>  	drm_atomic_private_obj_init(adev_to_drm(adev),
>  				    &adev->dm.atomic_obj,
> -				    NULL,
>  				    &dm_atomic_state_funcs);
>  
>  	r = amdgpu_display_modeset_create_props(adev);
>  	if (r)
>  		return r;
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
> index 4994b69c6595637ea832b97629b052e3aea97ee7..6270e5c525db221267b1215a27653ace578eeb0a 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
> @@ -63,11 +63,11 @@ static const struct drm_private_state_funcs komeda_layer_obj_funcs = {
>  };
>  
>  static int komeda_layer_obj_add(struct komeda_kms_dev *kms,
>  				struct komeda_layer *layer)
>  {
> -	drm_atomic_private_obj_init(&kms->base, &layer->base.obj, NULL,
> +	drm_atomic_private_obj_init(&kms->base, &layer->base.obj,
>  				    &komeda_layer_obj_funcs);
>  	return 0;
>  }
>  
>  static struct drm_private_state *
> @@ -116,11 +116,11 @@ static const struct drm_private_state_funcs komeda_scaler_obj_funcs = {
>  
>  static int komeda_scaler_obj_add(struct komeda_kms_dev *kms,
>  				 struct komeda_scaler *scaler)
>  {
>  	drm_atomic_private_obj_init(&kms->base,
> -				    &scaler->base.obj, NULL,
> +				    &scaler->base.obj,
>  				    &komeda_scaler_obj_funcs);
>  	return 0;
>  }
>  
>  static struct drm_private_state *
> @@ -168,11 +168,11 @@ static const struct drm_private_state_funcs komeda_compiz_obj_funcs = {
>  };
>  
>  static int komeda_compiz_obj_add(struct komeda_kms_dev *kms,
>  				 struct komeda_compiz *compiz)
>  {
> -	drm_atomic_private_obj_init(&kms->base, &compiz->base.obj, NULL,
> +	drm_atomic_private_obj_init(&kms->base, &compiz->base.obj,
>  				    &komeda_compiz_obj_funcs);
>  
>  	return 0;
>  }
>  
> @@ -222,11 +222,11 @@ static const struct drm_private_state_funcs komeda_splitter_obj_funcs = {
>  
>  static int komeda_splitter_obj_add(struct komeda_kms_dev *kms,
>  				   struct komeda_splitter *splitter)
>  {
>  	drm_atomic_private_obj_init(&kms->base,
> -				    &splitter->base.obj, NULL,
> +				    &splitter->base.obj,
>  				    &komeda_splitter_obj_funcs);
>  
>  	return 0;
>  }
>  
> @@ -275,11 +275,11 @@ static const struct drm_private_state_funcs komeda_merger_obj_funcs = {
>  
>  static int komeda_merger_obj_add(struct komeda_kms_dev *kms,
>  				 struct komeda_merger *merger)
>  {
>  	drm_atomic_private_obj_init(&kms->base,
> -				    &merger->base.obj, NULL,
> +				    &merger->base.obj,
>  				    &komeda_merger_obj_funcs);
>  
>  	return 0;
>  }
>  
> @@ -328,11 +328,11 @@ static const struct drm_private_state_funcs komeda_improc_obj_funcs = {
>  };
>  
>  static int komeda_improc_obj_add(struct komeda_kms_dev *kms,
>  				 struct komeda_improc *improc)
>  {
> -	drm_atomic_private_obj_init(&kms->base, &improc->base.obj, NULL,
> +	drm_atomic_private_obj_init(&kms->base, &improc->base.obj,
>  				    &komeda_improc_obj_funcs);
>  
>  	return 0;
>  }
>  
> @@ -381,11 +381,11 @@ static const struct drm_private_state_funcs komeda_timing_ctrlr_obj_funcs = {
>  };
>  
>  static int komeda_timing_ctrlr_obj_add(struct komeda_kms_dev *kms,
>  				       struct komeda_timing_ctrlr *ctrlr)
>  {
> -	drm_atomic_private_obj_init(&kms->base, &ctrlr->base.obj, NULL,
> +	drm_atomic_private_obj_init(&kms->base, &ctrlr->base.obj,
>  				    &komeda_timing_ctrlr_obj_funcs);
>  
>  	return 0;
>  }
>  
> @@ -435,11 +435,11 @@ static const struct drm_private_state_funcs komeda_pipeline_obj_funcs = {
>  };
>  
>  static int komeda_pipeline_obj_add(struct komeda_kms_dev *kms,
>  				   struct komeda_pipeline *pipe)
>  {
> -	drm_atomic_private_obj_init(&kms->base, &pipe->obj, NULL,
> +	drm_atomic_private_obj_init(&kms->base, &pipe->obj,
>  				    &komeda_pipeline_obj_funcs);
>  
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 1ab0233a2a18f784d8c43e61b94e40a06bd4baf6..7e0e5b90df7251beed6985e16d1c3270ddfb3f37 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5763,11 +5763,10 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  	mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
>  	mgr->max_payloads = max_payloads;
>  	mgr->conn_base_id = conn_base_id;
>  
>  	drm_atomic_private_obj_init(dev, &mgr->base,
> -				    NULL,
>  				    &drm_dp_mst_topology_state_funcs);
>  
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_dp_mst_topology_mgr_init);
> diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
> index 2abd714efd19f27697770813b38194e384be87ce..241498cef7de497afdf2837f750113743c001240 100644
> --- a/drivers/gpu/drm/display/drm_dp_tunnel.c
> +++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
> @@ -1598,11 +1598,11 @@ static bool init_group(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_tunnel_group
>  {
>  	group->mgr = mgr;
>  	group->available_bw = -1;
>  	INIT_LIST_HEAD(&group->tunnels);
>  
> -	drm_atomic_private_obj_init(mgr->dev, &group->base, NULL,
> +	drm_atomic_private_obj_init(mgr->dev, &group->base,
>  				    &tunnel_group_funcs);
>  
>  	return true;
>  }
>  
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index e3029c8f02e5a3698781117bcc80eff98407cf16..243579fa1c756cd2eda660ad658cb49d67106584 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -919,11 +919,10 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
>  
>  /**
>   * drm_atomic_private_obj_init - initialize private object
>   * @dev: DRM device this object will be attached to
>   * @obj: private object
> - * @state: initial private object state
>   * @funcs: pointer to the struct of function pointers that identify the object
>   * type
>   *
>   * Initialize the private object, which can be embedded into any
>   * driver private object that needs its own atomic state.
> @@ -931,37 +930,26 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
>   * RETURNS:
>   * Zero on success, error code on failure
>   */
>  int drm_atomic_private_obj_init(struct drm_device *dev,
>  				struct drm_private_obj *obj,
> -				struct drm_private_state *state,
>  				const struct drm_private_state_funcs *funcs)
>  {
> +	struct drm_private_state *state;
>  	memset(obj, 0, sizeof(*obj));
>  
>  	drm_modeset_lock_init(&obj->lock);
>  
>  	obj->dev = dev;
>  	obj->funcs = funcs;
>  	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
>  
> -	/*
> -	 * Not all users of drm_atomic_private_obj_init have been
> -	 * converted to using &drm_private_obj_funcs.atomic_create_state yet.
> -	 * For the time being, let's only call reset if the passed state is
> -	 * NULL. Otherwise, we will fallback to the previous behaviour.
> -	 */
> -	if (!state) {
> -		state = obj->funcs->atomic_create_state(obj);
> -		if (IS_ERR(state))
> -			return PTR_ERR(state);
> +	state = obj->funcs->atomic_create_state(obj);
> +	if (IS_ERR(state))
> +		return PTR_ERR(state);
>  
> -		obj->state = state;
> -	} else {
> -		obj->state = state;
> -		state->obj = obj;
> -	}
> +	obj->state = state;
>  
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_atomic_private_obj_init);
>  
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 316cf84519de54c4dc4bfb3bc3addc4990a200f5..4b120751605e15e0d07ebe1d4a7324c0ccfc34dd 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -553,11 +553,10 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
>  			goto err_reset_bridge;
>  	}
>  
>  	if (drm_bridge_is_atomic(bridge))
>  		drm_atomic_private_obj_init(bridge->dev, &bridge->base,
> -					    NULL,
>  					    &drm_bridge_priv_state_funcs);
>  
>  	return 0;
>  
>  err_reset_bridge:
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 862691991ed2770d30342bf531e828e34bd7080a..e6b003c16e63609180881b1d3b0c7acbd5218ada 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -1399,11 +1399,11 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
>  	if (ret) {
>  		dev_err(dev, "Unable to register clock notifier\n");
>  		goto err_devclk_disable;
>  	}
>  
> -	drm_atomic_private_obj_init(drm, &priv->private_obj, NULL,
> +	drm_atomic_private_obj_init(drm, &priv->private_obj,
>  				    &ingenic_drm_private_state_funcs);
>  
>  	ret = drmm_add_action_or_reset(drm, ingenic_drm_atomic_private_obj_fini,
>  				       &priv->private_obj);
>  	if (ret)
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index 253a1ce30997308547b61339468d52e6875785d3..635ef2b1efa57556f32fded612f0ff1068e23e8c 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -899,11 +899,11 @@ static int ingenic_ipu_bind(struct device *dev, struct device *master, void *d)
>  	if (err) {
>  		dev_err(dev, "Unable to prepare clock\n");
>  		return err;
>  	}
>  
> -	drm_atomic_private_obj_init(drm, &ipu->private_obj, NULL,
> +	drm_atomic_private_obj_init(drm, &ipu->private_obj,
>  				    &ingenic_ipu_private_state_funcs);
>  
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e33995a9522d2a9e8d0627069f7b5f44902278de..e52fd6b79c614a67d910e404efc24be014ec8f5e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1159,11 +1159,10 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  
>  	dev->mode_config.cursor_width = 512;
>  	dev->mode_config.cursor_height = 512;
>  
>  	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
> -				    NULL,
>  				    &dpu_kms_global_state_funcs);
>  
>  	atomic_set(&dpu_kms->bandwidth_ref, 0);
>  
>  	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 1fc9671590762b800bdeb6cd440b1ae6ee634679..c41bb03e5b96a162340b886d32656dfe4b0d1a99 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -715,11 +715,10 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>  	int ret;
>  
>  	mdp5_kms->dev = dev;
>  
>  	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
> -				    NULL,
>  				    &mdp5_global_state_funcs);
>  
>  	/* we need to set a default rate before enabling.  Set a safe
>  	 * rate first, then figure out hw revision, and then set a
>  	 * more optimal rate:
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> index febee3fea01dd40faec7d631279b1393a17822ba..27de798026365f710b78306a7ec2a72ddff20828 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -297,11 +297,11 @@ static const struct drm_private_state_funcs omap_global_state_funcs = {
>  
>  static int omap_global_obj_init(struct drm_device *dev)
>  {
>  	struct omap_drm_private *priv = dev->dev_private;
>  
> -	drm_atomic_private_obj_init(dev, &priv->glob_obj, NULL,
> +	drm_atomic_private_obj_init(dev, &priv->glob_obj,
>  				    &omap_global_state_funcs);
>  	return 0;
>  }
>  
>  static void omap_global_obj_fini(struct omap_drm_private *priv)
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index e8cc4382532fffaea99020755ad78d3252613c26..5c7fd36aaadc405b9dae0acb1e8b4f12f12c84bd 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -955,11 +955,11 @@ static int tegra_display_hub_init(struct host1x_client *client)
>  {
>  	struct tegra_display_hub *hub = to_tegra_display_hub(client);
>  	struct drm_device *drm = dev_get_drvdata(client->host);
>  	struct tegra_drm *tegra = drm->dev_private;
>  
> -	drm_atomic_private_obj_init(drm, &hub->base, NULL,
> +	drm_atomic_private_obj_init(drm, &hub->base,
>  				    &tegra_display_hub_state_funcs);
>  
>  	tegra->hub = hub;
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index f82c7ea1d74eeaa075296533a1ffe3561f197748..8f60e9e98380984a0de7c9243c5ba703316d0c13 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -114,11 +114,11 @@ static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
>  
>  static int vc4_ctm_obj_init(struct vc4_dev *vc4)
>  {
>  	drm_modeset_lock_init(&vc4->ctm_state_lock);
>  
> -	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager, NULL,
> +	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager,
>  				    &vc4_ctm_state_funcs);
>  
>  	return drmm_add_action_or_reset(&vc4->base, vc4_ctm_obj_fini, NULL);
>  }
>  
> @@ -755,11 +755,10 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
>  }
>  
>  static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
>  {
>  	drm_atomic_private_obj_init(&vc4->base, &vc4->load_tracker,
> -				    NULL,
>  				    &vc4_load_tracker_state_funcs);
>  
>  	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
>  }
>  
> @@ -847,11 +846,10 @@ static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
>  }
>  
>  static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
>  {
>  	drm_atomic_private_obj_init(&vc4->base, &vc4->hvs_channels,
> -				    NULL,
>  				    &vc4_hvs_state_funcs);
>  
>  	return drmm_add_action_or_reset(&vc4->base, vc4_hvs_channels_obj_fini, NULL);
>  }
>  
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 0b1b32bcd2bda1b92299fd369ba7c23b1c2d3dfa..f03cd199aee73fa8e15b2d9e16a53d134fc7de7d 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -736,11 +736,10 @@ struct drm_connector_state * __must_check
>  drm_atomic_get_connector_state(struct drm_atomic_state *state,
>  			       struct drm_connector *connector);
>  
>  int drm_atomic_private_obj_init(struct drm_device *dev,
>  				struct drm_private_obj *obj,
> -				struct drm_private_state *state,
>  				const struct drm_private_state_funcs *funcs);
>  void drm_atomic_private_obj_fini(struct drm_private_obj *obj);
>  
>  struct drm_private_state * __must_check
>  drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
> 
> -- 
> 2.52.0
> 
