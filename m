Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A6DCA94EA
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 21:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5FC210E082;
	Fri,  5 Dec 2025 20:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e828rm0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A61110E082;
 Fri,  5 Dec 2025 20:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764968129; x=1796504129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2M76oGPEhzayf94fY3W/5vUFykQITW0NDibgO6rlkhs=;
 b=e828rm0jTN5HJ1+NwHASEaNwfcDVNzeLD3EB8PrLBAMxcY3z7rPmnVNt
 K2gMzX05rYTMz4cy1cPyrLfs58Us/lGpOm5fNvo2LgMm5T2UbjNmQPriw
 4iEYZgsY1aV+99O5M2I9D9bgD5oHo+Ht75B/b7SY9Ee8xdvJJ6zo827Na
 Wk7gpzp0P+9YOjyqESsjDjP6NdGej28PpwGDV2iLPZH/C/GH+9hucSoaq
 KcLZAGFs7vu9hGt5LQ9h6267mAlAOddXVhCAwNAgwViioLmzmsJ5vTg+g
 LRi4nyUw8jg9FIqQzZnNVpO7gVpVCR5V0BSMxDQxksP3TCWKGC4PMQj2d w==;
X-CSE-ConnectionGUID: rLbhp4XSRaym796M6HMhrw==
X-CSE-MsgGUID: jPQ80H8sS3uV2qTwoIZBYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77628233"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="77628233"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:55:29 -0800
X-CSE-ConnectionGUID: tAx0bR2HStyhixRuAJB4Sw==
X-CSE-MsgGUID: nZK1zXyWQR+i24Bpjzp7qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="194687534"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 12:55:24 -0800
Date: Fri, 5 Dec 2025 22:55:21 +0200
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
Subject: Re: [PATCH v3 4/4] tracing: move tracing declarations from kernel.h
 to a dedicated header
Message-ID: <aTNGuY24Y3sHkRiz@smile.fi.intel.com>
References: <20251205175237.242022-1-yury.norov@gmail.com>
 <20251205175237.242022-5-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205175237.242022-5-yury.norov@gmail.com>
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

On Fri, Dec 05, 2025 at 12:52:35PM -0500, Yury Norov (NVIDIA) wrote:
> Tracing is a half of the kernel.h in terms of LOCs, although it's
> a self-consistent part. It is intended for quick debugging purposes
> and isn't used by the normal tracing utilities.
> 
> Move it to a separate header. If someone needs to just throw a
> trace_printk() in their driver, they will not have to pull all
> the heavy tracing machinery.
> 
> This is a pure move, except for removing a few 'extern's.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


