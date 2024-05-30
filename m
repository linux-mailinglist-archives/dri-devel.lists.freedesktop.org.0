Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63488D5244
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 21:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC9E10E292;
	Thu, 30 May 2024 19:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PGNNz/ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11EF710E5FF
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 19:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717097008; x=1748633008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ihTJ7uLAXuHoHPzWTTChN0zHhWzqJH5AOQTbqp1Yttk=;
 b=PGNNz/ud7Id7KRkX8IyfVwqRzG7qbLW75URL19i1CakYHb2XegUWlvub
 xCErbMspi1wAiC4FQJHJb3b42b7kIvs9hBPYHcod8httGRnkkc1OSzgxK
 9NY0pxIkMeAY/SXRMDewsB67KgnlqrfnCfAkaIhTDKXntUJ0ksihgn0Vd
 CzhArp1IGM9v5UvDK7oe8F0liMH5gsg49b6FO/td3zqwq11GIQGq4W3H7
 6iloxSr1uvPgZbXFbAaTFiGV/N6hHORyxSOs29ydJJjC5ZmJIE1Ni3s5m
 AT4uX1mmA9FWnxnkbyDUjCYrGLdJ7/GgBpshXe64udJyFlDSunUJoGCXb Q==;
X-CSE-ConnectionGUID: WEC5+/pmTyaifQ52RVFhLg==
X-CSE-MsgGUID: LyfcemH9RzupH5c9MXr15w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13569035"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13569035"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:23:26 -0700
X-CSE-ConnectionGUID: E4kHBywfSC6jYb+ZzM5PAw==
X-CSE-MsgGUID: DAyMgrvrTMq/lWdTxpsO0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="36002442"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:23:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sClMr-0000000CHV4-0P88; Thu, 30 May 2024 22:23:17 +0300
Date: Thu, 30 May 2024 22:23:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
 vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
 detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
 andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
 dlatypov@google.com
Subject: Re: [PATCH v10 08/11] lib: add basic KUnit test for lib/math
Message-ID: <ZljSJJtI-ADTUoc7@smile.fi.intel.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171810.2764623-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530171810.2764623-1-devarsht@ti.com>
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

On Thu, May 30, 2024 at 10:48:10PM +0530, Devarsh Thakkar wrote:
> From: Daniel Latypov <dlatypov@google.com>
> 
> Add basic test coverage for files that don't require any config options:
> * part of math.h (what seem to be the most commonly used macros)
> * gcd.c
> * lcm.c
> * int_sqrt.c
> * reciprocal_div.c
> (Ignored int_pow.c since it's a simple textbook algorithm.)
> 
> These tests aren't particularly interesting, but they
> * provide short and simple examples of parameterized tests
> * provide a place to add tests for any new files in this dir
> * are written so adding new test cases to cover edge cases should be
>   easy
>   * looking at code coverage, we hit all the branches in the .c files

...

> +#include <kunit/test.h>
> +#include <linux/gcd.h>
> +#include <linux/lcm.h>
> +#include <linux/reciprocal_div.h>

Really, you ignored my comment a second (?) time? This is road to nowhere.
You need to update the inclusion bloc in accordance with IWYU principle.
I see a few headers are missing.

-- 
With Best Regards,
Andy Shevchenko


