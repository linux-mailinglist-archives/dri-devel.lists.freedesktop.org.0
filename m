Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C43A85896
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 11:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC1110EB54;
	Fri, 11 Apr 2025 09:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIudHCNY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C887F10EB54
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744365517; x=1775901517;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p4pYLEz4slNkYstARytLysBybDl+EluvCwzjt7dmkNk=;
 b=bIudHCNYOw1hBtQo9dqp5KtszQScIYDm9cK4bXGTXxVibR4fI69RWKwD
 HPHvTNvk/XO10uZHEHRARHnLYgXzoR3DNTMGcE6J9LU3Mi7Kw10O63ztn
 totqSMgFlYXXZe8VtbrDhH9uOpEZU63WS00dljBd/o21MVKtJOFftW+Wp
 H6ZpIDGzH3X69djZMKgc8QEj9kvvAV445UZzIdlEnBG9TPEzjZWObnrOU
 cbpCv2HyA9yczZFgBRfxzPx4NLVRkj00GI7JHj3SWHm463vHCxuegTaKH
 FZ9DsbSYdfCb0wrOyrAA3v6dXTj8Rpj4iN7fY2GHuUPcMWVSjPCtW8mV1 A==;
X-CSE-ConnectionGUID: NNW0H6niQQe6bzL0e9SIPw==
X-CSE-MsgGUID: GHTR0bJKSuiM5YnVD8c9Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56095754"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="56095754"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 02:58:36 -0700
X-CSE-ConnectionGUID: pFg2ePxCS+6XIp2Oihg9+w==
X-CSE-MsgGUID: sFYdZhhNSLKQ3N/YpKfjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="133267241"
Received: from mariuszg-mobl2.ger.corp.intel.com (HELO [10.245.113.161])
 ([10.245.113.161])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 02:58:34 -0700
Message-ID: <6a853e61-fb91-4702-aa13-8b0f421bc912@linux.intel.com>
Date: Fri, 11 Apr 2025 11:58:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/ivpu: Show NPU frequency in sysfs
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250401155912.4049340-1-maciej.falkowski@linux.intel.com>
 <20250401155912.4049340-3-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250401155912.4049340-3-maciej.falkowski@linux.intel.com>
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

