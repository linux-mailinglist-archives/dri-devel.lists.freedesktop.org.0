Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D2ACEFF17
	for <lists+dri-devel@lfdr.de>; Sat, 03 Jan 2026 13:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E6010E34E;
	Sat,  3 Jan 2026 12:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7rDQ9vL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E64210E33F;
 Sat,  3 Jan 2026 12:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767445087; x=1798981087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zUPx4E/hNNF3I3u24hIELKoJzQiebtlyaltGOIKAEr4=;
 b=m7rDQ9vLNZa8zkLOJe51UMnF9Z49u692yCWrKxBRt/YalTPi+KKMj3i1
 5qG1kmjMKQtsdbmINhs/hlJrfH91ZCaNks8qtJo22nL1DjjaA2u0wI8/k
 H8fFipcBdXcEZK772gHNfBrMFY512PXhIT1F/Ty+IlxDGt/3yzvU0nO54
 xQRUdryWdc7uMNxV9S+6A+9/TG1SXHsNZh+hsGbDiSuuLAp5JdgaGfCzZ
 pNT0vvXmRzKBO3iW0EDjYm6No0snRMdoba3/EfYYWezIU8VI+LoLPbj6+
 NhpHDtT0Q6p5mgdoHp6EtjY9zzG14gV4SlM37mv6YJfQamA7V4WZJCXWN Q==;
X-CSE-ConnectionGUID: BUtzNKy4Q7SPoud9LULZbQ==
X-CSE-MsgGUID: WKSgUsPfRcq+7tpPPszd7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="86315920"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; d="scan'208";a="86315920"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2026 04:58:06 -0800
X-CSE-ConnectionGUID: OZMavmVNQHWWd/KK3gHuqg==
X-CSE-MsgGUID: bvE4/ZGiSoa6EseZj1KFRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; d="scan'208";a="202014319"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.75])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2026 04:58:00 -0800
Date: Sat, 3 Jan 2026 14:57:58 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
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
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] kernel.h: drop trace_printk.h
Message-ID: <aVkSVk2L6VH9MYGz@smile.fi.intel.com>
References: <20251225170930.1151781-1-yury.norov@gmail.com>
 <20251225170930.1151781-8-yury.norov@gmail.com>
 <20251226115848.298465d4@gandalf.local.home>
 <20251228133150.1d5731d04bc1b685b0fe81c1@linux-foundation.org>
 <20251229111748.3ba66311@gandalf.local.home>
 <20260103005059.GA11015@joelbox2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260103005059.GA11015@joelbox2>
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

On Fri, Jan 02, 2026 at 07:50:59PM -0500, Joel Fernandes wrote:
> On Mon, Dec 29, 2025 at 11:17:48AM -0500, Steven Rostedt wrote:

...

> I use trace_printk() all the time for kernel, particularly RCU development.
> One of the key usecases I have is dumping traces on panic (with panic on warn
> and stop tracing on warn enabled). This is extremely useful since I can add
> custom tracing and dump traces when rare conditions occur. I fixed several
> bugs with this technique.
> 
> I also recommend keeping it convenient to use.

Okay, you know C, please share your opinion what header is the best to hold the
trace_printk.h to be included.

-- 
With Best Regards,
Andy Shevchenko


