Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E0BA41D3A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 12:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274F410E29C;
	Mon, 24 Feb 2025 11:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxUDyeUH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A0D10E29C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 11:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740397378; x=1771933378;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6OCRV0xcE71pdQo/ooLcXkgJAkHfA35prjUwXgmdZrU=;
 b=CxUDyeUHphnXEcGy2wGVNhvt3G4ohRAzRJnOOlgVTf1bTG7gDNPnxHwE
 GdE6xSHY7SAW/GABNCeYfpJ/usSvVhHeUp/0RneYevINV1xnFdfnAa7Xr
 BOG6e1/+rIt4fWpzhOeMKlek2uESeM0FfQhCcmYiq3T4aH3yVj/Uis5uC
 b25JFLUZwlQOEddDONU5BViSva7p8bXBuAGoiiUxYJAf44UNvQyZwkY4+
 WXXw1i5CcoxUTmBvOYP4wnfKj8Iikqy76rmHhuCsyG65TBoLengn5pDDA
 Moh3fXuG05zJ/r/sWFotA6M9+AeneWFNXU1RxDN/R2GvqLa907qTl5daH A==;
X-CSE-ConnectionGUID: KG4swZEKTwmaSmLbkLO3Tg==
X-CSE-MsgGUID: xWgDP5V9QYCbrPEgVSePIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="43976432"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="43976432"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 03:42:57 -0800
X-CSE-ConnectionGUID: 1R08KThaTxeJOXqJwi8GWA==
X-CSE-MsgGUID: vjuad0/bQPmWqD5uSM5QeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121306390"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 03:42:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmWrE-0000000EgNc-188V; Mon, 24 Feb 2025 13:42:44 +0200
Date: Mon, 24 Feb 2025 13:42:43 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "pmladek@suse.com" <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z7xbM_8fV4MT_TJ0@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
 <Z7igVXqvRYTVFpXU@smile.fi.intel.com>
 <A373EDB5-528D-4ECF-8CF3-4F96DE6E3797@live.com>
 <Z7jlORk0MiMFTmp6@smile.fi.intel.com>
 <E8256A03-5D13-4B8B-932D-70E734E580FE@live.com>
 <6f7b0886-5f31-4ba9-b82e-e9d3614b504f@suse.de>
 <Z7xAINooeB7zpnhf@smile.fi.intel.com>
 <3AC583EA-AA74-4F75-ADB9-3270519E8448@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3AC583EA-AA74-4F75-ADB9-3270519E8448@live.com>
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

On Mon, Feb 24, 2025 at 11:20:12AM +0000, Aditya Garg wrote:
> 
> > 
> > It would be nice to see the difference in the code generation for the all
> > __packed vs. only those that require it.
> > 
> >> At least it's clear then
> >> what happens. And if your hardware requires this, you can't do much anyway.
> > 
> > One aspect (member level alignment) is clear but the other is not
> > (object level alignment). I dunno if it makes sense to be pedantic about this,
> > but would like to see the binary outcome asked for.
> 
> Hex dump of the compiled binary:

Oh, sorry I wasn't clear. We have a script called bloat-o-meter for these
purposes. Please, run it with old and new binaries as parameters and share the
output.

-- 
With Best Regards,
Andy Shevchenko


