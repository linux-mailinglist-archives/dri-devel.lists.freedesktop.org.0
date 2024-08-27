Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7418961463
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 18:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644D210E390;
	Tue, 27 Aug 2024 16:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eLKezjld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3265E10E390
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 16:42:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3567DA42049;
 Tue, 27 Aug 2024 16:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C2BC4AF0C;
 Tue, 27 Aug 2024 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724776941;
 bh=dblZv6eflLdxtbh7B2vk62MHRPPnX4/ZNwWaCOCCmYg=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=eLKezjldKhVF77UTs5hiqUDrnviY8ryutGAbsPA6U2d6Z9UCFBO/iV11wHnUHGU1r
 nSFn70GLmycW+cTSNUOdr06Om3+ubF++UMg01xw1YgLefk5mUEVPHpYRT5ClxmLQ7J
 i82oGE4DitKMtUhAgQX/1zQbggkVQeWIg24HX2I2dsNS0mkD4g+VC6B5un7IdNs5VO
 TD/nJ3hiz31N7rxhVN8wj2uNBpFDPcilwO446K84miXK6/EG+9rFTP4Ifj2rUXT7Jf
 mvzhXZy6tjAP8RFXsu2Rp47Aw7HAhjC/Az1tvpWEiz2QDXaB5h//cVCOOUxr/xs820
 uxfZe2w9YQQ0w==
Date: Tue, 27 Aug 2024 18:42:18 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
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
Subject: Re: [PATCH v2 1/6] drm/vkms: Switch to managed for connector
Message-ID: <20240827-tactful-delectable-stork-06bded@houat>
References: <20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com>
 <20240827-google-vkms-managed-v2-1-f41104553aeb@bootlin.com>
 <20240827-dynamic-acoustic-guillemot-ddde49@houat>
 <Zs3TeoUwn3iO7oBs@louis-chauvet-laptop>
 <20240827-chubby-tidy-collie-c8ecf7@houat>
 <Zs3r2MK5nZs5TFsy@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="llvjkgls46oo654a"
Content-Disposition: inline
In-Reply-To: <Zs3r2MK5nZs5TFsy@louis-chauvet-laptop>
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


