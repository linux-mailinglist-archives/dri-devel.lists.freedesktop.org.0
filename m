Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 995E23BEB04
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 17:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D48D6E09E;
	Wed,  7 Jul 2021 15:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADD46E09E
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 15:35:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 947BC200BE;
 Wed,  7 Jul 2021 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625672154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y87PY16IyqWtZmqLVSMUudbqWzfvTdpHLJwtcd0GTJg=;
 b=g4ZwwDCyDkZIjb+iZN7HP+LNYRlSomiBcZFOW0p04I/HNGI5K4CtkRa/mPMT5uFwswL5Kc
 5LzHsmiEcyXU6/cuEdOsoZAF8RJC1DvgnLWU21UlUkUeW4vdSqtWz1C8Q1Opqcj872+9AV
 f45x6qv50IbXJBpP728LEZqHZANDxJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625672154;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y87PY16IyqWtZmqLVSMUudbqWzfvTdpHLJwtcd0GTJg=;
 b=L1hhUA/x387F5aGSl25lgDm091NeuKZlzPXFbCF4euexFTpSACXdZfBeafxrqY//dw8jNo
 AlDi2l9udQZnhiDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FC1F13ACE;
 Wed,  7 Jul 2021 15:35:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DpZiEtrJ5WDIQgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Jul 2021 15:35:54 +0000
Subject: Re: [PATCH] drm/vc4: hdmi: Remove drm_encoder->crtc usage
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20210707141930.1811128-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ef4c5e92-f564-402d-4224-6fc24c720cab@suse.de>
Date: Wed, 7 Jul 2021 17:35:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707141930.1811128-1-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BeDxiT4WEoNDVwU5O2AfjRigIyZuf9kpF"
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BeDxiT4WEoNDVwU5O2AfjRigIyZuf9kpF
Content-Type: multipart/mixed; boundary="W4szGASJWGah40nG5HxWLvXWpnKd6qCkW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Message-ID: <ef4c5e92-f564-402d-4224-6fc24c720cab@suse.de>
Subject: Re: [PATCH] drm/vc4: hdmi: Remove drm_encoder->crtc usage
References: <20210707141930.1811128-1-maxime@cerno.tech>
In-Reply-To: <20210707141930.1811128-1-maxime@cerno.tech>

--W4szGASJWGah40nG5HxWLvXWpnKd6qCkW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.07.21 um 16:19 schrieb Maxime Ripard:
> The drm_encoder crtc pointer isn't really fit for an atomic driver,
> let's rely on the connector state instead.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 39 ++++++++++++++++++++++-----------=
-
>   1 file changed, 26 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index aab1b36ceb3c..dbd762f41cad 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -435,7 +435,7 @@ static void vc4_hdmi_set_avi_infoframe(struct drm_e=
ncoder *encoder)
>   	struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(encoder=
);
>   	struct drm_connector *connector =3D &vc4_hdmi->connector;
>   	struct drm_connector_state *cstate =3D connector->state;
> -	struct drm_crtc *crtc =3D encoder->crtc;
> +	struct drm_crtc *crtc =3D cstate->crtc;
>   	const struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;=

