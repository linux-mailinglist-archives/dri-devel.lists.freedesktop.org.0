Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5D9CF0744
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 01:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB94F10E396;
	Sun,  4 Jan 2026 00:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IENiP5ZT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD8D10E38F;
 Sun,  4 Jan 2026 00:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767486064; x=1799022064;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EZ07LHl/c+KnJFICNJyVpY6174knisfxMAC3WeK1sEs=;
 b=IENiP5ZTDjjdOQ6wcuhpfTc0u0VfserIPvUcZvBCrytfPCFuM/aBLm6r
 vmJn3nMV5qhS6RNE+VAqB/ZJAgOlAEX8pfDz8taXKb7042xbe9PZ2MSnC
 5uRGG/aVcPkpXWrLz4kdAPxheQIgS5mYJKLzufkN8kaH+eOeKXSPjA8A6
 g0gMNF9WH9lQHp34ey35yvDSK4K5cqd8aMvKfzuutE+4fzJ7VI3DsmtQg
 hnAZ6y60nUwQoWNobgZr4G/uM2ssTvlteZ/ntHCYSX5WJwN9QNP0setGl
 Ftez+MqfXt9wk8cpEpNO3qzDy6ilyjWtGwSH6z9hkm1rvdVUhoeDcnw3F w==;
X-CSE-ConnectionGUID: huVvTIPlQX2r2ZFAp0/Mog==
X-CSE-MsgGUID: RJq/cJRiTLaTGYv9tsWt+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68893384"
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; d="scan'208";a="68893384"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2026 16:21:03 -0800
X-CSE-ConnectionGUID: er8J3jTxQTKaWgFpHOj7dA==
X-CSE-MsgGUID: znKggkO8RgWK0+QLdUyaaQ==
X-ExtLoop1: 1
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.75])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2026 16:20:58 -0800
Date: Sun, 4 Jan 2026 02:20:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Yury Norov <yury.norov@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <aVmyZ0iXzTkNU86y@smile.fi.intel.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2>
 <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
 <937926D0-00DC-499B-9FD8-D921C903882D@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <937926D0-00DC-499B-9FD8-D921C903882D@nvidia.com>
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

On Sat, Jan 03, 2026 at 03:36:44PM +0000, Joel Fernandes wrote:
> > On Jan 3, 2026, at 7:58 AM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Fri, Jan 02, 2026 at 07:50:59PM -0500, Joel Fernandes wrote:
> >> On Mon, Dec 29, 2025 at 11:17:48AM -0500, Steven Rostedt wrote:

...

> >> I use trace_printk() all the time for kernel, particularly RCU development.
> >> One of the key usecases I have is dumping traces on panic (with panic on warn
> >> and stop tracing on warn enabled). This is extremely useful since I can add
> >> custom tracing and dump traces when rare conditions occur. I fixed several
> >> bugs with this technique.
> >> 
> >> I also recommend keeping it convenient to use.
> > 
> > Okay, you know C, please share your opinion what header is the best to hold the
> > trace_printk.h to be included.
> 
> I do not think it is necessary to move it.

I'm not talking about move, I'm talking about the C 101 thingy. Any custom API
should be included before use, otherwise compiler won't see it. Which header do
you want to include to have this API being provided? Note, it's really bad
situation right now with the header to be included implicitly via non-obvious
or obscure path. The discussion moved as far as I see it towards the finding a
good place for the trace_printk.h.

-- 
With Best Regards,
Andy Shevchenko


