Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F91335F57D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 15:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282AB6E87B;
	Wed, 14 Apr 2021 13:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4896E87B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 13:58:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BFA64AF26;
 Wed, 14 Apr 2021 13:58:24 +0000 (UTC)
Subject: Re: [PATCH 15/18] drm/vc4: hdmi: Rework the infoframe prototype
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-16-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1666ffcd-6dda-68ec-1963-d96d1795b409@suse.de>
Date: Wed, 14 Apr 2021 15:58:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-16-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============1989040324=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1989040324==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SjvVqByjpdZtEDowxSjtjodiNBGUNaS7O"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SjvVqByjpdZtEDowxSjtjodiNBGUNaS7O
Content-Type: multipart/mixed; boundary="ZbBKEVuicJ94yQ7QzB4RWtz8hLytJ0L1d";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org
Message-ID: <1666ffcd-6dda-68ec-1963-d96d1795b409@suse.de>
Subject: Re: [PATCH 15/18] drm/vc4: hdmi: Rework the infoframe prototype
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-16-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-16-maxime@cerno.tech>

--ZbBKEVuicJ94yQ7QzB4RWtz8hLytJ0L1d
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> In order to support a YUV output, we're going to need to have access to=

> the bridge state in the vc4_hdmi_set_avi_infoframe function. Since we
> also need the connector state in that function, let's pass the full
> atomic state.
>=20
> While we're at it, since all those functions actually need the vc4_hdmi=

