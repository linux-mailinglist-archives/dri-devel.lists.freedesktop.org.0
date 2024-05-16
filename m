Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5254A8C7C48
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 20:25:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C551E10ED8C;
	Thu, 16 May 2024 18:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdQeCRvM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B59510ED8C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 18:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715883901; x=1747419901;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=a1MOkWvjsExQeciF/Q/OVh0JOGmcp4r9dFASRIiqTiI=;
 b=BdQeCRvMuau3D5HJBRt4P9Q72neTa8rXa9w6tdxZcItMrEk0FxDRNjyk
 e6jFZkffZ8p7N6ELD9WuoTQLXJuPkT8HZeA6lGdV13aajlg/hwwdD/ftg
 o3/qyZ4x+l20sBANuzZOHHCdipjy4jPf6mhkwgQy91zO8DOu6hfITgW2u
 g6AffVhF9Yg4tIS1UkbCYgaqqMkr+YUQ59mPyp1kpCcpXnA9lUc5jM0HA
 450o4ihbxhLDZeuaiS877lNni+k3hDMhBNVh44xmW8t/Cvm456DQhU5pk
 jHMwLm7JMYF1e83+RFelFiTOuJhAGp8KbPFwMWy0JHCCtlZv3uaw/+ZRT w==;
X-CSE-ConnectionGUID: 1fPd5hxuTDarlaHs1NIOdQ==
X-CSE-MsgGUID: erbdMG8RT8qRpqg5BiXFAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11872527"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="11872527"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:48 -0700
X-CSE-ConnectionGUID: n+2W+wNmRDyvotd/48QE2w==
X-CSE-MsgGUID: 0ABB853JStir592gbjE51g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="36074616"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.208])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:24:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/print: Kill ___drm_dbg()
In-Reply-To: <20240516160015.2260-1-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240516160015.2260-1-michal.wajdeczko@intel.com>
Date: Thu, 16 May 2024 21:24:42 +0300
Message-ID: <87h6exbonp.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 May 2024, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> There is no point in maintaining a separate print function, while
> there is __drm_dev_dbg() function that can work with a NULL device.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_print.c | 19 -------------------
>  include/drm/drm_print.h     |  8 +++-----
>  2 files changed, 3 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index cf2efb44722c..7e16ce7c7c7a 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -323,25 +323,6 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>  }
>  EXPORT_SYMBOL(__drm_dev_dbg);
>  
> -void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...)
> -{
> -	struct va_format vaf;
> -	va_list args;
> -
> -	if (!__drm_debug_enabled(category))
> -		return;
> -
> -	va_start(args, format);
> -	vaf.fmt = format;
> -	vaf.va = &args;
> -
> -	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> -	       __builtin_return_address(0), &vaf);
> -
> -	va_end(args);
> -}
> -EXPORT_SYMBOL(___drm_dbg);
> -
>  void __drm_err(const char *format, ...)
>  {
>  	struct va_format vaf;
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 089950ad8681..6f8cb5fada41 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -527,17 +527,15 @@ void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
>   * Prefer drm_device based logging over device or prink based logging.
>   */
>  
> -__printf(3, 4)
> -void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...);
>  __printf(1, 2)
>  void __drm_err(const char *format, ...);
>  
>  #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> -#define __drm_dbg(cat, fmt, ...)		___drm_dbg(NULL, cat, fmt, ##__VA_ARGS__)
> +#define __drm_dbg(cat, fmt, ...)	__drm_dev_dbg(NULL, NULL, cat, fmt, ##__VA_ARGS__)
>  #else
>  #define __drm_dbg(cat, fmt, ...)					\
> -	_dynamic_func_call_cls(cat, fmt, ___drm_dbg,			\
> -			       cat, fmt, ##__VA_ARGS__)
> +	_dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,			\
> +			       NULL, cat, fmt, ##__VA_ARGS__)
>  #endif
>  
>  /* Macros to make printk easier */

-- 
Jani Nikula, Intel
