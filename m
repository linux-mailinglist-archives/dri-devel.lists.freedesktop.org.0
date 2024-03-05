Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C5A871951
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 10:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDDB10E185;
	Tue,  5 Mar 2024 09:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Grzigh3L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE8710E185
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 09:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709630136; x=1741166136;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hMKs0ciZCs4Sa96j2l4fRH7HRRb+NS8yKx3L+577Xis=;
 b=Grzigh3LAbUw/WOG48aPiMXGuqWR1nt/imC9OXleqIioLFoSwcfr5omc
 TSLj9r0+NxwqQueSOQQQiX7j2NOuSyy3u+9Wi5zKg/M7SfScFSMEEEnX8
 Yyn1qTenPBN3zsWJKlJTogwwtm9ul6+/5TRjBjoajxNL04UCE1lwRn8Lr
 4X2S5lxzkkBBHq9tSlzxNOtlLdQrc/KxlYJ6bawB6iTzOmXQ6UXLtWLmq
 duxZoHskO5Rl5FvdqXX9wWqAlT/hajNx3/nbrbT4co9USknk+AFyytZ0f
 f0muBTulAkbfVEZD/xncF1D/74gb0qdhvZuttK18yLfj5O+/+zvVjzEE5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14885912"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14885912"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 01:15:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9724146"
Received: from omakhlou-mobl4.amr.corp.intel.com (HELO localhost)
 ([10.252.51.143])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 01:15:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 naresh.kamboju@linaro.org, deller@gmx.de, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 lkft-triage@lists.linaro.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/3] arch/powerpc: Remove <linux/fb.h> from backlight
 code
In-Reply-To: <20240305090910.26742-4-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240305090910.26742-1-tzimmermann@suse.de>
 <20240305090910.26742-4-tzimmermann@suse.de>
Date: Tue, 05 Mar 2024 11:15:27 +0200
Message-ID: <87msrd2g5s.fsf@intel.com>
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

On Tue, 05 Mar 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Replace <linux/fb.h> with a forward declaration in <asm/backlight.h> to
> resolves an unnecessary dependency. Remove pmac_backlight_curve_lookup()

*resolve

> and struct fb_info from source and header files. The function and the
> framebuffer struct is unused. No functional changes.

*are

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  arch/powerpc/include/asm/backlight.h        |  5 ++--
>  arch/powerpc/platforms/powermac/backlight.c | 26 ---------------------
>  2 files changed, 2 insertions(+), 29 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/backlight.h b/arch/powerpc/include/asm/backlight.h
> index 1b5eab62ed047..061a910d74929 100644
> --- a/arch/powerpc/include/asm/backlight.h
> +++ b/arch/powerpc/include/asm/backlight.h
> @@ -10,15 +10,14 @@
>  #define __ASM_POWERPC_BACKLIGHT_H
>  #ifdef __KERNEL__
>  
> -#include <linux/fb.h>
>  #include <linux/mutex.h>
>  
> +struct backlight_device;
> +
>  /* For locking instructions, see the implementation file */
>  extern struct backlight_device *pmac_backlight;
>  extern struct mutex pmac_backlight_mutex;
>  
> -extern int pmac_backlight_curve_lookup(struct fb_info *info, int value);
> -
>  extern int pmac_has_backlight_type(const char *type);
>  
>  extern void pmac_backlight_key(int direction);
> diff --git a/arch/powerpc/platforms/powermac/backlight.c b/arch/powerpc/platforms/powermac/backlight.c
> index aeb79a8b3e109..12bc01353bd3c 100644
> --- a/arch/powerpc/platforms/powermac/backlight.c
> +++ b/arch/powerpc/platforms/powermac/backlight.c
> @@ -9,7 +9,6 @@
>   */
>  
>  #include <linux/kernel.h>
> -#include <linux/fb.h>
>  #include <linux/backlight.h>
>  #include <linux/adb.h>
>  #include <linux/pmu.h>
> @@ -72,31 +71,6 @@ int pmac_has_backlight_type(const char *type)
>  	return 0;
>  }
>  
> -int pmac_backlight_curve_lookup(struct fb_info *info, int value)
> -{
> -	int level = (FB_BACKLIGHT_LEVELS - 1);
> -
> -	if (info && info->bl_dev) {
> -		int i, max = 0;
> -
> -		/* Look for biggest value */
> -		for (i = 0; i < FB_BACKLIGHT_LEVELS; i++)
> -			max = max((int)info->bl_curve[i], max);
> -
> -		/* Look for nearest value */
> -		for (i = 0; i < FB_BACKLIGHT_LEVELS; i++) {
> -			int diff = abs(info->bl_curve[i] - value);
> -			if (diff < max) {
> -				max = diff;
> -				level = i;
> -			}
> -		}
> -
> -	}
> -
> -	return level;
> -}
> -
>  static void pmac_backlight_key_worker(struct work_struct *work)
>  {
>  	if (atomic_read(&kernel_backlight_disabled))

-- 
Jani Nikula, Intel
