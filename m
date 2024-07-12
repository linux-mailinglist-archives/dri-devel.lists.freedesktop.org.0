Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF7992F90A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 12:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C09A10E0CD;
	Fri, 12 Jul 2024 10:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wog1kY7V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F47D10E0CD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 10:37:16 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2eea8ea8c06so25856941fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2024 03:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720780635; x=1721385435; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z8gwsvUUsDKIU0A0MWmU+DrOzhEIA1VJ9qco6yY9UIE=;
 b=Wog1kY7V1+V50j16M6voGQGhegnOthMmJ8LwiLWD6IbuZTkxtTrZ7lBvvV+/WUsEju
 YMaI7fVEbcB4PDPzM+dGipyYpqcpftJQCNmt9JbL0E+YWtPdVrR9WXKLfNthnqKZSEBv
 lAbhVPLkWEFKInANfB35wlgPbht2ws4hcbQNe+zenVAWsTbdqyWuB7Sz+872HAuCS2pi
 zeyvdkrxmd8x3yWnRpFBbSVtk/WPTifKE2gRNsnBZie9DTxAsrD2TLcJQEw2tsDflX99
 suh2sf4a4IjhWJsc+h2TYOzPTTON1u4GQyUtwfyUbuPqQ8VZWxKiA13wvnuvt6fBz7pp
 JGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720780635; x=1721385435;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z8gwsvUUsDKIU0A0MWmU+DrOzhEIA1VJ9qco6yY9UIE=;
 b=OoI/nFA9daLIGnQhfoHNqmc99tWroO7uFeWpD11z10OB9YgIksw0umwOmPhbzKmPRx
 +EByesFAHFf0f/io10IRfZxkSAao5gaj0ah0LExFoicdnfrE7Sqyq0/A1y31cdN2MmOE
 1jTH5STpP7wkYeYyOUB8X9SfdG2wwRqq8FmQuzyHj4VqrsiEK8e+x5gVcXH0efC6CmL+
 x0SbteImAjyN5TXQje0o+gPneSPz8Qs/es6NrCAVcXmAnDzbh8FhASbbU7wBTEYOze2j
 9WNGTnLueeaQ0L/gq07qxFirheewLPogemBn3wDEunv1n/xObef1hu3A1M0exSPb664v
 X75Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiYgkB7bin8cTVwVSYW/DFhaNJyNbrdH/QlxE44/GC9dtX4ws+NgC4MxeX5BLkSm+gBjVN/nw8Y1N8ig55iu9wZJw2mt5COrTFAYot6mmp
X-Gm-Message-State: AOJu0YyCJqmJbz2kznjXwSmiyWONLkHVMkmAeumFmKLrTOrbCr36BKuz
 E0qnkPLiRdNeChD/jCLTqCkYm5Vv3ONf+WFmSoHM5lDFwAnFQhu0
X-Google-Smtp-Source: AGHT+IERXrOQixakEMjiVnbkX2kwAj8h6uqnztJp+cg13eER/guLJJHm02KcHFj6ZatVWmI4D8RkUQ==
X-Received: by 2002:a2e:9d13:0:b0:2ee:4ec2:8232 with SMTP id
 38308e7fff4ca-2eeb30fd4d7mr77257941fa.25.1720780633865; 
 Fri, 12 Jul 2024 03:37:13 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde8904csm9809396f8f.49.2024.07.12.03.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 03:37:13 -0700 (PDT)
Date: Fri, 12 Jul 2024 12:37:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
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
Message-ID: <dd2fykdes4upolbxbdn2d56mcnbmn34cvchpuivczbrmuntoif@uv437quy7tqz>
References: <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
 <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
 <20240628-resilient-resolute-rook-0fc531@houat>
 <3e37rhrcqogix5obsu2gq7jar7bcoamx4bbd376az5z3zdkwvm@jstirwdl5efm>
 <20240704-therapeutic-maroon-coucal-f61a63@houat>
 <wapv4gl2se34tq3isycb7bui5xi3x6kxjqtyz24qhjipnkbuqu@sv4w2crksuq5>
 <20240710-cocky-lemon-seriema-86cccf@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4yig7db2t6f37dil"
Content-Disposition: inline
In-Reply-To: <20240710-cocky-lemon-seriema-86cccf@houat>
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


