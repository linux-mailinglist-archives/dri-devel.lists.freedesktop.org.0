Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6EE8D0EA9
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 22:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A43110F1DA;
	Mon, 27 May 2024 20:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8DP9bwh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5997710F1DA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716842252; x=1748378252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+oOwF+zgiQI2tqxIcVjxnOSLqyTdQlPcxUWF7PDS9cg=;
 b=m8DP9bwheXjunf3FjalmkI69MTTWf3znYrft9ANWa5n1NhohiyCzEPCv
 6XuxqsrqNT1O6bErEZIEPoKmQgeG9g2qYn2SAaUy9a8yiP5GoDb+FIjaG
 tu+dEn/9U6xXn7/gtNFNIJ3mvPqN0EiPLUIdi6iJBhDj7dXTFvbOSNtFw
 b7CewCXt9WPjV/16JlRMgzGQKbOBCUjxHKhP3teKPc757kSUL/69BbYpk
 3mxuPCwa7sCs5p6OGPJLTQLPyRfoPDZ9kaOzbYcZ9HQ4lle8EUc/yklUp
 HCbbhFF1weYlVYKASZNtppiL3eKsmLJSTl3AGJaKYm8OK+Y5kaUF4hlxu Q==;
X-CSE-ConnectionGUID: sMsE3kLERYGW7A1HZ/MZ9g==
X-CSE-MsgGUID: UgzmZOKdR7yaKCqpg/B/sg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13041912"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="13041912"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 13:37:30 -0700
X-CSE-ConnectionGUID: akO4TqpiSMOqR25nmy4sfQ==
X-CSE-MsgGUID: PiKUar/YQr+Tz2VpXZSpSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; d="scan'208";a="72261586"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 13:37:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sBh5s-0000000BMjw-0e18; Mon, 27 May 2024 23:37:20 +0300
Date: Mon, 27 May 2024 23:37:19 +0300
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
Subject: Re: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
Message-ID: <ZlTu_9orsuosNiGk@smile.fi.intel.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180933.1126116-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240526180933.1126116-1-devarsht@ti.com>
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

On Sun, May 26, 2024 at 11:39:33PM +0530, Devarsh Thakkar wrote:
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

+ math.h (where abs()/DIV_ROUND_*()/etc come from?)
I believe I mentioned that.

> +#include <linux/reciprocal_div.h>

...

> +MODULE_LICENSE("GPL");

modpost validator won't be happy about this, i.e. missing MODULE_DESCRIPTION().

-- 
With Best Regards,
Andy Shevchenko


