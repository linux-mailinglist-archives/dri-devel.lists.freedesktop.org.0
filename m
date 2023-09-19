Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 509BC7A5EC5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 11:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D4F10E362;
	Tue, 19 Sep 2023 09:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE98F10E362
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 09:53:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 22DD16155F;
 Tue, 19 Sep 2023 09:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF0BC433C9;
 Tue, 19 Sep 2023 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695117234;
 bh=jM06oldMyl65bSUdYLjPqkp6JGq8OZNw9wg+7ieMKJI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XS25igy10ljp+IXCrZXM88eUqd9TyrMew/EetWxspCNiiRJXbYIdyTx85HNdmln6z
 R9HAZhkem4c6jyzM8A+TwQxwxTAMNINsFvXraC3713+VCc8XIOHDZej2apV5+gF5GS
 umvYzdgW+dhh3P2SIlbjwKN1Tuie+01VMUXONooaxSQwlV2cDaF3m2eJCrqn0CvBjM
 q1ENRQu5uVqtlcaFx1SwdCyyKfwpg4uRaildRS29aXEhUbCXuM5hZqBB5wPU9tgmAQ
 lGTBliMgGF3SelnOUxxAWUNX8QfdYUdyMouoL46FFfh2FvSdJrwIEkYMMTtoesXhvm
 emaXkXf+nMeAg==
Date: Tue, 19 Sep 2023 11:53:52 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
Message-ID: <wnqnhvv2poy3alr5uiegunc7wk6fpt6opmeckdzxhc7tr4fbdm@sena7vlfh4t6>
References: <9a2b1ad8-4359-4f12-b4f9-c1de477bc440@collabora.com>
 <mnjcsiqjqdnvbbkaaz5r4n42e56qsax667r7radzyagnmmfkip@dfi64z5deqzj>
 <b7d96985-8489-efe2-db67-1f3108e26822@mailbox.org>
 <5ejq3hjpoy3gxft2jbmoa5m656usetuxcs7g3ezyyiitj67rav@r5jhdz27foat>
 <550454b8-2e2c-c947-92c5-37f0367661c2@mailbox.org>
 <os2wvkangif2nwewfbzkuyjm7njp4g3sqj5td3ogbhhjwsrbbd@3jpf6g5hd3z4>
 <CAPj87rP1sw49Z0HdPhUa-=kDp166RqiuhC9rL+Ef9hpwPD5+JA@mail.gmail.com>
 <krhnfc4os5nqwi3iixgxwads3jbcgtdcvn7ygxpvd62uaejvsk@mx6tmser7jti>
 <CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com>
 <8c5d6bf2-f034-c702-5e99-6daea6d56443@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qzi5si6i7asvr3sl"
Content-Disposition: inline
In-Reply-To: <8c5d6bf2-f034-c702-5e99-6daea6d56443@collabora.com>
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
Cc: emma@anholt.net, linux-doc@vger.kernel.org, vignesh.raman@collabora.com,
 dri-devel@lists.freedesktop.org, alyssa@rosenzweig.io, jbrunet@baylibre.com,
 robdclark@google.com, corbet@lwn.net, khilman@baylibre.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 linux-rockchip@lists.infradead.org, Daniel Stone <daniels@collabora.com>,
 martin.blumenstingl@googlemail.com, robclark@freedesktop.org,
 anholt@google.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qzi5si6i7asvr3sl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 18, 2023 at 06:35:13PM -0300, Helen Koike wrote:
