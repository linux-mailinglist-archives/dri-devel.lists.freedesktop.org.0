Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B483C19156
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0707C10E743;
	Wed, 29 Oct 2025 08:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pjrgF0fd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9893E10E72B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 08:36:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 53FB6492C6;
 Wed, 29 Oct 2025 08:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE9EC4CEF7;
 Wed, 29 Oct 2025 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761726999;
 bh=1rKtagzqCuyPPLrsSkpbDvAK+y4SdzCtc2efQBAaXAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pjrgF0fd1Kw6Rz/hY36Ug6cppaVasCKMFiUTxVsnD3ZwCCquW0JgNgsQDWQSn45OE
 Ka0U3KcchPWlwJIPDtlcSxauweiv26U0K2RSuHGHNvbSvVN3rPFhoJiw6En9H+vohz
 siC6P4OCbcdk8RO9aqg1erGf7NO7aAPETSdrJnptKWiRf7Yz6GwkEfk8fV46BeScQD
 /8nAN1DKNAPffKgftlEfRuZMKmg89xw5c0PgezIaPpF6FX5ef9sYeYzjB32cENm+fh
 1bhzcG8iM9dAI3va4KS8UeT2cE3RaCoQtuBs0QphWVLSSrITEEYgiXxEIq6Q+tuwcp
 6/yj+oZjlV1vA==
Date: Wed, 29 Oct 2025 09:36:35 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Francesco Valla <francesco@valla.it>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-embedded@vger.kernel.org
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
Message-ID: <4uknyhx7lshybin3qjdyh7oq6udtdw3lqagumg6w6qjre3pn55@23c5itmo55f5>
References: <20251027-drm_client_splash-v1-0-00698933b34a@valla.it>
 <93cbbaef-918f-4300-aa5b-11f098e217b2@amd.com>
 <23clcxtgbzbsji2knwp47xdc5udj7lnhbvzsgqi3vklvmhdgjd@26ycx2ed77l4>
 <4497733.UPlyArG6xL@fedora.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="escnxwlco7olhzqd"
Content-Disposition: inline
In-Reply-To: <4497733.UPlyArG6xL@fedora.fritz.box>
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


--escnxwlco7olhzqd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/3] Add splash DRM client
MIME-Version: 1.0

On Tue, Oct 28, 2025 at 09:09:06AM +0100, Francesco Valla wrote:
> Hi,
>=20
> On Monday, 27 October 2025 at 18:19:12 Maxime Ripard <mripard@kernel.org>=
 wrote:
> > On Mon, Oct 27, 2025 at 11:31:06AM -0500, Mario Limonciello wrote:
> > > On 10/27/25 11:28 AM, Maxime Ripard wrote:
> > > > On Mon, Oct 27, 2025 at 11:01:55AM -0500, Mario Limonciello wrote:
> > > > > On 10/27/25 7:35 AM, Thomas Zimmermann wrote:
> > > > > > > >     - a very simple progress bar, which can be driven throu=
gh sysfs;
> > > > > >=20
> > > > > > Once you have options to control these settings from user space=
, you
> > > > > > should do it in user space entirely. As Maxime suggested, pleas=
e improve
> > > > > > plymouth for anything with animation.
> > > > > >=20
> > > > > > > >     - a static image (optional).
> > > > > >=20
> > > > > > Board vendors often provide an image, see /sys/firmware/acpi/bg=
rt/. This
> > > > > > is a candidate for display, or the penguin or a custom image. P=
lease
> > > > > > make it configurable by Kconfig. Again, if you need policy and
> > > > > > heuristics for deciding what to display, you better do this in =
user
> > > > > > space.
> > > > >=20
> > > > > I'd actually argue that the static image from BGRT should be the =
preferred
> > > > > priority.  This can make for a nice hand off to Plymouth.
> > > > >=20
> > > > > The (UEFI) BIOS already will show this image as soon as the GOP d=
river is
> > > > > loaded.  Bootloaders like GRUB by default will avoid showing anyt=
hing or
> > > > > will overwrite with the exact same image in the same location.  T=
his can let
> > > > > the kernel do the same, and then the moment Plymouth takes over i=
t could do
> > > > > the same.
> > > >=20
> > > > And BGRT isn't typically found on embedded systems at all, so I'm n=
ot
> > > > sure it's a sensible default, let alone a priority. At most a possi=
ble
> > >=20
> > > There are certainly embedded machines using UEFI and that have a BGRT.
> >=20
> > Yes, indeed, hence the "typically".
> >=20
> > > How about "Sensible default the top of the priority list if it exists"
> >=20
> > How about we don't tell contributors what their priorities must be?
> >=20
> > Maxime
> >=20
>=20
> I'm not familiar at all with BGRT, I'll study a bit about it.
>=20
> A build-time configuration could then let the user select:
>=20
> - a plain solid color
> - a custom static image
> - the penguin logo (?)
> - (on UEFI systems) BGRT source

It wouldn't work for generic distros that would run with the same config
on systems with and without BGRT.

Again, that whole discussion around BGRT is very premature, I'd suggest
to drop it for now.

Maxime

--escnxwlco7olhzqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaQHSEgAKCRAnX84Zoj2+
dpGIAX422nWOX75YY7H8/KLRytbQNW5Mc3R0yHeeBRF2Es62f2SWmkYJtpd604aL
gPtkHr0Bf2dw31hWMOP/ppZ975jt6D0JUZCVXttO2ltAPk1jJbxLm0z0Oe2x2aIX
RT783F5qdw==
=onat
-----END PGP SIGNATURE-----

--escnxwlco7olhzqd--
