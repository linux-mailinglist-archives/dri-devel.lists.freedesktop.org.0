Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECCDA684A3
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 06:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE5910E19B;
	Wed, 19 Mar 2025 05:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Z8H33VCU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-12.smtpout.orange.fr [193.252.22.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FBA10E19B;
 Wed, 19 Mar 2025 05:39:21 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id um8utLdfOnwqeum8ytx8US; Wed, 19 Mar 2025 06:39:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1742362756;
 bh=IpaEN+lSaaf3iXvbx9pvjpLuE5Y7yQM8JtA9F032OKY=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=Z8H33VCU+I5tCl1JteiThZ4KyLDgdMjzyk4KVKBTaTn8iBV/E/4O0/qNiD08Ma7aa
 +UzqtOIYhYxCyUEjwVw1ZOEPV4bEcAEFO5UrGp9KaqPzGblGUkfcmSiGKqa8Ydriq6
 CtFsFVRUf3gekjXKC3nUZ+8e6CT/ts383YJnaJNvZZxcwaqmtLu+zVT+qV2KfTtzF7
 LFYQspTzvdvZZKxAl4G0MmLRAnH459WWI5vZ3LpD7QFgfpv5J61oQepAhDkF+wqcQ9
 Dr3zAxixzghRPBO7Fg97uzyMg+QfvmvEfaAXCNk1oeZVn3vAFqrD9cq003l48E5Jfm
 AF8jaJvW5ZFNQ==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 19 Mar 2025 06:39:16 +0100
X-ME-IP: 124.33.176.97
Message-ID: <443027f0-08c9-449a-8ee0-db9b234483f4@wanadoo.fr>
Date: Wed, 19 Mar 2025 14:39:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] bits: introduce fixed-type genmasks
To: Yury Norov <yury.norov@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-2-f59315e73c29@wanadoo.fr>
 <Z9mjJ3gJoqLwjIFX@thinkpad>
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
In-Reply-To: <Z9mjJ3gJoqLwjIFX@thinkpad>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/03/2025 at 01:45, Yury Norov wrote:
> On Sat, Mar 08, 2025 at 01:48:49AM +0900, Vincent Mailhol via B4 Relay wrote:
>> From: Yury Norov <yury.norov@gmail.com>

(...)

>> +#define GENMASK(h, l)		GENMASK_TYPE(unsigned long,  h, l)
>> +#define GENMASK_ULL(h, l)	GENMASK_TYPE(unsigned long long, h, l)
> 
> I like everything except this part. We switch GENMASK() from a well
> tested implementation, including an asm code, and we split uapi and
> non-uapi users, with no functionality changes.
> 
> Unification is a solid point, however.
> 
> Let's make it a 2-step procedure? Adding fixed-width GENMASKs is a
> non-questionable improvement. Switching an existing API from one
> implementation to another should be a separate patch, and probably
> even a separate series. And we should be very clear that __GENMASK()
> is uapi-only thing from now.
> 
> If we decide to switch GENMASK() in a separate series, we'll have some
> extra time to think about unification...

Ack. I started drafting the split. The two series would look like:

[Series #1] bits: Fixed-type GENMASK_U*() and BIT_U*()
    - bits: introduce fixed-type GENMASK_U*()
    - bits: introduce fixed-type BIT_U*()
    - drm/i915: Convert REG_GENMASK*() to fixed-width GENMASK_U*()
    - test_bits: add tests for GENMASK_U*()
    - test_bits: add tests for BIT_U*()

[Series #2] bits: Split asm and non-asm GENMASK*() and unify definitions
    - bits: split the definition of the asm and non-asm GENMASK*()
    - bits: unify the non-asm GENMASK*()
    - test_bits: add tests for __GENMASK() and __GENMASK_ULL()


Series #1 will leave GENMASK(), GENMASK_ULL() and GENMASK_128()
untouched. The final result after the Series #2 will be the exact same
code as of now.

I am thinking of sending the two series at the same time, and then, you
can decide what is the good timing to merge these (and eventually, start
a separate discussion on the second series).

Does this work for you?

On a side note, it did a lot of modifications to your original patch
which introduced the GENMASK_U*(). It is OK to tag myself as author and
you as co-author or do you still prefer to stay as the main author? Let
me know!


Yours sincerely,
Vincent Mailhol

