Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 355D2804C9D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:37:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013AA10E49E;
	Tue,  5 Dec 2023 08:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA38610E49E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:37:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 83B86CE0B03;
 Tue,  5 Dec 2023 08:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E7EC433C7;
 Tue,  5 Dec 2023 08:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701765428;
 bh=Gx0Gid6CgNqEt1nJzs1qtZqNtgefBQINfqVpJBkwASY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KMkY/aU4jWPbPqybwAqA+E6Cw/6E//QdRtkIJuI1KiaUk5E3XBpZYxYrOOzDvSAms
 mVzVRQYxa7YJIq3bgct69MgP9NvG81FiYy+m3pUvGv0VXOqJ9SMMPh/b6cPDO8cGI5
 b89f2mod3hvF60FqdRKO8iCMKV5B3jmNxAaTP8Lv4STdORnf0C6/VSz6+vEpZtaHgO
 pzSV1M/kcR0ReeKX9p6s+i0UYtgsmIm0xPUKRmHhBppiQphOxvpcbsfyk9wodlH4RW
 4Kkc/a7CXQsSZ8vFVUPGTf4vXMpDN7IULVmEfdLRBMjaQsuJe+2VBvpc1dGLfUcShL
 k8jcDiJ2UPMSg==
Date: Tue, 5 Dec 2023 09:37:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: Kunit drm_test_check_plane_state: EXPECTATION FAILED at
 drivers/gpu/drm/tests/drm_plane_helper_test.c:123
Message-ID: <rxv7jlfuwjib443pzdepbtgu454gdzemd3ojmmhbnhr4syneve@6me3bduyx2ee>
References: <20231204173536.51003-1-naresh.kamboju@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="avjzm6fep5gbbakc"
Content-Disposition: inline
In-Reply-To: <20231204173536.51003-1-naresh.kamboju@linaro.org>
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
Cc: regressions@lists.linux.dev, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org,
 dri-devel@lists.freedesktop.org, davidgow@google.com,
 Linux Kernel Functional Testing <lkft@linaro.org>, dan.carpenter@linaro.org,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--avjzm6fep5gbbakc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

Thanks for the report

On Mon, Dec 04, 2023 at 11:05:36PM +0530, Naresh Kamboju wrote:
> The Kunit drm_plane_helper failed on all devices running Linux next-20231=
204
>=20
> ## Test Regressions (compared to next-20231201)
> * qemu-armv7, kunit and
> * x86, kunit
>   - drm_test_check_invalid_plane_state_downscaling_invalid
>   - drm_test_check_invalid_plane_state_drm_plane_helper
>   - drm_test_check_invalid_plane_state_drm_test_check_invalid_plane_state
>   - drm_test_check_invalid_plane_state_positioning_invalid
>   - drm_test_check_invalid_plane_state_upscaling_invalid
>   - drm_test_check_plane_state_clipping_rotate_reflect
>   - drm_test_check_plane_state_clipping_simple
>   - drm_test_check_plane_state_downscaling
>   - drm_test_check_plane_state_drm_test_check_plane_state
>   - drm_test_check_plane_state_positioning_simple
>   - drm_test_check_plane_state_rounding1
>   - drm_test_check_plane_state_rounding2
>   - drm_test_check_plane_state_rounding3
>   - drm_test_check_plane_state_rounding4
>   - drm_test_check_plane_state_upscaling

I found the source of failure to be f1e75da5364e ("drm/atomic: Loosen FB
atomic checks").

Fortunately for us, it's already been reverted yesterday for some
unrelated reason, so it should be fixed in next-20231205 onward.

Maxime

--avjzm6fep5gbbakc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZW7hKAAKCRDj7w1vZxhR
xdLHAQCBq1TbsVGexMuiakZrs0ljSHEFqv6BDxICWNEamhhfPwEAnZl6aajng8Dm
yG/mkv/gJ4qnjDD0+M21kXMNe6WCkQc=
=ckFT
-----END PGP SIGNATURE-----

--avjzm6fep5gbbakc--
