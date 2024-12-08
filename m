Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5069E8421
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 08:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D6110E44E;
	Sun,  8 Dec 2024 07:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LbRfL0BH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B072A10E437
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 07:24:17 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53e3778bffdso1994707e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 23:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733642656; x=1734247456; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xtYJJ+NMuuTiFWKusKg1jip0CN7pOh5dKenRFxmoJtQ=;
 b=LbRfL0BHb0QtPRJKNHw+4fmin4wI736iPL1Ks7qc4+KwukJj9LJCGxzmXTEfVNNv1m
 gQ5mHyf50usSLPMKHZCENmI58HFOkdpnXVoAu5QEN8xWZSp1t6GyihVKDUhg5GxvsG6a
 /OPt6+JI3qqT7+MNcXE9GK4z9GYdTf0Ft8aeubzZEKlP2Mm04y+/DChHe5qgZsrVH8Bn
 YVNMP4T6QbTMFivJTevnbXXKFUV6xej6Q6A9Fn5k13aJMbMJ1brDgvQy3RZEJipipiT3
 WyldeGABMKMU38kz+Bx/ItmYvvEYZTbBzwGtjn9HFWlvq/Sl/KcUk6U+Eha5wG4rgIR9
 4P0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733642656; x=1734247456;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xtYJJ+NMuuTiFWKusKg1jip0CN7pOh5dKenRFxmoJtQ=;
 b=QHU2oTflnaGpI8ahCXsI2Wob7mzUg9PyLO/QPdhd77QZtfR27kiKrenrboekHFueJ9
 CiWRtuCljwmk9IddCRSpRezxdQ3ixzcz4etk++TuLwo85pELU1dASuyNsiWOhuF5iZRW
 20ge5SURWo0sMA+A/SkXipgMuFcXUWV5Y+h8dLVVW1umDKjdW0zktg8MDhS81l64ITHn
 xpxuFOJSr21+BqmmvmfhSaFjGxK4CxZ7CCex36nPhu8KGt0FD6VD5dp1VUf7H3uTDGcJ
 Eh1wKSXLvBhWfb4tlVp8AilzuhgiRJ7/2CduiutLu9Hw3Kplw7L1wrtZCGSlLV5o7lhu
 givA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzTV7GVA5/qX+HO68F8rvlVvk/C9Iy3nCAHVI1Tslsf4itc3cff9yku3k2bED5u2esD4ydqt74SOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxElaQBbpKtrZgfMkkTznzVHWBixz+IcyJBhhVcqEmuT58y5CBL
 Q2v8Db6aeiomUZyWhabtzlgWcdhw/CqF0+U0f4ENQhP5xszAJqBbF2URJJH2xZ4=
X-Gm-Gg: ASbGncvbkZGn1NOHAfAgMA02PvwXwT8yKTBZpx4CI06Jx51BNfpkEbPmuoMet1LjKHL
 Lozjg19tgswCbyW+a5BfjqYFSDha6Gv++4unzznZw8F+QIx59EpvYyUdNHL3A2Ex/GFEcjm4kDt
 6gWKd0Jq9i/zVVck5HTZU6cCty6El9Qt0E6gfJL+OsNpL5L4SxrmYHS6vEjXy9TKGr/9ICA5DOg
 duHl4DPIREVMfq06Yz64ILQqFrH1LNBBQ0WyfGGAifYKHPgIGk5BhDZbMajb3YoVRgi/eJe1kqg
 kJoeBjNbX08599eONC3JVsh+hrbtyg==
X-Google-Smtp-Source: AGHT+IGWQhRQ+0cm/m4HvnC6mhc4l2oe4pQV9Gc85Sh33oQmYZ4ULj1LBugmnBzzNkvrMhVs6to8DQ==
X-Received: by 2002:ac2:5de3:0:b0:53e:362e:ed1 with SMTP id
 2adb3069b0e04-53e362e0f0fmr1777017e87.53.1733642655736; 
 Sat, 07 Dec 2024 23:24:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3c39b96asm385396e87.225.2024.12.07.23.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 23:24:14 -0800 (PST)
Date: Sun, 8 Dec 2024 09:24:11 +0200
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
Subject: Re: [PATCH 32/45] drm/msm/dp: add connector abstraction for DP MST
Message-ID: <smufyepzjbqu4ndplyitsn34wpbuy5iuwph4w7ntlif3qdotzd@ned3bgi6gmir>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-32-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-32-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:03PM -0800, Abhinav Kumar wrote:
> Add connector abstraction for the DP MST. Each MST encoder
> is connected through a DRM bridge to a MST connector and each
> MST connector has a DP panel abstraction attached to it.

