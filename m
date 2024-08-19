Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DE0956E7C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D8D810E2BB;
	Mon, 19 Aug 2024 15:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dn81dvE/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EBB10E2BB;
 Mon, 19 Aug 2024 15:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724080575; x=1755616575;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MON53pjJRt/NJhE1tpToOCGRZJvVjvvDQXnEYBo0jwo=;
 b=dn81dvE/5lQ+v4okt8ZaUqkcecJ5Gsg7HjFnufcmbyUWMKQ2zD0KOl8a
 hpeE7AlYwNhJemGAR1B7IzYeodyCe2zS+6HKYNrs1TbgwExAucPuGtaIX
 ZVoz8dr3UQCnCctIUK2yHZWQ6cYtVHTIkm/Jpyf2Z4ijRBK5kuj5lrG5b
 WrXyEoazL/Jr8l8/LWr6WqnQPPZ/vA6Y/P6AkT6+mCzPE9bU7R6KoeWas
 dasKivLTo2nlI3Q+aBPaAcYyUPYt1cY7oGjfQiTJ4h8zD/5JoVzqE/53d
 /DBDN03nVW8vlnluyP11ZcRyoW8fr++hwp5G3ZUy6Hj0CjE+yWEJQQdk3 g==;
X-CSE-ConnectionGUID: Nnh0KPt4QmC9Ja3tep0efg==
X-CSE-MsgGUID: 4gYrzPOyRZCEAnAS29Z7yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21879145"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="21879145"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:16:15 -0700
X-CSE-ConnectionGUID: w3sXov8yR5mOeQD0SioEQA==
X-CSE-MsgGUID: xZVl/PShTaGVcbFmJSgd6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="91147865"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.73])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:16:12 -0700
Date: Mon, 19 Aug 2024 17:16:09 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sima <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 0/2] Allow partial memory mapping for cpu memory
Message-ID: <ZsNhua9FIrDT92-r@ashyti-mobl2.lan>
References: <20240814134837.116498-1-andi.shyti@linux.intel.com>
 <ZrzWJiJ2Yr0DJPG2@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrzWJiJ2Yr0DJPG2@DUT025-TGLU.fm.intel.com>
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

Hi Matt,

On Wed, Aug 14, 2024 at 04:07:02PM +0000, Matthew Brost wrote:
> On Wed, Aug 14, 2024 at 03:48:32PM +0200, Andi Shyti wrote:
> > I am resending this patch series, not to disregard the previous
> > discussions, but to ensure it gets tested with the IGTs that
> > Krzysztof has provided.
> > 
> > This patch series finalizes the memory mapping fixes and
> > improvements by enabling partial memory mapping for CPU memory as
> > well.
> > 
> > The concept of partial memory mapping, achieved by adding an
> > object offset, was implicitly introduced in commit 8bdd9ef7e9b1
> > ("drm/i915/gem: Fix Virtual Memory mapping boundaries
> > calculation") for GTT memory.
> > 
> > To address a previous discussion with Sima and Matt, this feature
> > is used by Mesa and is required across all platforms utilizing
> > Mesa. Although Nirmoy suggested using the Fixes tag to backport
> 
> Other vendors than Intel too?

Yes, that's what I understood.

I hope Lionel can jump in and explain the use cases from Mesa
perspective.

> > this to previous kernels, I view this as a new feature rather
> > than a fix.
> > 
> > Lionel, please let me know if you have a different perspective
> > and believe this should be treated as a bug fix, requiring it
> > to be backported to stable kernels.
> > 
> > The IGTs have been developed in collaboration with the Mesa team
> > to replicate the exact Mesa use case[*].
> > 
> > Thanks Chris for the support, thanks Krzysztof for taking care of
> > the IGT tests, thanks Nirmoy for your reviews and thanks Sima and
> > Matt for the discussion on this series.
> > 
> > Andi
> > 
> > [*] https://patchwork.freedesktop.org/patch/608232/?series=137303&rev=1
> 
> So here is really quick test [1] which I put together in Xe to test
> partial mmaps, not as complete as the i915 one though.
> 
> It fails on the Xe baseline.
> 
> It pass if with [2] in drm_gem.c:drm_gem_mmap. Blindly changing that
> function might not be the correct solution but thought I'd share as a
> reference.

Thanks for sharing it. I took a quick look and I think there are
a few things missing there. If you want and if this is not in
anyone's task list, I can try to "port" this in XE.

Is there any other objection to getting this merged into i915?

Andi
