Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26785A6D55C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 08:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61DDC10E1FA;
	Mon, 24 Mar 2025 07:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sdI268tj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-66.smtpout.orange.fr [193.252.22.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6873310E1FA;
 Mon, 24 Mar 2025 07:44:45 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id wcU2tGWSCo3Z8wcU6tISto; Mon, 24 Mar 2025 08:44:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1742802281;
 bh=XsGk3ixhSurfkLIH5o1CSD/Ev7zogu3EYa8+C/nPa0g=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=sdI268tj5lyVJtO3fEwynmKPbQg09PuOecq2JJCSdjSp7N1NgJ6fcy6XKYbjGhr/1
 2gk2XM/VMpWoxAKiiAcbhewU0pEJZB6nFv5S2ZlayCpKZ18kjNF05DGW9vwRi6bIcz
 z3ul2hSwmRTaF10207d/yfQSpK0HTU8rrtuJjS1jHE0+UHG38ESd4ian45uXMWsPxj
 KymUZv00SMfq99I4IgfJQJjFAQJ0EUxtmscmuGjmFOjH0YeShHtWdQ/rPkGEvecps8
 CUFUtHhORoskiP35auEhZb9UakXJ6ypJq3LVyLDwRigo50w+Z7LRWCyAlaZpmWdz9O
 j0TF2QXUwzPnw==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 24 Mar 2025 08:44:41 +0100
X-ME-IP: 124.33.176.97
Message-ID: <202c97b2-e99e-4b88-9ac5-171db244b7d0@wanadoo.fr>
Date: Mon, 24 Mar 2025 16:44:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] bits: introduce fixed-type GENMASK_U*()
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
 David Laight <David.Laight@aculab.com>, Jani Nikula <jani.nikula@intel.com>
References: <20250322-fixed-type-genmasks-v7-0-da380ff1c5b9@wanadoo.fr>
 <20250322-fixed-type-genmasks-v7-1-da380ff1c5b9@wanadoo.fr>
 <Z-EIHBCkUiBh63JE@smile.fi.intel.com>
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
In-Reply-To: <Z-EIHBCkUiBh63JE@smile.fi.intel.com>
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

On 24/03/2025 at 16:22, Andy Shevchenko wrote:
> On Sat, Mar 22, 2025 at 06:23:12PM +0900, Vincent Mailhol via B4 Relay wrote:
>>
>> Add GENMASK_TYPE() which generalizes __GENMASK() to support different
>> types, and implement fixed-types versions of GENMASK() based on it.
>> The fixed-type version allows more strict checks to the min/max values
>> accepted, which is useful for defining registers like implemented by
>> i915 and xe drivers with their REG_GENMASK*() macros.
>>
>> The strict checks rely on shift-count-overflow compiler check to fail
>> the build if a number outside of the range allowed is passed.
>> Example:
>>
>>   #define FOO_MASK GENMASK_U32(33, 4)
>>
>> will generate a warning like:
>>
>>   include/linux/bits.h:51:27: error: right shift count >= width of type [-Werror=shift-count-overflow]
>>      51 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
>>         |                           ^~
>>
>> While GENMASK_TYPE() is crafted to cover all variants, including the
>> already existing GENMASK(), GENMASK_ULL() and GENMASK_U128(), for the
>> moment, only use it for the newly introduced GENMASK_U*(). The
>> consolidation will be done in a separate change.
> 
> ...
> 
>>  #if !defined(__ASSEMBLY__)
>> +
> 
>> -#else
> 
>> +#else /* defined(__ASSEMBLY__) */
> 
>> -#endif
>> +
>> +#endif /* !defined(__ASSEMBLY__) */
> 
> Up to you, but if new version is needed or maintainer require, I would move the
> above changes either to a separate patch (prerequisite) or dropped them at all.
> These are not big but unneeded churn,

I do not want to drop this. After all the changes, there is a lot of
scrolling between the #if, #else and #endif, and the comments helps to
keep track of which context we are in.

As for putting this into another patch, OK but only if there is a need
for new version for other reasons.


Yours sincerely,
Vincent Mailhol

