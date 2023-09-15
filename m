Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985EF7A21F3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 17:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EFB10E63D;
	Fri, 15 Sep 2023 15:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CDB10E63E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 15:08:56 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-99c93638322so487257266b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1694790535; x=1695395335;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VYR6ep7rDCBduLCC6ALZ438i46Wvlrmilzt/WzHCta4=;
 b=JVJAYqIAHsmDBnoBy+roF4lSqRRiB52YULRXs1yca8SZtxv7TuZODXeAkpldNEgufa
 54UEZ+eIIQ6lPY5qRq8vlMOVYmFQ+/ns3jJjAwVejJ9n8okyr4h6V+NxAorL4F6GZih4
 9GnzjcwRcrFBSZLL9UPYur9KNGEAbt6SJH2Bz5hE1N7FnDtda+ue/uO7eUJmg1c+7F51
 U01ZzRxLOas7PE4MfOY9QM8pr7j1crBSYT8dNgnj0ab8kpHv1AhaxlDd3Yh+/WQKVUPb
 O+8Yn2tNdAFNPCnXgSwp9sfMa/YtzbYXsb9stTUCf7lZU5TLpsTp/paAlleJY3p+zKel
 BY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694790535; x=1695395335;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VYR6ep7rDCBduLCC6ALZ438i46Wvlrmilzt/WzHCta4=;
 b=PUxL8GrF4RqkOZpq9EhwQi0e7iM3b/X6Ic4iSqYGVTvViNhMZFFPB+CwjywI71lgex
 x02eIg8PGMUfNoZY2WgutjXWG8b8AJ6ArY3UD08H5/f/2rXeMGKoWxQsg/kwXTtUyjzR
 k0dZLNTWTC5qPsa7herCDs2Cls0qysDGUuySisbFCW+1xu/PU/4//dc6+pwie+k5HSz2
 GEma2bs7CvmVLEHHk9ctpe6FJU3lE0/4207zUmICfwXDbFQN4/dPyAs5KSok0ZzzXCQv
 vkgwl8Nbnb1dTMLFwUX7sD6m0ssGcq6xf2AvnGRN9gQZmIvD+UHxkoe73iCQyrA6fPsq
 pgFw==
X-Gm-Message-State: AOJu0Yw0p1Ybz2ZfxnehelcTG5l1V0dJWcE1Wwt6qZUGxKJpprGOvl1Q
 VtSlqlzyTOA0n1iOgofgtPQx+Yc69KzzATyQIdM2Nw==
X-Google-Smtp-Source: AGHT+IEEHNihECXlS9m2KxMTthStG6cUD6LJ/Hd8lIz/DRYEz/AvRC/0+Anai8PcEGa/vlcPrsf7QjRzAeDT/NZHgLw=
X-Received: by 2002:a17:907:1c8b:b0:9a9:f6e7:43fe with SMTP id
 nb11-20020a1709071c8b00b009a9f6e743femr7782839ejc.24.1694790534612; Fri, 15
 Sep 2023 08:08:54 -0700 (PDT)
MIME-Version: 1.0
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
 <krhnfc4os5nqwi3iixgxwads3jbcgtdcvn7ygxpvd62uaejvsk@mx6tmser7jti>
In-Reply-To: <krhnfc4os5nqwi3iixgxwads3jbcgtdcvn7ygxpvd62uaejvsk@mx6tmser7jti>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 15 Sep 2023 16:08:42 +0100
Message-ID: <CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com>
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
To: Maxime Ripard <mripard@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey,

On Thu, 14 Sept 2023 at 10:54, Maxime Ripard <mripard@kernel.org> wrote:
> On Tue, Sep 12, 2023 at 02:16:41PM +0100, Daniel Stone wrote:
> > Hopefully less mangled formatting this time: turns out Thunderbird +
> > plain text is utterly unreadable, so that's one less MUA that is
> > actually usable to send email to kernel lists without getting shouted
> > at.
>
> Sorry if it felt that way, it definitely wasn't my intention to shout at
> you. Email is indeed kind of a pain to deal with, and I wanted to keep
> the discussion going.

My bad - I didn't mean you _at all_. I was thinking of other, much
less pleasant, kernel maintainers, and the ongoing struggle of
attempting to actually send well-formatted email to kernel lists in
2023.

> > I don't quite see the same picture from your side though. For example,
> > my reading of what you've said is that flaky tests are utterly
> > unacceptable, as are partial runs, and we shouldn't pretend otherwise.
> > With your concrete example (which is really helpful, so thanks), what
> > happens to the MT8173 hdmi-inject test? Do we skip all MT8173 testing
> > until it's perfect, or does MT8173 testing always fail because that
> > test does?
>
> It's not clear to me why that test is even running in the first place?
> There's been some confusion on my side here about what we're going to
> test with this. You've mentioned Mesa and GPUs before, but that's a KMS
> test so there must be more to it.
>
> Either way, it's a relevant test so I guess why not. It turns out that
> the test is indeed flaky, I guess we could add it to the flaky tests
> list.
>
> BUT
>
> I want to have every opportunity to fix whatever that failure is.

Agreed so far!

