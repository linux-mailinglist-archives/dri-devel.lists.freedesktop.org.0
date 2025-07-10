Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A85AFFA5D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 09:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C479510E885;
	Thu, 10 Jul 2025 07:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jzOJBawL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B85E10E885
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 07:06:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A85AE43B48;
 Thu, 10 Jul 2025 07:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367F6C4CEE3;
 Thu, 10 Jul 2025 07:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752131168;
 bh=2rsqAsMWywrwSTFuoWoPqSM41RgFfbsJD7gr5xyRK3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jzOJBawL72CNgNRoq/cF7tG9xR+kP+G1r42rtJIfrzLA3cVwiT6Akuvx3ey6skLIX
 zA9OU8MJrWX9d1kQVd8za2PbIfNVD8HPqD1xiTYzd3dtRSWq/KF7bb9eaX9ShEA7C0
 wQwpPsIMis0HMadUNtphlLV65t1XPiugfHmN//9t1XHDyn9c9agdy08wP8ah/Upz+y
 8hXPdaGeJR2mgJc9qET7S2JwY30EwC8d9Q5axarCUgPA/LExLrL++ujJMVJDRZhXxI
 IfHRw8G5+WT93u7pSTe7eieBsPmqydjiaCqc0XWa+dpCcudnhSiSRT5GHpr69RfrhW
 XB9fV4i0tEoTA==
Date: Thu, 10 Jul 2025 09:06:05 +0200
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
Message-ID: <20250710-knowing-premium-goldfish-0bfe6e@houat>
References: <20250616-dma-buf-heap-names-doc-v2-1-8ae43174cdbf@kernel.org>
 <9182c5cd-b3de-470b-bf84-3ebef309def6@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3pv5hyaxempbdl7i"
Content-Disposition: inline
In-Reply-To: <9182c5cd-b3de-470b-bf84-3ebef309def6@ti.com>
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


--3pv5hyaxempbdl7i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add naming guidelines
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 12:39:15PM -0500, Andrew Davis wrote:
> On 6/16/25 10:21 AM, Maxime Ripard wrote:
> > We've discussed a number of times of how some heap names are bad, but
> > not really what makes a good heap name.
> >=20
> > Let's document what we expect the heap names to look like.
> >=20
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Changes in v2:
> > - Added justifications for each requirement / suggestions
> > - Added a mention and example of buffer attributes
> > - Link to v1: https://lore.kernel.org/r/20250520-dma-buf-heap-names-doc=
-v1-1-ab31f74809ee@kernel.org
> > ---
> >   Documentation/userspace-api/dma-buf-heaps.rst | 38 ++++++++++++++++++=
+++++++++
> >   1 file changed, 38 insertions(+)
> >=20
> > diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentat=
ion/userspace-api/dma-buf-heaps.rst
> > index 535f49047ce6450796bf4380c989e109355efc05..835ad1c3a65bc07b6f41d38=
7d85c57162909e859 100644
> > --- a/Documentation/userspace-api/dma-buf-heaps.rst
> > +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> > @@ -21,5 +21,43 @@ following heaps:
> >      usually created either through the kernel commandline through the
> >      `cma` parameter, a memory region Device-Tree node with the
> >      `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES`=
 or
> >      `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, =
it
> >      might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> > +
> > +Naming Convention
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +``dma-buf`` heaps name should meet a number of constraints:
> > +
> > +- That name must be stable, and must not change from one version to the
> > +  other. Userspace identifies heaps by their name, so if the names ever
> > +  changes, we would be likely to introduce regressions.
> > +
> > +- That name must describe the memory region the heap will allocate fro=
m,
> > +  and must uniquely identify it in a given platform. Since userspace
> > +  applications use the heap name as the discriminant, it must be able =
to
> > +  tell which heap it wants to use reliably if there's multiple heaps.
> > +
> > +- That name must not mention implementation details, such as the
> > +  allocator. The heap driver will change over time, and implementation
> > +  details when it was introduced might not be relevant in the future.
> > +
> > +- The name should describe properties of the buffers that would be
> > +  allocated. Doing so will make heap identification easier for
> > +  userspace. Such properties are:
> > +
> > +  - ``cacheable`` / ``uncacheable`` for buffers with CPU caches enabled
> > +    or disabled;
> > +
>=20
> We should avoid exposing cacheability to userspace. What users care about
> is if writes are readable by the other side (and vice versa) without SYNC
> operations in-between. This property is "coherency". Being non-cached
> is just one way to achieve coherency on some systems. For many systems
> even cached buffers are still coherent and manually specifying "non-cache=
d"
> causes unneeded performance issues.

I disagree. If you want to do any kind of software rendering, the
buffers being cached is absolutely critical to having decent
performance.

> DMA-BUFs are default assumed to be non-coherent and sync operations should
> be always be performed (if the buffer is actually coherent these operatio=
ns
> are turned into NOPs and no harm done). If sync operations cannot be done
> (for instance small multi-writer ring-buffers), then the property can
> be simply:
>=20
> - ``coherent`` for buffers which do not require sync operations

That would be a change in the uAPI which, so far, requires sync
operations to be performed. I'm not necessarily agaisnt it, but handling
coherency in general is not what this patch is about.

Maxime

--3pv5hyaxempbdl7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG9mVAAKCRAnX84Zoj2+
dowXAYDGfPub9kqiHZxZAgjBCjYI1+bysy9zqYNVFPXKQit6jVElaE/b4h8UBIhu
BqPeyRUBfR/oAiC05NHDJaX8Q2apzbT2BQsYyRs9RvJP+nErimerl3p2BOj1vya/
KaclhnfZBQ==
=wxVn
-----END PGP SIGNATURE-----

--3pv5hyaxempbdl7i--
