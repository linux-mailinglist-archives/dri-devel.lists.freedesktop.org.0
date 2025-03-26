Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED51A71437
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 10:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9995210E118;
	Wed, 26 Mar 2025 09:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IaMzXBLm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FA610E118
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742982939; x=1774518939;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+TMyAXA9Y8T/sPf5483bMjpGzBJY2oL2rsAiG0HV9wI=;
 b=IaMzXBLm4rlz4yA0qmmrhzWihVWu5XKMmsML0Vfw04pAywcAqIS2T879
 7IAkeL5GK6NMlhr6FAe1bAdPdZ7VLxJiB/G65tuqeaDA3AETBjitMLy3t
 MmTrGR2aVMy+ULxgTJcJwYk1mP0exqbkAGNnAL9Vd9qsbMkW+kKFNO9mm
 WROt8zHrp3Jo4EaZF+V5YHKbP8BNfTxJOt9aIkZjD/fDx38ObtzrsT24e
 MUuBfKQhMReS6UFX4qepXrSean2kDuz99UdW8eNJ2n1b0ErxSleKjs9xC
 zFed1d6gmgSnGUToVPFu/2a6bEEfvS87qLFxQkZbKuXI+EgpCqQ/wrZfy g==;
X-CSE-ConnectionGUID: ICvVSEhSRqWht2bFJYNNpg==
X-CSE-MsgGUID: 53As9WazTYu3Y5X/lr0/Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54465502"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="54465502"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:55:39 -0700
X-CSE-ConnectionGUID: jWqo8wuuT9Kk/mPQWn9Myg==
X-CSE-MsgGUID: qhwbKTLkSvO1/sD1B/PJOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="155728159"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.210])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 02:55:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>, "Avizrat, Yaron"
 <yaron.avizrat@intel.com>, "Elbaz, Koby" <koby.elbaz@intel.com>, "Sinyuk,
 Konstantin" <konstantin.sinyuk@intel.com>
Subject: Re: [PATCH v3 1/1] accel/habanalabs: Switch to use %ptTs
In-Reply-To: <Z-PM8oBtTPzqv-S2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250305110126.2134307-1-andriy.shevchenko@linux.intel.com>
 <Z-PM8oBtTPzqv-S2@smile.fi.intel.com>
Date: Wed, 26 Mar 2025 11:55:33 +0200
Message-ID: <87zfh86rqi.fsf@intel.com>
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

On Wed, 26 Mar 2025, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> +Cc: Jani (sorry, forgot to add you in the first place).
>
> Do you think it's applicable now?

Cc: Yaron, Koby, and Konstantin who are supposed to be the new
maintainers for accel/habanalabs.


BR,
Jani.



>
> On Wed, Mar 05, 2025 at 01:00:25PM +0200, Andy Shevchenko wrote:
>> Use %ptTs instead of open-coded variant to print contents of time64_t type
>> in human readable form.
>> 
>> This changes N/A output to 1970-01-01 00:00:00 for zero timestamps,
>> but it's used only in the dev_err() output and won't break anything.
>> 
>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> ---
>> 
>> v3: explained the difference for N/A cases (Jani)
>> v2: fixed the parameters to be the pointers
>> 
>>  drivers/accel/habanalabs/common/device.c | 25 +++---------------------
>>  1 file changed, 3 insertions(+), 22 deletions(-)
>> 
>> diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
>> index 68eebed3b050..80fa08bf57bd 100644
>> --- a/drivers/accel/habanalabs/common/device.c
>> +++ b/drivers/accel/habanalabs/common/device.c
>> @@ -1066,28 +1066,11 @@ static bool is_pci_link_healthy(struct hl_device *hdev)
>>  	return (device_id == hdev->pdev->device);
>>  }
>>  
>> -static void stringify_time_of_last_heartbeat(struct hl_device *hdev, char *time_str, size_t size,
>> -						bool is_pq_hb)
>> -{
>> -	time64_t seconds = is_pq_hb ? hdev->heartbeat_debug_info.last_pq_heartbeat_ts
>> -					: hdev->heartbeat_debug_info.last_eq_heartbeat_ts;
>> -	struct tm tm;
>> -
>> -	if (!seconds)
>> -		return;
>> -
>> -	time64_to_tm(seconds, 0, &tm);
>> -
>> -	snprintf(time_str, size, "%ld-%02d-%02d %02d:%02d:%02d (UTC)",
>> -		tm.tm_year + 1900, tm.tm_mon, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
>> -}
>> -
>>  static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
>>  {
>>  	struct eq_heartbeat_debug_info *heartbeat_debug_info = &hdev->heartbeat_debug_info;
>>  	u32 cpu_q_id = heartbeat_debug_info->cpu_queue_id, pq_pi_mask = (HL_QUEUE_LENGTH << 1) - 1;
>>  	struct asic_fixed_properties *prop = &hdev->asic_prop;
>> -	char pq_time_str[64] = "N/A", eq_time_str[64] = "N/A";
>>  
>>  	if (!prop->cpucp_info.eq_health_check_supported)
>>  		return true;
>> @@ -1095,17 +1078,15 @@ static bool hl_device_eq_heartbeat_received(struct hl_device *hdev)
>>  	if (!hdev->eq_heartbeat_received) {
>>  		dev_err(hdev->dev, "EQ heartbeat event was not received!\n");
>>  
>> -		stringify_time_of_last_heartbeat(hdev, pq_time_str, sizeof(pq_time_str), true);
>> -		stringify_time_of_last_heartbeat(hdev, eq_time_str, sizeof(eq_time_str), false);
>>  		dev_err(hdev->dev,
>> -			"EQ: {CI %u, HB counter %u, last HB time: %s}, PQ: {PI: %u, CI: %u (%u), last HB time: %s}\n",
>> +			"EQ: {CI %u, HB counter %u, last HB time: %ptTs}, PQ: {PI: %u, CI: %u (%u), last HB time: %ptTs}\n",
>>  			hdev->event_queue.ci,
>>  			heartbeat_debug_info->heartbeat_event_counter,
>> -			eq_time_str,
>> +			&hdev->heartbeat_debug_info.last_eq_heartbeat_ts,
>>  			hdev->kernel_queues[cpu_q_id].pi,
>>  			atomic_read(&hdev->kernel_queues[cpu_q_id].ci),
>>  			atomic_read(&hdev->kernel_queues[cpu_q_id].ci) & pq_pi_mask,
>> -			pq_time_str);
>> +			&hdev->heartbeat_debug_info.last_pq_heartbeat_ts);
>>  
>>  		hl_eq_dump(hdev, &hdev->event_queue);
>>  
>> -- 
>> 2.47.2
>> 

-- 
Jani Nikula, Intel
