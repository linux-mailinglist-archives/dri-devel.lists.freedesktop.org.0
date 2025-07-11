Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245CBB013F3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 09:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FBB10E262;
	Fri, 11 Jul 2025 07:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qJPoCUmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA78010E262
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 07:03:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 94CF15C6B62;
 Fri, 11 Jul 2025 07:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0BFC4CEED;
 Fri, 11 Jul 2025 07:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752217390;
 bh=r1cPPxjdKgAs+R+18XIYemBgN1Sq2Z6+k2CL2xCS38E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qJPoCUmKk+Rg4BlVA6O9Ufe6nGAVL6283cDjW+2DMRSVdNcnLSN1FHEe0NftXVZXz
 80f2RSiGocdRqETQU/VuiJg3Asov1sFfaZh23ySNGrHUhJqETvONoSZvZHxAO1Q88M
 jgfFK5+o/3Hp9Yh8AZPC/0S5qFAW8/i4BIZljLhnTs+3EeEAiplTul9Wcn6+5WMJ08
 rK/DAU5AgW2brRpCb7LEwjrwql5ElTWhJ4qFb6eimaZcC5IxP+3V5GI89iglwJdhTF
 bndewVgkZ9ptvjRbkuPRpOSx2vxXW25sy6cBzrbA5DCDd8F8Sv5j9CmgXqRwpzAGZ3
 1hXEZoVEwd9ww==
Date: Fri, 11 Jul 2025 09:03:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Andrew Davis <afd@ti.com>, 
 Jared Kangas <jkangas@redhat.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux.dev
Subject: Re: [PATCH v6 0/2] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
Message-ID: <20250711-super-pigeon-of-courage-205fb1@houat>
References: <20250709-dma-buf-ecc-heap-v6-0-dac9bf80f35d@kernel.org>
 <49e3fa834aadb37452112bb704a1a1593c1fd0b8.camel@ndufresne.ca>
 <20250709-spotted-ancient-oriole-c8bcd1@houat>
 <78c981eb7fafe864bea60c662ba5b474fbd44669.camel@ndufresne.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vmeaee7jixrkjoeb"
Content-Disposition: inline
In-Reply-To: <78c981eb7fafe864bea60c662ba5b474fbd44669.camel@ndufresne.ca>
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


--vmeaee7jixrkjoeb
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 0/2] dma-buf: heaps: Create a CMA heap for each CMA
 reserved region
MIME-Version: 1.0

On Thu, Jul 10, 2025 at 11:21:02AM -0400, Nicolas Dufresne wrote:
> Hi,
>=20
> Le mercredi 09 juillet 2025 =E0 15:38 +0200, Maxime Ripard a =E9crit=A0:
> > > Will there be a generic way to find out which driver/device this carv=
eout
> > > belongs to ? In V4L2, only complex cameras have userspace drivers,
> > > everything
> > > else is generic code.
> >=20
> > I believe it's a separate discussion, but the current stance is that the
> > heap name is enough to identify in a platform-specific way where you
> > allocate from. I've worked on documenting what a good name is so
> > userspace can pick it up more easily here:
> >=20
> > https://lore.kernel.org/r/20250616-dma-buf-heap-names-doc-v2-1-8ae43174=
cdbf@kernel.org
> >=20
> > But it's not really what you expected
>=20
> From a dma-heap API, the naming rules seems necessary, but suggesting gen=
eric
> code to use "grep" style of search to match a heap is extremely fragile. =
The
> documentation you propose is (intentionally?) vague. For me, the naming i=
s more
> like giving proper names to your function calls do devs can make sense ou=
t of
> it.

I agree, and made a proposal to implement some kind of heap capabilities
discovery ioctl. The main concern at the time was that Android tried
that with ION and it lead to a proliferation of poorly defined flags,
and that names were enough to do so.

I still think that at some point we will need this, but I also don't
have a good idea to address these concerns.

> Stepping back a little, we already opened the door for in-driver use of h=
eaps.
> So perhaps the way forward is to have V4L2 drivers utilize heaps from ins=
ide the
> kernel. Once driver are fully ported, additional APIs could be added so t=
hat
> userspace can read which heap(s) is going to be used for the active
> configuration, and which other heaps are known usable (enumerate them). T=
here is
> no need to add properties in that context, since these will derives from =
the
> driver configuration you picked. If you told you driver you doing secure =
memory
> playback, the driver will filter-out what can't be used.
>=20
> Examples out there often express simplified view of the problem. Your ECC=
 video
> playback case is a good one. Let's say you have performance issue in both
> decoder and display due to ECC. You may think that you just allocate from=
 a non-
> ECC heap, import these into the decoder, and once filled, import these in=
to the
> display driver and you won.
>=20
> But in reality, your display buffer might not be the reference buffers, a=
nd most
> of the memory bandwidth in a modern decoder goes into reading reference f=
rames
> and the attached metadata (the later which may or may not be in the same
> allocation block).
>=20
> Even once the reference frames get exposed to userspace (which is a long =
term
> goal), there will still be couple of buffers that just simply don't fit a=
nd must
> be kept hidden inside the driver.
>=20
> My general conclusion is that once these heap exists, and that we guarant=
ee
> platform specific unique names, we should probably build on top. Both use=
rspace
> and driver become consumers of the heap. And for the case where the platf=
orm-
> specific knowledge lives inside the kernel, then heaps are selected by the
> kernel. Also, very little per-driver duplication will be needed, since 90=
% of
> the V4L2 driver share the allocator implementation.
>=20
> Does that makes any sense to anyone ?

It does, and it's roughly what we have in mind for the cgroups support
in KMS and v4l2. The main issue with it is that knowing if you allocate
=66rom a dedicated pool (which would use the dmem cgroup controller) or
the main memory pool (which would use memcg) wasn't deterministic and
thus you couldn't properly account.

The solution we have in mind right now is indeed to switch everyone to
using heaps, and then exposing which cgroup that heap allocates from.

Your proposal here has a few extra steps, but the main idea is there
still.

Maxime

--vmeaee7jixrkjoeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaHC3JgAKCRAnX84Zoj2+
djTSAX4+ygbjgM882h84BNhcHiUdIPVbWsDbOuHr/SYyMomXGq4GMdP8Pq4tqTQ5
o9edDjYBgLsUonNYgX2zR0BSqIChiajJgi1nKcoj2mQh+7E0NZmvNGb/sc0lAGdM
qlNsUjxuCQ==
=VrhR
-----END PGP SIGNATURE-----

--vmeaee7jixrkjoeb--
