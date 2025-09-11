Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F3B5297C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630BC10EA22;
	Thu, 11 Sep 2025 07:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kNGHzc5L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7692610E2FF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:01:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1443A44635;
 Thu, 11 Sep 2025 07:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A72C4CEF1;
 Thu, 11 Sep 2025 07:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757574086;
 bh=qr122yp8JUYBZU96I18Z8ELkl5DxLXHRqTyQLe7CWAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kNGHzc5LShxDoby6w+5B0rArOpeaiVE7rVvfrO816zAUBMrrpPJ0dUr2xaf4QLWhy
 mY+qNgBlxPEy3zXyUFdDDnJB7hi5Du0P4X6pW0kdRkHGArzrm9yHV3/MYgsA8NDNol
 kmc10a26FwkUmvRqIHSernvfMzY0CdmAsh3Czgj8l9W7P7M98o4M3GihQZm0juWDRk
 toFJKJ3PZMpypAvEJVOGELJQc633e95pfQW2Kg002tmNI4Q1oSKL6qki07jMnup1Ke
 H+qB+p4h7SiSVsY56tuJxfXBJm07+J0rYDESBrULBjJSENWLQsudeVU2Kao2Bgs1zO
 ZqAhYn49Hv17Q==
Date: Thu, 11 Sep 2025 09:01:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 0/5] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
Message-ID: <20250911-didactic-authentic-cockle-e6d5fc@houat>
References: <20250721-dma-buf-ecc-heap-v7-0-031836e1a942@kernel.org>
 <20250826-vagabond-catfish-of-courtesy-cbfa76@houat>
 <20250910-vigorous-attractive-gorilla-af6fec@houat>
 <CABdmKX29ftpNro+d=Ce6JGoMaG0UQeBbzL7DXiBkGkC0nwacTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mvqneghb5gn2pldr"
Content-Disposition: inline
In-Reply-To: <CABdmKX29ftpNro+d=Ce6JGoMaG0UQeBbzL7DXiBkGkC0nwacTQ@mail.gmail.com>
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


--mvqneghb5gn2pldr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 0/5] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
MIME-Version: 1.0

Hi TJ,

On Wed, Sep 10, 2025 at 01:44:45PM -0700, T.J. Mercier wrote:
> On Wed, Sep 10, 2025 at 12:33=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> >
> > On Tue, Aug 26, 2025 at 09:36:03AM +0200, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Mon, Jul 21, 2025 at 01:17:29PM +0200, Maxime Ripard wrote:
> > > > Here's another attempt at supporting user-space allocations from a
> > > > specific carved-out reserved memory region.
> > > >
> > > > The initial problem we were discussing was that I'm currently worki=
ng on
> > > > a platform which has a memory layout with ECC enabled. However, ena=
bling
> > > > the ECC has a number of drawbacks on that platform: lower performan=
ce,
> > > > increased memory usage, etc. So for things like framebuffers, the
> > > > trade-off isn't great and thus there's a memory region with ECC dis=
abled
> > > > to allocate from for such use cases.
> > > >
> > > > After a suggestion from John, I chose to first start using heap
> > > > allocations flags to allow for userspace to ask for a particular ECC
> > > > setup. This is then backed by a new heap type that runs from reserv=
ed
> > > > memory chunks flagged as such, and the existing DT properties to sp=
ecify
> > > > the ECC properties.
> > > >
> > > > After further discussion, it was considered that flags were not the
> > > > right solution, and relying on the names of the heaps would be enou=
gh to
> > > > let userspace know the kind of buffer it deals with.
> > > >
> > > > Thus, even though the uAPI part of it had been dropped in this seco=
nd
> > > > version, we still needed a driver to create heaps out of carved-out=
 memory
> > > > regions. In addition to the original usecase, a similar driver can =
be
> > > > found in BSPs from most vendors, so I believe it would be a useful
> > > > addition to the kernel.
> > > >
> > > > Some extra discussion with Rob Herring [1] came to the conclusion t=
hat
> > > > some specific compatible for this is not great either, and as such =
an
> > > > new driver probably isn't called for either.
> > > >
> > > > Some other discussions we had with John [2] also dropped some hints=
 that
> > > > multiple CMA heaps might be a good idea, and some vendors seem to do
> > > > that too.
> > > >
> > > > So here's another attempt that doesn't affect the device tree at al=
l and
> > > > will just create a heap for every CMA reserved memory region.
> > > >
> > > > It also falls nicely into the current plan we have to support cgrou=
ps in
> > > > DRM/KMS and v4l2, which is an additional benefit.
> > > >
> > > > Let me know what you think,
> > > > Maxime
> > >
> > > Any chance we can get this merged?
> >
> > Guys, can we move forward on this?
> >
> > Maxime
>=20
> Hi Maxime,
>=20
> Sorry I've been MIA the last couple of months.
>=20
> The docs for the "reusable" property say, "device driver(s) owning the
> region need to be able to reclaim it back", but how can a driver
> reclaim memory backing a dmabuf, since pages allocated for a dmabuf
> aren't necessarily movable. Couldn't a user allocate all of it, and
> refuse to close those dmabufs?

I guess, but how is that any different than what we're doing on the
default allocator already?

It also has to be reusable, and will not be able to reclaim any memory
allocated through the heap.

> I backported this to 6.6 and ran it on a Pixel. While there are
> already similar out-of-tree dmabuf heap drivers that expose heaps for
> these reserved regions, they do more than just cma_alloc (multiple
> flavors of buffer securing, use case specific alignment and padding,
> and slightly different allocation strategies) so I don't think this
> series would allow us to completely drop the custom heap code, but
> it's a nice start.

Thanks for testing, and I totally expect more heaps coming for things
like protected memory, but it should indeed reduce the number of heap
drivers needed going forward.

> Does the cgroup part come in because the plan is to add charging in
> cma_heap.c?

Yes, and the system heap as well.

Maxime

--mvqneghb5gn2pldr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaMJzxAAKCRAnX84Zoj2+
dsvHAX9IpZOMjeU0ynWChRbSjBVdeZtylN7gZQL2xiSKdre2cCOs+EzPryzJzsTk
tRNxMScBfAwmOazIjwKlseNgI+HDT4rryBoWdzpYERPwpsG4vLSlAqtaiPiPmf41
ekyA/2h0Sg==
=POxF
-----END PGP SIGNATURE-----

--mvqneghb5gn2pldr--
