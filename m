Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A6AC4962
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 09:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2754D10E3D4;
	Tue, 27 May 2025 07:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uRL6El0Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6381710E3D4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 07:38:27 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A77F725;
 Tue, 27 May 2025 09:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1748331479;
 bh=MCPzXDdpR/usqkobCJ+r/ncmynXhnbhP8CzSV3T0ZBc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uRL6El0Qkxvg3MB5xOMB6CKGfXEl/MRmIxtrnmJoK2ERYgPcASCRZ+6QNmKo6rwap
 LAvLhF7ZSlrJzXD6wQezDI83QzRz6goYaQFNu8RgKxJX4+Ex2uID2v3BqGu5YE/1bv
 7ZvdMabYEuJQW0glCSEA6ISjfbAA4DHHrqO2w7vw=
Message-ID: <ea92f925-7778-477b-aeab-604407260de8@ideasonboard.com>
Date: Tue, 27 May 2025 10:38:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] drm/bridge: cadence: cdns-mhdp8546-core:
 Remove legacy support for connector initialisation in bridge
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, jani.nikula@intel.com,
 andy.yan@rock-chips.com, mordan@ispras.ru, linux@treblig.org,
 viro@zeniv.linux.org.uk, yamonkar@cadence.com, sjakhade@cadence.com,
 quentin.schulz@free-electrons.com, jsarha@ti.com,
 linux-kernel@vger.kernel.org, devarsht@ti.com, dianders@chromium.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 alexander.stein@ew.tq-group.com
References: <20250521073237.366463-1-j-choudhary@ti.com>
 <20250521073237.366463-2-j-choudhary@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250521073237.366463-2-j-choudhary@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 21/05/2025 10:32, Jayesh Choudhary wrote:
> Now that we have DBANC framework, remove the connector initialisation code
> as that piece of code is not called if DRM_BRIDGE_ATTACH_NO_CONNECTOR flag
> is used. Only TI K3 platforms consume this driver and tidss (their display
> controller) has this flag set. So this legacy support can be dropped.
> 

Why is the series RFC? Does it not work? Is there something here you're
not comfortable with?

> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 186 +++---------------
>  1 file changed, 25 insertions(+), 161 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index b431e7efd1f0..66bd916c2fe9 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -1444,56 +1444,6 @@ static const struct drm_edid *cdns_mhdp_edid_read(struct cdns_mhdp_device *mhdp,
>  	return drm_edid_read_custom(connector, cdns_mhdp_get_edid_block, mhdp);
>  }
>  
> -static int cdns_mhdp_get_modes(struct drm_connector *connector)
> -{
> -	struct cdns_mhdp_device *mhdp = connector_to_mhdp(connector);
> -	const struct drm_edid *drm_edid;
> -	int num_modes;
> -
> -	if (!mhdp->plugged)
> -		return 0;
> -
> -	drm_edid = cdns_mhdp_edid_read(mhdp, connector);
> -
> -	drm_edid_connector_update(connector, drm_edid);
> -
> -	if (!drm_edid) {
> -		dev_err(mhdp->dev, "Failed to read EDID\n");
> -		return 0;
> -	}
> -
> -	num_modes = drm_edid_connector_add_modes(connector);
> -	drm_edid_free(drm_edid);
> -
> -	/*
> -	 * HACK: Warn about unsupported display formats until we deal
> -	 *       with them correctly.
> -	 */
> -	if (connector->display_info.color_formats &&
> -	    !(connector->display_info.color_formats &
> -	      mhdp->display_fmt.color_format))
> -		dev_warn(mhdp->dev,
> -			 "%s: No supported color_format found (0x%08x)\n",
> -			__func__, connector->display_info.color_formats);
> -
> -	if (connector->display_info.bpc &&
> -	    connector->display_info.bpc < mhdp->display_fmt.bpc)
> -		dev_warn(mhdp->dev, "%s: Display bpc only %d < %d\n",
> -			 __func__, connector->display_info.bpc,
> -			 mhdp->display_fmt.bpc);
> -
> -	return num_modes;
> -}
> -
> -static int cdns_mhdp_connector_detect(struct drm_connector *conn,
> -				      struct drm_modeset_acquire_ctx *ctx,
> -				      bool force)
> -{
> -	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
> -
> -	return cdns_mhdp_detect(mhdp);
> -}
> -
>  static u32 cdns_mhdp_get_bpp(struct cdns_mhdp_display_fmt *fmt)
>  {
>  	u32 bpp;
> @@ -1547,114 +1497,6 @@ bool cdns_mhdp_bandwidth_ok(struct cdns_mhdp_device *mhdp,
>  	return true;
>  }
>  
> -static
> -enum drm_mode_status cdns_mhdp_mode_valid(struct drm_connector *conn,
> -					  const struct drm_display_mode *mode)
> -{
> -	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
> -
> -	mutex_lock(&mhdp->link_mutex);
> -
> -	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
> -				    mhdp->link.rate)) {
> -		mutex_unlock(&mhdp->link_mutex);
> -		return MODE_CLOCK_HIGH;
> -	}
> -
> -	mutex_unlock(&mhdp->link_mutex);
> -	return MODE_OK;
> -}
> -
> -static int cdns_mhdp_connector_atomic_check(struct drm_connector *conn,
> -					    struct drm_atomic_state *state)
> -{
> -	struct cdns_mhdp_device *mhdp = connector_to_mhdp(conn);
> -	struct drm_connector_state *old_state, *new_state;
> -	struct drm_crtc_state *crtc_state;
> -	u64 old_cp, new_cp;
> -
> -	if (!mhdp->hdcp_supported)
> -		return 0;
> -
> -	old_state = drm_atomic_get_old_connector_state(state, conn);
> -	new_state = drm_atomic_get_new_connector_state(state, conn);
> -	old_cp = old_state->content_protection;
> -	new_cp = new_state->content_protection;
> -
> -	if (old_state->hdcp_content_type != new_state->hdcp_content_type &&
> -	    new_cp != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> -		new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		goto mode_changed;
> -	}
> -
> -	if (!new_state->crtc) {
> -		if (old_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED)
> -			new_state->content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
> -		return 0;
> -	}
> -
> -	if (old_cp == new_cp ||
> -	    (old_cp == DRM_MODE_CONTENT_PROTECTION_DESIRED &&
> -	     new_cp == DRM_MODE_CONTENT_PROTECTION_ENABLED))
> -		return 0;
> -
> -mode_changed:
> -	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
> -	crtc_state->mode_changed = true;
> -
> -	return 0;
> -}
> -
> -static const struct drm_connector_helper_funcs cdns_mhdp_conn_helper_funcs = {
> -	.detect_ctx = cdns_mhdp_connector_detect,
> -	.get_modes = cdns_mhdp_get_modes,
> -	.mode_valid = cdns_mhdp_mode_valid,
> -	.atomic_check = cdns_mhdp_connector_atomic_check,
> -};
> -
> -static const struct drm_connector_funcs cdns_mhdp_conn_funcs = {
> -	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> -	.reset = drm_atomic_helper_connector_reset,
> -	.destroy = drm_connector_cleanup,
> -};
> -
> -static int cdns_mhdp_connector_init(struct cdns_mhdp_device *mhdp)
> -{
> -	u32 bus_format = MEDIA_BUS_FMT_RGB121212_1X36;
> -	struct drm_connector *conn = &mhdp->connector;
> -	struct drm_bridge *bridge = &mhdp->bridge;
> -	int ret;
> -
> -	conn->polled = DRM_CONNECTOR_POLL_HPD;
> -
> -	ret = drm_connector_init(bridge->dev, conn, &cdns_mhdp_conn_funcs,
> -				 DRM_MODE_CONNECTOR_DisplayPort);
> -	if (ret) {
> -		dev_err(mhdp->dev, "Failed to initialize connector with drm\n");
> -		return ret;
> -	}
> -
> -	drm_connector_helper_add(conn, &cdns_mhdp_conn_helper_funcs);
> -
> -	ret = drm_display_info_set_bus_formats(&conn->display_info,
> -					       &bus_format, 1);
> -	if (ret)
> -		return ret;
> -
> -	ret = drm_connector_attach_encoder(conn, bridge->encoder);
> -	if (ret) {
> -		dev_err(mhdp->dev, "Failed to attach connector to encoder\n");
> -		return ret;
> -	}
> -
> -	if (mhdp->hdcp_supported)
> -		ret = drm_connector_attach_content_protection_property(conn, true);
> -
> -	return ret;
> -}
> -
>  static int cdns_mhdp_attach(struct drm_bridge *bridge,
>  			    struct drm_encoder *encoder,
>  			    enum drm_bridge_attach_flags flags)
> @@ -1671,9 +1513,11 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
>  		return ret;
>  
>  	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
> -		ret = cdns_mhdp_connector_init(mhdp);
> -		if (ret)
> -			goto aux_unregister;
> +		ret = -EINVAL;
> +		dev_err(mhdp->dev,
> +			"Connector initialisation not supported in bridge_attach %d\n",
> +			ret);
> +		goto aux_unregister;
>  	}
>  
>  	spin_lock(&mhdp->start_lock);
> @@ -2158,6 +2002,25 @@ static const struct drm_edid *cdns_mhdp_bridge_edid_read(struct drm_bridge *brid
>  	return cdns_mhdp_edid_read(mhdp, connector);
>  }
>  
> +static enum drm_mode_status
> +cdns_mhdp_bridge_mode_valid(struct drm_bridge *bridge,
> +			    const struct drm_display_info *info,
> +			    const struct drm_display_mode *mode)
> +{
> +	struct cdns_mhdp_device *mhdp = bridge_to_mhdp(bridge);
> +
> +	mutex_lock(&mhdp->link_mutex);
> +
> +	if (!cdns_mhdp_bandwidth_ok(mhdp, mode, mhdp->link.num_lanes,
> +				    mhdp->link.rate)) {
> +		mutex_unlock(&mhdp->link_mutex);
> +		return MODE_CLOCK_HIGH;
> +	}
> +
> +	mutex_unlock(&mhdp->link_mutex);
> +	return MODE_OK;
> +}
> +
>  static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>  	.atomic_enable = cdns_mhdp_atomic_enable,
>  	.atomic_disable = cdns_mhdp_atomic_disable,
> @@ -2172,6 +2035,7 @@ static const struct drm_bridge_funcs cdns_mhdp_bridge_funcs = {
>  	.edid_read = cdns_mhdp_bridge_edid_read,
>  	.hpd_enable = cdns_mhdp_bridge_hpd_enable,
>  	.hpd_disable = cdns_mhdp_bridge_hpd_disable,
> +	.mode_valid = cdns_mhdp_bridge_mode_valid,
>  };
>  
>  static bool cdns_mhdp_detect_hpd(struct cdns_mhdp_device *mhdp, bool *hpd_pulse)

Why do you need to add bridge mode_valid() when removing the legacy
non-DRM_BRIDGE_ATTACH_NO_CONNECTOR code?

 Tomi

