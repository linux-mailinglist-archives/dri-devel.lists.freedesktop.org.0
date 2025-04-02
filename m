Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40DFA7905A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201C010E1B8;
	Wed,  2 Apr 2025 13:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjm58qaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F8B10E1B8
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 13:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743602039; x=1775138039;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sFz3S6P+ubR2AXzntU0wmC+tnrCYNAOMsylpPK3blDw=;
 b=fjm58qaID5zXNBx7mV1hPUxo/LtLFqKlLV3QjJkTm72LSwc5pKtPp4cN
 d04DkGsaROH49pK16huL2Co57eM+bAceIVRKY/P2gCDXizseEP70e3iYs
 zTC+zKHCDtnxapIrGenKpz2+kiP6Eox3aifjX3o1a9KNOIlZ3Xwdlg0fu
 /512LvDawQB28yKfe6vluGDI04skG3OsthscyXMxfdE0Kga/szKtWVrYq
 0W/fEC5nwxLCtTQT7MXUkeHBv278wEgcC0Z1oHFh3oOsTuUnuMEZhAbj0
 tFA3sGALNk6qQ05pAWnu1W/OT4H+rCKL+PMeaC1UbVrOGy5CB9BG308iD Q==;
X-CSE-ConnectionGUID: Wy4l+1H+SC2tNlHCPugIHA==
X-CSE-MsgGUID: mvUFUFW+QCWd0XvYOFsmYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="45110364"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="45110364"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 06:53:43 -0700
X-CSE-ConnectionGUID: 4082ts5bRKuIxGU2W4wSOA==
X-CSE-MsgGUID: X4GUFp0PSbS8RF/HpzZwKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127194467"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.73])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 06:53:40 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <20250402130347.GB342109@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com> <877c433bys.fsf@intel.com>
 <20250401194649.GE325917@nvidia.com> <87v7rm203e.fsf@intel.com>
 <20250402130347.GB342109@nvidia.com>
Date: Wed, 02 Apr 2025 16:53:37 +0300
Message-ID: <87r02a1xge.fsf@intel.com>
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

On Wed, 02 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> On Wed, Apr 02, 2025 at 03:56:37PM +0300, Jani Nikula wrote:
>> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
>> > On Tue, Apr 01, 2025 at 10:42:35PM +0300, Jani Nikula wrote:
>> >> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
>> >> > So, I'd suggest a better way to run this is first build the kernel,
>> >> > then mine the gcc -MD output (ie stored in the .XX.cmd files) to
>> >> > generate a list of headers that are actually part of the build, then
>> >> > only test those. That eliminates all the kconfig problems. Opt out any
>> >> > special headers that really have a good reason not to be stand alone.
>> >> 
>> >> I think we'd want the drm headers pass the checks independent of configs
>> >> (apart from CONFIG_DRM). One size doesn't fit all.
>> >
>> > Why? That demand is just making it impossible to make shared
>> > infrastructure, and I don't think DRM should go off and build its own
>> > stuff just for DRM in a way that nobody else can use it.
>> >
>> > If you really, really, care then you can have your makefile codegen an
>> > "allheaders.c" that #includes drm/*.h and compile that.
>> 
>> The v2 series [1] generalizes the header checks and it's no longer in
>> any way dependent on DRM. For starters, each subsystem/driver needs to
>> decide for themselves which headers are to be checked.
>
> Yuk. The idea at the top of this email is alot better. Why don't you
> implement it?

Because quite frankly I don't have the time, and I've already spent a
disproportionate amount of the time I didn't have on hiding the turds on
the existing header test thing this week.

>> This can be expanded with more clever ways to choose the headers to
>> check. But we have to start *somewhere*.
>
> Bah, that argument only works if nobody has better ideas. There are
> meaningful technical problems with your approach, and proposed
> solutions here.

There are also meaningful social problems with the approach of making
people do a lot of stuff they didn't have time to do in the first place,
just to end up not merging any of it ever.

What I've been focusing on is to fix this stuff enough to make it work
for 6.15. If it's accepted, *maybe* I'll look at further improvements
for the next merge window. And if there's enough interest, there's a
baseline for others to build on. But right now, seems to me it could all
just be reverted in a whim, with all the time wasted.


BR,
Jani.

-- 
Jani Nikula, Intel
