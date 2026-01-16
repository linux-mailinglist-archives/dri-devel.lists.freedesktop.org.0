Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CA2D2FBBD
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3269688F94;
	Fri, 16 Jan 2026 10:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8KWyAek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CDE88F94;
 Fri, 16 Jan 2026 10:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768560217; x=1800096217;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L0lytLGMbujuZg+wBdouHk2nzLvJCJL5TeiQkzFCsbY=;
 b=G8KWyAekit1XCkOWiV2Z5YgAmWsbdUdbZPYsnMq6l6dWp9yl9y+HZmR9
 Yz86eXx/Bnkao3gSpGoiTlV5BCVcCGtZijSKOGnv4spAOLE5WFYDJyIBD
 YIJ5J64eUjwS8UZ4P/wsNJBl3Xxs+SLXlR0C7tcUBalXrZ/Oe47tej7vw
 /xLfKv1R+NnKyR6BugyRsTTMx1M1IlSXlq20sgh1/aMMf3QU19mqVgZiJ
 zhxiiClVbNMhQJipVscsDMolh5nX7k+CgU4Xwo0bgLfiH3ACLm8GzVB2L
 d/1KgcoDJcEZt50qSSC0SqRBRrNFH1qhyuqp/LcQTDqxlgzWEzyNhnarf w==;
X-CSE-ConnectionGUID: aP7FDccOSsa/Gub2OCGU2A==
X-CSE-MsgGUID: kkcFg81wRK2LkpSVqYjC0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87292976"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="87292976"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:43:36 -0800
X-CSE-ConnectionGUID: aLO6LASYTmOVfJQX2XCTvA==
X-CSE-MsgGUID: hLd/cwkqSKuD90ysnWpX4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="205493856"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:43:31 -0800
Date: Fri, 16 Jan 2026 12:43:28 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <ynorov@nvidia.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: Re: [PATCH v5 4/6] kernel.h: include linux/instruction_pointer.h
 explicitly
Message-ID: <aWoWUNZM2lq9XlWO@smile.fi.intel.com>
References: <20260116042510.241009-1-ynorov@nvidia.com>
 <20260116042510.241009-5-ynorov@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116042510.241009-5-ynorov@nvidia.com>
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

On Thu, Jan 15, 2026 at 11:25:07PM -0500, Yury Norov wrote:
> In preparation for decoupling linux/instruction_pointer.h and
> linux/kernel.h, include instruction_pointer.h explicitly where needed.

LGTM, assuming no build breakages
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


