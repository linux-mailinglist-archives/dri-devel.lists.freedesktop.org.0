Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 463DF7FD25A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 10:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908C310E392;
	Wed, 29 Nov 2023 09:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D33510E196
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 09:23:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 16A98618C7;
 Wed, 29 Nov 2023 09:23:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D3AC433C7;
 Wed, 29 Nov 2023 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701249779;
 bh=EzFjw7idQptv1qfyUwLm9/Zx/1lzbs/31vkDl/YdmpM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G41YjMqsqEVdWf++jrJ1PV3Reea5PMr5GlgKCi8FKDp+njIin/DvJUlCRNqnQIXVt
 7pelXS1MLbgUeFUjjFBwxfB+FOlcEpoiO/qzzG0YUV1jHPX1Yto9UYhr4C/+TeKivx
 Al5GOghL/Yj4whPJamcEfIRqLqintvGYKEIwNimq/n21ySUBj00sdRwMOs56Ucnwv0
 OOevlMvntIM138/v73SPTAbhxHbuTnsuhEk/74QbhRiq5aKkmSeyb1BVrAzWpIT4WM
 gJU0P1qiHu2EEAYmctKMQcUhsYgFhNVO6h5XwXyBgDj4zul8LisgQeCPTukmnGLign
 Uzi0hrs3SFuQg==
Date: Wed, 29 Nov 2023 10:22:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Message-ID: <sw5e3mdtbmywbeo6sok4ul5qe72bb5ltsg5ago2vliqxlahvpl@rcivlupw77a5>
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
 <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
 <CAMuHMdVTZ8LT1yU3e1bbJODecy96TaMX1hq_swqmT6L+mbH3aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r3qnhn4k5yvcspbm"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVTZ8LT1yU3e1bbJODecy96TaMX1hq_swqmT6L+mbH3aQ@mail.gmail.com>
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
Cc: Nishanth Menon <nm@ti.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Tero Kristo <kristo@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matt Coster <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--r3qnhn4k5yvcspbm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 09:58:12AM +0100, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Wed, Nov 29, 2023 at 9:35=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Tue, Nov 28, 2023 at 08:16:18PM +0100, Geert Uytterhoeven wrote:
> > > On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Canillas
> > > <javierm@redhat.com> wrote:
> > > > Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > > > > The Imagination Technologies PowerVR Series 6 GPU is currently on=
ly
> > > > > supported on Texas Instruments K3 AM62x SoCs.  Hence add a depend=
ency on
> > > > > ARCH_K3, to prevent asking the user about this driver when config=
uring a
> > > > > kernel without Texas Instruments K3 Multicore SoC support.
> > > > >
> > > > > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR d=
river")
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> > > > In any case, I agree with you that restricting to only K3 makes sen=
se.
> > >
> > > I am looking forward to adding || SOC_AM33XX || ARCH_RENESAS || ...,
> > > eventually ;-)
> >
> > I disagree. This is to handle a generic IP, just like panfrost, lima, or
> > etnaviv, and we certaintly don't want to maintain the Kconfig list of
> > every possible architecture and SoC family it might or might not be
> > found.
>=20
> While PowerVR is a generic IP, I believe it needs a non-generic
> firmware, which is currently only available for AM62x SoCs.

I'm not sure it's actually true, but let's consider it is. Then what? If
the firmware isn't there and/or the DT bits too, then nothing will
happen. We would have wasted a couple of 100kB on a system that is
taking somewhere in the 100MB-10GB range, and that's pretty much it.

If you have we take that patch in though, we have:

  - To keep merging patches as firmwares become available.

  - If we update linux-firmware only, then the driver is still not
    loading even though it could.

  - If we have gotten our firmware through some other mean, then the
    driver is still not loading even though it could.

It makes life harder for everyone: maintainers, users, devs, based on
the state of some external project that might or might not be updated in
sync.

> Once it becomes truly generic, I'm happy to drop all platform
> dependencies.  Until then, there is no point in asking everyone who
> configures an arm64 kernel about this driver, unless they also enabled
> K3 support.

Whether it's truly generic, whatever that means, is irrelevant here.

Maxime

--r3qnhn4k5yvcspbm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWcC8AAKCRDj7w1vZxhR
xZTtAP47Cg/+oHf3QN6f+1dfblO7GrIo9jYf5v/2E2Td43d4yQD+KlTDLfp7k2TU
+LBGSzyfqu7qT7Lo//1XyokUzh5SZQY=
=BGY8
-----END PGP SIGNATURE-----

--r3qnhn4k5yvcspbm--
