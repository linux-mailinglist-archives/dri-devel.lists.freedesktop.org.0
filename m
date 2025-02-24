Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6302AA41EE2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 13:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E71110E263;
	Mon, 24 Feb 2025 12:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F+ghrYib";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEEC10E263
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740400073; x=1771936073;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ehOS2DLAOvq4B8Dskw4jr188VJvBUk4de8iEqUYAzYs=;
 b=F+ghrYib7FPRocrDBQynS6L5oX+WZjeCzh0LedgcPlZVdXWN35/T0CH4
 aCXul5g6ddoKOz7PjtOGhkXCzH6TpYWw6kOtrM8z5to0m2oiSgSY0FCTg
 WAZSaILPuOF6Qisl6J0FiQ3/+tokL3pwdQ8VX4j1lRjH5np4bqVjDVMZi
 Ha1cRlgrGg9VVppMaPMqe/muhsUNBZ487hMavPia6zjP5W/ZRa833FsoU
 OJGnbED+O2BcQBjT0uWr8umrJg3znW2TKXOPlyfvIGY9mDr//o9Za+aFM
 8Xts1aqS7CSp6otYy4uh9h1Kkykd64PfKacbIWgvfipATtujtVKAL8lZz w==;
X-CSE-ConnectionGUID: rXZlCRLNSx2Z7oPp/S5tdA==
X-CSE-MsgGUID: V0TfHXPhTzG+i3KRqicSrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41167283"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="41167283"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 04:27:51 -0800
X-CSE-ConnectionGUID: +wIC8x9qQB+3KPPmx2a0kQ==
X-CSE-MsgGUID: P3FUKr/gTjOYv49VEZlpSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="116553489"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 04:27:43 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tmXYg-0000000EgzJ-2Ka1; Mon, 24 Feb 2025 14:27:38 +0200
Date: Mon, 24 Feb 2025 14:27:38 +0200
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
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>,
 Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Message-ID: <Z7xluhcEA-VS22kK@smile.fi.intel.com>
References: <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
 <Z7igVXqvRYTVFpXU@smile.fi.intel.com>
 <A373EDB5-528D-4ECF-8CF3-4F96DE6E3797@live.com>
 <Z7jlORk0MiMFTmp6@smile.fi.intel.com>
 <E8256A03-5D13-4B8B-932D-70E734E580FE@live.com>
 <6f7b0886-5f31-4ba9-b82e-e9d3614b504f@suse.de>
 <Z7xAINooeB7zpnhf@smile.fi.intel.com>
 <3AC583EA-AA74-4F75-ADB9-3270519E8448@live.com>
 <Z7xbM_8fV4MT_TJ0@smile.fi.intel.com>
 <PN3PR01MB95974767785F92606B5EA96EB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB95974767785F92606B5EA96EB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Mon, Feb 24, 2025 at 11:57:47AM +0000, Aditya Garg wrote:
> > On 24 Feb 2025, at 5:13 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Mon, Feb 24, 2025 at 11:20:12AM +0000, Aditya Garg wrote:
> >> 
> >>> It would be nice to see the difference in the code generation for the all
> >>> __packed vs. only those that require it.
> >>> 
> >>>> At least it's clear then
> >>>> what happens. And if your hardware requires this, you can't do much anyway.
> >>> 
> >>> One aspect (member level alignment) is clear but the other is not
> >>> (object level alignment). I dunno if it makes sense to be pedantic about this,
> >>> but would like to see the binary outcome asked for.
> >> 
> >> Hex dump of the compiled binary:
> > 
> > Oh, sorry I wasn't clear. We have a script called bloat-o-meter for these
> > purposes. Please, run it with old and new binaries as parameters and share the
> > output.

> aditya@MacBook:~/linux$ ./scripts/bloat-o-meter $PACKED $UNPACKED
> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> Function                                     old     new   delta
> Total: Before=13286, After=13286, chg +0.00%

Thanks! That shows that __packed can be used for all protocol related data
types. Just mention in the commit message that the __packed, even if not
needed, is: a) for the consistency, b) not affecting code generation in
accordance with bloat-o-meter.

-- 
With Best Regards,
Andy Shevchenko


