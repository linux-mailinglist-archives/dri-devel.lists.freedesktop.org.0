Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2383135C3B0
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 12:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA1689E63;
	Mon, 12 Apr 2021 10:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598CF89E0C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 10:21:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBCB1AFF3;
 Mon, 12 Apr 2021 10:21:54 +0000 (UTC)
Subject: Re: [PATCH 10/18] drm/vc4: hdmi: Convert to bridge
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-11-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fdf49f8c-3e71-7ca4-40ac-3ee40f9788b5@suse.de>
Date: Mon, 12 Apr 2021 12:21:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-11-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0057251833=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0057251833==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="cUIoQ1DBkZZOTmDQI7mCFk0tTQP8pfnd8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--cUIoQ1DBkZZOTmDQI7mCFk0tTQP8pfnd8
Content-Type: multipart/mixed; boundary="6zgy4HSuv0bru1xpWB00UI3CIeyxjSQ4v";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Message-ID: <fdf49f8c-3e71-7ca4-40ac-3ee40f9788b5@suse.de>
Subject: Re: [PATCH 10/18] drm/vc4: hdmi: Convert to bridge
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-11-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-11-maxime@cerno.tech>

--6zgy4HSuv0bru1xpWB00UI3CIeyxjSQ4v
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> Converting the HDMI controller to a bridge seems like the preferred way=

