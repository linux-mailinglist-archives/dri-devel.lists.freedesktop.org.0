Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087EAD2FAD6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 11:39:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B839710E85A;
	Fri, 16 Jan 2026 10:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nzNXiI7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 846C210E859;
 Fri, 16 Jan 2026 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768559951; x=1800095951;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6vNrFyt9pKsyjaHJvFfeVXE3gFVxD5FmN8r8HpRCAL4=;
 b=nzNXiI7tOb0u8RkwNX+OotGM1Gwj53vp/3DxDja8F24Ud0lFVBGm3hGZ
 N/Z/yewAH93PZe9tMJz3O1/iBIYd6EBgLrF+Dn/2Ou4EjGpdLbO0/WqDs
 At5J8bRJGqbkeLpdlAup1WI8KrxKJJGfTbTxM4gzov960GGb2FZZZhFkA
 BgOYu2g6a/kFxn4ER8RMLpnTG9ikqCT8U2GSXvU/VsHerJL52etSmw7Gj
 yG2qn8k9fUAZuScRJf/Mqa7nCUnWsdQbgV5Di0f5mgOi75gkeOMBYlA9v
 Li5k+kjieOKqg0yycC5yERUjrg+QmM87MotD/Jc9VT9yHnE4Air2kWoLO A==;
X-CSE-ConnectionGUID: MWY+X9u7R76eRepmE4z0iQ==
X-CSE-MsgGUID: F6a2NQv3T4a7O6LA17Pqrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69077072"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="69077072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:39:11 -0800
X-CSE-ConnectionGUID: +TNIa+a4RweZweo1j82YLw==
X-CSE-MsgGUID: qENavIesRUuTn8PEvbP5wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="204420540"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.99])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 02:39:05 -0800
Date: Fri, 16 Jan 2026 12:39:02 +0200
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
Subject: Re: [PATCH v5 0/6] Unload linux/kernel.h
Message-ID: <aWoVRlm1GFux-Z-9@smile.fi.intel.com>
References: <20260116042510.241009-1-ynorov@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116042510.241009-1-ynorov@nvidia.com>
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

On Thu, Jan 15, 2026 at 11:25:03PM -0500, Yury Norov wrote:
> kernel.h hosts declarations that can be placed better. This series
> decouples kernel.h with some explicit and implicit dependencies; also,
> moves tracing functionality to a new independent header.

Thanks! Which tree should it go through?

-- 
With Best Regards,
Andy Shevchenko


