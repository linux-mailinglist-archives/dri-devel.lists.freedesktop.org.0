Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC9F5F0AA7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 13:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A1410ECA9;
	Fri, 30 Sep 2022 11:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0B210EC9A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 11:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kto352C5JbXS9gyJb/ZdeGb8qmDghRhIJpwf498en+s=; b=q0CzIU2Ghmr6YyWy9t8I/dyoSX
 ICGSoWeKulgf/3yBh4oD7L7WRkwd1ZwXcqpkfk6sssOVlzVlc1EAQmXFAi3oZYwa4IGqtmcPEnrh/
 s9FKn4XTjLhDMynP/qdhxUIOpvx2rpJmZkFKVfzXMx2IYdLtrn379rA5X0iaTyK/TWrQdeKuPAc8N
 C6jXXNKoAiA8ZPBskkax9j7rqpVcwceMzqx89cXX9Kl+8Xf0OaG/4rhmzWJgU3zb41ymac2UiD9B1
 wAcBHpxzSwa+qqOgTow92yqe2Pj/fGwTTOQOB8YYX9UPaksZfvQchyn8CcqbAN2j5+f3f7h1DQBJ1
 6FjdTD6A==;
Received: from [177.34.169.227] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1oeEKa-000MGs-OC; Fri, 30 Sep 2022 13:37:24 +0200
Message-ID: <9e5f6178-5edc-2ec9-f336-5df3e5b887f8@igalia.com>
Date: Fri, 30 Sep 2022 08:37:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 2/2] drm/tests: Split
 drm_test_dp_mst_sideband_msg_req_decode into parameterized tests
To: =?UTF-8?Q?Micha=c5=82_Winiarski?= <michal.winiarski@intel.com>,
 David Gow <davidgow@google.com>
References: <20220927221206.55930-1-mcanal@igalia.com>
 <20220927221206.55930-2-mcanal@igalia.com>
 <20220929223333.vh6wy45mfx6kccds@nostramo>
 <CABVgOSkx7KYNRKCN5h=37zQGR0qu+BDCb6cQeqbCwX8UxC3knw@mail.gmail.com>
 <20220930091156.zt7w74g5axfozlts@nostramo>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20220930091156.zt7w74g5axfozlts@nostramo>
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Arthur Grillo <arthur.grillo@usp.br>, magalilemes00@gmail.com,
 David Airlie <airlied@linux.ie>, Tales Aparecida <tales.aparecida@gmail.com>,
 Daniel Latypov <dlatypov@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Isabella Basso <isabbasso@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/30/22 06:11, Michał Winiarski wrote:
> On Fri, Sep 30, 2022 at 02:50:43PM +0800, David Gow wrote:
>> On Fri, Sep 30, 2022 at 6:33 AM Michał Winiarski
>> <michal.winiarski@intel.com> wrote:
>>>
>>> On Tue, Sep 27, 2022 at 07:12:06PM -0300, Maíra Canal wrote:
>>>> The drm_test_dp_mst_sideband_msg_req_decode repeats the same test
>>>> structure with different parameters. This could be better represented
>>>> by parameterized tests, provided by KUnit.
>>>>
>>>> In order to convert the tests to parameterized tests, the test case for
>>>> the client ID was changed: instead of using get_random_bytes to generate
>>>> the client ID, the client ID is now hardcoded in the test case.
>>>
>>> Generally "random" usage is not incompatible with parameterized tests, we can
>>> create parameterized tests that use random data.
>>> The idea is to pass a function that generates the actual param (where we have a
>>> pointer to function as one of the members in "params" struct).
>>>
>>> For example, see "random_dp_query_enc_client_id" usage here:
>>> https://lore.kernel.org/dri-devel/20220117232259.180459-7-michal.winiarski@intel.com/

Although it is possible, I don't see the benefit in this case to use the
get_random_bytes instead of hardcoding. I believe it will only add more
boilerplate to the tests.

>>>
>>> In this case, we just compare data going in with data going out (and the data
>>> itself is not transformed in any way), so it doesn't really matter for coverage
>>> and we can hardcode.
>>>
>>> -Michał
>>
>> FWIW, while the uses of randomness in DRM tests so far haven't
>> concerned me much, I think we'll eventually want to have some way of
>> ensuring the inputs to tests are deterministic.
>>
>> My thoughts are that (at some point) we'll add a kunit_random()
>> function or similar, which will use a pseudorandom number generator
>> which can be set to a deterministic seed before each test case. That
>> way, there'd be a way to reproduce an error easily if it occurred. (Of
>> course, there'd be a way of setting different or random seeds to
>> preserve the extra coverage you'd otherwise get.)
> 
> That's exactly what DRM tests do (well... most DRM tests, this one being the
> exception, and those other tests also seem to have lost a printk with seed value
> after being refactored into kunit).

I will take a look at those lost printk in drm_mm_test and
drm_buddy_test, as they are important to assure the reproducibility of
the tests.

> See the usage of DRM_RND_STATE in drm_mm_test and drm_buddy_test.
> Having kunit_random() would definitely be useful and let us remove bunch of
> boilerplate from the tests, but it doesn't prevent using reproducible random
> data in existing tests.
> 
>> I don't think this is something worth holding up or changing existing
>> tests at the moment, but having tests behave deterministically is
>> definitely desirable, so +1 to avoiding get_random_bytes() if it's not
>> giving you any real benefit.
> 
> Yeah - all I was refering to in my previous message was the wording of the
> commit message. We're just removing it because it is desirable in this
> particular case, not because of the fact that the test is now parameterized and
> that's somehow preventing get_random_bytes() usage.

I will send a v3 rewording the commit message to make it more clear.

Best Regards,
- Maíra Canal

> 
> -Michał
> 
>> We've also had a few requests in the past for being able to pass in a
>> custom set of parameters from userspace, which opens up some other
>> interesting possibilities, though it's not a priority at the moment.
>>
>> Cheers,
>> -- David
> 
> 
