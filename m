Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660FCA57979
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 10:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5576810E14F;
	Sat,  8 Mar 2025 09:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="EKQhso65";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-15.smtpout.orange.fr [193.252.22.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B3A10E146;
 Sat,  8 Mar 2025 09:28:58 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id qqU9t7io2tsZCqqUEtgNFH; Sat, 08 Mar 2025 10:28:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741426136;
 bh=m49a0jOVCmNE3wfZMyztyNQxUtYwR04X0isyiXi3D1U=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=EKQhso65r/NfiTcR03z6k7EbF04rfLahKWHfYTIjfBBF6F2ag6/H7ZzGv6V64O1ik
 qj1E1Dm/QHxwSUs6URxLjEOahiARr+CH29kr7UkVZwmHZAWZdJbyiCL+AL+jjoEJ4E
 DRbT7PSxPqHp1AOWaJoRbz8U9akzpeQWdoSK76+rOOAPYC9NO3cv2THl5ueVXXC5Pu
 s4BbiB0nfM9BkvO95RFTTJvaRIqV0b9244jwmTteG8czT5ePu4C32rc1SDwqOaE9QU
 Ias8s3L+XRwQq27nzu0Hx9qqcV4QRB2lDC6PBnMjeyXGjEzIOLamQARng5+qlxm12S
 2mh8ow1eSWcTA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 08 Mar 2025 10:28:56 +0100
X-ME-IP: 124.33.176.97
Message-ID: <0ddca27b-894b-42f8-b0ac-d862b9463733@wanadoo.fr>
Date: Sat, 8 Mar 2025 18:28:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] bits: introduce fixed-type BIT_U*()
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
References: <20250308-fixed-type-genmasks-v6-0-f59315e73c29@wanadoo.fr>
 <20250308-fixed-type-genmasks-v6-3-f59315e73c29@wanadoo.fr>
 <Z8sxUTR-5j5XmZnO@smile.fi.intel.com> <Z8sxsCR0KxqZWltB@smile.fi.intel.com>
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
In-Reply-To: <Z8sxsCR0KxqZWltB@smile.fi.intel.com>
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

On 08/03/2025 at 02:49, Andy Shevchenko wrote:
> On Fri, Mar 07, 2025 at 07:48:01PM +0200, Andy Shevchenko wrote:
>> On Sat, Mar 08, 2025 at 01:48:50AM +0900, Vincent Mailhol via B4 Relay wrote:
> 
> ...
> 
>>>  /*
>>>   * Missing asm support
>>>   *
>>> - * GENMASK_U*() depends on BITS_PER_TYPE() which relies on sizeof(),
>>> - * something not available in asm. Nethertheless, fixed width integers
>>> - * is a C concept. Assembly code can rely on the long and long long
>>> - * versions instead.
>>> + * GENMASK_U*() and BIT_U*() depend on BITS_PER_TYPE() which relies on
>>> + * sizeof(), something not available in asm. Nethertheless, fixed
>>> + * width integers is a C concept. Assembly code can rely on the long
>>> + * and long long versions instead.
>>>   */
>>
>> I don't like this hunk. You just introduced a message which is rewritten
>> completely in the immediate followup. Can you come up in a better text
>> here and/or there so it will give only + LoCs (or minimizes - to 1:ish)?

OK. I will add an artificial early new line in the previous patch so
that the diff is only one line.

> And also note, that using up to 90 characters in the comments most likely fine
> here. At least I don't see a problem with that.

I re-wrapped the text to the 80 column and it now fits on three lines.
90 column wouldn't reduce the line count, so I am keeping it to 80.


Yours sincerely,
Vincent Mailhol

