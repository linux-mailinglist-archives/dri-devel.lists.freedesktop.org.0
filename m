Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4626480A806
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:00:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5E110E084;
	Fri,  8 Dec 2023 16:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B60910E084
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702051244; x=1733587244;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=+EXHcrZrZBDOueveSwNkypo7KesWZ6TZf0l97Fvq+84=;
 b=Zu55dFBXVVa6V0OmY7PgeyxiNTadM8qBbZsPRwA1de6spH4VJ3t1/A8T
 hIfF4wh0WBCmRUwctyl8EyND8ZjiuCboGt47sKNfStwxur59LejkZY/lc
 r2pjGRdgNP8PY20koBc+QDOz+EBlDSaWqysgBQFp1sxSZzFkSdkjRmzIp
 6DNz/2xuJFSadq/kHvP0tlBPmpBI3DouaUohFRtLLoDyydqRHRnEF3G1i
 tbdHFLjUuo2JGrZ1FaXkA2vII0Kxg17frNQlrlYvlTK+pNfQJm6f85OZF
 gADS6+JTbC3ZJ/60biNhMY5qbVtLfh4gL0zQu2Y4zv+zV1bkM8RF1BvNe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1244979"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="1244979"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 08:00:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1019381416"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="1019381416"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 08:00:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1rBdHI-000000047LX-3TqS; Fri, 08 Dec 2023 18:00:36 +0200
Date: Fri, 8 Dec 2023 18:00:36 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: State of affairs with Ilitek 9341 support
Message-ID: <ZXM9pG-53V4S8E2H@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: David Lechner <dlechner@baylibre.com>, Priit Laes <plaes@plaes.org>,
 Dillon Min <dillon.minfei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Included authors and latest (non-white-space) contributors to the drivers
in question along with relevant mailing list and respective (active in the
area) maintainers.

I already had risen the question in times when 4th (sic!) driver for the same
hardware was about to be pulled into upstream that we have to somehow reduce
the code base and unify device properties.

So, the main question here "What is the plan and where are we now?"

I admit that fbtft case is special as it supports, in particular, platform
device (parallel interface) and also well established in the embedded world.
What about the rest?

N.B. Besides the fact that panel drivers are too OF-centric, which is bad
practice for the new kernel code in general and has to be stopped. I.o.w.
seeing of_property_*() or alike in the driver after ca. 2020 should be
immediate NAK unless it's very well justified why it may not be used on
non-OF systems.

-- 
With Best Regards,
Andy Shevchenko


