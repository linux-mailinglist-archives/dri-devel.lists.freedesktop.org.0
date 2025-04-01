Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39381A779AF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 13:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9822510E2DD;
	Tue,  1 Apr 2025 11:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="jfjrv5Fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3795710E2C3;
 Tue,  1 Apr 2025 11:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=HE/RSUboQWuGBGJkjqKZ/6rnsYTFUJOgslonvJ26GG8=; b=jfjrv5Fy1QlfGLRn
 Lo1FOEFMnwl1Ojdlg5iC5keO3lVbfbUzvNplXaUCaQp2+kcL2709CKodrLfgjziaPDaVWkdi8Rqt3
 4/e6LvDb+ifBcFT59Uu76xm9LB5H4HRd5J9S2F4uM5Bir9c8SLxvwLzVfsoYqHhrNxWlTZIPQfvMn
 GBwH7fQ6AxY9XClWJuygXFekMjx0rVjc1ZzXBp9KWkJpLBYfVzOlAeiuyyOywKW+cQg0UuM1L7S0U
 yxEX3Z2pZnblRW2TvamJjwl82DaVW/nh0JJ9kgqWSgFusuv+qZ4jezTZbL4mwSYFOV8lCstlkPY3F
 jYonIdiMrlGda0ZjJQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tzZvj-008Jrn-1V;
 Tue, 01 Apr 2025 11:37:19 +0000
Date: Tue, 1 Apr 2025 11:37:19 +0000
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
Message-ID: <Z-vP7-PaLhsHozbw@gallifrey>
References: <20241225175010.91783-1-linux@treblig.org>
 <Z7416P1rZPNMHQq7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Z7416P1rZPNMHQq7@gmail.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 11:36:51 up 327 days, 22:50,  1 user,  load average: 0.05, 0.01, 0.00
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
> * linux@treblig.org <linux@treblig.org> wrote:
> 
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > The last use of iosf_mbi_unregister_pmic_bus_access_notifier() was
> > removed in 2017 by
> > commit a5266db4d314 ("drm/i915: Acquire PUNIT->PMIC bus for
> > intel_uncore_forcewake_reset()")
> > 
> > Remove it.
> > 
> > Note the '_unlocked' version is still used.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  arch/x86/include/asm/iosf_mbi.h      |  7 -------
> >  arch/x86/platform/intel/iosf_mbi.c   | 13 -------------
> >  drivers/gpu/drm/i915/i915_iosf_mbi.h |  6 ------
> >  3 files changed, 26 deletions(-)
> 
> Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks!
Any idea who might pick this one up?

Dave

> Thanks,
> 
> 	Ingo
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
