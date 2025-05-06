Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6096DAAC641
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 15:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66D910E696;
	Tue,  6 May 2025 13:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mZxEkZLM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B89310E696
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 13:33:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E0B8244B8F;
 Tue,  6 May 2025 13:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A75C4CEE4;
 Tue,  6 May 2025 13:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746538438;
 bh=ytVei68A+haMDJ6ZilvkYH/flA7qc1bgrqpzA5apH+M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mZxEkZLMI7yQGe81cWfdb4fbb/Xohz8LNH6LjDeiqld1fuKnt8aDE1jTuqBMBWir7
 bXCrubgmH6eOB4f9Gu1oJz/jUuBOTNfNZGJ+ycq2PXSZuVsySUfzWxjweTNnxpZiKA
 gdkWRwZIiBIp/axAEqtjGtbhUhUgi8mrlvUY7S4JSsRbSBmafjbtdLeq/bd2pdLo4h
 LRWHYx9vla4DWhL2c+EurtYNdwDSK8fdEB7jH0EqMgceAtMvI3OUFJxCuHyX8FhowC
 xWoiw3XQDVc1G/unOlxEpP+VY7gRFnpAKY8i5tWk36MeirbLxtnFw1p2jULapGfCak
 aFn9ZbrkyOuig==
Date: Tue, 6 May 2025 15:33:55 +0200
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Jared Kangas <jkangas@redhat.com>, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
 christian.koenig@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
Message-ID: <20250506-gleaming-pillbug-of-love-4cb6ca@houat>
References: <20250422191939.555963-1-jkangas@redhat.com>
 <20250422191939.555963-3-jkangas@redhat.com>
 <20250424-sassy-cunning-pillbug-ffde51@houat>
 <CANDhNCqfsUbN3aavAH5hi4wdcKuUkjLX4jqhKzy-q+jCEqpoow@mail.gmail.com>
 <20250425-savvy-chubby-alpaca-0196e3@houat>
 <CANDhNCroe6ZBtN_o=c71kzFFaWK-fF5rCdnr9P5h1sgPOWSGSw@mail.gmail.com>
 <20250428-greedy-vivid-goldfish-5abb35@houat>
 <CANDhNCqdL7Oha+cGkk0XCZ8shO08ax1rd2k6f9SckuREUdQUjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="u4b35s3vftslgagk"
Content-Disposition: inline
In-Reply-To: <CANDhNCqdL7Oha+cGkk0XCZ8shO08ax1rd2k6f9SckuREUdQUjg@mail.gmail.com>
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


--u4b35s3vftslgagk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Give default CMA heap a fixed name
MIME-Version: 1.0

On Tue, Apr 29, 2025 at 09:25:00AM -0700, John Stultz wrote:
> On Mon, Apr 28, 2025 at 7:52=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Fri, Apr 25, 2025 at 12:39:40PM -0700, John Stultz wrote:
> > > To your larger point about policy, I do get the tension that you want
> > > to be able to programmatically derive or evaluate heap names, so that
> > > applications can consistently derive a pathname to get what they want.
> >
> > We've discussed it in the past, I don't really want to. But it was clear
> > from the last discussion that you (plural) wanted to infer heap
> > semantics from the names. I'm ok with that, but then if we want to make
> > it work we need to have well defined names.
>=20
> So my name keeps on getting attached to that, but I don't think I was
> involved in the LPC conversation when that got decided.

Sorry then :/

That's what I recalled, but I guess the pastries got the best of me :)

Does that mean that you disagree with this point though? or just that
you agree but still wanted to point out you were not part of that
discussion?

> > And it's actually what I really want to discuss here: we've discussed at
> > length how bad the heaps name are (and not only here), but I don't think
> > we have any documented policy on what makes a good name?
>=20
> I very much think having a policy/guidance for better names is a good goa=
l.
>=20
> I just want to make sure it doesn't become a strict policy that lead
> folks to make mistaken assumptions about a static solution being
> viable in userland (like folks nostalgicly using "eth0" or a fixed
> network device name in scripts expecting it to work on a different
> system)

I think that's one of the point where the "derive the buffer attributes"
=66rom the name interact badly though. In your example, eth0 wouldn't have
had any non-discoverable guarantees. So it can have any name you want,
it doesn't matter, you can always discover it through some other mean,
and go from there.

If we say the name is how you can associate a heap and the kind of
buffers you get, then we can't just use another heap name just like
that. We could get buffers with a totally different semantics.

I mean, it would probably work with Android, but for any other
distribution, even if we came up with a gralloc-like solution, as soon
as you start updating the kernel and whatever is using the heaps
separately, it's game over. And pretty much all non-Android distros do?

