Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D976CA7E108
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CFA10E45A;
	Mon,  7 Apr 2025 14:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SL4Ul0p9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF9B10E45A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744035788; x=1775571788;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zTmn5P4FyENhR3+TvfDsp/1/HX1sb8RCnnjZ9N23NDA=;
 b=SL4Ul0p9DWxNk2qqEr6d1BRNkAIN6V42zdxj0kmLliqICk2jSKcAXcrt
 yjRu2bED47IX0k+PD2NU2zRMdix+hudiGyzoVUTU4GW93df60FZCMqxpD
 chCV0YNQjJ9E4lkgku9ZgflPg8QsOXKUN0o8r7l5R0BO5GVERkBW6Fk0f
 VbVZtEpUpUntORAtmML2YAzmx8Gkqw31nMSjkTxWZ38OOKbPFUGGcW4Bh
 xCM96gFyxhh0mMtgeegHDnBe9gaVh4hhX9bX/TQzvhiWfubtonDcubiry
 ydHv+hYkSm8QStgJCqJCy/vEkN9xjmwhWzDsVgrnaplfapxOWZNcjZJAP Q==;
X-CSE-ConnectionGUID: ex7bSSVwR6qi2tu+PQTxvg==
X-CSE-MsgGUID: ILHL1LCnSvGJCxUzdZpz/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56404745"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="56404745"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:23:08 -0700
X-CSE-ConnectionGUID: 0/Np+nHdQzWhFwn8StpAXA==
X-CSE-MsgGUID: vkdJP5xQRfG8NCeg5d7hXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="127952584"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:23:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u1nNJ-0000000A5r6-2o0a; Mon, 07 Apr 2025 17:22:57 +0300
Date: Mon, 7 Apr 2025 17:22:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
 Petr Mladek <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 Kees Cook <kees@kernel.org>, "tamird@gmail.com" <tamird@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH v3 0/3] Use proper printk format in appletbdrm
Message-ID: <Z_PfwShQX95IyHWR@smile.fi.intel.com>
References: <PN3PR01MB9597596DA5DA9FC02825CF0FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_PZXPAklfkMlx6O@smile.fi.intel.com>
 <PN3PR01MB9597E19A55EAFC3E7B191F5FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597E19A55EAFC3E7B191F5FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Mon, Apr 07, 2025 at 02:17:00PM +0000, Aditya Garg wrote:
> > On 7 Apr 2025, at 7:26 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Apr 07, 2025 at 07:05:13PM +0530, Aditya Garg wrote:
> >> The vsprint patch was originally being sent as a seperate patch [1], and
> >> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> >> them via DRM.
> > 
> > Your message is detached from the thread, make sure you use proper tools, e.g.
> 
> It's not a problem with tools, it's a problem with my email provider.
> 
> Microsoft now supports only oauth2 for SMTP, which git send-email doesn't
> support. I had done a few tests using msmtp with git send-email, but msmtp
> also had this detached from thread bug, since it doesn't read the message id
> specified by git send-email. I've been using macOS mail for a long time for
> kernel patches, but since it was a pain to reboot to macOS every time for
> this. So I just tried using thunderbird in Linux this time. Now this time, it
> was a configuration issue in thunderbird, in which it was making a copy of
> the sent email in my sent folder, resulting in 2 copies there. I replied to
> the copied one by mistake. I've finally fixed this issue as well, so should
> be good in future.

There is a project called email-oauth2-proxy, which makes it transparent, so
just take your time and configure your box or find another email provider.
The above is not an excuse to break the process.

> > `git format-patch --thread --cover-letter -v3 ...` gives the correct result.

-- 
With Best Regards,
Andy Shevchenko


