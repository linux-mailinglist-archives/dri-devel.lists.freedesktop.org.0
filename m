Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4D5A54E65
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2385A10E9D3;
	Thu,  6 Mar 2025 14:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="A0rzXYL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF96C10E9D3;
 Thu,  6 Mar 2025 14:57:10 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id qCectS0xXfuZZqCeht9SE6; Thu, 06 Mar 2025 15:57:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741273026;
 bh=IApVMtvhjjP+ynu8qaqYMeHBWOrmsHhRBAhBqDTMITc=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=A0rzXYL688yLcQtnNV/Xch+ap1kY4osfMKwIBOGou3ooRn6PSSXwvXKQf5+dPpT3F
 J5xB/DPmofS4uEZh7v6XufjsSpI3u9pHPOphsgCONylcCBo9zlfTryY3MJjAdTFYTw
 GBtkeKCpApzQqzWcB1i9K3T9FaltKARpTS2pHng+7CTGwtpyEVZ3lqcUhEQ4QCWR5v
 91wW5uaSNKA2h9boasBgQqpY5/30tc4fTsKaYIaxjkXSi1ohjShpNlx4+vksJBh14L
 2GnWEve1JZ6jKdecGCfIi+QHzfkwvboan5WmuAZFXYXkjcD05gd5xZUGgauPdUA4d8
 +rBDaBJWJYapA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 Mar 2025 15:57:06 +0100
X-ME-IP: 124.33.176.97
Message-ID: <34c42bf9-a9e6-41db-9efb-a32bb253b4d2@wanadoo.fr>
Date: Thu, 6 Mar 2025 23:56:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] bits: Fixed-type GENMASK()/BIT()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <Z8mc8t_OJzUGFjH-@smile.fi.intel.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <Z8mc8t_OJzUGFjH-@smile.fi.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/03/2025 at 22:02, Andy Shevchenko wrote:
> On Thu, Mar 06, 2025 at 08:29:51PM +0900, Vincent Mailhol via B4 Relay wrote:
>> Introduce some fixed width variant of the GENMASK() and the BIT()
>> macros in bits.h. Note that the main goal is not to get the correct
>> type, but rather to enforce more checks at compile time. For example:
>>
>>   GENMASK_U16(16, 0)
>>
>> will raise a build bug.
>>
>> This series is a continuation of:
>>
>>   https://lore.kernel.org/intel-xe/20240208074521.577076-1-lucas.demarchi@intel.com
>>
>> from Lucas De Marchi. Above series is one year old. I really think
>> that this was a good idea and I do not want this series to die. So I
>> am volunteering to revive it.
>>
>> Meanwhile, many changes occurred in bits.h. The most significant
>> change is that __GENMASK() was moved to the uapi headers.
>>
>> In v4 an onward, I introduce one big change: split the definition of
>> the asm and non-asm GENMASK(). I think this is controversial.
>> Especially, Yury commented that he did not want such split. So I
>> initially implemented a first draft in which both the asm and non-asm
>> version would rely on the same helper macro, i.e. adding this:
>>
>>   #define __GENMASK_t(t, w, h, l)			\
> 
> I thought we agreed on renaming...
> 
>>   	(((t)~_ULL(0) - ((t)1 << (l)) + 1) &		\
>>   	 ((t)~_ULL(0) >> (w - 1 - (h))))
>>     
>> to uapi/bits.h. And then, the different GENMASK()s would look like
>> this:
>>
>>   #define __GENMASK(h, l) __GENMASK_t(unsigned long, __BITS_PER_LONG, h, l)
> 
> Ditto.

I forgot to update the cover letter, my bad…

>> and so on.
>>     
>> I implemented it, and the final result looks quite ugly. Not only do
>> we need to manually provide the width each time, the biggest concern
>> is that adding this to the uapi is asking for trouble. Who knows how
>> people are going to use this? And once it is in the uapi, there is
>> virtually no way back.
>>
>> Finally, I do not think it makes sense to expose the fixed width
>> variants to the asm. The fixed width integers type are a C
>> concept. For asm, the long and long long variants seems sufficient.
>>
>> And so, after implementing both, the asm and non-asm split seems way
>> more clean and I think this is the best compromise. Let me know what
>> you think :)
>>
>> As requested, here are the bloat-o-meter stats:
>>
>>   $ ./scripts/bloat-o-meter vmlinux_before.o vmlinux_after.o 
>>   add/remove: 0/0 grow/shrink: 4/2 up/down: 5/-4 (1)
>>   Function                                     old     new   delta
>>   intel_psr_invalidate                         666     668      +2
>>   mst_stream_compute_config                   1652    1653      +1
>>   intel_psr_flush                              977     978      +1
>>   intel_dp_compute_link_config                1327    1328      +1
>>   cfg80211_inform_bss_data                    5109    5108      -1
>>   intel_drrs_activate                          379     376      -3
>>   Total: Before=22723481, After=22723482, chg +0.00%
>>
>> (done with GCC 12.4.1 on a defconfig)
> 
> What defconfig? x86_64_defconfig?

Yes, x86_64 defconfig.


Yours sincerely,
Vincent Mailhol

