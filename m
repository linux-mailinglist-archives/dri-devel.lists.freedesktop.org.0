Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED9B16EB9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 11:32:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C2F10E748;
	Thu, 31 Jul 2025 09:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RtnM/8HO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0751410E744;
 Thu, 31 Jul 2025 09:32:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6066360207;
 Thu, 31 Jul 2025 09:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00A4C4CEEF;
 Thu, 31 Jul 2025 09:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753954364;
 bh=ZFE6EGdQzKalpH0R9dC0w/xziTJ+GYo9LFe8xLZUnFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RtnM/8HOa0R+ZXybiwnUUjKGsNblS9NCrmIMypqPJlUs8vs6Snr+0D51nGVJ0wMED
 jfqphCG//V70RW4g5oqdK3a3DAKRpcu5QIJPpDXDSZzoaaJdANTECYs+3YsH+iGwG4
 tbUhbg029epON89gfSl24zZ/SxMCtpHRnCrMDWnsV1LivD0LMihqW58VXfalVkPd3P
 5B6uiISKXJMLijhUfOUYA5R8tUI8vEjO6wq+8/Nn11f082OVJbc8devhiQloFALn4E
 wHmQD9NU6wCypnsvII1tPGaePJXtEAN4uhFzLI6eaF4h6gg3Ji8Y7HIjLmsXNMAIhF
 o6dbdslhfOtaQ==
Date: Thu, 31 Jul 2025 11:32:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Riana Tauro <riana.tauro@intel.com>
Cc: dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch, 
 David Airlie <airlied@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, 
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 raag.jadav@intel.com, 
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, 
 maarten.lankhorst@linux.intel.com, intel-xe@lists.freedesktop.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
Message-ID: <20250731-jovial-realistic-mastiff-2ef2a7@houat>
References: <20250728102809.502324-1-riana.tauro@intel.com>
 <20250728102809.502324-2-riana.tauro@intel.com>
 <39095bd1-2dee-4bfb-bc87-ee8cecedebce@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ag54fr364wevlu4z"
Content-Disposition: inline
In-Reply-To: <39095bd1-2dee-4bfb-bc87-ee8cecedebce@intel.com>
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


--ag54fr364wevlu4z
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
MIME-Version: 1.0

Hi,

On Wed, Jul 30, 2025 at 07:33:01PM +0530, Riana Tauro wrote:
> On 7/28/2025 3:57 PM, Riana Tauro wrote:
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
> >      add an example script to the documentation (Raag)
> > v4: use consistent naming (Raag)
> > v5: fix commit message
> >=20
> > Cc: Andr=E9 Almeida <andrealmeid@igalia.com>
> > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Co-developed-by: Raag Jadav <raag.jadav@intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> This patch needs an ack from drm to be merged.
> The rest of the series have RB's. Can someone please provide an ack ?
>=20
> Cc: drm-misc maintainers
>=20
> Thanks
> Riana
>=20
> > ---
> >   Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++------
> >   drivers/gpu/drm/drm_drv.c      |  2 ++
> >   include/drm/drm_device.h       |  4 ++++
> >   3 files changed, 41 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 843facf01b2d..5691b29acde3 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -418,13 +418,15 @@ needed.
> >   Recovery
> >   --------
> > -Current implementation defines three recovery methods, out of which, d=
rivers
> > +Current implementation defines four recovery methods, out of which, dr=
ivers
> >   can use any one, multiple or none. Method(s) of choice will be sent i=
n the
> >   uevent environment as ``WEDGED=3D<method1>[,..,<methodN>]`` in order =
of less to
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
> >   Userspace consumers can parse this event and attempt recovery as per =
the
> >   following expectations.
> > @@ -435,6 +437,7 @@ following expectations.
> >       none            optional telemetry collection
> >       rebind          unbind + bind driver
> >       bus-reset       unbind + bus reset/re-enumeration + bind
> > +    vendor-specific vendor specific recovery method
> >       unknown         consumer policy
> >       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > @@ -472,8 +475,12 @@ erroring out, all device memory should be unmapped=
 and file descriptors should
> >   be closed to prevent leaks or undefined behaviour. The idea here is t=
o clear the
> >   device of all user context beforehand and set the stage for a clean r=
ecovery.
> > -Example
> > --------
> > +For ``WEDGED=3Dvendor-specific`` recovery method, it is the responsibi=
lity of the
> > +consumer to check the driver documentation and the usecase before atte=
mpting
> > +a recovery.
> > +
> > +Example - rebind
> > +----------------
> >   Udev rule::
> > @@ -491,6 +498,27 @@ Recovery script::
> >       echo -n $DEVICE > $DRIVER/unbind
> >       echo -n $DEVICE > $DRIVER/bind
> > +Example - vendor-specific
> > +-------------------------
> > +
> > +Udev rule::
> > +
> > +    SUBSYSTEM=3D=3D"drm", ENV{WEDGED}=3D=3D"vendor-specific", DEVPATH=
=3D=3D"*/drm/card[0-9]",
> > +    RUN+=3D"/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
> > +
> > +Recovery script::
> > +
> > +    #!/bin/sh
> > +
> > +    DEVPATH=3D$(readlink -f /sys/$1/device)
> > +    DRIVERPATH=3D$(readlink -f $DEVPATH/driver)
> > +    DRIVER=3D$(basename $DRIVERPATH)
> > +
> > +    if [ "$DRIVER" =3D "xe" ]; then
> > +        # Refer XE documentation and check usecase and recovery proced=
ure
> > +    fi
> > +
> > +

So I guess I'm not opposed to it on principle, but the documentation
really needs some work.

You should at least list the valid vendor specific options, and what
each mean exactly. Ideally, it should be a link to the datasheet/manual
detailing the recovery procedure, but if that's under NDA, at least a
reference to the document and section you need to look at to implement
it properly.

Or if that's still not doable, anything that tells you what to do
instead of "run a shell script we don't provide".

Also, we just discussed it with Sima on IRC, and she mentioned that we
probably want to have a vendor specific prefix for each vendor-specific
method.

Maxime

--ag54fr364wevlu4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIs4NQAKCRAnX84Zoj2+
dvwpAYDCR8m0Lq3zxs6Ay7KTaa2XcDHYY8CEJIKjKSYYrQqXmpCtM/prvssCmYKX
GFoK9XkBfjijqmnXft+MracIdqWd/bjWUsBBNLu6wElLKL0tBLPYbZKqYMD4hT7+
0zrTk1H3+A==
=/2T4
-----END PGP SIGNATURE-----

--ag54fr364wevlu4z--
