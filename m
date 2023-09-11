Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B331379A849
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 15:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7276D10E2FB;
	Mon, 11 Sep 2023 13:31:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D048A10E2FB
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 13:31:08 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Rknfc2Jtlz9smc;
 Mon, 11 Sep 2023 15:31:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1694439064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssPtRhzagK/d9RC/A8i5dkXgGiUcU7PPGH+ptkQbYgk=;
 b=yjg5muxkqrF115Eg74FhgWcpucBCqqIZVB6zpdeKqWgFPxSesDwfq9HHz5A2ewKkGtXMLk
 SSPhlTQlT4kkBz66FCvKb+Osxf59CFHQ9CCcbQqiqWw+V60evAGbGKN0yFdQyxmCOnjqVz
 z+veeOK1T2qRPmi7kNk6e7B3H6ecreFc+o2pwOV4jyDNfMmpeeOXLjf4FcFRDeZvoGJR1Y
 kR7qHSp04oA/t1s6/zP6P4FD3/IaTZpAAykSq7IOYurkjj7ATUJaU+J9LCcF/eEf4VjqNc
 psAFjEt3eRSeTkKCe8TpP/ZDxi5U3+oql7q/5zEIjt02gWa0hjyTCJ0LzdQLQA==
Message-ID: <550454b8-2e2c-c947-92c5-37f0367661c2@mailbox.org>
Date: Mon, 11 Sep 2023 15:30:55 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v11] drm: Add initial ci/ subdirectory
To: Maxime Ripard <mripard@kernel.org>
References: <zorvxwffshrsqx5cy76pe3gn52qrqav7qusz5acav2un2ydvwr@fwjd56qg2xve>
 <87bkeo23vs.fsf@intel.com>
 <4rpsqk4tgrdcxtxtfoum6o4oyglwkirmkh3jj4y5tays2ivb5p@uwqdf3snshkv>
 <25df6189-7b0a-b13d-e93d-c2a388fd45e3@collabora.com>
 <zmq7pz7rtz6h765azg5kl2qgjd264yafctx4q474t5tqai57og@cajbcub4yuwr>
 <5fdf9d29-3f8d-0ee0-027f-57ff3a5cecb8@collabora.com>
 <CAKMK7uGg6n322UugJwErqF_Dvsbqceqae6SVWV3ZWEOR7x36rQ@mail.gmail.com>
 <9a2b1ad8-4359-4f12-b4f9-c1de477bc440@collabora.com>
 <mnjcsiqjqdnvbbkaaz5r4n42e56qsax667r7radzyagnmmfkip@dfi64z5deqzj>
 <b7d96985-8489-efe2-db67-1f3108e26822@mailbox.org>
 <5ejq3hjpoy3gxft2jbmoa5m656usetuxcs7g3ezyyiitj67rav@r5jhdz27foat>
Content-Language: en-CA
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <5ejq3hjpoy3gxft2jbmoa5m656usetuxcs7g3ezyyiitj67rav@r5jhdz27foat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 859e5b194a06fb7bf8b
X-MBO-RS-META: 65ehrkuf6iokmf66d98o95pexrmxssjh
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
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/11/23 14:51, Maxime Ripard wrote:
> On Mon, Sep 11, 2023 at 02:13:43PM +0200, Michel Dänzer wrote:
>> On 9/11/23 11:34, Maxime Ripard wrote:
>>> On Thu, Sep 07, 2023 at 01:40:02PM +0200, Daniel Stone wrote:
>>>>
>>>> Secondly, we will never be there. If we could pause for five years and sit
>>>> down making all the current usecases for all the current hardware on the
>>>> current kernel run perfectly, we'd probably get there. But we can't: there's
>>>> new hardware, new userspace, and hundreds of new kernel trees.
>>>
>>> [...]
>>> 
>>> I'm not sure it's actually an argument, really. 10 years ago, we would
>>> never have been at "every GPU on the market has an open-source driver"
>>> here. 5 years ago, we would never have been at this-series-here. That
>>> didn't stop anyone making progress, everyone involved in that thread
>>> included.
>>
>> Even assuming perfection is achievable at all (which is very doubtful,
>> given the experience from the last few years of CI in Mesa and other
>> projects), if you demand perfection before even taking the first step,
>> it will never get off the ground.
> 
> Perfection and scale from the get-go isn't reasonable, yes. Building a
> small, "perfect" (your words, not mine) system that you can later expand
> is doable.

I mean "perfect" as in every single available test runs, is reliable and gates CI. Which seems to be what you're asking for. The only possible expansion of such a system would be adding new 100% reliable tests.

What is being proposed here is an "imperfect" system which takes into account the reality that some tests are not 100% reliable, and can be improved gradually while already preventing some regressions from getting merged.


>>> How are we even supposed to detect those failures in the first
>>> place if tests are flagged as unreliable?
>>
>> Based on experience with Mesa, only a relatively small minority of
>> tests should need to be marked as flaky / not run at all. The majority
>> of tests are reliable and can catch regressions even while some tests
>> are not yet.
> 
> I understand and acknowledge that it worked with Mesa. That's great for
> Mesa. That still doesn't mean that it's the panacea and is for every
> project.

Not sure what you're referring to by panacea, or how it relates to "some tests can be useful even while others aren't yet".


>>> No matter what we do here, what you describe will always happen. Like,
>>> if we do flag those tests as unreliable, what exactly prevents another
>>> issue to come on top undetected, and what will happen when we re-enable
>>> testing?
>>
>> Any issues affecting a test will need to be fixed before (re-)enabling
>> the test for CI.
> 
> If that underlying issue is never fixed, at which point do we consider
> that it's a failure and should never be re-enabled? Who has that role?

Not sure what you're asking. Anybody can (re-)enable a test in CI, they just need to make sure first that it is reliable. Until somebody does that work, it'll stay disabled in CI.


>>> It might or might not be an issue for Linus' release, but I can
>>> definitely see the trouble already for stable releases where fixes will
>>> be backported, but the test state list certainly won't be updated.
>>
>> If the stable branch maintainers want to take advantage of CI for the
>> stable branches, they may need to hunt for corresponding state list
>> commits sometimes. They'll need to take that into account for their
>> decision.
> 
> So we just expect the stable maintainers to track each and every patches
> involved in a test run, make sure that they are in a stable tree, and
> then update the test list? Without having consulted them at all?

I don't expect them to do anything. See the If at the start of what I wrote.


>>>> By keeping those sets of expectations, we've been able to keep Mesa pretty
>>>> clear of regressions, whilst having a very clear set of things that should
>>>> be fixed to point to. It would be great if those set of things were zero,
>>>> but it just isn't. Having that is far better than the two alternatives:
>>>> either not testing at all (obviously bad), or having the test always be red
>>>> so it's always ignored (might as well just not test).
>>>
>>> Isn't that what happens with flaky tests anyway?
>>
>> For a small minority of tests. Daniel was referring to whole test suites.
>>
>>> Even more so since we have 0 context when updating that list.
>>
>> The commit log can provide whatever context is needed.
> 
> Sure, I've yet to see that though.
> 
> There's in 6.6-rc1 around 240 reported flaky tests. None of them have
> any context. That new series hads a few dozens too, without any context
> either. And there's no mention about that being a plan, or a patch
> adding a new policy for all tests going forward.

That does sound bad, would need to be raised in review.


> Any concern I raised were met with a giant "it worked on Mesa" handwave

Lessons learned from years of experience with big real-world CI systems like this are hardly "handwaving".


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

