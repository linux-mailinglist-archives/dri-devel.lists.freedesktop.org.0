Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4899CA046D
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 18:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3C810E8A1;
	Wed,  3 Dec 2025 17:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGzOGgaV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59F910E88D;
 Wed,  3 Dec 2025 17:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764781896; x=1796317896;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=l8vp+F65X+Mdjb6vdkPOU7mylQvhK4z+zYyRql8ouAQ=;
 b=HGzOGgaV/BThGwvPv5WHgVH1EWh+n3qNjoXvAwqukXT6NNzz3TCZcqBp
 2GjI2+R6nolwH+GG72I4gZPDosw/hxVKZeQb5zc0ehHu0wWH/a2/qHzyl
 qDPm4Sg1GYLpExDSSC9lKcbOQmd3vfOfgSN9S9wA5AJ1U1bZvj3lW3xQO
 ePot0vYXzExbLiM7wb3FRtyM84NhfhoAYfliY8/UmVbGgWxHKfGgEfZAf
 rkosQkoojbnVBsNyBc4DjiAWVKb7LUUMnhQty10THsCqZK8Hp7UZRNLcv
 OnuzApFl2e261U4JY4hzRMztp1oxbGkybrUL3dmgfxZuLOlWGkdx96hSz g==;
X-CSE-ConnectionGUID: +D8zH7bVRAm+DIT2I1095g==
X-CSE-MsgGUID: R2ud67GlQwKER3suYF81Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66506445"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="66506445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:11:36 -0800
X-CSE-ConnectionGUID: MfZoCywgSo25HDgY4urn+Q==
X-CSE-MsgGUID: qgiGUGzeSpmiG9xX4gxRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="198920476"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.81])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:11:31 -0800
Date: Wed, 3 Dec 2025 19:11:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
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
Message-ID: <aTBvQDT0feiQT77z@smile.fi.intel.com>
References: <20251203162329.280182-1-yury.norov@gmail.com>
 <20251203162329.280182-5-yury.norov@gmail.com>
 <20251203121007.407eaf3d@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203121007.407eaf3d@gandalf.local.home>
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

On Wed, Dec 03, 2025 at 12:10:07PM -0500, Steven Rostedt wrote:
> On Wed,  3 Dec 2025 11:23:25 -0500
> "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> 
> > diff --git a/include/linux/tracing.h b/include/linux/tracing.h
> > new file mode 100644
> > index 000000000000..1989e6328c59
> > --- /dev/null
> > +++ b/include/linux/tracing.h
> 
> Sorry, and I hope this isn't too much bike shedding, but I'm thinking we
> should call it trace_printk.h. It's mostly about using trace_printk() and
> other similar debugging aspects. Calling it "tracing.h" makes it sound like
> it is part of the generic tracing infrastructure.

I am fine with the proposed name, and it makes sense to me.

-- 
With Best Regards,
Andy Shevchenko


