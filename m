Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08461B2C024
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB7910E5AC;
	Tue, 19 Aug 2025 11:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iuUHbXNz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E660410E5AA;
 Tue, 19 Aug 2025 11:21:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6F7E15C5E65;
 Tue, 19 Aug 2025 11:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAC2C116B1;
 Tue, 19 Aug 2025 11:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755602493;
 bh=lB1ftSYVoalO3pqD17BabvrKVzz8AuFLNPMRaJ5HxqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iuUHbXNzm8XF0le1Y8TGFU4fPPMDcAeSi6+LYseH4dF0CDcWjxwe9mqXrbfMMi0bb
 my6E0FcmeQgM45MCDhlMn5xV7rP5sXykpv4I4Ez+RbcJyCzC/ezfHfapGRq6pNCOAG
 Hzqq6v79EMRXoKHaDsVGK0FLh6e+R8/BpsKx/A6rQjjstRfg+R28Ti0htOfA9Lqg1J
 VTxL4dU5T9cREAHYg+rTPSaehMUkPTIXfp+SXtRuOm5N+yOLMrHO6t5Rh3UMr9+Ix1
 jXvUAnYwYJueooVz6dDFsWvNem9Sx5S1CbZZFGt5tU0Gd8wEXV3sJnKIn1LctjM972
 g37z/2lNkDFNw==
Date: Tue, 19 Aug 2025 13:21:29 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, anshuman.gupta@intel.com,
 lucas.demarchi@intel.com, 
 aravind.iddamsetty@linux.intel.com, raag.jadav@intel.com,
 umesh.nerlige.ramappa@intel.com, 
 frank.scarbrough@intel.com, sk.anirban@intel.com, simona.vetter@ffwll.ch, 
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
Message-ID: <5hkngbuzoryldvjrtjwalxhosdhtweeinpjpyguzltjmee7mpu@vw44iwczytw5>
References: <20250728102809.502324-1-riana.tauro@intel.com>
 <20250728102809.502324-2-riana.tauro@intel.com>
 <aJIb1NbxmxKbUT5U@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="aip5wo2wxwo2mdl2"
Content-Disposition: inline
In-Reply-To: <aJIb1NbxmxKbUT5U@intel.com>
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


--aip5wo2wxwo2mdl2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
MIME-Version: 1.0

On Tue, Aug 05, 2025 at 10:57:24AM -0400, Rodrigo Vivi wrote:
> On Mon, Jul 28, 2025 at 03:57:51PM +0530, Riana Tauro wrote:
> > Address the need for a recovery method (firmware flash on Firmware erro=
rs)
> > introduced in the later patches of Xe KMD.
> > Whenever XE KMD detects a firmware error, a firmware flash is required =
to
> > recover the device to normal operation.
> >=20
> > The initial proposal to use 'firmware-flash' as a recovery method was
> > not applicable to other drivers and could cause multiple recovery
> > methods specific to vendors to be added.
> > To address this a more generic 'vendor-specific' method is introduced,
> > guiding users to refer to vendor specific documentation and system logs
> > for detailed vendor specific recovery procedure.
> >=20
> > Add a recovery method 'WEDGED=3Dvendor-specific' for such errors.
> > Vendors must provide additional recovery documentation if this method
> > is used.
> >=20
> > It is the responsibility of the consumer to refer to the correct vendor
> > specific documentation and usecase before attempting a recovery.
> >=20
> > For example: If driver is XE KMD, the consumer must refer
> > to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'.
> >=20
> > Recovery script contributed by Raag.
> >=20
> > v2: fix documentation (Raag)
> > v3: add more details to commit message (Sima, Rodrigo, Raag)
> >     add an example script to the documentation (Raag)
> > v4: use consistent naming (Raag)
> > v5: fix commit message
> >=20
> > Cc: Andr=E9 Almeida <andrealmeid@igalia.com>
> > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
>=20
> > Co-developed-by: Raag Jadav <raag.jadav@intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
> >  drivers/gpu/drm/drm_drv.c      |  2 ++
> >  include/drm/drm_device.h       |  4 ++++
> >  3 files changed, 41 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 843facf01b2d..5691b29acde3 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -418,13 +418,15 @@ needed.
> >  Recovery
> >  --------
> > =20
> > -Current implementation defines three recovery methods, out of which, d=
rivers
> > +Current implementation defines four recovery methods, out of which, dr=
ivers
> >  can use any one, multiple or none. Method(s) of choice will be sent in=
 the
> >  uevent environment as ``WEDGED=3D<method1>[,..,<methodN>]`` in order o=
f less to
> > -more side-effects. If driver is unsure about recovery or method is unk=
nown
> > -(like soft/hard system reboot, firmware flashing, physical device repl=
acement
> > -or any other procedure which can't be attempted on the fly), ``WEDGED=
=3Dunknown``
> > -will be sent instead.
> > +more side-effects. If recovery method is specific to vendor
> > +``WEDGED=3Dvendor-specific`` will be sent and userspace should refer t=
o vendor
> > +specific documentation for the recovery procedure. As an example if th=
e driver
> > +is 'Xe' then the documentation for 'Device Wedging' of Xe driver needs=
 to be
> > +referred for the recovery procedure. If driver is unsure about recover=
y or
> > +method is unknown, ``WEDGED=3Dunknown`` will be sent instead.
>=20
> What if instead of this we do something like:
>=20
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -441,6 +441,29 @@ following expectations.
>      unknown         consumer policy
>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> +Vendor-Specific Recovery
> +++++++++++++++++++++++++
> +
> +When ``WEDGED=3Dvendor-specific`` is emitted, it indicates that the devi=
ce requires a
> +recovery method that is *not standardized* and is specific to the hardwa=
re vendor.
> +
> +In this case, the vendor driver must provide detailed documentation desc=
ribing
> +every single recovery possibilities and its processes. It needs to inclu=
de:
> +
> +- Hints: Which of the following will be used to identify the
> +  specific device, and guide the administrator:
> +  + Sysfs, debugfs, tracepoints, or kernel logs (e.g., ``dmesg``)
> +- Explicit guidance: for any admin or userspace tools and scripts necess=
ary
> +  to carry out recovery.
> +
> +**Example**:
> +    If the device uses the ``Xe`` driver, then administrators should con=
sult the
> +    *"Device Wedging"* section of the Xe driver's documentation to deter=
mine
> +    the proper steps for recovery.
> +
> +Notes
> ++++++
> +
>  The only exception to this is ``WEDGED=3Dnone``, which signifies that th=
e device
>=20
> ----------------------
>=20
> Maxime, is it any better?

Yes, it is. Thanks!
Maxime

--aip5wo2wxwo2mdl2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaKReOQAKCRAnX84Zoj2+
dttNAYD6etshHfhq9diIMZ0xBJHx16i1mwsThwgR+pkeyRu+QXMgdg6yMNaZ/QTp
p7IBR94BgKKYJXjpRtTwpySgH/OKCEfFxX4xMYpW75T24OmMLaE1WChjPjj11CQO
exd2ePh2vA==
=Lg6j
-----END PGP SIGNATURE-----

--aip5wo2wxwo2mdl2--
