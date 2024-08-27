Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DA960DD7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 16:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C8610E33D;
	Tue, 27 Aug 2024 14:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XmKS6XrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F52310E33D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 14:42:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6963FA41B47;
 Tue, 27 Aug 2024 14:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29D1C4DDF4;
 Tue, 27 Aug 2024 14:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724769203;
 bh=N7LkYANKbFgws/uh3+iH9lxlTG58CffdFxCr/9/NrsU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XmKS6XrOvipDliU4bx/WlyXNy7Ju4FTmhJTAwil+bO/W5k4/TRlo9e3IBYpuRPxFA
 /ziAqmwcEUYH3x/4WZNaJw8EDLdT39XF5ApD5nI4nS4v+Cs823qooWuds3l7NLpf/d
 nb5q8FnQv0hE+NM5okMisDyaWR/ibP2JWurJk3J0Z2/McYNdRRd+a0J7ft6Ua7+1O6
 42wLbmMb22VDF+Av6EU7jMnjPiro52mlonwV1eJslHAkP7I1T1KzkBsjBxOK3Ufnh7
 iMzK2pzqZB9FdLqwj1nNrxa/9f8H32ADkRu3t8gybZJ+ydEWoJ5yLG/9x4pYJoOUt7
 +ALDoV7rRIG7A==
Date: Tue, 27 Aug 2024 16:33:20 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH RFC 11/15] drm: writeback: Add drm_writeback_connector
 cleanup
Message-ID: <20240827-solid-adorable-coucal-c3e0d1@houat>
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
 <20240814-google-remove-crtc-index-from-parameter-v1-11-6e179abf9fd4@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="eyjyqs6v362l2ini"
Content-Disposition: inline
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-11-6e179abf9fd4@bootlin.com>
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


--eyjyqs6v362l2ini
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 14, 2024 at 04:36:33PM GMT, Louis Chauvet wrote:
> Currently drm_writeback_connector are created by
> drm_writeback_connector_init or drm_writeback_connector_init_with_encoder.
> Both of the function uses drm_connector_init and drm_encoder_init, but
> there is no way to properly clean those structure from outside.
>=20
> This patch introduce the new function drm_writeback_connector_cleanup to
> allow a proper cleanup.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_writeback.c | 10 ++++++++++
>  include/drm/drm_writeback.h     | 11 +++++++++++
>  2 files changed, 21 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeb=
ack.c
> index a031c335bdb9..505a4eb40f93 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -184,6 +184,7 @@ int drm_writeback_connector_init(struct drm_device *d=
ev,
>  	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> =20
>  	wb_connector->encoder.possible_crtcs =3D possible_crtcs;
> +	wb_connector->managed_encoder =3D true;
> =20
>  	ret =3D drm_encoder_init(dev, &wb_connector->encoder,
>  			       &drm_writeback_encoder_funcs,
> @@ -290,6 +291,15 @@ int drm_writeback_connector_init_with_encoder(struct=
 drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
> =20
> +void drm_writeback_connector_cleanup(struct drm_writeback_connector *wb_=
connector)
> +{
> +	drm_connector_cleanup(&wb_connector->base);
> +	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
> +	if (wb_connector->managed_encoder)
> +		drm_encoder_cleanup(&wb_connector->encoder);
> +}
> +EXPORT_SYMBOL(drm_writeback_connector_cleanup);
> +
>  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
>  			 struct drm_framebuffer *fb)
>  {
> diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> index 17e576c80169..e651c0c0c84c 100644
> --- a/include/drm/drm_writeback.h
> +++ b/include/drm/drm_writeback.h
> @@ -35,6 +35,15 @@ struct drm_writeback_connector {
>  	 */
>  	struct drm_encoder encoder;
> =20
> +	/**
> +	 * @managed_encoder: Sets to true if @encoder was created by drm_writeb=
ack_connector_init()
> +	 *
> +	 * If the user used drm_writeback_connector_init_with_encoder() to crea=
te the connector,
> +	 * @encoder is not valid and not managed by drm_writeback_connector. Th=
is fields allows
> +	 * the drm_writeback_cleanup() function to properly destroy the encoder=
 if needed.
> +	 */
> +	bool managed_encoder;
> +

I think we should rather create drmm_writeback_connector variants,
and make both deprecated in favor of these new functions.

Maxime

--eyjyqs6v362l2ini
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZs3jqAAKCRAnX84Zoj2+
dqC/AX41x2/yRw5bNXUT1ld4NWuUvhzpWR9ibP9t6EQOQRPCRs2ZEdpfypeN+onm
B4GyXXEBf3hD2r8NNZs0TDJllfPpe3k7TCzWGX7GiUpnz3sBiYeqETc3RVk8EYuS
PldTUHYJKQ==
=LJyL
-----END PGP SIGNATURE-----

--eyjyqs6v362l2ini--
