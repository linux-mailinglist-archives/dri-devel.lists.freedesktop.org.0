Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21077AAC873
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 16:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF3410E6AA;
	Tue,  6 May 2025 14:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lechuck.jsg.id.au (jsg.id.au [193.114.144.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F6E10E060;
 Tue,  6 May 2025 14:45:10 +0000 (UTC)
Received: from largo.jsg.id.au (largo.jsg.id.au [192.168.1.44])
 by lechuck.jsg.id.au (OpenSMTPD) with ESMTPS id bdd9e5af
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 7 May 2025 00:45:08 +1000 (AEST)
Received: from localhost (largo.jsg.id.au [local])
 by largo.jsg.id.au (OpenSMTPD) with ESMTPA id 91c5f4fc;
 Wed, 7 May 2025 00:45:07 +1000 (AEST)
Date: Wed, 7 May 2025 00:45:07 +1000
From: Jonathan Gray <jsg@jsg.id.au>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/pxp: fix non-optimised !CONFIG_DRM_I915_PXP build
Message-ID: <aBogc_3nH8ej_M_h@largo.jsg.id.au>
References: <20241103110230.11035-1-jsg@jsg.id.au> <87msieghk7.fsf@intel.com>
 <aBoDqgR_uxbK7SjU@largo.jsg.id.au> <87wmatvqj6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmatvqj6.fsf@intel.com>
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

On Tue, May 06, 2025 at 04:04:45PM +0300, Jani Nikula wrote:
> On Tue, 06 May 2025, Jonathan Gray <jsg@jsg.id.au> wrote:
> > On Tue, Nov 05, 2024 at 11:23:36AM +0200, Jani Nikula wrote:
> >> On Sun, 03 Nov 2024, Jonathan Gray <jsg@jsg.id.au> wrote:
> >> > intel_pxp_gsccs_is_ready_for_sessions() is gated by CONFIG_DRM_I915_PXP
> >> > but called from intel_pxp.c which isn't.  Provide a fallback inline
> >> > function to fix the non-optimised build.
> >> >
> >> > Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup")
> >> > Signed-off-by: Jonathan Gray <jsg@jsg.id.au>
> >> 
> >> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> >
> > equivalent patch was merged and now queued for stable
> > 7e21ea8149a0 ("drm/i915/pxp: fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'")
> 
> Oh, damn. I'm really sorry for first dropping the ball on your patch,
> and then encountering another patch and forgetting one like that already
> existed.
> 
> My bad, apologies.

Thanks.  I mentioned this in case someone with the same problem found
this thread.  I understand you have many patches to keep track of.
