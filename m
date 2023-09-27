Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773B67B04B7
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B77F10E06D;
	Wed, 27 Sep 2023 12:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DC010E06D;
 Wed, 27 Sep 2023 12:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695819278; x=1727355278;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=+MQ7pQR4P8O8mS2/ElFu2Kpw3Kpb2sbQY704OQHU4vA=;
 b=Py7gQ0ddbk5qv0qchnZWFB/XjtgjLpuCzz9P/qpEub2DuZBpesTPdL0g
 Wx6SVntdcmT811MuZbS/ug4L2InOR7ZWuZpWiWqezhuWR1B9ihuBSwoIy
 eYxeV0ps7NQ4jPJDFrhfBhGqQ4plscY8w/p+iKCxv32woQ9/kZ8s4oU2k
 1eDlUPu90WXaeTvjf5CsrqcoBYVoa1aO2O5kNUWnsbKgJoN2TwgEqfVS7
 kIOdHcbSmwDv8aGSZrUv3VXjZrlz+vrxqaDaAQFhYmF1dtrCBE7N0ehcu
 7ict/IafPeOuaQsH2u6A7cju7h4iBCyoWJklmZ9pFhscCk6fWCJ9CA19N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="468099451"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="468099451"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="864827529"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="864827529"
Received: from clkuhl-mobl.amr.corp.intel.com (HELO
 idecesar-mobl.ger.corp.intel.com) ([10.252.53.225])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:54:19 -0700
