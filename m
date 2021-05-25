Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF51439061B
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 18:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D996EA68;
	Tue, 25 May 2021 16:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32C96EA68;
 Tue, 25 May 2021 16:02:03 +0000 (UTC)
IronPort-SDR: hui2YgLeLy2U4a1wMa6a9jWQzN6kGHKtMlzYK6lh0rNLOg1Ets+hvu3YVMva5OWRx/Mrloan9A
 WydbtlRJBOpQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="189349877"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="189349877"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 09:00:50 -0700
IronPort-SDR: yXL42ukqfm/wX73usOwjm0GTyxq8a6xP1I83/lfgpU6BkAOjpGwzbp473mg7R34z3FMJOtn7g2
 rnNcw/g1huZQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="443479707"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 09:00:49 -0700
Date: Tue, 25 May 2021 08:53:42 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/3] Clean a few backend interfaces in the i915
Message-ID: <20210525155341.GA6585@sdutt-i7>
References: <20210521183215.65451-1-matthew.brost@intel.com>
 <YK0CKLSCx0qowxhy@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YK0CKLSCx0qowxhy@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 03:56:56PM +0200, Daniel Vetter wrote:
> On Fri, May 21, 2021 at 11:32:12AM -0700, Matthew Brost wrote:
> > As discussed in [1] start merging some support patches as a precursor to
> > GuC submission the i915. This is step #1 mentioned in [1].
> > 
> > [1] https://patchwork.freedesktop.org/series/89844/
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Pushed to drm-intel-gt-next, thanks for patches&reviews. Btw you can also
> ping John H or Daniele for pushing stuff for you, should be quicker than
> waiting for me to return from a lon w/e :-)
> 

Thanks for the push. I don't think John H has push rights upstream, I
know Daniele has rights but I don't think is up to date with the process
to merge patches. I can discuss this with him today and see if he can
get reenabled on this process.

Matt

> Plus I _really_ don't want to get back into the business of pushing other
> people's work ...
> 
> Cheers, Daniel
> 
> > 
> > Chris Wilson (3):
> >   drm/i915/gt: Move engine setup out of set_default_submission
> >   drm/i915/gt: Move submission_method into intel_gt
> >   drm/i915/gt: Move CS interrupt handler to the backend
> > 
> >  drivers/gpu/drm/i915/gt/intel_engine.h        |  8 +-
> >  drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 19 +++-
> >  drivers/gpu/drm/i915/gt/intel_engine_types.h  | 14 +--
> >  .../drm/i915/gt/intel_execlists_submission.c  | 95 +++++++++++++------
> >  .../drm/i915/gt/intel_execlists_submission.h  |  3 -
> >  drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 82 +++++-----------
> >  drivers/gpu/drm/i915/gt/intel_gt_irq.h        | 23 +++++
> >  drivers/gpu/drm/i915/gt/intel_gt_types.h      |  7 ++
> >  drivers/gpu/drm/i915/gt/intel_reset.c         |  7 +-
> >  .../gpu/drm/i915/gt/intel_ring_submission.c   | 12 ++-
> >  drivers/gpu/drm/i915/gt/intel_rps.c           |  2 +-
> >  drivers/gpu/drm/i915/gt/selftest_execlists.c  |  2 +-
> >  .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 64 ++++++-------
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  1 -
> >  drivers/gpu/drm/i915/i915_irq.c               | 10 +-
> >  drivers/gpu/drm/i915/i915_perf.c              | 10 +-
> >  17 files changed, 199 insertions(+), 162 deletions(-)
> > 
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
