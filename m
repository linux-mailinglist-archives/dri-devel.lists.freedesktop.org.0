Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C791928AB4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 16:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7439010E286;
	Fri,  5 Jul 2024 14:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i6KcElSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544C210E25E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 14:31:39 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ee8911b451so20513291fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 07:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720189897; x=1720794697; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ClEHGxBQC8d+69s1E0zfIxA6SsZYKln90NxnsAZQsV0=;
 b=i6KcElSJhFRdEJF8eJ8OZwimRP88qbthDMJD9qvYK9UYkS/+kAZJ8ua27hhTqQEv9d
 McOWijGfba5W1FtMY9jDDEnio7wAWO3ZW6sieBAhNfUGB6jMtJIdu/lJWUa9w92bJgF/
 +1HL8P7WqaMS+axBFeIdKVVyWOuu4pnr+PXOuXmhSESBN3WPa1TTePBGnt3NJS0Qgh7L
 bKKSAtJ5djsfo4joqGnuxMGH994V9CwsFevtrX4Zcwm3L9Xk/s3jHqW8pJwhxzhm6Wjy
 rSFXz9FV1DEdlkdULmjDL0/ExSoeEn4ikR/ifLlTOqaqVyepf29mRRENUAdUiOL5EQVB
 dSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720189897; x=1720794697;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ClEHGxBQC8d+69s1E0zfIxA6SsZYKln90NxnsAZQsV0=;
 b=OOAv2e47q1UZS8/F+j/Q3Bw4WPyUylRNrp6V6XQl3qhwF6TdYj3ySluep8HYw/jrme
 qQo0tBi+EVa9N5OL+eBvS84I1DcFK1M1TTvV+Z1Sbpj50IpJrvO4wLlsUHeqbgoGJ8j6
 fAo4ZvujpABejmrcZNC9CENi0xFNTXR/ffrWxKZvXNiBfa7Kv/KUOXTYFAl7+GqVEhwP
 xKzKZ6/TT90+yi5sn8azu6exhkRr8YXirdhIY75nH4PgcEoL0P2EthZm0lw0u6Y+psKo
 OqehECwENNm/iKu7GPVPuAS9vBhs7xgFgU2rBWA7NFuusUcYM1oy8CFFHQvMgRRe7vr2
 CEXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcxgfZM/19veEyV/Hq1xSgyWU3SY8P0fDewbWUgmvwFEs9fTGzVJVHXbpOZxlsBTenreQizvamkop1Gf3U98K4OXqR/yIeSHccwvVyaYAa
X-Gm-Message-State: AOJu0YyKkMWpQExuMPStP5k78ONZwDRPlE90gYvQLoTxQ2unXph0X8xC
 /HzgNcnvcC6L26r33X2x6BBtu+ws9EzYNekSRXje05KKXfk2Q1Xp
X-Google-Smtp-Source: AGHT+IH0RqFV3EWW1WzpkBsJ/MsnoLJBuyPiXEMl4hNR1zKaQ4s5JpaptC4+UY9TqM3qlrjZ2TdlKQ==
X-Received: by 2002:a2e:a912:0:b0:2ec:5abf:f3a8 with SMTP id
 38308e7fff4ca-2ee8ed5ee1bmr42524531fa.8.1720189896531; 
 Fri, 05 Jul 2024 07:31:36 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36798fafa0esm5116389f8f.74.2024.07.05.07.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 07:31:36 -0700 (PDT)
Date: Fri, 5 Jul 2024 16:31:34 +0200
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
Message-ID: <wapv4gl2se34tq3isycb7bui5xi3x6kxjqtyz24qhjipnkbuqu@sv4w2crksuq5>
References: <20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org>
 <CANDhNCoOKwtpstFE2VDcUvzdXUWkZ-Zx+fz6xrdPWTyciVXMXQ@mail.gmail.com>
 <ZkXmWwmdPsqAo7VU@phenom.ffwll.local>
 <CANDhNCo5hSC-sLwdkBi3e-Ja-MzdqcGGbn-4G3XNYwCzZUwscw@mail.gmail.com>
 <ZkyOOwpM57HIiO3v@phenom.ffwll.local>
 <qy7aczeu6kumv5utemoevi7omp5ryq55zmgzxh5hrz5orf2osp@wypg66awof4n>
 <20240628-resilient-resolute-rook-0fc531@houat>
 <3e37rhrcqogix5obsu2gq7jar7bcoamx4bbd376az5z3zdkwvm@jstirwdl5efm>
 <20240704-therapeutic-maroon-coucal-f61a63@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z27rqkzt5ufe2272"
Content-Disposition: inline
In-Reply-To: <20240704-therapeutic-maroon-coucal-f61a63@houat>
User-Agent: NeoMutt/20240425
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


