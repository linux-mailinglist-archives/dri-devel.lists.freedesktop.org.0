Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0995884E6EA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 18:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3970D10E252;
	Thu,  8 Feb 2024 17:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="evu3PttG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF5010E252
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 17:39:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AAEF161D09;
 Thu,  8 Feb 2024 17:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDD5C433F1;
 Thu,  8 Feb 2024 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707413991;
 bh=BLDjJ38BnZgGooci7rpMBki3qE7Nq/vz2SqBaf8tDzo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=evu3PttGEh9Y3+sMHYBw5zY2o+8AYCpHi7kcwWD+iUEmOU66tGNvGHhzONA/z/VQD
 xPwCZ1Bdu73J52OuSD2bS14V7TXl59l8ftSU3hBxAgg+ehoURWf9eqxMmHQfKDFPem
 DArgkB3rP0JsXuLh+amoeGLfuFpyft16yQ8ovJSEynbd2Eci4YUFs88M47V0J80+4H
 7Ih0n2ADy6Zt6BGdAHdmEGjxPBnUOWgbMK/EvVuh7XxB3uBUrxmX9hnYoyX8oOdwPE
 4UuUdBEQ7fEwTFxwRkEVfi8GqqKqgrvK5X4aMtNdf+GsWY3kGxQhfkm/F5XfEmI5Yc
 2y40d2hUtXACA==
Date: Thu, 8 Feb 2024 17:39:46 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/3] backlight: mp3309c: Allow to use on non-OF
 platforms
Message-ID: <20240208173946.GX689448@google.com>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
 <20240208113425.GK689448@google.com>
 <ZcUMMyV_vBTNw8Rz@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZcUMMyV_vBTNw8Rz@smile.fi.intel.com>
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

> On Thu, Feb 08, 2024 at 11:34:25AM +0000, Lee Jones wrote:
> > On Thu, 01 Feb 2024, Andy Shevchenko wrote:
> 
> ...
> 
> > >   backlight: mp3309c: Utilise temporary variable for struct device
> 
> (1)
> 
> > Set no longer applies.  Please rebase, thanks.
> 
> I got a contradictory messages:
> 1) email that says that all had been applied;
> 2) this email (that tells the complete opposite);
> 3) the repository where the first two were applied.
> 
> While you can amend your scripts, I think I need to rebase only the last patch

This is what I assume happened:

1. Attempted to apply the set (as a set)
2. 2 commits applied cleanly
3. The final commit conflicted
4. I sent you a message to say that the set failed to apply
5. *** I forgot to remove the 2 successful patches ***
6. I applied another patch
7. b4 noticed the 2 patches that were applied and thanked you for them
8. *** I didn't notice that those tys were sent ***

No need to update the scripts. :)

> (1) that may not be found in your tree currently.

I'm going to remove the other ones now.  Please submit the set.

-- 
Lee Jones [李琼斯]
