Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED228C3E99
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 12:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DF710E3C6;
	Mon, 13 May 2024 10:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9PXEmsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB6810E214
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 10:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715594897; x=1747130897;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5CY5SAwdoOVBNicZIN1bGOSxwdsKESVpmN4PRcnAjXs=;
 b=A9PXEmsE/ZPBZkDul+QTWJPDsIgL8cHYrHfMBWlk2plMaPIiQwkXRmF6
 3fS/erayG9A5DOwk/v0lvHpl+fInCe6gdy6pdKCI8CfrzJwNDudlTVFjo
 mzwMHMNNv1Er/A+gdoPHRGNElo41sXk3ee72fEAx+aHdLpHHfIw51eScS
 UAIx02V8IAv8/Tl2XEjdGZrL0D7jf0AHxN4kGPJzf5QCY4kF2fteAnb0z
 1KfCOk0DciHY/c9dPve0TepmVnYtUMszKRlzPaG5yJssmxARV65TsiNCI
 JBTQfPZqH7iB9gJQft1HpPVq1PQjoDty59DSNlHf8VkFbjBuzae7eJ9WE A==;
X-CSE-ConnectionGUID: ilGsGCtUQiyRBQrXJG60RQ==
X-CSE-MsgGUID: GU78zJovT++P44549aPS8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="22669125"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="22669125"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:08:17 -0700
X-CSE-ConnectionGUID: 1Nw3uXUITTG2JlR76fvkSQ==
X-CSE-MsgGUID: BQ4UkQRPRe+Dd/6mrUShtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="67790986"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.3.118])
 ([10.246.3.118])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 03:08:16 -0700
Message-ID: <979e4219-622f-41d2-9e92-c8bcb4d516da@linux.intel.com>
Date: Mon, 13 May 2024 12:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] accel/ivpu: Add sched_mode module param
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, "Wachowski, Karol" <karol.wachowski@intel.com>
References: <20240508132106.2387464-1-jacek.lawrynowicz@linux.intel.com>
 <20240508132106.2387464-3-jacek.lawrynowicz@linux.intel.com>
 <9454cd02-52be-756c-6051-46b1d38a185d@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <9454cd02-52be-756c-6051-46b1d38a185d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

On 10.05.2024 18:30, Jeffrey Hugo wrote:
> On 5/8/2024 7:20 AM, Jacek Lawrynowicz wrote:
>> From: "Wachowski, Karol" <karol.wachowski@intel.com>
>>
>> This param will be used to enable/disable HWS (hardware scheduler).
>> The HWS is a FW side feature and may not be available on all
>> HW generations and FW versions.
>>
>> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_drv.c     | 4 ++++
>>   drivers/accel/ivpu/ivpu_drv.h     | 1 +
>>   drivers/accel/ivpu/ivpu_hw.h      | 3 ++-
>>   drivers/accel/ivpu/ivpu_hw_37xx.c | 1 +
>>   drivers/accel/ivpu/ivpu_hw_40xx.c | 3 ++-
>>   5 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
>> index 51d3f1a55d02..db47e7ef6322 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.c
>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>> @@ -51,6 +51,10 @@ u8 ivpu_pll_max_ratio = U8_MAX;
>>   module_param_named(pll_max_ratio, ivpu_pll_max_ratio, byte, 0644);
>>   MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio used to set NPU frequency");
>>   +bool ivpu_sched_mode;
>> +module_param_named(sched_mode, ivpu_sched_mode, bool, 0644);
>> +MODULE_PARM_DESC(sched_mode, "Scheduler mode: 0 - OS scheduler, 1 - HW scheduler");
> 
> "OS scheduler"
> Host OS (aka Linux) or device side OS?  Seems a bit ambiguous.
Yeah, it should be "No scheduler". We actually don't have any OS scheduling for workloads.

> Also looks like this must be set before the device is initialized, yet it does not look like that is communicated.
I'm usually try to keep param descriptions short. I will change the mode to 0444, so it won't be possible to change the param after driver is loaded.