--z27rqkzt5ufe2272
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 02:24:49PM GMT, Maxime Ripard wrote:
> On Fri, Jun 28, 2024 at 04:42:35PM GMT, Thierry Reding wrote:
> > On Fri, Jun 28, 2024 at 03:08:46PM GMT, Maxime Ripard wrote:
> > > Hi,
> > >=20
> > > On Fri, Jun 28, 2024 at 01:29:17PM GMT, Thierry Reding wrote:
> > > > On Tue, May 21, 2024 at 02:06:19PM GMT, Daniel Vetter wrote:
> > > > > On Thu, May 16, 2024 at 09:51:35AM -0700, John Stultz wrote:
> > > > > > On Thu, May 16, 2024 at 3:56=E2=80=AFAM Daniel Vetter <daniel@f=
fwll.ch> wrote:
> > > > > > > On Wed, May 15, 2024 at 11:42:58AM -0700, John Stultz wrote:
> > > > > > > > But it makes me a little nervous to add a new generic alloc=
ation flag
> > > > > > > > for a feature most hardware doesn't support (yet, at least)=
=2E So it's
> > > > > > > > hard to weigh how common the actual usage will be across al=
l the
> > > > > > > > heaps.
> > > > > > > >
> > > > > > > > I apologize as my worry is mostly born out of seeing vendor=
s really
> > > > > > > > push opaque feature flags in their old ion heaps, so in pro=
viding a
> > > > > > > > flags argument, it was mostly intended as an escape hatch f=
or
> > > > > > > > obviously common attributes. So having the first be somethi=
ng that
> > > > > > > > seems reasonable, but isn't actually that common makes me f=
ret some.
> > > > > > > >
> > > > > > > > So again, not an objection, just something for folks to ste=
w on to
> > > > > > > > make sure this is really the right approach.
> > > > > > >
> > > > > > > Another good reason to go with full heap names instead of opa=
que flags on
> > > > > > > existing heaps is that with the former we can use symlinks in=
 sysfs to
> > > > > > > specify heaps, with the latter we need a new idea. We haven't=
 yet gotten
> > > > > > > around to implement this anywhere, but it's been in the dma-b=
uf/heap todo
> > > > > > > since forever, and I like it as a design approach. So would b=
e a good idea
> > > > > > > to not toss it. With that display would have symlinks to cma-=
ecc and cma,
> > > > > > > and rendering maybe cma-ecc, shmem, cma heaps (in priority or=
der) for a
> > > > > > > SoC where the display needs contig memory for scanout.
> > > > > >=20
> > > > > > So indeed that is a good point to keep in mind, but I also thin=
k it
> > > > > > might re-inforce the choice of having ECC as a flag here.
> > > > > >=20
> > > > > > Since my understanding of the sysfs symlinks to heaps idea is a=
bout
> > > > > > being able to figure out a common heap from a collection of dev=
ices,
> > > > > > it's really about the ability for the driver to access the type=
 of
> > > > > > memory. If ECC is just an attribute of the type of memory (as i=
n this
> > > > > > patch series), it being on or off won't necessarily affect
> > > > > > compatibility of the buffer with the device.  Similarly "uncach=
ed"
> > > > > > seems more of an attribute of memory type and not a type itself.
> > > > > > Hardware that can access non-contiguous "system" buffers can ac=
cess
> > > > > > uncached system buffers.
> > > > >=20
> > > > > Yeah, but in graphics there's a wide band where "shit performance=
" is
> > > > > defacto "not useable (as intended at least)".
> > > > >=20
> > > > > So if we limit the symlink idea to just making sure zero-copy acc=
ess is
> > > > > possible, then we might not actually solve the real world problem=
 we need
> > > > > to solve. And so the symlinks become somewhat useless, and we nee=
d to
> > > > > somewhere encode which flags you need to use with each symlink.
> > > > >=20
> > > > > But I also see the argument that there's a bit a combinatorial ex=
plosion
> > > > > possible. So I guess the question is where we want to handle it .=
=2E.
> > > >=20
> > > > Sorry for jumping into this discussion so late. But are we really
> > > > concerned about this combinatorial explosion in practice? It may be
> > > > theoretically possible to create any combination of these, but do we
> > > > expect more than a couple of heaps to exist in any given system?
> > >=20
> > > I don't worry too much about the number of heaps available in a given
> > > system, it would indeed be fairly low.
> > >=20
> > > My concern is about the semantics combinatorial explosion. So far, the
> > > name has carried what semantics we were supposed to get from the buff=
er
> > > we allocate from that heap.
> > >=20
> > > The more variations and concepts we'll have, the more heap names we'll
> > > need, and with confusing names since we wouldn't be able to change the
> > > names of the heaps we already have.
> >=20
> > What I was trying to say is that none of this matters if we make these
> > names opaque. If these names are contextual for the given system it
> > doesn't matter what the exact capabilities are. It only matters that
> > their purpose is known and that's what applications will be interested
> > in.
>=20
> If the names are opaque, and we don't publish what the exact
> capabilities are, how can an application figure out which heap to use in
> the first place?

