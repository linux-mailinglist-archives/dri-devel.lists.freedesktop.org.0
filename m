Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48859040B
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE77C11A23D;
	Thu, 11 Aug 2022 16:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893FD10F4BA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:30:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z12so21920946wrs.9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 09:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=ITtAJcrSKONLpgdP6wxvcE20Pk/3Hh/rYW7aksLpJc0=;
 b=BDrwJasWMBs6cmx9rHlyJz0Kqh1UmW0yFutp42uJJHfYeRXvevqQEZgR2Epibr9i25
 I+HvJUrPcvW2/x7lXaYBQNgfar2of3LCr98v2JtG4de9pg24t5+cicIU1nOOngXAi1e+
 U8oTsy7ndJrDwQ+5NaV7nGAka4c3BWC1rO6Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=ITtAJcrSKONLpgdP6wxvcE20Pk/3Hh/rYW7aksLpJc0=;
 b=M/5ywvdJkviwR33RUkxjC2IDeB5ioN1PrQn7PEzcc2NXibgrJJWoT42DtPc8IxVb+s
 CtfnviYzsGw3Ljsci4HaVIzj0pBI4kYhNyfEIxUnwY0OGpYGo1YyfGC6G6dEpE2FbImX
 mrxQ5EH1che6UogyX51DE2qZjj92bL6PPTPpyD9H5Ng+n1Q/RsdVdh1raAhP+EklT1dS
 Lr4ZKyDmv9DXBVzIgsi9ZgA1a+EM+OC32nFqnHBYDdlRiVgmMjOTI7ddUlEc86isFYPa
 C3oSP8DJFFL4GJAptz+HSYLgIY8t/X0OMZgOvdihRb8VbRH+erw8nt7MrVVdEzEa0FPC
 B+ag==
X-Gm-Message-State: ACgBeo1vLf55UnuB61l4hFcuQvJD19KJQv2sVmsrXbQ/GFcaoYF59E2H
 YbukVEn5jSqWSUgu9QMvCC05/w==
X-Google-Smtp-Source: AA6agR4KnOYFTCKJ78QmLw/epN/mbQZWXQt4WyNk4qxklKYjBqw79OujrvuOo9UUYKRBmDghh+TnXA==
X-Received: by 2002:a5d:6348:0:b0:220:5edf:c3e8 with SMTP id
 b8-20020a5d6348000000b002205edfc3e8mr20612709wrw.255.1660235401863; 
 Thu, 11 Aug 2022 09:30:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b003a30fbde91dsm8077311wmq.20.2022.08.11.09.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 09:30:01 -0700 (PDT)
Date: Thu, 11 Aug 2022 18:29:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v4 1/7] drm: Move and add a few utility macros into drm
 util header
Message-ID: <YvUuh2Ua7nuRNfr7@phenom.ffwll.local>
References: <20220719140424.430572-1-gwan-gyeong.mun@intel.com>
 <20220719140424.430572-2-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220719140424.430572-2-gwan-gyeong.mun@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, airlied@linux.ie, matthew.auld@intel.com,
 mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 19, 2022 at 05:04:18PM +0300, Gwan-gyeong Mun wrote:
> It moves overflows_type utility macro into drm util header from i915_utils
> header. The overflows_type can be used to catch the truncation between data
> types. And it adds safe_conversion() macro which performs a type conversion
> (cast) of an source value into a new variable, checking that the
> destination is large enough to hold the source value.
> And it adds exact_type and exactly_pgoff_t macro to catch type mis-match
> while compiling.
> 
> v3: Add is_type_unsigned() macro (Mauro)
>     Modify overflows_type() macro to consider signed data types (Mauro)
>     Fix the problem that safe_conversion() macro always returns true
> v4: Fix kernel-doc markups
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  drivers/gpu/drm/i915/i915_utils.h |  5 +-
>  include/drm/drm_util.h            | 77 +++++++++++++++++++++++++++++++

It's nice that there's less random piling into i915_utils.h, but pushing
them into drm_util.h isn't really better. These should all be in
include/linux/ somewhere, so that we have as consistent code as possible.

drm_util.h should only be a fallback if we get nacks for a more general
place and still think it's the right thing to do.

i915_util.h has frankyl gone completely bonkers and should die.
-Daniel

