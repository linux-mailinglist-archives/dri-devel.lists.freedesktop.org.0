Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722B4A2B208
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 20:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E4810E096;
	Thu,  6 Feb 2025 19:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjsar08E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756E510E096
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 19:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738869253; x=1770405253;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6qZMePHjYGI3HrblpDkkzq2CCyuYf7jkYyTtV03nb8M=;
 b=mjsar08EgB8e9S3lJ11oswyNBXeHICbqRXrNB18v4S5qI9cuj1kkqJzH
 ny/u898LHZiETBRSDEL3FIHtJiMpgN05arS6ZA14OlnJ1hOOvr7XnmuUp
 BFyIrwwRpIOMjV17pyl5xUoP2+oo+VVJfnItZiPIxUdcfmv3l34Vuvk4P
 po7rKfoiq4JOjq/tDtQDEh1Kgb7T03s4vkfvRnqSvob+gQBVBouE9eTsL
 QVevhsvBQMeTURjTPM/IzT57PTH7P/pxqdOZjxbaC31uBDRQWvSZNIFY0
 S/qnyZJAW1vzR4qkIhAD2lCJpv0RoUsdi6JXu1IOa+pnMbltUpcffX4/A g==;
X-CSE-ConnectionGUID: BFb7b1YCQ1+SO6WSpWQTFA==
X-CSE-MsgGUID: d6/JZDllQ2GmE0KplNQtcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39189367"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; d="scan'208";a="39189367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 11:14:01 -0800
X-CSE-ConnectionGUID: T5K8LW2ARDupRejRwQiSDw==
X-CSE-MsgGUID: 7uyCuQqjQeCVbAhIwhFN3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112198601"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 11:13:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tg7K0-00000008pHL-03ht; Thu, 06 Feb 2025 21:13:56 +0200
Date: Thu, 6 Feb 2025 21:13:55 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ofir Bitton <obitton@habana.ai>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH v1 1/1] accel/habanalabs: Switch to use %ptTs
Message-ID: <Z6UJ87h0QZ0HHmui@smile.fi.intel.com>
References: <20250206154855.1125731-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206154855.1125731-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Feb 06, 2025 at 05:48:55PM +0200, Andy Shevchenko wrote:
> Use %ptTs instead of open-coded variant to print contents of time64_t type
> in human readable form.

...

>  		dev_err(hdev->dev,
> -			"EQ: {CI %u, HB counter %u, last HB time: %s}, PQ: {PI: %u, CI: %u (%u), last HB time: %s}\n",
> +			"EQ: {CI %u, HB counter %u, last HB time: %ptTs}, PQ: {PI: %u, CI: %u (%u), last HB time: %ptTs}\n",
>  			hdev->event_queue.ci,
>  			heartbeat_debug_info->heartbeat_event_counter,
> -			eq_time_str,
> +			hdev->heartbeat_debug_info.last_eq_heartbeat_ts,

This has to be a pointer...

>  			hdev->kernel_queues[cpu_q_id].pi,
>  			atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
>  			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask,
> -			pq_time_str);
> +			hdev->heartbeat_debug_info.last_pq_heartbeat_ts);

...and this.

I will fix these typos in v2.

-- 
With Best Regards,
Andy Shevchenko


