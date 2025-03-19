Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942EDA688C0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 10:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C3F10E237;
	Wed, 19 Mar 2025 09:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 00E6310E254;
 Wed, 19 Mar 2025 03:34:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB43512FC;
 Tue, 18 Mar 2025 20:34:25 -0700 (PDT)
Received: from [10.162.16.153] (a077893.blr.arm.com [10.162.16.153])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E7843F63F;
 Tue, 18 Mar 2025 20:34:11 -0700 (PDT)
Message-ID: <5cbaefa8-e51f-415f-a9b3-4841e69bb3fa@arm.com>
Date: Wed, 19 Mar 2025 09:04:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
To: Yury Norov <yury.norov@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
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
 <Z8hsRJvpjYoqh9RG@thinkpad> <Z9oiEkQEcHhA0a80@thinkpad>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z9oiEkQEcHhA0a80@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 19 Mar 2025 09:53:34 +0000
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

On 3/19/25 07:16, Yury Norov wrote:
> + Catalin Marinas, ARM maillist
> 
> Hi Catalin and everyone,

Hello Yury,

> 
> Anshuman Khandual asked me to merge GENMASK_U128() saying it's
> important for ARM to stabilize API. While it's a dead code, I
> accepted his patch as he promised to add users shortly.
> 
> Now it's more than half a year since that. There's no users,
> and no feedback from Anshuman.

My apologies to have missed your email earlier. Please find response
for the earlier email below as well.

> 
> Can you please tell if you still need the macro? I don't want to
> undercut your development, but if you don't need 128-bit genmasks
> there's no reason to have a dead code in the uapi.

The code base specifically using GENMASK_U128() has not been posted
upstream (probably in next couple of months or so) till now, except
the following patch which has been not been merged and still under
review and development.

https://lore.kernel.org/lkml/20240801054436.612024-1-anshuman.khandual@arm.com/

> 
> Thanks,
> Yury
> 
> On Wed, Mar 05, 2025 at 10:22:47AM -0500, Yury Norov wrote:
>> + Anshuman Khandual <anshuman.khandual@arm.com>
>>
>> Anshuman,
>>
>> I merged your GENMASK_U128() because you said it's important for your
>> projects, and that it will get used in the kernel soon.
>>
>> Now it's in the kernel for more than 6 month, but no users were added.
>> Can you clarify if you still need it, and if so why it's not used?

We would need it but although the code using GENMASK_U128() has not been
posted upstream.

>>
>> As you see, people add another fixed-types GENMASK() macros, and their
>> implementation differ from GENMASK_U128().

I will take a look. Is GENMASK_U128() being problematic for the this new
scheme ?

>>
>> My second concern is that __GENMASK_U128() is declared in uapi, while
>> the general understanding for other fixed-type genmasks is that they
>> are not exported to users. Do you need this macro to be exported to
>> userspace? Can you show how and where it is used there?

No, not atleast right now.

These were moved into uapi subsequently via the following commit.

21a3a3d015aee ("tools headers: Synchronize {uapi/}linux/bits.h with the kernel sources")

But in general GENMASK_U128() is needed for generating 128 bit page table
entries, related flags and masks whether in kernel or in user space for
writing kernel test cases etc.

