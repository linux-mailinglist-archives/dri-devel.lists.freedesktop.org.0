Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566684F10F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 08:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6649310E961;
	Fri,  9 Feb 2024 07:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lnPUwN+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 687AD10E8E8
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 07:51:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E24B261EE9;
 Fri,  9 Feb 2024 07:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91CDC433F1;
 Fri,  9 Feb 2024 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707465057;
 bh=4P6Q65OM5G13zMp416D3cDinlUrcM6b83+wzrToei0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lnPUwN+N4dSqR1G2m4/Shb6BfsucY08qgzOFcXugXnckCcVdvF1wGZ0aILmxTOMsM
 C56jh6Jw+CakVwpePLel2TaWMoasjS/C5oqvus9tzKaHiA6L7taFAv1I5i6u807TVR
 90hYAIoQbOYugq8Ay1h/66+tVpfx4BMx2p2BVX55eavp98uoH0SxpiU8L1+AUsyfl0
 sMenFXiE/i9Tt/wyf0vgE4o7czT0/aEAbnlUpAIUIMynHFOWgLVZWMRScY+qG1lhnz
 QqHCuoHfOAlJYzoZSmy6Cowr+AVOiZF2a/7voIyUlS7aEYvEznJhP8c837/SyF/oVw
 cmewdN5M7vZhQ==
Date: Fri, 9 Feb 2024 07:50:52 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF
 platforms
Message-ID: <20240209075052.GB689448@google.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
 <20240208113425.GK689448@google.com>
 <ZcUMMyV_vBTNw8Rz@smile.fi.intel.com>
 <20240208173946.GX689448@google.com>
 <ZcUYZRDVmHhKQu9j@smile.fi.intel.com>
 <20240208181455.GA689448@google.com>
 <ZcUcRlcQmQG4s42k@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcUcRlcQmQG4s42k@smile.fi.intel.com>
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

On Thu, 08 Feb 2024, Andy Shevchenko wrote:

> On Thu, Feb 08, 2024 at 06:14:55PM +0000, Lee Jones wrote:
> > On Thu, 08 Feb 2024, Andy Shevchenko wrote:
> > > On Thu, Feb 08, 2024 at 05:39:46PM +0000, Lee Jones wrote:
> > > > On Thu, 08 Feb 2024, Andy Shevchenko wrote:
> > > > > On Thu, Feb 08, 2024 at 11:34:25AM +0000, Lee Jones wrote:
> > > > > > On Thu, 01 Feb 2024, Andy Shevchenko wrote:
> 
> ...
> 
> > > > > > >   backlight: mp3309c: Utilise temporary variable for struct device
> > > > > 
> > > > > (1)
> > > > > 
> > > > > > Set no longer applies.  Please rebase, thanks.
> > > > > 
> > > > > I got a contradictory messages:
> > > > > 1) email that says that all had been applied;
> > > > > 2) this email (that tells the complete opposite);
> > > > > 3) the repository where the first two were applied.
> > > > > 
> > > > > While you can amend your scripts, I think I need to rebase only the last patch
> > > > 
> > > > This is what I assume happened:
> > > > 
> > > > 1. Attempted to apply the set (as a set)
> > > > 2. 2 commits applied cleanly
> > > > 3. The final commit conflicted
> > > 
> > > Which is really strange. I have just applied (with b4) on top of your changes
> > > and no complains so far.
> > > 
> > > $ git am ./v2_20240201_andriy_shevchenko_backlight_mp3309c_allow_to_use_on_non_of_platforms.mbx
> > > Applying: backlight: mp3309c: Make use of device properties
> > > Applying: backlight: mp3309c: use dev_err_probe() instead of dev_err()
> > > Applying: backlight: mp3309c: Utilise temporary variable for struct device
> > > 
> > > Can you show what b4 tells you about this?
> > 
> > Fetching patch(es)
> > Analyzing 14 messages in the thread
> > Checking attestation on all messages, may take a moment...
> > ---
> >   ✓ [PATCH v2 1/3] backlight: mp3309c: Make use of device properties
> >     + Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org> (✓ DKIM/linaro.org)
> >     + Link: https://lore.kernel.org/r/20240201151537.367218-2-andriy.shevchenko@linux.intel.com
> >     + Signed-off-by: Lee Jones <lee@kernel.org>
> >   ✓ [PATCH v2 2/3] backlight: mp3309c: use dev_err_probe() instead of dev_err()
> >     + Tested-by: Flavio Suligoi <f.suligoi@asem.it> (✗ DKIM/asem.it)
> >     + Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org> (✓ DKIM/linaro.org)
> >     + Link: https://lore.kernel.org/r/20240201151537.367218-3-andriy.shevchenko@linux.intel.com
> >     + Signed-off-by: Lee Jones <lee@kernel.org>
> >   ✓ [PATCH v2 3/3] backlight: mp3309c: Utilise temporary variable for struct device
> >     + Link: https://lore.kernel.org/r/20240201151537.367218-4-andriy.shevchenko@linux.intel.com
> >     + Signed-off-by: Lee Jones <lee@kernel.org>
> >   ---
> >   ✓ Signed: DKIM/intel.com (From: andriy.shevchenko@linux.intel.com)
> > ---
> > Total patches: 3
> > Prepared a fake commit range for 3-way merge (672ecc5199b5..d507b9f4c5b9)
> > ---
> >  Link: https://lore.kernel.org/r/20240201151537.367218-1-andriy.shevchenko@linux.intel.com
> >  Base: not specified
> > 
> > Running through checkpatch.pl
> > total: 0 errors, 0 warnings, 103 lines checked
> > 
> > "[PATCH v2 1/3] backlight: mp3309c: Make use of device properties" has no obvious style problems and is ready for submission.
> > total: 0 errors, 0 warnings, 41 lines checked
> > 
> > "[PATCH v2 2/3] backlight: mp3309c: use dev_err_probe() instead of" has no obvious style problems and is ready for submission.
> > total: 0 errors, 0 warnings, 81 lines checked
> > 
> > "[PATCH v2 3/3] backlight: mp3309c: Utilise temporary variable for" has no obvious style problems and is ready for submission.
> > 
> > Check the results (hit return to continue or Ctrl+c to exit)
> > 
> > 
> > Applying patch(es)
> > Applying: backlight: mp3309c: Make use of device properties
> > Applying: backlight: mp3309c: use dev_err_probe() instead of dev_err()
> > Applying: backlight: mp3309c: Utilise temporary variable for struct device
> > Using index info to reconstruct a base tree...
> > M	drivers/video/backlight/mp3309c.c
> > Checking patch drivers/video/backlight/mp3309c.c...
> > Applied patch drivers/video/backlight/mp3309c.c cleanly.
> > Falling back to patching base and 3-way merge...
> > error: Your local changes to the following files would be overwritten by merge:
> > 	drivers/video/backlight/mp3309c.c
> > Please commit your changes or stash them before you merge.
> > Aborting
> > error: Failed to merge in the changes.
> > Patch failed at 0003 backlight: mp3309c: Utilise temporary variable for struct device
> > hint: Use 'git am --show-current-patch=diff' to see the failed patch
> > When you have resolved this problem, run "git am --continue".
> > If you prefer to skip this patch, run "git am --skip" instead.
> > To restore the original branch and stop patching, run "git am --abort".
> 
> Thank you!
> 
> It seems I have reduced context, so if you do `git am -C2 ...` it should apply.
> Never mind, I'll send a new version which should work with -C3.

I just use the default matching context lines.

Do you have a special config that reduces you context in patches?

-- 
Lee Jones [李琼斯]
