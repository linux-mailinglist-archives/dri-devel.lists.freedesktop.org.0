Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27CCB6E69
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 19:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C97010E714;
	Thu, 11 Dec 2025 18:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G43SdbCj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5BB10E714
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765477701; x=1797013701;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=+65exzasRAtR37DjXLW5XGNMpq+TFIQGz48Vav5ABos=;
 b=G43SdbCjEaK5dalWhVLJFRfYdTMNDbeO4MB5Lp9Vv3ZtHHJWoE+uTkC5
 nrErFj00SBeVBRwg0KbMmpf+Bu18+JzZDS2sRVsl512rrjx+CZuy3Jbud
 e5um7RP6F3M182frPoEqJfy2QFAVSD6zsfSLLnk7GGkfk7igyelHpceYI
 4RPnYO1bfuZV9Pvk2QsmsUxnW81Cp9TQDRTt2AGGTR95YL9BHUTa0ygVT
 gS/jKt4qEPV7YXPgsy8CNK8ueTxRQPdI8easu4qlbOZpeuulyECXwx0kY
 QLOX6iI/uc7Ml8REkj6ZEKzQEF9pI1nG0R8C2CBn689q/3p9Sny5cFKAK A==;
X-CSE-ConnectionGUID: LQuFYBHIToqyTYTKmDTmsA==
X-CSE-MsgGUID: p2WeqVXWSaWDitZFpvOQeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="66467866"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="66467866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:28:21 -0800
X-CSE-ConnectionGUID: y8Nc1F5NTZm1t1YNptfLkg==
X-CSE-MsgGUID: eOoBH15iQgmJq1FC65+6sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="201035870"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.219])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 10:28:17 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 11 Dec 2025 20:28:13 +0200 (EET)
To: Lizhi Hou <lizhi.hou@amd.com>
cc: Hans de Goede <hansg@kernel.org>, ogabbay@kernel.org, 
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 LKML <linux-kernel@vger.kernel.org>, max.zhen@amd.com, 
 sonal.santan@amd.com, mario.limonciello@amd.com, 
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 VinitKumar.Shukla@amd.com, Patil Rajesh Reddy <Patil.Reddy@amd.com>
Subject: Re: [PATCH V1 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
In-Reply-To: <20251211175802.1760860-2-lizhi.hou@amd.com>
Message-ID: <5217a9b3-8489-fd18-051a-46a497ff56bd@linux.intel.com>
References: <20251211175802.1760860-1-lizhi.hou@amd.com>
 <20251211175802.1760860-2-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 11 Dec 2025, Lizhi Hou wrote:

> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> The PMF driver retrieves NPU metrics data from the PMFW. Introduce a new
> interface to make NPU metrics accessible to other drivers like AMDXDNA
> driver, which can access and utilize this information as needed.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/core.c | 75 +++++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h  |  2 +
>  include/linux/amd-pmf-io.h          | 21 ++++++++
>  3 files changed, 98 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index a6a5d416edf9..8e4ce91b3527 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -8,12 +8,15 @@
>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>   */
>  
> +#include <linux/array_size.h>
> +#include <linux/cleanup.h>
>  #include <linux/debugfs.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/power_supply.h>
> +#include <linux/string.h>
>  #include <asm/amd/node.h>
>  #include "pmf.h"
>  
> @@ -53,6 +56,8 @@ static bool force_load;
>  module_param(force_load, bool, 0444);
>  MODULE_PARM_DESC(force_load, "Force load this driver on supported older platforms (experimental)");
>  
> +static struct device *pmf_device;
> +
>  static int amd_pmf_pwr_src_notify_call(struct notifier_block *nb, unsigned long event, void *data)
>  {
>  	struct amd_pmf_dev *pmf = container_of(nb, struct amd_pmf_dev, pwr_src_notifier);
> @@ -314,6 +319,70 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +static int is_npu_metrics_supported(struct amd_pmf_dev *pdev)
> +{
> +	switch (pdev->cpu_id) {
> +	case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> +	case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct amd_pmf_npu_metrics *data)
> +{
> +	int ret, i;
> +
> +	guard(mutex)(&dev->metrics_mutex);
> +
> +	if (is_npu_metrics_supported(dev))
> +		return -EOPNOTSUPP;
> +
> +	ret = amd_pmf_set_dram_addr(dev, true);
> +	if (ret)
> +		return ret;
> +
> +	memset(dev->buf, 0, dev->mtable_size);
> +
> +	/* Send SMU command to get NPU metrics */
> +	ret = amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, SET_CMD, METRICS_TABLE_ID, NULL);
> +	if (ret) {
> +		dev_err(dev->dev, "SMU command failed to get NPU metrics: %d\n", ret);
> +		return ret;
> +	}
> +
> +	memcpy(&dev->m_table_v2, dev->buf, dev->mtable_size);
> +
> +	data->npuclk_freq = dev->m_table_v2.npuclk_freq;
> +	for (i = 0; i < ARRAY_SIZE(data->npu_busy); i++)
> +		data->npu_busy[i] = dev->m_table_v2.npu_busy[i];
> +	data->npu_power = dev->m_table_v2.npu_power;
> +	data->mpnpuclk_freq = dev->m_table_v2.mpnpuclk_freq;
> +	data->npu_reads = dev->m_table_v2.npu_reads;
> +	data->npu_writes = dev->m_table_v2.npu_writes;
> +
> +	return 0;
> +}
> +
> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
> +{
> +	struct amd_pmf_dev *pdev;
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	if (!pmf_device)
> +		return -ENODEV;
> +
> +	pdev = dev_get_drvdata(pmf_device);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	return amd_pmf_get_smu_metrics(pdev, info);
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
> +
>  static int amd_pmf_suspend_handler(struct device *dev)
>  {
>  	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
> @@ -469,6 +538,10 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	mutex_init(&dev->update_mutex);
>  	mutex_init(&dev->cb_mutex);
>  
> +	err = devm_mutex_init(dev->dev, &dev->metrics_mutex);
> +	if (err)
> +		return err;
> +
>  	apmf_acpi_init(dev);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmf_dbgfs_register(dev);
> @@ -477,6 +550,8 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	if (is_apmf_func_supported(dev, APMF_FUNC_SBIOS_HEARTBEAT_V2))
>  		amd_pmf_notify_sbios_heartbeat_event_v2(dev, ON_LOAD);
>  
> +	pmf_device = dev->dev;
> +
>  	dev_info(dev->dev, "registered PMF device successfully\n");
>  
>  	return 0;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index f07e9f4c660a..0354cc5dc79e 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -12,6 +12,7 @@
>  #define PMF_H
>  
>  #include <linux/acpi.h>
> +#include <linux/amd-pmf-io.h>
>  #include <linux/input.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
> @@ -412,6 +413,7 @@ struct amd_pmf_dev {
>  	struct apmf_sbios_req_v1 req1;
>  	struct pmf_bios_inputs_prev cb_prev; /* To preserve custom BIOS inputs */
>  	bool cb_flag;			     /* To handle first custom BIOS input */
> +	struct mutex metrics_mutex;

This files seems to lack include for struct mutex (despite using them 
already so please add it finally there :-)).

>  };
>  
>  struct apmf_sps_prop_granular_v2 {
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index 6fa510f419c0..55198d2875cc 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -61,5 +61,26 @@ enum laptop_placement {
>  	LP_UNDEFINED,
>  };
>  
> +/**
> + * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF driver
> + * @npuclk_freq: NPU clock frequency [MHz]
> + * @npu_busy: NPU busy % [0-100]
> + * @npu_power: NPU power [mW]
> + * @mpnpuclk_freq: MPNPU [MHz]
> + * @npu_reads: NPU read bandwidth [MB/sec]
> + * @npu_writes: NPU write bandwidth [MB/sec]
> + */
> +struct amd_pmf_npu_metrics {
> +	u16 npuclk_freq;
> +	u16 npu_busy[8];
> +	u16 npu_power;
> +	u16 mpnpuclk_freq;
> +	u16 npu_reads;
> +	u16 npu_writes;
> +};
> +
>  int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
> +
> +/* AMD PMF and NPU interface */
> +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
>  #endif
> 

-- 
 i.