> > For example, I'm not sure exposing the allocator name is a good idea:
> > it's an implementation detail and for all userspace cares about, we
> > could change it every release if it provided the same kind of buffers.
>=20
> That is a fair point.
>=20
> > Taking your camera buffers example before, then we could also expose a
> > memory region id, and let the platform figure it out, or use the usecase
> > as the name.
> >
> > But if we don't document that, how can we possibly expect everyone
> > including downstream to come up with perfect names every time. And FTR,
> > I'm willing to write that doc down once the discussion settles.
>=20
> So again, yeah, I very much support having better guidance on the names.
>=20
> I think the number of device constraints and device combinations makes
> a raw enumeration of things difficult.
>=20
> This is why the per-device use->heap mapping "glue" seems necessary to me.
>=20
> And, I do get that this runs into a similar problem with enumerating
> and defining "uses" (which boil down to a combination of
> devices-in-a-pipeline and access use patterns), but for Andorid it has
> so far been manageable.
>=20
> Personally, I think the best idea I've heard so far to resolve this
> from userland was Christian's suggestion that devices expose links to
> compatible heaps, and then userland without a use->heap mapping could
> for the set of devices they plan to use in a pipeline, figure out the
> common heap name and use that to allocate.

I plan to work on that, but also, it covers only what the driver cares
about, ie, buffer location, etc. It doesn't really cover what userspace
might care about, like whether the buffer is cachable or not. Both would
work for any driver, but userspace will have to prefer one over the
other if it plans to do CPU accesses.

So we'd still need some (arguably more limited) enumeration on the
userspace side.

> However, that pushes the problem down a bit, requiring drivers
> (instead of userland) to know what heaps they can work with and what
> the names might be (which again, your goal for standardizing the heap
> names isn't a bad thing!). Though, this approach also runs into
> trouble as it opens a question of: should it only encode strict
> constraint satisfaction, or something more subtle, as while something
> might work with multiple heaps, its possible it won't be performant
> enough unless it picks a specific one on device A or a different one
> on device B.  And getting that sort of device-specific details
> embedded into a driver isn't great either.

Yeah :/

> > > But I also think that there is so much variety in both the devices and
> > > uses that there is no way that all use cases and all devices can be
> > > satisfied with such a static or even programmatic mapping. From my
> > > perspective, there just is going to have to be some device specific
> > > glue logic that maps use->heap name. Same reason we have fstab and the
> > > passwd file.
> >
> > fstab and passwd can be generated at (first) boot time / install. fstab
> > is also being somewhat less important with the auto-partition discovery.
> > How would you generate that configuration file at boot?
> >
> > I'm not really asking this as a theoretical question. Being able to
> > auto-discover which heap a driver/device would allocate from is central
> > for the cgroup work I mentioned earlier.
> >
> > And I'm really not sure how distros or applications developpers are
> > supposed to keep up with the raw volume of devices that go out every
> > year, each and every one of them having different heap names, etc.
> > Possibly different from one version of the firmware to another.
>=20
> For generic distros, I don't have a good answer here. Historically the
> focus has always been on single device usage, so having the driver do
> the allocation was fine, and if you were using multiple devices you
> could just copy the memory between the driver allocated buffers.  But
> as we've moved to disaggregated IP blocks and device pipelines, all
> those potential copies wreck performance and power.   I'm not sure
> generic distros have the concept of a device pipeline very well
> abstracted (obviously mesa and the wayland/X have had to deal with it,
> and the video and camera side is dealing with it more and more).
> Maybe a more established notion of use -> pipeline/device collections,
> is needed as a starting point? Then using Christian's suggestion, one
> could at least enumerate  use -> heap that would be functional. And
> maybe device makers could then supplement explicit optimized mapping
> overrides for their device?
>=20
> I just think leaving individual applications (or even individual
> frameworks like mesa) to embed assumptions about heap names ->
> functionality is going to be a problematic approach.

I totally agree on the conclusion, but I still don't see how having a
central component in charge of that will make things better. It just
won't scale to the thousands of devices out there.

And that's great improvements for the future, but heaps have use-cases
today: the CMA heap is the only way to get a physically contiguous
cacheable buffer in userspace at the moment for example.

libcamera uses it for its software ISP implementation for example.

So, while working on improving things in the future is a reasonable
goal, we also need to improve things for the current users right now.
And there's definitely users for it outside of Android.

Which brings us back to the question: What would be a good name? Do we
want to expose a platform specific region name, possibly with a suffix
or prefix to define whether it's cached or not?

Maxime

--u4b35s3vftslgagk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaBoPvwAKCRAnX84Zoj2+
dqLKAXwN6RbIIm6e8RsvdgaSYZ4Q9EwZfTT5eFdxUHB6lT8Lux7+QWav3kRwU6ur
7GIn+IEBgK9SEyVRAXfcvD3TxU5DFIJdax3+A2/TCq6DydwChzvX8/pzA14Rv80l
fV6CJ8bmAQ==
=Su3z
-----END PGP SIGNATURE-----

--u4b35s3vftslgagk--