>   	union hdmi_infoframe frame;
>   	int ret;
> @@ -545,8 +545,11 @@ static bool vc4_hdmi_supports_scrambling(struct dr=
m_encoder *encoder,
>  =20
>   static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
>   {
> -	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mod=
e;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> +	struct drm_connector *connector =3D &vc4_hdmi->connector;
> +	struct drm_connector_state *cstate =3D connector->state;
> +	struct drm_crtc *crtc =3D cstate->crtc;
> +	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
>  =20
>   	if (!vc4_hdmi_supports_scrambling(encoder, mode))
>   		return;
> @@ -567,17 +570,18 @@ static void vc4_hdmi_enable_scrambling(struct drm=
_encoder *encoder)
>   static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
>   {
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
> -	struct drm_crtc *crtc =3D encoder->crtc;
> +	struct drm_connector *connector =3D &vc4_hdmi->connector;
> +	struct drm_connector_state *cstate =3D connector->state;
>  =20
>   	/*
> -	 * At boot, encoder->crtc will be NULL. Since we don't know the
> +	 * At boot, connector->state will be NULL. Since we don't know the
>   	 * state of the scrambler and in order to avoid any
>   	 * inconsistency, let's disable it all the time.
>   	 */
> -	if (crtc && !vc4_hdmi_supports_scrambling(encoder, &crtc->mode))
> +	if (cstate && !vc4_hdmi_supports_scrambling(encoder, &cstate->crtc->m=
ode))
>   		return;
>  =20
> -	if (crtc && !vc4_hdmi_mode_needs_scrambling(&crtc->mode))
> +	if (cstate && !vc4_hdmi_mode_needs_scrambling(&cstate->crtc->mode))
>   		return;
>  =20
>   	if (delayed_work_pending(&vc4_hdmi->scrambling_work))
> @@ -898,7 +902,9 @@ static void vc4_hdmi_encoder_pre_crtc_configure(str=
uct drm_encoder *encoder,
>   		vc4_hdmi_encoder_get_connector_state(encoder, state);
>   	struct vc4_hdmi_connector_state *vc4_conn_state =3D
>   		conn_state_to_vc4_hdmi_conn_state(conn_state);
> -	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mod=
e;
> +	struct drm_crtc_state *crtc_state =3D
> +		drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>   	unsigned long bvb_rate, pixel_rate, hsm_rate;
>   	int ret;
> @@ -983,7 +989,11 @@ static void vc4_hdmi_encoder_pre_crtc_configure(st=
ruct drm_encoder *encoder,
>   static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *enco=
der,
>   					     struct drm_atomic_state *state)
>   {
> -	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mod=
e;
> +	struct drm_connector_state *conn_state =3D
> +		vc4_hdmi_encoder_get_connector_state(encoder, state);
> +	struct drm_crtc_state *crtc_state =3D
> +		drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>   	struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(encoder=
);
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>  =20
> @@ -1006,7 +1016,11 @@ static void vc4_hdmi_encoder_pre_crtc_enable(str=
uct drm_encoder *encoder,
>   static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *enc=
oder,
>   					      struct drm_atomic_state *state)
>   {
> -	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mod=
e;
> +	struct drm_connector_state *conn_state =3D
> +		vc4_hdmi_encoder_get_connector_state(encoder, state);
> +	struct drm_crtc_state *crtc_state =3D
> +		drm_atomic_get_new_crtc_state(state, conn_state->crtc);
> +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>   	struct vc4_hdmi_encoder *vc4_encoder =3D to_vc4_hdmi_encoder(encoder=
);
>   	bool hsync_pos =3D mode->flags & DRM_MODE_FLAG_PHSYNC;
> @@ -1192,8 +1206,8 @@ static void vc4_hdmi_audio_set_mai_clock(struct v=
c4_hdmi *vc4_hdmi)
>  =20
>   static void vc4_hdmi_set_n_cts(struct vc4_hdmi *vc4_hdmi)
>   {
> -	struct drm_encoder *encoder =3D &vc4_hdmi->encoder.base.base;
> -	struct drm_crtc *crtc =3D encoder->crtc;
> +	struct drm_connector *connector =3D &vc4_hdmi->connector;
> +	struct drm_crtc *crtc =3D connector->state->crtc;
>   	const struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;=

>   	u32 samplerate =3D vc4_hdmi->audio.samplerate;
>   	u32 n, cts;
> @@ -1228,7 +1242,6 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_=
substream *substream,
>   				  struct snd_soc_dai *dai)
>   {
>   	struct vc4_hdmi *vc4_hdmi =3D dai_to_hdmi(dai);
> -	struct drm_encoder *encoder =3D &vc4_hdmi->encoder.base.base;
>   	struct drm_connector *connector =3D &vc4_hdmi->connector;
>   	int ret;
>  =20
> @@ -1241,7 +1254,7 @@ static int vc4_hdmi_audio_startup(struct snd_pcm_=
substream *substream,
>   	 * If the HDMI encoder hasn't probed, or the encoder is
>   	 * currently in DVI mode, treat the codec dai as missing.
>   	 */
> -	if (!encoder->crtc || !(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
> +	if (!connector->state || !(HDMI_READ(HDMI_RAM_PACKET_CONFIG) &
>   				VC4_HDMI_RAM_PACKET_ENABLE))
>   		return -ENODEV;
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--W4szGASJWGah40nG5HxWLvXWpnKd6qCkW--

--BeDxiT4WEoNDVwU5O2AfjRigIyZuf9kpF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDlydkFAwAAAAAACgkQlh/E3EQov+CA
xA//b3kUPWU4+eyQbiw77+0wY2ojRRVWBz6LjEpXQDgPdvchzVHHZ1PsKMPGf/zPY/8RG6qZjl4z
169ohEMLnkQgoKH5XgCE30igTeHY4cWZDMieWfzp3YPBKYkQLdXN+hD22CmLExuP9tvSc/+JBp3p
TM+se4gST5AV+vJLNCLYMRgD8vXvN6TSGkcTxi0cjHyNUkXIwTMmYoxe2MbETK0nBp+XeBzDtTRR
RzwJ7r7wq6NzZt24ZfxOjQf3TnzSsrvKF32ORXYFkXiHQ9Q7W4pdNNhH2AmRkYVmt4kiLBEwIDMz
Iw+QbgigVr9v8fSDJ0jd4OGmgPpW1m/EoLpH1dVlqL1FLKVUwqsLJeDEpaVBsvosMgR4nmSfPczH
lX9mA9MEO5TEb8G2Uib7bIkdHyLGjWeO3fAYNJTLU0nOgXtZI9GmdGuKNczcpvg/FhZoS63EnOZ+
8PT1Xx0yYPhz+F1Ko3UCtL70u/Jf6Qbe0Bi20yJgDRR7MQww+pxgJCpIFCffBuApbTN+4E6TDs+i
LXysI6IrfmOxjgTziGUofl9Jvm6lvL78b6zuyXpXmVwWiLuSSxzWSfpxt9cUibvUt6ZsGuo7KryR
JNnfxbOFtUQYT3PzfERL81vo7UogbwR73LqgVmC2lu3f3VoxszYyGnJmw/ZT29N0Do7UaZDzKUi6
ExY=
=qfnr
-----END PGP SIGNATURE-----

--BeDxiT4WEoNDVwU5O2AfjRigIyZuf9kpF--
