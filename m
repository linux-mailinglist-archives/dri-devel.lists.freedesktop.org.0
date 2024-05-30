Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF718D4778
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9110810E05E;
	Thu, 30 May 2024 08:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lBSF5qn6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F5110E05E;
 Thu, 30 May 2024 08:49:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7BFCCCE1A28;
 Thu, 30 May 2024 08:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF8BC3277B;
 Thu, 30 May 2024 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717058968;
 bh=RMlDUxJiGobRFguc3DRtHWTv7WiNMiDof+uoZrSLUA8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lBSF5qn63ZTxet3h/KgfI84iXyPbcZ7m5UVIGT4Zh94nALn7/QyNuPD566qQJSpK5
 +j7sNiyUcFxomJhas0mIMXGD4wU7YBq4nefDAv6hrMcyG6D/I5uulEmMIElQnPrrlw
 CPgQOb52Zg3a/Kq0j9RjknhjnLKzCEyUgyPBeEFSZW64HY2+nYJJpCJ2RM1Ro9dY14
 3+hqt3XtD4GEqQFHT0v+c4IMSKpJeonXM7jWz6mC3UyEyDovCwxvWajQsz4UlqxkIO
 qJR8XxIAf/QhhsBC66Ej7PaXU59n7GQJAfT1ET3FK1KcAb0w4CfmIr6kWZ8eTTR926
 rATiKQfQzbyRA==
Date: Thu, 30 May 2024 10:49:26 +0200
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
Subject: Re: [PATCH v3 1/7] drm/connector: hdmi: accept NULL for Audio
 Infoframe
Message-ID: <20240530-daffy-satisfied-sheep-5b9e16@houat>
References: <20240530-bridge-hdmi-connector-v3-0-a1d184d68fe3@linaro.org>
 <20240530-bridge-hdmi-connector-v3-1-a1d184d68fe3@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="takwrixyv5pp4e4s"
Content-Disposition: inline
In-Reply-To: <20240530-bridge-hdmi-connector-v3-1-a1d184d68fe3@linaro.org>
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


--takwrixyv5pp4e4s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 30, 2024 at 02:12:24AM GMT, Dmitry Baryshkov wrote:
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
>   *
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

I'm not entirely sure your commit matches your commit log? It looks like
you follow the same pattern than the other infoframes and call
write_infoframe if there's one, or clear_infoframe if there isn't.

So we're never passing NULL to disable? clear_infoframe is called.

Maxime

--takwrixyv5pp4e4s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlg9kQAKCRAnX84Zoj2+
dk3pAYCbS/9eXzTy0YlUFvQaOXrLJprI9gx8B2mCC+SSaUyqq6oITErczWwScJwQ
fgXhMFIBgJOU255qv1o/4bocu6tu2hF/D9FGax6f1ae+MKrdPFUmJ0PhyEX/zJY/
D+quLGMFQg==
=gGq3
-----END PGP SIGNATURE-----

--takwrixyv5pp4e4s--
