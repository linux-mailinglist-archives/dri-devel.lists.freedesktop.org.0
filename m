Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FF97A00EE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 11:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8725D10E561;
	Thu, 14 Sep 2023 09:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0693310E561
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 09:54:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 36094CE1FDD;
 Thu, 14 Sep 2023 09:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2639C433C8;
 Thu, 14 Sep 2023 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694685271;
 bh=lR+yRGJKoSTyQFNUNag0BMxUiV3pza9vdEDrK6nb8Zg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W0fdktTAB4gCjqO27jQmbg6pGkHa6Q4nAah6LWyGco6f6D0trAIOKtnfvvArkteZT
 SBVZ2GEG8+UBZaVOs4RLmiYX9BzCR9UaY4aM2OmTxjJKujpMZXMlayKUDdkZZ2utBb
 0jm1hUE/y/uX3coQYg6ppnoh3D1lbCWOcsY84xlKOOAYcBb8K59owvmn+Ksb3jXs8x
 lRAIrelmD8PptYdgfpSgDvw/6325fTERGOWuVeaXaAVXYn/kgsujdMorW77nZcnjGo
 79LRwOT6zafDQLNgY4qzPBF88cu6tA3hoyJZiIX8rjmpEosD+twAWgwy7l2NEQjxEu
 2qRt1YOP5TkyA==
Date: Thu, 14 Sep 2023 11:54:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
Message-ID: <krhnfc4os5nqwi3iixgxwads3jbcgtdcvn7ygxpvd62uaejvsk@mx6tmser7jti>
References: <zmq7pz7rtz6h765azg5kl2qgjd264yafctx4q474t5tqai57og@cajbcub4yuwr>
 <5fdf9d29-3f8d-0ee0-027f-57ff3a5cecb8@collabora.com>
 <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
 <9a2b1ad8-4359-4f12-b4f9-c1de477bc440@collabora.com>
 <mnjcsiqjqdnvbbkaaz5r4n42e56qsax667r7radzyagnmmfkip@dfi64z5deqzj>
 <b7d96985-8489-efe2-db67-1f3108e26822@mailbox.org>
 <5ejq3hjpoy3gxft2jbmoa5m656usetuxcs7g3ezyyiitj67rav@r5jhdz27foat>
 <550454b8-2e2c-c947-92c5-37f0367661c2@mailbox.org>
 <os2wvkangif2nwewfbzkuyjm7njp4g3sqj5td3ogbhhjwsrbbd@3jpf6g5hd3z4>
 <CAPj87rP1sw49Z0HdPhUa-=kDp166RqiuhC9rL+Ef9hpwPD5+JA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sweft2f6sgmxlij7"
Content-Disposition: inline
In-Reply-To: <CAPj87rP1sw49Z0HdPhUa-=kDp166RqiuhC9rL+Ef9hpwPD5+JA@mail.gmail.com>
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


--sweft2f6sgmxlij7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 12, 2023 at 02:16:41PM +0100, Daniel Stone wrote:
> Hopefully less mangled formatting this time: turns out Thunderbird +
> plain text is utterly unreadable, so that's one less MUA that is
> actually usable to send email to kernel lists without getting shouted
> at.

Sorry if it felt that way, it definitely wasn't my intention to shout at
you. Email is indeed kind of a pain to deal with, and I wanted to keep
the discussion going.