--4yig7db2t6f37dil
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 02:10:09PM GMT, Maxime Ripard wrote:
> On Fri, Jul 05, 2024 at 04:31:34PM GMT, Thierry Reding wrote:
> > On Thu, Jul 04, 2024 at 02:24:49PM GMT, Maxime Ripard wrote:
> > > On Fri, Jun 28, 2024 at 04:42:35PM GMT, Thierry Reding wrote:
> > > > On Fri, Jun 28, 2024 at 03:08:46PM GMT, Maxime Ripard wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Fri, Jun 28, 2024 at 01:29:17PM GMT, Thierry Reding wrote:
> > > > > > On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> > > > > > > On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > > > > > > > On Thu, May 16, 2024 at 3:56=E2=80=AFAM Daniel Vetter <dani=
el@ffwll.ch> wrote:
> > > > > > > > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wro=
te:
> > > > > > > > > > But it makes me a little nervous to add a new generic a=
llocation flag
> > > > > > > > > > for a feature most hardware doesn't support (yet, at le=
ast). So it's
> > > > > > > > > > hard to weigh how common the actual usage will be acros=
s all the
> > > > > > > > > > heaps.
> > > > > > > > > >
> > > > > > > > > > I apologize as my worry is mostly born out of seeing ve=
ndors really
> > > > > > > > > > push opaque feature flags in their old ion heaps, so in=
 providing a
> > > > > > > > > > flags argument, it was mostly intended as an escape hat=
ch for
> > > > > > > > > > obviously common attributes. So having the first be som=
ething that
> > > > > > > > > > seems reasonable, but isn't actually that common makes =
me fret some.
> > > > > > > > > >
> > > > > > > > > > So again, not an objection, just something for folks to=
 stew on to
> > > > > > > > > > make sure this is really the right approach.
> > > > > > > > >
> > > > > > > > > Another good reason to go with full heap names instead of=
 opaque flags on
> > > > > > > > > existing heaps is that with the former we can use symlink=
s in sysfs to
> > > > > > > > > specify heaps, with the latter we need a new idea. We hav=
en't yet gotten
> > > > > > > > > around to implement this anywhere, but it's been in the d=
ma-buf/heap todo
> > > > > > > > > since forever, and I like it as a design approach. So wou=
ld be a good idea
> > > > > > > > > to not toss it. With that display would have symlinks to =
cma-ecc and cma,
> > > > > > > > > and rendering maybe cma-ecc, shmem, cma heaps (in priorit=
y order) for a
> > > > > > > > > SoC where the display needs contig memory for scanout.
> > > > > > > >=20
> > > > > > > > So indeed that is a good point to keep in mind, but I also =
think it
> > > > > > > > might re-inforce the choice of having ECC as a flag here.
> > > > > > > >=20
> > > > > > > > Since my understanding of the sysfs symlinks to heaps idea =
is about
> > > > > > > > being able to figure out a common heap from a collection of=
 devices,
> > > > > > > > it's really about the ability for the driver to access the =
type of
> > > > > > > > memory. If ECC is just an attribute of the type of memory (=
as in this
> > > > > > > > patch series), it being on or off won't necessarily affect
> > > > > > > > compatibility of the buffer with the device.  Similarly "un=
cached"
> > > > > > > > seems more of an attribute of memory type and not a type it=
self.
> > > > > > > > Hardware that can access non-contiguous "system" buffers ca=
n access
> > > > > > > > uncached system buffers.
> > > > > > >=20
> > > > > > > Yeah, but in graphics there's a wide band where "shit perform=
ance" is
> > > > > > > defacto "not useable (as intended at least)".
> > > > > > >=20
> > > > > > > So if we limit the symlink idea to just making sure zero-copy=
 access is
> > > > > > > possible, then we might not actually solve the real world pro=
blem we need
> > > > > > > to solve. And so the symlinks become somewhat useless, and we=
 need to
