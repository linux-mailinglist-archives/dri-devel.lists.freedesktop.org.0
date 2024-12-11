Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1929ED32E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 18:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1726510EBCC;
	Wed, 11 Dec 2024 17:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UL2eZk8z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD5210EBC8;
 Wed, 11 Dec 2024 17:14:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ADD89A411C2;
 Wed, 11 Dec 2024 17:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F528C4CED2;
 Wed, 11 Dec 2024 17:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733937260;
 bh=eMXI49kfztrFRzLeMuIYb0vDUZemoUQLGGBNn+CfXXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UL2eZk8zY/frmxj6sMII0jPTlEd5JmQaXghEjyn0+CqmE8LHcph+sGATaWEQvbQze
 ATqD4t/RqOZ7OaEn8axEyxi7oT4KKFiNdIyD7bTA2ml+DybPZlulgfMEh/2vllBLz5
 xKzLUMnx/MayZB0pACYxykRCXRPdUX/vEI0hhOWsGjKUjLQ0d7s1A1Hfn9L7Bnoatx
 xxGhvd9edsGypt6JG74yPRMV2Dtdj5aD+Dvfp/E1fA4dDV0QSQJMeC9f/EbUhQkGWu
 VKT7WxnbS70eRGQXPul7k3kq7YGdcyqaO8tbiNsl8fjM0BrUD2LLyEcloKb3lxVQzm
 jzgnq4XIpZ//A==
Date: Wed, 11 Dec 2024 18:14:12 +0100
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
Message-ID: <m6ysmkxnit6kqeilkcaa3hoyfzyznymsa3eybzsl66jsn2ku67@jl3ajhxgqmvy>
References: <20241128153707.1294347-1-raag.jadav@intel.com>
 <20241128153707.1294347-2-raag.jadav@intel.com>
 <1d448e67-0c28-4e21-afdd-223495346921@igalia.com>
 <Z01q1-7OF7jgANEM@black.fi.intel.com>
 <Z06QUpm3o_izNjoV@black.fi.intel.com>
 <7d0660f8-ce78-4458-a084-b65ab71e8243@amd.com>
 <Z1A6PYFCUNL9edv6@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="uubsanflwdakzxeu"
Content-Disposition: inline
In-Reply-To: <Z1A6PYFCUNL9edv6@black.fi.intel.com>
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


--uubsanflwdakzxeu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 1/4] drm: Introduce device wedged event
MIME-Version: 1.0

On Wed, Dec 04, 2024 at 01:17:17PM +0200, Raag Jadav wrote:
> + misc maintainers
>=20
> On Tue, Dec 03, 2024 at 11:18:00AM +0100, Christian K=F6nig wrote:
> > Am 03.12.24 um 06:00 schrieb Raag Jadav:
> > > On Mon, Dec 02, 2024 at 10:07:59AM +0200, Raag Jadav wrote:
> > > > On Fri, Nov 29, 2024 at 10:40:14AM -0300, Andr=E9 Almeida wrote:
> > > > > Hi Raag,
> > > > >=20
> > > > > Em 28/11/2024 12:37, Raag Jadav escreveu:
> > > > > > Introduce device wedged event, which notifies userspace of 'wed=
ged'
> > > > > > (hanged/unusable) state of the DRM device through a uevent. Thi=
s is
> > > > > > useful especially in cases where the device is no longer operat=
ing as
> > > > > > expected and has become unrecoverable from driver context. Purp=
ose of
> > > > > > this implementation is to provide drivers a generic way to reco=
ver with
> > > > > > the help of userspace intervention without taking any drastic m=
easures
> > > > > > in the driver.
> > > > > >=20
> > > > > > A 'wedged' device is basically a dead device that needs attenti=
on. The
> > > > > > uevent is the notification that is sent to userspace along with=
 a hint
> > > > > > about what could possibly be attempted to recover the device an=
d bring
> > > > > > it back to usable state. Different drivers may have different i=
deas of
> > > > > > a 'wedged' device depending on their hardware implementation, a=
nd hence
> > > > > > the vendor agnostic nature of the event. It is up to the driver=
s to
> > > > > > decide when they see the need for device recovery and how they =
want to
> > > > > > recover from the available methods.
> > > > > >=20
> > > > > Thank you for your work. Do you think you can add the optional PID
> > > > > parameter, as the PID of the app that caused the reset? For Steam=
OS use case
> > > > > it has been proved to be useful to kill the fault app as well. If=
 the reset
> > > > > was caused by a kthread, no PID can be provided hence it's an opt=
ional
> > > > > parameter.
> > > > Hmm, I'm not sure if it really fits here since it doesn't seem like
> > > > a generic usecase.
> > > >=20
> > > > I'd still be open for it if found useful by the drivers but perhaps
> > > > as an extended feature in a separate series.
> > > What do you think Chris, are we good to go with v10?
> >=20
> > I agree with Andre that the PID and maybe the new DRM client name would=
 be
> > really nice to have here.
> >=20
> > We do have that in the device core dump we create, but if an applicatio=
n is
> > supervised by daemon for example then that would be really useful.
> >=20
> > On the other hand I think we should merge the documentation and code as=
 is
> > and then add the PID/name later on. That is essentially a separate
> > discussion.
>=20
> So how do we proceed, perhaps through misc tree?

Provided it follows the usual rules (ie, Reviewed-by, open source
userspace tools using it if it's a new uAPI, etc.) then yeah, we can
merge it through drm-misc.

Maxime

--uubsanflwdakzxeu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1nIYwAKCRAnX84Zoj2+
dtXAAYDY+OeW7gIj/MATHWWNiy3bA+yJgme6x0/ugH5VhUyQyMix4Ykr12192d8C
0/5OqdABewWd2jNf2wLwTrpyyrNilUrrujUWDjZdtfQrL7Q/0vd/oWf6fM1lhQ6z
+5cacRsHlg==
=iS2U
-----END PGP SIGNATURE-----

--uubsanflwdakzxeu--
