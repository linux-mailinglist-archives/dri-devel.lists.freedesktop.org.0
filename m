Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266A592D14A
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5460510E76D;
	Wed, 10 Jul 2024 12:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lkpzyrZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4888C10E76D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:10:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E897FCE0D4E;
 Wed, 10 Jul 2024 12:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC93C32781;
 Wed, 10 Jul 2024 12:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720613412;
 bh=3JRaWiuTKkV+VsGA4zTpqff/hAJLH/+QJuk9z9ikZWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lkpzyrZMl7CYYWQxQ5sAP+J0NE0w9LunDTPOKv1fzrsDVBEY3r5Cu2y5F5mM9uV6A
 tmdB+AX8JgsLH2nheJqGnk1qYCYVQYKzdFSjucaVvqnzODXFaKwq9bJ0Y2+01Z8Q2q
 uXhJgTwMKtDozKiiBwcH59tdhC4l7V5RS8x/OGMBbiUMgBqpN72PgM0dbZXVfj5dwB
 kdW9LRb3hEKrNPXW5uN618fOZjFa49XWJIias6aOOGAyr3EXG//Op3EV1gZ0gTpBth
 6cZttxaF0HC0tyHRX41bd/Dmai1Lf3jaGV36U/NngGPzSP/tggfQMvI5b3kRj3BHEO
 29zezjPpu0fsA==
Date: Wed, 10 Jul 2024 14:10:09 +0200
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
Message-ID: <20240710-cocky-lemon-seriema-86cccf@houat>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
 <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
 <20240628-resilient-resolute-rook-0fc531@houat>
 <3e37rhrcqogix5obsu2gq7jar7bcoamx4bbd376az5z3zdkwvm@jstirwdl5efm>
 <20240704-therapeutic-maroon-coucal-f61a63@houat>
 <wapv4gl2se34tq3isycb7bui5xi3x6kxjqtyz24qhjipnkbuqu@sv4w2crksuq5>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fw2ggjlsionxpe6b"
Content-Disposition: inline
In-Reply-To: <wapv4gl2se34tq3isycb7bui5xi3x6kxjqtyz24qhjipnkbuqu@sv4w2crksuq5>
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


--fw2ggjlsionxpe6b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 05, 2024 at 04:31:34PM GMT, Thierry Reding wrote:
> On Thu, Jul 04, 2024 at 02:24:49PM GMT, Maxime Ripard wrote:
> > On Fri, Jun 28, 2024 at 04:42:35PM GMT, Thierry Reding wrote:
> > > On Fri, Jun 28, 2024 at 03:08:46PM GMT, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Fri, Jun 28, 2024 at 01:29:17PM GMT, Thierry Reding wrote:
> > > > > On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> > > > > > On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > > > > > > On Thu, May 16, 2024 at 3:56=E2=80=AFAM Daniel Vetter <daniel=
@ffwll.ch> wrote:
> > > > > > > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > > > > > > > > But it makes me a little nervous to add a new generic all=
ocation flag
> > > > > > > > > for a feature most hardware doesn't support (yet, at leas=
t). So it's
> > > > > > > > > hard to weigh how common the actual usage will be across =
all the
> > > > > > > > > heaps.
> > > > > > > > >
> > > > > > > > > I apologize as my worry is mostly born out of seeing vend=
ors really
> > > > > > > > > push opaque feature flags in their old ion heaps, so in p=
roviding a
> > > > > > > > > flags argument, it was mostly intended as an escape hatch=
 for
> > > > > > > > > obviously common attributes. So having the first be somet=
hing that
> > > > > > > > > seems reasonable, but isn't actually that common makes me=
 fret some.
> > > > > > > > >
> > > > > > > > > So again, not an objection, just something for folks to s=
tew on to
> > > > > > > > > make sure this is really the right approach.
> > > > > > > >
> > > > > > > > Another good reason to go with full heap names instead of o=
paque flags on
> > > > > > > > existing heaps is that with the former we can use symlinks =
in sysfs to
> > > > > > > > specify heaps, with the latter we need a new idea. We haven=
't yet gotten
> > > > > > > > around to implement this anywhere, but it's been in the dma=
-buf/heap todo
> > > > > > > > since forever, and I like it as a design approach. So would=
 be a good idea
