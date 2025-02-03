Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D69A25ADE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 14:29:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90ECD10E05A;
	Mon,  3 Feb 2025 13:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cSQfBr8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30AE10E4AF;
 Mon,  3 Feb 2025 13:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738589371; x=1770125371;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IX+nBik+ioUC8Q8VY/QkrBWA+qDS2bqt+ZVxu+sLnU8=;
 b=cSQfBr8Q1o8tcZLokjc+TKanDXp03Ik3wo8yP2XDRNh7UH043p7DHHkk
 3jiqj2auUwoqpjNKmY4jBVoQQc9DSFjOyuIgDPkisu6J2juNcGhqIzOSy
 Tix7eTBLuV0cPx6izN1MH0rhCWCLwe79fvLKXbWtKFnHROjroie7VP+rY
 fkFNAYznE/uVzjCH5ISKp0bAb9Umz+Uqe9CZkU+c5naJlXkTAuCx7m5E4
 i+CW8ANeYbjYpVSfTM4E3CtA+w5GLShyJDgN0SykFu+P/e0Q4772YygrD
 KVNkmhaSkrGcceOMAIHvKQd7nrZ+XETKLyC/FS6zYZ/xoa6paIumPSb6X A==;
X-CSE-ConnectionGUID: 44RtdSWTTQ6erVkwJlIw0g==
X-CSE-MsgGUID: 8+ejlDnCTw2ZIJxYtcZaPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38286319"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="38286319"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:29:30 -0800
X-CSE-ConnectionGUID: WPg7dMeVQpe3O5OlpegG7A==
X-CSE-MsgGUID: nVPfS6JaSV2K29pf1MRz8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111138607"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:29:28 -0800
Date: Mon, 3 Feb 2025 14:29:24 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v1] drm/i915/guc: Always disable interrupt ahead of
 synchronize_irq
Message-ID: <Z6DEtCX-XzJE8cwm@ashyti-mobl2.lan>
References: <20250123162351.1364395-1-zhanjun.dong@intel.com>
 <Z5ekXVihQSDjxqQK@ashyti-mobl2.lan>
 <41833264-348a-443e-ba89-f559cc9114cb@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41833264-348a-443e-ba89-f559cc9114cb@intel.com>
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

Hi,

Please, next time, do not remove the mailing and the other folks
you cc'ed.

I'm adding back the mailing list and Daniele who has commented
before.

...

> > > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13454
> > > Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
> > > Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Gen11")
> > > Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
> > > Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management")
> > 
> > There is an issue here, each fixes is introduced in different
> > kernel versions and they can't be mixed all together as it would
> > be impossible to backport them to the stable brances.
> > 
> > E.g.:
> > Fixes: 3e7abf814193 ("drm/i915: Extract GT render power state management")
> > Cc: <stable@vger.kernel.org> # v5.5+
> > 
> > Fixes: 2ae096872a2c ("drm/i915/pxp: Implement PXP irq handler")
> > Cc: <stable@vger.kernel.org> # v5.16+
> > 
> > Fixes: 54c52a841250 ("drm/i915/guc: Correctly handle GuC interrupts on Gen11")
> > Cc: <stable@vger.kernel.org> # v5.3+
> > 
> > Fixes: 26705e20752a ("drm/i915: Support for GuC interrupts")
> > Cc: <stable@vger.kernel.org> # v4.10+
> > 
> > Could you please split this patch in the four different patches
> > that address the four different fixes?
> Sure, will split it in next rev.

First of all we need to understand if those Fixes are really
needed or not. Daniele in his review has pointed out that...

> > > 
> > 
> > No blank lines in the tag section, please.
> > 
> > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > 
> > > ---
> > > Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> > > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Andi Shyti <andi.shyti@intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/intel_rps.c      | 3 +--
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc.c   | 4 ++--
> > >   drivers/gpu/drm/i915/pxp/intel_pxp_irq.c | 2 +-
> > >   3 files changed, 4 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > index fa304ea088e4..0fe7a8d7f460 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> > > @@ -244,8 +244,8 @@ static void rps_disable_interrupts(struct intel_rps *rps)
> > >   	gen6_gt_pm_disable_irq(gt, GEN6_PM_RPS_EVENTS);
> > >   	spin_unlock_irq(gt->irq_lock);
> > > +	rps_reset_interrupts(rps);

... the interrupts here are already disabled (read a couple of
lines above).

What is the reproduction rate of the issue? And how have you
tested it?

Thanks,
Andi

> > >   	intel_synchronize_irq(gt->i915);
> > > -
> > 
> > Sebastian has already commented in his review, but please don't
> > remove this blank line.
> > 
> > Andi
> > 
> > >   	/*
> > >   	 * Now that we will not be generating any more work, flush any
> > >   	 * outstanding tasks. As we are called on the RPS idle path,
