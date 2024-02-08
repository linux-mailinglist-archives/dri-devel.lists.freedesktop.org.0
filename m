Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7A84E760
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 19:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE1D10E9B6;
	Thu,  8 Feb 2024 18:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QymQm3CQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD5210E9B8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707415659; x=1738951659;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X6nLFPQpt9TpuAIYru0WJ9kygI91piLsQjvSadjn4UY=;
 b=QymQm3CQ3safG1miqdqVLCQegFQ7eLitca16V6CLbcmj9BwhUjsyv+Fa
 Mps/bZcX6B70nxa9hGVisMehrsrSj3BGpajAyTONKy+tcH0tJ2rdAa/Fm
 nNmW1E592fHfSpROAPigwLO+Jg+8ZcGIOqmrH/Td/Y2bb0wmf3l5hCFWj
 RbEfcnymCLXoJLEg1EmHFEF1+LDM6ICM0Is8oq74obuHkudqMC1svckOG
 EPFiviWExD9LonyxCpg51GU3Ju2+4TiWwDi/M2N9DJi3PG1lFy5rFbadD
 xIRIC7yNrSjLSK17lOAt8XiPFGXPwzc/lMiPDXJL6LWzHLvb+ZcsSTaQ4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1437770"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1437770"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="910453258"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="910453258"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 10:07:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rY8o9-00000002weL-1f5B; Thu, 08 Feb 2024 20:07:33 +0200
Date: Thu, 8 Feb 2024 20:07:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF
 platforms
Message-ID: <ZcUYZRDVmHhKQu9j@smile.fi.intel.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
 <20240208113425.GK689448@google.com>
 <ZcUMMyV_vBTNw8Rz@smile.fi.intel.com>
 <20240208173946.GX689448@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208173946.GX689448@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Feb 08, 2024 at 05:39:46PM +0000, Lee Jones wrote:
> On Thu, 08 Feb 2024, Andy Shevchenko wrote:
> > On Thu, Feb 08, 2024 at 11:34:25AM +0000, Lee Jones wrote:
> > > On Thu, 01 Feb 2024, Andy Shevchenko wrote:

...

> > > >   backlight: mp3309c: Utilise temporary variable for struct device
> > 
> > (1)
> > 
> > > Set no longer applies.  Please rebase, thanks.
> > 
> > I got a contradictory messages:
> > 1) email that says that all had been applied;
> > 2) this email (that tells the complete opposite);
> > 3) the repository where the first two were applied.
> > 
> > While you can amend your scripts, I think I need to rebase only the last patch
> 
> This is what I assume happened:
> 
> 1. Attempted to apply the set (as a set)
> 2. 2 commits applied cleanly
> 3. The final commit conflicted

Which is really strange. I have just applied (with b4) on top of your changes
and no complains so far.

$ git am ./v2_20240201_andriy_shevchenko_backlight_mp3309c_allow_to_use_on_non_of_platforms.mbx
Applying: backlight: mp3309c: Make use of device properties
Applying: backlight: mp3309c: use dev_err_probe() instead of dev_err()
Applying: backlight: mp3309c: Utilise temporary variable for struct device

Can you show what b4 tells you about this?

> 4. I sent you a message to say that the set failed to apply
> 5. *** I forgot to remove the 2 successful patches ***
> 6. I applied another patch
> 7. b4 noticed the 2 patches that were applied and thanked you for them
> 8. *** I didn't notice that those tys were sent ***
> 
> No need to update the scripts. :)
> 
> > (1) that may not be found in your tree currently.
> 
> I'm going to remove the other ones now.  Please submit the set.

I'll do, but I want to understand better what's going on.

-- 
With Best Regards,
Andy Shevchenko


