Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEB0A7F9DC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 11:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007A410E1C5;
	Tue,  8 Apr 2025 09:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiOzex8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA54010E24A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744105141; x=1775641141;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6jLG1OuuXBJUAHnNSfsPLbzl7/d33svlvvDOppltdO0=;
 b=NiOzex8Ecp+VLncOpgDeuI+t3jyoPz1+t5RX4WwTzrbvqBlVuHwasiRy
 RVBdGGDKveJZHZyXRNq/QqXDhgMvN3jNwghiO8kDzsR+X8m+fJlDIPlL2
 IKO6jJdLkfejB6NbAunMQqKqRFvmmMeQ/7aVXuekdP+1N+f1GEkoDD0CB
 60mfxp8Gu4WZ59WaIRtPcKgtYcZ9pQbG7/K7BQn6Nfcx9t4pq+3nN5cR/
 Tio/IUuooIojm2LSk6XmfD6Rg48GeoCz2/xXPInddYg9K8o5HiwqZWaCk
 mPkFlrukczr9XbOIwGhBNh/kUJ2GzIWgOK2w/BItnjsx00IVt89y1xs2Q g==;
X-CSE-ConnectionGUID: xZ+APLKoQM6T6Dd8BgE72g==
X-CSE-MsgGUID: G+p3di4JTL6ONjgOyRfXSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45646557"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="45646557"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 02:39:00 -0700
X-CSE-ConnectionGUID: 5VuIt83cTS6l6lfkb4k9BQ==
X-CSE-MsgGUID: T0BBoRTrT+Wxe1dWjZB5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="129076090"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 02:38:55 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u25Pu-0000000AM6i-3NlY; Tue, 08 Apr 2025 12:38:50 +0300
Date: Tue, 8 Apr 2025 12:38:50 +0300
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
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Message-ID: <Z_TuqoRpTrjN07zo@smile.fi.intel.com>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_ThPOOKXa3VwvmO@smile.fi.intel.com>
 <PN3PR01MB959761E1B759183D83C1AC33B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB959761E1B759183D83C1AC33B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Tue, Apr 08, 2025 at 08:52:10AM +0000, Aditya Garg wrote:
> > On 8 Apr 2025, at 2:11 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Apr 08, 2025 at 12:17:13PM +0530, Aditya Garg wrote:
> >> The vsprint patch was originally being sent as a seperate patch [1], and
> >> I was waiting it to be taken up. But as suggested by Petr, I'm sending
> >> them via DRM.
> > 
> > You need to do something about your tools, really.
> 
> Uhh, I'll just revert to the tried and tested macOS mail.
> 
> Although I don't think a resend is necessary here now.

I dunno. If people are using `b4`, it might mess up the patch ordering,
I haven't checked this myself (it depends if it takes [PATCH x/y] or message
threading into account first).

It seems not a big deal with _this_ series, but for the future it may be really
a problem (esp. from [runtime] bisectability point of view).

> > Now it's patch 3 threaded to patch 1, while the rest, including cover letter,
> > seems okay.

-- 
With Best Regards,
Andy Shevchenko


