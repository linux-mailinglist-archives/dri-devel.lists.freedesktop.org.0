Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92016CF2C32
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 10:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA1810E11C;
	Mon,  5 Jan 2026 09:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cuf2rOVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F8B10E025;
 Mon,  5 Jan 2026 09:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767605403; x=1799141403;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3aeeMp6ak1HerM3cNE27GpqkM0XuOeP2yNlseSEMLac=;
 b=cuf2rOVkuHKHhwxg0i7Ievxq/OM/4dQYC9n/wr7ULk4aIhDQMnNjRRCN
 uuWSimWJF7c/MB1L+N5vS08Ufj2S6MDCazzjBk8woMndKcUfZxXb/bWME
 e/1vZRpGMeUT5ulSy0CmBduCx3AFTREYFN9z82SWcQdFTqAuREkodwjiM
 +4vmbZbF8ztL7Qgku26eUpnm5k2Fqljbxw0SBcoFVNuhdd86r/5mUshY8
 NXLFVYZdn7H81Z9XKZoriJcPeUV+aUIgSKRAJDoUnR3Q9O0CSg3gC0nEj
 8mZCqbVs/yT4pA39dYsiO900hJjmtFLVN+6moQVWXfBuOI1xBGKGgNuWI g==;
X-CSE-ConnectionGUID: DL0hlssxTJOYLIT+rxk31g==
X-CSE-MsgGUID: aWAwuo0BSuCgHtvAsqdbcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="69043956"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="69043956"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:30:03 -0800
X-CSE-ConnectionGUID: l5Ti4E8eQMaEq5OK4MdMvw==
X-CSE-MsgGUID: SK370VCUT9avmAy9E63dhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="233043201"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.3])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:29:55 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Steven Rostedt
 <rostedt@goodmis.org>, Andrew Morton <akpm@linux-foundation.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, David Laight
 <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko
 Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
In-Reply-To: <aVkmQ4EGIQgAddZQ@yury>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2> <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
 <aVkmQ4EGIQgAddZQ@yury>
Date: Mon, 05 Jan 2026 11:29:51 +0200
Message-ID: <254c1096c3b892923dd12b07a8b80291b88c0e9b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sat, 03 Jan 2026, Yury Norov <yury.norov@gmail.com> wrote:
> On Sat, Jan 03, 2026 at 02:57:58PM +0200, Andy Shevchenko wrote:
>> On Fri, Jan 02, 2026 at 07:50:59PM -0500, Joel Fernandes wrote:
>> > On Mon, Dec 29, 2025 at 11:17:48AM -0500, Steven Rostedt wrote:
>> 
>> ...
>> 
>> > I use trace_printk() all the time for kernel, particularly RCU development.
>> > One of the key usecases I have is dumping traces on panic (with panic on warn
>> > and stop tracing on warn enabled). This is extremely useful since I can add
>> > custom tracing and dump traces when rare conditions occur. I fixed several
>> > bugs with this technique.
>> > 
>> > I also recommend keeping it convenient to use.
>> 
>> Okay, you know C, please share your opinion what header is the best to hold the
>> trace_printk.h to be included.
>
> What if we include it on Makefile level, similarly to how W=1 works?
>
>         make D=1 // trace_printk() is available
>         make D=0 // trace_printk() is not available
>         make     // trace_printk() is not available
>
> Where D stands for debugging.
>
> D=1 may be a default setting if you prefer, but the most important is
> that every compilation unit will have an access to debugging without
> polluting core headers.

You do realize this means recompiling everything when adding D=1 for
debugging?

BR,
Jani.

-- 
Jani Nikula, Intel
