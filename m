Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FE37A5521
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 23:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6167810E108;
	Mon, 18 Sep 2023 21:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1504B10E108
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 21:35:29 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.98.21.184])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 580396607090;
 Mon, 18 Sep 2023 22:35:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695072927;
 bh=uL/s4lrQG1BldZTY5WhYBFCF/fK1Gq+sWguhl3ilTEU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m9Q4n/uk0t3flfSgStzt1GoFobmWwy+YbLNElc7e2AUBosVGpuTP/ZfYWRfyYjTD6
 aMQx7KTSkDZuzAOy2ECS+1HULO518OTeyxDy8D/DQO5SiftVVYgMQ9pdTkH/rqAnsO
 SIUzW82OoNGBNYCBmA8FG2ab/P5SVTiz4CdKWkwHklbaQzQBSXoT2de5ljTovc7396
 UHHXCGSApMn86QYW/miJuuuTmGEbEKqfDVFyyjP8CMkZEd21FLYNrypqIFdv6RA6Rk
 r5eESOEOfxfKShx2rNKWrQGH8JqTO81/lczFeG9Ae1ocygaQ4TipHDPkv0xR8p1Gh1
 2MtpFBfHCx5uw==
Message-ID: <8c5d6bf2-f034-c702-5e99-6daea6d56443@collabora.com>
Date: Mon, 18 Sep 2023 18:35:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>, Maxime Ripard <mripard@kernel.org>
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
 <CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd61Df9mdGH2PR=ZzxaU=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 15/09/2023 12:08, Daniel Stone wrote:
> Hey,
> 
> On Thu, 14 Sept 2023 at 10:54, Maxime Ripard <mripard@kernel.org> wrote:
>> On Tue, Sep 12, 2023 at 02:16:41PM +0100, Daniel Stone wrote:
>>> Hopefully less mangled formatting this time: turns out Thunderbird +
>>> plain text is utterly unreadable, so that's one less MUA that is
>>> actually usable to send email to kernel lists without getting shouted
>>> at.
>>
>> Sorry if it felt that way, it definitely wasn't my intention to shout at
>> you. Email is indeed kind of a pain to deal with, and I wanted to keep
>> the discussion going.
> 
> My bad - I didn't mean you _at all_. I was thinking of other, much
> less pleasant, kernel maintainers, and the ongoing struggle of
> attempting to actually send well-formatted email to kernel lists in
> 2023.
> 
>>> I don't quite see the same picture from your side though. For example,
>>> my reading of what you've said is that flaky tests are utterly
>>> unacceptable, as are partial runs, and we shouldn't pretend otherwise.
>>> With your concrete example (which is really helpful, so thanks), what
>>> happens to the MT8173 hdmi-inject test? Do we skip all MT8173 testing
>>> until it's perfect, or does MT8173 testing always fail because that
>>> test does?
>>
>> It's not clear to me why that test is even running in the first place?
>> There's been some confusion on my side here about what we're going to
>> test with this. You've mentioned Mesa and GPUs before, but that's a KMS
>> test so there must be more to it.
>>
>> Either way, it's a relevant test so I guess why not. It turns out that
>> the test is indeed flaky, I guess we could add it to the flaky tests
>> list.
>>
>> BUT
>>
>> I want to have every opportunity to fix whatever that failure is.
> 
> Agreed so far!
> 
>> So:
>>
>>    - Is the test broken? If so, we should report it to IGT dev and remove
>>      it from the test suite.
>>    - If not, is that test failure have been reported to the driver author?
>>    - If no answer/fix, we can add it to the flaky tests list, but do we
>>      have some way to reproduce the test failure?
>>
>> The last part is especially critical. Looking at the list itself, I have
>> no idea what board, kernel version, configuration, or what the failure
>> rate was. Assuming I spend some time looking at the infra to find the
>> board and configuration, how many times do I have to run the tests to
>> expect to reproduce the failure (and thus consider it fixed if it
>> doesn't occur anymore).
>>
>> Like, with that board and test, if my first 100 runs of the test work
>> fine, is it reasonable for me to consider it fixed, or is it only
>> supposed to happen once every 1000 runs?

I wonder if this should be an overall policy or just let the maintainer 
to decide.

In any case these stress tests must be run from time to time to verify 
if flakes are still flakes. We could do it automatically but we need to 
evaluate how to do it properly so it doesn't overload the infra.

>>
>> So, ideally, having some (mandatory) metadata in the test lists with a
>> link to the bug report, the board (DT name?) it happened with, the
>> version and configuration it was first seen with, and an approximation
>> of the failure rate for every flaky test list.
>>
>> I understand that it's probably difficult to get that after the fact on
>> the tests that were already merged, but I'd really like to get that
>> enforced for every new test going forward.
>>
>> That should hopefully get us in a much better position to fix some of
>> those tests issues. And failing that, I can't see how that's
>> sustainable.
> 
> OK yeah, and we're still agreed here. That is definitely the standard
> we should be aiming for.  It is there for some - see
> drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt, but should be
> there for the rest, it's true. (The specific board/DT it was observed
> on can be easily retconned because we only run on one specific board
> type per driver, again to make things more predictable; we could go
> back and retrospectively add those in a header comment?)
> 
> For flakes, it can be hard to pin them down, because, well, they're
> flaky. Usually when we add things in Mesa (sorry to keep coming back
> to Mesa - it's not to say that it's the objective best thing that
> everything should follow, only that it's the thing we have the most
> experience with that we know works well), we do a manual bisect and
> try to pin the blame on a specific merge request which looks like the
> most likely culprit. If nothing obvious jumps out, we just note when
> it was first observed and provide some sample job logs. But yeah, it
> should be more verbose.
> 
> FWIW, the reason it wasn't done here - not to say that it shouldn't
> have been done better, but here we are - is that we just hammered a
> load of test runs, vacuumed up the results with a script, and that's
> what generated those files. Given the number of tests and devices, it
> was hard to narrow each down individually, but yeah, it is something
> which really wants further analysis and drilling into. It's a good
> to-do, and I agree it should be the standard going forward.

