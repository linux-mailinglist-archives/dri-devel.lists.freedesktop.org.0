Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E196CE9183
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 09:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831CF10E17F;
	Tue, 30 Dec 2025 08:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQvhw2Cb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8076F10E171;
 Tue, 30 Dec 2025 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767084916; x=1798620916;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DIUWg89A9uqjQJSa8uU7nqynCwHKpJnUH0bwlQIa0Eo=;
 b=UQvhw2Cbv2YT/2coDI+Mw0yCBBTUMIluEfYbATBi8KahLbtCUwb5jEYg
 uGg/UjPKibJoIg3HWzRmyViKY2EMYT9Egw7D8C8ECo/WtoElDVkqE09Wd
 /vPjhzROex7gMKJnZ9yWXuVSfD0jD14oxIf9codPJZjsFnGKsW1gbAfg7
 gpN1NonfjgKzeDZTfA9d1bm4O7Yjf4gUoY8/FOUWYMHwMxtX9mOwuw1xB
 bsQVL5SJLV9cTh++XYXzBI1G+r84cCxIxzRcErvN51AF8hxv+05HP0/t/
 QyD3K3ahflR79Ws8Lvbisvm49Zy4WkzSK8uB+LykfbuihtqCEaJVlQ9t0 Q==;
X-CSE-ConnectionGUID: gl5lroi6SiSLoC3rnQLpBA==
X-CSE-MsgGUID: gdWzpY22Qam/4Z1+NqexUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="56248180"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="56248180"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 00:55:16 -0800
X-CSE-ConnectionGUID: LM6UUyFmSBmENn61vwtC3A==
X-CSE-MsgGUID: WjgB+I+XRlqqfcoeZHvIGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; d="scan'208";a="201161436"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.103])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 00:55:10 -0800
Date: Tue, 30 Dec 2025 10:55:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
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
Message-ID: <aVOTbArAxmbT5LY9@smile.fi.intel.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <9833cb61-1ec5-4cc1-ad9d-3e07f3deff80@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9833cb61-1ec5-4cc1-ad9d-3e07f3deff80@efficios.com>
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

On Mon, Dec 29, 2025 at 05:25:08PM -0500, Mathieu Desnoyers wrote:

...

> One possible compromise would be to move it to its own header file,
> and introduce a CONFIG_TRACE_PRINTK Kconfig option (default Y) that
> would surround an include from linux/kernel.h with a preprocessor
> conditional. But please make sure the default stays as it is today:
> include the trace printk header by default.

"by default" where exactly? The problem is that kernel.h is a total mess and
it's included in a lot of mysterious ways (indirectly), and in C you _must_
include a header anyway for a custom API, just define *which* one.

Based on the Steven's first replies I see a compromise in having it inside
printk.h. If you want to debug something with printf() (in general) the same
header should provide all species. Do you agree?

-- 
With Best Regards,
Andy Shevchenko


