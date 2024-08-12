Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7579594EC20
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 13:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FEE10E1B9;
	Mon, 12 Aug 2024 11:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Is+FAHHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C89610E1B8;
 Mon, 12 Aug 2024 11:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723463497; x=1754999497;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JetQAQaJ1I2wNDx3JjQUs3ufydTjZfd8naKWltBwWfQ=;
 b=Is+FAHHa/Pi8lDK2ZSRrBHgf5hke1sXNkVWHoSjjBOSC19xem3zdz9gE
 G6L2aKULYx9Rf1tESBFdPTLH3q2KB/ISNrbBwP+OLav0WjE4dPTaIVuvU
 WfZnQtE5+ohvkpjyRFWK3szGTQevhb1qUUDMmm8paF6f3Y3nNdRxRNzkU
 3gfG5+LSODi3yhschsT1gGLcp+7IpNjHsBR2YjlIQYNRbe5NkSx+GR+K9
 0NdAiW2DR6ZC+qPWJobm5IOAtdhKxM13iKHwrrZcFPUgq5ntsVKLV2nub
 1b7K7VBbMHdmdo2Q4IFN55vpFoCWoPOubep88VkYlarwoLTgZ80o4GoJ7 g==;
X-CSE-ConnectionGUID: uReeGXhASzu/+mDyiFuXTA==
X-CSE-MsgGUID: 2YnJ40drSe6pPk9Q9anw+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="32244076"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="32244076"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 04:51:37 -0700
X-CSE-ConnectionGUID: dwpWabwJS6WiECsZ7FX91g==
X-CSE-MsgGUID: 13NNfiI2Q+G+3x6vih0jWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="63088883"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.149])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 04:51:35 -0700
Date: Mon, 12 Aug 2024 13:51:30 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH 0/2] Allow partial memory mapping for cpu memory
Message-ID: <Zrn3QqOvOEW2EYB0@ashyti-mobl2.lan>
References: <20240807100521.478266-1-andi.shyti@linux.intel.com>
 <ZrXZEpplb6YA9T_d@phenom.ffwll.local>
 <ZrXtiBKyCCh0a_ym@ashyti-mobl2.lan>
 <ZrnRuRGjxHe5zxuf@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrnRuRGjxHe5zxuf@phenom.ffwll.local>
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

Hi Daniel,

On Mon, Aug 12, 2024 at 11:11:21AM +0200, Daniel Vetter wrote:
> On Fri, Aug 09, 2024 at 11:20:56AM +0100, Andi Shyti wrote:
> > On Fri, Aug 09, 2024 at 10:53:38AM +0200, Daniel Vetter wrote:
> > > On Wed, Aug 07, 2024 at 11:05:19AM +0100, Andi Shyti wrote:
> > > > This patch series concludes on the memory mapping fixes and
> > > > improvements by allowing partial memory mapping for the cpu
> > > > memory as well.
> > > > 
> > > > The partial memory mapping by adding an object offset was
> > > > implicitely included in commit 8bdd9ef7e9b1 ("drm/i915/gem: Fix
> > > > Virtual Memory mapping boundaries calculation") for the gtt
> > > > memory.
> > > 
> > > Does userspace actually care? Do we have a flag or something, so that
> > > userspace can discover this?
> > > 
> > > Adding complexity of any kind is absolute no-go, unless there's a
> > > userspace need. This also includes the gtt accidental fix.
> > 
> > Actually this missing functionality was initially filed as a bug
> > by mesa folks. So that this patch was requested by them (Lionel
> > is Cc'ed).
> > 
> > The tests cases that have been sent previously and I'm going to
> > send again, are directly taken from mesa use cases.
> 
> Please add the relevant mesa MR to this patch then, and some relevant
> explanations for how userspace detects this all and decides to use it.

AFAIK, there is no Mesa MR. We are adding a feature that was
missing, but Mesa already supported it (indeed, Nimroy suggested
adding the Fixes tag for this).

Also because, Mesa was receiving an invalid address error and
asked to support the partial mapping of the memory.

> Also, does xe also support this? If we only add this to i915-gem but xe
> doesn't have it, it doesn't make much sense imo.

I don't know about. Lionel, Do you have anything to add here from
your side?

Thanks,
Andi
