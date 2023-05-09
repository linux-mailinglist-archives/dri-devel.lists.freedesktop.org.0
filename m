Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4946FC111
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 09:57:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D180E10E34A;
	Tue,  9 May 2023 07:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D62810E345;
 Tue,  9 May 2023 07:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683619052; x=1715155052;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=HyMZvjVK4PWg2zKaACEjXyLpCS8bkLdXvTElw8PwpKo=;
 b=SbO04ES9jEwm6XlcRAc9N7dohbds2voBYDEUhS7hwW572dVO2JnGkeDN
 vQYlTap/ifmS/t7NhJq773qSqf+ImVEnZVj0ei+2efhXOlqGL01S7FU7b
 z/Y3Y/sS33n8oDerj/ICCChcPxmgxO3iqcDHvISH1aul2H4maCzajhFCj
 +XYPiNS3aGRiakjTqzKaqt9sIlwBndeElJSSTxx8KLcysGCV1kdvAxe8L
 MhwbzD+MQ5Gx+65mE7hyM6305N4MSm1XeN3B+xrUkPDvHfqbWErf+B578
 GFH7PntYjxsOyqmH5T4A/a0jRTCRKfEkQ7LBGr4WfKdHzTnyFsvwv/kDS w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="413102012"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="413102012"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 00:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="945165860"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; d="scan'208";a="945165860"
Received: from unknown (HELO localhost) ([10.252.39.92])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 00:57:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/i915: Temporary conversion to new GENMASK/BIT
 macros
In-Reply-To: <20230509051403.2748545-4-lucas.demarchi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230509051403.2748545-1-lucas.demarchi@intel.com>
 <20230509051403.2748545-4-lucas.demarchi@intel.com>
Date: Tue, 09 May 2023 10:57:19 +0300
Message-ID: <87cz3andi8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 May 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> Convert the REG_* macros from i915_reg_defs.h to use the new macros
> defined in linux/bits.h. This is just to help on the implementation
> of the new macros and not intended to be applied.

This drops a number of build time input checks as well as casts to the
specified types.

BR,
Jani.

>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg_defs.h | 28 +++++-----------------------
>  1 file changed, 5 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> index 622d603080f9..61fbb8d62b25 100644
> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> @@ -17,10 +17,7 @@
>   *
>   * @return: Value with bit @__n set.
>   */
> -#define REG_BIT(__n)							\
> -	((u32)(BIT(__n) +						\
> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&		\
> -				 ((__n) < 0 || (__n) > 31))))
> +#define REG_BIT(__n) BIT_U32(__n)
>  
>  /**
>   * REG_BIT8() - Prepare a u8 bit value
> @@ -30,10 +27,7 @@
>   *
>   * @return: Value with bit @__n set.
>   */
> -#define REG_BIT8(__n)                                                   \
> -	((u8)(BIT(__n) +                                                \
> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
> -				 ((__n) < 0 || (__n) > 7))))
> +#define REG_BIT8(__n) BIT_U8(__n)
>  
>  /**
>   * REG_GENMASK() - Prepare a continuous u32 bitmask
> @@ -44,11 +38,7 @@
>   *
>   * @return: Continuous bitmask from @__high to @__low, inclusive.
>   */
> -#define REG_GENMASK(__high, __low)					\
> -	((u32)(GENMASK(__high, __low) +					\
> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&	\
> -				 __is_constexpr(__low) &&		\
> -				 ((__low) < 0 || (__high) > 31 || (__low) > (__high)))))
> +#define REG_GENMASK(__high, __low) GENMASK_U32(__high, __low)
>  
>  /**
>   * REG_GENMASK64() - Prepare a continuous u64 bitmask
> @@ -59,11 +49,7 @@
>   *
>   * @return: Continuous bitmask from @__high to @__low, inclusive.
>   */
> -#define REG_GENMASK64(__high, __low)					\
> -	((u64)(GENMASK_ULL(__high, __low) +				\
> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&		\
> -				 __is_constexpr(__low) &&		\
> -				 ((__low) < 0 || (__high) > 63 || (__low) > (__high)))))
> +#define REG_GENMASK64(__high, __low) GENMASK_ULL(__high, __low)
>  
>  /**
>   * REG_GENMASK8() - Prepare a continuous u8 bitmask
> @@ -74,11 +60,7 @@
>   *
>   * @return: Continuous bitmask from @__high to @__low, inclusive.
>   */
> -#define REG_GENMASK8(__high, __low)                                     \
> -	((u8)(GENMASK(__high, __low) +                                  \
> -	       BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
> -				 __is_constexpr(__low) &&               \
> -				 ((__low) < 0 || (__high) > 7 || (__low) > (__high)))))
> +#define REG_GENMASK8(__high, __low) GENMASK_U8(__high, __low)
>  
>  /*
>   * Local integer constant expression version of is_power_of_2().

-- 
Jani Nikula, Intel Open Source Graphics Center
