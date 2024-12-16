Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E039F354F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C1310E2FD;
	Mon, 16 Dec 2024 16:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jFJaFujX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDC310E15B;
 Mon, 16 Dec 2024 16:07:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF0A95C5B8F;
 Mon, 16 Dec 2024 16:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 565DAC4CED4;
 Mon, 16 Dec 2024 16:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734365224;
 bh=AM/8aKA98AZ889JcW0STJ3XuC0MMP8g8wFOlSiAd6Nk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jFJaFujXUgK6lTHxCB3Ow6w7gMm9d2l0z4seD9UJ3AidNDOoRvTlTQGMqHOHnuvgM
 aOgft41I+6EOFSJh8ejSPJbZld3D8ot/iOook7Ic8jWR4Y/2N4zFHk+nDymp5RVOmQ
 /ol6lbEUc5aXbI5Ay4U55QLEogzpxuWOnTmlPGlOtkBl+7tmAOinA3tVE/+9sfNTqK
 du2IIe/uzKGbLrWe1BHjUdALaqlRRkrTBPbTeltJCfhzuB551rHI6oHUkxCs5L01cv
 qY7slCPmT1u9qCey8iWK2yTTmxSN5+FPtHUvNSciBPusICvSyFUdzjd/BS56fSVFMz
 byLzGJbRcDgMg==
Date: Mon, 16 Dec 2024 17:07:02 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Raag Jadav <raag.jadav@intel.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com, 
 aravind.iddamsetty@linux.intel.com, rodrigo.vivi@intel.com,
 michal.wajdeczko@intel.com, 
 lina@asahilina.net, anshuman.gupta@intel.com, alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, airlied@gmail.com,
 simona@ffwll.ch, lucas.demarchi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com
Subject: Re: [PATCH v10 1/4] drm: Introduce device wedged event
Message-ID: <20241216-grinning-stimulating-jackal-a5fea0@houat>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-2-raag.jadav@intel.com>
 <1d448e67-0c28-4e21-afdd-223495346921@igalia.com>
 <Z01q1-7OF7jgANEM@black.fi.intel.com>
 <Z06QUpm3o_izNjoV@black.fi.intel.com>
 <7d0660f8-ce78-4458-a084-b65ab71e8243@amd.com>
 <Z1A6PYFCUNL9edv6@black.fi.intel.com>
 <m6ysmkxnit6kqeilkcaa3hoyfzyznymsa3eybzsl66jsn2ku67@jl3ajhxgqmvy>
 <Z1q9B4iQlQQNieS7@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nxbd5nusaiy7kazk"
Content-Disposition: inline
In-Reply-To: <Z1q9B4iQlQQNieS7@black.fi.intel.com>
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


--nxbd5nusaiy7kazk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 1/4] drm: Introduce device wedged event
MIME-Version: 1.0

Hi,

On Thu, Dec 12, 2024 at 12:37:59PM +0200, Raag Jadav wrote:
> On Wed, Dec 11, 2024 at 06:14:12PM +0100, Maxime Ripard wrote:
> > On Wed, Dec 04, 2024 at 01:17:17PM +0200, Raag Jadav wrote:
> > > + misc maintainers
> > >=20
> > > On Tue, Dec 03, 2024 at 11:18:00AM +0100, Christian K=F6nig wrote:
> > > > Am 03.12.24 um 06:00 schrieb Raag Jadav:
> > > > > On Mon, Dec 02, 2024 at 10:07:59AM +0200, Raag Jadav wrote:
> > > > > > On Fri, Nov 29, 2024 at 10:40:14AM -0300, Andr=E9 Almeida wrote:
> > > > > > > Hi Raag,
> > > > > > >=20
> > > > > > > Em 28/11/2024 12:37, Raag Jadav escreveu:
> > > > > > > > Introduce device wedged event, which notifies userspace of =
'wedged'
> > > > > > > > (hanged/unusable) state of the DRM device through a uevent.=
 This is
> > > > > > > > useful especially in cases where the device is no longer op=
erating as
> > > > > > > > expected and has become unrecoverable from driver context. =
Purpose of
> > > > > > > > this implementation is to provide drivers a generic way to =
recover with
> > > > > > > > the help of userspace intervention without taking any drast=
ic measures
> > > > > > > > in the driver.
> > > > > > > >=20
> > > > > > > > A 'wedged' device is basically a dead device that needs att=
ention. The
> > > > > > > > uevent is the notification that is sent to userspace along =
with a hint
> > > > > > > > about what could possibly be attempted to recover the devic=
e and bring
> > > > > > > > it back to usable state. Different drivers may have differe=
nt ideas of
> > > > > > > > a 'wedged' device depending on their hardware implementatio=
n, and hence
> > > > > > > > the vendor agnostic nature of the event. It is up to the dr=
ivers to
> > > > > > > > decide when they see the need for device recovery and how t=
hey want to
> > > > > > > > recover from the available methods.
> > > > > > > >=20
> > > > > > > Thank you for your work. Do you think you can add the optiona=
l PID
> > > > > > > parameter, as the PID of the app that caused the reset? For S=
teamOS use case
> > > > > > > it has been proved to be useful to kill the fault app as well=
=2E If the reset
> > > > > > > was caused by a kthread, no PID can be provided hence it's an=
 optional
> > > > > > > parameter.
> > > > > > Hmm, I'm not sure if it really fits here since it doesn't seem =
like
> > > > > > a generic usecase.
> > > > > >=20
> > > > > > I'd still be open for it if found useful by the drivers but per=
haps
> > > > > > as an extended feature in a separate series.
> > > > > What do you think Chris, are we good to go with v10?
> > > >=20
> > > > I agree with Andre that the PID and maybe the new DRM client name w=
ould be
> > > > really nice to have here.
> > > >=20
> > > > We do have that in the device core dump we create, but if an applic=
ation is
> > > > supervised by daemon for example then that would be really useful.
> > > >=20
> > > > On the other hand I think we should merge the documentation and cod=
e as is
> > > > and then add the PID/name later on. That is essentially a separate
> > > > discussion.
> > >=20
> > > So how do we proceed, perhaps through misc tree?
> >=20
> > Provided it follows the usual rules (ie, Reviewed-by, open source
> > userspace tools using it if it's a new uAPI, etc.) then yeah, we can
> > merge it through drm-misc.
>=20
> My understanding is that the core patches are to be reviewed by the
> maintainers? The rest of it (patch 2 to 4) seems already reviewed.
>=20
> We have a documented example (patch 2) with udev rule and a reference
> script which can be setup to get this working. Does that qualify as
> a consumer?

Given the description you stated above, I'd expect a compositor to be
the expected user, right?

Our doc
(https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requiremen=
ts)
states:

  The open-source userspace must not be a toy/test application, but the
  real thing. Specifically it needs to handle all the usual error and
  corner cases. These are often the places where new uAPI falls apart
  and hence essential to assess the fitness of a proposed interface.

Maxime

--nxbd5nusaiy7kazk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2BQIQAKCRAnX84Zoj2+
drhfAX9mPXpDK7b9lAQTMkeulf9d78L3Yk31TxHyY0Df+hmLgDsXqyD85JOfk2AC
Ahe+5Q8Bf2+/43VF5ukum62mTd38WMc+kqx9L7goTASLt5sd7lBBG9JnOLgUTWWY
nG+jR9uAsQ==
=IMCP
-----END PGP SIGNATURE-----

--nxbd5nusaiy7kazk--
