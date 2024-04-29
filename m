Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E40A28B5808
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 14:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DAE10E5F0;
	Mon, 29 Apr 2024 12:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfN9xvJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F88810E686
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714393198; x=1745929198;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CjtZnAARk7MKINso2pTgQybSMs6C5wNrBPWS1UNyhEI=;
 b=YfN9xvJ2u7XoDEhwinQb5vQG0+M9BWiMm0nlN2hx4Oxc/TVtc127RKkU
 B2xy7hq2RQb5opgXf+Lm5ecZnpIK0cTRb+COTFkYSvvR5+HEh6ZGLATBX
 IOWBXBs9afsxFU/00V1+A3p5og90UuirsEhbZLbhYin0ZXlF8Oj6J0G7G
 sXefOTAdcT4rDUOMOdNKNGue8XjfzYR/l8jRm6E/os76EIt4WsQIOy22n
 AYx0q4H9wl9YZPlZEcZsj3nvpw9P2RFKetWoDq9Mc0BI7UPfjZYEvVAoj
 Z/5cqlwDNTU+szy2gYEDLir2/MMR5VkcXFQpQ3zW6C5GlCrXG2eNSfHfA A==;
X-CSE-ConnectionGUID: buIZQI6LTlOf9Lmum4/GrQ==
X-CSE-MsgGUID: jtgwu7K8S2OJsfp5yfJ58w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10213656"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="10213656"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:19:57 -0700
X-CSE-ConnectionGUID: vyCOCsvpTuyxEkTv0uZI+A==
X-CSE-MsgGUID: BeR9vZjTQTSfzUNPU3CIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="26169766"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 05:19:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s1Pz5-00000002KT3-0EnX; Mon, 29 Apr 2024 15:19:51 +0300
Date: Mon, 29 Apr 2024 15:19:50 +0300
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
Message-ID: <Zi-QZmwa1kIAv0sP@smile.fi.intel.com>
References: <20240425124208.2255265-1-andriy.shevchenko@linux.intel.com>
 <20240425-perky-myrtle-gorilla-e1e24f@penduick>
 <ZipxEk9Lpff1kB7b@smile.fi.intel.com>
 <20240429-gorgeous-beetle-of-downpour-492bbd@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429-gorgeous-beetle-of-downpour-492bbd@houat>
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

On Mon, Apr 29, 2024 at 01:39:06PM +0200, Maxime Ripard wrote:
> On Thu, Apr 25, 2024 at 06:04:50PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 25, 2024 at 04:58:06PM +0200, Maxime Ripard wrote:
> > > On Thu, Apr 25, 2024 at 03:42:07PM +0300, Andy Shevchenko wrote:
> > > > First of all, the driver was introduced when it was already
> > > > two drivers available for Ilitek 9341 panels.
> > > > 
> > > > Second, the most recent (fourth!) driver has incorporated this one
> > > > and hence, when enabled, it covers the provided functionality.
> > > > 
> > > > Taking into account the above, remove duplicative driver and make
> > > > maintenance and support eaiser for everybody.
> > > > 
> > > > Also see discussion [1] for details about Ilitek 9341 duplication
> > > > code.
> > > > 
> > > > Link: https://lore.kernel.org/r/ZXM9pG-53V4S8E2H@smile.fi.intel.com [1]
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > 
> > > I think it should be the other way around and we should remove the
> > > mipi-dbi handling from panel/panel-ilitek-ili9341.c
> > 
> > Then please do it! I whining already for a few years about this.
> 
> I have neither the hardware nor the interest to do so. Seems it looks
> like you have plenty of the latter at least, I'm sure you'll find some
> time to tackle this.

Hmm... Since the use of Arduino part in panel IliTek 9341 is clarified
in this thread, I won't use that, but I have no time to clean up the mess
in DRM in the nearest future, sorry. And TBH it seems you, guys, know much
better what you want.

FYI:
The drivers/gpu/drm/tiny/mi0283qt.c works for me (the plenty of the HW
you referred to).

TL;DR: consider this as a (bug/feature/cleanup) report.

-- 
With Best Regards,
Andy Shevchenko