Yes, during development I was just worried about to get a pipeline that 
would succeed most of the time (otherwise people would start ignoring 
when it fails), so they just got run a couple of times and a script 
filled the flakes list.
For me the idea was "let's get a starting point" first, but yeah, we 
need to improve how we deal with it from now on.

> 
>> And Mesa does show what I'm talking about:
>>
>> $ find -name *-flakes.txt | xargs git diff --stat  e58a10af640ba58b6001f5c5ad750b782547da76
>> [...]
>>
>> In the history of Mesa, there's never been a single test removed from a
>> flaky test list.
> 
> As Rob says, that's definitely wrong. But there is a good point in
> there: how do you know a test isn't flaky anymore? 100 runs is a
> reasonable benchmark, but 1000 is ideal. At a 1% failure rate, with 20
> devices, that's just too many spurious false-fails to have a usable
> workflow.
> 
> We do have some tools to make stress testing easier, but those need to
> be better documented. We'll fix that. The tools we have which also
> pull out the metadata etc also need documenting - right now they
> aren't because they're under _extremely_ heavy development, but they
> can be further enhanced to e.g. pull out the igt results automatically
> and point very clearly to the cause. Also on the to-do.
> 
>>> Only maintainers can actually fix the drivers (or the tests tbf). But
>>> doing the testing does let us be really clear to everyone what the
>>> actual state is, and that way people can make informed decisions too.
>>> And the only way we're going to drive the test rate down is by the
>>> subsystem maintainers enforcing it.
>>
>> Just FYI, I'm not on the other side of the fence there, I'd really like
>> to have some kind of validation. I talked about it at XDC some years
>> ago, and discussed it several people at length over the years. So I'm
>> definitely not in the CI-is-bad camp.
>>
>>> Does that make sense on where I'm (and I think a lot of others are)
>>> coming from?
>>
>> That makes sense from your perspective, but it's not clear to me how you
>> can expect maintainers to own the tests if they were never involved in
>> the process.
>>
>> They are not in Cc of the flaky tests patches, they are not reported
>> that the bug is failing, how can they own that process if we never
>> reached out and involved them?
>>
>> We're all overworked, you can't expect them to just look at the flaky
>> test list every now and then and figure it out.
> 
> Absolutely. We got acks (or at least not-nacks) from the driver
> developers, but yeah, they should absolutely be part of the loop for
> those updates. I don't think we can necessarily block on them though.
> Say we add vc4 KMS tests, then after a backmerge we start to see a
> bunch of flakes on it, but you're sitting on a beach for a couple of
> weeks. If we wait for you to get back, see it, and merge it, then
> that's two weeks of people submitting Rockchip driver changes and
> getting told that their changes failed CI. That's exactly what we want
> to avoid, because it erodes confidence and usefulness of CI when
> people expect failures and ignore them by default.
> 
> So I would say that it's reasonable for expectations to be updated
> according to what actually happens in practice, but also to make sure
> that the maintainers are explicitly informed and kept in the loop, and
> not just surprised when they look at the lists and see a bunch of
> stuff happened without their knowledge.

I was thinking in adding entries in MAINTAINERS file pointing to each 
flake/skip/fails list file to their maintainers, so get_maintainers.pl 
can return the right thing.

> 
> Again there's much more to be done on the tooling here. Part of it is
> CLI tools and automation, part of it is dashboards and
> easily-digestible reporting, and then there's integration with things
> like KernelCI. KCI(DB) is actually quite high up on the list, but
> we're mostly waiting until a lot of the KCI rework happens so we can
> actually properly integrate with the new system.
> 
> Right now a lot of the tooling we have is pretty involved - for
> example, we do have ci-collate as a Python library which can inspect a
> number of pipelines, pull out detailed status and logs, etc, but it
> mostly needs to be used as a library with bespoke scripts, rather than
> a ready-made tool. Work on that is ongoing to make it way more clear
> and accessible though.
> 
> So I think it sounds like we're on the same page and going exactly in
> the same direction, just that this is a starting point rather than the
> desired end state. And the main point is that having a set of
> xfails/flakes parachuted in with little to no context is trying to get
> an MVP bootstrapped, rather than how we expect things to go in future.
> Does that sound about right?
> 
> Cheers,
> Daniel

Regards,
Helen
