Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B1986FECE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F3710FF61;
	Mon,  4 Mar 2024 10:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bRRI1ubY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C9A10FF58
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:19:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E736B60C75;
 Mon,  4 Mar 2024 10:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 242B6C433C7;
 Mon,  4 Mar 2024 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709547598;
 bh=NGSlH5LAcmLr4NWdQQqksxXC4KeXnJMqiaUMMa23O50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRRI1ubYB5JLR6RYkkFRyyWTMvUvIRQozW4dwLP5i/+wQZkTnCyPC95hsxQV4GZov
 goGHLSsYZaXSnpEV9fVjdZ8Ox43GHjb/dEkLdj5043G+vivYB2R6PaiTu1lHwxmh0O
 OiFLWRUpMj6f0APGq0FS30auKhGOixxDIthM4bh1UzJ8qF4Zgb0Iez6AMjdCvHNuWS
 pYvpreuSujRVYwFwDTg676pDmnKw0bBRM2Ctc16P9uXJYnZMZ9kk+hxbVIW86Nw7CR
 oW3xlkmxFjDuOwTQushm3mTvoYKTW7WwVtqalJDd2hwJBmfE8KqWiSQp6c8tjgWFo4
 EkMmUBkruKt9Q==
Date: Mon, 4 Mar 2024 11:19:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Guenter Roeck <groeck@google.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>, 
 Nikolai Kondrashov <spbnick@gmail.com>, Helen Koike <helen.koike@collabora.com>,
 linuxtv-ci@linuxtv.org, 
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-kselftest@vger.kernel.org, gustavo.padovan@collabora.com,
 pawiecz@collabora.com, 
 tales.aparecida@gmail.com, workflows@vger.kernel.org, kernelci@lists.linux.dev,
 skhan@linuxfoundation.org, kunit-dev@googlegroups.com, nfraprado@collabora.com,
 davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
 laura.nao@collabora.com, 
 ricardo.canuelo@collabora.com, kernel@collabora.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <20240304-dangerous-mastiff-of-fury-1fac5c@houat>
References: <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org>
 <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
 <CAMuHMdWi069YAvOoXe7sHJ_o702tY4tDQgL3sfApPR3aCnZboQ@mail.gmail.com>
 <20240304-transparent-oriole-of-honeydew-f4174e@houat>
 <CAMuHMdXyvcyXw8eXc2MONNaBYYGpVdnPh2h3T=QV38MEUzhu9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ba2cnmoytyqarlnv"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXyvcyXw8eXc2MONNaBYYGpVdnPh2h3T=QV38MEUzhu9A@mail.gmail.com>
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


--ba2cnmoytyqarlnv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 11:07:22AM +0100, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Mon, Mar 4, 2024 at 10:15=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Mon, Mar 04, 2024 at 09:12:38AM +0100, Geert Uytterhoeven wrote:
> > > On Sun, Mar 3, 2024 at 10:30=E2=80=AFAM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Sun, Mar 3, 2024 at 3:30=E2=80=AFAM Randy Dunlap <rdunlap@infrad=
ead.org> wrote:
> > > > > On 3/2/24 14:10, Guenter Roeck wrote:
> > > > > > While checkpatch is indeed of arguable value, I think it would =
help a
> > > > > > lot not having to bother about the persistent _build_ failures =
on
> > > > > > 32-bit systems. You mentioned the fancy drm CI system above, bu=
t they
> > > > > > don't run tests and not even test builds on 32-bit targets, whi=
ch has
> > > > > > repeatedly caused (and currently does cause) build failures in =
drm
> > > > > > code when trying to build, say, arm:allmodconfig in linux-next.=
 Most
> > > > > > trivial build failures in linux-next (and, yes, sometimes mainl=
ine)
> > > > > > could be prevented with a simple generic CI.
> > > > >
> > > > > Yes, definitely. Thanks for bringing that up.
> > > >
> > > > +1
> > >
> > > > Kisskb can send out email when builds get broken, and when they get
> > > > fixed again.  I receive such emails for the m68k builds.
> > >
> > > Like this (yes, one more in DRM; sometimes I wonder if DRM is meant o=
nly
> > > for 64-bit little-endian platforms with +200 GiB/s memory bandwidth):
> > >
> > > ---8<----------------------------------------------------------------=
---
> > > Subject: kisskb: FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Mon Ma=
r 04, 06:35
> > > To: geert@linux-m68k.org
> > > Date: Mon, 04 Mar 2024 08:05:14 -0000
> > >
> > > FAILED linux-next/m68k-allmodconfig/m68k-gcc8 Mon Mar 04, 06:35
> > >
> > > http://kisskb.ellerman.id.au/kisskb/buildresult/15135537/
> > >
> > > Commit:   Add linux-next specific files for 20240304
> > >           67908bf6954b7635d33760ff6dfc189fc26ccc89
> > > Compiler: m68k-linux-gcc (GCC) 8.5.0 / GNU ld (GNU Binutils) 2.36.1
> > >
> > > Possible errors
> > > ---------------
> > >
> > > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko]=
 undefined!
> > > make[3]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 1
> > > make[2]: *** [Makefile:1871: modpost] Error 2
> > > make[1]: *** [Makefile:240: __sub-make] Error 2
> > > make: *** [Makefile:240: __sub-make] Error 2
> > >
> > > No warnings found in log.
> > > ------------------------------------------------------------------->8=
---
> >
> > The driver is meant for a controller featured in an SoC with a Cortex-A8
> > ARM CPU and less than a GiB/s memory bandwidth.
>=20
> Good, so the hardware cannot possibly need 64-bit pixel clock values ;-)

This is an early patch to convert that function into a framework hook
implementation. HDMI 2.1 has a max TMDS character rate of slightly less
than 6GHz, so larger than 2^32 - 1.

So yes, this driver doesn't need to. The framework does however.

> BTW, doesn't the build fail on arm32, too?

It seems like gcc vs clang plays a role too. I had the same defconfig
building for arm with gcc and reporting the error above with clang. I
didn't look further because there was something to fix indeed.

Maxime

--ba2cnmoytyqarlnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeWgSwAKCRDj7w1vZxhR
xQndAP4hm7WKDSfvUr1OAuA+byAHKabfcMBOAmOIiPdzHz82XAEA7D2tFnMHWIHL
IFc/+TOVt18ZzPG2ws1AqKPXOolwxA4=
=Pk79
-----END PGP SIGNATURE-----

--ba2cnmoytyqarlnv--
