Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBEF802D58
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 09:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDBB10E06D;
	Mon,  4 Dec 2023 08:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E8B10E065;
 Mon,  4 Dec 2023 08:38:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CB007CE0CF3;
 Mon,  4 Dec 2023 08:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA95FC433C7;
 Mon,  4 Dec 2023 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701679096;
 bh=iYblRoLiAyw+4MVUgM01pY5EMN79I+qpmjqdEB/wdx8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ngZoYZz/1DFnyxJb6KcnY+pGvJfO+4BbQLQSF14d1wP8/MLNA5Sa6uJCNnzhcYrBX
 2hW4G3m77anJZBmX05DADpyuE3Va2JzhDrstvRXMINe0HdwXy1ekJ5QWV1ZQVBsLnw
 qq/EhxczlZUXB/4yzhfKEfno0ssDCUtT0peid80dqOHze1rs4NeHY8I7Fi3asMn6DS
 iCI8KQkT/j8I0f6df8A9hNCpQQKRHidfzOpEVi+FbIYIUS6enBlxTy2nlQydie4NWE
 cx3lmSBfmA6vbZ6PFUouWBRd2QqC/mtW+kp853DKTTjtuLjblcljbhfjxi0v7O7UsQ
 Irf82iV67uJYw==
Date: Mon, 4 Dec 2023 09:38:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RESEND] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
Message-ID: <uqrsl3gehpjybzb6cish7vpub3xznouomn4246b7j4i3qiiumv@enskrm5kpwa5>
References: <20231201220843.2023117-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ddv35uuo4le3hcui"
Content-Disposition: inline
In-Reply-To: <20231201220843.2023117-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ddv35uuo4le3hcui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 02, 2023 at 12:07:49AM +0200, Dmitry Baryshkov wrote:
> The drm_atomic_helper_check_wb_encoder_state() function doesn't use
> encoder for anything other than getting the drm_device instance. The
> function's description talks about checking the writeback connector
> state, not the encoder state. Moreover, there is no such thing as an
> encoder state, encoders generally do not have a state on their own.
>=20
> Drop the first argument and rename the function to
> drm_atomic_helper_check_wb_connector_state().
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>=20
> Resending, no reaction for two months
>=20
> ---
>  drivers/gpu/drm/drm_atomic_helper.c   | 10 ++++------
>  drivers/gpu/drm/vkms/vkms_writeback.c |  2 +-
>  include/drm/drm_atomic_helper.h       |  3 +--
>  3 files changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index 2444fc33dd7c..d69591381f00 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -795,8 +795,7 @@ drm_atomic_helper_check_modeset(struct drm_device *de=
v,
>  EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> =20
>  /**
> - * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder =
state
> - * @encoder: encoder state to check
> + * drm_atomic_helper_check_wb_connector_state() - Check writeback connec=
tor state
>   * @conn_state: connector state to check
>   *
>   * Checks if the writeback connector state is valid, and returns an erro=
r if it
> @@ -806,8 +805,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>   * Zero for success or -errno
>   */
>  int
> -drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> -					 struct drm_connector_state *conn_state)
> +drm_atomic_helper_check_wb_connector_state(struct drm_connector_state *c=
onn_state)

AFAIK, all the helpers take the object as first argument, so I'm fine
with the name change but it should take a drm_connector too. And ideally
a drm_atomic_state pointer instead of drm_connector_state too.

>  {
>  	struct drm_writeback_job *wb_job =3D conn_state->writeback_job;
>  	struct drm_property_blob *pixel_format_blob;
> @@ -827,11 +825,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm=
_encoder *encoder,
>  		if (fb->format->format =3D=3D formats[i])
>  			return 0;
> =20
> -	drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->=
format);
> +	drm_dbg_kms(conn_state->connector->dev, "Invalid pixel format %p4cc\n",=
 &fb->format->format);

Which would also avoid the checkpatch warning there.

Maxime

--ddv35uuo4le3hcui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW2P9AAKCRDj7w1vZxhR
xXZvAQDutZPCVYVik2WXC+7xFZxQpfEJYRgG2lQSsq0Ohku97gD8D67TasF17b0O
5Aa1Dp7gI2qiBLOQ3cTMkiNPGx4k1Qc=
=EEoZ
-----END PGP SIGNATURE-----

--ddv35uuo4le3hcui--
