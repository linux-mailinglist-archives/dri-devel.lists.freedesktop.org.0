Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E03C6F7CB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 16:00:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9313C10E652;
	Wed, 19 Nov 2025 15:00:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwqIxE92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5A210E64F;
 Wed, 19 Nov 2025 15:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763564451; x=1795100451;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6VLOKmDo4WviGUhM4qQZA7IzCWHn1ZvDUbxiE4MHVTw=;
 b=PwqIxE92BHunt/rCEM+35DFrV5Js1lkLdEcSgqSbWQ2mwnb8LXlyrYu1
 Xsw2Yi6CgDptdwZG9jKX596BkpTmpBBJylkwjDdCMsjF8y92SYeTBni0V
 L02L8Y5UT+gqi2D6XKxUF+eH3Ca0rGuH+TXvrmEtyFgk1hqkzRhpZtlgt
 KXVTlFFSDt7Etbq4dc1NmLWNgP6Yd31CJWBmFf8zADODprEjFIREKzK/F
 mwLdwOfYrLZiXQiQgoGSNy46zTrBn6ee95a6vYbN4PBI9GmAZvBwfO9Mo
 INWT85WJNnnK7Dl1iO7JjwEWPzSfVUOVeeObxFD6CQWD/NRl1llDAwUuw g==;
X-CSE-ConnectionGUID: KtOsV4EgRGWFZCoXNOli9A==
X-CSE-MsgGUID: 49qp4tYFQzaG4LRpcg5LIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="91085420"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="91085420"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 06:59:36 -0800
X-CSE-ConnectionGUID: 1p6r6x9uS5u32zRd1eVaZg==
X-CSE-MsgGUID: voIFHWIqQSaE97KThetVqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191329073"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.245])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 06:59:30 -0800
Date: Wed, 19 Nov 2025 16:59:28 +0200
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
Subject: Re: [PATCH v3 00/21] treewide: Introduce %ptS for struct timespec64
 and convert users
Message-ID: <aR3bUMvPCqZr5utj@smile.fi.intel.com>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <aR3B8ECx9W6F0BV_@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aR3B8ECx9W6F0BV_@pathway.suse.cz>
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

On Wed, Nov 19, 2025 at 02:11:12PM +0100, Petr Mladek wrote:
> On Thu 2025-11-13 15:32:14, Andy Shevchenko wrote:
> > Here is the third part of the unification time printing in the kernel.
> > This time for struct timespec64. The first patch brings a support
> > into printf() implementation (test cases and documentation update
> > included) followed by the treewide conversion of the current users.
> > 
> > Petr, we got like more than a half being Acked, I think if you are okay
> > with this, the patches that have been tagged can be applied.
> > 
> > Note, not everything was compile-tested. Kunit test has been passed, though.
> 
> JFYI, the patchset has been committed into printk/linux.git,
> branch for-6.19-vsprintf-timespec64.
> 
> Note, that I have:
> 
>    + fixed the 19th patch as proposed, see
>      https://lore.kernel.org/all/aR2XAYWTEgMZu_Mx@pathway.suse.cz/
> 
>    + reviewed all patches but I triple checked 7th patch which
>      did not have any ack yet. And I added my Reviewed-by tag
>      there. ;-)
> 
>    + I tried build with allyesconfig. It succeeded. I am not 100%
>      sure that it built all modified sources but...

Thank you!

-- 
With Best Regards,
Andy Shevchenko