Why do we need an extra DRM bridge? Can we merge its functionality into
the DRM MST connector?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 517 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |   4 +
>  2 files changed, 521 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index e66bd1e565aeb4da3d636eb5f4aa75504d60fd40..2934fe6a93ff8b927b035c01b6007f3f4ec91a3f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -26,6 +26,7 @@
>   * OF THIS SOFTWARE.
>   */
>  
> +#include <drm/drm_edid.h>
>  #include "dp_mst_drm.h"
>  
>  static struct drm_private_state *msm_dp_mst_duplicate_bridge_state(struct drm_private_obj *obj)
> @@ -80,6 +81,64 @@ static int msm_dp_mst_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, int p
>  	return num_slots;
>  }
>  
> +static int msm_dp_mst_get_mst_pbn_div(struct msm_dp_panel *msm_dp_panel)
> +{
> +	struct msm_dp_link_info *link_info;
> +
> +	link_info = &msm_dp_panel->link_info;
> +
> +	return link_info->rate * link_info->num_lanes / 54000;
> +}
> +
> +static int _msm_dp_mst_compute_config(struct drm_atomic_state *state,
> +				      struct msm_dp_mst *mst, struct drm_connector *connector,
> +				      struct drm_display_mode *mode)

No single underscore functions, please.

> +{
> +	int slots = 0, pbn;
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	int rc = 0;
> +	struct drm_dp_mst_topology_state *mst_state;
> +	int pbn_div;
> +	struct msm_dp *dp_display = mst->msm_dp;
> +	u32 bpp;
> +
> +	bpp = connector->display_info.bpc * 3;
> +	//default to 24
> +	if (!bpp)
> +		bpp = 24;
> +
> +	pbn = drm_dp_calc_pbn_mode(mode->clock, bpp << 4);
> +
> +	mst_state = to_drm_dp_mst_topology_state(mst->mst_mgr.base.state);

Here from atomic_check() you are accessing existing state. That doesn't
sound correct. Please take a look at i915 driver.

> +
> +	if (!dfixed_trunc(mst_state->pbn_div)) {
> +		pbn_div = msm_dp_mst_get_mst_pbn_div(mst_conn->dp_panel);
> +		mst_state->pbn_div.full = dfixed_const(pbn_div);
> +	}
> +
> +	rc = drm_dp_atomic_find_time_slots(state, &mst->mst_mgr, mst_conn->mst_port, pbn);
> +	if (rc < 0) {
> +		DRM_ERROR("conn:%d failed to find vcpi slots. pbn:%d, rc:%d\n",
> +			  connector->base.id, pbn, rc);
> +		goto end;
> +	}
> +
> +	slots = rc;
> +
> +	rc = drm_dp_mst_atomic_check(state);
> +	if (rc) {
> +		DRM_ERROR("conn:%d mst atomic check failed: rc=%d\n", connector->base.id, rc);
> +		slots = 0;
> +		goto end;
> +	}
> +
> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d pbn:%d slots:%d rc:%d\n",
> +		   connector->base.id, pbn, slots, rc);
> +
> +end:
> +	return (rc < 0 ? rc : slots);
> +}
> +
>  static void _msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
>  					 struct msm_dp_mst_bridge *mst_bridge,
>  					 struct drm_dp_mst_port *port)
> @@ -488,3 +547,461 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder)
>  end:
>  	return rc;
>  }
> +
> +static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomic_state *st,
> +								struct msm_dp_mst_bridge *bridge)
> +{
> +	struct drm_device *dev = bridge->base.dev;
> +
> +	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
> +
> +	return to_msm_dp_mst_bridge_priv_state(drm_atomic_get_private_obj_state(st,
> +										&bridge->obj));

drm_atomic_get_bridge_state() NIH?

> +}
> +
> +/* DP MST Connector OPs */
> +static int
> +msm_dp_mst_connector_detect(struct drm_connector *connector,
> +			    struct drm_modeset_acquire_ctx *ctx,
> +			    bool force)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	enum drm_connector_status status = connector_status_disconnected;
> +

Missing check for unregistered connector.

> +	if (dp_display->link_ready)

I really want to get rid of link_ready checks in the detect paths.
Please refactor the HPD / detect handling to report actual plug status
rather than link being ready.

