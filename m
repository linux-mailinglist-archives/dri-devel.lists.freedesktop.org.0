Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4024C947D3
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 21:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D6F10E21C;
	Sat, 29 Nov 2025 20:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oe21u0Yy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D7510E21C;
 Sat, 29 Nov 2025 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764448232; x=1795984232;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Pl1lILzEe3LH5OBkbM+SoRdHXHebqrUDGpe8WEwHlas=;
 b=Oe21u0Yy4ZzMaATh+/UuPJH6E7IEFZ/w15WERQSN9RhDUiKBa9Z4SXb6
 v4PPTKSg+ZOwe7pXkt8oh6t6Pg2KgMxHoEshx9xkJah/ofKwREiu/LZ7n
 Dkz1q8/TUtPRUINevvbcm/rX/7f+phwNzqsp1Xvqn/DAGune1wTMVK2Rh
 98HfztHHZCU5onN2HY/ohq3Oz+JVsUXDrRwpaqep5jYolKH1PmrgFLzmN
 QDehJAs60g5PRXE+Lls+fec+BXFmEvkynU6drOaRB4iI5S6rEOkY9wq/V
 V12ink2GwunAGWovzecMs7OMWFV8Av5bzWQKzEcZexqKK6ZVpxFpNOszU g==;
X-CSE-ConnectionGUID: crIHPeFYTLyU96idnvOzWw==
X-CSE-MsgGUID: 9I8kFQ/lQT+9aui23JCqIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="70293283"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="70293283"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:30:31 -0800
X-CSE-ConnectionGUID: WTp37b03Qtu039IHsFhgDQ==
X-CSE-MsgGUID: 3jllhBBnTWyegBibIUCwag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="198042828"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.50])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:30:26 -0800
Date: Sat, 29 Nov 2025 22:30:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] tracing: move tracing declarations from kernel.h to
 a dedicated header
Message-ID: <aStX3242e3mo5H05@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-4-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129195304.204082-4-yury.norov@gmail.com>
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

On Sat, Nov 29, 2025 at 02:53:02PM -0500, Yury Norov (NVIDIA) wrote:
> Tracing is a half of the kernel.h in terms of LOCs, although it's a
> self-consistent part. Move it to a separate header.
> 
> This is a pure move, except for removing a few 'extern's.

Yeah, I also have something similar (but half-baked) locally, the Q I wanted to
ask is why a separate header? We have already some of tracing headers. Doesn't
suit well?

...

> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -27,6 +27,7 @@
>  #include <linux/math.h>
>  #include <linux/minmax.h>
>  #include <linux/typecheck.h>

> +#include <linux/tracing.h>

There is better place for t*.h, i.e. after static_call_types.h.

Btw, have you tried to sort alphabetically the bulk in the kernel.h after
your series. Does it still build? (Just wondering about state of affairs
with the possible cyclic dependencies.)

>  #include <linux/panic.h>
>  #include <linux/printk.h>
>  #include <linux/build_bug.h>

-- 
With Best Regards,
Andy Shevchenko


