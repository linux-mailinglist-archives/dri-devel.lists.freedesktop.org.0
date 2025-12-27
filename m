Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281EACDFDFA
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 15:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7447E10EE69;
	Sat, 27 Dec 2025 14:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDc6obbc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5CE10EE69;
 Sat, 27 Dec 2025 14:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766847037; x=1798383037;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=agRaZ2qn8iGUDwGx0pm/utEXG1tRsSPPIZC9YbnVHhk=;
 b=GDc6obbcL4oXfnSnxmfMg6ROqROmjkJbbFR0SOVmCboMPfR/zKUQFIhP
 IyK6dPg2YtKALrdJy1IV75564pnN3bx4b41KPAT2jf8teYPEp+ncPJt1e
 l+8PVGYDOSHlbSYIedrRuELEbLPOJgJlz4nkUgJU4rAgX8+QmVMhtTFJm
 gD6Tj3ZE2BkjiqnCLdmyI16sIahqotTvJkAWeE6QOINZ1O4Zho1Y9fu7X
 mNOH+S4M4dtDZnThvKSnliPdaqNTOhL65ZkqC17PHwQ50/B1QB6jc6X99
 IWyGJ89tgJLd2shNbxwPkSineasWMgjVDtqF90uGCZ/yBKeKb1pnYjt5o g==;
X-CSE-ConnectionGUID: JUXTQb+XRcm7kK7aZn4iuA==
X-CSE-MsgGUID: fRYjeRqxQZyn81en3zAgcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="67746605"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; d="scan'208";a="67746605"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2025 06:50:36 -0800
X-CSE-ConnectionGUID: IA2r5lQCRxqLIY/qge67gg==
X-CSE-MsgGUID: v/3GM6fwSxC70TDwEy1EbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; d="scan'208";a="199795529"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2025 06:50:31 -0800
Date: Sat, 27 Dec 2025 16:50:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <aU_yNNJmIjUMIFlU@smile.fi.intel.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251225170930.1151781-8-yury.norov@gmail.com>
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

On Thu, Dec 25, 2025 at 12:09:29PM -0500, Yury Norov (NVIDIA) wrote:
> The trace_printk.h header is debugging-only by nature, but now it's
> included by almost every compilation unit via kernel.h.
> 
> Removing trace_printk.h saves 1.5-2% of compilation time on my
> Ubuntu-derived x86_64/localyesconfig.
> 
> There's ~30 files in the codebase, requiring trace_printk.h for
> non-debugging reasons: mostly to disable tracing on panic or under
> similar conditions. Include the header for those explicitly.
> 
> This implicitly decouples linux/kernel.h and linux/instruction_pointer.h
> as well, because it has been isolated to trace_printk.h early in the
> series.

...

>  #include <linux/pagevec.h>
>  #include <linux/scatterlist.h>
>  #include <linux/workqueue.h>
> +#include <linux/trace_printk.h>

I believe 't' is followed by 'w' and not vise versa.

...

> index 20b3cb29cfff..549fdeaf4508 100644
> --- a/drivers/gpu/drm/i915/i915_gem.h
> +++ b/drivers/gpu/drm/i915/i915_gem.h
> @@ -27,6 +27,7 @@
>  
>  #include <linux/bug.h>
>  #include <linux/types.h>
> +#include <linux/trace_printk.h>

In the similar way 'r' then 'y'.

...

Please, double check these and the rest.

-- 
With Best Regards,
Andy Shevchenko