> So:
>
>   - Is the test broken? If so, we should report it to IGT dev and remove
>     it from the test suite.
>   - If not, is that test failure have been reported to the driver author?
>   - If no answer/fix, we can add it to the flaky tests list, but do we
>     have some way to reproduce the test failure?
>
> The last part is especially critical. Looking at the list itself, I have
> no idea what board, kernel version, configuration, or what the failure
> rate was. Assuming I spend some time looking at the infra to find the
> board and configuration, how many times do I have to run the tests to
> expect to reproduce the failure (and thus consider it fixed if it
> doesn't occur anymore).
>
> Like, with that board and test, if my first 100 runs of the test work
> fine, is it reasonable for me to consider it fixed, or is it only
> supposed to happen once every 1000 runs?
>
> So, ideally, having some (mandatory) metadata in the test lists with a
> link to the bug report, the board (DT name?) it happened with, the
> version and configuration it was first seen with, and an approximation
> of the failure rate for every flaky test list.
>
> I understand that it's probably difficult to get that after the fact on
> the tests that were already merged, but I'd really like to get that
> enforced for every new test going forward.
>
> That should hopefully get us in a much better position to fix some of
> those tests issues. And failing that, I can't see how that's
> sustainable.

OK yeah, and we're still agreed here. That is definitely the standard
we should be aiming for.  It is there for some - see
drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt, but should be
there for the rest, it's true. (The specific board/DT it was observed
on can be easily retconned because we only run on one specific board
type per driver, again to make things more predictable; we could go
back and retrospectively add those in a header comment?)

For flakes, it can be hard to pin them down, because, well, they're
flaky. Usually when we add things in Mesa (sorry to keep coming back
to Mesa - it's not to say that it's the objective best thing that
everything should follow, only that it's the thing we have the most
experience with that we know works well), we do a manual bisect and
try to pin the blame on a specific merge request which looks like the
most likely culprit. If nothing obvious jumps out, we just note when
it was first observed and provide some sample job logs. But yeah, it
should be more verbose.

FWIW, the reason it wasn't done here - not to say that it shouldn't
have been done better, but here we are - is that we just hammered a
load of test runs, vacuumed up the results with a script, and that's
what generated those files. Given the number of tests and devices, it
was hard to narrow each down individually, but yeah, it is something
which really wants further analysis and drilling into. It's a good
to-do, and I agree it should be the standard going forward.

> And Mesa does show what I'm talking about:
>
> $ find -name *-flakes.txt | xargs git diff --stat  e58a10af640ba58b6001f5c5ad750b782547da76
> [...]
>
> In the history of Mesa, there's never been a single test removed from a
> flaky test list.

As Rob says, that's definitely wrong. But there is a good point in
there: how do you know a test isn't flaky anymore? 100 runs is a
reasonable benchmark, but 1000 is ideal. At a 1% failure rate, with 20
devices, that's just too many spurious false-fails to have a usable
workflow.

We do have some tools to make stress testing easier, but those need to
be better documented. We'll fix that. The tools we have which also
pull out the metadata etc also need documenting - right now they
aren't because they're under _extremely_ heavy development, but they
can be further enhanced to e.g. pull out the igt results automatically
and point very clearly to the cause. Also on the to-do.

> > Only maintainers can actually fix the drivers (or the tests tbf). But
> > doing the testing does let us be really clear to everyone what the
> > actual state is, and that way people can make informed decisions too.
> > And the only way we're going to drive the test rate down is by the
> > subsystem maintainers enforcing it.
>
> Just FYI, I'm not on the other side of the fence there, I'd really like
> to have some kind of validation. I talked about it at XDC some years
> ago, and discussed it several people at length over the years. So I'm
> definitely not in the CI-is-bad camp.
>
> > Does that make sense on where I'm (and I think a lot of others are)
> > coming from?
>
> That makes sense from your perspective, but it's not clear to me how you
> can expect maintainers to own the tests if they were never involved in
> the process.
>
> They are not in Cc of the flaky tests patches, they are not reported
> that the bug is failing, how can they own that process if we never
> reached out and involved them?
>
> We're all overworked, you can't expect them to just look at the flaky
> test list every now and then and figure it out.

Absolutely. We got acks (or at least not-nacks) from the driver
developers, but yeah, they should absolutely be part of the loop for
those updates. I don't think we can necessarily block on them though.
Say we add vc4 KMS tests, then after a backmerge we start to see a
bunch of flakes on it, but you're sitting on a beach for a couple of
weeks. If we wait for you to get back, see it, and merge it, then
that's two weeks of people submitting Rockchip driver changes and
getting told that their changes failed CI. That's exactly what we want
to avoid, because it erodes confidence and usefulness of CI when
people expect failures and ignore them by default.

So I would say that it's reasonable for expectations to be updated
according to what actually happens in practice, but also to make sure
that the maintainers are explicitly informed and kept in the loop, and
not just surprised when they look at the lists and see a bunch of
stuff happened without their knowledge.

Again there's much more to be done on the tooling here. Part of it is
CLI tools and automation, part of it is dashboards and
easily-digestible reporting, and then there's integration with things
like KernelCI. KCI(DB) is actually quite high up on the list, but
we're mostly waiting until a lot of the KCI rework happens so we can
actually properly integrate with the new system.

Right now a lot of the tooling we have is pretty involved - for
example, we do have ci-collate as a Python library which can inspect a
number of pipelines, pull out detailed status and logs, etc, but it
mostly needs to be used as a library with bespoke scripts, rather than
a ready-made tool. Work on that is ongoing to make it way more clear
and accessible though.

So I think it sounds like we're on the same page and going exactly in
the same direction, just that this is a starting point rather than the
desired end state. And the main point is that having a set of
xfails/flakes parachuted in with little to no context is trying to get
an MVP bootstrapped, rather than how we expect things to go in future.
Does that sound about right?

Cheers,
Daniel
