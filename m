Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1885B577F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 11:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311E110E353;
	Mon, 12 Sep 2022 09:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF7010E34A
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 09:52:56 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s6so2711852lfo.7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 02:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=UdUG+yKbunmSUHpUrUpQumUr8NJANbFJ+3qfbg/TGLM=;
 b=d0k/iJ92r+aZizogd9IL3p1SpN1PHqbWNhw2Yx1sYhqy4eC0dI7Mv+LN6DX9LvWtHo
 EEauSA5eXscGfq/KooyaFvJEihHmdnss2vV6g2ZemFqQfa/i+47yDpTXaO7nuVQmJFKQ
 BB8AgzyIqGoQd5kKJWfG5k6FP5poUlHxOGad8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=UdUG+yKbunmSUHpUrUpQumUr8NJANbFJ+3qfbg/TGLM=;
 b=betrTeU607F230x92s0Ymu4Yf7L6WBo6oFuMrEHnHFtpD7auwdnee2WMjfKlHIb0LH
 Ik0UUv7eQIgE5eN12dN7ZDqVnBN0U3P0LIH+oicU3k3ChauVgxC044Qjq27TgoH4xEVD
 BgT5kPuJ6+q5PZrqkDaj/qCHcMWpyIVKlLyQSi8FMReBMN0evcjEJXMmYFA/Rw00BoG7
 AZqilibNu0zMTtY6BwpwDJnZh41NHtXVBTjFHtcfKdQUMANgH1rIhGd0u7EdsB28JLn3
 D/POmPuDWULeSJvJ5CqUvbPD4ssqNHHdDkr/zKYpxz/+6YJrQHHFGJTRED++Wqh9gjXY
 49mA==
X-Gm-Message-State: ACgBeo1nlBCR56ZY0ZEDIig2o75SP2DtxtOekescIxKx2S3ZStxLeY08
 YmX5YCLtGBfypnKmsFa06FLJLQ==
X-Google-Smtp-Source: AA6agR7U9h0OvewdJITxdnITOsyqZY9wrYa7udcKyDyu4ypPm6hbH0eHWirAkn2iEaRMIK4QAw6hZQ==
X-Received: by 2002:a05:6512:3c92:b0:499:a1ff:d6f3 with SMTP id
 h18-20020a0565123c9200b00499a1ffd6f3mr3658215lfv.153.1662976375003; 
 Mon, 12 Sep 2022 02:52:55 -0700 (PDT)
Received: from [172.16.11.74] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a05651c02c300b0025fdf1af42asm990353ljo.78.2022.09.12.02.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 02:52:54 -0700 (PDT)
Message-ID: <579b8532-7687-4620-d146-c8ffbbc14097@rasmusvillemoes.dk>
Date: Mon, 12 Sep 2022 11:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v10 3/9] compiler_types.h: Add assert_type to catch type
 mis-match while compiling
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20220909105913.752049-1-gwan-gyeong.mun@intel.com>
 <20220909105913.752049-4-gwan-gyeong.mun@intel.com>
 <Yx3A16ZElKOeJr0o@alfio.lan>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <Yx3A16ZElKOeJr0o@alfio.lan>
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
Cc: thomas.hellstrom@linux.intel.com, mauro.chehab@linux.intel.com,
 andrzej.hajda@intel.com, keescook@chromium.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, dlatypov@google.com, matthew.auld@intel.com,
 airlied@redhat.com, mchehab@kernel.org, vitor@massaru.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/09/2022 13.04, Andi Shyti wrote:
> Hi Gwan-gyeong,
> 
> On Fri, Sep 09, 2022 at 07:59:07PM +0900, Gwan-gyeong Mun wrote:
>> It adds assert_type and assert_typable macros to catch type mis-match while
> 
> /Add/It adds/, please use the imperative form.
> 
>> compiling. The existing typecheck() macro outputs build warnings, but the
>> newly added assert_type() macro uses the _Static_assert() keyword (which is
>> introduced in C11) to generate a build break when the types are different
>> and can be used to detect explicit build errors.
>> Unlike the assert_type() macro, assert_typable() macro allows a constant
>> value as the second argument.
>>
>> Suggested-by: Kees Cook <keescook@chromium.org>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> ---
>>  include/linux/compiler_types.h | 39 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>>
>> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
>> index 4f2a819fd60a..19cc125918bb 100644
>> --- a/include/linux/compiler_types.h
>> +++ b/include/linux/compiler_types.h
>> @@ -294,6 +294,45 @@ struct ftrace_likely_data {
>>  /* Are two types/vars the same type (ignoring qualifiers)? */
>>  #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>>  
>> +/**
>> + * assert_type - break compile if the first argument's data type and the second
>> + *               argument's data type are not the same
> 
> I would use /aborts compilation/break compile/
> 
>> + *
> 
> nowhere is written that this extra blank line is not needed, but
> just checking the style in compiler_types.h it is not used.
> 
> I personally like the blank line, but standing to the general
> taste, it should be removed also for keeping a coherent style.
> 
>> + * @t1: data type or variable
>> + * @t2: data type or variable
>> + *
>> + * The first and second arguments can be data types or variables or mixed (the
>> + * first argument is the data type and the second argument is variable or vice
>> + * versa). It determines whether the first argument's data type and the second
>> + * argument's data type are the same while compiling, and it breaks compile if
>> + * the two types are not the same.
>> + * See also assert_typable().
>> + */
>> +#define assert_type(t1, t2) _Static_assert(__same_type(t1, t2))
> 
> In C11 _Static_assert is defined as:
> 
>   _Static_assert ( constant-expression , string-literal ) ;
> 
> While
> 
>   _Static_assert ( constant-expression ) ;
> 
> is defined in C17 along with the previous. I think you should add
> the error message as a 'string-literal'.

See how static_assert() is defined in linux/build_bug.h, and let's avoid
using _Static_assert directly. So this should IMO just be

#define assert_same_type(t1, t2) static_assert(__same_type(t1, t2))

(including the naming of the macro; I don't think "assert_type" is a
good name). No need to add an explicit string literal, the name of the
macro and the constant expression itself are plenty to explain what is
being asserted (with the latter being the reason the string was made
optional).

Rasmus
