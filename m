Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B9EC959E5
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 03:50:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C447710E08B;
	Mon,  1 Dec 2025 02:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2B2o/V2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59A310E039;
 Mon,  1 Dec 2025 02:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764557450; x=1796093450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rKOvDeIyiyRW4pFdZUPEt3azuNBykMjjiaAtloiTHqg=;
 b=L2B2o/V2nRu4XHbLuKytjN/XJx6sAveYGpN4yXH3zTLvee05lSOF8icA
 E/zvU71ixtxsgbgQXN/JUcTLkoYZ278kwHUuTPcEFELLfJWOqy96DyAuv
 aeXijHY30Bij7KpVZ/psNo5UzMofaeXcmvBPY28xd0JeG+gUHVhO4wJV5
 zmlaHYwZOXDRl6fCpYLRl8uDMy9/4RGSLl2m4iaMPhH09ADQ5kPZyaDeJ
 cYurXg8Z+G9Anxp2ixon30PUr86T+tphhHmkDCilUn79bcIEW1hPDWZvv
 Vr9HuGZn/PPbLc1BjIb1nUntdqvlP+7oHCD/+eYIZFpIkICIBBXccLPpn w==;
X-CSE-ConnectionGUID: xKLzhLvtT+aUn4B0YYNh5g==
X-CSE-MsgGUID: 1BW+ghRfQAKAadUmB3XZGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66377203"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66377203"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 18:50:49 -0800
X-CSE-ConnectionGUID: YAbpDgaQSW6OVR+KExldcw==
X-CSE-MsgGUID: jGsuMvD2QQ2EBRDrcIx6Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224916572"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.125])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 18:50:45 -0800
Date: Mon, 1 Dec 2025 04:50:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: david laight <david.laight@runbox.com>
Cc: Yury Norov <yury.norov@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
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
Message-ID: <aS0CgnvRfQtam0uU@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-4-yury.norov@gmail.com>
 <aStX3242e3mo5H05@smile.fi.intel.com> <aSyJ83v7EEAPHXeU@yury>
 <aSyertuRRX9Czvyz@smile.fi.intel.com>
 <20251130230925.376b5377@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130230925.376b5377@pumpkin>
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

On Sun, Nov 30, 2025 at 11:09:25PM +0000, david laight wrote:
> On Sun, 30 Nov 2025 21:44:46 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

...

> It is worth checking whether the files get included anyway, and whether it
> really makes that much difference.
> 
> Fiddling with kernel.h and extracting small 'leaf' headers from it is also
> unlikely to make a big difference.

It makes a big difference for the kernel.h and its (ab)users.
Especially when we have cyclic dependencies and "include everything"
cases due to other _headers_ including kernel.h.

> Try adding a syntax error to (say) sys/ioctl.h and see where it is included
> from the first time - I suspect you'll be surprised.
> Working on that include list might be more fruitful (in reducing build times).

kernel.h elimination (in the form it exists right now) is very fruitful.
However, you may help with the (say) ioctl.h or whatever you consider
really fruitful, we all will thank you (no jokes).

-- 
With Best Regards,
Andy Shevchenko