>  2 files changed, 78 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> index c10d68cdc3ca..345e5b2dc1cd 100644
> --- a/drivers/gpu/drm/i915/i915_utils.h
> +++ b/drivers/gpu/drm/i915/i915_utils.h
> @@ -32,6 +32,7 @@
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  #include <linux/sched/clock.h>
> +#include <drm/drm_util.h>
>  
>  #ifdef CONFIG_X86
>  #include <asm/hypervisor.h>
> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>  #define range_overflows_end_t(type, start, size, max) \
>  	range_overflows_end((type)(start), (type)(size), (type)(max))
>  
> -/* Note we don't consider signbits :| */
> -#define overflows_type(x, T) \
> -	(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
> -
>  #define ptr_mask_bits(ptr, n) ({					\
>  	unsigned long __v = (unsigned long)(ptr);			\
>  	(typeof(ptr))(__v & -BIT(n));					\
> diff --git a/include/drm/drm_util.h b/include/drm/drm_util.h
> index 79952d8c4bba..1de9ee5704fa 100644
> --- a/include/drm/drm_util.h
> +++ b/include/drm/drm_util.h
> @@ -62,6 +62,83 @@
>   */
>  #define for_each_if(condition) if (!(condition)) {} else
>  
> +/**
> + * is_type_unsigned - helper for checking data type which is an unsigned data
> + * type or not
> + * @x: The data type to check
> + *
> + * Returns:
> + * True if the data type is an unsigned data type, false otherwise.
> + */
> +#define is_type_unsigned(x) ((typeof(x))-1 >= (typeof(x))0)
> +
> +/**
> + * overflows_type - helper for checking the truncation between data types
> + * @x: Source for overflow type comparison
> + * @T: Destination for overflow type comparison
> + *
> + * It compares the values and size of each data type between the first and
> + * second argument to check whether truncation can occur when assigning the
> + * first argument to the variable of the second argument.
> + * Source and Destination can be used with or without sign bit.
> + * Composite data structures such as union and structure are not considered.
> + * Enum data types are not considered.
> + * Floating point data types are not considered.
> + *
> + * Returns:
> + * True if truncation can occur, false otherwise.
> + */
> +
> +#define overflows_type(x, T) \
> +	(is_type_unsigned(x) ? \
> +		is_type_unsigned(T) ? \
> +			(sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +			: (sizeof(x) >= sizeof(T) && (x) >> (BITS_PER_TYPE(T) - 1)) ? 1 : 0 \
> +	: is_type_unsigned(T) ? \
> +		((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +		: (sizeof(x) > sizeof(T)) ? \
> +			((x) < 0) ? (((x) * -1) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +				: ((x) >> BITS_PER_TYPE(T)) ? 1 : 0 \
> +			: 0)
> +
> +/**
> + * exact_type - break compile if source type and destination value's type are
> + * not the same
> + * @T: Source type
> + * @n: Destination value
> + *
> + * It is a helper macro for a poor man's -Wconversion: only allow variables of
> + * an exact type. It determines whether the source type and destination value's
> + * type are the same while compiling, and it breaks compile if two types are
> + * not the same
> + */
> +#define exact_type(T, n) \
> +	BUILD_BUG_ON(!__builtin_constant_p(n) && !__builtin_types_compatible_p(T, typeof(n)))
> +
> +/**
> + * exactly_pgoff_t - helper to check if the type of a value is pgoff_t
> + * @n: value to compare pgoff_t type
> + *
> + * It breaks compile if the argument value's type is not pgoff_t type.
> + */
> +#define exactly_pgoff_t(n) exact_type(pgoff_t, n)
> +
> +/**
> + * safe_conversion - perform a type conversion (cast) of an source value into
> + * a new variable, checking that the destination is large enough to hold the
> + * source value.
> + * @ptr: Destination pointer address
> + * @value: Source value
> + *
> + * Returns:
> + * If the value would overflow the destination, it returns false.
> + */
> +#define safe_conversion(ptr, value) ({ \
> +	typeof(value) __v = (value); \
> +	typeof(ptr) __ptr = (ptr); \
> +	overflows_type(__v, *__ptr) ? 0 : ((*__ptr = (typeof(*__ptr))__v), 1); \
> +})
> +
>  /**
>   * drm_can_sleep - returns true if currently okay to sleep
>   *
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
