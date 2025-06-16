Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6C6ADB4B8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 17:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F05B10E3D6;
	Mon, 16 Jun 2025 15:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="riJytrYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856A410E3D6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 15:01:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B95806115E;
 Mon, 16 Jun 2025 15:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB1BC4CEEA;
 Mon, 16 Jun 2025 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750086062;
 bh=Bpmy/EuqHJMhahL/U9S3uwv/T4xo7eWLTV//pSU6R1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=riJytrYlTiiYKRZ8GLJjsTBR4ZaA/UwAcuMbdfL9+LXAPnKvXthTLWacK116Nyqy/
 ltQ5PT86aesVVYAXQZ3ZQ1IQ0NxCRnll352bUqb7DHBxNzK+dgz3/4NbdFxG1rQRaD
 Xz5wgNU2FtMhSwlXrbeIoBOWE/OcVD0IUaQjOIf+vjjJosCdfDm3bZTT8tMp5Tg7Rk
 kUjztVKcEoaZc1d/fCiGN/k8p1PJAzar1dZhlOXAhXkqQu1h1pREhkmgcetNYaJbid
 VINH2OttQV62Yqq5wPlNPlhiJ4ndoKbdLEqTIMcd8HO/dqTCtHOL3JcuPFwrHuOA7e
 kG13GQbp4d/vA==
Date: Mon, 16 Jun 2025 17:00:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add naming guidelines
Message-ID: <20250616-pompous-macho-giraffe-ea4dbe@houat>
References: <20250520-dma-buf-heap-names-doc-v1-1-ab31f74809ee@kernel.org>
 <CANDhNCoQ=V5Uk0ThmeHdn20xmUucPb-mjCjX5pbM94EvzGRZMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="wajqzffnzmfie2tr"
Content-Disposition: inline
In-Reply-To: <CANDhNCoQ=V5Uk0ThmeHdn20xmUucPb-mjCjX5pbM94EvzGRZMw@mail.gmail.com>
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


--wajqzffnzmfie2tr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add naming guidelines
MIME-Version: 1.0

On Tue, May 20, 2025 at 07:46:39PM -0700, John Stultz wrote:
> On Tue, May 20, 2025 at 3:00=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > We've discussed a number of times of how some heap names are bad, but
> > not really what makes a good heap name.
> >
> > Let's document what we expect the heap names to look like.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  Documentation/userspace-api/dma-buf-heaps.rst | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentat=
ion/userspace-api/dma-buf-heaps.rst
> > index 535f49047ce6450796bf4380c989e109355efc05..b24618e360a9a9ba0bd8513=
5d8c1760776f1a37f 100644
> > --- a/Documentation/userspace-api/dma-buf-heaps.rst
> > +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> > @@ -21,5 +21,24 @@ following heaps:
> >     usually created either through the kernel commandline through the
> >     `cma` parameter, a memory region Device-Tree node with the
> >     `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` =
or
> >     `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
> >     might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> > +
> > +Naming Convention
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +A good heap name is a name that:
> > +
> > +- Is stable, and won't change from one version to the other;
> > +
> > +- Describes the memory region the heap will allocate from, and will
> > +  uniquely identify it in a given platform;
> > +
> > +- Doesn't use implementation details, such as the allocator;
> > +
> > +- Can describe intended usage.
> > +
>=20
> Thanks again for sending this out. Sorry I've been spotty in some of
> the discussions (I'm really trying to step back from this area).

I wasn't aware, so sorry I keep dragging you into it :)

I guess it's in part due to the historical background, but also because
you've been the only one who answer consistently.

I wonder though, do you need help with the maintenance? We plan to rely
a fair bit on dma-buf heaps to implement cgroup device memory
accounting, so I'd be happy to help if I can.

> I might only suggest you provide a bit more "why" to the list of
> qualities you highlight here, just to communicate more of the
> spirit/philosophy of how these might be judged or reviewed in the
> future.

Ack, I'll do it in the next version.

> > +For example, assuming a platform with a reserved memory region located
> > +at the RAM address 0x42000000, intended to allocate video framebuffers,
> > +and backed by the CMA kernel allocator. Good names would be
> > +`memory@42000000` or `video@42000000`, but `cma-video` wouldn't.
>=20
> The point about avoiding the allocator details, just so I better
> understand the criteria: Would distinguishing from a contiguous pool
> vs non-contiguous in the name be considered ok? As it's a property of
> the buffer returned, and one that is critically important for some
> devices. Or do you intend that to be opaque, and the usage->heap
> mapping logic to provide that itself? (Effectively avoiding folks from
> being able to make potentially problematic assumptions from the name?)
>=20
> Similarly, how would you suggest naming a heap that provides 32bit
> allocations?   Similarly for "protected' allocations, which are being
> proposed?

I'll also add a section about that.

Thanks for the review!
Maxime

--wajqzffnzmfie2tr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFAxpwAKCRAnX84Zoj2+
dthLAX4jXJWTWr23mzrdVjE0G05pksavbCls8/Na9ACf0dSldXY5F3uW5hTQdNtu
ijgSIAoBgJnDB1xrVP0+2TnbO9oBTb0qRamER0Rv9fyAmrCNr9bleaw73e1XDvNG
e3HBfB7IHQ==
=bFVQ
-----END PGP SIGNATURE-----

--wajqzffnzmfie2tr--
