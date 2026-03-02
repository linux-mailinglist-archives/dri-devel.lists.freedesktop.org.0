Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPhQNdXNpWm1GwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:50:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436A1DE0E8
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20D010E539;
	Mon,  2 Mar 2026 17:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WtyOZQTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6CE10E539
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 17:50:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2DC694E424BD;
 Mon,  2 Mar 2026 17:50:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CDA2C5FE89;
 Mon,  2 Mar 2026 17:50:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5531310368CAA; Mon,  2 Mar 2026 18:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1772473805; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=E2yV377sQW0c5N6RevrqfWbOyFtalU/YHrkLt3cGBxw=;
 b=WtyOZQTbfFKj5/QbEli0TEvhsV3N0ByWqHfL50YME4xvob9drpxOaglxWkH8A7Ep9nM9WH
 x7rzQFw3ZkITL7KN1xsfBmyQFr1wNNoKK6amYqo/jZJDpOaZARS5Op6HZmvwcFtk2/u7Xj
 HBgzwzTKPezImCYZhWWdUyX2wRZljwrT51fPvgaozlDXeW9A5cVPv+7+pHBLeVsSFZkD+8
 yEwejZUmhAVHvqSCt4oFDi5QgEvV6pLjRBwXYNygBhyEXihVT1OcsqZUJ6kEMnRNcO4Qwg
 xfnDZzbjCzOc+0NtYva1pV5JjqL2URwmBA0X0r02y18BlDBCyFzcmqpCmvWZmA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 18:49:51 +0100
Message-Id: <DGSHIQOB2YTB.1559SD1YLGT7P@bootlin.com>
Subject: Re: [PATCH v14 7/9] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Cc: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <dri-devel@lists.freedesktop.org>
To: "Chaoyi Chen" <kernel@airkyi.com>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Peter Chen" <hzpeterchen@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul"
 <vkoul@kernel.org>, "Kishon Vijay Abraham I" <kishon@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, "Sandy Huang" <hjc@rock-chips.com>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Yubing Zhang" <yubing.zhang@rock-chips.com>,
 "Frank Wang" <frank.wang@rock-chips.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Amit Sunil Dhamne"
 <amitsd@google.com>, "Chaoyi Chen" <chaoyi.chen@rock-chips.com>, "Dragan
 Simic" <dsimic@manjaro.org>, "Johan Jonker" <jbx6244@gmail.com>, "Diederik
 de Haas" <didi.debian@cknow.org>, "Peter Robinson" <pbrobinson@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260119073100.143-1-kernel@airkyi.com>
 <20260119073100.143-8-kernel@airkyi.com>