> > > > > > > > to not toss it. With that display would have symlinks to cm=
a-ecc and cma,
> > > > > > > > and rendering maybe cma-ecc, shmem, cma heaps (in priority =
order) for a
> > > > > > > > SoC where the display needs contig memory for scanout.
> > > > > > >=20
> > > > > > > So indeed that is a good point to keep in mind, but I also th=
ink it
> > > > > > > might re-inforce the choice of having ECC as a flag here.
> > > > > > >=20
> > > > > > > Since my understanding of the sysfs symlinks to heaps idea is=
 about
> > > > > > > being able to figure out a common heap from a collection of d=
evices,
> > > > > > > it's really about the ability for the driver to access the ty=
pe of
> > > > > > > memory. If ECC is just an attribute of the type of memory (as=
 in this
> > > > > > > patch series), it being on or off won't necessarily affect
> > > > > > > compatibility of the buffer with the device.  Similarly "unca=
ched"
> > > > > > > seems more of an attribute of memory type and not a type itse=
lf.
> > > > > > > Hardware that can access non-contiguous "system" buffers can =
access
> > > > > > > uncached system buffers.
> > > > > >=20
> > > > > > Yeah, but in graphics there's a wide band where "shit performan=
ce" is
> > > > > > defacto "not useable (as intended at least)".
> > > > > >=20
> > > > > > So if we limit the symlink idea to just making sure zero-copy a=
ccess is
> > > > > > possible, then we might not actually solve the real world probl=
em we need
> > > > > > to solve. And so the symlinks become somewhat useless, and we n=
eed to
> > > > > > somewhere encode which flags you need to use with each symlink.
> > > > > >=20
> > > > > > But I also see the argument that there's a bit a combinatorial =
explosion
> > > > > > possible. So I guess the question is where we want to handle it=
 ...
> > > > >=20
> > > > > Sorry for jumping into this discussion so late. But are we really
> > > > > concerned about this combinatorial explosion in practice? It may =
be
> > > > > theoretically possible to create any combination of these, but do=
 we
> > > > > expect more than a couple of heaps to exist in any given system?
> > > >=20
> > > > I don't worry too much about the number of heaps available in a giv=
en
> > > > system, it would indeed be fairly low.
> > > >=20
> > > > My concern is about the semantics combinatorial explosion. So far, =
the
> > > > name has carried what semantics we were supposed to get from the bu=
ffer
> > > > we allocate from that heap.
> > > >=20
> > > > The more variations and concepts we'll have, the more heap names we=
'll
> > > > need, and with confusing names since we wouldn't be able to change =
the
> > > > names of the heaps we already have.
> > >=20
> > > What I was trying to say is that none of this matters if we make these
> > > names opaque. If these names are contextual for the given system it
> > > doesn't matter what the exact capabilities are. It only matters that
> > > their purpose is known and that's what applications will be interested
> > > in.
> >=20
> > If the names are opaque, and we don't publish what the exact
> > capabilities are, how can an application figure out which heap to use in
> > the first place?
>=20
> This would need to be based on conventions. The idea is to standardize
> on a set of names for specific, well-known use-cases.

How can undocumented, unenforced, conventions can work in practice?

> > > > > Would it perhaps make more sense to let a platform override the h=
eap
> > > > > name to make it more easily identifiable? Maybe this is a naive
> > > > > assumption, but aren't userspace applications and drivers not pri=
marily
> > > > > interested in the "type" of heap rather than whatever specific fl=
ags
> > > > > have been set for it?
> > > >=20
> > > > I guess it depends on what you call the type of a heap. Where we
> > > > allocate the memory from, sure, an application won't care about tha=
t.
> > > > How the buffer behaves on the other end is definitely something
> > > > applications are going to be interested in though.
> > >=20
> > > Most of these heaps will be very specific, I would assume.
> >=20
> > We don't have any specific heap upstream at the moment, only generic
> > ones.
>=20
> But we're trying to add more specific ones, right?
>=20
> > > For example a heap that is meant to be protected for protected video
> > > decoding is both going to be created in such a way as to allow that
> > > use-case (i.e. it doesn't make sense for it to be uncached, for
> > > example) and it's also not going to be useful for any other use-case
> > > (i.e. there's no reason to use that heap for GPU jobs or networking,
> > > or whatever).
> >=20
> > Right. But also, libcamera has started to use dma-heaps to allocate
> > dma-capable buffers and do software processing on it before sending it
> > to some hardware controller.
> >=20
> > Caches are critical here, and getting a non-cacheable buffer would be
> > a clear regression.
>=20
> I understand that. My point is that maybe we shouldn't try to design a
> complex mechanism that allows full discoverability of everything that a
> heap supports or is capable of. Instead if the camera has specific
> requirements, it could look for a heap named "camera". Or if it can
> share a heap with other multimedia devices, maybe call the heap
> "multimedia".

