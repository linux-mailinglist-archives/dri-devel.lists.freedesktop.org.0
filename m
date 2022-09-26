Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAE05E9772
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 02:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F1F10E4A0;
	Mon, 26 Sep 2022 00:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1097110E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 00:37:13 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so5219242pjh.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 17:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=JUqSNEPLCMNTTpKfM7Crxzu6WwUvly/09+gzrj81knI=;
 b=oIwNpZQ5Y1z1143vFXyrfwGUJZ75JghkszOcBwSh0YmtZPbQHOcWWnAfns5g+sbQ/D
 wiZ6Ijn8aWt3loyhafcrd2u+HcNQ1wlNI/8R7IsXEDiIp43xc5Tl50hy97o7WZC7QwAe
 AYwaR/MB0DrbVUA991Ly8rZD21O7YmLTAEl4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=JUqSNEPLCMNTTpKfM7Crxzu6WwUvly/09+gzrj81knI=;
 b=YxjDda3axxvIIDf5gkjI0WYWp+iXJVisBBR34thVhneVfRcft88PE20NuwalFuWjsO
 AV43Aemj51hrH+BTpK0yy/44BnrZqIJR10V1rIxjNLNAfSIFwqxi+vtU5cegvMOTLZG3
 Et4IDh2q0M5EmS4nRU5KkmUTbMq/p1vx4XKXVsVovAJy834icUw0dMIA5or5hcGU/P3j
 51jgLr52toPm3v3iNI2UnJpwstVfbXmPraOng+2+iWm2C63/uS50I5LhbxYQ5SGK6QGp
 RCyT4xRe8wm6myFRpQ0PScWitFxKnmk8/XzLyc0Rt7/jhoG+xaWX60Aunl7nLKfobtq9
 0NVQ==
X-Gm-Message-State: ACrzQf3bNZO6i9Bv6vdt3wo/tDOX9HcYrzsgy0fmplhNveRLY1ZdjOLA
 aQygy+2miTPR3Qhua35RA0ZXYQ==
X-Google-Smtp-Source: AMsMyM6cpOhuwKFpZGu/GN3489Z0nCbt+/1a9GngZAzI09XYZxSG0DMGO11e73UWrmykWT+QugME+g==
X-Received: by 2002:a17:903:120d:b0:179:d027:66f0 with SMTP id
 l13-20020a170903120d00b00179d02766f0mr7587416plh.61.1664152632485; 
 Sun, 25 Sep 2022 17:37:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 69-20020a621748000000b0053725e331a1sm10589061pfx.82.2022.09.25.17.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 17:37:11 -0700 (PDT)
Date: Sun, 25 Sep 2022 17:37:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v11 3/9] compiler_types.h: Add assert_same_type to catch
 type mis-match while compiling
Message-ID: <202209251032.71251A8@keescook>
References: <20220923082628.3061408-1-gwan-gyeong.mun@intel.com>
 <20220923082628.3061408-4-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923082628.3061408-4-gwan-gyeong.mun@intel.com>
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
 andi.shyti@linux.intel.com, jani.nikula@intel.com, ndesaulniers@google.com,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, andrzej.hajda@intel.com, dlatypov@google.com,
 matthew.auld@intel.com, airlied@redhat.com, mchehab@kernel.org,
 vitor@massaru.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 23, 2022 at 11:26:22AM +0300, Gwan-gyeong Mun wrote:
> Adds assert_same_type and assert_same_typable macros to catch type
> mis-match while compiling. The existing typecheck() macro outputs build
> warnings, but the newly added assert_same_type() macro uses the
> static_assert macro (which uses _Static_assert keyword and it introduced
> in C11) to generate a build break when the types are different and can be
> used to detect explicit build errors. Unlike the assert_same_type() macro,
> assert_same_typable() macro allows a constant value as the second argument.
> Since static_assert is used at compile time and it requires
> constant-expression as an argument [1][2], overflows_type_ret_const_expr()
> is newly added. There is overflows_type() that has the same behavior, but
> the macro uses __builtin_add_overflow() internally, and
> __builtin_add_overflows returns a bool type [3], so it is difficult to use
> as an argument of _Static_assert. The assert_same_type and
> assert_same_typable macros have been added to compiler_types.h, but the
> overflows_type_ret_const_expr macro has been added to overflow.h
> So, overflow.h has to be included to use assert_same_typable which
> internally uses overflows_type_ret_const_expr.
> And it adds unit tests for overflows_type, overflows_type_ret_const_expr,
> assert_same_type and assert_same_typable. The overflows_type has been added
> as well to compare whether the overflows_type_ret_const_expr unit test has
> the same as the result.