> > > > > > > somewhere encode which flags you need to use with each symlin=
k.
> > > > > > >=20
> > > > > > > But I also see the argument that there's a bit a combinatoria=
l explosion
> > > > > > > possible. So I guess the question is where we want to handle =
it ...
> > > > > >=20
> > > > > > Sorry for jumping into this discussion so late. But are we real=
ly
> > > > > > concerned about this combinatorial explosion in practice? It ma=
y be
> > > > > > theoretically possible to create any combination of these, but =
do we
> > > > > > expect more than a couple of heaps to exist in any given system?
> > > > >=20
> > > > > I don't worry too much about the number of heaps available in a g=
iven
> > > > > system, it would indeed be fairly low.
> > > > >=20
> > > > > My concern is about the semantics combinatorial explosion. So far=
, the
> > > > > name has carried what semantics we were supposed to get from the =
buffer
> > > > > we allocate from that heap.
> > > > >=20
> > > > > The more variations and concepts we'll have, the more heap names =
we'll
> > > > > need, and with confusing names since we wouldn't be able to chang=
e the
> > > > > names of the heaps we already have.
> > > >=20
> > > > What I was trying to say is that none of this matters if we make th=
ese
> > > > names opaque. If these names are contextual for the given system it
> > > > doesn't matter what the exact capabilities are. It only matters that
> > > > their purpose is known and that's what applications will be interes=
ted
> > > > in.
> > >=20
> > > If the names are opaque, and we don't publish what the exact
> > > capabilities are, how can an application figure out which heap to use=
 in
> > > the first place?
> >=20
> > This would need to be based on conventions. The idea is to standardize
> > on a set of names for specific, well-known use-cases.

Sorry, hadn't seen all of your comments in this mail before, a few more
notes below.

> How can undocumented, unenforced, conventions can work in practice?

Unenforced, perhaps, yes, but who says that these conventions need to
be undocumented?

> > > > > > Would it perhaps make more sense to let a platform override the=
 heap
> > > > > > name to make it more easily identifiable? Maybe this is a naive
> > > > > > assumption, but aren't userspace applications and drivers not p=
rimarily
> > > > > > interested in the "type" of heap rather than whatever specific =
flags
> > > > > > have been set for it?
> > > > >=20
> > > > > I guess it depends on what you call the type of a heap. Where we
> > > > > allocate the memory from, sure, an application won't care about t=
hat.
> > > > > How the buffer behaves on the other end is definitely something
> > > > > applications are going to be interested in though.
> > > >=20
> > > > Most of these heaps will be very specific, I would assume.
> > >=20
> > > We don't have any specific heap upstream at the moment, only generic
> > > ones.
> >=20
> > But we're trying to add more specific ones, right?
> >=20
> > > > For example a heap that is meant to be protected for protected video
> > > > decoding is both going to be created in such a way as to allow that
> > > > use-case (i.e. it doesn't make sense for it to be uncached, for
> > > > example) and it's also not going to be useful for any other use-case
> > > > (i.e. there's no reason to use that heap for GPU jobs or networking,
> > > > or whatever).
> > >=20
> > > Right. But also, libcamera has started to use dma-heaps to allocate
> > > dma-capable buffers and do software processing on it before sending it
> > > to some hardware controller.
> > >=20
> > > Caches are critical here, and getting a non-cacheable buffer would be
> > > a clear regression.
> >=20
> > I understand that. My point is that maybe we shouldn't try to design a
> > complex mechanism that allows full discoverability of everything that a
> > heap supports or is capable of. Instead if the camera has specific
> > requirements, it could look for a heap named "camera". Or if it can
> > share a heap with other multimedia devices, maybe call the heap
> > "multimedia".
>=20
> That kind of vague categorization is pointless though. Some criteria are
> about hardwar (ie, can the device access it in the first place?), so is
> purely about a particular context and policy and will change from one
> application to the other.
>=20
> A camera app using an ISP will not care about caches. A software
> rendering library will. A compositor will not want ECC. A safety
> component probably will.
>=20
> All of them are "multimedia".
>=20
> We *need* to be able to differentiate policy from hardware requirements.

Do we really? My point is that if we have, say, a safety component that
needs hardware and software to access certain memory, then by definition
that memory needs to properties that satisfy both the hardware *and* the
software components involved with that memory. Otherwise it's all just
not going to work.

If you have an ISP that never needs to pass the buffer to software for
post-processing or whatever, then there's hardly a need for that buffer
to be cached. On the other hand, if the system requires software post-
processing, I bet you that the system will be designed such that the ISP
and software can efficiently access that particular shared memory region
or else, again, the system won't work.

Given that these are special purpose carveout regions, I have a hard
time imagining somebody creating arbitrary heaps just for the sake of
it.