In-Reply-To: <20260119073100.143-8-kernel@airkyi.com>
X-Last-TLS-Session-Version: TLSv1.3
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
X-Rspamd-Queue-Id: 3436A1DE0E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:kernel@airkyi.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:hzpeterchen@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:heiko@sntech.de,m:hjc@rock-chips.com,m:andy.yan@rock-chips.com,m:yubing.zhang@rock-chips.com,m:frank.wang@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:amitsd@google.com,m:chaoyi.chen@rock-chips.com,m:dsimic@manjaro.org,m:jbx6244@gmail.com,m:didi.debian@cknow.org,m:pbrobinson@gmail.com,m:k
 rzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[airkyi.com,linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon Jan 19, 2026 at 8:30 AM CET, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>
> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> the CDN-DP can be switched to output to one of the PHYs. If both ports
> are plugged into DP, DP will select the first port for output.
>
> This patch adds support for multiple bridges, enabling users to flexibly
> select the output port. For each PHY port, a separate encoder and bridge
> are registered.
>
> The change is based on the DRM AUX HPD bridge, rather than the
> extcon approach. This requires the DT to correctly describe the
> connections between the first bridge in bridge chain and DP
> controller. For example, the bridge chain may be like this:
>
> PHY aux birdge -> fsa4480 analog audio switch bridge ->
> onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
>
> In this case, the connection relationships among the PHY aux bridge
> and the DP contorller need to be described in DT.
>
> In addition, the cdn_dp_parse_next_bridge_dt() will parses it and
> determines whether to register one or two bridges.
>
> Since there is only one DP controller, only one of the PHY ports can
> output at a time. The key is how to switch between different PHYs,
> which is handled by cdn_dp_switch_port() and cdn_dp_enable().
>
> There are two cases:
>
> 1. Neither bridge is enabled. In this case, both bridges can
> independently read the EDID, and the PHY port may switch before
> reading the EDID.
>
> 2. One bridge is already enabled. In this case, other bridges are not
> allowed to read the EDID. So we will try to return the cached EDID.
>
> Since the scenario of two ports plug in at the same time is rare,
> I don't have a board which support two TypeC connector to test this.
> Therefore, I tested forced switching on a single PHY port, as well as
> output using a fake PHY port alongside a real PHY port.
>
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>
> (no changes since v11)
>
> Changes in v10:
> - Fix refcount usage of drm_bridge.
> - Remove unused cdn_dp_next_bridge type.
>
> Changes in v9:
> - Select DRM_AUX_HPD_BRIDGE when using DP driver.
>
> (no changes since v7)
>
> Changes in v6:
> - Rename some variable names.
> - Attach the DP bridge to the next bridge.
>
> Changes in v5:
> - By parsing the HPD bridge chain, set the connector's of_node to the
> of_node corresponding to the USB-C connector.
> - Return EDID cache when other port is already enabled.
> ---
>
>  drivers/gpu/drm/rockchip/Kconfig       |   1 +
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 325 ++++++++++++++++++++-----
>  drivers/gpu/drm/rockchip/cdn-dp-core.h |  18 +-
>  3 files changed, 287 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/=
Kconfig
> index b7b025814e72..10d9f29a3d44 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -56,6 +56,7 @@ config ROCKCHIP_CDN_DP
>  	select DRM_DISPLAY_HELPER
>  	select DRM_BRIDGE_CONNECTOR
>  	select DRM_DISPLAY_DP_HELPER
> +	select DRM_AUX_HPD_BRIDGE
>  	help
>  	  This selects support for Rockchip SoC specific extensions
>  	  for the cdn DP driver. If you want to enable Dp on
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/roc=
kchip/cdn-dp-core.c
> index 1e27301584a4..0bc3d248c266 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -27,16 +27,17 @@
>  #include "cdn-dp-core.h"
>  #include "cdn-dp-reg.h"
>
> -static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *brid=
ge)
> +static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_po=
rt *prev_port,
> +			      struct cdn_dp_port *port);
> +
> +static inline struct cdn_dp_bridge *bridge_to_dp_bridge(struct drm_bridg=
e *bridge)
>  {
> -	return container_of(bridge, struct cdn_dp_device, bridge);
> +	return container_of(bridge, struct cdn_dp_bridge, bridge);
>  }
>
> -static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *en=
coder)
> +static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *brid=
ge)
>  {
> -	struct rockchip_encoder *rkencoder =3D to_rockchip_encoder(encoder);
> -
> -	return container_of(rkencoder, struct cdn_dp_device, encoder);
> +	return bridge_to_dp_bridge(bridge)->parent;
>  }
>
>  #define GRF_SOC_CON9		0x6224
> @@ -191,14 +192,27 @@ static int cdn_dp_get_sink_count(struct cdn_dp_devi=
ce *dp, u8 *sink_count)
>  static struct cdn_dp_port *cdn_dp_connected_port(struct cdn_dp_device *d=
p)
>  {
>  	struct cdn_dp_port *port;
> -	int i, lanes;
> +	int i, lanes[MAX_PHY];
>
>  	for (i =3D 0; i < dp->ports; i++) {
>  		port =3D dp->port[i];
> -		lanes =3D cdn_dp_get_port_lanes(port);
> -		if (lanes)
> +		lanes[i] =3D cdn_dp_get_port_lanes(port);
> +		if (!dp->next_bridge_valid)
>  			return port;
>  	}
> +
> +	if (dp->next_bridge_valid) {
> +		/* If more than one port is available, pick the last active port */
> +		if (dp->active_port > 0 && lanes[dp->active_port])
> +			return dp->port[dp->active_port];
> +
> +		/* If the last active port is not available, pick an available port in=
 order */
> +		for (i =3D 0; i < dp->bridge_count; i++) {
> +			if (lanes[i])
> +				return dp->port[i];
> +		}
> +	}
> +
>  	return NULL;
>  }
>
> @@ -253,12 +267,45 @@ static const struct drm_edid *
>  cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector =
*connector)
>  {
>  	struct cdn_dp_device *dp =3D bridge_to_dp(bridge);
> -	const struct drm_edid *drm_edid;
> +	struct cdn_dp_bridge *dp_bridge =3D bridge_to_dp_bridge(bridge);
> +	struct cdn_dp_port *port =3D dp->port[dp_bridge->id];
> +	struct cdn_dp_port *prev_port;
> +	const struct drm_edid *drm_edid =3D NULL;
> +	int i, ret;
>
>  	mutex_lock(&dp->lock);
> +
> +	/* More than one port is available */
> +	if (dp->bridge_count > 1 && !port->phy_enabled) {
> +		for (i =3D 0; i < dp->bridge_count; i++) {
> +			/* Another port already enable */
> +			if (dp->bridge_list[i] !=3D dp_bridge && dp->bridge_list[i]->enabled)
> +				goto get_cache;
> +			/* Find already enabled port */
> +			if (dp->port[i]->phy_enabled)
> +				prev_port =3D dp->port[i];
> +		}
> +
> +		/* Switch to current port */
> +		if (prev_port) {
> +			ret =3D cdn_dp_switch_port(dp, prev_port, port);
> +			if (ret)
> +				goto get_cache;
> +		}
> +	}
> +
>  	drm_edid =3D drm_edid_read_custom(connector, cdn_dp_get_edid_block, dp)=
;
> +	/* replace edid cache */
> +	if (dp->edid_cache[dp_bridge->id])
> +		drm_edid_free(dp->edid_cache[dp_bridge->id]);
> +	dp->edid_cache[dp_bridge->id] =3D drm_edid_dup(drm_edid);
> +
>  	mutex_unlock(&dp->lock);
> +	return drm_edid;
>
> +get_cache:
> +	drm_edid =3D drm_edid_dup(dp->edid_cache[dp_bridge->id]);
> +	mutex_unlock(&dp->lock);
>  	return drm_edid;
>  }
>
> @@ -267,12 +314,13 @@ cdn_dp_bridge_mode_valid(struct drm_bridge *bridge,
>  			 const struct drm_display_info *display_info,
>  			 const struct drm_display_mode *mode)
>  {
> +	struct cdn_dp_bridge *dp_bridge =3D bridge_to_dp_bridge(bridge);
>  	struct cdn_dp_device *dp =3D bridge_to_dp(bridge);
>  	u32 requested, actual, rate, sink_max, source_max =3D 0;
>  	u8 lanes, bpc;
>
>  	/* If DP is disconnected, every mode is invalid */
> -	if (!dp->connected)
> +	if (!dp_bridge->connected || !dp->connected)
>  		return MODE_BAD;
>
>  	switch (display_info->bpc) {
> @@ -550,6 +598,54 @@ static bool cdn_dp_check_link_status(struct cdn_dp_d=
evice *dp)
>  	return drm_dp_channel_eq_ok(link_status, min(port->lanes, sink_lanes));
>  }
>
> +static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_po=
rt *prev_port,
> +			      struct cdn_dp_port *port)
> +{
> +	int ret;
> +
> +	if (dp->active)
> +		return 0;
> +
> +	ret =3D cdn_dp_disable_phy(dp, prev_port);
> +	if (ret)
> +		goto out;
> +	ret =3D cdn_dp_enable_phy(dp, port);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D cdn_dp_get_sink_capability(dp);
> +	if (ret) {
> +		cdn_dp_disable_phy(dp, port);
> +		goto out;
> +	}
> +
> +	dp->active =3D true;
> +	dp->lanes =3D port->lanes;
> +
> +	if (!cdn_dp_check_link_status(dp)) {
> +		dev_info(dp->dev, "Connected with sink; re-train link\n");
> +
> +		ret =3D cdn_dp_train_link(dp);
> +		if (ret) {
> +			dev_err(dp->dev, "Training link failed: %d\n", ret);
> +			goto out;
> +		}
> +
> +		ret =3D cdn_dp_set_video_status(dp, CONTROL_VIDEO_IDLE);
> +		if (ret) {
> +			dev_err(dp->dev, "Failed to idle video %d\n", ret);
> +			goto out;
> +		}
> +
> +		ret =3D cdn_dp_config_video(dp);
> +		if (ret)
> +			dev_err(dp->dev, "Failed to configure video: %d\n", ret);
> +	}
> +
> +out:
> +	return ret;
> +}
> +
>  static void cdn_dp_display_info_update(struct cdn_dp_device *dp,
>  				       struct drm_display_info *display_info)
>  {
> @@ -571,6 +667,7 @@ static void cdn_dp_display_info_update(struct cdn_dp_=
device *dp,
>  static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struc=
t drm_atomic_state *state)
>  {
>  	struct cdn_dp_device *dp =3D bridge_to_dp(bridge);
> +	struct cdn_dp_bridge *dp_bridge =3D bridge_to_dp_bridge(bridge);
>  	struct drm_connector *connector;
>  	int ret, val;
>
> @@ -580,7 +677,7 @@ static void cdn_dp_bridge_atomic_enable(struct drm_br=
idge *bridge, struct drm_at
>
>  	cdn_dp_display_info_update(dp, &connector->display_info);
>
> -	ret =3D drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp->encode=
r.encoder);
> +	ret =3D drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp_bridge-=
>encoder.encoder);
>  	if (ret < 0) {
>  		DRM_DEV_ERROR(dp->dev, "Could not get vop id, %d", ret);
>  		return;
> @@ -599,6 +696,9 @@ static void cdn_dp_bridge_atomic_enable(struct drm_br=
idge *bridge, struct drm_at
>
>  	mutex_lock(&dp->lock);
>
> +	if (dp->next_bridge_valid)
> +		dp->active_port =3D dp_bridge->id;
> +
>  	ret =3D cdn_dp_enable(dp);
>  	if (ret) {
>  		DRM_DEV_ERROR(dp->dev, "Failed to enable bridge %d\n",
> @@ -631,6 +731,7 @@ static void cdn_dp_bridge_atomic_enable(struct drm_br=
idge *bridge, struct drm_at
>  		goto out;
>  	}
>
> +	dp_bridge->enabled =3D true;
>  out:
>  	mutex_unlock(&dp->lock);
>  }
> @@ -638,9 +739,11 @@ static void cdn_dp_bridge_atomic_enable(struct drm_b=
ridge *bridge, struct drm_at
>  static void cdn_dp_bridge_atomic_disable(struct drm_bridge *bridge, stru=
ct drm_atomic_state *state)
>  {
>  	struct cdn_dp_device *dp =3D bridge_to_dp(bridge);
> +	struct cdn_dp_bridge *dp_bridge =3D bridge_to_dp_bridge(bridge);
>  	int ret;
>
>  	mutex_lock(&dp->lock);
> +	dp_bridge->enabled =3D false;
>
>  	if (dp->active) {
>  		ret =3D cdn_dp_disable(dp);
> @@ -827,6 +930,16 @@ static int cdn_dp_audio_mute_stream(struct drm_bridg=
e *bridge,
>  	return ret;
>  }
>
> +static void cdn_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> +			   enum drm_connector_status status)
> +{
> +	struct cdn_dp_bridge *dp_bridge =3D bridge_to_dp_bridge(bridge);
> +	struct cdn_dp_device *dp =3D bridge_to_dp(bridge);
> +
> +	dp->bridge_list[dp_bridge->id]->connected =3D status =3D=3D connector_s=
tatus_connected;
> +	schedule_work(&dp->event_work);
> +}
> +
>  static const struct drm_bridge_funcs cdn_dp_bridge_funcs =3D {
>  	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> @@ -837,6 +950,7 @@ static const struct drm_bridge_funcs cdn_dp_bridge_fu=
ncs =3D {
>  	.atomic_disable =3D cdn_dp_bridge_atomic_disable,
>  	.mode_valid =3D cdn_dp_bridge_mode_valid,
>  	.mode_set =3D cdn_dp_bridge_mode_set,
> +	.hpd_notify =3D cdn_dp_bridge_hpd_notify,
>
>  	.dp_audio_prepare =3D cdn_dp_audio_prepare,
>  	.dp_audio_mute_stream =3D cdn_dp_audio_mute_stream,
> @@ -885,7 +999,8 @@ static void cdn_dp_pd_event_work(struct work_struct *=
work)
>  {
>  	struct cdn_dp_device *dp =3D container_of(work, struct cdn_dp_device,
>  						event_work);
> -	int ret;
> +	bool connected;
> +	int i, ret;
>
>  	mutex_lock(&dp->lock);
>
> @@ -944,9 +1059,12 @@ static void cdn_dp_pd_event_work(struct work_struct=
 *work)
>
>  out:
>  	mutex_unlock(&dp->lock);
> -	drm_bridge_hpd_notify(&dp->bridge,
> -			      dp->connected ? connector_status_connected
> -					    : connector_status_disconnected);
> +	for (i =3D 0; i < dp->bridge_count; i++) {
> +		connected =3D dp->connected && dp->bridge_list[i]->connected;
> +		drm_bridge_hpd_notify(&dp->bridge_list[i]->bridge,
> +				      connected ? connector_status_connected
> +						: connector_status_disconnected);
> +	}
>  }
>
>  static int cdn_dp_pd_event(struct notifier_block *nb,
> @@ -966,28 +1084,16 @@ static int cdn_dp_pd_event(struct notifier_block *=
nb,
>  	return NOTIFY_DONE;
>  }
>
> -static int cdn_dp_bind(struct device *dev, struct device *master, void *=
data)
> +static int cdn_bridge_add(struct device *dev,
> +			  struct drm_bridge *bridge,
> +			  struct drm_bridge *next_bridge,
> +			  struct drm_encoder *encoder)
>  {
>  	struct cdn_dp_device *dp =3D dev_get_drvdata(dev);
> -	struct drm_encoder *encoder;
> +	struct drm_device *drm_dev =3D dp->drm_dev;
> +	struct drm_bridge *last_bridge __free(drm_bridge_put) =3D NULL;
>  	struct drm_connector *connector;
> -	struct cdn_dp_port *port;
> -	struct drm_device *drm_dev =3D data;
> -	int ret, i;
> -
> -	ret =3D cdn_dp_parse_dt(dp);
> -	if (ret < 0)
> -		return ret;
> -
> -	dp->drm_dev =3D drm_dev;
> -	dp->connected =3D false;
> -	dp->active =3D false;
> -	dp->active_port =3D -1;
> -	dp->fw_loaded =3D false;
> -
> -	INIT_WORK(&dp->event_work, cdn_dp_pd_event_work);
> -
> -	encoder =3D &dp->encoder.encoder;
> +	int ret;
>
>  	encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm_dev,
>  							     dev->of_node);
> @@ -1002,26 +1108,35 @@ static int cdn_dp_bind(struct device *dev, struct=
 device *master, void *data)
>
>  	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
>
> -	dp->bridge.ops =3D
> -			DRM_BRIDGE_OP_DETECT |
> -			DRM_BRIDGE_OP_EDID |
> -			DRM_BRIDGE_OP_HPD |
> -			DRM_BRIDGE_OP_DP_AUDIO;
> -	dp->bridge.of_node =3D dp->dev->of_node;
> -	dp->bridge.type =3D DRM_MODE_CONNECTOR_DisplayPort;
> -	dp->bridge.hdmi_audio_dev =3D dp->dev;
> -	dp->bridge.hdmi_audio_max_i2s_playback_channels =3D 8;
> -	dp->bridge.hdmi_audio_spdif_playback =3D 1;
> -	dp->bridge.hdmi_audio_dai_port =3D -1;
> -
> -	ret =3D devm_drm_bridge_add(dev, &dp->bridge);
> +	bridge->ops =3D
> +		DRM_BRIDGE_OP_DETECT |
> +		DRM_BRIDGE_OP_EDID |
> +		DRM_BRIDGE_OP_HPD |
> +		DRM_BRIDGE_OP_DP_AUDIO;
> +	bridge->of_node =3D dp->dev->of_node;
> +	bridge->type =3D DRM_MODE_CONNECTOR_DisplayPort;
> +	bridge->hdmi_audio_dev =3D dp->dev;
> +	bridge->hdmi_audio_max_i2s_playback_channels =3D 8;
> +	bridge->hdmi_audio_spdif_playback =3D 1;
> +	bridge->hdmi_audio_dai_port =3D -1;
> +
> +	ret =3D devm_drm_bridge_add(dev, bridge);
>  	if (ret)
>  		return ret;
>
> -	ret =3D drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH=
_NO_CONNECTOR);
> +	ret =3D drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_C=
ONNECTOR);
>  	if (ret)
>  		return ret;
>
> +	if (next_bridge) {
> +		ret =3D drm_bridge_attach(encoder, next_bridge, bridge,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +		if (ret)
> +			return ret;
> +
> +		last_bridge =3D drm_bridge_chain_get_last_bridge(bridge->encoder);
> +	}
> +
>  	connector =3D drm_bridge_connector_init(drm_dev, encoder);
>  	if (IS_ERR(connector)) {
>  		ret =3D PTR_ERR(connector);
> @@ -1029,8 +1144,100 @@ static int cdn_dp_bind(struct device *dev, struct=
 device *master, void *data)
>  		return ret;
>  	}
>
> +	if (last_bridge)
> +		connector->fwnode =3D fwnode_handle_get(of_fwnode_handle(last_bridge->=
of_node));
> +
>  	drm_connector_attach_encoder(connector, encoder);
>
> +	return 0;
> +}
> +
> +static int cdn_dp_parse_next_bridge_dt(struct cdn_dp_device *dp)
> +{
> +	struct device_node *np =3D dp->dev->of_node;
> +	struct device_node *port __free(device_node) =3D of_graph_get_port_by_i=
d(np, 1);
> +	struct drm_bridge *bridge;
> +	int count =3D 0;
> +	int ret =3D 0;
> +	int i;
> +
> +	/* If device use extcon, do not use hpd bridge */
> +	for (i =3D 0; i < dp->ports; i++) {
> +		if (dp->port[i]->extcon) {
> +			dp->bridge_count =3D 1;
> +			return 0;
> +		}
> +	}
> +
> +	/* One endpoint may correspond to one next bridge. */
> +	for_each_of_graph_port_endpoint(port, dp_ep) {
> +		struct device_node *next_bridge_node __free(device_node) =3D
> +			of_graph_get_remote_port_parent(dp_ep);
> +
> +		bridge =3D of_drm_find_bridge(next_bridge_node);
> +		if (!bridge) {
> +			ret =3D -EPROBE_DEFER;
> +			goto out;
> +		}
> +
> +		drm_bridge_get(bridge);
> +		dp->next_bridge_valid =3D true;
> +		dp->next_bridge_list[count] =3D bridge;

Correct, but the drm_bridge_get() slightly far away from the assignement is
a bit misleading. I hadn't seen it initially so I suspected a missing get.

I suggest to do it in a single statement, for clarity:

		dp->next_bridge_list[count] =3D bridgedrm_bridge_get(bridge);

With that changed, at least for the bridge lifetime aspects, you can add to
the next version my:

 Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