I spent some time rewriting the code in this patch. I think it's really
close, but I wanted to tweak how things were being defined, naming, etc.

Notes below, and I'll send my proposed patch separately...

> [...]
> +#define overflows_type_ret_const_expr(x,T) (			\

For the "overflows_type" defines, I think this reads a bit better:

#define __overflows_type_constexpr(x, T) (                      \
        is_unsigned_type(typeof(x)) ?                           \
                (x) > type_max(typeof(T)) ? 1 : 0               \
        : is_unsigned_type(typeof(T)) ?                         \
                (x) < 0 || (x) > type_max(typeof(T)) ? 1 : 0    \
                : (x) < type_min(typeof(T)) ||                  \
                  (x) > type_max(typeof(T)) ? 1 : 0 )

#define __overflows_type(x, T)          ({      \
        typeof(T) v = 0;                        \
        check_add_overflow((x), v, &v);         \
})

#define overflows_type(n, T)                                    \
        __builtin_choose_expr(__is_constexpr(n),                \
                              __overflows_type_constexpr(n, T), \
                              __overflows_type(n, T))

> [...]
> +/**
> + * assert_same_type - abort compilation if the first argument's data type and
> + *                    the second argument's data type are not the same
> + * @t1: data type or variable
> + * @t2: data type or variable
> + *
> + * The first and second arguments can be data types or variables or mixed (the
> + * first argument is the data type and the second argument is variable or vice
> + * versa). It determines whether the first argument's data type and the second
> + * argument's data type are the same while compiling, and it aborts compilation
> + * if the two types are not the same.
> + * See also assert_same_typable().
> + */
> +#define assert_same_type(t1, t2) static_assert(__same_type(t1, t2))

I still think I'd rather avoid a define for this. It doesn't seem worth
4 characters of savings to just have to type it out:

	static_assert(__same_type(a, b))

> [...]
> +#define assert_same_typable(t, n) static_assert(			       \
> +		__builtin_choose_expr(__builtin_constant_p(n),		       \
> +				      overflows_type_ret_const_expr(n,t) == 0, \
> +				      __same_type(t, n)))

This one I'd like to convert into something closer in naming convention to
"__same_type". Also note that "__builtin_constant_p()" doesn't actually
work here: it needs to be __is_constexpr(). So, I propose:

#define __castable_to_type(n, T)				\
		__builtin_choose_expr(__is_constexpr(n),	\
			__overflows_type_constexpr(n, T),	\
			__same_type(n, T))

Then we can do:

	static_assert(__castable_to_type(INT_MAX, size_t));

> [...[
> +static void overflows_type_test(struct kunit *test)
> +{
> +/* Args are: first type, secound type, value, overflow expected */
> +#define TEST_OVERFLOWS_TYPE(t1, t2, v, of) do {				\
> +	t1 __t1 = v;							\
> +	t2 __t2;							\
> +	bool __of;							\
> +	__of = overflows_type(v, t2);					\
> +	if (__of != of) {						\
> +		KUNIT_EXPECT_EQ_MSG(test, __of, of,			\
> +			"expected overflows_type(%s, %s) to%s overflow\n", \
> +			#v, #t2, of ? "" : " not");			\
> +	}								\
> [...]
> +	__of = overflows_type_ret_const_expr(__t1, __t2) ? true : false;\
> +	if (__of != of) {						\
> +		KUNIT_EXPECT_EQ_MSG(test, __of, of,			\
> +			"expected overflows_type_ret_const_expr(%s, %s) to%s overflow\n", \
> +			#t1" __t1 = "#v, #t2" __t2", of ? "" : " not");	\
> +	}								\

These tests are excellent! I've adapted them a little bit to avoid some
of their internal redundancy. (i.e. the above blocks are basically
almost entire the same, etc).

-Kees

-- 
Kees Cook
