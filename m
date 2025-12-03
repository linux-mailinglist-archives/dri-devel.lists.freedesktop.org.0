Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FD2CA0464
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 18:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8546D10E17F;
	Wed,  3 Dec 2025 17:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G39M7PyL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7AF10E17F;
 Wed,  3 Dec 2025 17:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764781855; x=1796317855;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lFO3wtNsh5dGyFwM7eIT6bOnEPizuYPsL5CIYF1uh10=;
 b=G39M7PyLxPy0KZaIASz11aFZgbgjxc7Q6KBSYT+OqhCYkloZ4PoHURQB
 +23CBsqwZbMtMWSqUkbFiXBNrtPi7NEeRgjmQ4TY9dPx0lnXrfdUhS4ay
 WbASZNGhAKrsUDQqE9CNOoohZGl887hQFmIxFx2xcmZ3t+I4k/c3PRuVI
 B1aJoOkkiYiX4SQU233bfzvMNJTxUbtRzKcP6TfBu8tY13hYNCrYgk313
 o2GTq0lobjWLzFziS5sql4/du4osnsoToUVDZxJRWsam7E4FfK/Yqjs+h
 8DQatX63zjuD3fZerBSozG50i5jSXBCaQvQSF0xQICSiIggId4GgH7eTj A==;
X-CSE-ConnectionGUID: WG2SA9EVRAer5YingCe3kQ==
X-CSE-MsgGUID: Bis1cRG4SDm0K/n/v05Log==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77464938"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="77464938"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:10:54 -0800
X-CSE-ConnectionGUID: 0hnk3xmfRvmma7MQ7PxR0w==
X-CSE-MsgGUID: uskhqYyCQvWejXnOJSSuLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="195548113"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.81])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:10:45 -0800
Date: Wed, 3 Dec 2025 19:10:43 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
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
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <aTBvE_Arj16yB83I@smile.fi.intel.com>
References: <20251203162329.280182-1-yury.norov@gmail.com>
 <20251203162329.280182-5-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203162329.280182-5-yury.norov@gmail.com>
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

On Wed, Dec 03, 2025 at 11:23:25AM -0500, Yury Norov (NVIDIA) wrote:
> Tracing is a half of the kernel.h in terms of LOCs, although it's
> a self-consistent part. It is intended for quick debugging purposes
> and isn't used by the normal tracing utilities.
> 
> Move it to a separate header. If someone needs to just throw a
> trace_printk() in their driver, they will not have to pull all
> the heavy tracing machinery.
> 
> This is a pure move, except for removing a few 'extern's.

...

>  #include <linux/build_bug.h>
>  #include <linux/sprintf.h>
>  #include <linux/static_call_types.h>
> +#include <linux/tracing.h>

>  #include <linux/instruction_pointer.h>

And kill this one? We really don't care about the mess in the kernel.h right
now, and your header will bring that anyway. Also consider killing other
inclusions that has been moved from kernel.h to tracing.h.

>  #include <linux/util_macros.h>
>  #include <linux/wordpart.h>

...

> +#ifndef _LINUX_TRACING_H
> +#define _LINUX_TRACING_H
> +
> +#include <linux/compiler_attributes.h>
> +#include <linux/instruction_pointer.h>

+ stddef.h // you use NULL

+ string.h // use of strlen()

> +#include <linux/stringify.h>

-- 
With Best Regards,
Andy Shevchenko


