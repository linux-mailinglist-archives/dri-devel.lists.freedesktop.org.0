Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593E97A5E86
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 11:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBEA10E261;
	Tue, 19 Sep 2023 09:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A419710E261
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 09:48:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 123D1B81180;
 Tue, 19 Sep 2023 09:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28990C433C8;
 Tue, 19 Sep 2023 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695116890;
 bh=ClUnVtWUvKdRLOl8X1CodtVltez9xXmineCsN1YQ+f8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UmszoMlYDUrVeWfZ/pxS9QsA++dilt8mT7Sk1RRIvEMvdSNMSngW42lKt+25ajl5c
 RLjeo2mPt6aN0UTGVkAoF11lgiezl7+hLGHPC2qajRK9dC/KxRAh7yyJfWvILqgpTX
 L6Lzh322y40cNS8+FmNoPuEOm9RVhQ2zCZzT4zeeMgNMkGKvZR94UarLs4slX/S54w
 rhzZie+tOyNCBeZC+5mv6pPpeWiKskuJsOShusPed75k7ahe7FplFggwupejCtcFB8
 nLi07SjWcKIlzHUUjGGaz1XTgIfvA37IgTHdGprbNUAk+WgKjv5QH2ZKTFYmVT7Vau
 VW35NydawjDMA==
Date: Tue, 19 Sep 2023 11:48:08 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
Message-ID: <ax6tspeffujmk2vpvh6rwclqkkavpezvcubra25vs2ev7f5njs@2rpnycg2rgnj>
References: <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
 <9a2b1ad8-4359-4f12-b4f9-c1de477bc440@collabora.com>
 <mnjcsiqjqdnvbbkaaz5r4n42e56qsax667r7radzyagnmmfkip@dfi64z5deqzj>
 <b7d96985-8489-efe2-db67-1f3108e26822@mailbox.org>
 <5ejq3hjpoy3gxft2jbmoa5m656usetuxcs7g3ezyyiitj67rav@r5jhdz27foat>
 <550454b8-2e2c-c947-92c5-37f0367661c2@mailbox.org>
 <os2wvkangif2nwewfbzkuyjm7njp4g3sqj5td3ogbhhjwsrbbd@3jpf6g5hd3z4>
 <CAPj87rP1sw49Z0HdPhUa-=kDp166RqiuhC9rL+Ef9hpwPD5+JA@mail.gmail.com>
 <krhnfc4os5nqwi3iixgxwads3jbcgtdcvn7ygxpvd62uaejvsk@mx6tmser7jti>
 <CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eic3ovvs3ifmbbpq"
Content-Disposition: inline
In-Reply-To: <CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com>
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
 Helen Koike <helen.koike@collabora.com>, anholt@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eic3ovvs3ifmbbpq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2023 at 04:08:42PM +0100, Daniel Stone wrote:
> > > I don't quite see the same picture from your side though. For example,
> > > my reading of what you've said is that flaky tests are utterly
> > > unacceptable, as are partial runs, and we shouldn't pretend otherwise.
> > > With your concrete example (which is really helpful, so thanks), what
> > > happens to the MT8173 hdmi-inject test? Do we skip all MT8173 testing
> > > until it's perfect, or does MT8173 testing always fail because that
> > > test does?
> >
> > It's not clear to me why that test is even running in the first place?
> > There's been some confusion on my side here about what we're going to
> > test with this. You've mentioned Mesa and GPUs before, but that's a KMS
> > test so there must be more to it.
> >
> > Either way, it's a relevant test so I guess why not. It turns out that
> > the test is indeed flaky, I guess we could add it to the flaky tests
> > list.
> >
> > BUT
> >
> > I want to have every opportunity to fix whatever that failure is.
>=20
> Agreed so far!
>=20
> > So:
> >
> >   - Is the test broken? If so, we should report it to IGT dev and remove
> >     it from the test suite.
> >   - If not, is that test failure have been reported to the driver autho=
r?
> >   - If no answer/fix, we can add it to the flaky tests list, but do we
> >     have some way to reproduce the test failure?
> >
> > The last part is especially critical. Looking at the list itself, I have
> > no idea what board, kernel version, configuration, or what the failure
> > rate was. Assuming I spend some time looking at the infra to find the
> > board and configuration, how many times do I have to run the tests to
> > expect to reproduce the failure (and thus consider it fixed if it
> > doesn't occur anymore).
> >
> > Like, with that board and test, if my first 100 runs of the test work
> > fine, is it reasonable for me to consider it fixed, or is it only
> > supposed to happen once every 1000 runs?
> >
> > So, ideally, having some (mandatory) metadata in the test lists with a
> > link to the bug report, the board (DT name?) it happened with, the
> > version and configuration it was first seen with, and an approximation
> > of the failure rate for every flaky test list.
> >
> > I understand that it's probably difficult to get that after the fact on
> > the tests that were already merged, but I'd really like to get that
> > enforced for every new test going forward.
> >
> > That should hopefully get us in a much better position to fix some of
> > those tests issues. And failing that, I can't see how that's
> > sustainable.
>=20
> OK yeah, and we're still agreed here. That is definitely the standard
> we should be aiming for.  It is there for some - see
> drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt, but should be
> there for the rest, it's true. (The specific board/DT it was observed
> on can be easily retconned because we only run on one specific board
> type per driver, again to make things more predictable; we could go
> back and retrospectively add those in a header comment?)

Yeah, metadata was meant to sound professional, but putting all that in
a somewhat parseable comment is good enough for me :)