> +		status = drm_dp_mst_detect_port(connector,
> +						ctx, &mst->mst_mgr, mst_conn->mst_port);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "conn:%d status:%d\n", connector->base.id, status);
> +
> +	return (int)status;

No need for typecasting. enum is int underneath. Also just return
drm_dp_mst_detect_port() as everybody else does.

> +}
> +
> +static int msm_dp_mst_connector_get_modes(struct drm_connector *connector)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct msm_dp_panel *dp_panel = mst_conn->dp_panel;

Missing unregistered check

> +
> +	drm_edid_free(dp_panel->drm_edid);
> +
> +	dp_panel->drm_edid = drm_dp_mst_edid_read(connector, &mst->mst_mgr, mst_conn->mst_port);
> +	if (!dp_panel->drm_edid) {

Stop caching the EDID. Let it go.

> +		DRM_ERROR("get edid failed. id: %d\n", connector->base.id);
> +		return -EINVAL;
> +	}
> +
> +	drm_edid_connector_update(connector, dp_panel->drm_edid);
> +
> +	return drm_edid_connector_add_modes(connector);
> +}
> +
> +static enum drm_mode_status msm_dp_mst_connector_mode_valid(struct drm_connector *connector,
> +							    struct drm_display_mode *mode)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct drm_dp_mst_port *mst_port;
> +	struct msm_dp_panel *dp_panel;
> +	struct msm_dp_mst *mst;
> +	u16 full_pbn, required_pbn;
> +	int available_slots, required_slots;
> +	struct msm_dp_mst_bridge_state *dp_bridge_state;
> +	int i, slots_in_use = 0, active_enc_cnt = 0;
> +	const u32 tot_slots = 63;

Missing unregistered check

> +
> +	if (!connector || !mode || !dp_display) {
> +		DRM_ERROR("invalid input\n");
> +		return 0;
> +	}

Useless, please drop

> +
> +	mst = dp_display->msm_dp_mst;
> +	mst_conn = to_msm_dp_mst_connector(connector);
> +	mst_port = mst_conn->mst_port;
> +	dp_panel = mst_conn->dp_panel;
> +
> +	if (!dp_panel || !mst_port)
> +		return MODE_ERROR;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		dp_bridge_state = to_msm_dp_mst_bridge_state(&mst->mst_bridge[i]);

Can we just order them by stream_id?

> +		if (dp_bridge_state->connector &&
> +		    dp_bridge_state->connector != connector) {
> +			active_enc_cnt++;
> +			slots_in_use += dp_bridge_state->num_slots;
> +		}
> +	}
> +
> +	if (active_enc_cnt < DP_STREAM_MAX) {
> +		full_pbn = mst_port->full_pbn;
> +		available_slots = tot_slots - slots_in_use;
> +	} else {
> +		DRM_ERROR("all mst streams are active\n");

No! mode_valid() checks if the mode is valid at all. It should perform
the same checks as an SST controller is doing. None of the PBN / slots
checks belong here. Intel driver does slightly different check: it
verifies that the mode can fit at all, not that it can fit into the
available slots. And there is a very simple logic for that: the modes
for a connector are not revalidated if another connector changes state
or mode.

Also, if we think about it, how are you accessing the current slots
state without taking the modesetting lock? What if the underlying object
changes while you are running mode_valid() checks? Note, i915 driver
uses different callback and it also uses the context.

> +		return MODE_BAD;
> +	}
> +
> +	required_pbn = drm_dp_calc_pbn_mode(mode->clock, (connector->display_info.bpc * 3) << 4);
> +
> +	required_slots = msm_dp_mst_find_vcpi_slots(&mst->mst_mgr, required_pbn);
> +
> +	if (required_pbn > full_pbn || required_slots > available_slots) {
> +		drm_dbg_dp(dp_display->drm_dev,
> +			   "mode:%s not supported. pbn %d vs %d slots %d vs %d\n",
> +			   mode->name, required_pbn, full_pbn,
> +			   required_slots, available_slots);
> +		return MODE_BAD;
> +	}
> +
> +	return msm_dp_display_mode_valid(dp_display, &dp_display->connector->display_info, mode);
> +}
> +
> +static struct drm_encoder *
> +msm_dp_mst_atomic_best_encoder(struct drm_connector *connector, struct drm_atomic_state *state)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	struct drm_encoder *enc = NULL;
> +	struct msm_dp_mst_bridge_state *bridge_state;
> +	u32 i;
> +	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
> +										    connector);
> +
> +	if (conn_state && conn_state->best_encoder)
> +		return conn_state->best_encoder;
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		bridge_state = msm_dp_mst_br_priv_state(state, &mst->mst_bridge[i]);
> +		if (IS_ERR(bridge_state))
> +			goto end;
> +
> +		if (bridge_state->connector == connector) {
> +			enc = mst->mst_bridge[i].encoder;
> +			goto end;
> +		}
> +	}
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		bridge_state = msm_dp_mst_br_priv_state(state, &mst->mst_bridge[i]);
> +