> > > > I don't quite see the same picture from your side though. For examp=
le,
> > > > my reading of what you've said is that flaky tests are utterly
> > > > unacceptable, as are partial runs, and we shouldn't pretend otherwi=
se.
> > > > With your concrete example (which is really helpful, so thanks), wh=
at
> > > > happens to the MT8173 hdmi-inject test? Do we skip all MT8173 testi=
ng
> > > > until it's perfect, or does MT8173 testing always fail because that
> > > > test does?
> > >=20
> > > It's not clear to me why that test is even running in the first place?
> > > There's been some confusion on my side here about what we're going to
> > > test with this. You've mentioned Mesa and GPUs before, but that's a K=
MS
> > > test so there must be more to it.
> > >=20
> > > Either way, it's a relevant test so I guess why not. It turns out that
> > > the test is indeed flaky, I guess we could add it to the flaky tests
> > > list.
> > >=20
> > > BUT
> > >=20
> > > I want to have every opportunity to fix whatever that failure is.
> >=20
> > Agreed so far!
> >=20
> > > So:
> > >=20
> > >    - Is the test broken? If so, we should report it to IGT dev and re=
move
> > >      it from the test suite.
> > >    - If not, is that test failure have been reported to the driver au=
thor?
> > >    - If no answer/fix, we can add it to the flaky tests list, but do =
we
> > >      have some way to reproduce the test failure?
> > >=20
> > > The last part is especially critical. Looking at the list itself, I h=
ave
> > > no idea what board, kernel version, configuration, or what the failure
> > > rate was. Assuming I spend some time looking at the infra to find the
> > > board and configuration, how many times do I have to run the tests to
> > > expect to reproduce the failure (and thus consider it fixed if it
> > > doesn't occur anymore).
> > >=20
> > > Like, with that board and test, if my first 100 runs of the test work
> > > fine, is it reasonable for me to consider it fixed, or is it only
> > > supposed to happen once every 1000 runs?
>=20
> I wonder if this should be an overall policy or just let the maintainer to
> decide.
>=20
> In any case these stress tests must be run from time to time to verify if
> flakes are still flakes. We could do it automatically but we need to
> evaluate how to do it properly so it doesn't overload the infra.

That would be a great thing to do, but we can also reasonably expect
that we will have other farms that may not run those tests on a regular
basis, and we will have some manual testing too so I think it's still
valuable.

> > > So, ideally, having some (mandatory) metadata in the test lists with a
> > > link to the bug report, the board (DT name?) it happened with, the
> > > version and configuration it was first seen with, and an approximation
> > > of the failure rate for every flaky test list.
> > >=20
> > > I understand that it's probably difficult to get that after the fact =
on
> > > the tests that were already merged, but I'd really like to get that
> > > enforced for every new test going forward.
> > >=20
> > > That should hopefully get us in a much better position to fix some of
> > > those tests issues. And failing that, I can't see how that's
> > > sustainable.
> >=20
> > OK yeah, and we're still agreed here. That is definitely the standard
> > we should be aiming for.  It is there for some - see
> > drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt, but should be
> > there for the rest, it's true. (The specific board/DT it was observed
> > on can be easily retconned because we only run on one specific board
> > type per driver, again to make things more predictable; we could go
> > back and retrospectively add those in a header comment?)
> >=20
> > For flakes, it can be hard to pin them down, because, well, they're
> > flaky. Usually when we add things in Mesa (sorry to keep coming back
> > to Mesa - it's not to say that it's the objective best thing that
> > everything should follow, only that it's the thing we have the most
> > experience with that we know works well), we do a manual bisect and
> > try to pin the blame on a specific merge request which looks like the
> > most likely culprit. If nothing obvious jumps out, we just note when
> > it was first observed and provide some sample job logs. But yeah, it
> > should be more verbose.
> >=20
> > FWIW, the reason it wasn't done here - not to say that it shouldn't
> > have been done better, but here we are - is that we just hammered a
> > load of test runs, vacuumed up the results with a script, and that's
> > what generated those files. Given the number of tests and devices, it
> > was hard to narrow each down individually, but yeah, it is something
> > which really wants further analysis and drilling into. It's a good
> > to-do, and I agree it should be the standard going forward.
>=20
> Yes, during development I was just worried about to get a pipeline that
> would succeed most of the time (otherwise people would start ignoring when
> it fails), so they just got run a couple of times and a script filled the
> flakes list.
> For me the idea was "let's get a starting point" first, but yeah, we need=
 to
