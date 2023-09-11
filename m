Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DF779A7DE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 14:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE2A10E2DE;
	Mon, 11 Sep 2023 12:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A9C10E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 12:13:52 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4RklxS0gY7z9sqm;
 Mon, 11 Sep 2023 14:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1694434428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EG47cdFKJCzGjz8BT6HLdIq6G6HHROaavD+7fvm6pRA=;
 b=gk/WPBL/AeACiFu13DVcyVgLkskOoCAH52EePYIAkLR/yZHSovN0zCc4IQtSSJgEOfm1N7
 AMu2PcpH6mVf7lRUXFyL8dKl2WG0P5jVzg7xgLVXGOgeqr4G30a6sNRf/teOmSBgl1Qt2/
 P33mCkIAWDp2yL4mBFIRC+rpcHyn8MKPifBqDhsYy+R5BkHFSfwgX8/7gtZjw43jHbD4bE
 4S84wiL3owYxagam6VNGz17C1kVw/u+zVnqElckoGWIIXCc0vnB1FPAAfCooK8Y3aE6lNA
 kWNU+EkQZ6R40yusQNWo10kXZteR/QKRGP2qmFQKKI0GZZl0luz9MUtoZFaOcw==
Message-ID: <b7d96985-8489-efe2-db67-1f3108e26822@mailbox.org>
Date: Mon, 11 Sep 2023 14:13:43 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
To: Maxime Ripard <mripard@kernel.org>, Daniel Stone <daniels@collabora.com>
References: <20230811171953.176431-1-helen.koike@collabora.com>
 <ZOTFfhtzzWkrQ23Y@phenom.ffwll.local>
 <zorvxwffshrsqx5cy76pe3gn52qrqav7qusz5acav2un2ydvwr@fwjd56qg2xve>
 <87bkeo23vs.fsf@intel.com>
 <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
 <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com>
 <zmq7pz7rtz6h765azg5kl2qgjd264yafctx4q474t5tqai57og@cajbcub4yuwr>
 <5fdf9d29-3f8d-0ee0-027f-57ff3a5cecb8@collabora.com>
 <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
 <9a2b1ad8-4359-4f12-b4f9-c1de477bc440@collabora.com>
 <mnjcsiqjqdnvbbkaaz5r4n42e56qsax667r7radzyagnmmfkip@dfi64z5deqzj>
Content-Language: en-CA
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <mnjcsiqjqdnvbbkaaz5r4n42e56qsax667r7radzyagnmmfkip@dfi64z5deqzj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ehasp3x5p4ksus1eoywnq1ujg96e9qzj
X-MBO-RS-ID: 28267585246936505e8
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
 linux-rockchip@lists.infradead.org, martin.blumenstingl@googlemail.com,
 robclark@freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 anholt@google.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, gustavo.padovan@collabora.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 neil.armstrong@linaro.org, guilherme.gallo@collabora.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/11/23 11:34, Maxime Ripard wrote:
> On Thu, Sep 07, 2023 at 01:40:02PM +0200, Daniel Stone wrote:
>> Yeah, this is what our experience with Mesa (in particular) has taught us.
>>
>> Having 100% of the tests pass 100% of the time on 100% of the platforms is a
>> great goal that everyone should aim for. But it will also never happen.
>>
>> Firstly, we're just not there yet today. Every single GPU-side DRM driver
>> has userspace-triggerable faults which cause occasional errors in GL/Vulkan
>> tests. Every single one. We deal with these in Mesa by retrying; if we
>> didn't retry, across the breadth of hardware we test, I'd expect 99% of
>> should-succeed merges to fail because of these intermittent bugs in the DRM
>> drivers.
> 
> So the plan is only to ever test rendering devices? It should have been
> made clearer then.
> 
>> We don't have the same figure for KMS - because we don't test it - but
>> I'd be willing to bet no driver is 100% if you run tests often enough.
> 
> And I would still consider that a bug that we ought to fix, and
> certainly not something we should sweep under the rug. If half the tests
> are not running on a driver, then fine, they aren't. I'm not really
> against having failing tests, I'm against not flagging unreliable tests
> on a given hardware as failing tests.

A flaky test will by definition give a "pass" result at least some of the time, which would be considered a failure by the CI if the test is marked as failing.


>> Secondly, we will never be there. If we could pause for five years and sit
>> down making all the current usecases for all the current hardware on the
>> current kernel run perfectly, we'd probably get there. But we can't: there's
>> new hardware, new userspace, and hundreds of new kernel trees.
> 
> Not with that attitude :)

Attitude is not the issue, the complexity of the multiple systems involved is.


> I'm not sure it's actually an argument, really. 10 years ago, we would
> never have been at "every GPU on the market has an open-source driver"
> here. 5 years ago, we would never have been at this-series-here. That
> didn't stop anyone making progress, everyone involved in that thread
> included.

Even assuming perfection is achievable at all (which is very doubtful, given the experience from the last few years of CI in Mesa and other projects), if you demand perfection before even taking the first step, it will never get off the ground.


> How are we even supposed to detect those failures in the first
> place if tests are flagged as unreliable?

Based on experience with Mesa, only a relatively small minority of tests should need to be marked as flaky / not run at all. The majority of tests are reliable and can catch regressions even while some tests are not yet.


> No matter what we do here, what you describe will always happen. Like,
> if we do flag those tests as unreliable, what exactly prevents another
> issue to come on top undetected, and what will happen when we re-enable
> testing?

Any issues affecting a test will need to be fixed before (re-)enabling the test for CI.


> On top of that, you kind of hinted at that yourself, but what set of
> tests will pass is a property linked to a single commit. Having that
> list within the kernel already alters that: you'll need to merge a new
> branch, add a bunch of fixes and then change the test list state. You
> won't have the same tree you originally tested (and defined the test
> state list for).

Ideally, the test state lists should be changed in the same commits which affect the test results. It'll probably take a while yet to get there for the kernel.

> It might or might not be an issue for Linus' release, but I can
> definitely see the trouble already for stable releases where fixes will
> be backported, but the test state list certainly won't be updated.

If the stable branch maintainers want to take advantage of CI for the stable branches, they may need to hunt for corresponding state list commits sometimes. They'll need to take that into account for their decision.


>> By keeping those sets of expectations, we've been able to keep Mesa pretty
>> clear of regressions, whilst having a very clear set of things that should
>> be fixed to point to. It would be great if those set of things were zero,
>> but it just isn't. Having that is far better than the two alternatives:
>> either not testing at all (obviously bad), or having the test always be red
>> so it's always ignored (might as well just not test).
> 
> Isn't that what happens with flaky tests anyway?

For a small minority of tests. Daniel was referring to whole test suites.

> Even more so since we have 0 context when updating that list.

The commit log can provide whatever context is needed.


> I've asked a couple of times, I'll ask again. In that other series, on
> the MT8173, kms_hdmi_inject@inject-4k is setup as flaky (which is a KMS
> test btw).
> 
> I'm a maintainer for that part of the kernel, I'd like to look into it,
> because it's seriously something that shouldn't fail, ever, the hardware
> isn't involved.
> 
> How can I figure out now (or worse, let's say in a year) how to
> reproduce it? What kernel version was affected? With what board? After
> how many occurences?
> 
> Basically, how can I see that the bug is indeed there (or got fixed
> since), and how to start fixing it?

Many of those things should be documented in the commit log of the state list change.

How the CI works in general should be documented in some appropriate place in tree.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

