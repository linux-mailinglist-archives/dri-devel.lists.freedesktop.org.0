Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBE7A5025D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 15:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1D689453;
	Wed,  5 Mar 2025 14:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="bjPvyDUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989DA89453;
 Wed,  5 Mar 2025 14:38:36 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id ppt6tfHU4ZnsCpptAt1SYw; Wed, 05 Mar 2025 15:38:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741185511;
 bh=x2nOvp4g9bFkC6yO0erJTirmhqJkuNeb1P2mmnB3KBU=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=bjPvyDUY/se9o2pP5tDIAusnInJWDOy2mekPDHUS2KEuKRirH8+ox56wpA7stYCZm
 q7zvgNyuZoD7HrITpnkgeb2cNkK6D/ZqZIVn51eUzcHzogKXHfC9rBiMLLjlePztYs
 d30DhKqINbc5L4WesBGZ7dTFU85s0rR71bHEsdXSx2w2RLE/n4W1fHytRneWE2f1sk
 Vb72sLOrjdEAN6oyNRbclQhdGWhm8F1zLFBEMh7TBAyzkHwUSUruR9VrqdvevxKeZH
 9NaMNDoOt9uhcD6chvo45UKxehoMCYCITu5lIaZhZfuj7lgokCRjLK8h8HoTyRLugb
 ye339IYmVQ4/w==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 05 Mar 2025 15:38:31 +0100
X-ME-IP: 124.33.176.97
Message-ID: <9f0215c4-62e5-4dfa-8dac-732682600c8c@wanadoo.fr>
Date: Wed, 5 Mar 2025 23:38:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] bits: introduce fixed-type genmasks
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
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-3-1873dcdf6723@wanadoo.fr>
 <Z8hf7pN84-64LWPv@smile.fi.intel.com>
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
In-Reply-To: <Z8hf7pN84-64LWPv@smile.fi.intel.com>
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

On 05/03/2025 at 23:30, Andy Shevchenko wrote:
> On Wed, Mar 05, 2025 at 10:00:15PM +0900, Vincent Mailhol via B4 Relay wrote:
>> From: Yury Norov <yury.norov@gmail.com>
>>
>> Add __GENMASK_t() which generalizes __GENMASK() to support different
> 
> Is it with double underscore? I do not see it.

This is my mistake. In an earlier draft, it was __GENMASK_t(),
meanwhile, I dropped the __ prefix but forget to update the patch
description.

> _t is used for typedef simple types. It's unfortunate to have it
> in such a macro.

Ack.

> Perhaps T or TYPE will suffice. Or perhaps we want
> __GENMASK_Uxx() here?

If no objection, I have a preference for GENMASK_TYPE().

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
> 
> ...
> 
>> + * __GENMASK_U*() depends on BITS_PER_TYPE() which would not work in the asm
> 
> Where are the double underscore variants? I see it only for U128.

Same as above. The description is incorrect. I will fix this in v5.

>> + * code as BITS_PER_TYPE() relies on sizeof(), something not available in
>> + * asm. Nethertheless, the concept of fixed width integers is a C thing which
>> + * does not apply to assembly code.

Yours sincerely,
Vincent Mailhol

