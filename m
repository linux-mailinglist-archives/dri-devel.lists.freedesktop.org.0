Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1EA783BD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 23:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E3310E173;
	Tue,  1 Apr 2025 21:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="WuPUg7LZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA72810E173;
 Tue,  1 Apr 2025 21:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=g6StCyFpesYqaHVFLkyaouJmKdU5BfnU8LCrhZCDOCE=; b=WuPUg7LZBd19mvjU
 ZIGuJrVfFNtMuEjPcGLLx5VymD7xLMsLJNVHURqDPSNskBzNOpknpQlYefSYPGLwSBI/QpZf1eEoV
 PdNA+hIZf9lr8sBKCiL3p2V012JKYq6H1c22JHZ7TwJT188AyOh8mau8eeFt99CHLOczjksqHZdHD
 TgUNmMSRgo24r5Pez7w7PHu59TfvV5D2WGB8ObEFyUr3VRoqF3S8yQD8PNuZlDaoRPkVuoPsYoNNA
 Om0HFfxYHm2hZ3d0TGNt4W6u7B2anWSwNnm4Qz5ucK7t4nV3AG6y4MnuhV6kDCsSSDknly3ZxeEp1
 ikJ0mztKAV3jAZ4eRQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tzikn-008RMK-1P;
 Tue, 01 Apr 2025 21:02:37 +0000
Date: Tue, 1 Apr 2025 21:02:37 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, x86@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/platform/iosf_mbi: Remove unused
 iosf_mbi_unregister_pmic_bus_access_notifier
Message-ID: <Z-xUbXnU40c5ZkYQ@gallifrey>
References: <20241225175010.91783-1-linux@treblig.org>
 <Z7416P1rZPNMHQq7@gmail.com> <Z-vP7-PaLhsHozbw@gallifrey>
 <Z-wxRln0avv8Fz55@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Z-wxRln0avv8Fz55@gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 21:01:18 up 328 days,  8:15,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Ingo Molnar (mingo@kernel.org) wrote:
> 
> * Dr. David Alan Gilbert <linux@treblig.org> wrote:
> 
> > * Ingo Molnar (mingo@kernel.org) wrote:
> > > 
> > > * linux@treblig.org <linux@treblig.org> wrote:
> > > 
> > > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > > 
> > > > The last use of iosf_mbi_unregister_pmic_bus_access_notifier() was
> > > > removed in 2017 by
> > > > commit a5266db4d314 ("drm/i915: Acquire PUNIT->PMIC bus for
> > > > intel_uncore_forcewake_reset()")
> > > > 
> > > > Remove it.
> > > > 
> > > > Note the '_unlocked' version is still used.
> > > > 
> > > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > > ---
> > > >  arch/x86/include/asm/iosf_mbi.h      |  7 -------
> > > >  arch/x86/platform/intel/iosf_mbi.c   | 13 -------------
> > > >  drivers/gpu/drm/i915/i915_iosf_mbi.h |  6 ------
> > > >  3 files changed, 26 deletions(-)
> > > 
> > > Acked-by: Ingo Molnar <mingo@kernel.org>
> > 
> > Thanks!
> > Any idea who might pick this one up?
> > 
> > Dave
> 
> We can certainly do it via the x86 tree - I've added GPU/DRM 
> maintainers to the commit's Cc: list.

Thanks again! (hardly urgent, but just trying to clean up 
my backlog).

Dave

> Thanks,
> 
> 	Ingo
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