Date: Wed, 27 Sep 2023 15:54:17 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 12/15] platform/x86/amd/pmf: Add PMF-AMDGPU get interface
In-Reply-To: <20230922175056.244940-13-Shyam-sundar.S-k@amd.com>
Message-ID: <ee678f17-8ee6-6366-4fea-dd133c6599e8@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-13-Shyam-sundar.S-k@amd.com>
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> In order to provide GPU inputs to TA for the Smart PC solution to work, we
> need to have interface between the PMF driver and the AMDGPU driver.
> 
> Add the initial code path for get interface from AMDGPU.
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile     |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 70 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/Kconfig    |  1 +
>  drivers/platform/x86/amd/pmf/core.c     |  1 +
>  drivers/platform/x86/amd/pmf/pmf.h      |  4 ++
>  drivers/platform/x86/amd/pmf/spc.c      | 13 +++++
>  drivers/platform/x86/amd/pmf/tee-if.c   | 22 ++++++++
>  include/linux/amd-pmf-io.h              | 28 ++++++++++
>  9 files changed, 142 insertions(+)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>  create mode 100644 include/linux/amd-pmf-io.h
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> index 384b798a9bad..7fafccefbd7a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>  
>  amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
>  
> +amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
> +
>  # add asic specific block
>  amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
>  	dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index dc2d53081e80..475f3e248f35 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -50,6 +50,7 @@
>  #include <linux/hashtable.h>
>  #include <linux/dma-fence.h>
>  #include <linux/pci.h>
> +#include <linux/amd-pmf-io.h>
>  
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_placement.h>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> new file mode 100644
> index 000000000000..232d11833ddc
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> @@ -0,0 +1,70 @@
> +/*
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> +
> + * * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include "amdgpu.h"
> +
> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
> +{
> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
> +	struct drm_mode_config *mode_config = &drm_dev->mode_config;
> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
> +	struct drm_connector_list_iter iter;
> +	struct drm_connector *connector;
> +	struct backlight_device *bd;
> +	int i = 0;
> +
> +	/* reset the count to zero */
> +	pmf->display_count = 0;
> +	if (!(adev->flags & AMD_IS_APU)) {
> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
> +		return -ENODEV;
> +	}
> +
> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +	if (!bd)
> +		return -ENODEV;
> +
> +	pmf->brightness = backlight_get_brightness(bd);
> +
> +	mutex_lock(&mode_config->mutex);
> +	drm_connector_list_iter_begin(drm_dev, &iter);
> +
> +	drm_for_each_connector_iter(connector, &iter) {
> +		if (i > MAX_SUPPORTED)
> +			break;

I'd put this below right after i++.

> +		if (connector->status == connector_status_connected) {
> +			pmf->con_status[i] = connector->status;
> +			pmf->connector_type[i] = connector->connector_type;
> +			pmf->display_count++;
> +		}
> +		i++;
> +	}
> +	drm_connector_list_iter_end(&iter);
> +	mutex_unlock(&mode_config->mutex);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 437b78c6d1c5..0cd08f9ab51b 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -10,6 +10,7 @@ config AMD_PMF
>  	depends on AMD_NB
>  	select ACPI_PLATFORM_PROFILE
>  	depends on AMDTEE
> +	depends on DRM_AMDGPU
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.
>  	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index dbfe7c1d6fc4..c468d208b1dc 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -396,6 +396,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>  	}
>  
>  	dev->cpu_id = rdev->device;
> +	dev->root = rdev;
>  
>  	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
>  	if (err) {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 780c442239e3..9032df4ba48a 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -13,6 +13,8 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/platform_profile.h>
> +#include <linux/amd-pmf-io.h>
> +
>  #define POLICY_BUF_MAX_SZ		0x4b000
>  #define POLICY_SIGN_COOKIE		0x31535024
>  
> @@ -224,9 +226,11 @@ struct amd_pmf_dev {
>  	void *shbuf;
>  	struct delayed_work pb_work;
>  	struct pmf_action_table *prev_data;
> +	struct amd_gpu_pmf_data gfx_data;
>  	u64 policy_addr;
>  	void *policy_base;
>  	bool smart_pc_enabled;
> +	struct pci_dev *root;
>  };
>  
>  struct apmf_sps_prop_granular {
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 5c6745f56ed1..5f3ab1ce09d2 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -43,6 +43,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	dev_dbg(dev->dev, "Max C0 Residency : %d\n", in->ev_info.max_c0residency);
>  	dev_dbg(dev->dev, "GFX Busy : %d\n", in->ev_info.gfx_busy);
>  	dev_dbg(dev->dev, "Connected Display Count : %d\n", in->ev_info.monitor_count);
> +	dev_dbg(dev->dev, "Primary Display Type : %s\n",
> +		drm_get_connector_type_name(in->ev_info.display_type));
> +	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
> +			"Connected" : "disconnected/unknown");
>  	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
> @@ -144,6 +148,14 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	return 0;
>  }
>  
> +static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	amd_pmf_get_gfx_data(&dev->gfx_data);
> +	in->ev_info.monitor_count = dev->gfx_data.display_count;
> +	in->ev_info.display_type = dev->gfx_data.connector_type[0];
> +	in->ev_info.display_state = dev->gfx_data.con_status[0];
> +}
> +
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	/* TA side lid open is 1 and close is 0, hence the ! here */
> @@ -152,4 +164,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>  	amd_pmf_get_smu_info(dev, in);
>  	amd_pmf_get_battery_info(dev, in);
>  	amd_pmf_get_slider_info(dev, in);
> +	amd_pmf_get_gpu_info(dev, in);
>  }
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 3daa122f35d5..1608996654e8 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/debugfs.h>
> +#include <linux/pci.h>
>  #include <linux/tee_drv.h>
>  #include <linux/uuid.h>
>  #include "pmf.h"
> @@ -345,6 +346,20 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
>  	return amd_pmf_start_policy_engine(dev);
>  }
>  
> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
> +{
> +	struct amd_pmf_dev *dev = data;
> +
> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
> +		dev->gfx_data.gpu_dev = pci_get_device(pdev->vendor, pdev->device, NULL);

What is this attempting to do??

-- 
 i.


> +		if (dev->gfx_data.gpu_dev) {
> +			pci_dev_put(pdev);
> +			return 1; /* stop walking */
> +		}
> +	}
> +	return 0; /* continue walking */
> +}
> +
>  static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>  {
>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
> @@ -435,6 +450,12 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>  	amd_pmf_set_dram_addr(dev);
>  	amd_pmf_get_bios_buffer(dev);
> +
> +	/* get amdgpu handle */
> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
> +	if (!dev->gfx_data.gpu_dev)
> +		dev_err(dev->dev, "GPU handle not found!\n");
> +
>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>  	if (!dev->prev_data)
>  		return -ENOMEM;
> @@ -451,5 +472,6 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  	kfree(dev->prev_data);
>  	kfree(dev->policy_buf);
>  	cancel_delayed_work_sync(&dev->pb_work);
> +	pci_dev_put(dev->gfx_data.gpu_dev);
>  	amd_pmf_tee_deinit(dev);
>  }
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> new file mode 100644
> index 000000000000..a2d4af231362
> --- /dev/null
> +++ b/include/linux/amd-pmf-io.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD Platform Management Framework Interface
> + *
> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#ifndef AMD_PMF_IO_H
> +#define AMD_PMF_IO_H
> +
> +#include <drm/drm_connector.h>
> +
> +#define MAX_SUPPORTED 4
> +
> +/* amdgpu */
> +struct amd_gpu_pmf_data {
> +	struct pci_dev *gpu_dev;
> +	enum drm_connector_status con_status[MAX_SUPPORTED];
> +	int display_count;
> +	int connector_type[MAX_SUPPORTED];
> +	int brightness;
> +};
> +
> +int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
> +#endif
> 
