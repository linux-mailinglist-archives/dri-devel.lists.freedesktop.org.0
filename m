Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE57D8005E0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C50DE10E81A;
	Fri,  1 Dec 2023 08:38:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B6410E81A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:38:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B65ED620A0;
 Fri,  1 Dec 2023 08:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1222DC433C9;
 Fri,  1 Dec 2023 08:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701419897;
 bh=BF9TFx1XQRac5K0WxDFgJSLMvWyF3UMV5o7kl6PNa3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NUbR3C5Nni4f/AK5YCWL0GZf6G4OsCk6eTNWOASK4uFyMOSH0dxh2GOnmVZPc37ZI
 IeVg5DuQmbxU0fOsLeTgNUUh930IaFFN9cwRwd7mvzohJSwIbcXY6Brrr8pUOybC01
 4bNJUhqEWpNbc0K2P3m+OiNyjkYcMCZxd4l4cRnWJ8nx3nlaMVzIj27HW6vg7ZjrFq
 wJBq/S1/wxixgSRbBCrvxFcgtV/clGEziSghBb6GOUxz4042uxqUy6qpTGKs14eR4p
 qxxT31tdSRHCAYvndC6a/xn6lIbsydwDh4jWA/yR4qM+YX4gMN6YQj5pIOL/6YBi5V
 AJPExUEnfJwvQ==
Date: Fri, 1 Dec 2023 09:38:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marco Pagani <marpagan@redhat.com>
Subject: Re: [PATCH v5] drm/test: add a test suite for GEM objects backed by
 shmem
Message-ID: <gvnahzwy2r2bjw3nrfkyz2oqbtbvmhx3gkygiwujkrhshofvsh@g5qwttznv4ul>
References: <20231130171417.74162-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eanybzkzl3a5ywpt"
Content-Disposition: inline
In-Reply-To: <20231130171417.74162-1-marpagan@redhat.com>
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


--eanybzkzl3a5ywpt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 06:14:16PM +0100, Marco Pagani wrote:
> This patch introduces an initial KUnit test suite for GEM objects
> backed by shmem buffers.
>=20
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
> Signed-off-by: Marco Pagani <marpagan@redhat.com>
>=20
> v5:
> - using __drm_kunit_helper_alloc_drm_device() to avoid local struct
> v4:
> - Add missing MMU dependency for DRM_GEM_SHMEM_HELPER (kernel test robot)
> v3:
> - Explicitly cast pointers in the helpers
> - Removed unused pointer to parent dev in struct fake_dev
> - Test entries reordering in Kconfig and Makefile sent as a separate patch
> v2:
> - Improved description of test cases
> - Cleaner error handling using KUnit actions
> - Alphabetical order in Kconfig and Makefile

Applied to drm-misc-next, thanks!
Maxime

--eanybzkzl3a5ywpt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWmbdgAKCRDj7w1vZxhR
xd2VAQDEvdtX1QM/J4fJnipIrY/CcDfinJMPhqX/YZ3XI5PWyAD/VAJ1W1AT0Qav
/9ccIWyYaCF7NHxu8TIL/afyEbb7KAY=
=WKS7
-----END PGP SIGNATURE-----

--eanybzkzl3a5ywpt--
