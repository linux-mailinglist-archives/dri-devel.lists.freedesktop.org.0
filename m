Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B53AA7E1F9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 16:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3857B10E484;
	Mon,  7 Apr 2025 14:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBO9TyXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9130810E484
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 14:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744036683; x=1775572683;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gaqCmPGyFFrl7wtrmHGJykIupKENxWSgvwIml4rhHuQ=;
 b=BBO9TyXZYHafo5iCC+aMMGYRUvjhoQ+p4VnBMIqcHfmVn6goOhuAFvbg
 u2EKVugmeJlkdUgIq8vLeacJd1Y24+Yc7ycUqXHblsiEERXNxiQON8uxZ
 Nm5+BuHYGzQRyPEd+vRvwEeFsfatycEc6Z9n92Hdzitm8i9d/nsntzLlz
 f3pcEoB5aoFhTR876SDb131j1fmf0Z49TkBCx/2peurEywjTgHKciyAbe
 A3tc2G3JjuflSkObN3OgZU8HwFBQ3U8cOZzKZKmI2jVlDQ7eIa+DoJWJs
 +DIGgv5qZVtaKCzuvwsBZV8uR9m830m2LRRF7n+KXQBYXZ2Q61CRJESP9 A==;
X-CSE-ConnectionGUID: yyg0q/SvQWeWN+Yu3Cmnqw==
X-CSE-MsgGUID: MtBGIBR4SAC+zxe3FLd5Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55616149"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="55616149"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:38:02 -0700
X-CSE-ConnectionGUID: IKY4xDJ9SPqBBwld+K/TWA==
X-CSE-MsgGUID: 7+kZ3K5kQMO34kjDQq8XXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="128840982"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 07:37:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u1nbk-0000000A66o-0cqX; Mon, 07 Apr 2025 17:37:52 +0300
Date: Mon, 7 Apr 2025 17:37:51 +0300
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
Message-ID: <Z_PjP_fck57S1ACi@smile.fi.intel.com>
References: <PN3PR01MB9597596DA5DA9FC02825CF0FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_PZXPAklfkMlx6O@smile.fi.intel.com>
 <PN3PR01MB9597E19A55EAFC3E7B191F5FB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_PfwShQX95IyHWR@smile.fi.intel.com>
 <PN3PR01MB9597227004F9472689FA6395B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597227004F9472689FA6395B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Mon, Apr 07, 2025 at 07:57:08PM +0530, Aditya Garg wrote:
> On 07-04-2025 07:52 pm, Andy Shevchenko wrote:
> > On Mon, Apr 07, 2025 at 02:17:00PM +0000, Aditya Garg wrote:
> >>> On 7 Apr 2025, at 7:26 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >>> On Mon, Apr 07, 2025 at 07:05:13PM +0530, Aditya Garg wrote:

> >>>> The vsprint patch was originally being sent as a seperate patch [1], and
> >>>> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> >>>> them via DRM.
> >>>
> >>> Your message is detached from the thread, make sure you use proper tools, e.g.
> >>
> >> It's not a problem with tools, it's a problem with my email provider.
> >>
> >> Microsoft now supports only oauth2 for SMTP, which git send-email doesn't
> >> support. I had done a few tests using msmtp with git send-email, but msmtp
> >> also had this detached from thread bug, since it doesn't read the message id
> >> specified by git send-email. I've been using macOS mail for a long time for
> >> kernel patches, but since it was a pain to reboot to macOS every time for
> >> this. So I just tried using thunderbird in Linux this time. Now this time, it
> >> was a configuration issue in thunderbird, in which it was making a copy of
> >> the sent email in my sent folder, resulting in 2 copies there. I replied to
> >> the copied one by mistake. I've finally fixed this issue as well, so should
> >> be good in future.
> > 
> > There is a project called email-oauth2-proxy, which makes it transparent, so
> > just take your time and configure your box or find another email provider.
> 
> I already have a way to get oauth2 tokens for Outlook, something similar to this.
> 
> > The above is not an excuse to break the process.
> 
> It was an honest mistake, and I just said I managed to fix it and should be
> good in the future right?

Sure!

> >>> `git format-patch --thread --cover-letter -v3 ...` gives the correct result.

-- 
With Best Regards,
Andy Shevchenko


