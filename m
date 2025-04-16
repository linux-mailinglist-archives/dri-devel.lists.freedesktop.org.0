Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD3DA8B5C1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEC310E8BC;
	Wed, 16 Apr 2025 09:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m9Xr+Qzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D1010E8B9;
 Wed, 16 Apr 2025 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744796497; x=1776332497;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AoNhNoPjPMwVxdK0S/wXtvG9FCv+5FT+NuSD7HNXUqM=;
 b=m9Xr+Qzdo6WFCyFKG/CrYJGHhaVNikoFWbmY6BBckBkKjbI8Dylt2ApB
 nY43pDds4fxrZLtHTfvaUb+Ly1AjDgiaohJQHZ7Qlu1qMsXXeyC3pQ+FK
 UtbRQLHQRgfGsOUyJsErUMPnLeHjwLUY1fniSln59fTGBWObVwTbd9ELI
 D5nJfneFkt2aWvgmWDUKw1otwwk9bwfC+vTMJvhT0g22oQ5wwGOODNANE
 yrJUenizkAiBJHebSCm0oxGidEnOK/gtsquY8IbvS8FrKCyOpSRr4vp0V
 wBnq/LWBTdDf599BqphrXJ+cicL1kDCP/RcHPLU1+ozLMeO92D9UdLqx7 A==;
X-CSE-ConnectionGUID: ydjgwS8yRIi48ongaVa2WQ==
X-CSE-MsgGUID: XgDapbD+QXKXSKnoeGx8og==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46469868"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46469868"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:41:37 -0700
X-CSE-ConnectionGUID: lPbXkUJqTEGp/PB5o3PQ1Q==
X-CSE-MsgGUID: 0SlJYQCHRKiaWMv6fQqysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="134494528"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 02:41:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1u4zGr-0000000CoME-2iHK; Wed, 16 Apr 2025 12:41:29 +0300
Date: Wed, 16 Apr 2025 12:41:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] scripts/kernel-doc.py: don't create *.pyc files
Message-ID: <Z_97SbBwVp29MNzL@smile.fi.intel.com>
References: <cover.1744789777.git.mchehab+huawei@kernel.org>
 <4ad5eb8d4b819997c1615d2401581c22a32bb2c1.1744789777.git.mchehab+huawei@kernel.org>
 <87tt6opks7.fsf@intel.com> <20250416171917.0985c0eb@sal.lan>
 <20250416172901.60104103@sal.lan> <20250416173811.71c3c345@sal.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416173811.71c3c345@sal.lan>
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

On Wed, Apr 16, 2025 at 05:38:11PM +0800, Mauro Carvalho Chehab wrote:
> Em Wed, 16 Apr 2025 17:29:01 +0800
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

...

> Heh, trying to quickly write a patch before calling it a day is
> usually not a good idea ;-)
> 
> I'll send a fix tomorrow.

Take your time, we still have a couple or so weeks to address this.

-- 
With Best Regards,
Andy Shevchenko


