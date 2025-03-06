Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB9DA54E8F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D62D10E9FB;
	Thu,  6 Mar 2025 15:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mt8RZlBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-15.smtpout.orange.fr [193.252.22.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BE210E9F2;
 Thu,  6 Mar 2025 15:07:59 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id qCp8tfVrzYqvfqCpCtQNCR; Thu, 06 Mar 2025 16:07:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741273677;
 bh=AtOARcm7etY/CYGaI1Zh2dF1obFKsR0z+sX6jBAouw8=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=mt8RZlBlKrrvCMNSwkYDS+KCzpYJJxQZSrDmvOkGDkNdM4kTJbuY9R7tCqh45ziVk
 uNJMpGecfHrF1CywkDRiAzWtB7jZOpEem/Lckaerkc2fgA0wuys+A1kBXjmAJACHoW
 MK+NCg+/qpx2inKG+ihiI0G1aNlzsv58fjH79YOG7B6YiR3PusbtPHHVUeCxWjB4VE
 Qh3aRjjFaSUwBeHxj4fuB3hEC3Jwx0EgieImUpvshjwotUsZ/fnh0NZwmVRa6sWJMX
 RYby6COMUSG6BZ4sR1ltucLokXCb/KBKcUoh0oumyRFS4i18Q/G8o2S9YjueL6260H
 MIlr+gkolPdVA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 Mar 2025 16:07:57 +0100
X-ME-IP: 124.33.176.97
Message-ID: <84abfaef-0fb9-4fd4-a657-0cc80eb1de0f@wanadoo.fr>
Date: Fri, 7 Mar 2025 00:07:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] bits: split the definition of the asm and non-asm
 GENMASK()
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
 <Z8mdk3z7t42CWfmZ@smile.fi.intel.com>
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
In-Reply-To: <Z8mdk3z7t42CWfmZ@smile.fi.intel.com>
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

On 06/03/2025 at 22:05, Andy Shevchenko wrote:
> On Thu, Mar 06, 2025 at 08:29:52PM +0900, Vincent Mailhol via B4 Relay wrote:
>> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>>
>> In an upcoming change, GENMASK() and its friends will indirectly
>> depend on sizeof() which is not available in asm.
>>
>> Instead of adding further complexity to __GENMASK() to make it work
>> for both asm and non asm, just split the definition of the two
>> variants.
> 
> ...
> 
>> -/*
>> - * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
>> - * disable the input check if that is the case.
>> - */
> 
> I believe this comment is still valid...
> 
>> +#else /* defined(__ASSEMBLY__) */
> 
> 
> ...here.
> 
> Otherwise justify its removal in the commit message.

OK. I will restore the comment in v6, but will move it to the #else
branch, like this:

  #else /* defined(__ASSEMBLY__) */

  /*
   * BUILD_BUG_ON_ZERO is not available in h files included from asm
   * files, so no input checks in assembly.
   */
  #define GENMASK(h, l)		__GENMASK(h, l)
  #define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)

  #endif /* !defined(__ASSEMBLY__) */

>> +#define GENMASK(h, l)		__GENMASK(h, l)
>> +#define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)
>> +
>> +#endif /* !defined(__ASSEMBLY__) */
> 

Yours sincerely,
Vincent Mailhol

