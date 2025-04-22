Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C22AA9602F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 09:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3258710E524;
	Tue, 22 Apr 2025 07:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kM4lIeci";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5540410E522;
 Tue, 22 Apr 2025 07:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745308666; x=1776844666;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/lTSfM6Y/HISGvvFEVe3OPn45W9JT8OSQOcThg92+mw=;
 b=kM4lIeciaxlpZlYb7okEhzF8HkYolRAlaqKtFn4gPhuH1htSSR07SJiY
 YGcVlJvI0JyKYGKVw/GrdARqSAN0rwAfwIhyBHL+jc+yQJLSV/4T+5mbh
 bTPo22llhB1g3mZS3c7eKoSFAhvaUWay6IyGmhwS5ASYqGsamfBczOGnX
 a1BqDxLU/RbXO0QTjK07RRa8oUb6vwId2JLhwcI2WlGo6+8cSZj4LOtmr
 VojBWjhd9eOO8SKi5hE3ZKoXueyb+Upk8YNXCqMz2HEL+SAxyZVcoCkW6
 pZ5HwkMewiY60fGc3Fek1RJQAPec5nVin7lHRfiVLkW8VmydmfUccXnQa w==;
X-CSE-ConnectionGUID: 6COGn/1+SOOiOf1cW/2WLA==
X-CSE-MsgGUID: NXooZrzqRwe0AF9OILrTyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="45975723"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="45975723"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 00:57:42 -0700
X-CSE-ConnectionGUID: VwpwCzHATKWg4vMQsHRvBA==
X-CSE-MsgGUID: rRtq3f3OR6ypAGEepqkY5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132482014"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 00:57:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1u78VZ-0000000EfNZ-26c4; Tue, 22 Apr 2025 10:57:33 +0300
Date: Tue, 22 Apr 2025 10:57:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Don't create Python bytecode when building the
 kernel
Message-ID: <aAdL7aEcbulV9lsA@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4k2arpghozy5fjrjove6nrh24qth3yp4educuso4y47gk7gycd@ol27dzrba55d>
 <87bjspzd4e.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjspzd4e.fsf@trenco.lwn.net>
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

On Mon, Apr 21, 2025 at 10:35:29AM -0600, Jonathan Corbet wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> writes:
> > On Wed, Apr 16, 2025 at 03:51:03PM +0800, Mauro Carvalho Chehab wrote:
> >> 
> >> As reported by Andy, the Kernel build system runs kernel-doc script for DRM,
> >> when W=1. Due to Python's normal behavior, its JIT compiler will create
> >> a bytecode and store it under scripts/lib/*/__pycache__. 
> >> 
> >> As one may be using O= and even having the sources on a read-only mount
> >> point, disable its creation during build time.
> >
> > Would it be possible to properly support O= and create pyc / pycache
> > inside the object/output dir?
> 
> I have to confess, I've been wondering if we should be treating the .pyc
> files like we treat .o files or other intermediate products.  Rather
> than trying to avoid their creation entirely, perhaps we should just be
> sure they end up in the right place and are properly cleaned up...?
> 
> To answer Dmitry's question, it seems that setting PYTHONPYCACHEPREFIX
> should do the trick?

It's not so easy. The Python is written in a way that it thinks it will never
runs object files separately from the source. Hence that variable sets only
the folder per script as _home_ for the cache. It's completely unusable. They
took it wrong. It still can be _painfully_ used, but it will make Makefiles
uglier.

-- 
With Best Regards,
Andy Shevchenko