This would need to be based on conventions. The idea is to standardize
on a set of names for specific, well-known use-cases.

> > > > Would it perhaps make more sense to let a platform override the heap
> > > > name to make it more easily identifiable? Maybe this is a naive
> > > > assumption, but aren't userspace applications and drivers not prima=
rily
> > > > interested in the "type" of heap rather than whatever specific flags
> > > > have been set for it?
> > >=20
> > > I guess it depends on what you call the type of a heap. Where we
> > > allocate the memory from, sure, an application won't care about that.
> > > How the buffer behaves on the other end is definitely something
> > > applications are going to be interested in though.
> >=20
> > Most of these heaps will be very specific, I would assume.
>=20
> We don't have any specific heap upstream at the moment, only generic
> ones.

But we're trying to add more specific ones, right?

> > For example a heap that is meant to be protected for protected video
> > decoding is both going to be created in such a way as to allow that
> > use-case (i.e. it doesn't make sense for it to be uncached, for
> > example) and it's also not going to be useful for any other use-case
> > (i.e. there's no reason to use that heap for GPU jobs or networking,
> > or whatever).
>=20
> Right. But also, libcamera has started to use dma-heaps to allocate
> dma-capable buffers and do software processing on it before sending it
> to some hardware controller.
>=20
> Caches are critical here, and getting a non-cacheable buffer would be
> a clear regression.

I understand that. My point is that maybe we shouldn't try to design a
complex mechanism that allows full discoverability of everything that a
heap supports or is capable of. Instead if the camera has specific
requirements, it could look for a heap named "camera". Or if it can
share a heap with other multimedia devices, maybe call the heap
"multimedia".

The idea is that heaps for these use-cases are quite specific, so you
would likely not find an arbitrary number of processes try to use the
same heap.

> How can it know which heap to allocate from on a given platform?
>=20
> Similarly with the ECC support we started that discussion with. ECC will
> introduce a significant performance cost. How can a generic application,
> such as a compositor, will know which heap to allocate from without:
>=20
> a) Trying to bundle up a list of heaps for each platform it might or
>    might not run
>=20
> b) and handling the name difference between BSPs and mainline.

Obviously some standardization of heap names is a requirement here,
otherwise such a proposal does indeed not make sense.

> If some hardware-specific applications / middleware want to take a
> shortcut and use the name, that's fine. But we need to find a way for
> generic applications to discover which heap is best suited for their
> needs without the name.

You can still have fairly generic names for heaps. If you want protected
content, you could try to use a standard "video-protected" heap. If you
need ECC protected memory, maybe you want to allocate from a heap named
"safety", or whatever.

> > > And if we allow any platform to change a given heap name, then a gene=
ric
> > > application won't be able to support that without some kind of
> > > platform-specific configuration.
> >=20
> > We could still standardize on common use-cases so that applications
> > would know what heaps to allocate from. But there's also no need to
> > arbitrarily restrict this. For example there could be cases that are
> > very specific to a particular platform and which just doesn't exist
> > anywhere else. Platform designers could then still use this mechanism to
> > define that very particular heap and have a very specialized userspace
> > application use that heap for their purpose.
>=20
> We could just add a different capabitily flag to make sure those would
> get ignored.

Sure you can do all of this with a myriad of flags. But again, I'm
trying to argue that we may not need this additional complexity. In a
typical system, how many heaps do you encounter? You may need a generic
one and then perhaps a handful specific ones? Or do you need more?

> > > > For example, if an applications wants to use a protected buffer, the
> > > > application doesn't (and shouldn't need to) care about whether the =
heap
> > > > for that buffer supports ECC or is backed by CMA. All it really nee=
ds to
> > > > know is that it's the system's "protected" heap.
> > >=20
> > > I mean... "protected" very much means backed by CMA already, it's pre=
tty
> > > much the only thing we document, and we call it as such in Kconfig.
> >=20
> > Well, CMA is really just an implementation detail, right? It doesn't
> > make sense to advertise that to anything outside the kernel. Maybe it's
> > an interesting fact that buffers allocated from these heaps will be
> > physically contiguous?
>=20
> CMA itself might be an implementation detail, but it's still right there
> in the name on ARM.

That doesn't mean we can do something more useful going forward (and
perhaps symlink for backwards-compatibility if needed).

> And being able to get physically contiguous buffers is critical on
> platforms without an IOMMU.

Again, I'm not trying to dispute the necessity of contiguous buffers.
I'm trying to say that contextual names can be a viable alternative to
full discoverability. If you want contiguous buffers, go call the heap
"contiguous" and it's quite clear what it means.

