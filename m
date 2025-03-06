Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D9A54688
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 10:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4312710E92B;
	Thu,  6 Mar 2025 09:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VhZSLwRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out.smtpout.orange.fr (out-13.smtpout.orange.fr [193.252.22.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F3510E928;
 Thu,  6 Mar 2025 09:38:45 +0000 (UTC)
Received: from [172.16.82.72] ([124.33.176.97]) by smtp.orange.fr with ESMTPA
 id q7gWtAq3rM2iXq7gatskzm; Thu, 06 Mar 2025 10:38:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1741253923;
 bh=TeFwuXaI558YeAA2DS3IrxfJgqUdjuY9B494gVS/IMQ=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=VhZSLwRRGgOF/Ov5Kl4YckowxvwrWf7jCXvU6Vf9CWG1CVBqVGsTP8uAZ/yVFAK3v
 zghYZIzWXTYyPwfP0DKsEU565p9l0sv0hi+3pZpptau8JAIRlCtDFmvtpPXRAGnpOY
 txvasqxnEOlCaatRtUIp3QTN/7Pn+DRmw/bKlqGwvRmgzdiJhSBM43Xe/ex83MVjBW
 EAoPd4rLRNjM2yczQDekkw6TIrqqoPh97YzFB9cOMiGoWJVgo3RbvxWgTX2EbtAMBe
 HT+svuqHqHlG47Y49UUFZ+Timcl2yCRhdyoI+wlSL8PjF00vwkR7AndnaDdkLGcDJ1
 W9SbT1oRZPdFQ==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 Mar 2025 10:38:43 +0100
X-ME-IP: 124.33.176.97
Message-ID: <f45a2a23-6833-492e-b331-30766f1370f8@wanadoo.fr>
Date: Thu, 6 Mar 2025 18:38:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] bits: introduce fixed-type BIT
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 David Laight <david.laight.linux@gmail.com>,
 Yury Norov <yury.norov@gmail.com>
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
 Jani Nikula <jani.nikula@intel.com>
References: <20250305-fixed-type-genmasks-v4-0-1873dcdf6723@wanadoo.fr>
 <20250305-fixed-type-genmasks-v4-4-1873dcdf6723@wanadoo.fr>
 <Z8hgqOB5Ym-GGykS@smile.fi.intel.com>
 <d7f3150d-0167-44be-90b2-17f8a050687c@wanadoo.fr>
 <Z8hyNXVZxLzhEzNy@smile.fi.intel.com>
 <824dc1d1-14f0-433e-aa3f-679527b87077@wanadoo.fr>
 <Z8isZodEqhZw5p7-@smile.fi.intel.com> <20250305215027.5d9be1fa@pumpkin>
 <Z8lnFpkVTjpFHZtB@smile.fi.intel.com>
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
In-Reply-To: <Z8lnFpkVTjpFHZtB@smile.fi.intel.com>
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

On 06/03/2025 at 18:12, Andy Shevchenko wrote:
> On Wed, Mar 05, 2025 at 09:50:27PM +0000, David Laight wrote:
>> On Wed, 5 Mar 2025 21:56:22 +0200
>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>> On Thu, Mar 06, 2025 at 02:17:18AM +0900, Vincent Mailhol wrote:
>>>> On 06/03/2025 at 00:48, Andy Shevchenko wrote:  
>>>>> On Wed, Mar 05, 2025 at 11:48:10PM +0900, Vincent Mailhol wrote:  
>>>>>> On 05/03/2025 at 23:33, Andy Shevchenko wrote:  
>>>>>>> On Wed, Mar 05, 2025 at 10:00:16PM +0900, Vincent Mailhol via B4 Relay wrote:  
> 
> ...
> 
>>>>>>>> +#define BIT_U8(b) (BIT_INPUT_CHECK(u8, b) + (unsigned int)BIT(b))
>>>>>>>> +#define BIT_U16(b) (BIT_INPUT_CHECK(u16, b) + (unsigned int)BIT(b))  
>>>>>>>
>>>>>>> Why not u8 and u16? This inconsistency needs to be well justified.  
>>>>>>
>>>>>> Because of the C integer promotion rules, if casted to u8 or u16, the
>>>>>> expression will immediately become a signed integer as soon as it is get
>>>>>> used. For example, if casted to u8
>>>>>>
>>>>>>   BIT_U8(0) + BIT_U8(1)
>>>>>>
>>>>>> would be a signed integer. And that may surprise people.  
>>>>>
>>>>> Yes, but wouldn't be better to put it more explicitly like
>>>>>
>>>>> #define BIT_U8(b)	(BIT_INPUT_CHECK(u8, b) + (u8)BIT(b) + 0 + UL(0)) // + ULL(0) ?  
>>>>
>>>> OK, the final result would be unsigned. But, I do not follow how this is
>>>> more explicit.
>>>>
>>>> Also, why doing:
>>>>
>>>>   (u8)BIT(b) + 0 + UL(0)
>>>>
>>>> and not just:
>>>>
>>>>   (u8)BIT(b) + UL(0)
>>>>
>>>> ?
>>>>
>>>> What is that intermediary '+ 0' for?
>>>>
>>>> I am sorry, but I am having a hard time understanding how casting to u8
>>>> and then doing an addition with an unsigned long is more explicit than
>>>> directly doing a cast to the desired type.  
>>>
>>> Reading this again, I think we don't need it at all. u8, aka unsigned char,
>>> will be promoted to int, but it will be int with a value < 256, can't be signed
>>> as far as I understand this correctly.
>>
>> The value can't be negative, but the type will be a signed one.
> 
> Yes, that's what I mentioned above: "int with the value < 256".
> 
>> Anything comparing types (and there are a few) will treat it as signed.
>> It really is bad practise to even pretend you can have an expression
>> (rather that a variable) that has a type smaller than 'int'.
>> It wouldn't surprise me if even an 'a = b' assignment promotes 'b' to int.
> 
> We have tons of code with u8/u16, what you are proposing here is like
> "let's get rid of those types and replace all of them by int/unsigned int".
> We have ISAs that are byte-oriented despite being 32- or 64-bit platforms.
> 
>> So it is even questionable whether BIT8() and BIT16() should even exist at all.
> 
> The point is to check the boundaries and not in the returned value per se.

+1

I will also add that this adds to the readability of the code. In a
driver, if I see:

  #define REG_FOO1_MASK GENMASK(6, 2)
  #define REG_FOO2_MASK GENMASK(12, 7)

it does not tell me much about the register. Whereas if I see:

  #define REG_FOO1_MASK GENMASK_U16(6, 2)
  #define REG_FOO2_MASK GENMASK_U16(12, 7)

then I know that this is for a 16 bit register.

>> There can be reasons to return 'unsigned int' rather than 'unsigned long'.
>> But with the type definitions that Linux uses (and can't really be changed)
>> you can have BIT32() that is 'unsigned int' and BIT64() that is 'unsigned long
>> long'. These are then the same on 32bit and 64bit.

So, at the end, my goal when introducing that unsigned int cast was not
to confuse people. This had the opposite effect. Nearly all the
reviewers pointed at that cast.

I will revert this in the v5. The U8 and U16 variants of both GENMASK
and BIT will return an u8 and u16 respectively. And unless someone
manages to convince Yury otherwise, I will keep it as such.


Yours sincerely,
Vincent Mailhol

