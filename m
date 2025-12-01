Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B2EC98D5F
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 20:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB65F10E468;
	Mon,  1 Dec 2025 19:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfQrjvb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788C610E460;
 Mon,  1 Dec 2025 19:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764616830; x=1796152830;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aonye0tlAvNGnQxCutJyOBdaip/hewIAkc66JsRr1fE=;
 b=MfQrjvb/VL8wwJqTjAwY00Z3NIzsuVJibcISWyws1jkcon9tzRGzW78k
 fbA8RL+zWjzNWtmTTg1Jz1b99akwXSL1yeNsAWbdc4CBrWATAx+f+kIgd
 OVJzWQhOlohsqlXJ0paXuZsEL1TKa53RrYZcrdk/dJeWRvg+niuZwBX0a
 5SPPd5rl2SVNJsGBc0vh62LNsRi0TLI3mXqI8dlBG7LDvS6y+4PYAczLY
 /2PSBHrZuuyC8CTpBlwh48ccXh+o8VmkpmKU6GH5Am+dOKTk8ngFhm9r/
 PdmB01PBGUu6x/nLykwBKyDycBcrMU54tk72oYmQgcFNOa7k047xMzMCU w==;
X-CSE-ConnectionGUID: I3+hkZSEQ4eiVq9nyEe0Mg==
X-CSE-MsgGUID: JrYvsaHJQR2CLbYNp4fUng==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77257104"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="77257104"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 11:20:30 -0800
X-CSE-ConnectionGUID: 4ymANUSGTIiz5hqaTHvpnA==
X-CSE-MsgGUID: 3Rwt4ccUTAa71Ggv8DCsjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193835168"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.4])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 11:20:25 -0800
Date: Mon, 1 Dec 2025 21:20:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to sysfs.h
Message-ID: <aS3qd9FC-9nBGYEP@smile.fi.intel.com>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-3-yury.norov@gmail.com>
 <c45058d5-d690-4731-85d1-434971c16f92@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c45058d5-d690-4731-85d1-434971c16f92@suse.com>
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

On Mon, Dec 01, 2025 at 08:01:23PM +0100, Petr Pavlu wrote:
> On 11/29/25 8:53 PM, Yury Norov (NVIDIA) wrote:

...

> > -#include <linux/kernel.h>
> > +#include <linux/sysfs.h>
> 
> If you are removing the kernel.h include from
> include/linux/moduleparam.h, I think it would be good to update the file
> to ensure that all necessary includes are now listed directly.
> 
> The following items are present in moduleparam.h:
> 
> * __UNIQUE_ID(), __used(), __section(), __aligned(), __always_unused()
>   -> linux/compiler.h,
> * THIS_MODULE -> linux/init.h,
> * __stringify() -> linux/stringify.h,
> * u8, s8, u16, ... -> linux/types.h,
> * static_assert() -> linux/build_bug.h,
> * VERIFY_OCTAL_PERMISSIONS() -> linux/sysfs.h,
> * ARRAY_SIZE() -> linux/array_size.h.
> 
> I suggest then updating the includes in include/linux/moduleparam.h to:
> 
> #include <linux/array_size.h>
> #include <linux/build_bug.h>
> #include <linux/compiler.h>
> #include <linux/init.h>
> #include <linux/stringify.h>
> #include <linux/sysfs.h>
> #include <linux/types.h>

Good point. And since we are not adding some top-level ones, this shouldn't
be worse (in terms of potential cyclic dependencies).

-- 
With Best Regards,
Andy Shevchenko


