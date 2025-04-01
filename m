Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBE7A78238
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 20:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0357010E656;
	Tue,  1 Apr 2025 18:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oHLAXknC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03C910E659;
 Tue,  1 Apr 2025 18:32:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 79F175C6302;
 Tue,  1 Apr 2025 18:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84948C4CEE4;
 Tue,  1 Apr 2025 18:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743532365;
 bh=cvFFTYcrBni4gtaak/3Jl+TFfhXTOIlg4eTTzXG27vI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oHLAXknCZvHhCqvsy3VBdjk3S1cbt7IlZdddNnys+8NHFQdMcM7knQiDoEU3x9hkV
 Ew46rGzwSzTC0oSSqHBGjK4GX5tTlESfkF+Rl4h2nWk26E1tV1hpuGTdXtWZSaHJyj
 8bi0ERfeMDYObuWLjOgcucR1CMAJMGZVno4/nXVOaoLaB0WliRhsDB753mr5shAHWu
 FkLZU2VSkpdUwTDYmY3GMmVW5y2kd+7OgCNJI3w0JzkPxnk5yeCBjZLkXtgB03Lox3
 yPFsJ5/twotmU6LcPKMd1cOURLXoyKyQ3x1bxkqHYUYssNjERQciijXMnHLGCgcR7/
 n6CskBWbhPsOQ==
Date: Tue, 1 Apr 2025 20:32:38 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, x86@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/platform/iosf_mbi: Remove unused
 iosf_mbi_unregister_pmic_bus_access_notifier
Message-ID: <Z-wxRln0avv8Fz55@gmail.com>
References: <20241225175010.91783-1-linux@treblig.org>
 <Z7416P1rZPNMHQq7@gmail.com> <Z-vP7-PaLhsHozbw@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-vP7-PaLhsHozbw@gallifrey>
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


* Dr. David Alan Gilbert <linux@treblig.org> wrote:

> * Ingo Molnar (mingo@kernel.org) wrote:
> > 
> > * linux@treblig.org <linux@treblig.org> wrote:
> > 
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > The last use of iosf_mbi_unregister_pmic_bus_access_notifier() was
> > > removed in 2017 by
> > > commit a5266db4d314 ("drm/i915: Acquire PUNIT->PMIC bus for
> > > intel_uncore_forcewake_reset()")
> > > 
> > > Remove it.
> > > 
> > > Note the '_unlocked' version is still used.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >  arch/x86/include/asm/iosf_mbi.h      |  7 -------
> > >  arch/x86/platform/intel/iosf_mbi.c   | 13 -------------
> > >  drivers/gpu/drm/i915/i915_iosf_mbi.h |  6 ------
> > >  3 files changed, 26 deletions(-)
> > 
> > Acked-by: Ingo Molnar <mingo@kernel.org>
> 
> Thanks!
> Any idea who might pick this one up?
> 
> Dave

We can certainly do it via the x86 tree - I've added GPU/DRM 
maintainers to the commit's Cc: list.

Thanks,

	Ingo
