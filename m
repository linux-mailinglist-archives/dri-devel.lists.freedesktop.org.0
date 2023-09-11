Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729179A798
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 13:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2269710E2CC;
	Mon, 11 Sep 2023 11:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B5510E2C9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 11:25:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 17F8DB81049;
 Mon, 11 Sep 2023 11:25:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F433C433C7;
 Mon, 11 Sep 2023 11:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694431526;
 bh=EawFgFNxTGjsJlWqhpuJ848r9v1XFD1NX8Vu8QQ6TjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jO0WffPeuErMHhfcC3J7dNtdQz66zQu2iwFfVzC1cMw8x/yE8ao1Bull7dXvgGRYu
 5cL2043vY5RhN4nqTmdXw6AgkX5DGJUzMs+Ul+hrPKtnyC2JFu2JFbuUVo/iZ7gmaL
 FesHFRoiYdYdWqcLu/cWHT5zryfwqQoqPN+eePSqCOqlWrXG6HdinHg+mzFvMyW8ii
 6PhKr/X39RAIPqc4noWg1Kqtqy0KemXXHgh0eGgQCHEOuSinP033sRAWIhUAaMHlm6
 4n8wQoox3WtnQpp4YGrcNtnKop/TQu9A9FT98fbrMzGVovmRJ4bZZkbCTExfJ9JwAT
 8eo2dzc+W1Dxg==
Date: Mon, 11 Sep 2023 13:25:23 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/2] kunit: Warn if tests are slow
Message-ID: <l2eeghk7kz4rzsvlvvsj4vayo5s4ctnrizwkjolhaa2p3xdz75@jcczdtol52y7>
References: <20230911-kms-slow-tests-v1-0-d3800a69a1a1@kernel.org>
 <20230911-kms-slow-tests-v1-1-d3800a69a1a1@kernel.org>
 <87leddf2fs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rllaj5tmvs7jz32f"
Content-Disposition: inline
In-Reply-To: <87leddf2fs.fsf@intel.com>
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
Cc: linux-kselftest@vger.kernel.org, David Gow <davidgow@google.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rllaj5tmvs7jz32f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Mon, Sep 11, 2023 at 01:07:35PM +0300, Jani Nikula wrote:
> On Mon, 11 Sep 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > Kunit recently gained support to setup attributes, the first one being
> > the speed of a given test, then allowing to filter out slow tests.
> >
> > A slow test is defined in the documentation as taking more than one
> > second. There's an another speed attribute called "super slow" but whose
> > definition is less clear.
> >
> > Add support to the test runner to check the test execution time, and
> > report tests that should be marked as slow but aren't.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  lib/kunit/test.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> > index 49698a168437..a3b924501f3d 100644
> > --- a/lib/kunit/test.c
> > +++ b/lib/kunit/test.c
> > @@ -379,6 +379,9 @@ static void kunit_run_case_internal(struct kunit *t=
est,
> >  				    struct kunit_suite *suite,
> >  				    struct kunit_case *test_case)
> >  {
> > +	struct timespec64 start, end;
> > +	struct timespec64 duration;
> > +
> >  	if (suite->init) {
> >  		int ret;
> > =20
> > @@ -390,7 +393,20 @@ static void kunit_run_case_internal(struct kunit *=
test,
> >  		}
> >  	}
> > =20
> > +	ktime_get_ts64(&start);
> > +
> >  	test_case->run_case(test);
> > +
> > +	ktime_get_ts64(&end);
> > +
> > +	duration =3D timespec64_sub(end, start);
> > +
> > +	if (duration.tv_sec >=3D 1 &&
> > +	    (test_case->attr.speed =3D=3D KUNIT_SPEED_UNSET ||
> > +	     test_case->attr.speed >=3D KUNIT_SPEED_NORMAL))
> > +		kunit_warn(test,
> > +			   "Test should be marked slow (runtime: %lld.%09lds)",
> > +			   duration.tv_sec, duration.tv_nsec);
>=20
> Two thoughts:
>=20
> Should there be some tolerance here? Otherwise we're flagging this on
> the slowest machines, and we'll be defining tests slow based on
> that. Like, warn if it takes more than 2 seconds.

I'm not sure what the expectation from David and Brendan are here. I'll
follow what they suggest, but with a couple of hundreds tests like we
have in DRM at the moment, the difference in run time can be up to 5
minutes :/

> What if someone makes a test faster, but forgets to update the
> attribute? Should we also flag slow tests that are in fact fast?

I'm not sure we can do that actually, because it certainly depends on
the hardware running the tests. So I would definitely expect most of the
slow tests to be running faster on some hardware.

Like, running kunit natively on my workstation clears all the DRM tests
in 6s, while it takes about 60s using qemu to test it on arm64, so they
would be considered slow on arm64 but not by default.

Maxime

--rllaj5tmvs7jz32f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZP75IwAKCRDj7w1vZxhR
xTcYAP9N6vHg5h6885y/C3Tc0z1f6IQ0dk+FGmjUeus+bW/YOQEAl7UhCwI0k+Hm
xYUWCTOJcXuebaOI4VfAA+udV4uSJgM=
=sWMz
-----END PGP SIGNATURE-----

--rllaj5tmvs7jz32f--