> structure, let's pass it instead of the drm_encoder.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 38 ++++++++++++++++-----------------=
-
>   1 file changed, 18 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 56b5654c820f..83e44cf44d65 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -330,10 +330,10 @@ static int vc4_hdmi_stop_packet(struct drm_encode=
r *encoder,
>   			  BIT(packet_id)), 100);
>   }
>  =20
> -static void vc4_hdmi_write_infoframe(struct drm_encoder *encoder,
> +static void vc4_hdmi_write_infoframe(struct vc4_hdmi *vc4_hdmi,
>   				     union hdmi_infoframe *frame)
>   {
> -	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> +	struct drm_encoder *encoder =3D &vc4_hdmi->encoder.base.base;
>   	u32 packet_id =3D frame->any.type - 0x80;
>   	const struct vc4_hdmi_register *ram_packet_start =3D
>   		&vc4_hdmi->variant->registers[HDMI_RAM_PACKET_START];
> @@ -381,11 +381,13 @@ static void vc4_hdmi_write_infoframe(struct drm_e=
ncoder *encoder,
>   		DRM_ERROR("Failed to wait for infoframe to start: %d\n", ret);
>   }
>  =20
> -static void vc4_hdmi_set_avi_infoframe(struct drm_encoder *encoder)
> +static void vc4_hdmi_set_avi_infoframe(struct vc4_hdmi *vc4_hdmi,
> +				       struct drm_atomic_state *state)
>   {
> -	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> +	struct drm_encoder *encoder =3D &vc4_hdmi->encoder.base.base;
>   	struct drm_connector *connector =3D &vc4_hdmi->connector;
> -	struct drm_connector_state *cstate =3D connector->state;
> +	struct drm_connector_state *cstate =3D
> +		drm_atomic_get_new_connector_state(state, connector);
>   	struct drm_crtc *crtc =3D encoder->crtc;
>   	const struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;=

>   	union hdmi_infoframe frame;
> @@ -406,10 +408,10 @@ static void vc4_hdmi_set_avi_infoframe(struct drm=
_encoder *encoder)
>  =20
>   	drm_hdmi_avi_infoframe_bars(&frame.avi, cstate);
>  =20
> -	vc4_hdmi_write_infoframe(encoder, &frame);
> +	vc4_hdmi_write_infoframe(vc4_hdmi, &frame);
>   }
>  =20
> -static void vc4_hdmi_set_spd_infoframe(struct drm_encoder *encoder)
> +static void vc4_hdmi_set_spd_infoframe(struct vc4_hdmi *vc4_hdmi)
>   {
>   	union hdmi_infoframe frame;
>   	int ret;
> @@ -422,12 +424,11 @@ static void vc4_hdmi_set_spd_infoframe(struct drm=
_encoder *encoder)
>  =20
>   	frame.spd.sdi =3D HDMI_SPD_SDI_PC;
>  =20
> -	vc4_hdmi_write_infoframe(encoder, &frame);
> +	vc4_hdmi_write_infoframe(vc4_hdmi, &frame);
>   }
>  =20
> -static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
> +static void vc4_hdmi_set_audio_infoframe(struct vc4_hdmi *vc4_hdmi)
>   {
> -	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>   	union hdmi_infoframe frame;
>  =20
>   	hdmi_audio_infoframe_init(&frame.audio);
> @@ -437,21 +438,19 @@ static void vc4_hdmi_set_audio_infoframe(struct d=
rm_encoder *encoder)
>   	frame.audio.sample_size =3D HDMI_AUDIO_SAMPLE_SIZE_STREAM;
>   	frame.audio.channels =3D vc4_hdmi->audio.channels;
>  =20
> -	vc4_hdmi_write_infoframe(encoder, &frame);
> +	vc4_hdmi_write_infoframe(vc4_hdmi, &frame);
>   }
>  =20
> -static void vc4_hdmi_set_infoframes(struct drm_encoder *encoder)
> +static void vc4_hdmi_set_infoframes(struct vc4_hdmi *vc4_hdmi, struct =
drm_atomic_state *state)
>   {
> -	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> -
> -	vc4_hdmi_set_avi_infoframe(encoder);
> -	vc4_hdmi_set_spd_infoframe(encoder);
> +	vc4_hdmi_set_avi_infoframe(vc4_hdmi, state);
> +	vc4_hdmi_set_spd_infoframe(vc4_hdmi);
>   	/*
>   	 * If audio was streaming, then we need to reenabled the audio
>   	 * infoframe here during encoder_enable.
>   	 */
>   	if (vc4_hdmi->audio.streaming)
> -		vc4_hdmi_set_audio_infoframe(encoder);
> +		vc4_hdmi_set_audio_infoframe(vc4_hdmi);
>   }
>  =20
>   static void vc4_hdmi_bridge_post_crtc_disable(struct drm_bridge *brid=
ge,
> @@ -921,7 +920,7 @@ static void vc4_hdmi_bridge_post_crtc_enable(struct=20
drm_bridge *bridge,
>   		HDMI_WRITE(HDMI_RAM_PACKET_CONFIG,
>   			   VC4_HDMI_RAM_PACKET_ENABLE);
>  =20
> -		vc4_hdmi_set_infoframes(encoder);
> +		vc4_hdmi_set_infoframes(vc4_hdmi, state);
>   	}
>  =20
>   	vc4_hdmi_recenter_fifo(vc4_hdmi);
> @@ -1184,7 +1183,6 @@ static int vc4_hdmi_audio_hw_params(struct snd_pc=
m_substream *substream,
>   				    struct snd_soc_dai *dai)
>   {
>   	struct vc4_hdmi *vc4_hdmi =3D dai_to_hdmi(dai);
> -	struct drm_encoder *encoder =3D &vc4_hdmi->encoder.base.base;
>   	struct device *dev =3D &vc4_hdmi->pdev->dev;
>   	u32 audio_packet_config, channel_mask;
>   	u32 channel_map;
> @@ -1244,7 +1242,7 @@ static int vc4_hdmi_audio_hw_params(struct snd_pc=
m_substream *substream,
>   	HDMI_WRITE(HDMI_AUDIO_PACKET_CONFIG, audio_packet_config);
>   	vc4_hdmi_set_n_cts(vc4_hdmi);
>  =20
> -	vc4_hdmi_set_audio_infoframe(encoder);
> +	vc4_hdmi_set_audio_infoframe(vc4_hdmi);
>  =20
>   	return 0;
>   }
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ZbBKEVuicJ94yQ7QzB4RWtz8hLytJ0L1d--

--SjvVqByjpdZtEDowxSjtjodiNBGUNaS7O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB29P8FAwAAAAAACgkQlh/E3EQov+A8
8g/+K8i7M+yCgQ5H2WblZso2oeGFBqjziEYVCI+9rcsjV6zEGEESmHHNFU/XCP2WCnEgaOez/5N9
GWD68q9qvk8vyJx2jmnAo9fAPWWN3BSW7XixcFBkjUkZG5Y3leGNF3EmVE0bOv9svwm4XH7f9gnK
r6ERY1t6h5790jLNs8JPs9zTSSZ3V9Zx2NvWmjUvoHtII8u+ETAVV90VgadMhOaqrHy/1dYT6DK2
IKvDaAfUYkm5aToOOTwcmohH6pj/DVPjrQEWJd4/63x5ILXkiPCjw47Ie9a6OEB7W7pSMlr+sr1C
BiqrLO6sQ4enyFJw9v7/xfWFR7Wx/8fC1MphXr1hNclEOUmbPoaHzbeNsgqOONSG/q3W6ShujvWH
W1K0oTv/KVCM6+gH9tvQDm8k9dvK77IZFtld2jQeth9XnRuZq80cCcmFYhOlj+GwajYks65AETfF
0taD5uPbAlJtb18kkxWQH3SNmHvLDRKYLMNBjvwboMNHQS7h7zhAuvq/PARZARP7F02sQRNyd4Hm
/brgHKGJAiCQc1F3Micx8uGkZzRgfQSNUTlu9paWT+2DV0NWrLLvhr9ReeecQlRo8P43uCWygNMz
jrhXE+8HVOvqOG9LFCgl1nXeLqmj1OtTyzXZ6g8ECGIx6thPkF9XB/OFfhpthFuPpaz+CmkEUWfV
D00=
=xdmu
-----END PGP SIGNATURE-----

--SjvVqByjpdZtEDowxSjtjodiNBGUNaS7O--

--===============1989040324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1989040324==--
