Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8B4A50593
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 17:49:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32E110E810;
	Wed,  5 Mar 2025 16:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="pKFV87ss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10B110E812;
 Wed,  5 Mar 2025 16:49:02 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id prvOtftmoZnsCprvRt3rsg; Wed, 05 Mar 2025 17:49:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741193340;
 bh=j9nGONWhGA45NRZO2uATs6VDnzNoOJxrTpX5zYo0+Ls=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=pKFV87ssDxt+FnLPqPthrU5SW9FHI0KdPU7Z0ZAXtY0XuvGmYjaGWfBqyaWx9CI6K
 oupDJM/0ab/EpjAKFEfm9MV/hlb2vadf8XEPzJLyA3pgjocfwpiGShl9NhtU3nhNDh
 2LLIQNgGNaPDehHXzg9Isto0SwwYoLHOdpbpWJy1owMqWUEvCD7OKT0/NIToEbOTJ1
 wyTNIbvgWCrEslgu9DW+DvDmpfzbK0LLnBeHI6zYbCTtfmkCn+ryA1P23BYF6BSft1
 /YzdvZUBCSmGB8Ik54M4uUfv6AHCv90m4DkFK63qM0nOJid54khiqchl4XmMsrf6OP
 NzPKyvs9XSnZg==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 05 Mar 2025 17:49:00 +0100
X-ME-IP: 124.33.176.97
Message-ID: <8301ecbc-d035-4257-9b04-c6ef9be4ce32@wanadoo.fr>
Date: Thu, 6 Mar 2025 01:48:49 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
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
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hx9AaUX_GvYq_A@thinkpad>
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
In-Reply-To: <Z8hx9AaUX_GvYq_A@thinkpad>
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

On 06/03/2025 at 00:47, Yury Norov wrote:
> On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:
>> From: Yury Norov <yury.norov@gmail.com>
>>
>> Add __GENMASK_t() which generalizes __GENMASK() to support different
>> types, and implement fixed-types versions of GENMASK() based on it.
>> The fixed-type version allows more strict checks to the min/max values
>> accepted, which is useful for defining registers like implemented by
>> i915 and xe drivers with their REG_GENMASK*() macros.
>>
>> The strict checks rely on shift-count-overflow compiler check to fail
>> the build if a number outside of the range allowed is passed.
>> Example:
>>
>> 	#define FOO_MASK GENMASK_U32(33, 4)
>>
>> will generate a warning like:
>>
>> 	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
>> 	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>> 	      |                               ^~
>>
>> Signed-off-by: Yury Norov <yury.norov@gmail.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> 
> Co-developed-by?

OK. I will keep you as the main author and credit me as Co-developer.

>> ---
>> Changelog:
>>
>>   v3 -> v4:
>>
>>     - The v3 is one year old. Meanwhile people started using
>>       __GENMASK() directly. So instead of generalizing __GENMASK() to
>>       support different types, add a new GENMASK_t().
>>
>>     - replace ~0ULL by ~_ULL(0). Otherwise, __GENMASK_t() would fail
>>       in asm code.
>>
>>     - Make GENMASK_U8() and GENMASK_U16() return an unsigned int. In
>>       v3, due to the integer promotion rules, these were returning a
>>       signed integer. By casting these to unsigned int, at least the
> 
> This comment will disappear when I'll apply the patch. Can you comment
> it in the code instead?

Ack. I will add below comment in the code:

  /*
   * Because of the C integer promotion rules, the U8 and the U16
   * variants would immediately become signed integers when used in
   * expressions. Cast them to unsigned int so that, at least, the
   * signedness is preserved.
   */

(unless if you prefer to go back to the u8 and u16 casts, c.f. below).

>>       signedness is kept.
>> ---
>>  include/linux/bitops.h |  1 -
>>  include/linux/bits.h   | 33 +++++++++++++++++++++++++++++----
>>  2 files changed, 29 insertions(+), 5 deletions(-)
>>
>> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
>> index c1cb53cf2f0f8662ed3e324578f74330e63f935d..9be2d50da09a417966b3d11c84092bb2f4cd0bef 100644
>> --- a/include/linux/bitops.h
>> +++ b/include/linux/bitops.h
>> @@ -8,7 +8,6 @@
>>  
>>  #include <uapi/linux/kernel.h>
>>  
>> -#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
>>  #define BITS_TO_LONGS(nr)	__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
>>  #define BITS_TO_U64(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
>>  #define BITS_TO_U32(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
>> diff --git a/include/linux/bits.h b/include/linux/bits.h
>> index 5f68980a1b98d771426872c74d7b5c0f79e5e802..f202e46d2f4b7899c16d975120f3fa3ae41556ae 100644
>> --- a/include/linux/bits.h
>> +++ b/include/linux/bits.h
>> @@ -12,6 +12,7 @@
>>  #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
>>  #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
>>  #define BITS_PER_BYTE		8
>> +#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
>>  
>>  /*
>>   * Create a contiguous bitmask starting at bit position @l and ending at
>> @@ -25,14 +26,38 @@
>>  
>>  #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
>>  
>> -#define GENMASK(h, l) \
>> -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>> -#define GENMASK_ULL(h, l) \
>> -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>> +/*
>> + * Generate a mask for the specified type @t. Additional checks are made to
>> + * guarantee the value returned fits in that type, relying on
>> + * shift-count-overflow compiler check to detect incompatible arguments.
>> + * For example, all these create build errors or warnings:
>> + *
>> + * - GENMASK(15, 20): wrong argument order
>> + * - GENMASK(72, 15): doesn't fit unsigned long
>> + * - GENMASK_U32(33, 15): doesn't fit in a u32
>> + */
>> +#define GENMASK_t(t, h, l)				\
> 
> Agree with Andy. This should be GENMASK_TYPE, or triple-underscored
> ___GENMASK() maybe. This _t thing looks misleading.