--llvjkgls46oo654a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 05:08:08PM GMT, Louis Chauvet wrote:
> Le 27/08/24 - 16:39, Maxime Ripard a =E9crit :
> > On Tue, Aug 27, 2024 at 03:24:10PM GMT, Louis Chauvet wrote:
> > > Le 27/08/24 - 15:15, Maxime Ripard a =E9crit :
> > > > Hi,
> > > >=20
> > > > On Tue, Aug 27, 2024 at 11:57:36AM GMT, Louis Chauvet wrote:
> > > > > The current VKMS driver uses non-managed function to create conne=
ctors. It
> > > > > is not an issue yet, but in order to support multiple devices eas=
ily,
> > > > > convert this code to use drm and device managed helpers.
> > > > >=20
> > > > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > ---
> > > > >  drivers/gpu/drm/vkms/vkms_drv.h    |  1 -
> > > > >  drivers/gpu/drm/vkms/vkms_output.c | 22 ++++++++++++----------
> > > > >  2 files changed, 12 insertions(+), 11 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vk=
ms/vkms_drv.h
> > > > > index 5e46ea5b96dc..9a3c6c34d1f6 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > > > > @@ -99,7 +99,6 @@ struct vkms_crtc_state {
> > > > >  struct vkms_output {
> > > > >  	struct drm_crtc crtc;
> > > > >  	struct drm_encoder encoder;
> > > > > -	struct drm_connector connector;
> > > > >  	struct drm_writeback_connector wb_connector;
> > > > >  	struct hrtimer vblank_hrtimer;
> > > > >  	ktime_t period_ns;
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm=
/vkms/vkms_output.c
> > > > > index 5ce70dd946aa..4fe6b88e8081 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > > > > @@ -3,11 +3,11 @@
> > > > >  #include "vkms_drv.h"
> > > > >  #include <drm/drm_atomic_helper.h>
> > > > >  #include <drm/drm_edid.h>
> > > > > +#include <drm/drm_managed.h>
> > > > >  #include <drm/drm_probe_helper.h>
> > > > > =20
> > > > >  static const struct drm_connector_funcs vkms_connector_funcs =3D=
 {
> > > > >  	.fill_modes =3D drm_helper_probe_single_connector_modes,
> > > > > -	.destroy =3D drm_connector_cleanup,
> > > > >  	.reset =3D drm_atomic_helper_connector_reset,
> > > > >  	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplica=
te_state,
> > > > >  	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_s=
tate,
> > > > > @@ -50,7 +50,7 @@ int vkms_output_init(struct vkms_device *vkmsde=
v, int index)
> > > > >  {
> > > > >  	struct vkms_output *output =3D &vkmsdev->output;
> > > > >  	struct drm_device *dev =3D &vkmsdev->drm;
> > > > > -	struct drm_connector *connector =3D &output->connector;
> > > > > +	struct drm_connector *connector;
> > > > >  	struct drm_encoder *encoder =3D &output->encoder;
> > > > >  	struct drm_crtc *crtc =3D &output->crtc;
> > > > >  	struct vkms_plane *primary, *cursor =3D NULL;
> > > > > @@ -80,8 +80,15 @@ int vkms_output_init(struct vkms_device *vkmsd=
ev, int index)
> > > > >  	if (ret)
> > > > >  		return ret;
> > > > > =20
> > > > > -	ret =3D drm_connector_init(dev, connector, &vkms_connector_func=
s,
> > > > > -				 DRM_MODE_CONNECTOR_VIRTUAL);
> > > > > +	connector =3D drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
> > > > > +	if (!connector) {
> > > > > +		DRM_ERROR("Failed to allocate connector\n");
> > > > > +		ret =3D -ENOMEM;
> > > > > +		goto err_connector;
> > > > > +	}
> > > > > +
> > > >=20
> > > > I think it would be worth explaining why you need to move to a sepa=
rate
> > > > allocation for the connector now.
> > > >=20
> > > > Maxime
> > >=20
> > > Hi,
> > >=20
> > > This is in preparation for ConfigFS implementation, as the number of=
=20
> > > connector/encoders/crtc/planes... will be dynamic, we need to have=20
> > > separate alloaction.
> > >=20
> > > If I add this paragraph in the commit message, is it sufficient?
> > >=20
> > > 	A specific allocation for the connector is not strictly necessary=20
> > > 	at this point, but in order to implement dynamic configuration of=20
> > > 	VKMS (configFS), it will be easier to have one allocation per=20
> > > 	connector.
> > >=20
> > > (same for encoder & CRTC)
> >=20
> > Yeah, that's a good message, but it probably belongs in a separate patch
> > then.
>=20
> Can you explain what you mean by "in a separate patch"? I wanted to write=
=20
> this paragraph in the commit log.

You're doing two things in that patch: converting to drmm like you
documented in your original commit log, and switching from having the
connector (encoder, and crtc) from vkms_output to being dynamically
allocated.

Ideally, you should have one patch to switch from being part of
vkms_output to a dynamic allocation (with the commit log you suggested
above), and one patch to switch to drmm with your original commit log.

Maxime

--llvjkgls46oo654a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZs4B5gAKCRAnX84Zoj2+
dnPhAYCsiGwo2f0xKeDFh5+1CzaV7BYj+tRf4WeFLyOxKaeLtlwG32jh+Sf4iM/1
PzfMyPEBf1Obpil1qponH5r2XeNnnhSPy5zeRC062AnHFYZjeNnsGyuW7nLkmqlN
+w82eaN0yw==
=2SWu
-----END PGP SIGNATURE-----

--llvjkgls46oo654a--
