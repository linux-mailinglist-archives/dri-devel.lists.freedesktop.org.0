Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82D6A06FE9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0176110ED10;
	Thu,  9 Jan 2025 08:25:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JdsSwvkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212B210ED10
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736411100; x=1767947100;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cf6ZanrtHrIq8kcIdafPuau5cnQPJog0ygbGfgNJPLo=;
 b=JdsSwvkEH/vL4mFILz5wyhFSEHIx4eXyRWgWaxw638cwARtS4cggZooS
 b0zFq+XPNo+vzY5X+tKKm9a8YwxycFkh5p5innMZ4HNHfIgPK1uwPwFkz
 nCJRWm29jlM7eqeUXU22MTvcqxZF25LANTOoBoJ+nDCe+w7G6LRTu4ht5
 s8ZuQv6VOrr712l27xIlbzgqsZXFeO88+6eO8beBJ+4JMwbwg1p+i3eNV
 dvq2zlooTS5JLw5oXoywEhsF2yJ0xPMuyR4qIYC6TqNLzDnzLt/z7bbOi
 YNjPyvgfJ5H/kXSlH256t9gVF4BSUGscfmcIEXDrD0s1zsg0uv6sx3taI w==;
X-CSE-ConnectionGUID: ZYfhXRDLTRCWYUU5jC7a6g==
X-CSE-MsgGUID: 08B6mhpFRR2jlqhnlXdd5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36774886"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="36774886"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:25:00 -0800
X-CSE-ConnectionGUID: MQnmS47nQde8Eop43Dg8fw==
X-CSE-MsgGUID: QWzko44/TQGSEeQXEDlFwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103861702"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:24:59 -0800
Message-ID: <ec5f3253-33d0-47e4-870e-a47ed7a311ef@linux.intel.com>
Date: Thu, 9 Jan 2025 09:24:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] accel/ivpu: Expose NPU memory utilization info in
 sysfs
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <20250107173238.381120-5-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250107173238.381120-5-maciej.falkowski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 1/7/2025 6:32 PM, Maciej Falkowski wrote:
> Expose NPU memory utilization info in sysfs in bytes
> to show total memory used by NPU (FW + runtime).
> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_sysfs.c | 30 +++++++++++++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_sysfs.c b/drivers/accel/ivpu/ivpu_sysfs.c
> index 8a616791c32f..97102feaf8dd 100644
> --- a/drivers/accel/ivpu/ivpu_sysfs.c
> +++ b/drivers/accel/ivpu/ivpu_sysfs.c
> @@ -7,11 +7,14 @@
>  #include <linux/err.h>
>  
>  #include "ivpu_drv.h"
> +#include "ivpu_gem.h"
>  #include "ivpu_fw.h"
>  #include "ivpu_hw.h"
>  #include "ivpu_sysfs.h"
>  
> -/*
> +/**
> + * DOC: npu_busy_time_us
> + *
>   * npu_busy_time_us is the time that the device spent executing jobs.
>   * The time is counted when and only when there are jobs submitted to firmware.
>   *
> @@ -42,6 +45,30 @@ npu_busy_time_us_show(struct device *dev, struct device_attribute *attr, char *b
>  
>  static DEVICE_ATTR_RO(npu_busy_time_us);
>  
> +/**
> + * DOC: npu_memory_utilization
> + *
> + * The npu_memory_utilization is used to report in bytes a current NPU memory utilization.
> + *
> + */
> +static ssize_t
> +npu_memory_utilization_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct ivpu_device *vdev = to_ivpu_device(drm);
> +	struct ivpu_bo *bo;
> +	u64 total_npu_memory = 0;
> +
> +	mutex_lock(&vdev->bo_list_lock);
> +	list_for_each_entry(bo, &vdev->bo_list, bo_list_node)
> +		total_npu_memory += bo->base.base.size;
> +	mutex_unlock(&vdev->bo_list_lock);
> +
> +	return sysfs_emit(buf, "%lld\n", total_npu_memory);
> +}
> +
> +static DEVICE_ATTR_RO(npu_memory_utilization);
> +
>  /**
>   * DOC: sched_mode
>   *
> @@ -65,6 +92,7 @@ static DEVICE_ATTR_RO(sched_mode);
>  
>  static struct attribute *ivpu_dev_attrs[] = {
>  	&dev_attr_npu_busy_time_us.attr,
> +	&dev_attr_npu_memory_utilization.attr,
>  	&dev_attr_sched_mode.attr,
>  	NULL,
>  };