My preference goes to GENMASK_TYPE().

>> +	(GENMASK_INPUT_CHECK(h, l) +			\
>> +	 (((t)~ULL(0) - ((t)1 << (l)) + 1) &		\
>> +	  ((t)~ULL(0) >> (BITS_PER_TYPE(t) - 1 - (h)))))
> 
> Can you rebase it on top of -next? In this dev cycle I merge a patch
> that reverts the __GENMASK() back to:

Oh, I did not realize that. Do you mean a rebase on top of:

  https://github.com/norov/linux/tree/bitmap-for-next

?

I will do so.

> #define __GENMASK(h, l) (((~_UL(0)) << (l)) & (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
> 
>> +#define GENMASK(h, l) GENMASK_t(unsigned long,  h, l)
>> +#define GENMASK_ULL(h, l) GENMASK_t(unsigned long long, h, l)
> 
> This makes __GENMASK() and __GENMASK_ULL() unused in the kernel, other
> than in uapi. Or I misunderstand it?

Correct.

> Having, in fact, different implementations of the same macro for kernel
> and userspace is a source of problems. Can we move GENMASK_TYPE() to uapi,
> and implement __GENMASK() on top of them? If not, I'd prefer to keep
> GENMASK and GENMASK_ULL untouched.

This is something which I tried to explain in the cover letter. I am not
confident to declare GENMASK_TYPE() in the uapi and expose it to the
userland. If we do so, any future change in the parameters would be a
user breaking change. __GENMASK_U128() looks already too much to me for
the uapi, I am not keen to bloat it even more with GENMASK_TYPE().

This plus the fact that if we use GENMASK_TYPE() to generate the asm
variant, then we can not rely on sizeof() in the definition which makes
everything over complicated.

I acknowledge that not having a common denominator is not best, but I
see this as an acceptable tradeoff.

> Can you run bloat-o-meter and ensure there's no unwanted effects on
> code generation?

Ack, but that will be tomorrow :)

>>  /*
>>   * Missing asm support
>>   *
>> + * __GENMASK_U*() depends on BITS_PER_TYPE() which would not work in the asm
> 
> And there's no __GENMASK_U*(), right?

Yes, silly typo, sorry. Will fix in v5.

>> + * code as BITS_PER_TYPE() relies on sizeof(), something not available in
>> + * asm. Nethertheless, the concept of fixed width integers is a C thing which
>> + * does not apply to assembly code.
>> + */
>> +#define GENMASK_U8(h, l) ((unsigned int)GENMASK_t(u8,  h, l))
>> +#define GENMASK_U16(h, l) ((unsigned int)GENMASK_t(u16, h, l))
> 
> Typecast to the type that user provides explicitly?  And maybe do
> in GENMASK_TYPE()

I have a slight preference for the cast to unsigned int for the reason
explained above. But that is not a deal breaker. If you believe that the
u8/u16 casts are better, let me know, I will be happy to change it :)

>> +#define GENMASK_U32(h, l) GENMASK_t(u32, h, l)
>> +#define GENMASK_U64(h, l) GENMASK_t(u64, h, l)
> 
> OK, this looks good. But GENMASK_U128() becomes a special case now.
> The 128-bit GENMASK is unsued, but it's exported in uapi. Is there any
> simple way to end up with a common implementation for all fixed-type
> GENMASKs?

What bothers me is that the 128 bit types are not something available on
all architectures, c.f. the CONFIG_ARCH_SUPPORTS_INT128. So, I would
need a U128() equivalent to the ULL() but which does not break on
architectures which do not support 128 bits integers.

This is where I am stuck. If someone can guide me on how to write a
robust U128() macro, then I think the common implementation could be
feasible.

>> +
>> +/*
>>   * __GENMASK_U128() depends on _BIT128() which would not work
>>   * in the asm code, as it shifts an 'unsigned __int128' data
>>   * type instead of direct representation of 128 bit constants
> 
> This comment is duplicated by the previous one. Maybe just join them?
> (Let's wait for a while for updates regarding GENMASK_U128 status before
> doing it.)

OK. I will wait for this one. I will probably send the v5 before we get
the answer but I do not this this is an issue if we have two parallel
streams.


Yours sincerely,
Vincent Mailhol

