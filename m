Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6D5A4EC95
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 20:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207D710E694;
	Tue,  4 Mar 2025 19:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ho5aotQ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4D110E694
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 19:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741114926; x=1772650926;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ayXsGKs0QGA7CpWdVW6eI96ciKKl3wEY9G6eT/yGBVo=;
 b=ho5aotQ4QJ65/kmvAlqhOgooZ9XrFZ9fEKWMPqz3fUM5O7VEDcVdus9z
 vsP0pSGOE/e52wPUSTKO4qwipeTlaxAD4nSAEBjIi+Ft4uM9Udd0bzWMu
 w33MPkO06y3Sv7U6VmVYCA8tpOLGRMBVqn/uM23/MvCOVSR2w+k8e5h8B
 Gwmgb1whGBTcGae9j5VBGp/TYAm8AXljTZ8Ik4DtdK4U6pjqvOugaVhHQ
 ONO19uVwxoFK0y+eI6Q5bJeT+f6GIPUo2beKTPocjSHiDyLvyWiRrVp31
 FUVXLvzGzid+Iu5KAG5tOdkIU2ALpRDcZ/5gNyTrlD6U2HJA4M4plTjJu A==;
X-CSE-ConnectionGUID: wAl8k9bfTOyB8BIq5rVDyg==
X-CSE-MsgGUID: czdmDECnRcOK1wK2B/GWqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29638716"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="29638716"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 11:02:06 -0800
X-CSE-ConnectionGUID: e41hVRiKTWi9ppRiEqBS7g==
X-CSE-MsgGUID: hjLpz2tzQGOlp6vhyhHoMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="123388945"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 11:02:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Avizrat, Yaron"
 <yaron.avizrat@intel.com>, "Elbaz, Koby" <koby.elbaz@intel.com>, "Sinyuk,
 Konstantin" <konstantin.sinyuk@intel.com>
Subject: Re: [PATCH v2 1/1] accel/habanalabs: Switch to use %ptTs
In-Reply-To: <20250206192109.1133364-2-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250206192109.1133364-2-andriy.shevchenko@linux.intel.com>
Date: Tue, 04 Mar 2025 21:01:59 +0200
Message-ID: <87jz94y5zs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 06 Feb 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> Use %ptTs instead of open-coded variant to print contents of time64_t type
> in human readable form.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>
> v2: fixed the parameters to be the pointers
>
>  drivers/accel/habanalabs/common/device.c | 25 +++---------------------
>  1 file changed, 3 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
> index 30277ae410d4..96897c12dfee 100644
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

The "N/A" gets replaced with, I presume, "1970-01-01 00:00:00" for 0
timestamps, which is not the same thing.

But I honestly don't know anything about the driver.


BR,
Jani.

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

-- 
Jani Nikula, Intel