mst_bridges should be ordered by stream_id, save you from the loop, etc.
And, I think, allows us to drop the possibly-lingering pointer to the
drm_connector.

> +		if (!bridge_state->connector) {
> +			bridge_state->connector = connector;
> +			bridge_state->msm_dp_panel = mst_conn->dp_panel;
> +			enc = mst->mst_bridge[i].encoder;
> +			break;
> +		}
> +	}
> +
> +end:
> +	if (enc)
> +		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder:%d\n",
> +			   connector->base.id, i);
> +	else
> +		drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic best encoder failed\n",
> +			   connector->base.id);
> +
> +	return enc;
> +}
> +
> +static int msm_dp_mst_connector_atomic_check(struct drm_connector *connector,
> +					     struct drm_atomic_state *state)
> +{
> +	int rc = 0, slots, i;
> +	bool vcpi_released = false;
> +	struct drm_connector_state *old_conn_state;
> +	struct drm_connector_state *new_conn_state;
> +	struct drm_crtc *old_crtc;
> +	struct drm_crtc_state *crtc_state;
> +	struct msm_dp_mst_bridge *bridge;
> +	struct msm_dp_mst_bridge_state *bridge_state;
> +	struct drm_bridge *drm_bridge;
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +	struct msm_dp *dp_display = mst_conn->msm_dp;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +
> +	if (!state)
> +		return rc;
> +
> +	new_conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!new_conn_state)
> +		return rc;
> +
> +	old_conn_state = drm_atomic_get_old_connector_state(state, connector);
> +	if (!old_conn_state)
> +		goto mode_set;
> +
> +	old_crtc = old_conn_state->crtc;
> +	if (!old_crtc)
> +		goto mode_set;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, old_crtc);
> +
> +	for (i = 0; i < mst->max_streams; i++) {
> +		bridge = &mst->mst_bridge[i];
> +		drm_dbg_dp(dp_display->drm_dev, "bridge id:%d, vcpi:%d, pbn:%d, slots:%d\n",
> +			   bridge->id, bridge->vcpi, bridge->pbn,
> +			   bridge->num_slots);
> +	}
> +
> +	/*attempt to release vcpi slots on a modeset change for crtc state*/
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		if (WARN_ON(!old_conn_state->best_encoder)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		drm_bridge = drm_bridge_chain_get_first_bridge(old_conn_state->best_encoder);
> +		if (WARN_ON(!drm_bridge)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +		bridge = to_msm_dp_mst_bridge(drm_bridge);
> +
> +		bridge_state = msm_dp_mst_br_priv_state(state, bridge);
> +		if (IS_ERR(bridge_state)) {
> +			rc = PTR_ERR(bridge_state);
> +			goto end;
> +		}
> +
> +		if (WARN_ON(bridge_state->connector != connector)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		slots = bridge_state->num_slots;
> +		if (slots > 0) {
> +			rc = drm_dp_atomic_release_time_slots(state,
> +							      &mst->mst_mgr,
> +							      mst_conn->mst_port);
> +			if (rc) {
> +				DRM_ERROR("failed releasing %d vcpi slots %d\n", slots, rc);
> +				goto end;
> +			}
> +			vcpi_released = true;
> +		}
> +
> +		if (!new_conn_state->crtc) {
> +			/* for cases where crtc is not disabled the slots are not
> +			 * freed by drm_dp_atomic_release_time_slots. this results
> +			 * in subsequent atomic_check failing since internal slots
> +			 * were freed but not the dp mst mgr's
> +			 */

Huh?

> +			bridge_state->num_slots = 0;
> +			bridge_state->connector = NULL;
> +			bridge_state->msm_dp_panel = NULL;
> +
> +			drm_dbg_dp(dp_display->drm_dev, "clear best encoder: %d\n", bridge->id);
> +		}
> +	}
> +
> +mode_set:
> +	if (!new_conn_state->crtc)
> +		goto end;
> +
> +	crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
> +
> +	if (drm_atomic_crtc_needs_modeset(crtc_state) && crtc_state->active) {
> +		if (WARN_ON(!new_conn_state->best_encoder)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		drm_bridge = drm_bridge_chain_get_first_bridge(new_conn_state->best_encoder);
> +		if (WARN_ON(!drm_bridge)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +		bridge = to_msm_dp_mst_bridge(drm_bridge);
> +
> +		bridge_state = msm_dp_mst_br_priv_state(state, bridge);
> +		if (IS_ERR(bridge_state)) {
> +			rc = PTR_ERR(bridge_state);
> +			goto end;
> +		}
> +
> +		if (WARN_ON(bridge_state->connector != connector)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		/*
> +		 * check if vcpi slots are trying to get allocated in same phase
> +		 * as deallocation. If so, go to end to avoid allocation.
> +		 */

I don't see this in any other driver. Do you have a pointer?

> +		if (vcpi_released) {
> +			drm_dbg_dp(dp_display->drm_dev,
> +				   "skipping allocation since vcpi was released in the same state\n");
> +			goto end;
> +		}
> +
> +		if (WARN_ON(bridge_state->num_slots)) {
> +			rc = -EINVAL;
> +			goto end;
> +		}
> +
> +		slots = _msm_dp_mst_compute_config(state, mst, connector, &crtc_state->mode);
> +		if (slots < 0) {
> +			rc = slots;
> +			goto end;
> +		}
> +
> +		bridge_state->num_slots = slots;
> +	}
> +
> +end:
> +	drm_dbg_dp(dp_display->drm_dev, "mst connector:%d atomic check ret %d\n",
> +		   connector->base.id, rc);
> +	return rc;
> +}
> +
> +static void dp_mst_connector_destroy(struct drm_connector *connector)
> +{
> +	struct msm_dp_mst_connector *mst_conn = to_msm_dp_mst_connector(connector);
> +
> +	drm_connector_cleanup(connector);
> +	drm_dp_mst_put_port_malloc(mst_conn->mst_port);
> +	msm_dp_panel_put(mst_conn->dp_panel);
> +}
> +
> +/* DRM MST callbacks */
> +static const struct drm_connector_helper_funcs msm_dp_drm_mst_connector_helper_funcs = {
> +	.get_modes =    msm_dp_mst_connector_get_modes,
> +	.detect_ctx =   msm_dp_mst_connector_detect,
> +	.mode_valid =   msm_dp_mst_connector_mode_valid,
> +	.atomic_best_encoder = msm_dp_mst_atomic_best_encoder,
> +	.atomic_check = msm_dp_mst_connector_atomic_check,
> +};
> +
> +static const struct drm_connector_funcs msm_dp_drm_mst_connector_funcs = {
> +	.reset = drm_atomic_helper_connector_reset,
> +	.destroy = dp_mst_connector_destroy,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static struct drm_connector *
> +msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
> +			 struct drm_dp_mst_port *port, const char *pathprop)
> +{
> +	struct msm_dp_mst *dp_mst;
> +	struct drm_device *dev;
> +	struct msm_dp *dp_display;
> +	struct msm_dp_mst_connector *mst_connector;
> +	struct drm_connector *connector;
> +	int rc, i;
> +
> +	dp_mst = container_of(mgr, struct msm_dp_mst, mst_mgr);
> +
> +	dp_display = dp_mst->msm_dp;
> +	dev = dp_display->drm_dev;
> +
> +	mst_connector = devm_kzalloc(dev->dev, sizeof(*mst_connector), GFP_KERNEL);
> +
> +	drm_modeset_lock_all(dev);
> +
> +	rc = drm_connector_init(dev, &mst_connector->connector, &msm_dp_drm_mst_connector_funcs,
> +				DRM_MODE_CONNECTOR_DisplayPort);
> +	if (rc) {
> +		drm_modeset_unlock_all(dev);
> +		return NULL;
> +	}
> +
> +	mst_connector->dp_panel = msm_dp_display_get_panel(dp_display);
> +	if (!mst_connector->dp_panel) {
> +		DRM_ERROR("failed to get dp_panel for connector\n");
> +		drm_modeset_unlock_all(dev);
> +		return NULL;
> +	}
> +
> +	mst_connector->dp_panel->connector = &mst_connector->connector;
> +	mst_connector->msm_dp = dp_display;
> +	connector = &mst_connector->connector;
> +	drm_connector_helper_add(&mst_connector->connector, &msm_dp_drm_mst_connector_helper_funcs);
> +
> +	if (connector->funcs->reset)
> +		connector->funcs->reset(connector);
> +
> +	/* add all encoders as possible encoders */
> +	for (i = 0; i < dp_mst->max_streams; i++) {
> +		rc = drm_connector_attach_encoder(&mst_connector->connector,
> +						  dp_mst->mst_bridge[i].encoder);
> +		if (rc) {
> +			DRM_ERROR("failed to attach encoder to connector, %d\n", rc);
> +			drm_modeset_unlock_all(dev);
> +			return NULL;
> +		}
> +	}
> +
> +	mst_connector->mst_port = port;
> +	drm_dp_mst_get_port_malloc(mst_connector->mst_port);
> +
> +	drm_object_attach_property(&mst_connector->connector.base,
> +				   dev->mode_config.path_property, 0);
> +	drm_object_attach_property(&mst_connector->connector.base,
> +				   dev->mode_config.tile_property, 0);
> +
> +	drm_modeset_unlock_all(dev);
> +
> +	drm_dbg_dp(dp_display->drm_dev, "add mst connector id:%d\n",
> +		   mst_connector->connector.base.id);
> +
> +	return &mst_connector->connector;
> +}
> +
> +static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
> +	.add_connector = msm_dp_mst_add_connector,
> +};
> +
> +int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, u32 max_dpcd_transaction_bytes,
> +		    struct drm_dp_aux *drm_aux)
> +{
> +	struct drm_device *dev;
> +	int conn_base_id = 0;
> +	int ret;
> +	struct msm_dp_mst *msm_dp_mst;
> +
> +	if (!dp_display) {
> +		DRM_ERROR("invalid params\n");
> +		return 0;
> +	}
> +
> +	dev = dp_display->drm_dev;
> +
> +	msm_dp_mst = devm_kzalloc(dev->dev, sizeof(*msm_dp_mst), GFP_KERNEL);
> +	if (!msm_dp_mst)
> +		return -ENOMEM;
> +
> +	memset(&msm_dp_mst->mst_mgr, 0, sizeof(msm_dp_mst->mst_mgr));
> +	msm_dp_mst->mst_mgr.cbs = &msm_dp_mst_drm_cbs;
> +	conn_base_id = dp_display->connector->base.id;
> +	msm_dp_mst->msm_dp = dp_display;
> +	msm_dp_mst->max_streams = max_streams;
> +
> +	msm_dp_mst->mst_bridge = devm_kzalloc(dev->dev,

devm_ seems incorrect here. drmm_ sounds more appropriate.

> +					      max_streams * sizeof(struct msm_dp_mst_bridge),
> +					      GFP_KERNEL);
> +
> +	msm_dp_mst->dp_aux = drm_aux;
> +
> +	ret = drm_dp_mst_topology_mgr_init(&msm_dp_mst->mst_mgr, dev,
> +					   drm_aux,
> +					   max_dpcd_transaction_bytes,
> +					   max_streams,
> +					   conn_base_id);
> +	if (ret) {
> +		DRM_ERROR("dp drm mst topology manager init failed\n");
> +		return ret;
> +	}
> +
> +	dp_display->msm_dp_mst = msm_dp_mst;
> +
> +	msm_dp_mst->mst_initialized = true;

Can it exist in a non-initialized state?

> +
> +	drm_dbg_dp(dp_display->drm_dev, "dp drm mst topology manager init completed\n");
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index c2a82cd3c6d6e1951a8e5905d3aa39dfc691023b..9a8535b97193d911592b44fdfcf43ca2f252cea0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -77,6 +77,7 @@ struct msm_dp_mst {
>  	struct drm_dp_mst_topology_mgr mst_mgr;
>  	struct msm_dp_mst_bridge *mst_bridge;
>  	struct msm_dp *msm_dp;
> +	struct drm_dp_aux *dp_aux;
>  	bool mst_session_hpd_state;
>  	u32 max_streams;
>  };
> @@ -99,4 +100,7 @@ struct msm_dp_mst_connector {
>  		container_of((x), struct msm_dp_mst_connector, connector)
>  int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>  
> +int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams,
> +		    u32 max_dpcd_transaction_bytes, struct drm_dp_aux *drm_aux);
> +
>  #endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
