Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F84C7FD104
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 09:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDF710E05D;
	Wed, 29 Nov 2023 08:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EFF10E05D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 08:35:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id AF277B835BF;
 Wed, 29 Nov 2023 08:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C97AC433C8;
 Wed, 29 Nov 2023 08:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701246926;
 bh=UyWVj6bbpMmgMhEJPGFtZp+drl9Kr0KS/AbbpRwNBTs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QNT3LWMCxoKcbCmQvEchFQWIOvU1Jm4SCQYnCDeefZD7g6sO1bHr9rNGbKeewfuCg
 TfbOV8W4DCwZFd1pZyfX0hc+YKzvVas5N/P6RPIdkWDWen5pW57yQ5D815dqZZqSsS
 ptq49cTrMR8QGvp6gEmUJG6uwmFMeKH7BmL33BAVaVQuFSWkZ/fXHJgq1I8B7FDqrB
 P/F27eJt3Ui0RSaWTw8LEySbvNwTU41Bmoj8XroISmKurYBrHrVQ3Hw3iKghpoArU7
 MYJGZoUfN6sPFG8n6dnLfIIearJsr1sdefwnKeLXQHeBu8o/mTuG4HlVunXKi5wbxa
 nboghSzhIJ9qQ==
Date: Wed, 29 Nov 2023 09:35:23 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/imagination: DRM_POWERVR should depend on ARCH_K3
Message-ID: <7hee65pmdl5pajm2kgqld22xfi4iox4s2psswu2mdlfk6u6f7x@w4ecogdx6uj6>
References: <b9360c2044a1001b9a5bcb5914611711d040d4fe.1701196029.git.geert+renesas@glider.be>
 <87o7fdbszs.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="753wc6rfmeqxfjjh"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUhuO++ZSxh+_TX_6DHHxjPYY20jTppbNZ4FnuBvxxinQ@mail.gmail.com>
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


--753wc6rfmeqxfjjh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 28, 2023 at 08:16:18PM +0100, Geert Uytterhoeven wrote:
> On Tue, Nov 28, 2023 at 8:03=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
> > Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > > The Imagination Technologies PowerVR Series 6 GPU is currently only
> > > supported on Texas Instruments K3 AM62x SoCs.  Hence add a dependency=
 on
> > > ARCH_K3, to prevent asking the user about this driver when configurin=
g a
> > > kernel without Texas Instruments K3 Multicore SoC support.
> > >
> > > Fixes: 4babef0708656c54 ("drm/imagination: Add skeleton PowerVR drive=
r")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> >
> > Indeed. Although I wonder what is the supposed policy since for example
> > the DRM_PANFROST symbol only depends on ARM || ARM64 and others such as
>=20
> I think ARM Mali is sufficiently ubiquitous on ARM/ARM64 systems to
> have just an ARM/ARM64 dependency...
>=20
> > DRM_ETNAVIV don't even have an SoC or architecture dependency.
>=20
> Vivante GPUs are found in DTS files on at least 4 architectures.
> Might be worthwhile to add some dependencies, though...
>=20
> > In any case, I agree with you that restricting to only K3 makes sense.
>=20
> I am looking forward to adding || SOC_AM33XX || ARCH_RENESAS || ...,
> eventually ;-)

I disagree. This is to handle a generic IP, just like panfrost, lima, or
etnaviv, and we certaintly don't want to maintain the Kconfig list of
every possible architecture and SoC family it might or might not be
found.

GPUs supposed to be handled are spread across 4 architectures (x86,
riscv, arm, arm64, mips?), and in arm/arm64 alone we have at least 5
platforms that might use it (allwinner, ti, mediatek, renesas, rockchip)

It didn't make sense for panfrost, or etnaviv. It doesn't make sense for
that driver either. Especially for something that olddefconfig can
handle just fine.

Maxime

--753wc6rfmeqxfjjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWb3ygAKCRDj7w1vZxhR
xSzQAP9lznhhHr2F5gTKfl3cW+5jN5/LKK8tc/SurLuznqLJ1wD/fcF+ZyviLO/O
xBOmROvOixmLQ2KcKiTO1gbodbPMqQE=
=7EPk
-----END PGP SIGNATURE-----

--753wc6rfmeqxfjjh--
