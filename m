Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90F0A78F31
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 14:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8CF10E78D;
	Wed,  2 Apr 2025 12:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VPtvECeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8AA10E78D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 12:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743598604; x=1775134604;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FjzOvE9PaUyfXrgrVS5tNkvoFHbB1LjntcPMfhap/HA=;
 b=VPtvECeCjrHcKZEHvVzCocg9/c8TZQNGTZhpXWAn2lbmvUXDg9PyhgOS
 fCp1iLixIjkaChCmPbnkqVSNunoQjtxF3x2EE/ivW5vtGzGdKYmgU3HwQ
 aUMgQd0rzMvSfXFnFny32tbQfT4VoO73yiShG0JXCG4V/quth7iwk35SP
 b0NODX8Cah0wI+Xn+RXKmQ+MtLG7R51groOiQ3wD1fEibHtaJejx5MdsR
 YWWmXgt9KGaJfRRo8vtgb6/49t8vtCban9CRCBTTAT2Y6EK/cPRKrh8b1
 Oj7CGcMuJ8+zIdQkyX6wrF6vnn07BkhJOkbsFzJkow8KLaV6Daw/Qmc0B g==;
X-CSE-ConnectionGUID: DSDeAbW9Q7qeR+JaNMYIDA==
X-CSE-MsgGUID: vXvANMftQK2BQr7e3EWurA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56335706"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="56335706"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:56:43 -0700
X-CSE-ConnectionGUID: p9JxLazqQLey8Qdj6oqRnQ==
X-CSE-MsgGUID: Y2dyzab3Q4ScnjG1NblWbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="130804632"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 05:56:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <20250401194649.GE325917@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com> <877c433bys.fsf@intel.com>
 <20250401194649.GE325917@nvidia.com>
Date: Wed, 02 Apr 2025 15:56:37 +0300
Message-ID: <87v7rm203e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Tue, Apr 01, 2025 at 10:42:35PM +0300, Jani Nikula wrote:
>> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
>> > So, I'd suggest a better way to run this is first build the kernel,
>> > then mine the gcc -MD output (ie stored in the .XX.cmd files) to
>> > generate a list of headers that are actually part of the build, then
>> > only test those. That eliminates all the kconfig problems. Opt out any
>> > special headers that really have a good reason not to be stand alone.
>> 
>> I think we'd want the drm headers pass the checks independent of configs
>> (apart from CONFIG_DRM). One size doesn't fit all.
>
> Why? That demand is just making it impossible to make shared
> infrastructure, and I don't think DRM should go off and build its own
> stuff just for DRM in a way that nobody else can use it.
>
> If you really, really, care then you can have your makefile codegen an
> "allheaders.c" that #includes drm/*.h and compile that.

The v2 series [1] generalizes the header checks and it's no longer in
any way dependent on DRM. For starters, each subsystem/driver needs to
decide for themselves which headers are to be checked. For DRM, it's
everything. Others can do as they please. And they can do so in their
Makefiles depending on configs too (actually drm/xe does this).

This can be expanded with more clever ways to choose the headers to
check. But we have to start *somewhere*.


BR,
Jani.


[1] https://lore.kernel.org/r/20250402124656.629226-1-jani.nikula@intel.com


-- 
Jani Nikula, Intel
