Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7DFC9A7AD
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 08:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD0F10E5A1;
	Tue,  2 Dec 2025 07:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btz0WYEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A915910E5A0;
 Tue,  2 Dec 2025 07:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764661047; x=1796197047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dpaBgaXtJH3szD/lMO34UVn3hJPCUmClZoyBvobwS6s=;
 b=btz0WYEEWyBpFxtY+90pCGitbgCQpojoOtkoaKOHuSJ5/DKQrQ4JtCAh
 lKSygUs8dlosYLGPt4MjFsf8oLpB4Uwxeib1rXwzFyiXH2riArWAjja20
 a7Qo1MughmUDwDHux5VznDg6LE1FFm2eLG7Fo9u7vcKZ1utRdzy6wOWQQ
 VxWj1vfukPKu8gE/X1DrbZhiQH5TrpuRTny9K61fXU79Rlzp0ZwTL3rPX
 d3/Sbui1dFlx2BwtSUXC3OqgWQC5Y8C4Kcpu6Aaw8255sWniDfXfZOUQZ
 DA9ddz0VXdI2PfICjA0ZSi03obj4z/AeWxBiP0BqyFgTOVSW9+zGd4PKr Q==;
X-CSE-ConnectionGUID: dv1ZCZ2+QJaNV0qcN+tL8w==
X-CSE-MsgGUID: o5yY0melSk6e5Xjf05O6CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84219292"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="84219292"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:37:27 -0800
X-CSE-ConnectionGUID: 44r/V27uQ+OX+jTsikvq0Q==
X-CSE-MsgGUID: LH6LluTOTwivvfv8Aejv7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="198504967"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 23:37:22 -0800
Date: Tue, 2 Dec 2025 09:37:20 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
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
Subject: Re: [PATCH 1/3] kernel.h: drop STACK_MAGIC macro
Message-ID: <aS6XMMeSDyrYMmWE@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-2-yury.norov@gmail.com>
 <3e7ddbea-978f-44f7-abdd-7319908fd83c@kernel.org>
 <aS5T9-1z7PK32q9R@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aS5T9-1z7PK32q9R@yury>
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

On Mon, Dec 01, 2025 at 09:50:31PM -0500, Yury Norov wrote:
> On Mon, Dec 01, 2025 at 10:38:01AM +0100, Christophe Leroy (CS GROUP) wrote:
> > Le 29/11/2025 à 20:53, Yury Norov (NVIDIA) a écrit :

...

> You can check commit 4914d770dec4 in this project:
> 
> https://archive.org/details/git-history-of-linux

Side note: we have history/history.git tree on kernel.org, and,
if anyone wants to check, it is handy.

Each of the history tree has its own pros and cons:
https://stackoverflow.com/a/51901211/2511795

-- 
With Best Regards,
Andy Shevchenko


