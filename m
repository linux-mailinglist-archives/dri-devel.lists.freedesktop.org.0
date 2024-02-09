Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C33284F7EA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 15:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBC410F531;
	Fri,  9 Feb 2024 14:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpcmp9ue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0368610F530
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 14:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707490320; x=1739026320;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Xu2NTH+sj2xaNNkHf92WqNMoNmO6d7I+wEi7f2JMgBI=;
 b=jpcmp9ueOJHPiPAsFaxPkqHM8ibv+DsQ/VF0Bsson2eIski3rgpxmqnr
 6pZZxNnrG/5xwmx6qWZwfGzdlTo9W5Y9dGyAvgfFnSZhHYqkT/TEbBtGr
 uerBqrxI+cGwQtxBGqkbkZmTyb4vLdOJ2EJV3IuwctUD9eqQ2BVIWJzLW
 K1ES5GpTRxT1BaUvHvnUe24LXmpP1w6arbORYmFTaK2FnG7PNef5Q8vpV
 vWjfezZPT2l8j9eVZ9+TkkaEgQ1QvjjqUlpExVOO2czGsK0J01/vUU+n2
 H3PO1OKPwRBOtTRaVNzv5NaWi76g7YuMWUbssTCYUCHXSvaXHeLYG4zho g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="5233512"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="5233512"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 06:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="910729409"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="910729409"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 06:51:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rYSEL-00000003B4I-166a; Fri, 09 Feb 2024 16:51:53 +0200
Date: Fri, 9 Feb 2024 16:51:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF
 platforms
Message-ID: <ZcY8CDnUZn7SuK8-@smile.fi.intel.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
 <20240208113425.GK689448@google.com>
 <ZcUMMyV_vBTNw8Rz@smile.fi.intel.com>
 <20240208173946.GX689448@google.com>
 <ZcUYZRDVmHhKQu9j@smile.fi.intel.com>
 <20240208181455.GA689448@google.com>
 <ZcUcRlcQmQG4s42k@smile.fi.intel.com>
 <20240209075052.GB689448@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240209075052.GB689448@google.com>
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

On Fri, Feb 09, 2024 at 07:50:52AM +0000, Lee Jones wrote:
> On Thu, 08 Feb 2024, Andy Shevchenko wrote:
> > On Thu, Feb 08, 2024 at 06:14:55PM +0000, Lee Jones wrote:
> > > On Thu, 08 Feb 2024, Andy Shevchenko wrote:
> > > > On Thu, Feb 08, 2024 at 05:39:46PM +0000, Lee Jones wrote:
> > > > > On Thu, 08 Feb 2024, Andy Shevchenko wrote:
> > > > > > On Thu, Feb 08, 2024 at 11:34:25AM +0000, Lee Jones wrote:
> > > > > > > On Thu, 01 Feb 2024, Andy Shevchenko wrote:

...

