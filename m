Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19802870069
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BA410E408;
	Mon,  4 Mar 2024 11:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Od6ndyT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F8C10E224
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 11:28:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DAF8C60EB3;
 Mon,  4 Mar 2024 11:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08565C433C7;
 Mon,  4 Mar 2024 11:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709551722;
 bh=or2T4offzEJ0CeMUlNFZZpSiTyyFitZkNk9jwiLFRK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Od6ndyT7ylv+7TEzrS8j958J4csrcec8FRIw7OBTQts/NviexhqeLOFTx4R12ljuL
 iwHWeBlVji12HBhf6bRNj4u12aiBZ28Al3Kohn4OzfohMfPPLxnPs8zD62a8pEYwmF
 ZyWdqCqx+GUachME3oQ4mdmnLbfai31LS6l+OKeQMbNtx8k+Q330vY2t9UQJDOpsVJ
 djzcX5svtSJhXinZ8dfhYqCqLVf1fzfjTjE6dpbIsdW07bwZJsExf4dM3roVWv0GlG
 yYsGLVYe0SNDSh9CAXaj+XhR9UBEFViaR41rZ0hIQeYPnCBEfD4f3FJo97szqo5zX4
 6kBn5u2Tyc38A==
Date: Mon, 4 Mar 2024 12:28:39 +0100
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
Message-ID: <20240304-shrewd-encouraging-marmoset-54ffb2@houat>
References: <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <CABXOdTeT2ip1uS2EG2w8pW7254Tnd=ZDNz-KC61-G-yqDTVgJA@mail.gmail.com>
 <269232e6-41c9-4aa1-9320-662beabcd69b@infradead.org>
 <CAMuHMdXuXV9WV3aANFTteuP8Q3JY6R5OWsVBedGOP7e_JguxqA@mail.gmail.com>
 <CAMuHMdWi069YAvOoXe7sHJ_o702tY4tDQgL3sfApPR3aCnZboQ@mail.gmail.com>
 <20240304-transparent-oriole-of-honeydew-f4174e@houat>
 <CAMuHMdXyvcyXw8eXc2MONNaBYYGpVdnPh2h3T=QV38MEUzhu9A@mail.gmail.com>
 <20240304-dangerous-mastiff-of-fury-1fac5c@houat>
 <CAMuHMdV2HkYjowOZBgSZQ3N01UeUTnyv5kjx-82C9YJ+dsgsxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ymv3tdq2u4ztffpw"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV2HkYjowOZBgSZQ3N01UeUTnyv5kjx-82C9YJ+dsgsxQ@mail.gmail.com>
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


--ymv3tdq2u4ztffpw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 12:12:47PM +0100, Geert Uytterhoeven wrote:
> Hi Maxime,
>=20
> On Mon, Mar 4, 2024 at 11:20=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Mon, Mar 04, 2024 at 11:07:22AM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Mar 4, 2024 at 10:15=E2=80=AFAM Maxime Ripard <mripard@kernel=
=2Eorg> wrote:
> > > > On Mon, Mar 04, 2024 at 09:12:38AM +0100, Geert Uytterhoeven wrote:
> > > > > On Sun, Mar 3, 2024 at 10:30=E2=80=AFAM Geert Uytterhoeven <geert=
@linux-m68k.org> wrote:
> > > > > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/sun4i/sun4i-drm-hdmi=
=2Eko] undefined!
> > > > > make[3]: *** [scripts/Makefile.modpost:145: Module.symvers] Error=
 1
> > > > > make[2]: *** [Makefile:1871: modpost] Error 2
> > > > > make[1]: *** [Makefile:240: __sub-make] Error 2
> > > > > make: *** [Makefile:240: __sub-make] Error 2
> > > > >
> > > > > No warnings found in log.
> > > > > -----------------------------------------------------------------=
-->8---
> > > >
> > > > The driver is meant for a controller featured in an SoC with a Cort=
ex-A8
> > > > ARM CPU and less than a GiB/s memory bandwidth.
> > >
> > > Good, so the hardware cannot possibly need 64-bit pixel clock values =
;-)
> >
> > This is an early patch to convert that function into a framework hook
> > implementation. HDMI 2.1 has a max TMDS character rate of slightly less
> > than 6GHz, so larger than 2^32 - 1.
> >
> > So yes, this driver doesn't need to. The framework does however.
>=20
> That's gonna be interesting, as the Common Clock Framework does not
> support 64-bit clock rates on 32-bit platforms yet...

As far as KMS goes, it doesn't really matter. The TMDS character rate
doesn't need to be backed by a CCF clock.

And realistically speaking, I don't expect any 32 bit platform to
support HDMI 2.1.

Maxime

--ymv3tdq2u4ztffpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZeWwZwAKCRDj7w1vZxhR
xaKuAP9qEN4vzS30W73MSnW/4xHYdwyadBOylpEz37phu0ydjwEA0XJSmLO2W7Ui
31PIhTlZnimQzWdsNxR4U30hC+EXvQA=
=FW8N
-----END PGP SIGNATURE-----

--ymv3tdq2u4ztffpw--
