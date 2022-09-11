Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 466A35B4DA8
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 13:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C4010E218;
	Sun, 11 Sep 2022 11:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE2110E218;
 Sun, 11 Sep 2022 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662894303; x=1694430303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xa/tnWTDfFYpsFHInbux92mNF6sFhOjW3NH7JPOApq0=;
 b=ci8yRZiuBjjb7dgYVk5VbzV5CHW/FuWiDG3l6qht8XR0uZd3DWVFcfws
 nKgJWitbWyvPu31wi5D0A8UgFhmysQcjhHAUpC7Lkfv5EQ0n2FaXe06Tu
 CnshLnhSZN6w2ZW6vxtDs/8WdYUrz9QIehh0/NSm9/Mag1BkiV7774RBN
 OrTMn3cu98VGXIbPTaZN097pE64ZOVfaEYt8O0oNpn+3S8yi0K3pC9Lvx
 ArIgBsEe5xv8oB7+5RYE4xe79nei2Zz3alPAKWFNATbIez5IiV+K4jjA6
 QVr8kgSOXU3zIT0ZhmMM3BYCcjbO29Bu++4zuKhbTIRVZWSW0Qv0luVUh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="295297999"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="295297999"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 04:05:02 -0700
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="677746849"
Received: from dasegal-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.46.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 04:04:57 -0700
Date: Sun, 11 Sep 2022 13:04:55 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v10 3/9] compiler_types.h: Add assert_type to catch type
 mis-match while compiling
Message-ID: <Yx3A16ZElKOeJr0o@alfio.lan>
References: <20220909105913.752049-1-gwan-gyeong.mun@intel.com>
 <20220909105913.752049-4-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220909105913.752049-4-gwan-gyeong.mun@intel.com>
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
 andi.shyti@linux.intel.com, keescook@chromium.org, jani.nikula@intel.com,
 ndesaulniers@google.com, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 andrzej.hajda@intel.com, dlatypov@google.com, matthew.auld@intel.com,
 airlied@redhat.com, mchehab@kernel.org, vitor@massaru.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gwan-gyeong,

On Fri, Sep 09, 2022 at 07:59:07PM +0900, Gwan-gyeong Mun wrote:
> It adds assert_type and assert_typable macros to catch type mis-match while

/Add/It adds/, please use the imperative form.

> compiling. The existing typecheck() macro outputs build warnings, but the
> newly added assert_type() macro uses the _Static_assert() keyword (which is
> introduced in C11) to generate a build break when the types are different
> and can be used to detect explicit build errors.
> Unlike the assert_type() macro, assert_typable() macro allows a constant
> value as the second argument.
> 
> Suggested-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/compiler_types.h | 39 ++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index 4f2a819fd60a..19cc125918bb 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -294,6 +294,45 @@ struct ftrace_likely_data {
>  /* Are two types/vars the same type (ignoring qualifiers)? */
>  #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>  
> +/**
> + * assert_type - break compile if the first argument's data type and the second
> + *               argument's data type are not the same

I would use /aborts compilation/break compile/

> + *

nowhere is written that this extra blank line is not needed, but
just checking the style in compiler_types.h it is not used.

I personally like the blank line, but standing to the general
taste, it should be removed also for keeping a coherent style.

> + * @t1: data type or variable
> + * @t2: data type or variable
> + *
> + * The first and second arguments can be data types or variables or mixed (the
> + * first argument is the data type and the second argument is variable or vice
> + * versa). It determines whether the first argument's data type and the second
> + * argument's data type are the same while compiling, and it breaks compile if
> + * the two types are not the same.
> + * See also assert_typable().
> + */
> +#define assert_type(t1, t2) _Static_assert(__same_type(t1, t2))

In C11 _Static_assert is defined as:

  _Static_assert ( constant-expression , string-literal ) ;

While

  _Static_assert ( constant-expression ) ;

is defined in C17 along with the previous. I think you should add
the error message as a 'string-literal'.

Andi

> +/**
> + * assert_typable - break compile if the first argument's data type and the
> + *                  second argument's data type are not the same
> + *
> + * @t: data type or variable
> + * @n: data type or variable or constant value
> + *
> + * The first and second arguments can be data types or variables or mixed (the
> + * first argument is the data type and the second argument is variable or vice
> + * versa). Unlike the assert_type() macro, this macro allows a constant value
> + * as the second argument. And if the second argument is a constant value, it
> + * always passes. And it doesn't mean that the types are explicitly the same.
> + * When a constant value is used as the second argument, if you need an
> + * overflow check when assigning a constant value to a variable of the type of
> + * the first argument, you can use the overflows_type() macro. When a constant
> + * value is not used as a second argument, it determines whether the first
> + * argument's data type and the second argument's data type are the same while
> + * compiling, and it breaks compile if the two types are not the same.
> + * See also assert_type() and overflows_type().
> + */
> +#define assert_typable(t, n) _Static_assert(__builtin_constant_p(n) ||	\
> +					    __same_type(t, typeof(n)))
> +
>  /*
>   * __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
>   *			       non-scalar types unchanged.
> -- 
> 2.37.1