On 4/1/2025 5:59 PM, Maciej Falkowski wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> Add sysfs files that show maximum and current
> frequency of the NPU's data processing unit.
> New sysfs entries:
> - npu_max_frequency_mhz
> - npu_current_frequency_mhz
> 
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_hw.h      |  5 ++++
>  drivers/accel/ivpu/ivpu_hw_btrs.c |  8 +++++
>  drivers/accel/ivpu/ivpu_hw_btrs.h |  1 +
>  drivers/accel/ivpu/ivpu_sysfs.c   | 49 ++++++++++++++++++++++++++++++-
>  4 files changed, 62 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw.h b/drivers/accel/ivpu/ivpu_hw.h
> index 6e67e736ef8e..d79668fe1609 100644
> --- a/drivers/accel/ivpu/ivpu_hw.h
> +++ b/drivers/accel/ivpu/ivpu_hw.h
> @@ -87,6 +87,11 @@ static inline u32 ivpu_hw_dpu_max_freq_get(struct ivpu_device *vdev)
>  	return ivpu_hw_btrs_dpu_max_freq_get(vdev);
>  }
>  
> +static inline u32 ivpu_hw_dpu_freq_get(struct ivpu_device *vdev)
> +{
> +	return ivpu_hw_btrs_dpu_freq_get(vdev);
> +}
> +
>  static inline void ivpu_hw_irq_clear(struct ivpu_device *vdev)
>  {
>  	ivpu_hw_ip_irq_clear(vdev);
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c b/drivers/accel/ivpu/ivpu_hw_btrs.c
> index 91eb8a93c15b..b236c7234daa 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.c
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
> @@ -606,6 +606,14 @@ u32 ivpu_hw_btrs_dpu_max_freq_get(struct ivpu_device *vdev)
>  	return pll_ratio_to_dpu_freq(vdev, vdev->hw->pll.max_ratio);
>  }
>  
> +u32 ivpu_hw_btrs_dpu_freq_get(struct ivpu_device *vdev)
> +{
> +	if (ivpu_hw_btrs_gen(vdev) == IVPU_HW_BTRS_MTL)
> +		return pll_ratio_to_dpu_freq_mtl(pll_config_get_mtl(vdev));
> +	else
> +		return pll_ratio_to_dpu_freq_lnl(pll_config_get_lnl(vdev));
> +}
> +
>  /* Handler for IRQs from Buttress core (irqB) */
>  bool ivpu_hw_btrs_irq_handler_mtl(struct ivpu_device *vdev, int irq)
>  {
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.h b/drivers/accel/ivpu/ivpu_hw_btrs.h
> index a2f0877237e8..300f749971d4 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.h
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.h
> @@ -32,6 +32,7 @@ void ivpu_hw_btrs_profiling_freq_reg_set_lnl(struct ivpu_device *vdev);
>  void ivpu_hw_btrs_ats_print_lnl(struct ivpu_device *vdev);
>  void ivpu_hw_btrs_clock_relinquish_disable_lnl(struct ivpu_device *vdev);
>  u32 ivpu_hw_btrs_dpu_max_freq_get(struct ivpu_device *vdev);
> +u32 ivpu_hw_btrs_dpu_freq_get(struct ivpu_device *vdev);
>  bool ivpu_hw_btrs_irq_handler_mtl(struct ivpu_device *vdev, int irq);
>  bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq);
>  int ivpu_hw_btrs_dct_get_request(struct ivpu_device *vdev, bool *enable);
> diff --git a/drivers/accel/ivpu/ivpu_sysfs.c b/drivers/accel/ivpu/ivpu_sysfs.c
> index 97102feaf8dd..268ab7744a8b 100644
> --- a/drivers/accel/ivpu/ivpu_sysfs.c
> +++ b/drivers/accel/ivpu/ivpu_sysfs.c
> @@ -1,10 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (C) 2024 Intel Corporation
> + * Copyright (C) 2024-2025 Intel Corporation
>   */
>  
>  #include <linux/device.h>
>  #include <linux/err.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/units.h>
>  
>  #include "ivpu_drv.h"
>  #include "ivpu_gem.h"
> @@ -90,10 +92,55 @@ sched_mode_show(struct device *dev, struct device_attribute *attr, char *buf)
>  
>  static DEVICE_ATTR_RO(sched_mode);
>  
> +/**
> + * DOC: npu_max_frequency
> + *
> + * The npu_max_frequency shows maximum frequency in MHz of the NPU's data
> + * processing unit
> + */
> +static ssize_t
> +npu_max_frequency_mhz_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct ivpu_device *vdev = to_ivpu_device(drm);
> +	u32 freq = ivpu_hw_dpu_max_freq_get(vdev);
> +
> +	return sysfs_emit(buf, "%lu\n", freq / HZ_PER_MHZ);
> +}
> +
> +static DEVICE_ATTR_RO(npu_max_frequency_mhz);
> +
> +/**
> + * DOC: npu_current_frequency_mhz
> + *
> + * The npu_current_frequency_mhz shows current frequency in MHz of the NPU's
> + * data processing unit
> + */
> +static ssize_t
> +npu_current_frequency_mhz_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct drm_device *drm = dev_get_drvdata(dev);
> +	struct ivpu_device *vdev = to_ivpu_device(drm);
> +	u32 freq = 0;
> +
> +	/* Read frequency only if device is active, otherwise frequency is 0 */
> +	if (pm_runtime_get_if_active(vdev->drm.dev) > 0) {
> +		freq = ivpu_hw_dpu_freq_get(vdev);
> +
> +		pm_runtime_put_autosuspend(vdev->drm.dev);
> +	}
> +
> +	return sysfs_emit(buf, "%lu\n", freq / HZ_PER_MHZ);
> +}
> +
> +static DEVICE_ATTR_RO(npu_current_frequency_mhz);
> +
>  static struct attribute *ivpu_dev_attrs[] = {
>  	&dev_attr_npu_busy_time_us.attr,
>  	&dev_attr_npu_memory_utilization.attr,
>  	&dev_attr_sched_mode.attr,
> +	&dev_attr_npu_max_frequency_mhz.attr,
> +	&dev_attr_npu_current_frequency_mhz.attr,
>  	NULL,
>  };
>  

