Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9D5A17E0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 19:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDDC10E26B;
	Thu, 25 Aug 2022 17:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F7B710E260
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 17:19:26 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id c2so19093529plo.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 10:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=mFe2KwaxwJR3NcWllcHwQ32yWI6VSKE/eyvGDoK+eaY=;
 b=STPuE0YM+J1mhoq+p8C0SKDm/3ws58TPBadqVU243954KOTgrrGPYBk4/2K9U0vix9
 w1CvpFgFzYGjOuSJLB1d/q3b+bC5a1lNHbcEzmWtGSHwvDbEIqzm+diiMXBMx8EM+Brn
 A61cQIAbd9avPqDfp0HQUMUGURidRWCskVpCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=mFe2KwaxwJR3NcWllcHwQ32yWI6VSKE/eyvGDoK+eaY=;
 b=2d4RVN2xfCocfnl5erVaBaSa/P3EMX862OrEGO3HAHEx7IywljcZLM9JabWjgyU+bA
 oFo94T2DLUQnN0SfNj5JxolgQUcCM/fFxhSZCkN1qJS/noolqt24i5k+VksPs3SyU8sZ
 qFj3TKmhLa9X5Z9Z0Lvk5B8Uu+yicubVoFcVP74GdXGX/XJNRGJPltPPDbV71JK0Voow
 zalTmpSoEX2PSlMOFhQ0/Qxdz15Edd3QFN2dDxq/Qnyg9FwuaaVJI7fisWVOWNHBzvem
 Ru+c77IkYKVVOadm+p1qR6zCpQP+wWcs+mKDxGfRc//OY9oPue6MAy73CzifDbvAfdkc
 UitA==
X-Gm-Message-State: ACgBeo04VORR7+jWgJaVAxGR5dh07CZbDwSQxCX48TBbjgVjGIDRfKin
 5UVvRmYG+z8nkcRicEyoFibE7w==
X-Google-Smtp-Source: AA6agR6urHSapvKyqWO06hiE3FKMf29ktVS2o8CjEoA/nx0mmigoPwwQu+37kTHAhBnuGG3scX3Ukg==
X-Received: by 2002:a17:903:22c9:b0:173:11ec:61ff with SMTP id
 y9-20020a17090322c900b0017311ec61ffmr20058plg.23.1661447965612; 
 Thu, 25 Aug 2022 10:19:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a65628e000000b0042b66abf05asm728863pgv.8.2022.08.25.10.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 10:19:24 -0700 (PDT)
Date: Thu, 25 Aug 2022 10:19:23 -0700
From: Kees Cook <keescook@chromium.org>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v9 2/8] util_macros: Add exact_type macro to catch type
 mis-match while compiling
Message-ID: <202208250953.A71FEE45E@keescook>
References: <20220824084514.2261614-1-gwan-gyeong.mun@intel.com>
 <20220824084514.2261614-3-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220824084514.2261614-3-gwan-gyeong.mun@intel.com>
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
 andi.shyti@linux.intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 andrzej.hajda@intel.com, matthew.auld@intel.com,
 intel-gfx-trybot@lists.freedesktop.org, mchehab@kernel.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 05:45:08PM +0900, Gwan-gyeong Mun wrote:
> It adds exact_type and exactly_pgoff_t macro to catch type mis-match while
> compiling. The existing typecheck() macro outputs build warnings, but the
> newly added exact_type() macro uses the BUILD_BUG_ON() macro to generate
> a build break when the types are different and can be used to detect
> explicit build errors.
> 
> v6: Move macro addition location so that it can be used by other than drm
>     subsystem (Jani, Mauro, Andi)
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  include/linux/util_macros.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/include/linux/util_macros.h b/include/linux/util_macros.h
> index 72299f261b25..b6624b275257 100644
> --- a/include/linux/util_macros.h
> +++ b/include/linux/util_macros.h
> @@ -2,6 +2,9 @@
>  #ifndef _LINUX_HELPER_MACROS_H_
>  #define _LINUX_HELPER_MACROS_H_
>  
> +#include <linux/types.h>
> +#include <linux/bug.h>
> +
>  #define __find_closest(x, a, as, op)					\
>  ({									\
>  	typeof(as) __fc_i, __fc_as = (as) - 1;				\
> @@ -38,4 +41,26 @@
>   */
>  #define find_closest_descending(x, a, as) __find_closest(x, a, as, >=)
>  
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

Maybe use __same_type() here instead of open-coded
__builtin_types_compatible_p()? Also, IIUC, currently coding style
advise is to use _Static_assert when possible over BUILD_BUG_ON for
error message readability.

This macro has a trap-door for literals, yes?
i.e.  exact_type(pgoff_t, 5) will pass?

I also note that this is very close to the really common (and open-coded)
test scattered around the kernel already (BUILD_BUG_ON(__same_type(a,
b))), so I think it's good to get a macro defined for it, though I'm not
sure about the trap door test. Regardless, I'd like to bikeshed the name
a bit; I think this should be named something a bit more clear about
what happens on failure. Perhaps: assert_type()? Or to capture the
trapdoor idea, assert_typable()?

#define assert_type(t1, t2)	_Static_assert(__same_type(t1, t2))
#define assert_typable(t, n)	_Static_assert(__builtin_constant_p(n) ||
					       __same_type(t, typeof(n))

> +
> +/**
> + * exactly_pgoff_t - helper to check if the type of a value is pgoff_t
> + * @n: value to compare pgoff_t type
> + *
> + * It breaks compile if the argument value's type is not pgoff_t type.
> + */
> +#define exactly_pgoff_t(n) exact_type(pgoff_t, n)

Why specialize this? Just use assert_typable(pgoff_t, n) in the other
patches? It's almost the same amount to write. :)

-- 
Kees Cook
