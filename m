Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B62806E45
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 12:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38EA10E6F9;
	Wed,  6 Dec 2023 11:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF7310E6EE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 11:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701863184; x=1733399184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j9MwUnxYB3UDg1NrVyRVzWmnmG4u+XHL4GhikT/rRlY=;
 b=cpQnQ2eDyA4Mnq8Ty7b89KJ1foR8Sbu1ii2fSGH3pkeYLN2SWNxVBByh
 D7ZjUbTzq2kT0bORCTWwyTfqYLEYHkRV5pAYRrZ6rQvNYepOd7HJ3yn3G
 K/Snv+LL6RqtMukgB+aqvs+IrgRTVoEBr8QSNJocAoUIQ6yxnY8hbLb4V
 elu25e9L7xP6NGMHJrLHMpRL0g91tCvwMELE1ungb3eozVtjIbYq1m5/Z
 Lmfwk+1QBmH+bfPUQpyccUbGox8MUPnhnlcecIN9QTYmU8ZcbUDSm6N+M
 ltiSuCRPb5wK8GkgK8LULxcD0A8KZIhlfzjTQx6FNaUyhqODBJKixlYsN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="886628"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="886628"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 03:46:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="764697849"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; d="scan'208";a="764697849"
Received: from karthik-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.178])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 03:46:21 -0800
Date: Wed, 6 Dec 2023 12:46:18 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Subject: Re: [PATCH v8 0/8] Improve test coverage of TTM
Message-ID: <ZXBfCkXepcel9vJh@ashyti-mobl2.lan>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
 <ZW9ENFoRHlec4HNE@ashyti-mobl2.lan>
 <817fdcb9-e4f6-4f8d-8311-27b0b5fd444e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <817fdcb9-e4f6-4f8d-8311-27b0b5fd444e@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karolina,

On Wed, Dec 06, 2023 at 12:28:14PM +0100, Karolina Stolarek wrote:
> On 5.12.2023 16:39, Andi Shyti wrote:
...
> > Hi Karolina and Christian,
...
> > > Karolina Stolarek (8): drm/ttm/tests: Add tests for ttm_resource and
> > > ttm_sys_man drm/ttm/tests: Add tests for ttm_tt drm/ttm/tests:
> > >  Add tests for ttm_bo functions drm/ttm/tests: Fix argument in
> > > ttm_tt_kunit_init() drm/ttm/tests: Use an init function from the
> > > helpers lib drm/ttm/tests: Test simple BO creation and validation
> > > drm/ttm/tests: Add tests with mock resource managers drm/ttm/tests:
> > > Add test cases dependent on fence signaling
> > 
> > I see that all these files (and previous patches, as well) don't have
> > a consistent prefix system, like kunit_ttm_*. But they all start with
> > ttm_*, thread_*, drm_*, etc, which makes it a bit difficult to follow
> > and grep through.
> 
> I see what you mean. As for ttm_* part, I decided to keep it as it is
> based on what was in DRM KUnit tests and helpers lib. Almost all
> functions and subtests start with drm_*, and as I'm working on TTM
> tests, ttm_* prefix seemed like a natural choice. With thread_*, I could
> add ttm_kunit_* in front of it, but not sure what would be the benefit
> of doing this.

I do not agree here, ttm_* are related to ttm and not "testing
ttm" and we need to be consistent.

I'd be more inclined to a kunit_ttm_* or ttm_kunit_*.

Anyway, let's hear also what Christian thinks.

> To be honest, I haven't considered using kunit_* prefix here. In the
> code context, it's obvious these are kunit tests, and repeating that
> information would make already long function/struct names even longer.
> 
> I had a quick glance at other KUnit tests in the kernel and this seems
> to be the case, no kunit_* prefixes are used.
> 
> > Can we please maintain a consistent prefix system?
> > 
> > I know it looks bad to come out with it after this series (and previous
> > work too) has been out for several months already. I need to
> > say my "mea culpa" as well as I've been in the review loop, as well.
> 
> After this series, I plan to send a small one to wrap up my work in this
> field. How about adding a TODO to clean these up? I mean, that's
> just how I see it, I'd like to hear Christian's thoughts on this.

nah... a TODO note would be too much... your promise is enough
for me.

Andi
