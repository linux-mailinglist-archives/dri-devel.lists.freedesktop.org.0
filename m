Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E91A5462D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D58110E920;
	Thu,  6 Mar 2025 09:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="d8X9p5/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-15.smtpout.orange.fr [193.252.22.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5766A10E920;
 Thu,  6 Mar 2025 09:22:53 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id q7R4tKmaLiRGyq7R8t84Vt; Thu, 06 Mar 2025 10:22:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741252966;
 bh=q2o/LWxWZ/FiWcwTOy3Kk+fZSYKZjgmVPty3JZX4kG4=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=d8X9p5/lK/eLI2uTC2go9WHejeyDbcJjIh9pZd3ERhYgmAyCwKXsSz1KJ8m6vJJ4Y
 NC935iRLnvmJoaxXEMMRaeosvywCQ4vzMqWcCYX3OYmN/+VI50rO1Snbo+1iu9SyIE
 q1q+n2otbZF4YVs+jb+9Ee9Y1ft+fOeSIWxgvFFuSqcL3ahSk3iFQy6bwGNsKNU0sC
 Vn8gYxrUxjxXoFgh0rRfF0lpYa8E9dRWa6S0BI+W9scA+sueA9yOYwvM/D/PG6wRI2
 bWiS23SyxIpzd7OOwU+P//gxdSfxNN55BuZIUTGd9Da8Ykn0DkhYlKCYRgAioFTC0g
 1P2n8SParFWEQ==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 Mar 2025 10:22:46 +0100
X-ME-IP: 124.33.176.97
Message-ID: <7063c8b4-5869-457d-91b1-3185d9e1181e@wanadoo.fr>
Date: Thu, 6 Mar 2025 18:22:33 +0900
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
 <Z8hx9AaUX_GvYq_A@thinkpad> <8301ecbc-d035-4257-9b04-c6ef9be4ce32@wanadoo.fr>
 <Z8ipvnURG_iejzSX@smile.fi.intel.com>
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
In-Reply-To: <Z8ipvnURG_iejzSX@smile.fi.intel.com>
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

On 06/03/2025 at 04:45, Andy Shevchenko wrote:
>>> But GENMASK_U128() becomes a special case now.
>>> The 128-bit GENMASK is unsued, but it's exported in uapi. Is there any
>>> simple way to end up with a common implementation for all fixed-type
>>> GENMASKs?
>>
>> What bothers me is that the 128 bit types are not something available on
>> all architectures, c.f. the CONFIG_ARCH_SUPPORTS_INT128. So, I would
>> need a U128() equivalent to the ULL() but which does not break on
>> architectures which do not support 128 bits integers.
>>
>> This is where I am stuck. If someone can guide me on how to write a
>> robust U128() macro, then I think the common implementation could be
>> feasible.
> 
> I think we may leave that U128 stuff alone for now.

I found the solution! The trick is to use type_max() from overflow.h.

With this, GENMASK_TYPE() becomes:

  #define GENMASK_TYPE(t, h, l)					\
  	((t)(GENMASK_INPUT_CHECK(h, l) +			\
  	     (type_max(t) << (l) &				\
  	      type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))

and works with all the GENMASK variants, including the U128 one! The
unit tests under lib/test_bits.c are all green.

Of course, this does *not* work in assembly. But as explained before,
GENMASK_TYPE() is guarded by a #if !defined(__ASSEMBLY__), so all good!

The question raised by Yury on whether or not we should keep
__GENMASK_U128() in the uapi still remains. And in full honesty, I will
not touch that one. This is not in the scope of this series.


Yours sincerely,
Vincent Mailhol