> improve how we deal with it from now on.

Yeah, like I said, there's not much we can do for those 250-ish flakes
we currently have in tree at the moment. I'd prefer to stay at 250 tests
with not enough context than keep expanding that list :)

> > > And Mesa does show what I'm talking about:
> > >=20
> > > $ find -name *-flakes.txt | xargs git diff --stat  e58a10af640ba58b60=
01f5c5ad750b782547da76
> > > [...]
> > >=20
> > > In the history of Mesa, there's never been a single test removed from=
 a
> > > flaky test list.
> >=20
> > As Rob says, that's definitely wrong. But there is a good point in
> > there: how do you know a test isn't flaky anymore? 100 runs is a
> > reasonable benchmark, but 1000 is ideal. At a 1% failure rate, with 20
> > devices, that's just too many spurious false-fails to have a usable
> > workflow.
> >=20
> > We do have some tools to make stress testing easier, but those need to
> > be better documented. We'll fix that. The tools we have which also
> > pull out the metadata etc also need documenting - right now they
> > aren't because they're under _extremely_ heavy development, but they
> > can be further enhanced to e.g. pull out the igt results automatically
> > and point very clearly to the cause. Also on the to-do.
> >=20
> > > > Only maintainers can actually fix the drivers (or the tests tbf). B=
ut
> > > > doing the testing does let us be really clear to everyone what the
> > > > actual state is, and that way people can make informed decisions to=
o.
> > > > And the only way we're going to drive the test rate down is by the
> > > > subsystem maintainers enforcing it.
> > >=20
> > > Just FYI, I'm not on the other side of the fence there, I'd really li=
ke
> > > to have some kind of validation. I talked about it at XDC some years
> > > ago, and discussed it several people at length over the years. So I'm
> > > definitely not in the CI-is-bad camp.
> > >=20
> > > > Does that make sense on where I'm (and I think a lot of others are)
> > > > coming from?
> > >=20
> > > That makes sense from your perspective, but it's not clear to me how =
you
> > > can expect maintainers to own the tests if they were never involved in
> > > the process.
> > >=20
> > > They are not in Cc of the flaky tests patches, they are not reported
> > > that the bug is failing, how can they own that process if we never
> > > reached out and involved them?
> > >=20
> > > We're all overworked, you can't expect them to just look at the flaky
> > > test list every now and then and figure it out.
> >=20
> > Absolutely. We got acks (or at least not-nacks) from the driver
> > developers, but yeah, they should absolutely be part of the loop for
> > those updates. I don't think we can necessarily block on them though.
> > Say we add vc4 KMS tests, then after a backmerge we start to see a
> > bunch of flakes on it, but you're sitting on a beach for a couple of
> > weeks. If we wait for you to get back, see it, and merge it, then
> > that's two weeks of people submitting Rockchip driver changes and
> > getting told that their changes failed CI. That's exactly what we want
> > to avoid, because it erodes confidence and usefulness of CI when
> > people expect failures and ignore them by default.
> >=20
> > So I would say that it's reasonable for expectations to be updated
> > according to what actually happens in practice, but also to make sure
> > that the maintainers are explicitly informed and kept in the loop, and
> > not just surprised when they look at the lists and see a bunch of
> > stuff happened without their knowledge.
>=20
> I was thinking in adding entries in MAINTAINERS file pointing to each
> flake/skip/fails list file to their maintainers, so get_maintainers.pl can
> return the right thing.

Yeah, I think it's the best thing to do at the moment. It's cheap and
will work ok.

Maxime

--qzi5si6i7asvr3sl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQlvsAAKCRDj7w1vZxhR
xdV4AQDKBqyhTbR670C0VpI7Y9MnnTOyZTdfSpRh6rNX6gW9tgD9EbT5t2EvmzeQ
AfeMKWBNB/fZ7Zb5x0L/T2N5s/acZAQ=
=cQU6
-----END PGP SIGNATURE-----

--qzi5si6i7asvr3sl--
