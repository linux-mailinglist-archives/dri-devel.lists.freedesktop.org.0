Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F22B0061E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C9410E8F1;
	Thu, 10 Jul 2025 15:12:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fKGFbWnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817C710E8F1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 15:12:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A1B666112E;
 Thu, 10 Jul 2025 15:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07ACCC4CEE3;
 Thu, 10 Jul 2025 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752160360;
 bh=rr1ZOgK5bdD1tFwBjDDJKdPyetUVMM+BVFhZ5QRc0VI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fKGFbWnDK8kCSkU8sFpiEVIwq8ZNUZPxQc55642H12EDSFcudb6rQnI3D26os1GqI
 ng3LaI8lpe0NE8OhZHwefBgW9AldAbbECUmihW2DWkPkbKLCYCnOVi7CoZ1HL0VWmL
 ZT8EHc76cpvcOIJJMf1pIrC+9DeLaQdZNOoRhyiaFirLCexeRVNU+SFM6TUnRrajnf
 6gC4b1KCH9XLIjG3swAF72ipfXE9YNdpG/7npfYZeF4jDVtkRSM7rZXMYfsKnA/T0f
 G65Q25cu4pLleQZHO88Jp3LgxqMOpuEJDfST3MugeQ2ohZ+pLK1U6b9tCCXJnHPYj+
 MWtDSRabaXJRg==
Date: Thu, 10 Jul 2025 17:12:37 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add naming guidelines
Message-ID: <20250710-emerald-kingfisher-of-karma-effacb@houat>
References: <20250616-dma-buf-heap-names-doc-v2-1-8ae43174cdbf@kernel.org>
 <9182c5cd-b3de-470b-bf84-3ebef309def6@ti.com>
 <20250710-knowing-premium-goldfish-0bfe6e@houat>
 <aba6defc-817f-477c-8569-c5e01ca734b6@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="l7lidkg7iogd6klm"
Content-Disposition: inline
In-Reply-To: <aba6defc-817f-477c-8569-c5e01ca734b6@ti.com>
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


--l7lidkg7iogd6klm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add naming guidelines
MIME-Version: 1.0

On Thu, Jul 10, 2025 at 09:34:12AM -0500, Andrew Davis wrote:
> On 7/10/25 2:06 AM, Maxime Ripard wrote:
> > On Wed, Jul 09, 2025 at 12:39:15PM -0500, Andrew Davis wrote:
> > > On 6/16/25 10:21 AM, Maxime Ripard wrote:
> > > > We've discussed a number of times of how some heap names are bad, b=
ut
> > > > not really what makes a good heap name.
> > > >=20
> > > > Let's document what we expect the heap names to look like.
> > > >=20
> > > > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > > Changes in v2:
> > > > - Added justifications for each requirement / suggestions
> > > > - Added a mention and example of buffer attributes
> > > > - Link to v1: https://lore.kernel.org/r/20250520-dma-buf-heap-names=
-doc-v1-1-ab31f74809ee@kernel.org
> > > > ---
> > > >    Documentation/userspace-api/dma-buf-heaps.rst | 38 +++++++++++++=
++++++++++++++
> > > >    1 file changed, 38 insertions(+)
> > > >=20
> > > > diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Docume=
ntation/userspace-api/dma-buf-heaps.rst
> > > > index 535f49047ce6450796bf4380c989e109355efc05..835ad1c3a65bc07b6f4=
1d387d85c57162909e859 100644
> > > > --- a/Documentation/userspace-api/dma-buf-heaps.rst
> > > > +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> > > > @@ -21,5 +21,43 @@ following heaps:
> > > >       usually created either through the kernel commandline through=
 the
> > > >       `cma` parameter, a memory region Device-Tree node with the
> > > >       `linux,cma-default` property set, or through the `CMA_SIZE_MB=
YTES` or
> > > >       `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platf=
orm, it
> > > >       might be called ``reserved``, ``linux,cma``, or ``default-poo=
l``.
> > > > +
> > > > +Naming Convention
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +``dma-buf`` heaps name should meet a number of constraints:
> > > > +
> > > > +- That name must be stable, and must not change from one version t=
o the
> > > > +  other. Userspace identifies heaps by their name, so if the names=
 ever
> > > > +  changes, we would be likely to introduce regressions.
> > > > +
> > > > +- That name must describe the memory region the heap will allocate=
 from,
> > > > +  and must uniquely identify it in a given platform. Since userspa=
ce
> > > > +  applications use the heap name as the discriminant, it must be a=
ble to
> > > > +  tell which heap it wants to use reliably if there's multiple hea=
ps.
> > > > +
> > > > +- That name must not mention implementation details, such as the
> > > > +  allocator. The heap driver will change over time, and implementa=
tion
> > > > +  details when it was introduced might not be relevant in the futu=
re.
> > > > +
> > > > +- The name should describe properties of the buffers that would be
> > > > +  allocated. Doing so will make heap identification easier for
> > > > +  userspace. Such properties are:
> > > > +
> > > > +  - ``cacheable`` / ``uncacheable`` for buffers with CPU caches en=
abled
> > > > +    or disabled;
> > > > +
> > >=20
> > > We should avoid exposing cacheability to userspace. What users care a=
bout
> > > is if writes are readable by the other side (and vice versa) without =
SYNC
> > > operations in-between. This property is "coherency". Being non-cached
> > > is just one way to achieve coherency on some systems. For many systems
> > > even cached buffers are still coherent and manually specifying "non-c=
ached"
> > > causes unneeded performance issues.
> >=20
> > I disagree. If you want to do any kind of software rendering, the
> > buffers being cached is absolutely critical to having decent
> > performance.
> >=20
>=20
> I think we are saying the same thing, the default should be cached.
> If the user doesn't have an option for specifying "non-cached" then
> they will always get the better performing cached buffers.

Oh, I see what you mean now. Yeah, I agree. I'll drop that part from the
doc then.

Maxime

--l7lidkg7iogd6klm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG/YZQAKCRAnX84Zoj2+
djgAAYD5vuwKaflHNUxDHAmxUpq3W7TZa0Tw2oB5cFigPBhRUNISKlNKKbYkuStg
s6DTCOMBf3BLdNw7/uxAEnWEZ2tN6mEyK/Ikatabx/xgOAMDBUL/I83BPSypgJTe
SotOCaOI/w==
=5fV/
-----END PGP SIGNATURE-----

--l7lidkg7iogd6klm--
