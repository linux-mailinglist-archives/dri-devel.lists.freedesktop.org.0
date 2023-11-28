Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54317FBBA1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B4310E528;
	Tue, 28 Nov 2023 13:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7734510E528
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:32:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 31C0FB81A20;
 Tue, 28 Nov 2023 13:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2F1C433C8;
 Tue, 28 Nov 2023 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701178320;
 bh=XaLbU8H1rEGdfg4Iqk3KSxG5DRQC6e/xw+Mqlqs3K+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TGtQ2wczoebGP3LbwJj1/8gibC1gvR9QIsZGJlC9Ue0O/39oySnC/PSQyfB6qFfvV
 3KhpsAhLGFAvlyzVwVTygKq4p5MyJ5WY2v7x9qSgl03OrNd9NfIonsjCz3uNLI252M
 jnaw639UHdJZirBm6ZMad7l4dfjlj1LqQtQcwge24d6Zc9alhZcZc6IFyuttGMkruE
 zogVQ/ygyP+UQJJv1TJzVvbMSZMhy+fwNMbw59cYacbimXjmMb/rw1akVnidxHUQKX
 3N/OkOUa/1W6OERP5EoJcXB7zzP+OxNlxZsCYZhqivWl7Y8pNQMRwj72n5SDtWPMR4
 9E4LAeg0pN6DA==
Date: Tue, 28 Nov 2023 14:31:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marco Pagani <marpagan@redhat.com>
Subject: Re: [PATCH v4] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <wmv55cgrjx343k2pvdlnigrtehv6oq7hiss3k24xmwec7hepes@riq75ckh7eh5>
References: <20231123100147.212645-1-marpagan@redhat.com>
 <dkh6t5cya7tw4wz5aqrgvnqqnyzzgvbyvezxexy6pyspju5qbd@cdl4vvs7kvnt>
 <9fb1cd9d-89cb-4f45-9d0c-9f0102e000e6@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xa3olno3bho23d7h"
Content-Disposition: inline
In-Reply-To: <9fb1cd9d-89cb-4f45-9d0c-9f0102e000e6@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Christian Koenig <christian.koenig@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xa3olno3bho23d7h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 11:15:12AM +0100, Marco Pagani wrote:
>=20
>=20
> On 2023-11-24 09:49, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Thu, Nov 23, 2023 at 11:01:46AM +0100, Marco Pagani wrote:
> >> +static int drm_gem_shmem_test_init(struct kunit *test)
> >> +{
> >> +	struct device *dev;
> >> +	struct fake_dev {
> >> +		struct drm_device drm_dev;
> >> +	} *fdev;
> >> +
> >=20
> > [...]
> >=20
> >> +
> >> +	/*
> >> +	 * The DRM core will automatically initialize the GEM core and create
> >> +	 * a DRM Memory Manager object which provides an address space pool
> >> +	 * for GEM objects allocation.
> >> +	 */
> >> +	fdev =3D drm_kunit_helper_alloc_drm_device(test, dev, struct fake_de=
v,
> >> +						 drm_dev, DRIVER_GEM);
> >> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fdev);
> >=20
> > Sorry I missed it earlier, but you don't need the intermediate structure
> > if you use
> >=20
> > struct drm_device *drm;
> >=20
> > drm =3D __drm_kunit_helper_alloc_drm_device(test, dev, sizeof(*drm), 0,=
 DRIVER_GEM);
> > KUNIT_ASSERT_NOT_ERR_OR_NULL(test, drm);
> >
>=20
> I prefer to use drm_kunit_helper_alloc_drm_device() with the intermediate
> structure. It makes the code clearer, in my opinion. Initially, when
> developing the suite, I was using __drm_kunit_helper_alloc_drm_device()
> as most test suites do, but I feel the list of arguments including
> "sizeof(*drm), 0," is less straightforward to understand.

Then we can create an init helper, and you can allocate the drm_device
through drmm_kzalloc, but I'd like tests to use consistent constructs.

This can of course be made as a later patch: you use the same construct
the other tests do here, and later we work on the init function and
convert all tests to use it.

Maxime

--xa3olno3bho23d7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWXrzgAKCRDj7w1vZxhR
xSfVAPsF1Ca6WiaICCCMiadpBZDVn0JEV/LwVOotZsctwQGtpQEA2rrnLlTgWe0H
4ABF/XTvcd0zP3qiEHeNWwTFCT8/swE=
=SzdI
-----END PGP SIGNATURE-----

--xa3olno3bho23d7h--
