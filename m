Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 309BF962BEB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A1B10E584;
	Wed, 28 Aug 2024 15:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QSTJRyvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C46A10E584
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:17:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B6A4AA415FB;
 Wed, 28 Aug 2024 15:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079F9C4CEC1;
 Wed, 28 Aug 2024 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724858261;
 bh=PhDyIHPV/cZk24B9lwfejbwYUpogwq1X4WcVRO+l+q8=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=QSTJRyvEtpakRmc9qAhu1HOAecZ9HK2sYYbeNw6+0p1l3EafAT3dshE0V9V7r1PFS
 Eik9DByiYLmFAztODsWOQK+s6xjfwiERbUWX6q/iH2qdreJAhQtV4L6Hj+IW3wCTUg
 p+kMcvXUrmBuo+WxEs4slfLDWIqTZIN8YcAKiVcWpOJ2E/034h2IpS9mY/iO6DyNzv
 NvC67dIw71RnXQTeVHLILayw+S94gK6MiQwSXCHf+oVhauW2ufoAvWEyfrkta8NyWL
 qA3g3XuVfFz14EkxvtIf1a/rZJ8nsCXn9YOnwQS4eEno9YmNtpRYpG2dgVEkJKVYg4
 6ONBryW/P4srg==
Date: Wed, 28 Aug 2024 17:17:38 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH RFC 11/15] drm: writeback: Add drm_writeback_connector
 cleanup
Message-ID: <20240828-bear-of-stereotyped-tempest-ff34f2@houat>
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
 <20240814-google-remove-crtc-index-from-parameter-v1-11-6e179abf9fd4@bootlin.com>
 <20240827-solid-adorable-coucal-c3e0d1@houat>
 <Zs3z7tx4dMBfY_DX@louis-chauvet-laptop> <87a5gxyrhc.fsf@intel.com>
 <Zs7o2REyQuVrlmbo@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="uti7wnu4vxqvy4yj"
Content-Disposition: inline
In-Reply-To: <Zs7o2REyQuVrlmbo@louis-chauvet-laptop>
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


--uti7wnu4vxqvy4yj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 11:07:37AM GMT, Louis Chauvet wrote:
> Le 28/08/24 - 11:35, Jani Nikula a =E9crit :
> > On Tue, 27 Aug 2024, Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> > > Le 27/08/24 - 16:33, Maxime Ripard a =E9crit :
> > >> Hi,
> > >>=20
> > >> On Wed, Aug 14, 2024 at 04:36:33PM GMT, Louis Chauvet wrote:
> > >> > Currently drm_writeback_connector are created by
> > >> > drm_writeback_connector_init or drm_writeback_connector_init_with_=
encoder.
> > >> > Both of the function uses drm_connector_init and drm_encoder_init,=
 but
