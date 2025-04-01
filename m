Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20241A782DB
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 21:42:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE4810E664;
	Tue,  1 Apr 2025 19:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AhQQ9wbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D06410E664
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 19:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743536561; x=1775072561;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pQxv5Dt51GqwzaRvw88SWAtlH92vzbXWDPb6VUXwIJM=;
 b=AhQQ9wbTob9rwp0MoumlT8wl5ZBGYukBFsOpQwcd1vD203Eutre4p53p
 1pSWWfQvupkFN5iVB48rCmvTOyqMCdit/hAwKhY+eDUuW6VMyePMztdov
 7yiXtWNUJAp6VEoa6+2HFtb0k3e7yynhbGjcQD+3YTCCIn9aByUKyb7lI
 CGcfwZWnCOX54ZZ45i0TjWJ13a2BN9mwiN0bJLLyn+7LB+o9iwnfpl1Ne
 O6weNY3U7X+nyMZWOFChZB7icHFnC4M87nZYURNYylSbQqqTqzjO+jTBk
 3i4Z4W5Ap4t/yA/AoJzBdNXZiFRgyvOTSkWcAk2e5hF+NhDWhjaY+gEBB A==;
X-CSE-ConnectionGUID: WzWQU0JxT5iX5gmbLk5UDg==
X-CSE-MsgGUID: V/6eK6OwSkWrmiK9oByHMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55538376"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="55538376"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:42:41 -0700
X-CSE-ConnectionGUID: TMKqicpOQbePKXBHOY1KMQ==
X-CSE-MsgGUID: qf68Du+PRm29D1/ggkQhQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; d="scan'208";a="157421072"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 12:42:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Dave Airlie
 <airlied@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
In-Reply-To: <20250401191455.GC325917@nvidia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com>
Date: Tue, 01 Apr 2025 22:42:35 +0300
Message-ID: <877c433bys.fsf@intel.com>
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
> So, I'd suggest a better way to run this is first build the kernel,
> then mine the gcc -MD output (ie stored in the .XX.cmd files) to
> generate a list of headers that are actually part of the build, then
> only test those. That eliminates all the kconfig problems. Opt out any
> special headers that really have a good reason not to be stand alone.

I think we'd want the drm headers pass the checks independent of configs
(apart from CONFIG_DRM). One size doesn't fit all.

BR,
Jani.


-- 
Jani Nikula, Intel
