Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A265C9540A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 20:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3882C10E27F;
	Sun, 30 Nov 2025 19:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fkecpJ5u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E21610E27E;
 Sun, 30 Nov 2025 19:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764531535; x=1796067535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ylCdixgggpG3AQDuxOsE/FrAIGyeW0LSRVjCqHLfqQ4=;
 b=fkecpJ5uOypOpxkYkTl/8dpygNYGnYzFOt3rznrjRvUD0fxle6w+c9JA
 HaL9YxHFODfj0ZHflu/QXcJALwblDwWgB2sSuMqTbLLjzVRk+WUVDZ8ql
 tb/PxDJxXYLvxOyii2lYDhaE1zu7FZM85pCqOH8rjruVzAu2c+fFgPfXa
 0R8V18/Jgk2FLNA+S3hplyNX1vesO7F2s4inQ4gD/MNAJ3VfMPB3Uc3Id
 MDV/GBBfTfskGnI/n8NwNKxe7Syaq4iSWIwZ4wGhNjdTgBVLF8O3Tav1o
 38c4aEP9DrNAttxI6bzKo7fKJHVWTkUDX2JnljAhl8bTZNj6b9XGuSvmf Q==;
X-CSE-ConnectionGUID: J/XN7my/SYKk9t/NsDV0YA==
X-CSE-MsgGUID: yz3EgSKTSLyMtUB/MWNjJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77826729"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="77826729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 11:38:55 -0800
X-CSE-ConnectionGUID: tWRx5yiZS4+dTWtqmN92sQ==
X-CSE-MsgGUID: QnBLYUfTQ3OLBKYeE0lYsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; d="scan'208";a="198827111"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.125])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 11:38:50 -0800
Date: Sun, 30 Nov 2025 21:38:48 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
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
Subject: Re: [PATCH 2/3] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
Message-ID: <aSydSI-h3KZiYBn6@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-3-yury.norov@gmail.com>
 <aStWkK6exUj9YEC1@smile.fi.intel.com>
 <e0d34a20-7547-4788-8449-95fcd5588434@infradead.org>
 <aSyCC7TQoGgTn2rT@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSyCC7TQoGgTn2rT@yury>
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

On Sun, Nov 30, 2025 at 12:42:35PM -0500, Yury Norov wrote:
> On Sat, Nov 29, 2025 at 10:19:29PM -0800, Randy Dunlap wrote:
> > 
> > 
> > On 11/29/25 12:24 PM, Andy Shevchenko wrote:
> > > On Sat, Nov 29, 2025 at 02:53:01PM -0500, Yury Norov (NVIDIA) wrote:
> > >> The macro is related to sysfs, but is defined in kernel.h. Move it to
> > >> the proper header, and unload the generic kernel.h.
> > > 
> > > Tough guy :-)
> > > I hope it builds well in your case.
> > > 
> > > FWIW,
> > > https://lore.kernel.org/lkml/20220603172101.49950-1-andriy.shevchenko@linux.intel.com/
> > > https://lore.kernel.org/lkml/20240212115500.2078463-1-max.kellermann@ionos.com/
> > > https://lore.kernel.org/lkml/20240215093646.3265823-1-max.kellermann@ionos.com/
> > > 
> > > Assuming it builds in allmodconfig, allyesconfig on x86_32/64 and arm/64
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > 
> > I don't build allyesconfigs any more (final? linking takes too long).
> > It builds successfully for arm64 allmodconfig, arm allmodconfig,
> > i386 allmodconfig, and x86_64 allmodconfig.
> > 
> > And the source files that use VERIFY_OCTAL_PERMISSIONS() all build successfully
> > (which means that they possibly include <linux/sysfs.h> indirectly, i.e.,
> > by luck). There aren't many of them, so I checked:
> > 
> > arch/arc/kernel/perf_event.c:	arc_pmu->attr[j].attr.attr.mode = VERIFY_OCTAL_PERMISSIONS(0444);
> > INDIRECT
> > drivers/edac/thunderx_edac.c:	.mode = VERIFY_OCTAL_PERMISSIONS(_mode),		    \
> > INDIRECT
> > drivers/media/platform/amphion/vpu_dbg.c:		    VERIFY_OCTAL_PERMISSIONS(0644),
> > INDIRECT
> > drivers/soc/aspeed/aspeed-uart-routing.c:	 .mode = VERIFY_OCTAL_PERMISSIONS(0644) },	\
> > INDIRECT
> > fs/xfs/xfs_error.c:		 .mode = VERIFY_OCTAL_PERMISSIONS(S_IWUSR | S_IRUGO) },	\
> > INDIRECT
> > include/linux/moduleparam.h:	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
> > INDIRECT
> > 
> > so all of them got lucky. :)
> > 
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> Thanks, Randy.
> 
> This series was tested by 0-day and LKP. 0-day runs allyesconfig,

AFAICS in the below no configuration had been tested against allYESconfig.
All of them are allNOconfig.

> as far as I know. It only sends email in case of errors. LKP is OK, find the
> report below.

> All but XFS include it via linux/module.h -> linux/moduleparam.h path.
> XFS has a linkage layer: xfs.h -> xfs_linux.h-> linux/module.h, so
> it's pretty much the same.
> 
> I think, module.h inclusion path is OK for this macro and definitely
> better than kernel.h. Notice, none of them, except for vgpu_dbg,
> include kernel.h directly.

Ideally those (especially and in the first place headers) should follow IWYU
principle and avoid indirect (non-guaranteed) inclusions.

-- 
With Best Regards,
Andy Shevchenko