> > > > > > > >   backlight: mp3309c: Utilise temporary variable for struct device
> > > > > > 
> > > > > > (1)
> > > > > > 
> > > > > > > Set no longer applies.  Please rebase, thanks.
> > > > > > 
> > > > > > I got a contradictory messages:
> > > > > > 1) email that says that all had been applied;
> > > > > > 2) this email (that tells the complete opposite);
> > > > > > 3) the repository where the first two were applied.
> > > > > > 
> > > > > > While you can amend your scripts, I think I need to rebase only the last patch
> > > > > 
> > > > > This is what I assume happened:
> > > > > 
> > > > > 1. Attempted to apply the set (as a set)
> > > > > 2. 2 commits applied cleanly
> > > > > 3. The final commit conflicted
> > > > 
> > > > Which is really strange. I have just applied (with b4) on top of your changes
> > > > and no complains so far.
> > > > 
> > > > $ git am ./v2_20240201_andriy_shevchenko_backlight_mp3309c_allow_to_use_on_non_of_platforms.mbx
> > > > Applying: backlight: mp3309c: Make use of device properties
> > > > Applying: backlight: mp3309c: use dev_err_probe() instead of dev_err()
> > > > Applying: backlight: mp3309c: Utilise temporary variable for struct device
> > > > 
> > > > Can you show what b4 tells you about this?
> > > 
> > > Fetching patch(es)
> > > Analyzing 14 messages in the thread
> > > Checking attestation on all messages, may take a moment...
> > > ---
> > >   ✓ [PATCH v2 1/3] backlight: mp3309c: Make use of device properties
> > >     + Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org> (✓ DKIM/linaro.org)
> > >     + Link: https://lore.kernel.org/r/20240201151537.367218-2-andriy.shevchenko@linux.intel.com
> > >     + Signed-off-by: Lee Jones <lee@kernel.org>
> > >   ✓ [PATCH v2 2/3] backlight: mp3309c: use dev_err_probe() instead of dev_err()
> > >     + Tested-by: Flavio Suligoi <f.suligoi@asem.it> (✗ DKIM/asem.it)
> > >     + Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org> (✓ DKIM/linaro.org)
> > >     + Link: https://lore.kernel.org/r/20240201151537.367218-3-andriy.shevchenko@linux.intel.com
> > >     + Signed-off-by: Lee Jones <lee@kernel.org>
> > >   ✓ [PATCH v2 3/3] backlight: mp3309c: Utilise temporary variable for struct device
> > >     + Link: https://lore.kernel.org/r/20240201151537.367218-4-andriy.shevchenko@linux.intel.com
> > >     + Signed-off-by: Lee Jones <lee@kernel.org>
> > >   ---
> > >   ✓ Signed: DKIM/intel.com (From: andriy.shevchenko@linux.intel.com)
> > > ---
> > > Total patches: 3
> > > Prepared a fake commit range for 3-way merge (672ecc5199b5..d507b9f4c5b9)
> > > ---
> > >  Link: https://lore.kernel.org/r/20240201151537.367218-1-andriy.shevchenko@linux.intel.com
> > >  Base: not specified
> > > 
> > > Running through checkpatch.pl
> > > total: 0 errors, 0 warnings, 103 lines checked
> > > 
> > > "[PATCH v2 1/3] backlight: mp3309c: Make use of device properties" has no obvious style problems and is ready for submission.
> > > total: 0 errors, 0 warnings, 41 lines checked
> > > 
> > > "[PATCH v2 2/3] backlight: mp3309c: use dev_err_probe() instead of" has no obvious style problems and is ready for submission.
> > > total: 0 errors, 0 warnings, 81 lines checked
> > > 
> > > "[PATCH v2 3/3] backlight: mp3309c: Utilise temporary variable for" has no obvious style problems and is ready for submission.
> > > 
> > > Check the results (hit return to continue or Ctrl+c to exit)
> > > 
> > > 
> > > Applying patch(es)
> > > Applying: backlight: mp3309c: Make use of device properties
> > > Applying: backlight: mp3309c: use dev_err_probe() instead of dev_err()
> > > Applying: backlight: mp3309c: Utilise temporary variable for struct device
> > > Using index info to reconstruct a base tree...
> > > M	drivers/video/backlight/mp3309c.c
> > > Checking patch drivers/video/backlight/mp3309c.c...
> > > Applied patch drivers/video/backlight/mp3309c.c cleanly.
> > > Falling back to patching base and 3-way merge...
> > > error: Your local changes to the following files would be overwritten by merge:
> > > 	drivers/video/backlight/mp3309c.c
> > > Please commit your changes or stash them before you merge.
> > > Aborting
> > > error: Failed to merge in the changes.
> > > Patch failed at 0003 backlight: mp3309c: Utilise temporary variable for struct device
> > > hint: Use 'git am --show-current-patch=diff' to see the failed patch
> > > When you have resolved this problem, run "git am --continue".
> > > If you prefer to skip this patch, run "git am --skip" instead.
> > > To restore the original branch and stop patching, run "git am --abort".
> > 
> > Thank you!
> > 
> > It seems I have reduced context, so if you do `git am -C2 ...` it should apply.
> > Never mind, I'll send a new version which should work with -C3.
> 
> I just use the default matching context lines.
> 
> Do you have a special config that reduces you context in patches?

No special config, but can be done via aliasing (through function)
E.g.,
	git() {
		if [ "$1" = 'am' ]; then
			shift
			/usr/bin/git am -C1 "$@"
		else
			/usr/bin/git "$@"
		fi
	}

-- 
With Best Regards,
Andy Shevchenko


