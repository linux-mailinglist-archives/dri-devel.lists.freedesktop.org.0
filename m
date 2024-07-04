Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ABA9275E2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 14:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D6A10EAB6;
	Thu,  4 Jul 2024 12:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j7Fe/FvY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3559910EAB6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 12:24:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 46B22626BA;
 Thu,  4 Jul 2024 12:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81C7C4AF07;
 Thu,  4 Jul 2024 12:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720095892;
 bh=3b40u6v5Fy9XpFfO4zO7dcgm2QhDnwRA7H1kJYZa6KA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j7Fe/FvY0DkICipoXNHJvqk1H7Z1fodo2GSY1Dyf6Ej53sR+86873wcmFiHOZSAAw
 obEdQoiZS8eBs4bY259a78GTsT7RksDGZsjVU9vO8BTjWVHpSVDOxNCBXvb1SFOc+i
 FZAVhBKzekCJZVyqn3CFSeZHGeyozeCgxLHN/C7JN6sQ0dcv7o160RDur20/2uh/xI
 PDbYjrAUkB+0bweOUOT0nPR9CYsE0IkIs3z0UdxPJY785rFCZnRsHpxcRMQEXgLnnz
 lwV+WRvlAzMvaxOjr1pS8Y1MtHS9m1pkmjaWtHMbu4TI4JTMWbKcqNzTAxjhm3GN6G
 HvHOeTN4CNtLQ==
Date: Thu, 4 Jul 2024 14:24:49 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: John Stultz <jstultz@google.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 0/8] dma-buf: heaps: Support carved-out heaps and ECC
 related-flags
Message-ID: <20240704-therapeutic-maroon-coucal-f61a63@houat>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
 <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
 <20240628-resilient-resolute-rook-0fc531@houat>
 <3e37rhrcqogix5obsu2gq7jar7bcoamx4bbd376az5z3zdkwvm@jstirwdl5efm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cjxzfvvdyt3vz7rd"
Content-Disposition: inline
In-Reply-To: <3e37rhrcqogix5obsu2gq7jar7bcoamx4bbd376az5z3zdkwvm@jstirwdl5efm>
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


--cjxzfvvdyt3vz7rd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 04:42:35PM GMT, Thierry Reding wrote:
> On Fri, Jun 28, 2024 at 03:08:46PM GMT, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Fri, Jun 28, 2024 at 01:29:17PM GMT, Thierry Reding wrote:
> > > On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> > > > On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > > > > On Thu, May 16, 2024 at 3:56=E2=80=AFAM Daniel Vetter <daniel@ffw=
ll.ch> wrote:
> > > > > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > > > > > > But it makes me a little nervous to add a new generic allocat=
ion flag
> > > > > > > for a feature most hardware doesn't support (yet, at least). =
So it's
> > > > > > > hard to weigh how common the actual usage will be across all =
the
> > > > > > > heaps.
> > > > > > >
> > > > > > > I apologize as my worry is mostly born out of seeing vendors =
really
> > > > > > > push opaque feature flags in their old ion heaps, so in provi=
ding a
> > > > > > > flags argument, it was mostly intended as an escape hatch for
> > > > > > > obviously common attributes. So having the first be something=
 that
> > > > > > > seems reasonable, but isn't actually that common makes me fre=
t some.
> > > > > > >
> > > > > > > So again, not an objection, just something for folks to stew =
on to
> > > > > > > make sure this is really the right approach.
> > > > > >
> > > > > > Another good reason to go with full heap names instead of opaqu=
e flags on
> > > > > > existing heaps is that with the former we can use symlinks in s=
ysfs to
> > > > > > specify heaps, with the latter we need a new idea. We haven't y=
et gotten
> > > > > > around to implement this anywhere, but it's been in the dma-buf=
/heap todo
> > > > > > since forever, and I like it as a design approach. So would be =
a good idea
> > > > > > to not toss it. With that display would have symlinks to cma-ec=
c and cma,
> > > > > > and rendering maybe cma-ecc, shmem, cma heaps (in priority orde=
r) for a
> > > > > > SoC where the display needs contig memory for scanout.
> > > > >=20
> > > > > So indeed that is a good point to keep in mind, but I also think =
it
> > > > > might re-inforce the choice of having ECC as a flag here.
> > > > >=20
> > > > > Since my understanding of the sysfs symlinks to heaps idea is abo=
ut
> > > > > being able to figure out a common heap from a collection of devic=
es,
> > > > > it's really about the ability for the driver to access the type of
> > > > > memory. If ECC is just an attribute of the type of memory (as in =
this
> > > > > patch series), it being on or off won't necessarily affect
> > > > > compatibility of the buffer with the device.  Similarly "uncached"
> > > > > seems more of an attribute of memory type and not a type itself.
> > > > > Hardware that can access non-contiguous "system" buffers can acce=
ss
> > > > > uncached system buffers.
> > > >=20
> > > > Yeah, but in graphics there's a wide band where "shit performance" =
is
> > > > defacto "not useable (as intended at least)".
> > > >=20
> > > > So if we limit the symlink idea to just making sure zero-copy acces=
s is
> > > > possible, then we might not actually solve the real world problem w=
e need
> > > > to solve. And so the symlinks become somewhat useless, and we need =
to
> > > > somewhere encode which flags you need to use with each symlink.
> > > >=20
> > > > But I also see the argument that there's a bit a combinatorial expl=
osion
> > > > possible. So I guess the question is where we want to handle it ...
> > >=20
> > > Sorry for jumping into this discussion so late. But are we really
> > > concerned about this combinatorial explosion in practice? It may be
> > > theoretically possible to create any combination of these, but do we
> > > expect more than a couple of heaps to exist in any given system?
> >=20
> > I don't worry too much about the number of heaps available in a given
> > system, it would indeed be fairly low.
> >=20
> > My concern is about the semantics combinatorial explosion. So far, the
> > name has carried what semantics we were supposed to get from the buffer
> > we allocate from that heap.
> >=20
> > The more variations and concepts we'll have, the more heap names we'll
> > need, and with confusing names since we wouldn't be able to change the
> > names of the heaps we already have.
>=20
> What I was trying to say is that none of this matters if we make these
> names opaque. If these names are contextual for the given system it
> doesn't matter what the exact capabilities are. It only matters that
> their purpose is known and that's what applications will be interested
> in.

