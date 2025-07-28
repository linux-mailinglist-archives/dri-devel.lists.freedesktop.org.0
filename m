Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D2DB13638
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 10:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7250B10E49F;
	Mon, 28 Jul 2025 08:21:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="szZ04/Ls";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB85F10E49F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:20:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8DC675C59C0;
 Mon, 28 Jul 2025 08:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C07F1C4CEF7;
 Mon, 28 Jul 2025 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753690857;
 bh=AQ/gJ+i4rwtrIdkTrmIh33ppP9Uq14yzAdB+5MSlawA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=szZ04/Lsri0o11eVQhg9uaIGFpacB+rTBOpQCv2uVtpkvBEoZg+2YhYOZp79nmcJU
 XoxJmMCUZUmmIBLPqQw01Ghgib3qFJF2cqxxKFQnPRHmmSkhZY024yjqGQNr9v9UT9
 BGY2LIIwAdi78LeJXBYnQfJa89hv8dz1xKze3e5YhllN40EKJviX8xvuTTIK66D8ZW
 P9eyfJefDgkFUs7jPZNyeyhP1XptEdNSZ8/g4eMOrPWMTZOdJKuMxDI5trIQNT+2dz
 6cHMaiAGJ9QVecJDBBEx4Z7kgL+BD3Bf75RYbnH94vnIjRILxQ9mk6VDGo2zC7yazh
 SqcUZXeTEyFqA==
Date: Mon, 28 Jul 2025 10:20:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v3] Documentation: dma-buf: heaps: Add naming guidelines
Message-ID: <20250728-pastoral-brave-guillemot-f1a3b2@houat>
References: <20250717-dma-buf-heap-names-doc-v3-1-d2dbb4b95ef6@kernel.org>
 <30d4bf10-274d-485c-84dd-7cbb8157efab@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="whtoihy75ghtpw24"
Content-Disposition: inline
In-Reply-To: <30d4bf10-274d-485c-84dd-7cbb8157efab@ti.com>
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


--whtoihy75ghtpw24
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] Documentation: dma-buf: heaps: Add naming guidelines
MIME-Version: 1.0

Hi Andrew,

Thanks for your review.

On Fri, Jul 25, 2025 at 12:49:37PM -0500, Andrew Davis wrote:
> On 7/17/25 3:10 AM, Maxime Ripard wrote:
> > We've discussed a number of times of how some heap names are bad, but
> > not really what makes a good heap name.
> >=20
> > Let's document what we expect the heap names to look like.
> >=20
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Changes in v3:
> > - Grammar, spelling fixes
> > - Remove the cacheable / uncacheable name suggestion
> > - Link to v2: https://lore.kernel.org/r/20250616-dma-buf-heap-names-doc=
-v2-1-8ae43174cdbf@kernel.org
> >=20
> > Changes in v2:
> > - Added justifications for each requirement / suggestions
> > - Added a mention and example of buffer attributes
> > - Link to v1: https://lore.kernel.org/r/20250520-dma-buf-heap-names-doc=
-v1-1-ab31f74809ee@kernel.org
> > ---
> >   Documentation/userspace-api/dma-buf-heaps.rst | 35 ++++++++++++++++++=
+++++++++
> >   1 file changed, 35 insertions(+)
> >=20
> > diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentat=
ion/userspace-api/dma-buf-heaps.rst
> > index 535f49047ce6450796bf4380c989e109355efc05..3ee4e7961fe390ba356a212=
5d53b060546c3e4a6 100644
> > --- a/Documentation/userspace-api/dma-buf-heaps.rst
> > +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> > @@ -21,5 +21,40 @@ following heaps:
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
> > +- The name must be stable, and must not change from one version to the=
 other.
> > +  Userspace identifies heaps by their name, so if the names ever chang=
e, we
> > +  would be likely to introduce regressions.
> > +
> > +- The name must describe the memory region the heap will allocate from=
, and
> > +  must uniquely identify it in a given platform. Since userspace appli=
cations
> > +  use the heap name as the discriminant, it must be able to tell which=
 heap it
> > +  wants to use reliably if there's multiple heaps.
> > +
> > +- The name must not mention implementation details, such as the alloca=
tor. The
> > +  heap driver will change over time, and implementation details when i=
t was
> > +  introduced might not be relevant in the future.
> > +
> > +- The name should describe properties of the buffers that would be all=
ocated.
> > +  Doing so will make heap identification easier for userspace. Such pr=
operties
> > +  are:
> > +
> > +  - ``contiguous`` for physically contiguous buffers;
> > +
> > +  - ``protected`` for encrypted buffers not accessible the OS;
> > +
> > +- The name may describe intended usage. Doing so will make heap identi=
fication
> > +  easier for userspace applications and users.
> > +
> > +For example, assuming a platform with a reserved memory region located=
 at the
> > +RAM address 0x42000000, intended to allocate video framebuffers, physi=
cally
> > +contiguous, and backed by the CMA kernel allocator, good names would be
> > +``memory@42000000-cacheable-contiguous`` or ``video@42000000``, but
>=20
> You dropped "cacheable" but left it here in the suggested names, maybe
> replace with "protected" here. Otherwise, LGTM,

Replacing it with protected would create an example where we have CMA
allocating protected buffers, which is pretty weird.

So I've only removed the cacheable mention, and will send a new version
shortly.

> Reviewed-by: Andrew Davis <afd@ti.com>

Thanks!
Maxime

--whtoihy75ghtpw24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIcy5gAKCRAnX84Zoj2+
dhYMAX9S94nCvbMrRrWrQiSsbQjN1CtoUA9QMx6gY4Z657x3s2dQS/qENGFSSGyn
rbLqeckBgO16oHKbdDr7ay/hCSD1vABF/Bud3kyewAIwiH0xa5SP0XSi6R+MYrQw
3spHFhOTXA==
=hsS/
-----END PGP SIGNATURE-----

--whtoihy75ghtpw24--