> > >> > there is no way to properly clean those structure from outside.
> > >> >=20
> > >> > This patch introduce the new function drm_writeback_connector_clea=
nup to
> > >> > allow a proper cleanup.
> > >> >=20
> > >> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > >> > ---
> > >> >  drivers/gpu/drm/drm_writeback.c | 10 ++++++++++
> > >> >  include/drm/drm_writeback.h     | 11 +++++++++++
> > >> >  2 files changed, 21 insertions(+)
> > >> >=20
> > >> > diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm=
_writeback.c
> > >> > index a031c335bdb9..505a4eb40f93 100644
> > >> > --- a/drivers/gpu/drm/drm_writeback.c
> > >> > +++ b/drivers/gpu/drm/drm_writeback.c
> > >> > @@ -184,6 +184,7 @@ int drm_writeback_connector_init(struct drm_de=
vice *dev,
> > >> >  	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
> > >> > =20
> > >> >  	wb_connector->encoder.possible_crtcs =3D possible_crtcs;
> > >> > +	wb_connector->managed_encoder =3D true;
> > >> > =20
> > >> >  	ret =3D drm_encoder_init(dev, &wb_connector->encoder,
> > >> >  			       &drm_writeback_encoder_funcs,
> > >> > @@ -290,6 +291,15 @@ int drm_writeback_connector_init_with_encoder=
(struct drm_device *dev,
> > >> >  }
> > >> >  EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
> > >> > =20
> > >> > +void drm_writeback_connector_cleanup(struct drm_writeback_connect=
or *wb_connector)
> > >> > +{
> > >> > +	drm_connector_cleanup(&wb_connector->base);
> > >> > +	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
> > >> > +	if (wb_connector->managed_encoder)
> > >> > +		drm_encoder_cleanup(&wb_connector->encoder);
> > >> > +}
> > >> > +EXPORT_SYMBOL(drm_writeback_connector_cleanup);
> > >> > +
> > >> >  int drm_writeback_set_fb(struct drm_connector_state *conn_state,
> > >> >  			 struct drm_framebuffer *fb)
> > >> >  {
> > >> > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeba=
ck.h
> > >> > index 17e576c80169..e651c0c0c84c 100644
> > >> > --- a/include/drm/drm_writeback.h
> > >> > +++ b/include/drm/drm_writeback.h
> > >> > @@ -35,6 +35,15 @@ struct drm_writeback_connector {
> > >> >  	 */
> > >> >  	struct drm_encoder encoder;
> > >> > =20
> > >> > +	/**
> > >> > +	 * @managed_encoder: Sets to true if @encoder was created by drm=
_writeback_connector_init()
> > >> > +	 *
> > >> > +	 * If the user used drm_writeback_connector_init_with_encoder() =
to create the connector,
> > >> > +	 * @encoder is not valid and not managed by drm_writeback_connec=
tor. This fields allows
> > >> > +	 * the drm_writeback_cleanup() function to properly destroy the =
encoder if needed.
> > >> > +	 */
> > >> > +	bool managed_encoder;
> > >> > +
> > >>=20
> > >> I think we should rather create drmm_writeback_connector variants,
> > >> and make both deprecated in favor of these new functions.
> > >
> > > Hi,
> > >
> > > I can try to do it. If I understand correctly, you want to create two=
=20
> > > functions like this?=20
> > >
> > > 	int drmm_writeback_connector_init([...]) {
> > > 		/* drmm and alloc as we want to let drm core to manage this=20
> > > 		   encoder, no need to store it in drm_writeback_connector=20
> > > 		   */
> > > 		enc =3D drmm_plain_encoder_alloc(...);
> > >
> > > 		return drmm_writeback_connector_init_with_encoder([...], enc);
> > > 	}
> > >
> > > 	int drmm_writeback_connector_init_with_encoder([...], enc) {
> > > 		con =3D drmm_connector_init([...]);
> > >
> > > 		drm_connector_attach_encoder(enc, con);
> > >
> > > 		/* Needed for pixel_formats_blob_ptr, base is already=20
> > > 		   managed by drmm_connector_init. Maybe cleaning=20
> > > 		   job_queue is also needed? */
> > > 		drmm_add_action_or_reset([...], &drm_writeback_connector_cleanup)
> > > 	}
> >=20
> > Why add two variants, when you can have one and pass NULL for encoder?
> > We have the _init_with_encoder variant only because nobody bothered to
> > clean up existing call sites.
>=20
> I just followed the existing code, but yes, I can make only one function=
=20
> and create the encoder if the pointer is NULL.
> =20
> > Side note, I'd still like to be able to pass driver's own allocated
> > connector instead of having writeback midlayer force it on you.
>=20
> I just checked, it seems non-trivial to make this change and I don't feel=
=20
> confident to change this much the drm core.

It's a great opportunity to add unit tests then :)

Maxime

--uti7wnu4vxqvy4yj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZs8/jgAKCRAnX84Zoj2+
dl0HAX9CuW0T1531El85Ma9en6oRtOzQmONpITxAiN9akPLyBuyQjrqXD4Za9CyG
DBvTf84BgM3acCkmeX2h49t5gt0eSNnZwOxf87+C/c09Pza4lOYHbRlrgXUZWlU/
vVdon6fxtg==
=wDYa
-----END PGP SIGNATURE-----

--uti7wnu4vxqvy4yj--