> For flakes, it can be hard to pin them down, because, well, they're
> flaky. Usually when we add things in Mesa (sorry to keep coming back
> to Mesa - it's not to say that it's the objective best thing that
> everything should follow, only that it's the thing we have the most
> experience with that we know works well), we do a manual bisect and
> try to pin the blame on a specific merge request which looks like the
> most likely culprit. If nothing obvious jumps out, we just note when
> it was first observed and provide some sample job logs. But yeah, it
> should be more verbose.

Sure, I guess we should document that for flakes, it's not meant as a
precise indication. Still it provides some kind of "time anchor". If it
was first observed 10 years ago and I can't reproduce it, chances are
it's been fixed one way or the other since. If it was observed last
month, it's more likely something's up with my setup.

It's not definitive, but it provides some hints.

> FWIW, the reason it wasn't done here - not to say that it shouldn't
> have been done better, but here we are - is that we just hammered a
> load of test runs, vacuumed up the results with a script, and that's
> what generated those files. Given the number of tests and devices, it
> was hard to narrow each down individually, but yeah, it is something
> which really wants further analysis and drilling into. It's a good
> to-do, and I agree it should be the standard going forward.

Awesome :)

> > And Mesa does show what I'm talking about:
> >
> > $ find -name *-flakes.txt | xargs git diff --stat  e58a10af640ba58b6001=
f5c5ad750b782547da76
> > [...]
> >
> > In the history of Mesa, there's never been a single test removed from a
> > flaky test list.
>=20
> As Rob says, that's definitely wrong.

Yeah, that was a dumb metric, sorry.

> But there is a good point in there: how do you know a test isn't flaky
> anymore? 100 runs is a reasonable benchmark, but 1000 is ideal. At a
> 1% failure rate, with 20 devices, that's just too many spurious
> false-fails to have a usable workflow.
>=20
> We do have some tools to make stress testing easier, but those need to
> be better documented. We'll fix that. The tools we have which also
> pull out the metadata etc also need documenting - right now they
> aren't because they're under _extremely_ heavy development, but they
> can be further enhanced to e.g. pull out the igt results automatically
> and point very clearly to the cause. Also on the to-do.

Thanks :)

> > > Only maintainers can actually fix the drivers (or the tests tbf). But
> > > doing the testing does let us be really clear to everyone what the
> > > actual state is, and that way people can make informed decisions too.
> > > And the only way we're going to drive the test rate down is by the
> > > subsystem maintainers enforcing it.
> >
> > Just FYI, I'm not on the other side of the fence there, I'd really like
> > to have some kind of validation. I talked about it at XDC some years
> > ago, and discussed it several people at length over the years. So I'm
> > definitely not in the CI-is-bad camp.
> >
> > > Does that make sense on where I'm (and I think a lot of others are)
> > > coming from?
> >
> > That makes sense from your perspective, but it's not clear to me how you
> > can expect maintainers to own the tests if they were never involved in
> > the process.
> >
> > They are not in Cc of the flaky tests patches, they are not reported
> > that the bug is failing, how can they own that process if we never
> > reached out and involved them?
> >
> > We're all overworked, you can't expect them to just look at the flaky
> > test list every now and then and figure it out.
>=20
> Absolutely. We got acks (or at least not-nacks) from the driver
> developers, but yeah, they should absolutely be part of the loop for
> those updates. I don't think we can necessarily block on them though.
> Say we add vc4 KMS tests, then after a backmerge we start to see a
> bunch of flakes on it, but you're sitting on a beach for a couple of
> weeks.

I really like where this is going :)

> If we wait for you to get back

=2E.. Oh :(

> see it, and merge it, then that's two weeks of people submitting
> Rockchip driver changes and getting told that their changes failed CI.
> That's exactly what we want to avoid, because it erodes confidence and
> usefulness of CI when people expect failures and ignore them by
> default.

Yeah, sure. That's why I mentioned earlier that we should merge it if
there wasn't any fix or answer. Of course I don't expect the entire CI
system to wait for my return, but when I get back I still want to have
some trace that it happened and it still could be a good idea to look
into it.

> So I would say that it's reasonable for expectations to be updated
> according to what actually happens in practice, but also to make sure
> that the maintainers are explicitly informed and kept in the loop, and
> not just surprised when they look at the lists and see a bunch of
> stuff happened without their knowledge.
>=20
> Again there's much more to be done on the tooling here. Part of it is
> CLI tools and automation, part of it is dashboards and
> easily-digestible reporting, and then there's integration with things
> like KernelCI. KCI(DB) is actually quite high up on the list, but
> we're mostly waiting until a lot of the KCI rework happens so we can
> actually properly integrate with the new system.
>=20
> Right now a lot of the tooling we have is pretty involved - for
> example, we do have ci-collate as a Python library which can inspect a
> number of pipelines, pull out detailed status and logs, etc, but it
> mostly needs to be used as a library with bespoke scripts, rather than
> a ready-made tool. Work on that is ongoing to make it way more clear
> and accessible though.

I think at the moment, putting the flake list under the driver
MAINTAINERS entry would be enough. We can probably improve it further,
but that should give a reasonably reliable heads-up which can work
pretty much today.

> So I think it sounds like we're on the same page and going exactly in
> the same direction, just that this is a starting point rather than the
> desired end state. And the main point is that having a set of
> xfails/flakes parachuted in with little to no context is trying to get
> an MVP bootstrapped, rather than how we expect things to go in future.
> Does that sound about right?

That sounds perfect :)

Thanks a lot
Maxime

--eic3ovvs3ifmbbpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQluWAAKCRDj7w1vZxhR
xQn1AP4u3f/f9O3I5KarU0+Mlkbk6ItSV6yhTAtHzjL7YAkIKAD/Y/SFejpZ7W5K
pTa04pwZyBGglrBVPGs+di5KDBVXPgA=
=Eh0n
-----END PGP SIGNATURE-----

--eic3ovvs3ifmbbpq--
