Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA6C6DA08
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13E510E5BF;
	Wed, 19 Nov 2025 09:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cekMWXcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233E310E5BF;
 Wed, 19 Nov 2025 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763543690; x=1795079690;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=q6da8jLQtnLnim6HyWRfNmg8bV209AFrRAch7qncfbs=;
 b=cekMWXcD4aJBhqzu2a/2fPvj8qaxdpzbQGuSHMilqF2V+cbAekelvhKK
 +DUjCDRwzR9B8+If3AgHJCVbL2XZ/pg2HA8ozhEW68p8MQNWHfAlxoh9V
 wqw2ba1B2LLzlVhch/3eUZGlnyfau2sb2qeljWzb7RPZL0nxRWkpExT84
 Axk8Zh6wVDrR6e4RDEJQf/l5IDqS0eOM3FTrLK45SnQpmkJ56iFDgGMZL
 Ejqf5IvlRKN4dliHJIcMhFi4SDWDxTAyeQqaP4bGS+qrFeTxn5/Qdm727
 uexSKOp5A5GZHggrajymje87+RT3504euXkA3s9e+Q2w+f4pFpl/Rsnyt A==;
X-CSE-ConnectionGUID: DTvyaCbRTqiOpYekrv18IQ==
X-CSE-MsgGUID: HVLu3NS5Qtm+L/3gT4mCdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="88232434"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="88232434"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:14:47 -0800
X-CSE-ConnectionGUID: oHYrWS8ATQebFcLjYXGykg==
X-CSE-MsgGUID: DikRyuhjQLyYtee9Ng8YEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="228346786"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.245])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 01:14:41 -0800
Date: Wed, 19 Nov 2025 11:14:38 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 01/21] lib/vsprintf: Add specifier for printing struct
 timespec64
Message-ID: <aR2KfgzV1_3ZzXhT@smile.fi.intel.com>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-2-andriy.shevchenko@linux.intel.com>
 <aRcnug35DOZ3IGNi@pathway.suse.cz>
 <aRd5HHUBu2ookDv_@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRd5HHUBu2ookDv_@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
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

On Fri, Nov 14, 2025 at 08:46:52PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 14, 2025 at 01:59:38PM +0100, Petr Mladek wrote:
> > On Thu 2025-11-13 15:32:15, Andy Shevchenko wrote:

...

> > I wonder how to move forward. I could take the whole patchset via
> > printk tree. There is no conflict with linux-next at the moment.
> > 
> > It seems that only 3 patches haven't got any ack yet. I am going
> > to wait for more feedback and push it later the following week
> > (Wednesday or so) unless anyone complains.
> 
> Sounds good to me!
> 
> But in the worst case all but untagged can be pushed, the rest can go
> to the next cycle.

Just got a "BUILD SUCCESS" from LKP and since we gained even more tags
I think it's ready to go.

-- 
With Best Regards,
Andy Shevchenko