> On Mon, 11 Sept 2023 at 15:46, Maxime Ripard <mripard@kernel.org> wrote:
> > On Mon, Sep 11, 2023 at 03:30:55PM +0200, Michel D=E4nzer wrote:
> > > > There's in 6.6-rc1 around 240 reported flaky tests. None of them ha=
ve
> > > > any context. That new series hads a few dozens too, without any con=
text
> > > > either. And there's no mention about that being a plan, or a patch
> > > > adding a new policy for all tests going forward.
> > >
> > > That does sound bad, would need to be raised in review.
> > >
> > > > Any concern I raised were met with a giant "it worked on Mesa" hand=
wave
> > >
> > > Lessons learned from years of experience with big real-world CI
> > > systems like this are hardly "handwaving".
> >
> > Your (and others) experience certainly isn't. It is valuable, welcome,
> > and very much appreciated.
> >
> > However, my questions and concerns being ignored time and time again
> > about things like what is the process is going to be like, what is going
> > to be tested, who is going to be maintaining that test list, how that
> > interacts with stable, how we can possibly audit the flaky tests list,
> > etc. have felt like they were being handwaived away.
>=20
> Sorry it ended up coming across like that. It wasn't the intent.
>=20
> > I'm not saying that because I disagree, I still do on some, but that's
> > fine to some extent. However, most of these issues are not so much an
> > infrastructure issue, but a community issue. And I don't even expect a
> > perfect solution right now, unlike what you seem to think. But I do
> > expect some kind of plan instead of just ignoring that problem.
> >
> > Like, I had to ask the MT8173 question 3 times in order to get an
> > answer, and I'm still not sure what is going to be done to address that
> > particular issue.
> >
> > So, I'm sorry, but I certainly feel like it here.
>=20
> I don't quite see the same picture from your side though. For example,
> my reading of what you've said is that flaky tests are utterly
> unacceptable, as are partial runs, and we shouldn't pretend otherwise.
> With your concrete example (which is really helpful, so thanks), what
> happens to the MT8173 hdmi-inject test? Do we skip all MT8173 testing
> until it's perfect, or does MT8173 testing always fail because that
> test does?

It's not clear to me why that test is even running in the first place?
There's been some confusion on my side here about what we're going to
test with this. You've mentioned Mesa and GPUs before, but that's a KMS
test so there must be more to it.

Either way, it's a relevant test so I guess why not. It turns out that
the test is indeed flaky, I guess we could add it to the flaky tests
list.

BUT

I want to have every opportunity to fix whatever that failure is.

So:

  - Is the test broken? If so, we should report it to IGT dev and remove
    it from the test suite.
  - If not, is that test failure have been reported to the driver author?
  - If no answer/fix, we can add it to the flaky tests list, but do we
    have some way to reproduce the test failure?

