Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCB78084E0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 10:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DABC10E842;
	Thu,  7 Dec 2023 09:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74AE710E197
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 09:42:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E1A1F62051;
 Thu,  7 Dec 2023 09:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFC9C433C7;
 Thu,  7 Dec 2023 09:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701942172;
 bh=RQ/yT7UHQaMM19x3eCi4Xe6CooZCw22QbB03I9HiZME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eA62PaghxUAe/vbJzjN51mMQUy96RPgMz38pPfpGglvkkos+dAh4/om6cyp0J0tsd
 YaTSsBkbGiIoMpMDpcs0CR2RTZbkVXNFtGBQZYzNe2tG9wFc5zxAiQ0tn4XA2NGV8p
 atWkAPDUaXOjFJW5d5jJKIn+bvml/bzSSa7dC+3tyuwMJCWCLuiqRLFBuYJG95YMCk
 zQ5neZLHUTRnUvCCJ2UV2TZFijRx20nQzXQDIRjaf/ROUlYRLXigWBrX5UHmawH8ha
 MfxH917s+QQRxjaHx3rHwuUvwmfPv0+Idi2FM3w8Xk3ZqI/up3t78e3xwMiDTs+obR
 g25gct1EXbi8A==
Date: Thu, 7 Dec 2023 10:42:49 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: Kunit drm_test_check_plane_state: EXPECTATION FAILED at
 drivers/gpu/drm/tests/drm_plane_helper_test.c:123
Message-ID: <xqydjcs4tnjcm7wn2dfah27xj7j2soggsc5se2inz2s4azxvvv@cf3wn4up5hg6>
References: <20231204173536.51003-1-naresh.kamboju@linaro.org>
 <rxv7jlfuwjib443pzdepbtgu454gdzemd3ojmmhbnhr4syneve@6me3bduyx2ee>
 <42d85b15-9ffd-4a08-b51e-a3367e57d128@suswa.mountain>
 <fgajgc7vp626nzeeqetkfbyadh53iti3mvoq4uck3zz3ysmvno@b3f7kxnwrwsd>
 <f59c5d45-a689-8a94-a2ae-d2ffa835eedf@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hnkt3fuafjt46lbw"
Content-Disposition: inline
In-Reply-To: <f59c5d45-a689-8a94-a2ae-d2ffa835eedf@quicinc.com>
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
 Naresh Kamboju <naresh.kamboju@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org,
 davidgow@google.com, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hnkt3fuafjt46lbw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 05, 2023 at 09:33:28AM -0800, Abhinav Kumar wrote:
>=20
>=20
> On 12/5/2023 3:46 AM, Maxime Ripard wrote:
> > On Tue, Dec 05, 2023 at 12:05:02PM +0300, Dan Carpenter wrote:
> > > On Tue, Dec 05, 2023 at 09:37:05AM +0100, Maxime Ripard wrote:
> > > > Hi Naresh,
> > > >=20
> > > > Thanks for the report
> > > >=20
> > > > On Mon, Dec 04, 2023 at 11:05:36PM +0530, Naresh Kamboju wrote:
> > > > > The Kunit drm_plane_helper failed on all devices running Linux ne=
xt-20231204
> > > > >=20
> > > > > ## Test Regressions (compared to next-20231201)
> > > > > * qemu-armv7, kunit and
> > > > > * x86, kunit
> > > > >    - drm_test_check_invalid_plane_state_downscaling_invalid
> > > > >    - drm_test_check_invalid_plane_state_drm_plane_helper
> > > > >    - drm_test_check_invalid_plane_state_drm_test_check_invalid_pl=
ane_state
> > > > >    - drm_test_check_invalid_plane_state_positioning_invalid
> > > > >    - drm_test_check_invalid_plane_state_upscaling_invalid
> > > > >    - drm_test_check_plane_state_clipping_rotate_reflect
> > > > >    - drm_test_check_plane_state_clipping_simple
> > > > >    - drm_test_check_plane_state_downscaling
> > > > >    - drm_test_check_plane_state_drm_test_check_plane_state
> > > > >    - drm_test_check_plane_state_positioning_simple
> > > > >    - drm_test_check_plane_state_rounding1
> > > > >    - drm_test_check_plane_state_rounding2
> > > > >    - drm_test_check_plane_state_rounding3
> > > > >    - drm_test_check_plane_state_rounding4
> > > > >    - drm_test_check_plane_state_upscaling
> > > >=20
> > > > I found the source of failure to be f1e75da5364e ("drm/atomic: Loos=
en FB
> > > > atomic checks").
> > > >=20
> > > > Fortunately for us, it's already been reverted yesterday for some
> > > > unrelated reason, so it should be fixed in next-20231205 onward.
> > >=20
> > > Sorry, that's a bummer that these patches were reverted.  :(  The who=
le
> > > episode was a bit unfortunate...
> > >=20
> > > Qualcom has been working on those patches for a year.  They must not =
be
> > > using kunit testing as part of their QC...  It's some kind of
> > > communication failure on our part.
> >=20
> > That's definitely a communication failure, but that's mostly on us :)
> >=20
> > The reason these patches were reverted was completely unrelated to the
> > kunit failures here: it failed the basic requirement we have on
> > intel-gpu-tools tests and open-source userspace examples for new uAPIs.
> >=20
> > So whether or not kunit tests would have passed, these patches were
> > applied due to inattention and would have been reverted anyway
>
> The patches were reverted because the corresponding IGT/compositor changes
> were not posted yet. We will re-try applying once those are accepted.
>=20
> Regarding KUnit tests, no we did not run this test and yes you are right,=
 we
> were not running KUnit testing as the DRM CI mainly validates IGT.
>=20
> We will certainly help to fix this failure. Most likely the KUnit tests n=
eed
> to be fixed to allow for a NULL FB.
>=20
> If this is documented somewhere as a requirement, please share it and we
> should add KUnit testing to our DRM CI as well so that atleast this kind =
of
> failure will not repeat.

Yeah, the expectation is that all tests pass all the time. If some
change affects how tests should be written, then it should update the
tests as well.

Maxime

--hnkt3fuafjt46lbw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXGTmQAKCRDj7w1vZxhR
xVrqAPICYw4use79tIO3c5T9xojmy55gENs9FntfRnmdJclxAP9yhtInNdWWnmWv
5MWm44qBvgog8AzSmnMIorkWlaNHCA==
=02hC
-----END PGP SIGNATURE-----

--hnkt3fuafjt46lbw--
