Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B6785E00B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 15:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176D710E774;
	Wed, 21 Feb 2024 14:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e8+RZbwo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1062E10E774
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 14:41:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C6F6FCE1DF3;
 Wed, 21 Feb 2024 14:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C7BC433F1;
 Wed, 21 Feb 2024 14:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708526512;
 bh=EQF9KL1RT2lVZ7Xc3+VDawL+ZjdCN9kZA1uWFox451E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e8+RZbwoP4Gmf1Fbtkw60VHjWvXsG0ifLyAM2J+S0e7vmCPRk9y5sCyHy4p12Rb9E
 cMVnoPIVPirHjku5qiYdhSPL5zu+SjA8jtz0L3xSEUKkkefFVItIs/hOZTvpCULHi6
 wx3i47h8pwWbn7any3FjPK+E2iAzqVQmo7uQslQmDJ2Eg1A7ZzXEt7apYuPs3IHt8I
 RLKaEGmprNupovU/75faSMd55zokPKnzOblfoy+fPJNaIcqfufnyn0JmDFyBdo9e06
 ughyEFdoXQ0VAyuUeBTnu6rhpO2bn6uOWOIN3TF2VU6vAdDGCvLy62RPy75pi4RH+O
 g4CnldFCnleQg==
Date: Wed, 21 Feb 2024 15:41:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, 
 Erhard Furtner <erhard_f@mailbox.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>, 
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Karolina Stolarek <karolina.stolarek@intel.com>, 
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Memory Management List <linux-mm@kvack.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: Running ttm_device_test leads to list_add corruption. prev->next
 should be next (ffffffffc05cd428), but was 6b6b6b6b6b6b6b6b.
 (prev=ffffa0b1a5c034f0) (kernel 6.7.5)
Message-ID: <uddqboamqcnxwvnud5gmkkm4igvxj67xc2zw52iex5ahljtlb4@2e7ydoplg6rt>
References: <20240219230116.77b8ad68@yea> <ZdRtDOhQGQUm5X4d@archie.me>
 <9cdf0baa-f544-4fa8-bee3-568b790527cc@amd.com>
 <4xggxtkk44m3xcfucbougtuhr66s2pc7tilpnju7xnyw45facb@odsrpqp57kiz>
 <535f9089-b988-45ac-b3f3-a7d593861723@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="54nvwbweshimitzn"
Content-Disposition: inline
In-Reply-To: <535f9089-b988-45ac-b3f3-a7d593861723@amd.com>
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


--54nvwbweshimitzn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Tue, Feb 20, 2024 at 04:03:57PM +0100, Christian K=F6nig wrote:
> Am 20.02.24 um 15:56 schrieb Maxime Ripard:
> > On Tue, Feb 20, 2024 at 02:28:53PM +0100, Christian K=F6nig wrote:
> > > [SNIP]
> > > This kunit test is not meant to be run on real hardware, but rather j=
ust as
> > > stand a long kunit tests within user mode linux. I was assuming that =
it
> > > doesn't even compiles on bare metal.
> > >=20
> > > We should probably either double check the kconfig options to prevent
> > > compiling it or modify the test so that it can run on real hardware a=
s well.
> > I think any cross-compiled kunit run will be impossible to differentiate
> > from running on real hardware. We should just make it work there.
>=20
> The problem is what the unit test basically does is registering and
> destroying a dummy device to see if initializing and tear down of the glo=
bal
> pools work correctly.
>=20
> If you run on real hardware and have a real device

I assume you mean a real DRM device backed by TTM here, right?

> additionally to the dummy device the reference count of the global
> pool never goes down to zero and so it is never torn down.
>=20
> So running this test just doesn't make any sense in that environment.
> Any idea how to work around that?

I've added David, Brendan and Rae in Cc.

To sum up the problem, your tests are relying on the mock device created
to run a kunit test to be the sole DRM device in the system. But if you
compile a kernel with the kunit tests enabled and boot that on a real
hardware, then that assumption might not be true anymore and things
break apart. Is that a fair description?

If so, maybe we could detect if it's running under qemu or UML (if
that's something we can do in the first place), and then extend
kunit_attributes to only run that test if it's in a simulated
environment.

Maxime

--54nvwbweshimitzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdYLrAAKCRDj7w1vZxhR
xdN5AP0a2qM2svXKCp42Du8M5ceOwqA0Ro4VNIqTjfP71wm84wEAqBc0BtfBVIUp
WX9cTT9QW23f/XVrxJCgQkZF0UJvlg8=
=cUKm
-----END PGP SIGNATURE-----

--54nvwbweshimitzn--
