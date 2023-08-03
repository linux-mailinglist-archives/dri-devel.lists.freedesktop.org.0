Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF776E998
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 15:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080B310E607;
	Thu,  3 Aug 2023 13:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E1010E60E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 13:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691068171; x=1722604171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FlMTEuA5iIjaPhk4Low57KA15KxWWnZqTREknrSoAlw=;
 b=LOXvNVfq3suGGJm4fqnj5q8srAFaeDBxGjS1OPK9KDK9h2o726cRxUHI
 EghmFxGflfRS0WmzU751C+fPgKBFrhgll3CY7r5oBtFWvuKjQQOoq1Qah
 Bq1flWY03XyFsy6vv/Div3G1YDMcV1aeeb5d//sXXjv1KCySntiVsS35L
 UzDbGEjWVMtlrLt4qphbPLKw5W2ahXhDX2tbCgOPfjG/1M5Y0/fdYYJ4u
 bNaJu2BAORskzOn6zzVp7Egicyq3geZGZbD/OiNcE/ShudLXRZFHBy3Ny
 E1bJ4uKBJeJRK9W5ZbJDH+3LvVoMNTj4FtPmCZ5nyFB4VX+qX1EM/fVTR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="354784799"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="354784799"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2023 06:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="759113416"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; d="scan'208";a="759113416"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga008.jf.intel.com with ESMTP; 03 Aug 2023 06:09:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1qRY4s-00DaaF-2g; Thu, 03 Aug 2023 16:09:18 +0300
Date: Thu, 3 Aug 2023 16:09:18 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zhu Wang <wangzhu9@huawei.com>
Subject: Re: [PATCH -next v3] drm/i2c: tda998x: remove redundant CONFIG_OF
 and of_match_ptr()
Message-ID: <ZMum/j4NvKItk8Tw@smile.fi.intel.com>
References: <20230802074204.229699-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802074204.229699-1-wangzhu9@huawei.com>
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
Cc: arnd@arndb.de, dri-devel@lists.freedesktop.org, linux@armlinux.org.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 02, 2023 at 03:42:04PM +0800, Zhu Wang wrote:
> The driver depends on CONFIG_OF, so it is not necessary to use CONFIG_OF
> and of_match_ptr() here, we remove them all.
> 
> Even for drivers that do not depend on CONFIG_OF, it's almost always
> better to leave out the of_match_ptr(), since the only thing it can
> possibly do is to save a few bytes of .text if a driver can be used both
> with and without it.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I haven't given you any tag, why is this line here?!

-- 
With Best Regards,
Andy Shevchenko