That kind of vague categorization is pointless though. Some criteria are
about hardwar (ie, can the device access it in the first place?), so is
purely about a particular context and policy and will change from one
application to the other.

A camera app using an ISP will not care about caches. A software
rendering library will. A compositor will not want ECC. A safety
component probably will.

All of them are "multimedia".

We *need* to be able to differentiate policy from hardware requirements.

> The idea is that heaps for these use-cases are quite specific, so you
> would likely not find an arbitrary number of processes try to use the
> same heap.

Some of them are specific, some of them aren't.

> > How can it know which heap to allocate from on a given platform?
> >=20
> > Similarly with the ECC support we started that discussion with. ECC will
> > introduce a significant performance cost. How can a generic application,
> > such as a compositor, will know which heap to allocate from without:
> >=20
> > a) Trying to bundle up a list of heaps for each platform it might or
> >    might not run
> >=20
> > b) and handling the name difference between BSPs and mainline.
>=20
> Obviously some standardization of heap names is a requirement here,
> otherwise such a proposal does indeed not make sense.
>=20
> > If some hardware-specific applications / middleware want to take a
> > shortcut and use the name, that's fine. But we need to find a way for
> > generic applications to discover which heap is best suited for their
> > needs without the name.
>=20
> You can still have fairly generic names for heaps. If you want protected
> content, you could try to use a standard "video-protected" heap. If you
> need ECC protected memory, maybe you want to allocate from a heap named
> "safety", or whatever.

And if I need cacheable, physically contiguous, "multimedia" buffers from
ECC protected memory?

> > > > And if we allow any platform to change a given heap name, then a ge=
neric
> > > > application won't be able to support that without some kind of
> > > > platform-specific configuration.
> > >=20
> > > We could still standardize on common use-cases so that applications
> > > would know what heaps to allocate from. But there's also no need to
> > > arbitrarily restrict this. For example there could be cases that are
> > > very specific to a particular platform and which just doesn't exist
> > > anywhere else. Platform designers could then still use this mechanism=
 to
> > > define that very particular heap and have a very specialized userspace
> > > application use that heap for their purpose.
> >=20
> > We could just add a different capabitily flag to make sure those would
> > get ignored.
>=20
> Sure you can do all of this with a myriad of flags. But again, I'm
> trying to argue that we may not need this additional complexity. In a
> typical system, how many heaps do you encounter? You may need a generic
> one and then perhaps a handful specific ones? Or do you need more?

It's not a matter of the number of heaps, but what they provide.

> > > > > For example, if an applications wants to use a protected buffer, =
the
> > > > > application doesn't (and shouldn't need to) care about whether th=
e heap
> > > > > for that buffer supports ECC or is backed by CMA. All it really n=
eeds to
> > > > > know is that it's the system's "protected" heap.
> > > >=20
> > > > I mean... "protected" very much means backed by CMA already, it's p=
retty
> > > > much the only thing we document, and we call it as such in Kconfig.
> > >=20
> > > Well, CMA is really just an implementation detail, right? It doesn't
> > > make sense to advertise that to anything outside the kernel. Maybe it=
's
> > > an interesting fact that buffers allocated from these heaps will be
> > > physically contiguous?
> >=20
> > CMA itself might be an implementation detail, but it's still right there
> > in the name on ARM.
>=20
> That doesn't mean we can do something more useful going forward (and
> perhaps symlink for backwards-compatibility if needed).
>=20
> > And being able to get physically contiguous buffers is critical on
> > platforms without an IOMMU.
>=20
> Again, I'm not trying to dispute the necessity of contiguous buffers.
> I'm trying to say that contextual names can be a viable alternative to
> full discoverability. If you want contiguous buffers, go call the heap
> "contiguous" and it's quite clear what it means.
>=20
> You can even hide details such as IOMMU availability from userspace that
> way. On a system where an IOMMU is present, you could for example go and
> use IOMMU-backed memory in a "contiguous" heap, while on a system
> without an IOMMU the memory for the "contiguous" heap could come from
> CMA.

