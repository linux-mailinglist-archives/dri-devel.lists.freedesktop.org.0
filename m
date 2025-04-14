Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569BEA87CF7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D19710E544;
	Mon, 14 Apr 2025 10:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LVpAI05x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A006610E544
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744625238; x=1776161238;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ozUToj8hnQBLcBSNJc3tQrsZffoKQypZ8aQtkMPwOXI=;
 b=LVpAI05x/R6gt00tYbj+IHAEXSgrgmqEpF5Rw1S9xL2Phrdvt61R09ev
 Lq1oQYSwh/x9uGoUjM6a7I8qAqRQwwPfZSTjKHXeLM6/ZDMgMyxgTIVyR
 pqKrkVhfkJG3kxJY9x2BA82bsPbQ2SmAuiGPUTJpFT72ze/iRaRNIMCaQ
 4BHN5IK/e91euThNprWgHctLoScpAbFhcsMPvTVPAV5PSyWBxJtmoI6Za
 rt9Dohq2RTyK+g2e0bYjbinCkCe1uiiQ1aY8V2JzGN5CFxG4nt3WC+H2B
 D/izYvvdgFVLWS41TFUXr5YmoH8scQNUDlQLPGUIunq8uEKFkmOTLXmJG w==;
X-CSE-ConnectionGUID: 0VdPiIk1RC2d9kqZ3TTfdA==
X-CSE-MsgGUID: WL9gusE3T1Ow+5GvTcaV+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56268600"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56268600"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:07:18 -0700
X-CSE-ConnectionGUID: EFf+Dns+RL6Rgrz9PTcWjQ==
X-CSE-MsgGUID: ZtfGCfYFQHiJcofNawjWgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134531819"
Received: from smile.fi.intel.com ([10.237.72.58])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 03:07:15 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1u4Gie-0000000CCcE-3dPa; Mon, 14 Apr 2025 13:07:12 +0300
Date: Mon, 14 Apr 2025 13:07:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Avizrat, Yaron" <yaron.avizrat@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>, "Elbaz, Koby" <koby.elbaz@intel.com>,
 "Sinyuk, Konstantin" <konstantin.sinyuk@intel.com>
Subject: Re: [PATCH v3 1/1] accel/habanalabs: Switch to use %ptTs
Message-ID: <Z_zeUAW7u8UgmEOo@smile.fi.intel.com>
References: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
 <Z-PM8oBtTPzqv-S2@smile.fi.intel.com> <87zfh86rqi.fsf@intel.com>
 <81431521-bedf-4361-a222-0e8ec70bea69@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81431521-bedf-4361-a222-0e8ec70bea69@intel.com>
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

On Sun, Mar 30, 2025 at 02:15:50PM +0300, Avizrat, Yaron wrote:
> 
> On 26/03/2025 11:55, Jani Nikula wrote:
> > On Wed, 26 Mar 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >> +Cc: Jani (sorry, forgot to add you in the first place).
> >>
> >> Do you think it's applicable now?
> > Cc: Yaron, Koby, and Konstantin who are supposed to be the new
> > maintainers for accel/habanalabs.
> >
> >
> > BR,
> > Jani.
> 
> Thanks for the help, We’ll verify this change in our CI/CD pipeline and update you ASAP.

What's news, please?

-- 
With Best Regards,
Andy Shevchenko


