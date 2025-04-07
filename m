Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131B5A7DDC4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 14:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A57410E0F3;
	Mon,  7 Apr 2025 12:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cIOkmgSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A2B10E0F3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 12:35:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A17755C049A;
 Mon,  7 Apr 2025 12:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87FBC4CEDD;
 Mon,  7 Apr 2025 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744029309;
 bh=LZtCZhrq/j20h74c70XZWF4FnHaFn9BU+I9ulwZRlIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cIOkmgSjS30KJqPARWW8wI/QfKkbDqug8EKl/sn2KOMlp+S9T6P6c+75Px3KoMPpF
 RQC2KtREWv5PLx7XF/pjDjGO6QfIBMIpnze7biNKnnELJh65QYmRVVM0s1lXHDfE1h
 6/lfiZpqmt+iJLO2dKAU33/oQfpFiP+d5rCeG5yJpWpxChVPm8TBFElkYDn1Tz6Q9A
 bhq1HgY2p17LMqfpzgB4rqPa2OKQInBbAv+IkHl0blDSz9rnl4nomW6q4cll58oBSr
 i0mXxjivDMu2/F/3kwJC8Td9dzsbQ7RYsAXaxJXgvCOXo5TPsZ2CzDPYGCwQW0nfcG
 OJAxlk/8GXwqg==
Date: Mon, 7 Apr 2025 14:35:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, 
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 valentine.burley@collabora.com, 
 lumag@kernel.org, quic_abhinavk@quicinc.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] drm/ci: Add jobs to run KUnit tests
Message-ID: <20250407-laughing-mauve-cricket-86e1e0@houat>
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-4-vignesh.raman@collabora.com>
 <20250328-idealistic-invisible-unicorn-961d67@houat>
 <11f27552-9fac-4d96-980c-dcfcb093fa54@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ev2lugbvzjpsenvx"
Content-Disposition: inline
In-Reply-To: <11f27552-9fac-4d96-980c-dcfcb093fa54@collabora.com>
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


--ev2lugbvzjpsenvx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 3/3] drm/ci: Add jobs to run KUnit tests
MIME-Version: 1.0

On Tue, Apr 01, 2025 at 07:47:16AM +0530, Vignesh Raman wrote:
> On 28/03/25 20:40, Maxime Ripard wrote:
> > On Thu, Mar 27, 2025 at 09:31:12PM +0530, Vignesh Raman wrote:
> > > Add jobs to run KUnit tests using tools/testing/kunit/kunit.py tool.
> > >=20
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > ---
> > >   drivers/gpu/drm/ci/gitlab-ci.yml |  1 +
> > >   drivers/gpu/drm/ci/kunit.sh      | 34 +++++++++++++++++++++++++++++=
+++
> > >   drivers/gpu/drm/ci/kunit.yml     | 19 ++++++++++++++++++
> > >   3 files changed, 54 insertions(+)
> > >   create mode 100755 drivers/gpu/drm/ci/kunit.sh
> > >   create mode 100644 drivers/gpu/drm/ci/kunit.yml
> > >=20
> > > diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gi=
tlab-ci.yml
> > > index 9e61b49e9960..90ae57ca86a1 100644
> > > --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> > > +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> > > @@ -109,6 +109,7 @@ include:
> > >     - drivers/gpu/drm/ci/build.yml
> > >     - drivers/gpu/drm/ci/test.yml
> > >     - drivers/gpu/drm/ci/check-devicetrees.yml
> > > +  - drivers/gpu/drm/ci/kunit.yml
> > >     - 'https://gitlab.freedesktop.org/gfx-ci/lab-status/-/raw/main/la=
b-status.yml'
> > > diff --git a/drivers/gpu/drm/ci/kunit.sh b/drivers/gpu/drm/ci/kunit.sh
> > > new file mode 100755
> > > index 000000000000..197b19d05fba
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/ci/kunit.sh
> > > @@ -0,0 +1,34 @@
> > > +#!/bin/bash
> > > +# SPDX-License-Identifier: MIT
> > > +
> > > +set -euxo pipefail
> > > +
> > > +case "${KERNEL_ARCH}" in
> > > +    "arm")
> > > +        QEMU_PKG=3D"qemu-system-arm"
> > > +        GCC_ARCH=3D"arm-linux-gnueabihf"
> > > +        ;;
> > > +    "arm64")
> > > +        QEMU_PKG=3D"qemu-system-aarch64"
> > > +        GCC_ARCH=3D"aarch64-linux-gnu"
> > > +        ;;
> > > +    "x86_64")
> > > +        QEMU_PKG=3D"qemu-system-x86"
> > > +        GCC_ARCH=3D"x86_64-linux-gnu"
> > > +        ;;
> > > +    *)
> > > +        echo "Unsupported architecture: ${KERNEL_ARCH}"
> > > +        exit 1
> > > +        ;;
> > > +esac
> > > +
> > > +export ARCH=3D"${KERNEL_ARCH}"
> > > +export CROSS_COMPILE=3D"${GCC_ARCH}-"
> > > +
> > > +apt-get update -qq && apt-get install -y --no-install-recommends "${=
QEMU_PKG}"
> >=20
> > Thanks for working on that.
> >=20
> > I'm a bit concerned about using making it entirely debian specific here.
> > Between the call to apt, the gcc triplet and the qemu package name, this
> > not really a script to run kunit tests, but to run them on Debian :)
> >=20
> > We should make it pretty explicit and / or just assume the runner has
> > the right packages and call kunit directly.
>=20
> Agree. This script is debian specific. I will move the debian bits to yaml
> job and make the script generic.

Using LLVM there is probably more convenient, since you don't have to
deal with the triplet at all when cross-compiling.

Maxime

--ev2lugbvzjpsenvx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ/PGeQAKCRDj7w1vZxhR
xTDVAQC6xt/UjwNMMbl0m9/DXn6O8sgVlF4vAhcWSdDj/qwGBAEApIfgtZr0Nhap
1GKn9Vr5iwAy2gwMeaAcAju62Wf1hwY=
=ix8r
-----END PGP SIGNATURE-----

--ev2lugbvzjpsenvx--