>>
>> Thanks,
>> Yury
>>
>>
>> On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:
>>> From: Yury Norov <yury.norov@gmail.com>
>>>
>>> Add __GENMASK_t() which generalizes __GENMASK() to support different
>>> types, and implement fixed-types versions of GENMASK() based on it.
>>> The fixed-type version allows more strict checks to the min/max values
>>> accepted, which is useful for defining registers like implemented by
>>> i915 and xe drivers with their REG_GENMASK*() macros.
>>>
>>> The strict checks rely on shift-count-overflow compiler check to fail
>>> the build if a number outside of the range allowed is passed.
>>> Example:
>>>
>>> 	#define FOO_MASK GENMASK_U32(33, 4)
>>>
>>> will generate a warning like:
>>>
>>> 	../include/linux/bits.h:41:31: error: left shift count >= width of type [-Werror=shift-count-overflow]
>>> 	   41 |          (((t)~0ULL - ((t)(1) << (l)) + 1) & \
>>> 	      |                               ^~
>>>
>>> Signed-off-by: Yury Norov <yury.norov@gmail.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Acked-by: Jani Nikula <jani.nikula@intel.com>
>>> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>>> ---
>>> Changelog:
>>>
>>>   v3 -> v4:
>>>
>>>     - The v3 is one year old. Meanwhile people started using
>>>       __GENMASK() directly. So instead of generalizing __GENMASK() to
>>>       support different types, add a new GENMASK_t().
>>>
>>>     - replace ~0ULL by ~_ULL(0). Otherwise, __GENMASK_t() would fail
>>>       in asm code.
>>>
>>>     - Make GENMASK_U8() and GENMASK_U16() return an unsigned int. In
>>>       v3, due to the integer promotion rules, these were returning a
>>>       signed integer. By casting these to unsigned int, at least the
>>>       signedness is kept.
>>> ---
>>>  include/linux/bitops.h |  1 -
>>>  include/linux/bits.h   | 33 +++++++++++++++++++++++++++++----
>>>  2 files changed, 29 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/include/linux/bitops.h b/include/linux/bitops.h
>>> index c1cb53cf2f0f8662ed3e324578f74330e63f935d..9be2d50da09a417966b3d11c84092bb2f4cd0bef 100644
>>> --- a/include/linux/bitops.h
>>> +++ b/include/linux/bitops.h
>>> @@ -8,7 +8,6 @@
>>>  
>>>  #include <uapi/linux/kernel.h>
>>>  
>>> -#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
>>>  #define BITS_TO_LONGS(nr)	__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
>>>  #define BITS_TO_U64(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u64))
>>>  #define BITS_TO_U32(nr)		__KERNEL_DIV_ROUND_UP(nr, BITS_PER_TYPE(u32))
>>> diff --git a/include/linux/bits.h b/include/linux/bits.h
>>> index 5f68980a1b98d771426872c74d7b5c0f79e5e802..f202e46d2f4b7899c16d975120f3fa3ae41556ae 100644
>>> --- a/include/linux/bits.h
>>> +++ b/include/linux/bits.h
>>> @@ -12,6 +12,7 @@
>>>  #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
>>>  #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
>>>  #define BITS_PER_BYTE		8
>>> +#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
>>>  
>>>  /*
>>>   * Create a contiguous bitmask starting at bit position @l and ending at
>>> @@ -25,14 +26,38 @@
>>>  
>>>  #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
>>>  
>>> -#define GENMASK(h, l) \
>>> -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>>> -#define GENMASK_ULL(h, l) \
>>> -	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>>> +/*
>>> + * Generate a mask for the specified type @t. Additional checks are made to
>>> + * guarantee the value returned fits in that type, relying on
>>> + * shift-count-overflow compiler check to detect incompatible arguments.
>>> + * For example, all these create build errors or warnings:
>>> + *
>>> + * - GENMASK(15, 20): wrong argument order
>>> + * - GENMASK(72, 15): doesn't fit unsigned long
>>> + * - GENMASK_U32(33, 15): doesn't fit in a u32
>>> + */
>>> +#define GENMASK_t(t, h, l)				\
>>> +	(GENMASK_INPUT_CHECK(h, l) +			\
>>> +	 (((t)~ULL(0) - ((t)1 << (l)) + 1) &		\
>>> +	  ((t)~ULL(0) >> (BITS_PER_TYPE(t) - 1 - (h)))))
>>> +
>>> +#define GENMASK(h, l) GENMASK_t(unsigned long,  h, l)
>>> +#define GENMASK_ULL(h, l) GENMASK_t(unsigned long long, h, l)
>>>  
>>>  /*
>>>   * Missing asm support
>>>   *
>>> + * __GENMASK_U*() depends on BITS_PER_TYPE() which would not work in the asm
>>> + * code as BITS_PER_TYPE() relies on sizeof(), something not available in
>>> + * asm. Nethertheless, the concept of fixed width integers is a C thing which
>>> + * does not apply to assembly code.
>>> + */
>>> +#define GENMASK_U8(h, l) ((unsigned int)GENMASK_t(u8,  h, l))
>>> +#define GENMASK_U16(h, l) ((unsigned int)GENMASK_t(u16, h, l))
>>> +#define GENMASK_U32(h, l) GENMASK_t(u32, h, l)
>>> +#define GENMASK_U64(h, l) GENMASK_t(u64, h, l)
>>> +
>>> +/*
>>>   * __GENMASK_U128() depends on _BIT128() which would not work
>>>   * in the asm code, as it shifts an 'unsigned __int128' data
>>>   * type instead of direct representation of 128 bit constants
>>>
>>> -- 
>>> 2.45.3
>>>
