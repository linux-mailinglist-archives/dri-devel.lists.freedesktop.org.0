Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD658D74A6
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 11:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6F388FBD;
	Sun,  2 Jun 2024 09:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAYVDWjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4BC88FBD
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2024 09:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717321622; x=1748857622;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e/MmA0lqNIytmpj8MKctzTRAhRhDttTY7BgrLSVLdcM=;
 b=SAYVDWjxym4oyUhBdFIE7xWIsxRwRjahDV09FJ6UWE+/h3vOTe9V9Zdg
 YS92BveK8hXolsJkpXH7m/NIXImUFAk201qb9zY0+LVJWiTpKnVQ3AFUF
 HFuLOUxzP7cgnaL5O1vRuNYJJcMVysKsXu/aTjZNLxxWDGQhlz43UnnY1
 XGzT8IMVniQAMJiwnnq+KcAfgfSHKZEPF1ww89dKlQKJk6agvTir8uIet
 PSlIb0B8z4O1QD+yRxJANr5tdSo1hYJ3sHTHK6Efwc5Dr3XtDJO8/+MgT
 SoXWCndCjxN8Nu46QEItfRKSpPpIx/5FBXzuI04TzCRRF+PTWoJVXozNu Q==;
X-CSE-ConnectionGUID: fv09311RQzW3qFGSs/QyAA==
X-CSE-MsgGUID: L40REcuHRG2hm620kftKEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="14013856"
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; d="scan'208";a="14013856"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 02:47:01 -0700
X-CSE-ConnectionGUID: hB+Y+hpcRFO514COcgAVVQ==
X-CSE-MsgGUID: rCz+UrgQSRGFTu/loLXfMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,209,1712646000"; d="scan'208";a="41516784"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 02:46:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sDhnh-0000000Cz9y-40jX; Sun, 02 Jun 2024 12:46:53 +0300
Date: Sun, 2 Jun 2024 12:46:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Johan Hovold <jhovold@gmail.com>
Subject: Re: [PATCH v1 2/4] iio: light: lm3533-als: Remove the driver
Message-ID: <Zlw_jVoJ7w3bTFYX@smile.fi.intel.com>
References: <20240531170844.1595468-1-andriy.shevchenko@linux.intel.com>
 <20240531170844.1595468-3-andriy.shevchenko@linux.intel.com>
 <20240601140508.0466386e@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601140508.0466386e@jic23-huawei>
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

On Sat, Jun 01, 2024 at 02:05:08PM +0100, Jonathan Cameron wrote:
> On Fri, 31 May 2024 19:56:14 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The driver has no in kernel users and requires a board file
> > to be instantiated. Remove basically a dead code.
> > 
> > If ever needed, it can be reinstantiated and converted to one
> > that uses firmware node interfaces.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Given the header removal in patch 4, I assume these all need to go together
> via mfd.
> 
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thank you! We are waiting for Johan to tell what his plans about the driver.
If it comes to removal, I add your tag to the new version of this mini-series.

-- 
With Best Regards,
Andy Shevchenko


