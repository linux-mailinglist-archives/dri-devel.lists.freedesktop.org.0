Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F230CF5247
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 19:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFEF510E1D7;
	Mon,  5 Jan 2026 18:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KGQEebl0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DAD10E1D7;
 Mon,  5 Jan 2026 18:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767636167; x=1799172167;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xzQ8MUiL4/i58dgc2OFqW8yINRnyW/ofpF9LycfoB+A=;
 b=KGQEebl0qM/ufZAmGHI21GUGAnUHqiNsCilBvwPYNsBwrOdzEx1l0P8b
 KLM239s3VKEWiNrdDSBB00jszf8TDldHioTRXqUX1HzsdAKU2NY687RaQ
 bYsYLCWt1LaHIx2ugbIGfh0NFziMLlIBjZmJko6sV0DgB38wLY03V5as9
 PCofmiTsKhOFtBIzjDmQ8He083V/hkRLcEVXtD4Z80vI6+139rczKNs9p
 PmARG7tf2YzftiW9CKmoxQZ9IC8S5sHExz1gUFnuJQHBMPuFj1o4FnCEP
 3jSx3FmCyg5QWKu6YVB6GhT/DHDNV8A/TD74ZxQKeB43YqK/4Eaz8nz5z A==;
X-CSE-ConnectionGUID: QexxQmD8QWijdrVc6510Dw==
X-CSE-MsgGUID: RKrwWp0jQz+Kn5XiE/CTgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="91656772"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="91656772"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:02:47 -0800
X-CSE-ConnectionGUID: /TjlNcLXSdy8SIKayOYZSQ==
X-CSE-MsgGUID: XkFOy6bMRhmkEcHEuTh5lg==
X-ExtLoop1: 1
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.215])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 10:02:41 -0800
Date: Mon, 5 Jan 2026 20:02:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
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
Message-ID: <aVv8vwtGFhssitxG@smile.fi.intel.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2>
 <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
 <937926D0-00DC-499B-9FD8-D921C903882D@nvidia.com>
 <aVmyZ0iXzTkNU86y@smile.fi.intel.com>
 <20260105113902.6bdfcfa8@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105113902.6bdfcfa8@gandalf.local.home>
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

On Mon, Jan 05, 2026 at 11:39:02AM -0500, Steven Rostedt wrote:
> On Sun, 4 Jan 2026 02:20:55 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > > I do not think it is necessary to move it.  
> > 
> > I'm not talking about move, I'm talking about the C 101 thingy. Any custom API
> > should be included before use, otherwise compiler won't see it. Which header do
> > you want to include to have this API being provided? Note, it's really bad
> > situation right now with the header to be included implicitly via non-obvious
> > or obscure path. The discussion moved as far as I see it towards the finding a
> > good place for the trace_printk.h.
> 
> It's not a normal API. It's for debugging the kernel. Thus it should be
> available everywhere without having to add a header. Hence, the best place
> to include trace_printk.h, is in kernel.h.

With the above it sounds like you rather want to see it being included as
kconfig.h (to every single file). But I disagree on that approach, why do
we need this header to pollute every file even if I do not debug the thing?

But since the current state is kernel.h, the status quo is to keep it there
for now.

> I'm thinking that my proposed config option is the best solution now. For
> those that do not care about debugging the kernel, you enable the
> "HIDE_TRACE_PRINTK" config so that your builds will be "quicker". But for
> everyone else, it will not slow down their workflow when they need to debug
> code.

Maybe, to keep a status quo.

Seems for now the compromise is to have it split and be included back to
kernel.h and later we can decide if the option or other variants can give a
better granularity for people who are not lazy to remember and add a header if
they need to debug stuff.

Yury, I think in v5 you need to drop this patch, otherwise we won't move further.

-- 
With Best Regards,
Andy Shevchenko


