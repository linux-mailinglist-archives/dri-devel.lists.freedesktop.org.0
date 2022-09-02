Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC515ABAF2
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 00:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8648F10E86B;
	Fri,  2 Sep 2022 22:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B867110E86B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 22:53:16 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4MKCqv6s4NzDrFl;
 Fri,  2 Sep 2022 22:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662159196; bh=i2F1c9iVsqZkDzJzJ6RHqg0ckfbot+Zkzd9ahCdNz0s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kUCEmXh7zX1JHy1VsNLd21up+NmwYy0af7IVmEYEPZ9/4aL0zPshrCX2SiJqFcJDL
 HhRlnlNbbm9T7qm9ubwFTGZbKulOH6oqd1Wn2SJxNc67OrRy993jKjBXu052DLDSlM
 lacB8dBFRF6aJzCUOIZnWtP1A3yvJjm871C+wcD4=
X-Riseup-User-ID: CEDC724E390C6B4B331BDB7D15FA2D97D997D4091360D282775AAD1DE1285803
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4MKCqm6LGxz1yQr;
 Fri,  2 Sep 2022 22:53:08 +0000 (UTC)
Message-ID: <5343a9c6-d560-fc8b-e828-2e08810e4de0@riseup.net>
Date: Fri, 2 Sep 2022 19:53:05 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/2] drm/tests: Change "igt_" prefix to "test_drm_"
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20220901124210.591994-1-mairacanal@riseup.net>
 <20220901124210.591994-2-mairacanal@riseup.net>
 <20220901125530.b56s4zisnkfuigvc@houat>
 <04aeba53-793c-3196-3137-915f0640dc2a@riseup.net> <87h71qfbi9.fsf@intel.com>
 <20220902123400.5ljgc7z6zw34d64m@houat> <87mtbidj3b.fsf@intel.com>
 <20220902133828.ufwp6bgzd37yu6bv@nostramo.hardline.pl>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20220902133828.ufwp6bgzd37yu6bv@nostramo.hardline.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Arthur Grillo <arthur.grillo@usp.br>, siqueirajordao@riseup.net,
 magalilemes00@gmail.com, David Airlie <airlied@linux.ie>,
 tales.aparecida@gmail.com, brendanhiggins@google.com,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, mwen@igalia.com,
 Maxime Ripard <maxime@cerno.tech>, David Gow <davidgow@google.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/2/22 10:38, Michał Winiarski wrote:
> On Fri, Sep 02, 2022 at 04:03:20PM +0300, Jani Nikula wrote:
>> On Fri, 02 Sep 2022, Maxime Ripard <maxime@cerno.tech> wrote:
>>> On Fri, Sep 02, 2022 at 11:04:14AM +0300, Jani Nikula wrote:
>>>> On Thu, 01 Sep 2022, Maíra Canal <mairacanal@riseup.net> wrote:
>>>>> Hi Maxime,
>>>>>
>>>>> On 9/1/22 09:55, Maxime Ripard wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Thu, Sep 01, 2022 at 09:42:10AM -0300, Maíra Canal wrote:
>>>>>>> With the introduction of KUnit, IGT is no longer the only option to run
>>>>>>> the DRM unit tests, as the tests can be run through kunit-tool or on
>>>>>>> real hardware with CONFIG_KUNIT.
>>>>>>>
>>>>>>> Therefore, remove the "igt_" prefix from the tests and replace it with
>>>>>>> the "test_drm_" prefix, making the tests' names independent from the tool
>>>>>>> used.
>>>>>>>
>>>>>>> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
>>>>>>>
>>>>>>> ---
>>>>>>> v1 -> v2: https://lore.kernel.org/dri-devel/20220830211603.191734-1-mairacanal@riseup.net/
>>>>>>> - Change "drm_" prefix to "test_drm_", as "drm_" can be a bit confusing (Jani Nikula).
>>>>>>
>>>>>> I appreciate it's a bit of a bikeshed but I disagree with this. The
>>>>>> majority of the kunit tests already out there start with the framework
>>>>>> name, including *all* the examples in the kunit doc. Plus, it's fairly
>>>>>> obvious that it's a test, kunit is only about running tests in the first
>>>>>> place.
>>>>>
>>>>> Would it be better to keep it as "drm_"?
>>>>
>>>> That's not "keeping". That's renaming igt to drm.
>>>
>>> Well, there's like half the tests that are prefixed with drm, the other
>>> with igt, so it's both really
>>>
>>>>> Currently, I don't think it is appropriate to hold the "igt_" prefix, as
>>>>> the tests are not IGT exclusive, but I don't have a strong opinion on
>>>>> using the "drm_" or the "test_drm" prefixes.
>>>>
>>>> I repeat my stance that "drm_" alone is confusing.
>>>
>>> What are you confusing it with?
>>>
>>>> For the reason alone that it pollutes the code tagging tools, mixing
>>>> actual drm_ types and functions with unit test functions.
>>>
>>> I don't get it, I'm sorry. All these functions are static and not part
>>> of any API, so I can't see how it would pollute a code tagging tool. Or
>>> at least, not more than any driver does.
>>>
>>> And we're part of a larger project here, it's about consistency with the
>>> rest of the ecosystem.
>>
>> Okay, so I'm just going to explain what I mean, but say "whatever" right
>> after and move on.
>>
>> For example, drm_buddy_test.c includes drm_buddy.h so with the igt_ ->
>> drm_ rename none of the test functions may clash with the drm_buddy_
>> prefixed existing functions. Ditto for all tests similarly.
>>
>> For example drm_buddy_alloc_range() as a name sounds like something that
>> allocs a range, not something that tests range allocation. On the other
>> hand, you have drm_buddy_alloc_blocks() which is actually a real
>> drm_buddy function, not a test. What would you call a test that tests
>> that? Here, we end up with names that are all prefixed drm_buddy and you
>> won't know what's the actual function and what's the test unless you
>> look it up.
>>
>> I use code tagging that I can use for finding and completing
>> e.g. functions. Currently I have the following completions, for
>> igt_buddy_ and drm_buddy_, respectively:
>>
>> Possible completions are:
>> igt_buddy_alloc_limit 	igt_buddy_alloc_optimistic 	igt_buddy_alloc_pathological
>> igt_buddy_alloc_pessimistic 	igt_buddy_alloc_range 	igt_buddy_alloc_smoke
>>
>> Possible completions are:
>> drm_buddy_alloc_blocks 	drm_buddy_block 	drm_buddy_block_is_allocated 	drm_buddy_block_is_free
>> drm_buddy_block_is_split 	drm_buddy_block_offset 	drm_buddy_block_order 	drm_buddy_block_print
>> drm_buddy_block_size 	drm_buddy_block_state 	drm_buddy_block_trim 	drm_buddy_fini
>> drm_buddy_free_block 	drm_buddy_free_list 	drm_buddy_init 	drm_buddy_init_test
>> drm_buddy_module_exit 	drm_buddy_module_init 	drm_buddy_print
>>
>> With the patch at hand, they'll all be lumped under drm_buddy_
>> completions, and some of them will be actual drm buddy functions and
>> some not.
>>
>> I just find it a very odd convention to name the tests in a way that's
>> indistinguishable from the real things. Even *within* drm_buddy_test.c
>> where you read the test code. Because currently you do have calls to
>> igt_buddy_ prefixed functions from other igt_buddy_ prefixed functions,
>> along with the drm_buddy_ prefixed calls. I think it's just going to be
>> a mess.
>>
>> /rant
>>
>> Whatever. Moving on.
> 
> KUnit docs [1] state:
> https://docs.kernel.org/dev-tools/kunit/style.html#test-cases
> "As tests are themselves functions, their names cannot conflict with other
> C identifiers in the kernel. This may require some creative naming."
> And give examples of names. But this should be local to individual test suite -
> as long as the test is readable, and the name describes what it is testing, we
> should be fine. We don't even need to pass drm_* prefix, as this convention is
> expected for test suites, not test cases [2].
> 
> Having said that - I do believe that igt_* prefix don't belong here (which is
> why I'm progressively trying to get rid of in the patches that refactor some of
> the tests).
> I agree with Jani - can we take it on a case-by-case basis?
> If the test name is too similar to the function that it is testing, we could go
> with one of the following (taking igt_buddy_alloc_limit as example):
> drm_buddy_test_alloc_limit
> test_drm_buddy_alloc_limit
> buddy_test_alloc_limit
> test_buddy_alloc_limit
> 
> And either of those is fine in my opinion (I'd personally go with
> test_buddy_alloc_limit in this case).
> We don't really need a DRM-wide (or worse, kernel wide) convention for test case
> names (it's only really needed for test suites).

Although I do like the idea of having a DRM-wide name convention for
test cases as it would ease the identification of test cases, I can see
that consensus on this matter might be hard. So I guess we can take case
by case.

But as it would be nice to remove the "igt_" prefix from the tests, a
first name convention might be needed. Currently, I'm not sure in which
direction to go for removing the "igt_" from the tests.

For me, any of the options mentioned above would be okay, with a slight
preference for the test_drm_ one.

Mentioning "test" on the test case really helps distinguish the API and
the test cases. Most of the KUnit tests that I saw have the "test" in
some part of the function (sometimes in the beginning, sometimes in the
end, or after the subsystem prefix). So, I guess using "test" on the
functions is not a bad practice, or redundant.

Best Regards,
- Maíra Canal

> 
> [1] https://docs.kernel.org/dev-tools/kunit/style.html#test-cases
> [2] https://docs.kernel.org/dev-tools/kunit/style.html#suites
> 
> -Michał
> 
>>
>>
>> BR,
>> Jani.
>>
>>
>> -- 
>> Jani Nikula, Intel Open Source Graphics Center