> > The idea is that heaps for these use-cases are quite specific, so you
> > would likely not find an arbitrary number of processes try to use the
> > same heap.
>=20
> Some of them are specific, some of them aren't.

Which ones wouldn't be specific? Of course I can /think/ of arbitrarily
generic heaps, but the real question is whether we are going to
encounter these in practice.

> > > How can it know which heap to allocate from on a given platform?
> > >=20
> > > Similarly with the ECC support we started that discussion with. ECC w=
ill
> > > introduce a significant performance cost. How can a generic applicati=
on,
> > > such as a compositor, will know which heap to allocate from without:
> > >=20
> > > a) Trying to bundle up a list of heaps for each platform it might or
> > >    might not run
> > >=20
> > > b) and handling the name difference between BSPs and mainline.
> >=20
> > Obviously some standardization of heap names is a requirement here,
> > otherwise such a proposal does indeed not make sense.
> >=20
> > > If some hardware-specific applications / middleware want to take a
> > > shortcut and use the name, that's fine. But we need to find a way for
> > > generic applications to discover which heap is best suited for their
> > > needs without the name.
> >=20
> > You can still have fairly generic names for heaps. If you want protected
> > content, you could try to use a standard "video-protected" heap. If you
> > need ECC protected memory, maybe you want to allocate from a heap named
> > "safety", or whatever.
>=20
> And if I need cacheable, physically contiguous, "multimedia" buffers from
> ECC protected memory?

Again, I think you're trying to design for a very theoretically generic
use-case that doesn't exist.

Note also that I'm not necessarily talking about global names here, but
if necessary these could be per-device or per-use-case. If you have ECC
protected memory that you may want to use in certain cases, you could
call this "safety" *in the context* of "multimedia". So you could
associate multiple multimedia heaps with a video encoder. One could be
used if only plain physically contiguous memory is needed, and another
would be used if ECC protection is needed.

These two heaps could be different from regular and safety heaps of a
camera, for example.

So even if we have a fairly large number of heaps globally, I expect
the number of heaps per-use-case to be very small (and easily named).

> > > > > And if we allow any platform to change a given heap name, then a =
generic
> > > > > application won't be able to support that without some kind of
> > > > > platform-specific configuration.
> > > >=20
> > > > We could still standardize on common use-cases so that applications
> > > > would know what heaps to allocate from. But there's also no need to
> > > > arbitrarily restrict this. For example there could be cases that are
> > > > very specific to a particular platform and which just doesn't exist
> > > > anywhere else. Platform designers could then still use this mechani=
sm to
> > > > define that very particular heap and have a very specialized usersp=
ace
> > > > application use that heap for their purpose.
> > >=20
> > > We could just add a different capabitily flag to make sure those would
> > > get ignored.
> >=20
> > Sure you can do all of this with a myriad of flags. But again, I'm
> > trying to argue that we may not need this additional complexity. In a
> > typical system, how many heaps do you encounter? You may need a generic
> > one and then perhaps a handful specific ones? Or do you need more?
>=20
> It's not a matter of the number of heaps, but what they provide.

It sounds like you want to design a system that allows any arbitrary
number of carveouts to be defined, each with its own unique combination
of capabilities. I'm afraid that's going to be overly complex and end up
in a system that is very difficult to use. If I recall correctly there
have been attempts to do something like this is the past (GBM allocator)
and they didn't really go anywhere.

Ultimately I think we need to find the practical applications for this
and then base the design on what the real world requirements are.

> > > > > > For example, if an applications wants to use a protected buffer=
, the
> > > > > > application doesn't (and shouldn't need to) care about whether =
the heap
> > > > > > for that buffer supports ECC or is backed by CMA. All it really=
 needs to
> > > > > > know is that it's the system's "protected" heap.
> > > > >=20
> > > > > I mean... "protected" very much means backed by CMA already, it's=
 pretty