If the names are opaque, and we don't publish what the exact
capabilities are, how can an application figure out which heap to use in
the first place?

> > > Would it perhaps make more sense to let a platform override the heap
> > > name to make it more easily identifiable? Maybe this is a naive
> > > assumption, but aren't userspace applications and drivers not primari=
ly
> > > interested in the "type" of heap rather than whatever specific flags
> > > have been set for it?
> >=20
> > I guess it depends on what you call the type of a heap. Where we
> > allocate the memory from, sure, an application won't care about that.
> > How the buffer behaves on the other end is definitely something
> > applications are going to be interested in though.
>=20
> Most of these heaps will be very specific, I would assume.

We don't have any specific heap upstream at the moment, only generic
ones.

> For example a heap that is meant to be protected for protected video
> decoding is both going to be created in such a way as to allow that
> use-case (i.e. it doesn't make sense for it to be uncached, for
> example) and it's also not going to be useful for any other use-case
> (i.e. there's no reason to use that heap for GPU jobs or networking,
> or whatever).

Right. But also, libcamera has started to use dma-heaps to allocate
dma-capable buffers and do software processing on it before sending it
to some hardware controller.

Caches are critical here, and getting a non-cacheable buffer would be
a clear regression.

How can it know which heap to allocate from on a given platform?

Similarly with the ECC support we started that discussion with. ECC will
introduce a significant performance cost. How can a generic application,
such as a compositor, will know which heap to allocate from without:

a) Trying to bundle up a list of heaps for each platform it might or
   might not run

b) and handling the name difference between BSPs and mainline.

If some hardware-specific applications / middleware want to take a
shortcut and use the name, that's fine. But we need to find a way for
generic applications to discover which heap is best suited for their
needs without the name.

> > And if we allow any platform to change a given heap name, then a generic
> > application won't be able to support that without some kind of
> > platform-specific configuration.
>=20
> We could still standardize on common use-cases so that applications
> would know what heaps to allocate from. But there's also no need to
> arbitrarily restrict this. For example there could be cases that are
> very specific to a particular platform and which just doesn't exist
> anywhere else. Platform designers could then still use this mechanism to
> define that very particular heap and have a very specialized userspace
> application use that heap for their purpose.

We could just add a different capabitily flag to make sure those would
get ignored.

> > > For example, if an applications wants to use a protected buffer, the
> > > application doesn't (and shouldn't need to) care about whether the he=
ap
> > > for that buffer supports ECC or is backed by CMA. All it really needs=
 to
> > > know is that it's the system's "protected" heap.
> >=20
> > I mean... "protected" very much means backed by CMA already, it's pretty
> > much the only thing we document, and we call it as such in Kconfig.
>=20
> Well, CMA is really just an implementation detail, right? It doesn't
> make sense to advertise that to anything outside the kernel. Maybe it's
> an interesting fact that buffers allocated from these heaps will be
> physically contiguous?

CMA itself might be an implementation detail, but it's still right there
in the name on ARM.

And being able to get physically contiguous buffers is critical on
platforms without an IOMMU.

> In the majority of cases that's probably not even something that
> matters because we get a DMA-BUF anyway and we can map that any way we
> want.
>
> Irrespective of that, physically contigous buffers could be allocated in
> any number of ways, CMA is just a convenient implementation of one such
> allocator.
>=20
> > But yeah, I agree that being backed by CMA is probably not what an
> > application cares about (and we even have might some discussions about
> > that), but if the ECC protection comes at a performance cost then it
> > will very much care about it. Or if it comes with caches enabled or not.
>=20
> True, no doubt about that. However, I'm saying there may be advantages
> in hiding all of this from applications. Let's say we're trying to
> implement video decoding. We can create a special "protected-video" heap
> that is specifically designed to allocate encrypted/protected scanout
> buffers from.
>=20
> When you design that system, you would most certainly not enable ECC
> protection on that heap because it leads to bad performance. You would
> also want to make sure that all of the buffers in that heap are cached
> and whatever other optimizations your chip may provide.
>=20
> Your application doesn't have to care about this, though, because it can
> simply look for a heap named "protected-video" and allocate buffers from
> it.

I mean, I disagree. Or rather, in an environment where you have a system
architect, and the application is targeted for a particular system only,
and where "protected-video" means whatever the team decided in general,
yeah, that works.

So, in a BSP or Android, that works fine.

On a mainline based system, with generic stacks like libcamera, it just
doesn't fly anymore.

Let's use the two heaps we currently support: their name isn't stable
across architectures, nobody ever documented the set of attributes that
particular heap has, and since it's not documented, good luck trying to
avoid regressions.

So, today, with a very limited number of heaps and no vendor involvement
so far, the "let's just use the name" policy doesn't work already.

Maxime

--cjxzfvvdyt3vz7rd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZoaUkAAKCRDj7w1vZxhR
xXADAQCgqah3v2QYITrpPKh5bzDxBC1BhjxqRAsqI12N+CX4AgD8DJw0bMiupQN+
a6V6YFBeSup3/JhldqCEsMkeHmT7Pw4=
=Zj5I
-----END PGP SIGNATURE-----

--cjxzfvvdyt3vz7rd--
