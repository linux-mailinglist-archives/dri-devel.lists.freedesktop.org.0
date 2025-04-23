Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091CA99528
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 18:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B89510E224;
	Wed, 23 Apr 2025 16:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlvTPiQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C10610E219;
 Wed, 23 Apr 2025 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745425906; x=1776961906;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rHHe/8RhyPpADAv2wMNhicCGW725SUetgJ9BCqcDqjo=;
 b=hlvTPiQdzoIL0kWzctuYARFsIG5qYFAZMKyaO9Z3I3N9GtrkahbozY5h
 XzkkPvPMSgr2JpegPJbE589iV11E5ZZY8v+7/i98yHhcNLLysBPqi8qjw
 RK+XG7d/57aG94XEBxHOlJr01cipjtjovzezTyT9XNjT/Pc4dVnzCgqGZ
 0HC+19xN8oYzsTMlGo0LKpJCRNXy3oDD2CCs5MeLuTqdxm98Dcx/AGvos
 9dXJn1jivbpEiOGShMrecVZerLmq652Jww5B4TjsNZYqYgEIEVLGIUitO
 ofgbZv+yBshnrR/23Q+mciFE0Jtf9qLWcC7TsPuVuhIHFZg3L/3HFdEUz g==;
X-CSE-ConnectionGUID: nlurddbgQ9a/eD4s8m50WA==
X-CSE-MsgGUID: OcF3gdOBRQug+TkxuzBS/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50830451"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="50830451"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 09:31:46 -0700
X-CSE-ConnectionGUID: uLr7sJu1QAGKYY4H1GMrRw==
X-CSE-MsgGUID: Rzl/IukPSwmtIFv8RfavZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137220613"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 09:31:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1u7d0a-0000000F7Fm-3nZd; Wed, 23 Apr 2025 19:31:36 +0300
Date: Wed, 23 Apr 2025 19:31:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: airlied@gmail.com, corbet@lwn.net, dmitry.baryshkov@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 masahiroy@kernel.org, mchehab+huawei@kernel.org, mripard@kernel.org,
 nathan@kernel.org, nicolas.schier@linux.dev, rodrigo.vivi@intel.com,
 simona@ffwll.ch, tursulin@ursulin.net, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Message-ID: <aAkV6Kl3BX1TmMxl@smile.fi.intel.com>
References: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
 <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cc4d9dd-496e-4512-a683-272b1b84d98b@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Apr 23, 2025 at 06:30:48PM +0900, Akira Yokosawa wrote:
> On Tue, 22 Apr 2025 10:57:33 +0300, Andy Shevchenko wrote:
> > On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote:
> >> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:

[...]

> >> > Would it be possible to properly support O= and create pyc / pycache
> >> > inside the object/output dir?
> >> 
> >> I have to confess, I've been wondering if we should be treating the .pyc
> >> files like we treat .o files or other intermediate products.  Rather
> >> than trying to avoid their creation entirely, perhaps we should just be
> >> sure they end up in the right place and are properly cleaned up...?
> >> 
> >> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
> >> should do the trick?
> > 
> > It's not so easy. The Python is written in a way that it thinks it will never
> > runs object files separately from the source. Hence that variable sets only
> > the folder per script as _home_ for the cache. It's completely unusable. They
> > took it wrong. It still can be _painfully_ used, but it will make Makefiles
> > uglier.
> 
> But, PYTHONPYCACHEPREFIX can be set as an environment variable.
> 
> For example, try:
> 
>     export PYTHONPYCACHEPREFIX="$HOME/.cache/__pycache__"
> 
> Wouldn't it be good enough for you?

Of course not. We have _many_ scripts in python in kernel and having a cache
there for _all_ of them is simply WRONG. You never know what clashes can be
there with two complicated enough scripts which may have same module names,
etc.

-- 
With Best Regards,
Andy Shevchenko


