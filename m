Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1875A7140C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 10:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADA810E3C2;
	Wed, 26 Mar 2025 09:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1M8dwgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB6410E3C2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742982392; x=1774518392;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pSdpOBH3OsiqWCKed9YZ+vvLO/0PxNNz2Btrj67jOc4=;
 b=a1M8dwgUnphgZ/EN+PtjV8EP8a3SurcaIsJCBP80X27BHzjWSyt7N17N
 M9tjIw7vDkNLaCyNNoykCSGHi2guaTTEcbaDwh/BAEiu+z06wkEMygUxW
 hqeTGqPOOkQP/Yjkb2SB5vfmwKUPuP0b4SEtsBdIKJgqdn/dQdTQYpAYO
 Hg625qvz6roBI1+sIe19CKHCPeabinuKT2deH0ARjTECDKVtTtR0u+bMF
 kPQqnTdtwNndPeshBDpRxDKpY9C+pjo7p/8X2BHl2ZgsfMPKC3fDaY27P
 2bpwNAENK1nSVTeMakfFN5vJNy9AREifyQFbXzjktXe4nSUd//iIr+oET w==;
X-CSE-ConnectionGUID: D/IXXQ37QlexMggPsEYmtQ==
X-CSE-MsgGUID: yT+3dXumS0ODmzhOvdOtFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="47912493"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="47912493"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:46:31 -0700
X-CSE-ConnectionGUID: QvIovGnnTvK+1T0AfTwcDw==
X-CSE-MsgGUID: 5IGA7C2wQ0uIRiBikBXcnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="124447276"
Received: from smile.fi.intel.com ([10.237.72.58])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:46:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1txNL8-000000061wz-1N9h; Wed, 26 Mar 2025 11:46:26 +0200
Date: Wed, 26 Mar 2025 11:46:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ofir Bitton <obitton@habana.ai>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v3 1/1] accel/habanalabs: Switch to use %ptTs
Message-ID: <Z-PM8oBtTPzqv-S2@smile.fi.intel.com>
References: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
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

+Cc: Jani (sorry, forgot to add you in the first place).

Do you think it's applicable now?

On Wed, Mar 05, 2025 at 01:00:25PM +0200, Andy Shevchenko wrote:
> Use %ptTs instead of open-coded variant to print contents of time64_t type
> in human readable form.
> 
> This changes N/A output to 1970-01-01 00:00:00 for zero timestamps,
> but it's used only in the dev_err() output and won't break anything.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> v3: explained the difference for N/A cases (Jani)
> v2: fixed the parameters to be the pointers
> 
>  drivers/accel/habanalabs/common/device.c | 25 +++---------------------
>  1 file changed, 3 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
> index 68eebed3b050..80fa08bf57bd 100644
> --- a/drivers/accel/habanalabs/common/device.c
> +++ b/drivers/accel/habanalabs/common/device.c
> @@ -1066,28 +1066,11 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
>  	return (device_id == hdev->pdev->device);
>  }
>  
> -static void stringify_time_of_last_heartbeat(struct hl_device *hdev, char *time_str, size_t size,
> -						bool is_pq_hb)
> -{
> -	time64_t seconds = is_pq_hb ? hdev->heartbeat_debug_info.last_pq_heartbeat_ts
> -					: hdev->heartbeat_debug_info.last_eq_heartbeat_ts;
> -	struct tm tm;
> -
> -	if (!seconds)
> -		return;
> -
> -	time64_to_tm(seconds, 0, &tm);
> -
> -	snprintf(time_str, size, "%ld-%02d-%02d %02d:%02d:%02d (UTC)",
> -		tm.tm_year + 1900, tm.tm_mon, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
> -}
> -
>  static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
>  {
>  	struct eq_heartbeat_debug_info *heartbeat_debug_info = &hdev->heartbeat_debug_info;
>  	u32 cpu_q_id = heartbeat_debug_info->cpu_queue_id, pq_pi_mask = (HL_QUEUE_LENGTH << 1) - 1;
>  	struct asic_fixed_properties *prop = &hdev->asic_prop;
> -	char pq_time_str[64] = "N/A", eq_time_str[64] = "N/A";
>  
>  	if (!prop->cpucp_info.eq_health_check_supported)
>  		return true;
> @@ -1095,17 +1078,15 @@ static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
>  	if (!hdev->eq_heartbeat_received) {
>  		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
>  
> -		stringify_time_of_last_heartbeat(hdev, pq_time_str, sizeof(pq_time_str), true);
> -		stringify_time_of_last_heartbeat(hdev, eq_time_str, sizeof(eq_time_str), false);
>  		dev_err(hdev->dev,
> -			"EQ: {CI %u, HB counter %u, last HB time: %s}, PQ: {PI: %u, CI: %u (%u), last HB time: %s}\n",
> +			"EQ: {CI %u, HB counter %u, last HB time: %ptTs}, PQ: {PI: %u, CI: %u (%u), last HB time: %ptTs}\n",
>  			hdev->event_queue.ci,
>  			heartbeat_debug_info->heartbeat_event_counter,
> -			eq_time_str,
> +			&hdev->heartbeat_debug_info.last_eq_heartbeat_ts,
>  			hdev->kernel_queues[cpu_q_id].pi,
>  			atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
>  			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask,
> -			pq_time_str);
> +			&hdev->heartbeat_debug_info.last_pq_heartbeat_ts);
>  
>  		hl_eq_dump(hdev, &hdev->event_queue);
>  
> -- 
> 2.47.2
> 

-- 
With Best Regards,
Andy Shevchenko


