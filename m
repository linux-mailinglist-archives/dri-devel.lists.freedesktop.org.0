Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C078B2492
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 17:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C30311A520;
	Thu, 25 Apr 2024 15:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEIKu4Eo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA67D11A51E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 15:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714057498; x=1745593498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ebs59IXexhzqLXqVggapRFuVaAJDANXqVUimkFuzG2I=;
 b=EEIKu4Eov+xtIbAUMByelqaVYNn+95PMWNES9FukOmIkv+aqXHLM1oZg
 LYYrHfzOY3jw2jDDKplEcE/RmKmg7k11ZXe0J6Eam1RAPhqrE3KvTKiPw
 TvTthpFUdFl82fMrlpKsnEmFUNK60dPskG8WbKZnB092yi3sLHVdniK3X
 7kmRtpOEXAEeAeOyEJ4vTlMoXSmMKfpCHqlzpNUwLGffX0r7e1TcaWcia
 eclWTk7DoijBxl1+3BaAv9RdeNOxUl7dc703Oj3D9TsUR32i1Pggs67d2
 M3L0yVZRP7VPyltvEBnIbp3beft1kkwYbOxWgImB4X+gVKcyEy97GoZ0F w==;
X-CSE-ConnectionGUID: kPPWJ/oeTJ+wt/GcB0NNqA==
X-CSE-MsgGUID: 7o7MF410Qke53M2gyeVB0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="27206839"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="27206839"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 08:04:57 -0700
X-CSE-ConnectionGUID: dj7BiCPeTHSZbsuGpPWT7A==
X-CSE-MsgGUID: JTzKIusPSDCIclQtHdW4rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="29887001"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 08:04:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s00eY-000000012AE-3W0q; Thu, 25 Apr 2024 18:04:50 +0300
Date: Thu, 25 Apr 2024 18:04:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 David Lechner <dlechner@baylibre.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/1] drm/ili9341: Remove the duplicative driver
Message-ID: <ZipxEk9Lpff1kB7b@smile.fi.intel.com>
References: <20240425124208.2255265-1-andriy.shevchenko@linux.intel.com>
 <20240425-perky-myrtle-gorilla-e1e24f@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240425-perky-myrtle-gorilla-e1e24f@penduick>
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

On Thu, Apr 25, 2024 at 04:58:06PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Thu, Apr 25, 2024 at 03:42:07PM +0300, Andy Shevchenko wrote:
> > First of all, the driver was introduced when it was already
> > two drivers available for Ilitek 9341 panels.
> > 
> > Second, the most recent (fourth!) driver has incorporated this one
> > and hence, when enabled, it covers the provided functionality.
> > 
> > Taking into account the above, remove duplicative driver and make
> > maintenance and support eaiser for everybody.
> > 
> > Also see discussion [1] for details about Ilitek 9341 duplication
> > code.
> > 
> > Link: https://lore.kernel.org/r/ZXM9pG-53V4S8E2H@smile.fi.intel.com [1]
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> I think it should be the other way around and we should remove the
> mipi-dbi handling from panel/panel-ilitek-ili9341.c

Then please do it! I whining already for a few years about this.

> It's basically two drivers glued together for no particular reason and
> handling two very different use cases which just adds more complexity
> than it needs to.
> 
> And it's the only driver doing so afaik, so it's definitely not "least
> surprise" compliant.

-- 
With Best Regards,
Andy Shevchenko


