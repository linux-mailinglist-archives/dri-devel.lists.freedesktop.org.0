Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96CA6DCB4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 15:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C1A10E368;
	Mon, 24 Mar 2025 14:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="gPyLl6ON";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-73.smtpout.orange.fr [193.252.22.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061A410E368;
 Mon, 24 Mar 2025 14:16:45 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id wibPtJX7SDCLUwibTt1T2D; Mon, 24 Mar 2025 15:16:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1742825801;
 bh=egUK+dbpZVYgJPQn6MKkKaGWaNgUdGqJbx9HzRoLv+o=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=gPyLl6ONTXBqceVZuW49IO48jRjxyFD2mBVHAnirQWmi3JAy4pROWYU7mbO+h52ga
 5aMy0ACiFVkVvrRJY7JhnW5I5KHEGBD/XGXHZiTZrmAP4AZPeG4+9eaUtyqPLkpdJb
 avmMZuOqQ3aPGsaVl7JQOXEQ33ipEKLhu8D8zgY63R/eSuOIi/jQdp9Ng6Eo36xuf5
 Hv6pjfVhUO6Mh9tjkXA8hrrRk8cUku/9xZQRhVh1hj6U5vZc6z6FWB1VeNnfBR1Pck
 PyK6pDWYMQvnBKNxTCbW2jZAZFlYBqoniolyDlt6U8CCDLJFetZ8F5zxI6hyeGclbe
 Oxu+T89q3Jnww==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Mon, 24 Mar 2025 15:16:41 +0100
X-ME-IP: 124.33.176.97
Message-ID: <b7718c92-3934-4ce7-b9a1-0d8ac03dadc3@wanadoo.fr>
Date: Mon, 24 Mar 2025 23:16:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] bits: introduce fixed-type BIT_U*()
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
 <20250322-fixed-type-genmasks-v7-2-da380ff1c5b9@wanadoo.fr>
 <Z-FhHRWtaYgTbILa@smile.fi.intel.com>
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
In-Reply-To: <Z-FhHRWtaYgTbILa@smile.fi.intel.com>
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

On 24/03/2025 at 22:41, Andy Shevchenko wrote:
> On Sat, Mar 22, 2025 at 06:23:13PM +0900, Vincent Mailhol via B4 Relay wrote:
>> From: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> Implement fixed-type BIT_U*() to help drivers add stricter checks,
>> like it was done for GENMASK_U*().
> 
> ...
> 
>> +/*
>> + * Fixed-type variants of BIT(), with additional checks like GENMASK_TYPE(). The
>> + * following examples generate compiler warnings due to shift-count-overflow:
> 
> "...due to -Wshift-count-overflow:" ?
> 
> Same idea — if you need a new version, since it's just a nit-pick.

If you want. I staged this change locally, so if there is a v8, it will
be addressed. I applied the same to the previous patch which also
mentioned shift-count-overflow without the -W prefix.

But honestly, I am not convinced of the added value. This is from Lucas
original patch one year ago, and no one was bothered by this. IMHO, when
writing:

  (...) generate compiler warnings due to shift-count-overflow:

I do not see where the ambiguity is. The sentence clearly say that this
is a compiler warning, so with or without the -W prefix, the sentence is
equally understandable.


Yours sincerely,
Vincent Mailhol