> > > > > much the only thing we document, and we call it as such in Kconfi=
g.
> > > >=20
> > > > Well, CMA is really just an implementation detail, right? It doesn't
> > > > make sense to advertise that to anything outside the kernel. Maybe =
it's
> > > > an interesting fact that buffers allocated from these heaps will be
> > > > physically contiguous?
> > >=20
> > > CMA itself might be an implementation detail, but it's still right th=
ere
> > > in the name on ARM.
> >=20
> > That doesn't mean we can do something more useful going forward (and
> > perhaps symlink for backwards-compatibility if needed).
> >=20
> > > And being able to get physically contiguous buffers is critical on
> > > platforms without an IOMMU.
> >=20
> > Again, I'm not trying to dispute the necessity of contiguous buffers.
> > I'm trying to say that contextual names can be a viable alternative to
> > full discoverability. If you want contiguous buffers, go call the heap
> > "contiguous" and it's quite clear what it means.
> >=20
> > You can even hide details such as IOMMU availability from userspace that
> > way. On a system where an IOMMU is present, you could for example go and
> > use IOMMU-backed memory in a "contiguous" heap, while on a system
> > without an IOMMU the memory for the "contiguous" heap could come from
> > CMA.
>=20
> I can see the benefits from that, and it would be quite nice indeed.
> However, it still only addresses the "hardware" part of the requirements
> (ie, is it contiguous, accessible, etc.). It doesn't address
> applications having different requirements when it comes to what kind of
> attributes they'd like/need to get from the buffer.
>=20
> If one application in the system wants contiguous (using your definition
> just above) buffers without caches, and the other wants to have
> contiguous cacheable buffers, if we're only using the name we'd need to
> instantiate two heaps, from the same allocator, for what's essentially a
> mapping attribute.

This sounds very hypothetical to me. Maybe we have a fundamentally
different view of what these heaps are supposed to be, but in my view
they are very specific regions of memory that serve a special purpose,
so they are very unlikely going to need a lot of flexibility. If one
application is going to require uncached buffers, then any application
is likely going to require uncached buffers for that particular use-
case. In fact, I'd say there's probably only one application using the
functionality in the first place.

Again, I realize that I may have a very limited picture of what is
needed for existing use-cases, so maybe we can start collecting some
data about real-world use-cases for these carveouts to get a better
understanding of what we need?

> It's more complex for the kernel, more code to maintain, and more
> complex for applications too because they need to know about what a
> given name means for that particular context.

I don't think it will be very complex or a lot of code to make this
name-based. In fact I expect it to become quite simple. There's going to
have to be some (generic) code that knows how to link carveouts to the
devices that use them, but the rest should be pretty straightforward.

As for applications, isn't it going to be much easier to request a heap
allocation "by name" rather than having to discover all heaps and
determining the best one?

Thierry

--4yig7db2t6f37dil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmaRB1QACgkQ3SOs138+
s6HGPg/9EkGURyJWfBSLklZkbnj74IpoztZH+MizLpNEuQoze3zq3JBY/NGdvjVW
rgqARKoghiNxOFYiSkJEmluOJeNGYGGl5AgwAO1weZCR7pTsqUY+3t9dxayTA8tN
8/M8O7gbUgBVnRKtoewep8Xu+Dp3N9SqlVZkpzqy8byGJ8eMLol+0d+4Ppue5PMZ
Qi6b1ZkxAL+J2YK9DWg2wtxjAyCcvzJ28jPzb0Zq5PY9zqCPdkW9je1NMIKkezbL
4+Bu8TKMkDPFw1kjLo9hcHlaeo2r4fiFYN4PGbHrcCpN/ytpF9REdU/OLnYzk6v9
uu8WvvD4EcMWMIsxK/GftybslteB4vBbVv8lNEVke4CIUKpYIuQb1EA7HdBnBIWK
HI/FZnnCMlM4/irQuBdTAe7Yn3b8SC60rbI2F9VR5YMRpFCIhQskdBxKljmufba3
3+jZNt7v8RC4LmZnCZCq13FBNZ9K5GV1x4G5j9Jqb+Tk8MID/Sov7N2QVRTWzlXt
byOWiFkED3XT4TD8hS+KEQws0tQibhuvawLTnyiG4ThGWYmUzcaMsZv3fRMwhzcx
57v+0G/EY8cni3ptXscGi29HgQ9KKeHcB97mpBsUCHjePQoMbtXbXJOoQLUzmRjA
veHpy3KRmi4DdyxD21M14Viv4bd/yFlq3o4XOpF3nEEp+AituKM=
=HKvr
-----END PGP SIGNATURE-----

--4yig7db2t6f37dil--
