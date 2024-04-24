Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59428B089B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 13:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E190710F538;
	Wed, 24 Apr 2024 11:49:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JylF1rcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE4110F47A;
 Wed, 24 Apr 2024 11:49:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6038B6197E;
 Wed, 24 Apr 2024 11:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06FCC2BD10;
 Wed, 24 Apr 2024 11:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713959359;
 bh=c+NIyIxckPHmqEd/nB4JkVKyhmET6Cm0MANJ8VKJ9nk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JylF1rcIMBicsRPZbxPkpv2ii6i/6F7yp3isjlV0eanD1/f5rdKHdQZPbowAZCbwx
 zRhVNExjC7CO4JLRpKdDq+YDRbE+LNmpjEz+Fe8ZZ6f9DuVVubvhqXqxnabRoEMNQ8
 sWwIkH5A1N5vy5UnklujfbRhJt2wIftl8hsVxTGIu6ilUMYDR70KeByEIPr38YP7Ky
 u+KnZJQTQhJQzB8NZ36NZ86Hc1X+M6/neSyXFz5/8YqAFbt3ZKKExTomidMyB/CwqJ
 tsZHydTA/yl3YZ5lCizlNsbwACUpGTNpbByduN4Ou0z3pxp01E5yFatsjoFs8YGzuR
 9MI3I2iSyy8sg==
Date: Wed, 24 Apr 2024 13:49:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, 
 airlied@gmail.com, tzimmermann@suse.de, intel-xe@lists.freedesktop.org, 
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 1/4] drm: add devm release action
Message-ID: <20240424-spectacular-lumpy-guan-7188eb@houat>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
 <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
 <ZibOmWPr3pZXdoNM@intel.com>
 <c899f2a5-e4f8-421f-ba87-8e8c15a6f665@linux.intel.com>
 <Zify_rd1yV6ki7oR@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ge6lzsrmzmegosqw"
Content-Disposition: inline
In-Reply-To: <Zify_rd1yV6ki7oR@intel.com>
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


--ge6lzsrmzmegosqw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 01:42:22PM -0400, Rodrigo Vivi wrote:
> On Tue, Apr 23, 2024 at 02:25:06PM +0530, Aravind Iddamsetty wrote:
> >=20
> > On 23/04/24 02:24, Rodrigo Vivi wrote:
> > > On Mon, Apr 22, 2024 at 12:27:53PM +0530, Aravind Iddamsetty wrote:
> > >> In scenarios where drm_dev_put is directly called by driver we want =
to
> > >> release devm_drm_dev_init_release action associated with struct
> > >> drm_device.
> > >>
> > >> v2: Directly expose the original function, instead of introducing a
> > >> helper (Rodrigo)
> > >>
> > >> v3: add kernel-doc (Maxime Ripard)
> > >>
> > >> Cc: Maxime Ripard <mripard@kernel.org>
> > >> Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
> > >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >>
> > > please avoid these empty lines here.... cc, rv-b, sign-offs, links,
> > > etc are all in the same block.
> > ok.
> > >
> > >> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.co=
m>
> > >> ---
> > >>  drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
> > >>  include/drm/drm_drv.h     |  2 ++
> > >>  2 files changed, 15 insertions(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > >> index 243cacb3575c..9d0409165f1e 100644
> > >> --- a/drivers/gpu/drm/drm_drv.c
> > >> +++ b/drivers/gpu/drm/drm_drv.c
> > >> @@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device *par=
ent,
> > >>  					devm_drm_dev_init_release, dev);
> > >>  }
> > >> =20
> > >> +/**
> > >> + * devm_drm_dev_release_action - Call the final release action of t=
he device
> > > Seeing the doc here gave me a second thought....
> > >
> > > the original release should be renamed to _devm_drm_dev_release
> > > and this should be called devm_drm_dev_release without the 'action' w=
ord.
> > i believe, was suggested earlier to directly expose the main function, =
is=A0
> > there any reason to have a __ version ?
>=20
> No no, just ignore me. Just remove the '_action' and don't change the oth=
er.
>=20
> I don't like exposing the a function with '__'. what would '__' that mean?
> This is what I meant on the first comment.
>=20
> Now, I believe that we don't need the '_action'. What does the 'action' m=
ean?
>=20
> the devm_drm_dev_release should be enough. But then I got confused and
> I thought it would conflict with the original released function name.
> But I misread it.

I don't think devm_drm_dev_release is a good name either. Just like any
other devm_* function that cancels what a previous one has been doing
(devm_kfree, devm_backlight_device_unregister, devm_nvmem_device_put,
etc.) it should be called devm_drm_dev_put or something similar.

Maxime

--ge6lzsrmzmegosqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZijxuwAKCRDj7w1vZxhR
xdPVAPoDrkDtnoH7rcCJKhYwFQR+0yk0SQCZaSStbjLEB5sLLgEAkJR8ZnPGko+8
7TCBr7HyVXZsdzhqEQunyG7pPSTQPgE=
=d4mB
-----END PGP SIGNATURE-----

--ge6lzsrmzmegosqw--
