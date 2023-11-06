Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25CA7E21EC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 13:41:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067C410E2EC;
	Mon,  6 Nov 2023 12:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD7710E2EC
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699274469; x=1730810469;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LSeBMi1V5puJ4kjop/zQQ27d7ayO2crDSP5WRSkd8n0=;
 b=J8nOFzK3Gx66euvzUF96CMWC0LuTlXDGGK97+BZrQwK07BHrDVc+qMVJ
 jblJ35OKzrUHMPypf4duosM/JmwLP6Mv+X70m/aEzsvU9D8a3MzrhJkpi
 HoqyymiihmzRiXRGidtDLzfP6ix0VreL2kgnIxV3QkWXiyJtAWM78W28A
 ED2/uEXWLd1EnlSNzcyk4r8quQzfx/2LS92tfKUjtM0zmHnaljwx+DcUs
 B/91lomrI/DZuD/wTPxUH8igvI3vmkLSFkeTXXaPvIE1d/FLbFf5z50w6
 R1u8Dl0KqYNjCliGdlKXSwXzmMo/eD+dtP7ijh7ZuKwrWgdhDmt16BwPf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="389075516"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="389075516"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 04:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="3435306"
Received: from ajayshan-mobl.ger.corp.intel.com (HELO [10.213.234.152])
 ([10.213.234.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 04:41:08 -0800
Message-ID: <42646224-60e4-4ac1-b554-730b66fb2704@linux.intel.com>
Date: Mon, 6 Nov 2023 12:41:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Some drm scheduler internal renames
Content-Language: en-US
To: Luben Tuikov <ltuikov89@gmail.com>, dri-devel@lists.freedesktop.org
References: <20231102105538.391648-1-tvrtko.ursulin@linux.intel.com>
 <88bd3e1d-db66-40de-b06f-adcaefacccf3@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <88bd3e1d-db66-40de-b06f-adcaefacccf3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/11/2023 01:51, Luben Tuikov wrote:
> On 2023-11-02 06:55, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> I found some of the naming a bit incosistent and unclear so just a small
>> attempt to clarify and tidy some of them. See what people think if my first
>> stab improves things or not.
>>
>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>>
>> Tvrtko Ursulin (5):
>>    drm/sched: Rename drm_sched_get_cleanup_job to be more descriptive
>>    drm/sched: Move free worker re-queuing out of the if block
>>    drm/sched: Rename drm_sched_free_job_queue to be more descriptive
>>    drm/sched: Rename drm_sched_run_job_queue_if_ready and clarify
>>      kerneldoc
>>    drm/sched: Drop suffix from drm_sched_wakeup_if_can_queue
>>
>>   drivers/gpu/drm/scheduler/sched_entity.c |  4 +-
>>   drivers/gpu/drm/scheduler/sched_main.c   | 53 ++++++++++++------------
>>   include/drm/gpu_scheduler.h              |  2 +-
>>   3 files changed, 29 insertions(+), 30 deletions(-)
>>
> 
> Series is,
> 
> Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>
> 
> and pushed to drm-misc-next.

Oh thanks, I definitely did not expect that to happen so quickly, 
especially since it conflicts with your fix for RR and there are some 
other opens. But it is fine, all that can be worked on top.

Regards,

Tvrtko