I can see the benefits from that, and it would be quite nice indeed.
However, it still only addresses the "hardware" part of the requirements
(ie, is it contiguous, accessible, etc.). It doesn't address
applications having different requirements when it comes to what kind of
attributes they'd like/need to get from the buffer.

If one application in the system wants contiguous (using your definition
just above) buffers without caches, and the other wants to have
contiguous cacheable buffers, if we're only using the name we'd need to
instantiate two heaps, from the same allocator, for what's essentially a
mapping attribute.

It's more complex for the kernel, more code to maintain, and more
complex for applications too because they need to know about what a
given name means for that particular context.

> > > In the majority of cases that's probably not even something that
> > > matters because we get a DMA-BUF anyway and we can map that any way we
> > > want.
> > >
> > > Irrespective of that, physically contigous buffers could be allocated=
 in
> > > any number of ways, CMA is just a convenient implementation of one su=
ch
> > > allocator.
> > >=20
> > > > But yeah, I agree that being backed by CMA is probably not what an
> > > > application cares about (and we even have might some discussions ab=
out
> > > > that), but if the ECC protection comes at a performance cost then it
> > > > will very much care about it. Or if it comes with caches enabled or=
 not.
> > >=20
> > > True, no doubt about that. However, I'm saying there may be advantages
> > > in hiding all of this from applications. Let's say we're trying to
> > > implement video decoding. We can create a special "protected-video" h=
eap
> > > that is specifically designed to allocate encrypted/protected scanout
> > > buffers from.
> > >=20
> > > When you design that system, you would most certainly not enable ECC
> > > protection on that heap because it leads to bad performance. You would
> > > also want to make sure that all of the buffers in that heap are cached
> > > and whatever other optimizations your chip may provide.
> > >=20
> > > Your application doesn't have to care about this, though, because it =
can
> > > simply look for a heap named "protected-video" and allocate buffers f=
rom
> > > it.
> >=20
> > I mean, I disagree. Or rather, in an environment where you have a system
> > architect, and the application is targeted for a particular system only,
> > and where "protected-video" means whatever the team decided in general,
> > yeah, that works.
> >=20
> > So, in a BSP or Android, that works fine.
> >=20
> > On a mainline based system, with generic stacks like libcamera, it just
> > doesn't fly anymore.
>=20
> I'm not sure I know of a system that isn't architected. Even very
> "generic" devices have a set of functionality that the manufacturer
> wanted the device to provide.
>
> Aren't generic stacks not also build to provide a specific function?
> Again, libcamera could try to use a "camera" heap, or maybe it would fit
> into that "multimedia" category.
>=20
> For truly generic systems you typically don't need any of this, right? A
> generic system like a PC usually gets by with just system memory and
> maybe video RAM for some specific cases.

Why wouldn't we need this for a truly generic system?

With ARM laptops around the corner, pretty much the same SoC can be used
in a tablet, in a car, or in a "generic system like a PC".

Maxime

--fw2ggjlsionxpe6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZo56FgAKCRAnX84Zoj2+
dmSpAYDellby1P6TKjGV1hDts+ZmkuCOtz2Rn+wWU7sCBG0bFjzvNC7BxXKDclix
+fnoexcBgPXf794/pWDIFzNFj8SSm+UUbZuq7Arrt/y3vDQWhJCTL+mQ5Jc9M1c9
mpDiZTXeiw==
=JvJR
-----END PGP SIGNATURE-----

--fw2ggjlsionxpe6b--
