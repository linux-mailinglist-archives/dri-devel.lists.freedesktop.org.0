Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C09B171A7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 15:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DDD10E277;
	Thu, 31 Jul 2025 13:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cxQBdG0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FAA10E277;
 Thu, 31 Jul 2025 13:01:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DFDE5601F9;
 Thu, 31 Jul 2025 13:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45547C4CEEF;
 Thu, 31 Jul 2025 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753966881;
 bh=XKbi3I7b+gNmDweI8NpenGkpLzsUsI5a/3dkgw6dAQI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cxQBdG0rUfmaLvyBr8j7XCLgLyNoGmGeSr7Gc8C7uXM5jWOaevJjURsOBYEDNa2xv
 zlZsjprhQZmuWhZQtU4Tu01PsOvXK7oOzzxL10esrqhj7452tWC1aU1mq/o2HUl2Kb
 xKSA+2U2+0Pakj8yw/ZyG+0p0xvyXxd20ObusRylnGnERKR7ckKc5zY1nd7XMnlOEw
 ZJ7TlV8ytBfsYjseE+MJXdLpjJoTotpIiYwngs16O4RbB/ndOaOQAtfmkOkzaPFqDe
 TuoTjg9AI7o4vdrjonyRzbO4tFwx073eBOsuuWIoN8Ulmcl2Rh3PVYGQ38/43KFPsq
 xDUG79qM8jyOg==
Date: Thu, 31 Jul 2025 15:01:18 +0200
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
Message-ID: <20250731-excellent-octopus-of-acumen-ebfd30@houat>
References: <20250728102809.502324-1-riana.tauro@intel.com>
 <20250728102809.502324-2-riana.tauro@intel.com>
 <39095bd1-2dee-4bfb-bc87-ee8cecedebce@intel.com>
 <20250731-jovial-realistic-mastiff-2ef2a7@houat>
 <13e90893-d0dd-4f25-8541-ecfe875c52be@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="t6ux7mdqst6axhww"
Content-Disposition: inline
In-Reply-To: <13e90893-d0dd-4f25-8541-ecfe875c52be@intel.com>
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


--t6ux7mdqst6axhww
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 1/9] drm: Add a vendor-specific recovery method to drm
 device wedged uevent
MIME-Version: 1.0

On Thu, Jul 31, 2025 at 04:43:46PM +0530, Riana Tauro wrote:
> Hi Maxim
>=20
> On 7/31/2025 3:02 PM, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Jul 30, 2025 at 07:33:01PM +0530, Riana Tauro wrote:
> > > On 7/28/2025 3:57 PM, Riana Tauro wrote:
> > > > Address the need for a recovery method (firmware flash on Firmware =
errors)
> > > > introduced in the later patches of Xe KMD.
> > > > Whenever XE KMD detects a firmware error, a firmware flash is requi=
red to
> > > > recover the device to normal operation.
> > > >=20
> > > > The initial proposal to use 'firmware-flash' as a recovery method w=
as
> > > > not applicable to other drivers and could cause multiple recovery
> > > > methods specific to vendors to be added.
> > > > To address this a more generic 'vendor-specific' method is introduc=
ed,
> > > > guiding users to refer to vendor specific documentation and system =
logs
> > > > for detailed vendor specific recovery procedure.
> > > >=20
> > > > Add a recovery method 'WEDGED=3Dvendor-specific' for such errors.
> > > > Vendors must provide additional recovery documentation if this meth=
od
> > > > is used.
> > > >=20
> > > > It is the responsibility of the consumer to refer to the correct ve=
ndor
> > > > specific documentation and usecase before attempting a recovery.
> > > >=20
> > > > For example: If driver is XE KMD, the consumer must refer
> > > > to the documentation of 'Device Wedging' under 'Documentation/gpu/x=
e/'.
> > > >=20
> > > > Recovery script contributed by Raag.
> > > >=20
> > > > v2: fix documentation (Raag)
> > > > v3: add more details to commit message (Sima, Rodrigo, Raag)
> > > >       add an example script to the documentation (Raag)
> > > > v4: use consistent naming (Raag)
> > > > v5: fix commit message
> > > >=20
> > > > Cc: Andr=E9 Almeida <andrealmeid@igalia.com>
> > > > Cc: Christian K=F6nig <christian.koenig@amd.com>
> > > > Cc: David Airlie <airlied@gmail.com>
> > > > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > > > Co-developed-by: Raag Jadav <raag.jadav@intel.com>
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >=20
> > > This patch needs an ack from drm to be merged.
> > > The rest of the series have RB's. Can someone please provide an ack ?
> > >=20
> > > Cc: drm-misc maintainers
> > >=20
> > > Thanks
> > > Riana
> > >=20
> > > > ---
> > > >    Documentation/gpu/drm-uapi.rst | 42 ++++++++++++++++++++++++++++=
------
> > > >    drivers/gpu/drm/drm_drv.c      |  2 ++
> > > >    include/drm/drm_device.h       |  4 ++++
> > > >    3 files changed, 41 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm=
-uapi.rst
> > > > index 843facf01b2d..5691b29acde3 100644
> > > > --- a/Documentation/gpu/drm-uapi.rst
> > > > +++ b/Documentation/gpu/drm-uapi.rst
> > > > @@ -418,13 +418,15 @@ needed.
> > > >    Recovery
> > > >    --------
> > > > -Current implementation defines three recovery methods, out of whic=
h, drivers
> > > > +Current implementation defines four recovery methods, out of which=
, drivers
> > > >    can use any one, multiple or none. Method(s) of choice will be s=
ent in the
> > > >    uevent environment as ``WEDGED=3D<method1>[,..,<methodN>]`` in o=
rder of less to
> > > > -more side-effects. If driver is unsure about recovery or method is=
 unknown
