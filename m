Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC87C947E8
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 21:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD2810E21F;
	Sat, 29 Nov 2025 20:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dP0cJN/v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC85810E21E;
 Sat, 29 Nov 2025 20:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764448358; x=1795984358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ShffxbWiE7yWibvnAjeOzPZLjmqw2h5xktqTp4Co+KA=;
 b=dP0cJN/vae45wpvB7EVKHp35ZvrNUSpiNeALOuQ/SHCQmrDf5YGkvODv
 fHrU8iQwavKWZtOiy6BzH8zsvJjQgeJ2LedmZNTZ24Q3NkyiOye8wRVk2
 DRAdP5/VzeTRiuCEJyF4m75wksWSgsOgqqdqz2qbA06frIOqGz+S1Bu3X
 +qs6Y8F3DZwqZbFHVOMM4TNTjQ91nE2HXiw/BUuP0Lyt/2ut4y7o2C4Z9
 qDIlRPg4sU5eesG+ZZrYBU0eIUpiXKa50ksl7pM68vtW1nj9DZpquWQ1K
 SvESwT4Wx6Q6aRcyZift536Mwos2GQgq/HRjZ544rYAb8giwb/d7Jli2g A==;
X-CSE-ConnectionGUID: arw83SwUQHizOajTn5aKxA==
X-CSE-MsgGUID: HiIIvibYTDu4cErdwHqUtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66387776"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="66387776"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:32:38 -0800
X-CSE-ConnectionGUID: 7BMz4dpNQP6Xdxj4ChepVw==
X-CSE-MsgGUID: BeRkOaU8QsqgNKfB/YNSJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="194138307"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.50])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:32:32 -0800
Date: Sat, 29 Nov 2025 22:32:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
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
Message-ID: <aStYXphpN84Nr8LZ@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-2-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129195304.204082-2-yury.norov@gmail.com>
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

On Sat, Nov 29, 2025 at 02:53:00PM -0500, Yury Norov (NVIDIA) wrote:
> The macro is only used by i915. Move it to a local header and drop from
> the kernel.h.

Agree, if one wants to reinstate it, there should be better place for it
(something related to kasan?).

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


