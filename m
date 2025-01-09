Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34915A06FDA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:20:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11B610E44F;
	Thu,  9 Jan 2025 08:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqpc8CCA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918DE10E44F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736410804; x=1767946804;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cZomwft+pO5MA0V8c67Ha71a/XlhKXESWTbAF2X3yaE=;
 b=iqpc8CCABgQ1q45B9DCKXSFYyHJVCUTojngDw1OOP4o3qhrCFGgjYTPu
 JnPLdHIjMrbSYtJpuP79sBGqhkF9ic7ULYQGQnlMOdzg+Pt3RkVK30uot
 mDjXH8xIyyD3XToyCtgSXPd0jbUSUcpy8w6gb8Sm9Ro940dhVEZoNPrsO
 OldbZczTAzDnnmmwxDl4mQ7t6qcONSjzITl+ASL1/AJBARRQmJRGixDl9
 Jion4nkW6cWaLq0/BhiWXgG35TrsBvXp9I+lPDYsJXzICGboMFvRtCg53
 6Jotz31qun5/zwdSEo0i3UhpOOU3BoxwYwtXMCscuqpTqVIn0yZr19XNP w==;
X-CSE-ConnectionGUID: UoFlMdR3QbqKkgTITGOZ7w==
X-CSE-MsgGUID: 4+FV4hV/TPur7AdsCodocg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36821565"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36821565"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:20:03 -0800
X-CSE-ConnectionGUID: 6Kt7gLETTU+f9qUEVwWmbQ==
X-CSE-MsgGUID: 4pSPfSxcSUal3DcG/gptnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="103141878"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:20:02 -0800
Message-ID: <cc01ee0e-d258-46b4-918c-1490de783fe1@linux.intel.com>
Date: Thu, 9 Jan 2025 09:19:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] accel/ivpu: Expose NPU memory utilization info in
 sysfs
To: Lizhi Hou <lizhi.hou@amd.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-5-maciej.falkowski@linux.intel.com>
 <487e9cb5-d867-f608-1b0a-d53df5c681e0@amd.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <487e9cb5-d867-f608-1b0a-d53df5c681e0@amd.com>
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

On 1/8/2025 8:53 PM, Lizhi Hou wrote:
> 
> On 1/7/25 09:32, Maciej Falkowski wrote:
>> Expose NPU memory utilization info in sysfs in bytes
>> to show total memory used by NPU (FW + runtime).
>>
>> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_sysfs.c | 30 +++++++++++++++++++++++++++++-
>>   1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_sysfs.c b/drivers/accel/ivpu/ivpu_sysfs.c
>> index 8a616791c32f..97102feaf8dd 100644
>> --- a/drivers/accel/ivpu/ivpu_sysfs.c
>> +++ b/drivers/accel/ivpu/ivpu_sysfs.c
>> @@ -7,11 +7,14 @@
>>   #include <linux/err.h>
>>     #include "ivpu_drv.h"
>> +#include "ivpu_gem.h"
>>   #include "ivpu_fw.h"
>>   #include "ivpu_hw.h"
>>   #include "ivpu_sysfs.h"
>>   -/*
>> +/**
>> + * DOC: npu_busy_time_us
>> + *
>>    * npu_busy_time_us is the time that the device spent executing jobs.
>>    * The time is counted when and only when there are jobs submitted to firmware.
>>    *
>> @@ -42,6 +45,30 @@ npu_busy_time_us_show(struct device *dev, struct device_attribute *attr, char *b
>>     static DEVICE_ATTR_RO(npu_busy_time_us);
>>   +/**
>> + * DOC: npu_memory_utilization
>> + *
>> + * The npu_memory_utilization is used to report in bytes a current NPU memory utilization.
>> + *
>> + */
>> +static ssize_t
>> +npu_memory_utilization_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +    struct drm_device *drm = dev_get_drvdata(dev);
>> +    struct ivpu_device *vdev = to_ivpu_device(drm);
>> +    struct ivpu_bo *bo;
>> +    u64 total_npu_memory = 0;
>> +
>> +    mutex_lock(&vdev->bo_list_lock);
>> +    list_for_each_entry(bo, &vdev->bo_list, bo_list_node)
>> +        total_npu_memory += bo->base.base.size;
>> +    mutex_unlock(&vdev->bo_list_lock);
>> +
>> +    return sysfs_emit(buf, "%lld\n", total_npu_memory);
>> +}
>> +
>> +static DEVICE_ATTR_RO(npu_memory_utilization);
>> +
> 
> Instead of adding sysfs, maybe implementing  show_fdinfo callback and call drm_show_memory_stats()?

show_fdinfo cannot be used for global device stats. We are considering adding per context stats using show_fdinfo but for the moment total device memory usage is our priority.

Regards,
Jacek

