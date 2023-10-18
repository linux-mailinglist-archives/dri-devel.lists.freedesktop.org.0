Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480217CD67D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 10:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9928910E3C5;
	Wed, 18 Oct 2023 08:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27EC10E3C1;
 Wed, 18 Oct 2023 08:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697617803; x=1729153803;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Aq0wNc4nUeZKYc8ceXvDx0RF1n6/1SwmKooCgg9yRMc=;
 b=TPIHnnU70k78e+ejNjzZHWibDbho7Q6Lc3pwMvr+NA1oUYkF2UxLgsjF
 2Y+80wi0vU2BHw9W2hmkxYxJwARn6U07RI1i7kpJGx9RJSiBFjR0u18iN
 r4qPkGYQanY+fo1fMOTRDzEcy417XTZcswbo85oZQNck+Db+WV20O+lRK
 d3bwfo/q8jTTDnuaB6UmKq52x2pXKWSV2VgrMWhtt9zMKpaoQwQqtv+Ia
 5R/IKPOpAkYwmAMAnqVMZ8Ki2PTnlXhyCioYWc/64e1H/VZizp1VuT1aw
 1DNL+sMtkTPMPS7EzpNZnYJE/+DnA6qJTOOFRH/WmCKI7typI0TmjIzXz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385801150"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="385801150"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 01:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791536238"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="791536238"
Received: from gruberda-mobl1.ger.corp.intel.com ([10.252.62.52])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 01:29:57 -0700
Date: Wed, 18 Oct 2023 11:29:54 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v4 16/17] platform/x86/amd/pmf: Add PMF-AMDSFH interface
 for HPD
In-Reply-To: <20231018070241.2041529-17-Shyam-sundar.S-k@amd.com>
Message-ID: <8e91bb9b-e9e5-297d-c62-2b8785f1a6e0@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-17-Shyam-sundar.S-k@amd.com>
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, dri-devel@lists.freedesktop.org,
 jikos@kernel.org, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, markgross@kernel.org,
 Hans de Goede <hdegoede@redhat.com>, benjamin.tissoires@redhat.com,
 mario.limonciello@amd.com, linux-input@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Oct 2023, Shyam Sundar S K wrote:

> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> AMDSFH has information about the User presence information via the Human
> Presence Detection (HPD) sensor which is part of the AMD sensor fusion hub.
> Add PMF and AMDSFH interface to get this information.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  5 ++++
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 11 ++++++++
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 28 +++++++++++++++++++
>  drivers/platform/x86/amd/pmf/Kconfig          |  1 +
>  drivers/platform/x86/amd/pmf/spc.c            | 21 ++++++++++++++
>  include/linux/amd-pmf-io.h                    | 20 ++++++++++++-
>  6 files changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> index 2643bb14fee2..cd57037bf217 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
> @@ -37,6 +37,10 @@ struct amd_mp2_sensor_info {
>  	dma_addr_t dma_address;
>  };
>  
> +struct sfh_dev_status {
> +	bool is_hpd_present;
> +};
> +
>  struct amd_mp2_dev {
>  	struct pci_dev *pdev;
>  	struct amdtp_cl_data *cl_data;
> @@ -47,6 +51,7 @@ struct amd_mp2_dev {
>  	struct amd_input_data in_data;
>  	/* mp2 active control status */
>  	u32 mp2_acs;
> +	struct sfh_dev_status dev_en;
>  };
>  
>  struct amd_mp2_ops {
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index e9c6413af24a..3dc652d41d7d 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -73,6 +73,12 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
>  	int i, status;
>  
>  	for (i = 0; i < cl_data->num_hid_devices; i++) {
> +		switch (cl_data->sensor_idx[i]) {
> +		case HPD_IDX:
> +			privdata->dev_en.is_hpd_present = false;
> +			break;
> +		}
> +
>  		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
>  			privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
>  			status = amd_sfh_wait_for_response
> @@ -178,6 +184,11 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
>  			rc = amdtp_hid_probe(i, cl_data);
>  			if (rc)
>  				goto cleanup;
> +			switch (cl_data->sensor_idx[i]) {
> +			case HPD_IDX:
> +				privdata->dev_en.is_hpd_present = true;
> +				break;
> +			}
>  		}
>  		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
>  			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 4f81ef2d4f56..7637da0dec6f 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> @@ -7,11 +7,14 @@
>   *
>   * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>   */
> +#include <linux/amd-pmf-io.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/iopoll.h>
>  
>  #include "amd_sfh_interface.h"
>  
> +static struct amd_mp2_dev *emp2;
> +
>  static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
>  {
>  	struct sfh_cmd_response cmd_resp;
> @@ -76,4 +79,29 @@ static struct amd_mp2_ops amd_sfh_ops = {
>  void sfh_interface_init(struct amd_mp2_dev *mp2)
>  {
>  	mp2->mp2_ops = &amd_sfh_ops;
> +	emp2 = mp2;
> +}
> +
> +static int amd_sfh_hpd_info(u8 *user_present)
> +{
> +	if (emp2 && emp2->dev_en.is_hpd_present) {
> +		struct hpd_status hpdstatus;
> +
> +		hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
> +		*user_present = hpdstatus.shpd.presence;
> +		return 0;
> +	}
> +	return -ENODEV;

Reverse the logic and early return with -ENODEV. Make the same change to 
the next patch too.

-- 
 i.

> +}
> +
> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
> +{
> +	if (sfh_info) {
> +		switch (op) {
> +		case MT_HPD:
> +			return amd_sfh_hpd_info(&sfh_info->user_present);
> +		}
> +	}
> +	return -EINVAL;
>  }
> +EXPORT_SYMBOL_GPL(amd_get_sfh_info);
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 7f430de7af44..d368d35a49ac 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -11,6 +11,7 @@ config AMD_PMF
>  	select ACPI_PLATFORM_PROFILE
>  	depends on TEE && AMDTEE
>  	depends on DRM_AMDGPU
> +	depends on AMD_SFH_HID
>  	help
>  	  This driver provides support for the AMD Platform Management Framework.
>  	  The goal is to enhance end user experience by making AMD PCs smarter,
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index cf4962ef97c2..8bdfb395f316 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -49,6 +49,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
>  			"Connected" : "disconnected/unknown");
>  	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
> +	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
>  #else
> @@ -158,6 +159,25 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
>  	in->ev_info.display_state = dev->gfx_data.con_status[0];
>  }
>  
> +static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	struct amd_sfh_info sfh_info;
> +
> +	/* get HPD data */
> +	amd_get_sfh_info(&sfh_info, MT_HPD);
> +	switch (sfh_info.user_present) {
> +	case SFH_NOT_DETECTED:
> +		in->ev_info.user_present = 0xff; /* assume no sensors connected */
> +		break;
> +	case SFH_USER_PRESENT:
> +		in->ev_info.user_present = 1;
> +		break;
> +	case SFH_USER_AWAY:
> +		in->ev_info.user_present = 0;
> +		break;
> +	}
> +}
> +
>  void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
>  {
>  	/* TA side lid open is 1 and close is 0, hence the ! here */
> @@ -167,4 +187,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>  	amd_pmf_get_battery_info(dev, in);
>  	amd_pmf_get_slider_info(dev, in);
>  	amd_pmf_get_gpu_info(dev, in);
> +	amd_pmf_get_sensor_info(dev, in);
>  }
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index 5f79e66a41b3..76e42552b62c 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -5,7 +5,8 @@
>   * Copyright (c) 2023, Advanced Micro Devices, Inc.
>   * All Rights Reserved.
>   *
> - * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + *          Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>   */
>  
>  #ifndef AMD_PMF_IO_H
> @@ -32,4 +33,21 @@ struct amd_gpu_pmf_data {
>  int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>  int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf);
>  void amd_pmf_gpu_deinit(struct amd_gpu_pmf_data *pmf);
> +
> +/* amd-sfh */
> +enum sfh_message_type {
> +	MT_HPD,
> +};
> +
> +enum hpd_info {
> +	SFH_NOT_DETECTED,
> +	SFH_USER_PRESENT,
> +	SFH_USER_AWAY,
> +};
> +
> +struct amd_sfh_info {
> +	u8 user_present;
> +};
> +
> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
>  #endif
> 
