Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E363C0F993
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 18:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE4310E170;
	Mon, 27 Oct 2025 17:19:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YiRZpR7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F9C10E4FA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 17:19:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D3E144422;
 Mon, 27 Oct 2025 17:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C25C4CEFD;
 Mon, 27 Oct 2025 17:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761585555;
 bh=PCbERfcgvUw2fEkvsMjdinpQ0b6sj2+DSxOZAwZ+8yk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YiRZpR7E5aEAnwZeinP27w+be99PhDiZzT8O7biKazF1E833weB+2RLr+k1k2L2yL
 ibl+3ks3p3Pw2FNFBpo95EEC+6oSTqcQylsRFQdSEFEJWzRnMbwvLjUD9ITmcnNX8i
 Rnut5ejGe1gb6UlGDKqulgSz8JEa6vgn6zkMYGwt+Cn6nHegXxRMOEFXKe6vz22yJf
 tkUPxeX0I9MJvOhiD8CGvIYT9v/OglhBRaCZeGkVCDwX+kLVMasHvsT9fmQI4A6K3B
 5gg+o5yfujWLqKKd25aazvhpxPCTRRHNC+cWQ05GPjlkNoJP+kRq3a3F/0LoeEYmXW
 hA1wusUyBvGOg==
Date: Mon, 27 Oct 2025 18:19:12 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Francesco Valla <francesco@valla.it>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
Message-ID: <23clcxtgbzbsji2knwp47xdc5udj7lnhbvzsgqi3vklvmhdgjd@26ycx2ed77l4>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <yq4btdc5qqukuqps7y53dratmu64ghyifgprlndnk5rbgml4of@rvca75sncvsm>
 <3edea192-6a3f-44f5-b570-7033776e2ce4@suse.de>
 <5ff10f7d-e9d4-4d4d-ae82-8986dc28d14b@amd.com>
 <i7xxy33do4q4odvxxb77xv4ri5jgr6dup5kvfsjfs4h7mbmhrj@h3ke7h5whyvx>
 <93cbbaef-918f-4300-aa5b-11f098e217b2@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="swebmu2gokkv3szx"
Content-Disposition: inline
In-Reply-To: <93cbbaef-918f-4300-aa5b-11f098e217b2@amd.com>
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


--swebmu2gokkv3szx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
MIME-Version: 1.0

On Mon, Oct 27, 2025 at 11:31:06AM -0500, Mario Limonciello wrote:
> On 10/27/25 11:28 AM, Maxime Ripard wrote:
> > On Mon, Oct 27, 2025 at 11:01:55AM -0500, Mario Limonciello wrote:
> > > On 10/27/25 7:35 AM, Thomas Zimmermann wrote:
> > > > > >  =A0=A0 - a very simple progress bar, which can be driven throu=
gh sysfs;
> > > >=20
> > > > Once you have options to control these settings from user space, you
> > > > should do it in user space entirely. As Maxime suggested, please im=
prove
> > > > plymouth for anything with animation.
> > > >=20
> > > > > >  =A0=A0 - a static image (optional).
> > > >=20
> > > > Board vendors often provide an image, see /sys/firmware/acpi/bgrt/.=
 This
> > > > is a candidate for display, or the penguin or a custom image. Please
> > > > make it configurable by Kconfig. Again, if you need policy and
> > > > heuristics for deciding what to display, you better do this in user
> > > > space.
> > >=20
> > > I'd actually argue that the static image from BGRT should be the pref=
erred
> > > priority.  This can make for a nice hand off to Plymouth.
> > >=20
> > > The (UEFI) BIOS already will show this image as soon as the GOP drive=
r is
> > > loaded.  Bootloaders like GRUB by default will avoid showing anything=
 or
> > > will overwrite with the exact same image in the same location.  This =
can let
> > > the kernel do the same, and then the moment Plymouth takes over it co=
uld do
> > > the same.
> >=20
> > And BGRT isn't typically found on embedded systems at all, so I'm not
> > sure it's a sensible default, let alone a priority. At most a possible
>=20
> There are certainly embedded machines using UEFI and that have a BGRT.

Yes, indeed, hence the "typically".

> How about "Sensible default the top of the priority list if it exists"

How about we don't tell contributors what their priorities must be?

Maxime

--swebmu2gokkv3szx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaP+pkAAKCRAnX84Zoj2+
drPKAX49FE7QjngVHnA1mf13kfP6ZKCacCVX6G4v2AsdFZMFqxax8CsyueLnuT1S
O6YBTKQBf2etLxgBAFSiJ0S7jwoNmkZNnFyjp3NcIMTrXmNibOnyBfRHK+RSa2KF
u0BJYIAKYg==
=qXHe
-----END PGP SIGNATURE-----

--swebmu2gokkv3szx--
