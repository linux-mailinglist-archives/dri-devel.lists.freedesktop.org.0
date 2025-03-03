Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B059A4BC44
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 11:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACB310E160;
	Mon,  3 Mar 2025 10:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpNIV84s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C15D10E160
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740997911; x=1772533911;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=x7bNnIH0N9XXrP4dc2Yr5ges+LomEyPKmnx/zRPInOM=;
 b=LpNIV84sXwwwaobwpAO7U5A33NFGHodsYgRPYx3Ly6+TjmsbQAPEb1+k
 6Rg0aDJYj5RolcmvxPCdr6hHycULbQwFqBGOmOEWUrYubGlTzOIhLd25x
 QB8j+V3hYoWH5ewaMEKN01ePAIo48yGn+BmVujQ8/9JFKupmuFLQSL/1l
 b/j4qW4X3yO/1kKyovCk1H0GKm2orqdf92CN5jDiKkJ6k6bhYk1q8EYl0
 3ywwDV9aKVKLPwB38Z4+2DgilyhBnoblpQ25hM4T/7DfqVx1SD2JC9leM
 yKL1uLGed7cvwoWBM6kn98/fvrnSbe2NBRPZIHY77MydTjU12KUHAa8XX g==;
X-CSE-ConnectionGUID: rWiWxQTISg+RWlhFYnlL4w==
X-CSE-MsgGUID: E5rCv7pqQACN7Be+3vIIBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="53256756"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="53256756"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 02:31:49 -0800
X-CSE-ConnectionGUID: kwoRTYPBSy+dkMbhO+ys1w==
X-CSE-MsgGUID: 6doOexc1T6KsNEMMhJQJ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="117996022"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 02:31:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tp35M-0000000GmSA-1Q73; Mon, 03 Mar 2025 12:31:44 +0200
Date: Mon, 3 Mar 2025 12:31:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Raag Jadav <raag.jadav@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Cleanup io.h
Message-ID: <Z8WFEC2-kBwSYFDX@smile.fi.intel.com>
References: <20250221050804.2764553-1-raag.jadav@intel.com>
 <2342b516-2c6e-42e5-b4f4-579b280823ba@app.fastmail.com>
 <Z7iuulG0Ltoltl8F@smile.fi.intel.com>
 <f6eb011b-40fb-409a-b2b2-a09d0e770bbd@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6eb011b-40fb-409a-b2b2-a09d0e770bbd@app.fastmail.com>
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

On Fri, Feb 21, 2025 at 06:15:30PM +0100, Arnd Bergmann wrote:
> On Fri, Feb 21, 2025, at 17:50, Andy Shevchenko wrote:
> > On Fri, Feb 21, 2025 at 11:15:47AM +0100, Arnd Bergmann wrote:
> >> As you already found, removing an old indirect #include that is
> >> no longer needed usually leads to some files breaking. The more
> >> impactful your change is in terms of build speed, the more
> >> things break! I think in this case, removing linux/err.h and
> >> linux/bug.h made very little difference because they are very
> >> small files in terms of what else they include.
> >
> > While this is all true, removing unneeded inclusions rarely can lead to the
> > "extra work with a little gain". When there is a replacement to the low
> > level ones, it's also an improvement in my opinion and won't be harmful in
> > the future. But I agree, that the stuff is way too tangled already and requires
> > an enormous work to untangle it, even if doing it structurally.
> 
> The problem I see with prematurely applying small improvements like this
> one is that they always cause build regressions, at least if the change
> is any good. If we can find some more impactful changes like this one,
> we can group them together in a branch and test them a lot better before
> they even reach linux-next.
> 
> I mainly want to avoid people getting angry at Raag for repeatedly
> breaking their subsystems by pushing small patches one at a time.
> 
> > Do you have your scripts for the showed statistics being published somewhere?
> 
> I had a good set of scripts on an older machine and might still
> have some backups of that somewhere, but just hacked up something
> ad-hoc today beased on what I remembered from that time. Here
> are the snippets that you might find useful.

Thank you!

-- 
With Best Regards,
Andy Shevchenko


