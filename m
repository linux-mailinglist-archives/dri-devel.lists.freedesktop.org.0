Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D5A84E640
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 18:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED0710E099;
	Thu,  8 Feb 2024 17:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDAB24FY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4064A10E099
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Feb 2024 17:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707412129; x=1738948129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=a0k4or3WYh5JsmiTSA5UkW0JwcVYQd963OTJEqpPdiI=;
 b=CDAB24FYwul0ymCqlBlkC/qbyhTKg859nH4ogxLvRFtxsSv1hudEZzmK
 io2vfmUyVBuE7ge7VoFyjwI6l4tjY5f43G9i80mT4+rwViOsvZ921HRrL
 PlJRfgjii3r2rQZemhwQNgqvMzGjGfoYlM84Dw8DNEHmT/fJl9PN24hr+
 6Yb1sReGQ0Js8CfbqRJ0yLx4F4HyAs0CijbBx+XAC1hKVZYAr0+bSsNVp
 a06y4lP6amc9Sm1lwXeDryZ3CLRqpMcQsnTsmSlxThKegq/FkiAETz627
 x7kfyWx4CJM0uJqbxNfwAHOfFkekA/LCG+j+TIEJR1iP0+PG7NcOPUEgg Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="11838405"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="11838405"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 09:08:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="910427477"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; d="scan'208";a="910427477"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 09:08:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1rY7tC-00000002vpU-3OYe; Thu, 08 Feb 2024 19:08:42 +0200
Date: Thu, 8 Feb 2024 19:08:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 0/4] backlight: hx8357: Clean up and make OF-independent
Message-ID: <ZcUKmlbtyktnKhLr@smile.fi.intel.com>
References: <20240201144951.294215-1-andriy.shevchenko@linux.intel.com>
 <20240208105304.GI689448@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208105304.GI689448@google.com>
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

On Thu, Feb 08, 2024 at 10:53:04AM +0000, Lee Jones wrote:
> On Thu, 01 Feb 2024, Andy Shevchenko wrote:

...

> Someone may wish to address this:
> 
> WARNING: DT compatible string "himax,hx8369" appears un-documented -- check ./Documentation/devicetree/bindings/
> #58: FILE: drivers/video/backlight/hx8357.c:636:
> +		.compatible = "himax,hx8369",

I can do it if and when have more time. But apparently it was before this
series, right?

-- 
With Best Regards,
Andy Shevchenko