The last part is especially critical. Looking at the list itself, I have
no idea what board, kernel version, configuration, or what the failure
rate was. Assuming I spend some time looking at the infra to find the
board and configuration, how many times do I have to run the tests to
expect to reproduce the failure (and thus consider it fixed if it
doesn't occur anymore).

Like, with that board and test, if my first 100 runs of the test work
fine, is it reasonable for me to consider it fixed, or is it only
supposed to happen once every 1000 runs?

So, ideally, having some (mandatory) metadata in the test lists with a
link to the bug report, the board (DT name?) it happened with, the
version and configuration it was first seen with, and an approximation
of the failure rate for every flaky test list.

I understand that it's probably difficult to get that after the fact on
the tests that were already merged, but I'd really like to get that
enforced for every new test going forward.

That should hopefully get us in a much better position to fix some of
those tests issues. And failing that, I can't see how that's
sustainable.

And Mesa does show what I'm talking about:

$ find -name *-flakes.txt | xargs git diff --stat  e58a10af640ba58b6001f5c5=
ad750b782547da76
 src/amd/ci/deqp-radv-stoney-aco-flakes.txt                        |  18 ++=
+++
 src/broadcom/ci/deqp-v3d-rpi4-flakes.txt                          |   2 +
 src/broadcom/ci/deqp-v3dv-rpi4-flakes.txt                         |  15 ++=
++
 src/broadcom/ci/deqp-vc4-rpi3-flakes.txt                          |  30 ++=
++++++
 src/broadcom/ci/piglit-v3d-rpi4-flakes.txt                        |  14 ++=
++
 src/broadcom/ci/piglit-vc4-rpi3-flakes.txt                        |   5 ++
 src/freedreno/ci/deqp-freedreno-a307-flakes.txt                   |   6 ++
 src/freedreno/ci/deqp-freedreno-a530-flakes.txt                   |  31 ++=
+++++++
 src/freedreno/ci/deqp-freedreno-a630-bypass-flakes.txt            |  11 +++
 src/freedreno/ci/deqp-freedreno-a630-flakes.txt                   | 109 ++=
++++++++++++++++++++++++++++
 src/gallium/drivers/freedreno/ci/piglit-freedreno-a530-flakes.txt |  21 ++=
++++
 src/gallium/drivers/freedreno/ci/piglit-freedreno-a630-flakes.txt |  31 ++=
+++++++
 src/gallium/drivers/llvmpipe/ci/deqp-llvmpipe-flakes.txt          |   4 ++
 src/gallium/drivers/panfrost/ci/deqp-panfrost-g52-flakes.txt      |   6 ++
 src/gallium/drivers/panfrost/ci/deqp-panfrost-t720-flakes.txt     |   4 ++
 src/gallium/drivers/panfrost/ci/deqp-panfrost-t760-flakes.txt     |   1 +
 src/gallium/drivers/panfrost/ci/deqp-panfrost-t860-flakes.txt     |   1 +
 src/gallium/drivers/radeonsi/ci/piglit-radeonsi-stoney-flakes.txt |   1 +
 src/gallium/drivers/softpipe/ci/deqp-softpipe-flakes.txt          |   2 +
 src/gallium/drivers/virgl/ci/deqp-virgl-gl-flakes.txt             |   3 +
 src/gallium/drivers/zink/ci/deqp-zink-lvp-flakes.txt              |   0
 src/gallium/drivers/zink/ci/piglit-zink-lvp-flakes.txt            |   0
 src/gallium/frontends/lavapipe/ci/deqp-lvp-flakes.txt             |   1 +
 23 files changed, 316 insertions(+)

In the history of Mesa, there's never been a single test removed from a
flaky test list.

> Both have their downsides. Not doing any testing has the obvious
> downside, and means that the driver can get worse until it gets
> perfect. Always marking the test as failed means that the test results
> are useless: if failure is expected, then red is good. I mean, say
> you're contributing a patch to fix some documentation or add a helper
> to common code which only v3d uses. The test results come back, and
> your branch is failing tests on MT8173, specifically the
> hdmi-inject@4k test. What then? Either as a senior contributor you
> 'know' that's the case, or as a casual contributor you get told 'oh
> yeah, don't worry about the test results, they always fail'. Both lead
> to the same outcome, which is that no-one pays any attention to the
> results, and they get worse.

I believe the above would achieve a better result for us kernel folks,
while still providing enough flexibility for you.

> What we do agree on is that yes, those tests should absolutely be
> fixed, and not just swept under the rug. Part of this is having
> maintainers actually meaningfully own their test results. For example,
> I'm looking at the expectation lists for the Intel gen in my laptop,
> and I'm seeing a lot of breakage in blending tests, as well as
> dual-display fails which include the resolution of my external
> display.

I just bought a 7900XT and I'm pretty much in the same situation, so I
definitely feel what you're saying :)

However...

> I'd expect the Intel driver maintainers to look at them, get them
> fixed, and gradually prune those xfails/flakes down towards zero.
>=20
> If the maintainers don't own it though, then it's not going to get
> fixed. And we are exactly where we are today: broken plane blending
> and 1440p on KBL, broken EDID injection on MT8173, and broken atomic
> commits on stoney. Without stronger action from the maintainers (e.g.
> throwing i915 out of the tree until it has 100% pass 100% of the
> time), adding testing isn't making the situation better or worse in
> and of itself. What it _is_ doing though, is giving really clear
> documentation of the status of each driver, and backing that up by
> verifying it.

=2E.. I haven't reported any of the failures yet so I don't really expect
them to be fixed by themselves. That's on me.

> Only maintainers can actually fix the drivers (or the tests tbf). But
> doing the testing does let us be really clear to everyone what the
> actual state is, and that way people can make informed decisions too.
> And the only way we're going to drive the test rate down is by the
> subsystem maintainers enforcing it.

Just FYI, I'm not on the other side of the fence there, I'd really like
to have some kind of validation. I talked about it at XDC some years
ago, and discussed it several people at length over the years. So I'm
definitely not in the CI-is-bad camp.

> Does that make sense on where I'm (and I think a lot of others are)
> coming from?

That makes sense from your perspective, but it's not clear to me how you
can expect maintainers to own the tests if they were never involved in
the process.

They are not in Cc of the flaky tests patches, they are not reported
that the bug is failing, how can they own that process if we never
reached out and involved them?

We're all overworked, you can't expect them to just look at the flaky
test list every now and then and figure it out.

Maxime

--sweft2f6sgmxlij7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZQLYVAAKCRDj7w1vZxhR
xcR/AQCjGVSTcMmlQRRKe7TUhLtmNBu++DrSH4M1M1QBgzTdCgEAtO8C8UIAzgQs
MAoJyRzhO/NlNhWdl+hgIZZcIXzwWgA=
=pFK3
-----END PGP SIGNATURE-----

--sweft2f6sgmxlij7--
