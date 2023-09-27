Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128827B057D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E27610E51C;
	Wed, 27 Sep 2023 13:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882D110E51C;
 Wed, 27 Sep 2023 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695821562; x=1727357562;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=WyQnbln/qxn77GjZ28iQ/c1Bwlx9s8zdHAg3jaa7e+k=;
 b=Koh0DVWx8rKjXMoIHoiy1NFQmXnYYMzl+fq/sTUQMg7cWnmJSQguTMYR
 H8r2Ow7GUxzqh01qrQx45Bvy9w9J/CIImq4tF3Z/WmLXnYwu94VqkLotN
 FzE2AZktCvHVrxqqpIRnHpAl0yl4mW1V3tZkLvli8TLiPRDBgkx+S5lq5
 GRd7F9SzpbL1I8iHXM30XiiJhgGQBzNfCg285PHhVb4Q5jru0qphV+6tz
 wQb2hpNWSlxity7UFW5L0VDLYViKp1HkZdKG3wJcCo7twiiXEditBOt1+
 7y1nA1JkbaPHnTQt/0Iig0FApiiZZgHalZM26RDbczsgIv1g+utRSt7bz Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381726695"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="381726695"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:32:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="742711409"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="742711409"
Received: from clkuhl-mobl.amr.corp.intel.com ([10.252.53.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:32:36 -0700
Date: Wed, 27 Sep 2023 16:32:34 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 14/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface
 for HPD
In-Reply-To: <20230922175056.244940-15-Shyam-sundar.S-k@amd.com>
Message-ID: <aa85b6d6-6113-337d-5de3-77fd53d7387@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-15-Shyam-sundar.S-k@amd.com>
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
 platform-driver-x86@vger.kernel.org, markgross@kernel.org, hdegoede@redhat.com,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

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
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |  2 +-
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 11 ++++++++
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 28 +++++++++++++++++++
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
>  drivers/platform/x86/amd/pmf/spc.c            | 21 ++++++++++++++
>  include/linux/amd-pmf-io.h                    | 22 ++++++++++++++-
>  7 files changed, 88 insertions(+), 2 deletions(-)
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
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> index 06bdcf072d10..d7467c41ad3b 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
> @@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
>  	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
>  }
>  
> -static int float_to_int(u32 flt32_val)
> +int float_to_int(u32 flt32_val)

This is way too generic name to be exposed by a driver, add proper 
prefix for it to make sure it never hits a compile problem.

>  {
>  	int fraction, shift, mantissa, sign, exp, zeropre;
>  
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index e9c6413af24a..9c623456ee12 100644
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
> +			privdata->dev_en.is_hpd_present = true;
> +				break;
> +			}
>  		}
>  		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
>  			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 4f81ef2d4f56..63a5bbca5a09 100644
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
> +	return  -ENODEV;
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
> +	return -1;
>  }
> +EXPORT_SYMBOL_GPL(amd_get_sfh_info);
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> index 9d31d5b510eb..8a36386e6bce 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
> @@ -149,6 +149,7 @@ struct hpd_status {
>  	};
>  };
>  
> +int float_to_int(u32 flt32_val);
>  void sfh_interface_init(struct amd_mp2_dev *mp2);
>  void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
>  #endif
> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index 5f3ab1ce09d2..97293ae25cf5 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -48,6 +48,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	dev_dbg(dev->dev, "Primary Display State : %s\n", in->ev_info.display_state ?
>  			"Connected" : "disconnected/unknown");
>  	dev_dbg(dev->dev, "LID State : %s\n", in->ev_info.lid_state ? "Close" : "Open");
> +	dev_dbg(dev->dev, "User Presence : %s\n", in->ev_info.user_present ? "Present" : "Away");
>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
>  #else
> @@ -156,6 +157,25 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
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
> @@ -165,4 +185,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
>  	amd_pmf_get_battery_info(dev, in);
>  	amd_pmf_get_slider_info(dev, in);
>  	amd_pmf_get_gpu_info(dev, in);
> +	amd_pmf_get_sensor_info(dev, in);
>  }
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index ecae387ddaa6..4f82973f6ad2 100644
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
> @@ -26,4 +27,23 @@ struct amd_gpu_pmf_data {
>  
>  int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>  int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
> +
> +/* amd-sfh */
> +enum sfh_message_type {
> +	MT_HPD,
> +};
> +
> +enum hpd_info {
> +	SFH_NOT_DETECTED,
> +	SFH_USER_PRESENT,
> +	SFH_USER_AWAY
> +};
> +
> +struct amd_sfh_info {
> +	u8 user_present;
> +	/* add future caps below */

Remove the comment?

> +};
> +
> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
> +
>  #endif
> 

-- 
 i.

