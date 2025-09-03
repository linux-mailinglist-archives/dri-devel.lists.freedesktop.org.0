Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE588B4183B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 10:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D5F10E11F;
	Wed,  3 Sep 2025 08:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VPMgBxkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C52C10E11F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 08:19:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CF5594023B;
 Wed,  3 Sep 2025 08:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA14C4CEF0;
 Wed,  3 Sep 2025 08:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756887574;
 bh=ilN+/yAmoLmQjIzw3UStMiE7Qavd0DtdX0dNqv99F4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VPMgBxkXyGSAykeqqPV415F2hVWsKGG1mCM0w+itSw8TChsGfGmn4oQS/xxaflF22
 XkIND2pDyun4knuAl6aqELJtLBDOBVA9Yinn7Z43l1PI8G6yleHd2tlVY4RtaGVwsl
 SnMxEhNXrd4eiFy6bY2jOUmiQDUM7oMvjuqHy4DyCsL33vFRNoO/qGT7NRzxWObITa
 T0voKb+BFT7ZOwqaPQKJyht/9U6b0JO4dBnZZeMhGxVlKpOa2jmVlVv7ZzgQKDQGs1
 yk7STw5pNK9DkUHC1OtjVmtc2DQ8k+BmvUJ1Vhj6coDJ2GCSFYshG04ueerH9jBu07
 7mBBex5a0LrHw==
Date: Wed, 3 Sep 2025 10:19:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits
 results to png
Message-ID: <20250903-benevolent-boobook-of-wholeness-e631f9@penduick>
References: <20250821095228.648156-1-jfalempe@redhat.com>
 <20250821095228.648156-4-jfalempe@redhat.com>
 <923276d2-9240-48bd-95df-13b4e9e23dcd@suse.de>
 <7ff51c5b-939e-47d9-8c3b-3c596565d114@redhat.com>
 <pucvcimuuyz7f7ih7hx7l6bmutarlryvzwiqh7a26bk65ya5sf@uj7agoqm4lm3>
 <533c2197-d7bb-4294-a094-c4f993a5893c@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vwzls2bjg3vxobva"
Content-Disposition: inline
In-Reply-To: <533c2197-d7bb-4294-a094-c4f993a5893c@redhat.com>
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


--vwzls2bjg3vxobva
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits
 results to png
MIME-Version: 1.0

On Wed, Sep 03, 2025 at 09:30:23AM +0200, Jocelyn Falempe wrote:
> On 02/09/2025 18:58, Maxime Ripard wrote:
> > On Mon, Sep 01, 2025 at 03:04:26PM +0200, Jocelyn Falempe wrote:
> > > On 27/08/2025 12:45, Thomas Zimmermann wrote:
> > > > Hi
> > > >=20
> > > > Am 21.08.25 um 11:49 schrieb Jocelyn Falempe:
> > > > > This is a bit hacky, but very handy if you want to customize the
> > > > > panic screen.
> > > > > It allows to dump the generated images to the logs, and then a py=
thon
> > > > > script can convert it to .png files. It makes it easy to check how
> > > > > the panic screen will look on different resolutions, without havi=
ng
> > > > > to crash a VM.
> > > > > To not pollute the logs, it uses a monochrome framebuffer, compre=
ss
> > > > > it with zlib, and base64 encode it.
> > > >=20
> > > > May I suggest to export the raw image via debugfs? Debugfs can also
> > > > export additional information in additional files, such as width/he=
ight/
> > > > stride/format. This could provide the real/last image on the fly, s=
imply
> > > > by reading the files. No workarounds or encodings needed.
> > >=20
> > > I'm looking into that. The difficulty is to get the debugfs content o=
utside
> > > of the test kernel. As I'm using a uml kernel for testing, I will nee=
d a
> > > special initrd, and a way to share files with the host.
> >=20
> > Yeah, I agree that it's not very practical. If only because the test
> > context doesn't stick around once it's been executed, so you would
> > effectively leak an arbritrarily long buffer with no hope of getting
> > back its memory.
>=20
> I've made a prototype with debugfs, a small ramdisk with busybox, and usi=
ng
> hostfs to mount the host filesystem in the uml kernel, and it allows to d=
ump
> the raw panic buffer easily.
> Even if it's a bit more complex to setup, I think this use case is not
> really a kunit test, so it's probably better that way.
>=20
> Let me a few days to clean that up, and I will send a v2 of the kunit tes=
ts,
> and a new series to add a debugfs interface.
>=20
> Thanks for your reviews,

We also have to think about how it's going to be shipped and used. If
your debugfs integration has to be disabled everytime we're running
kunit through uml, qemu, and in CI (because we can't retrieve the
result), on a live system (because it would leak memory indefinitely),
how is it useful?

The diagnostic lines are part of the test result, are in the logs, and
can be distributed. You're having all those problems solved already,
without having any additional work to do.

Maxime

--vwzls2bjg3vxobva
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLf6EwAKCRAnX84Zoj2+
dmNbAYDbFTPY+oVjuG+Cjj9zFiJJv0tv/7KUMLP/wm+E+ln2A1cF8GQdaTl79Py/
3jfKKfYBgPD8z3ernIBP3zst6hvHqL+EWGPjcjgFieAo37hYbdYRLiLXCPY7zFGo
QN1zO/q9AA==
=+q2Z
-----END PGP SIGNATURE-----

--vwzls2bjg3vxobva--