> > > > -(like soft/hard system reboot, firmware flashing, physical device =
replacement
> > > > -or any other procedure which can't be attempted on the fly), ``WED=
GED=3Dunknown``
> > > > -will be sent instead.
> > > > +more side-effects. If recovery method is specific to vendor
> > > > +``WEDGED=3Dvendor-specific`` will be sent and userspace should ref=
er to vendor
> > > > +specific documentation for the recovery procedure. As an example i=
f the driver
> > > > +is 'Xe' then the documentation for 'Device Wedging' of Xe driver n=
eeds to be
> > > > +referred for the recovery procedure. If driver is unsure about rec=
overy or
> > > > +method is unknown, ``WEDGED=3Dunknown`` will be sent instead.
> > > >    Userspace consumers can parse this event and attempt recovery as=
 per the
> > > >    following expectations.
> > > > @@ -435,6 +437,7 @@ following expectations.
> > > >        none            optional telemetry collection
> > > >        rebind          unbind + bind driver
> > > >        bus-reset       unbind + bus reset/re-enumeration + bind
> > > > +    vendor-specific vendor specific recovery method
> > > >        unknown         consumer policy
> > > >        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > @@ -472,8 +475,12 @@ erroring out, all device memory should be unma=
pped and file descriptors should
> > > >    be closed to prevent leaks or undefined behaviour. The idea here=
 is to clear the
> > > >    device of all user context beforehand and set the stage for a cl=
ean recovery.
> > > > -Example
> > > > --------
> > > > +For ``WEDGED=3Dvendor-specific`` recovery method, it is the respon=
sibility of the
> > > > +consumer to check the driver documentation and the usecase before =
attempting
> > > > +a recovery.
> > > > +
> > > > +Example - rebind
> > > > +----------------
> > > >    Udev rule::
> > > > @@ -491,6 +498,27 @@ Recovery script::
> > > >        echo -n $DEVICE > $DRIVER/unbind
> > > >        echo -n $DEVICE > $DRIVER/bind
> > > > +Example - vendor-specific
> > > > +-------------------------
> > > > +
> > > > +Udev rule::
> > > > +
> > > > +    SUBSYSTEM=3D=3D"drm", ENV{WEDGED}=3D=3D"vendor-specific", DEVP=
ATH=3D=3D"*/drm/card[0-9]",
> > > > +    RUN+=3D"/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
> > > > +
> > > > +Recovery script::
> > > > +
> > > > +    #!/bin/sh
> > > > +
> > > > +    DEVPATH=3D$(readlink -f /sys/$1/device)
> > > > +    DRIVERPATH=3D$(readlink -f $DEVPATH/driver)
> > > > +    DRIVER=3D$(basename $DRIVERPATH)
> > > > +
> > > > +    if [ "$DRIVER" =3D "xe" ]; then
> > > > +        # Refer XE documentation and check usecase and recovery pr=
ocedure
> > > > +    fi
> > > > +
> > > > +
> >=20
> > So I guess I'm not opposed to it on principle, but the documentation
> > really needs some work.
> >=20
> > You should at least list the valid vendor specific options, and what
> > each mean exactly. Ideally, it should be a link to the datasheet/manual
> > detailing the recovery procedure,
>=20
> This is added above
>=20
> "If recovery method is specific to vendor ``WEDGED=3Dvendor-specific`` wi=
ll be
> sent and userspace should refer to vendor specific documentation for the
> recovery procedure. As an example if the driver is 'Xe' then the
> documentation for 'Device Wedging' of Xe driver needs to be referred for =
the
> recovery procedure."
>=20
> The documentation of Xe is in Patch 6
>=20
> https://lore.kernel.org/intel-xe/20250728102809.502324-7-riana.tauro@inte=
l.com/

I'm sorry, I still don't get how, as a user, I can reimplement what that
tool is supposed to be doing. Or do you anticipate that there's only
ever be a single way to recover a Xe device, which is to reflash the
firmware?

What if in ~5y, Intel comes up with a new recovery method for the newer
models?

> I'll add the link instead of just the chapter name
> > but if that's under NDA, at least a
> > reference to the document and section you need to look at to implement
> > it properly.
> >=20
> > Or if that's still not doable, anything that tells you what to do
> > instead of "run a shell script we don't provide".
> >=20
> > Also, we just discussed it with Sima on IRC, and she mentioned that we
> > probably want to have a vendor specific prefix for each vendor-specific
> > method.
>=20
> This was discussed as part of Rev4
>=20
> https://lore.kernel.org/intel-xe/aG-U9JTXDah_tu1U@black.fi.intel.com/
>=20
> DEVPATH from uevent and driver should be able to identify the driver.
> Shouldn't that be enough?

See above. What happens if we start to see systems with two Xe GPUs, one
with a new recovery method and one with an old recovery method?

Maxime

--t6ux7mdqst6axhww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaItpGgAKCRAnX84Zoj2+
doTuAYDhwedSk7UKjK9m8UN0Kq+I/BKgBoppuZqLbVGm4vpxslSUt8ZCpqEFEwAX
ezNMjvwBf1JfyH8N96Vp4ceqj0hZjjXanvvWw4+oKjD1pCylKahKrJbDVkHQNKv5
OrIswh4OPw==
=anwt
-----END PGP SIGNATURE-----

--t6ux7mdqst6axhww--