You can even hide details such as IOMMU availability from userspace that
way. On a system where an IOMMU is present, you could for example go and
use IOMMU-backed memory in a "contiguous" heap, while on a system
without an IOMMU the memory for the "contiguous" heap could come from
CMA.

> > In the majority of cases that's probably not even something that
> > matters because we get a DMA-BUF anyway and we can map that any way we
> > want.
> >
> > Irrespective of that, physically contigous buffers could be allocated in
> > any number of ways, CMA is just a convenient implementation of one such
> > allocator.
> >=20
> > > But yeah, I agree that being backed by CMA is probably not what an
> > > application cares about (and we even have might some discussions about
> > > that), but if the ECC protection comes at a performance cost then it
> > > will very much care about it. Or if it comes with caches enabled or n=
ot.
> >=20
> > True, no doubt about that. However, I'm saying there may be advantages
> > in hiding all of this from applications. Let's say we're trying to
> > implement video decoding. We can create a special "protected-video" heap
> > that is specifically designed to allocate encrypted/protected scanout
> > buffers from.
> >=20
> > When you design that system, you would most certainly not enable ECC
> > protection on that heap because it leads to bad performance. You would
> > also want to make sure that all of the buffers in that heap are cached
> > and whatever other optimizations your chip may provide.
> >=20
> > Your application doesn't have to care about this, though, because it can
> > simply look for a heap named "protected-video" and allocate buffers from
> > it.
>=20
> I mean, I disagree. Or rather, in an environment where you have a system
> architect, and the application is targeted for a particular system only,
> and where "protected-video" means whatever the team decided in general,
> yeah, that works.
>=20
> So, in a BSP or Android, that works fine.
>=20
> On a mainline based system, with generic stacks like libcamera, it just
> doesn't fly anymore.

I'm not sure I know of a system that isn't architected. Even very
"generic" devices have a set of functionality that the manufacturer
wanted the device to provide.

Aren't generic stacks not also build to provide a specific function?
Again, libcamera could try to use a "camera" heap, or maybe it would fit
into that "multimedia" category.

For truly generic systems you typically don't need any of this, right? A
generic system like a PC usually gets by with just system memory and
maybe video RAM for some specific cases.

Hardware where you need these extra heaps usually need them for very
narrow use-cases.

> Let's use the two heaps we currently support: their name isn't stable
> across architectures, nobody ever documented the set of attributes that
> particular heap has, and since it's not documented, good luck trying to
> avoid regressions.
>=20
> So, today, with a very limited number of heaps and no vendor involvement
> so far, the "let's just use the name" policy doesn't work already.

I'm not sure I understand this argument. Today we don't expose flags to
userspace either. Does that mean there's nothing we can do about it? Of
course not.

Just because these heaps are currently suboptimally named doesn't mean
that can't be changed. If we wanted we could forge ahead and standardize
names and perhaps add backwards-compatible links for the existing ones.

Thierry

--z27rqkzt5ufe2272
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmaIA8MACgkQ3SOs138+
s6HZKA//W8DBKMDfdbY4OYn6a0EnU6GQpov20KT0wGsXHQ/eKcMu7gTCdm1bY0zc
xANHL5b+SfXDb+Ix3aXy2IOIgorAuq7ZSPMHWqsrKJg+R2mG6if3tFhA3o7x6DT9
S3HsVGZC/yCn4p1KRS79nheb0ukcX75ZZhlGKzXWZM5phadkxOFFJaHnnq9JRknO
IRpulCcWICdr+eio7WaSLk0tgcboeF0GchiJoRBA4/OqYDufgH/5U1R6trL146x1
1aAwTHt9GIsioHRlNMZ3jFF44H8ztSt+EL4wiq6illD2Od9mdXtWXYiV1qe+1oHL
WlKAfqBWLiWhTNbtp6qBHbTh7LgsvmF8N86U3gOgAEy33ltdIkjRffbSpXVpfLVy
lG2wGsN7ciXnGxEPijEqpSmhd9J8qHY5Hm7DTu0zxz+ix73N7rZ1a4739OrV/bir
db6Nlg2AuMTVQVRyH5wV4xbgmgymuycdczMmNdeI/Euqj/1669bVcYuSSHLxkHTt
o0rVpl6it7dIkOt9MIRJ2hLFwboDitAqQ+Tk+l9rzGFH3JGC3X8hX9zTlNH/AsHv
FlLaQ56OUqatcQKIBvOyWiSicWXdmvpMYEajqEHRlxmDEDCEfz6MhmO9nS8r78KD
uN4Ijcw0bqseZ0ceUxQzoTSSBjo8NFGWYvaLGY/kTZaqZ4h0kNE=
=hiCi
-----END PGP SIGNATURE-----

--z27rqkzt5ufe2272--