> to support an YUV output, so let's do this.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_crtc.c |  37 ++++++-----
>   drivers/gpu/drm/vc4/vc4_drv.c  |  15 +++--
>   drivers/gpu/drm/vc4/vc4_drv.h  |  27 +++++---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 111 +++++++++++++++++++++-----------=
-
>   drivers/gpu/drm/vc4/vc4_hdmi.h |   8 +++
>   5 files changed, 131 insertions(+), 67 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_c=
rtc.c
> index e2607e1f2520..8c13d31827bc 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -283,14 +283,19 @@ static struct drm_encoder *vc4_get_crtc_encoder(s=
truct drm_crtc *crtc)
>   	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
>   	drm_for_each_connector_iter(connector, &conn_iter) {
>   		struct drm_encoder *encoder;
> -		struct vc4_encoder *vc4_encoder;
> +		struct drm_bridge *bridge;
> +		struct vc4_bridge *vc4_bridge;
>  =20
>   		encoder =3D vc4_get_connector_encoder(connector);
>   		if (!encoder)
>   			continue;
>  =20
> -		vc4_encoder =3D to_vc4_encoder(encoder);
> -		if (vc4_encoder->crtc =3D=3D crtc) {
> +		bridge =3D drm_bridge_chain_get_first_bridge(encoder);
> +		if (!bridge)
> +			continue;
> +
> +		vc4_bridge =3D to_vc4_bridge(bridge);
> +		if (vc4_bridge->crtc =3D=3D crtc) {
>   			drm_connector_list_iter_end(&conn_iter);
>   			return encoder;
>   		}
> @@ -429,7 +434,8 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
>   			    unsigned int channel)
>   {
>   	struct drm_encoder *encoder =3D vc4_get_crtc_encoder(crtc);
> -	struct vc4_encoder *vc4_encoder =3D to_vc4_encoder(encoder);
> +	struct drm_bridge *bridge =3D drm_bridge_chain_get_first_bridge(encod=
er);
> +	struct vc4_bridge *vc4_bridge =3D to_vc4_bridge(bridge);
>   	struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
>   	struct drm_device *dev =3D crtc->dev;
>   	int ret;
> @@ -457,14 +463,14 @@ static int vc4_crtc_disable(struct drm_crtc *crtc=
,
>   	 */
>   	mdelay(20);
>  =20
> -	if (vc4_encoder && vc4_encoder->post_crtc_disable)
> -		vc4_encoder->post_crtc_disable(encoder, state);
> +	if (vc4_bridge && vc4_bridge->post_crtc_disable)
> +		vc4_bridge->post_crtc_disable(bridge, state);
>  =20
>   	vc4_crtc_pixelvalve_reset(crtc);
>   	vc4_hvs_stop_channel(dev, channel);
>  =20
> -	if (vc4_encoder && vc4_encoder->post_crtc_powerdown)
> -		vc4_encoder->post_crtc_powerdown(encoder, state);
> +	if (vc4_bridge && vc4_bridge->post_crtc_powerdown)
> +		vc4_bridge->post_crtc_powerdown(bridge, state);
>  =20
>   	return 0;
>   }
> @@ -529,7 +535,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc =
*crtc,
>   	struct drm_device *dev =3D crtc->dev;
>   	struct vc4_crtc *vc4_crtc =3D to_vc4_crtc(crtc);
>   	struct drm_encoder *encoder =3D vc4_get_crtc_encoder(crtc);
> -	struct vc4_encoder *vc4_encoder =3D to_vc4_encoder(encoder);
> +	struct drm_bridge *bridge =3D drm_bridge_chain_get_first_bridge(encod=
er);
> +	struct vc4_bridge *vc4_bridge =3D to_vc4_bridge(bridge);
>  =20
>   	require_hvs_enabled(dev);
>  =20
> @@ -540,15 +547,15 @@ static void vc4_crtc_atomic_enable(struct drm_crt=
c *crtc,
>  =20
>   	vc4_hvs_atomic_enable(crtc, state);
>  =20
> -	if (vc4_encoder->pre_crtc_configure)
> -		vc4_encoder->pre_crtc_configure(encoder, state);
> +	if (vc4_bridge->pre_crtc_configure)
> +		vc4_bridge->pre_crtc_configure(bridge, state);
>  =20
>   	vc4_crtc_config_pv(crtc);
>  =20
>   	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
>  =20
> -	if (vc4_encoder->pre_crtc_enable)
> -		vc4_encoder->pre_crtc_enable(encoder, state);
> +	if (vc4_bridge->pre_crtc_enable)
> +		vc4_bridge->pre_crtc_enable(bridge, state);
>  =20
>   	/* When feeding the transposer block the pixelvalve is unneeded and
>   	 * should not be enabled.
> @@ -556,8 +563,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc =
*crtc,
>   	CRTC_WRITE(PV_V_CONTROL,
>   		   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
>  =20
> -	if (vc4_encoder->post_crtc_enable)
> -		vc4_encoder->post_crtc_enable(encoder, state);
> +	if (vc4_bridge->post_crtc_enable)
> +		vc4_bridge->post_crtc_enable(bridge, state);
>   }
>  =20
>   static enum drm_mode_status vc4_crtc_mode_valid(struct drm_crtc *crtc=
,
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_dr=
v.c
> index cd1fb75c66a7..cee54f3b64e9 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -217,20 +217,25 @@ static struct drm_crtc *vc4_drv_find_crtc(struct =
drm_device *drm,
>   	return NULL;
>   }
>  =20
> -static void vc4_drv_set_encoder_data(struct drm_device *drm)
> +static void vc4_drv_set_bridge_data(struct drm_device *drm)
>   {
>   	struct drm_encoder *encoder;
>  =20
>   	drm_for_each_encoder(encoder, drm) {
> -		struct vc4_encoder *vc4_encoder;
> +		struct vc4_bridge *vc4_bridge;
> +		struct drm_bridge *bridge;
>   		struct drm_crtc *crtc;
>  =20
>   		crtc =3D vc4_drv_find_crtc(drm, encoder);
>   		if (WARN_ON(!crtc))
>   			return;
>  =20
> -		vc4_encoder =3D to_vc4_encoder(encoder);
> -		vc4_encoder->crtc =3D crtc;
> +		bridge =3D drm_bridge_chain_get_first_bridge(encoder);
> +		if (!bridge)
> +			continue;
> +
> +		vc4_bridge =3D to_vc4_bridge(bridge);
> +		vc4_bridge->crtc =3D crtc;
>   	}
>   }
>  =20
> @@ -296,7 +301,7 @@ static int vc4_drm_bind(struct device *dev)
>   	ret =3D component_bind_all(dev, drm);
>   	if (ret)
>   		return ret;
> -	vc4_drv_set_encoder_data(drm);
> +	vc4_drv_set_bridge_data(drm);
>  =20
>   	ret =3D vc4_plane_create_additional_planes(drm);
>   	if (ret)
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> index 1b569dcc2154..a5721ffc6529 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -10,6 +10,7 @@
>   #include <linux/uaccess.h>
>  =20
>   #include <drm/drm_atomic.h>
> +#include <drm/drm_bridge.h>
>   #include <drm/drm_debugfs.h>
>   #include <drm/drm_device.h>
>   #include <drm/drm_encoder.h>
> @@ -438,16 +439,8 @@ enum vc4_encoder_type {
>  =20
>   struct vc4_encoder {
>   	struct drm_encoder base;
> -	struct drm_crtc *crtc;
>   	enum vc4_encoder_type type;
>   	u32 clock_select;
> -
> -	void (*pre_crtc_configure)(struct drm_encoder *encoder, struct drm_at=
omic_state *state);
> -	void (*pre_crtc_enable)(struct drm_encoder *encoder, struct drm_atomi=
c_state *state);
> -	void (*post_crtc_enable)(struct drm_encoder *encoder, struct drm_atom=
ic_state *state);
> -
> -	void (*post_crtc_disable)(struct drm_encoder *encoder, struct drm_ato=
mic_state *state);
> -	void (*post_crtc_powerdown)(struct drm_encoder *encoder, struct drm_a=
tomic_state *state);
>   };
>  =20
>   static inline struct vc4_encoder *
> @@ -456,6 +449,24 @@ to_vc4_encoder(struct drm_encoder *encoder)
>   	return container_of(encoder, struct vc4_encoder, base);
>   }
>  =20
> +struct vc4_bridge {
> +	struct drm_bridge base;
> +	struct drm_crtc *crtc;
> +
> +	void (*pre_crtc_configure)(struct drm_bridge *bridge, struct drm_atom=
ic_state *state);
> +	void (*pre_crtc_enable)(struct drm_bridge *bridge, struct drm_atomic_=
state *state);
> +	void (*post_crtc_enable)(struct drm_bridge *bridge, struct drm_atomic=
_state *state);
> +
> +	void (*post_crtc_disable)(struct drm_bridge *bridge, struct drm_atomi=
c_state *state);
> +	void (*post_crtc_powerdown)(struct drm_bridge *bridge, struct drm_ato=
mic_state *state);
> +};
> +
> +static inline struct vc4_bridge *
> +to_vc4_bridge(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct vc4_bridge, base);
> +}
> +
>   struct vc4_crtc_data {
>   	/* Bitmask of channels (FIFOs) of the HVS that the output can source=20
from */
>   	unsigned int hvs_available_channels;
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 8f0af246f18f..4ce0aea6ba17 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -454,10 +454,10 @@ static void vc4_hdmi_set_infoframes(struct drm_en=
coder *encoder)
>   		vc4_hdmi_set_audio_infoframe(encoder);
>   }
>  =20
> -static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *enc=
oder,
> -					       struct drm_atomic_state *state)
> +static void vc4_hdmi_bridge_post_crtc_disable(struct drm_bridge *bridg=
e,
> +					      struct drm_atomic_state *state)
>   {
> -	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> +	struct vc4_hdmi *vc4_hdmi =3D bridge_to_vc4_hdmi(bridge);
>  =20
>   	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
>  =20
> @@ -468,10 +468,10 @@ static void vc4_hdmi_encoder_post_crtc_disable(st=
ruct drm_encoder *encoder,
>   		   HDMI_READ(HDMI_VID_CTL) | VC4_HD_VID_CTL_BLANKPIX);
>   }
>  =20
> -static void vc4_hdmi_encoder_post_crtc_powerdown(struct drm_encoder *e=
ncoder,
> -						 struct drm_atomic_state *state)
> +static void vc4_hdmi_bridge_post_crtc_powerdown(struct drm_bridge *bri=
dge,
> +						struct drm_atomic_state *state)
>   {
> -	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> +	struct vc4_hdmi *vc4_hdmi =3D bridge_to_vc4_hdmi(bridge);
>   	int ret;
>  =20
>   	if (vc4_hdmi->variant->phy_disable)
> @@ -489,10 +489,6 @@ static void vc4_hdmi_encoder_post_crtc_powerdown(s=
truct drm_encoder *encoder,
>   		DRM_ERROR("Failed to release power domain: %d\n", ret);
>   }
>  =20
> -static void vc4_hdmi_encoder_disable(struct drm_encoder *encoder)
> -{
> -}
> -
>   static void vc4_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
>   			       const struct drm_display_mode *mode)
>   {
> @@ -740,9 +736,10 @@ vc4_hdmi_encoder_get_connector_state(struct drm_en=
coder *encoder,
>   	return NULL;
>   }
>  =20
> -static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *en=
coder,
> -						struct drm_atomic_state *state)
> +static void vc4_hdmi_bridge_pre_crtc_configure(struct drm_bridge *brid=
ge,
> +					       struct drm_atomic_state *state)
>   {
> +	struct drm_encoder *encoder =3D bridge->encoder;
>   	struct drm_connector_state *conn_state =3D
>   		vc4_hdmi_encoder_get_connector_state(encoder, state);
>   	struct vc4_hdmi_connector_state *vc4_conn_state =3D
> @@ -836,9 +833,10 @@ static void vc4_hdmi_encoder_pre_crtc_configure(st=
ruct drm_encoder *encoder,
>   		vc4_hdmi->variant->set_timings(vc4_hdmi, conn_state, mode);
>   }
>  =20
> -static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encod=
er,
> -					     struct drm_atomic_state *state)
> +static void vc4_hdmi_bridge_pre_crtc_enable(struct drm_bridge *bridge,=

> +					    struct drm_atomic_state *state)
>   {
> +	struct drm_encoder *encoder =3D bridge->encoder;
>   	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mo=
de;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>  =20
> @@ -848,9 +846,10 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struc=
t drm_encoder *encoder,
>   	HDMI_WRITE(HDMI_FIFO_CTL, VC4_HDMI_FIFO_CTL_MASTER_SLAVE_N);
>   }
>  =20
> -static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *enco=
der,
> -					      struct drm_atomic_state *state)
> +static void vc4_hdmi_bridge_post_crtc_enable(struct drm_bridge *bridge=
,
> +					     struct drm_atomic_state *state)
>   {
> +	struct drm_encoder *encoder =3D bridge->encoder;
>   	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mo=
de;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>   	struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(encoder=
);
> @@ -907,20 +906,17 @@ static void vc4_hdmi_encoder_post_crtc_enable(str=
uct drm_encoder *encoder,
>   	vc4_hdmi_recenter_fifo(vc4_hdmi);
>   }
>  =20
> -static void vc4_hdmi_encoder_enable(struct drm_encoder *encoder)
> -{
> -}
> -
>   #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
>   #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
>  =20
> -static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
> -					 struct drm_crtc_state *crtc_state,
> -					 struct drm_connector_state *conn_state)
> +static int vc4_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
>   {
>   	struct vc4_hdmi_connector_state *vc4_state =3D conn_state_to_vc4_hdm=
i_conn_state(conn_state);
>   	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> -	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> +	struct vc4_hdmi *vc4_hdmi =3D bridge_to_vc4_hdmi(bridge);
>   	unsigned long long pixel_rate =3D mode->clock * 1000;
>   	unsigned long long tmds_rate;
>  =20
> @@ -963,10 +959,11 @@ static int vc4_hdmi_encoder_atomic_check(struct d=
rm_encoder *encoder,
>   }
>  =20
>   static enum drm_mode_status
> -vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
> -			    const struct drm_display_mode *mode)
> +vc4_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
> +			   const struct drm_display_info *info,
> +			   const struct drm_display_mode *mode)
>   {
> -	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> +	struct vc4_hdmi *vc4_hdmi =3D bridge_to_vc4_hdmi(bridge);
>  =20
>   	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
>   	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
> @@ -979,13 +976,49 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *e=
ncoder,
>   	return MODE_OK;
>   }
>  =20
> -static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_f=
uncs =3D {
> -	.atomic_check =3D vc4_hdmi_encoder_atomic_check,
> -	.mode_valid =3D vc4_hdmi_encoder_mode_valid,
> -	.disable =3D vc4_hdmi_encoder_disable,
> -	.enable =3D vc4_hdmi_encoder_enable,
> +static int vc4_hdmi_bridge_attach(struct drm_bridge *bridge,
> +				  enum drm_bridge_attach_flags flags)
> +{
> +	struct vc4_hdmi *vc4_hdmi =3D bridge_to_vc4_hdmi(bridge);
> +
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return 0;
> +
> +	return vc4_hdmi_connector_init(bridge->dev, vc4_hdmi);
> +}
> +
> +static const struct drm_bridge_funcs vc4_hdmi_bridge_funcs =3D {
> +	.attach =3D	vc4_hdmi_bridge_attach,
> +	.atomic_check =3D	vc4_hdmi_bridge_atomic_check,
> +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,=

> +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +	.mode_valid =3D	vc4_hdmi_bridge_mode_valid,
>   };
>  =20
> +static int vc4_hdmi_bridge_init(struct drm_device *drm,
> +				struct vc4_hdmi *vc4_hdmi)
> +{
> +	struct drm_encoder *encoder =3D &vc4_hdmi->encoder.base.base;
> +	struct drm_bridge *bridge =3D &vc4_hdmi->bridge.base;
> +	struct device *dev =3D &vc4_hdmi->pdev->dev;
> +	int ret;
> +
> +	bridge->funcs =3D &vc4_hdmi_bridge_funcs;
> +	bridge->of_node =3D dev->of_node;
> +	bridge->type =3D DRM_MODE_CONNECTOR_HDMIA;
> +
> +	drm_bridge_add(bridge);
> +
> +	ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> +	if (ret) {
> +		drm_bridge_remove(bridge);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static u32 vc4_hdmi_channel_map(struct vc4_hdmi *vc4_hdmi, u32 channe=
l_mask)
>   {
>   	int i;
> @@ -1945,14 +1978,15 @@ static int vc4_hdmi_bind(struct device *dev, st=
ruct device *master, void *data)
>   	dev_set_drvdata(dev, vc4_hdmi);
>   	encoder =3D &vc4_hdmi->encoder.base.base;
>   	vc4_hdmi->encoder.base.type =3D variant->encoder_type;
> -	vc4_hdmi->encoder.base.pre_crtc_configure =3D vc4_hdmi_encoder_pre_cr=
tc_configure;
> -	vc4_hdmi->encoder.base.pre_crtc_enable =3D vc4_hdmi_encoder_pre_crtc_=
enable;
> -	vc4_hdmi->encoder.base.post_crtc_enable =3D vc4_hdmi_encoder_post_crt=
c_enable;
> -	vc4_hdmi->encoder.base.post_crtc_disable =3D vc4_hdmi_encoder_post_cr=
tc_disable;
> -	vc4_hdmi->encoder.base.post_crtc_powerdown =3D vc4_hdmi_encoder_post_=
crtc_powerdown;
>   	vc4_hdmi->pdev =3D pdev;
>   	vc4_hdmi->variant =3D variant;
>  =20
> +	vc4_hdmi->bridge.pre_crtc_configure =3D vc4_hdmi_bridge_pre_crtc_conf=
igure;
> +	vc4_hdmi->bridge.pre_crtc_enable =3D vc4_hdmi_bridge_pre_crtc_enable;=

> +	vc4_hdmi->bridge.post_crtc_enable =3D vc4_hdmi_bridge_post_crtc_enabl=
e;
> +	vc4_hdmi->bridge.post_crtc_disable =3D vc4_hdmi_bridge_post_crtc_disa=
ble;
> +	vc4_hdmi->bridge.post_crtc_powerdown =3D vc4_hdmi_bridge_post_crtc_po=
werdown;
> +
>   	ret =3D variant->init_resources(vc4_hdmi);
>   	if (ret)
>   		return ret;
> @@ -1996,9 +2030,8 @@ static int vc4_hdmi_bind(struct device *dev, stru=
ct device *master, void *data)
>   	pm_runtime_enable(dev);
>  =20
>   	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
> -	drm_encoder_helper_add(encoder, &vc4_hdmi_encoder_helper_funcs);
>  =20
> -	ret =3D vc4_hdmi_connector_init(drm, vc4_hdmi);
> +	ret =3D vc4_hdmi_bridge_init(drm, vc4_hdmi);
>   	if (ret)
>   		goto err_destroy_encoder;
>  =20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_h=
dmi.h
> index 8e42f9e7b3e2..d03c849d6ea0 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -1,6 +1,7 @@
>   #ifndef _VC4_HDMI_H_
>   #define _VC4_HDMI_H_
>  =20
> +#include <drm/drm_bridge.h>
>   #include <drm/drm_connector.h>
>   #include <media/cec.h>
>   #include <sound/dmaengine_pcm.h>
> @@ -125,6 +126,7 @@ struct vc4_hdmi {
>  =20
>   	struct vc4_hdmi_encoder encoder;
>   	struct drm_connector connector;
> +	struct vc4_bridge bridge;
>  =20
>   	struct i2c_adapter *ddc;
>   	void __iomem *hdmicore_regs;
> @@ -171,6 +173,12 @@ struct vc4_hdmi {
>   	struct debugfs_regset32 hd_regset;
>   };
>  =20
> +static inline struct vc4_hdmi *
> +bridge_to_vc4_hdmi(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct vc4_hdmi, bridge.base);
> +}
> +
>   static inline struct vc4_hdmi *
>   connector_to_vc4_hdmi(struct drm_connector *connector)
>   {
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6zgy4HSuv0bru1xpWB00UI3CIeyxjSQ4v--

--cUIoQ1DBkZZOTmDQI7mCFk0tTQP8pfnd8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB0H0EFAwAAAAAACgkQlh/E3EQov+DG
uBAAgCar73z8JI1+JVfhZzVb/ccPvkMVBr0emYaL/tFAMm4E8/N/K+3K6Xr5QubMxXZj0P169btL
jLLiofXnovfSTiv4/Hs6sdRJ4MDo2Nxn2hWE1+iM+0hJZAVJBHgTBWcczExN2MpV1FOoPo/L7aAg
PHWKoBWp5m2WA6Ymx1JFOn1rIt3KRNerzhDn6w2kojwbPQVadJO+LgWE66zfzKeXNSLCudjWDLkS
WjomKKPPITjQ2HJjqb7W49EmkpZfTG826nlLTZwHijpyt4iqaquM+nZhKn7bFYxotllAIvIaQfH5
y3ekwoFjEzcF5zmDjPUTGNF8mTCYxPPtvCKbXtUWr+nhRrCoRMc1WTACunElk5LuQ96AqwEtWsf+
8UAekzUJkdSo9/oJCvkBe/quNWwpTcZ+DaxUrnyXVpjBg/IE7m4lUiOhEk1NZYwrCQ3lzL62MgdF
NPg1pZs0HCuwEmCTnrUQovLpmu2o7OavGj9M5LF+fRtR/WDJMSRILQRTcOZeulMRQKKCVfWJPc0n
PSnInIvuj/Uhj6ptJ+0ZKLDU3EzGALlkN6fhR9RU3cEd/vnWCqwXHxI2SD8lnkAMVJpXjON16gKp
RIfuA4sBQ+D2WddAW/gWXpWqQ+3MZJypleyNOP0wsETgNNq3OmCbly7uOH4B6dFF9r+oiorr2axX
aNA=
=UP3W
-----END PGP SIGNATURE-----

--cUIoQ1DBkZZOTmDQI7mCFk0tTQP8pfnd8--

--===============0057251833==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0057251833==--
