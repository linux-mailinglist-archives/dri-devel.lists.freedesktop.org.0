Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 625EDCA03BC
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 18:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097CE10E179;
	Wed,  3 Dec 2025 17:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HTGEP45W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B6E10E179;
 Wed,  3 Dec 2025 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764781271; x=1796317271;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EOXn1ynSH/t9im4rCIUdywcb+MTfre1eFRENecT/JJA=;
 b=HTGEP45WipWS/c6rTRueyUzwtnT5FttmgG89Snc3PMbvBKbn3HL8Y3HW
 aqxWKp4wfUeU6CF6IYvrhPM5AXOwwuSF/kSGx/gWiYNoyIqvfsjStpWnp
 1HxOU/ddmthL0ggfTd10Q2LmrjFuXO3/RS614BvtEQQ5tfahEZMvy6PTq
 zGMtYJfwdaZMhxW8Sa7e8L3Gb0LucaYlQo1sg7kYOXc2eKRVpJ84TPU6J
 OF1qIASMPXEU/K+lcDujLYhNIaRMIihsTXaIC4j9w+kf+LMX24gu7XqWe
 wVhEFvhYNFSC8u/prAt+rYxQLbtIUxzrWxwH7qjLO8SnA+NcxQJXab6bn Q==;
X-CSE-ConnectionGUID: vmVwsAk2QqGMIeUP9V2vcQ==
X-CSE-MsgGUID: ZclZMeZHSfqvNvGEh+9zPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84383136"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="84383136"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:00:59 -0800
X-CSE-ConnectionGUID: NTtfOUV+RX2LKbgRk4ZKXA==
X-CSE-MsgGUID: BXPJ0dYnSKGRVRGViN4WTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="194979524"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.81])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 09:00:50 -0800
Date: Wed, 3 Dec 2025 19:00:45 +0200
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
Subject: Re: [PATCH v2 2/4] moduleparam: include required headers explicitly
Message-ID: <aTBsvbWVfZrVJo2M@smile.fi.intel.com>
References: <20251203162329.280182-1-yury.norov@gmail.com>
 <20251203162329.280182-3-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203162329.280182-3-yury.norov@gmail.com>
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

On Wed, Dec 03, 2025 at 11:23:23AM -0500, Yury Norov (NVIDIA) wrote:
> The following patch drops moduleparam.h dependency on kernel.h. In
> preparation to it, list all the required headers explicitly.

> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>

> CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

You can move this line after --- or use --cc when formatting patch,
no need to pollute the commit message with it.

In any case, the change LGTM and you can just replace the above with

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


