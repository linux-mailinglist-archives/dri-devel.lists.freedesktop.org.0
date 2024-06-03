Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C55B8D7E24
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 11:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8874010E0EE;
	Mon,  3 Jun 2024 09:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T648A4jU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A6E10E0EE;
 Mon,  3 Jun 2024 09:09:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 46D5560C05;
 Mon,  3 Jun 2024 09:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1C2C2BD10;
 Mon,  3 Jun 2024 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717405783;
 bh=zts/QRsUM8k00Nfd4l4iKWD2XkKbZM/dD/eqgptURNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T648A4jUN6PelkRNGIl7hxRPXuYGfhKc0w4IhBdXrxin6cs+UrZQ3iATqdbNlnwO/
 KxPcKK6ZCShnQ+GaQC9n4ex2n28ltok8NIJ0V6EW3e5v0aeJ5IiClJmujEzx+TQ0+h
 MdNWLKLm+Y90vuEh2SCvq/zRyhx6SMrakl0xnH5uxMsRGDdKPYTn1eXvCNhUCML2GX
 Uw3VAizHiVNE0Di3sUDp6fp+o6LOQH/4uWYxowr8Cwj9t37ro+AAZMe665XGis/Zo/
 3uVRKrB0nlv0jcHFZUcP9ITZznCVPZYLtDhwhYOUqjxAqrDTksyuEDzOUnq4TpKu3T
 Wa/Ig9liJjoyw==
Date: Mon, 3 Jun 2024 11:09:40 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] drm/connector: hdmi: accept NULL for Audio
 Infoframe
Message-ID: <20240603-therapeutic-warm-fox-890bee@houat>
References: <20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org>
 <20240531-bridge-hdmi-connector-v4-1-5110f7943622@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="cjo537cz6gzry5k7"
Content-Disposition: inline
In-Reply-To: <20240531-bridge-hdmi-connector-v4-1-5110f7943622@linaro.org>
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


--cjo537cz6gzry5k7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Sorry for not answering your mail on the previous version sooner.

On Fri, May 31, 2024 at 11:07:24PM GMT, Dmitry Baryshkov wrote:
> Allow passing NULL as audio infoframe as a way to disable Audio
> Infoframe generation.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gp=
u/drm/display/drm_hdmi_state_helper.c
> index ce96837eea65..5356723d21f5 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -681,7 +681,7 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_update=
_infoframes);
>  /**
>   * drm_atomic_helper_connector_hdmi_update_audio_infoframe - Update the =
Audio Infoframe
>   * @connector: A pointer to the HDMI connector
> - * @frame: A pointer to the audio infoframe to write
> + * @frame: A pointer to the audio infoframe to write or NULL to disable =
sending the frame

I'm still two-minded about this. I think I would like a separate helper
better, to also make things consistent with the HDMI helpers.

Most importantly, it looks like you're not using it at all in your series?

>   * This function is meant for HDMI connector drivers to update their
>   * audio infoframe. It will typically be used in one of the ALSA hooks
> @@ -704,10 +704,16 @@ drm_atomic_helper_connector_hdmi_update_audio_infof=
rame(struct drm_connector *co
> =20
>  	mutex_lock(&connector->hdmi.infoframes.lock);
> =20
> -	memcpy(&infoframe->data, frame, sizeof(infoframe->data));
> -	infoframe->set =3D true;
> +	if (frame) {
> +		memcpy(&infoframe->data, frame, sizeof(infoframe->data));
> +		infoframe->set =3D true;
> +
> +		ret =3D write_infoframe(connector, infoframe);
> +	} else {
> +		infoframe->set =3D false;
> =20
> -	ret =3D write_infoframe(connector, infoframe);
> +		ret =3D clear_infoframe(connector, infoframe);
> +	}

We should probably clear infoframe->data here too

Maxime

--cjo537cz6gzry5k7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZl2ITQAKCRAnX84Zoj2+
dqkOAX9UmBzsHTKxHZS1nYELnt3AKt9186dxlneShEm4OxdrXK29/MwOCb+UL69k
SkvYtVkBfiYyBRgWMuoXlPMgdMZe/SKJIwO19JoO1q6utvRCW6k9RMmkiAFCjD1d
J6ZyAccWMA==
=wp6q
-----END PGP SIGNATURE-----

--cjo537cz6gzry5k7--
