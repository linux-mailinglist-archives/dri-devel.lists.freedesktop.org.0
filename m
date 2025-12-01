Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5D9C98F06
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 21:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F5510E47E;
	Mon,  1 Dec 2025 20:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqojxEWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FF410E47C;
 Mon,  1 Dec 2025 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764619267; x=1796155267;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+TgvRRUr5TNRd2YLYbo2DA4tr+0rMwB4Er77xu1gMz8=;
 b=eqojxEWGi9JngWBWtppgR0NE8R8MPNO3XmCmrS17/r8dpOU871maP2SP
 s2BscO8s9PzvCW6te8cdg+Ioua/g5oDv90wv8NtzT1HOMTwJ+2w6HC5a1
 SdPr101ulFxS+GLzJnFx8s+vqenGrpkmIjzb/hiaAHeSgme+bXiLf+K1u
 ikfSU0pal+ROjwXUo+Vzyi1lIYUviSLTP5ZWtBHacGZAPK48EW7uQNEjH
 Qk6uxUvWqh47yddkgdTewGG3fhS52KIxTXTXkXunSzeFslo44Cbj/BJiW
 yzSYfAdhqTaJYrK3kNEIrkM0VTDaKGaHT5XWV6cGQf3QybnZIq3JJ+/4n g==;
X-CSE-ConnectionGUID: MMRA09mpQl+KQHr/b/E26w==
X-CSE-MsgGUID: 35i5D5wQSmGTVgW/1fhOBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70187154"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="70187154"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 12:01:06 -0800
X-CSE-ConnectionGUID: EjpiwClITieJFTWJ9dAclQ==
X-CSE-MsgGUID: C0xVISk/SeazZkz+Op1EoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="224863515"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.4])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 12:01:02 -0800
Date: Mon, 1 Dec 2025 22:00:59 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
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
Message-ID: <aS3z-4Gq3rCmFIdD@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-3-yury.norov@gmail.com>
 <aStWkK6exUj9YEC1@smile.fi.intel.com>
 <e0d34a20-7547-4788-8449-95fcd5588434@infradead.org>
 <aSyCC7TQoGgTn2rT@yury> <aSydSI-h3KZiYBn6@smile.fi.intel.com>
 <fd755bbf-50a8-46f7-bff1-61cc625118a9@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd755bbf-50a8-46f7-bff1-61cc625118a9@infradead.org>
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

On Mon, Dec 01, 2025 at 11:51:24AM -0800, Randy Dunlap wrote:
> On 11/30/25 11:38 AM, Andy Shevchenko wrote:
> > On Sun, Nov 30, 2025 at 12:42:35PM -0500, Yury Norov wrote:
> 
> >> This series was tested by 0-day and LKP. 0-day runs allyesconfig,
> > 
> > AFAICS in the below no configuration had been tested against allYESconfig.
> > All of them are allNOconfig.
> > 
> >> as far as I know. It only sends email in case of errors. LKP is OK, find the
> >> report below.
> > 
> >> All but XFS include it via linux/module.h -> linux/moduleparam.h path.
> >> XFS has a linkage layer: xfs.h -> xfs_linux.h-> linux/module.h, so
> >> it's pretty much the same.
> >>
> >> I think, module.h inclusion path is OK for this macro and definitely
> >> better than kernel.h. Notice, none of them, except for vgpu_dbg,
> >> include kernel.h directly.
> > 
> > Ideally those (especially and in the first place headers) should follow IWYU
> > principle and avoid indirect (non-guaranteed) inclusions.
> 
> Can you (or anyone) get IWYU (software) to work?
> I tried it a few months ago but didn't have the correct magic
> incantation for it.
> (no specifics at the moment)

You should talk to Jonathan Cameron (Cc'ed), he was able to run it to some
extent. AFAIR the state of affairs is that it gives a lot of low-level headers
that we should not really go too deep to (at least for now). That means the
carefully crafted map of guarantees needs to be provided (e.g., if we include
bitmap.h, bitops.h and/or bits.h are guaranteed, so no need to be included).

-- 
With Best Regards,
Andy Shevchenko


