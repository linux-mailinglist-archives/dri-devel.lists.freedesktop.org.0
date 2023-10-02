Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AE07B4ED1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 11:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15C010E038;
	Mon,  2 Oct 2023 09:15:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9D310E038;
 Mon,  2 Oct 2023 09:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696238100; x=1727774100;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=SiB2TsquXbJXTfQd9ot1cMTjR7U1Bch855PNs4t0Cuw=;
 b=dcY0SEz0ydTDLJVNBzpECM7ydx6yqZQNO9nn9meDEpRxvujLQqPaUYHb
 1gS0nLQacjMQ8Ncr7KCGJzNmFdojHIBk4KRkCzf0p9YJMtBsK6vFlW9Dl
 4GWgUtJXGN76XORyInsuYd/bivzyYG6mbK2wW6zScZYMK4qjT6Q4pQ3oz
 T6E4011Myv5V+tbeVPS6+Wzd3D/keVkjHyPdmKg2RV/LHV7pGeVy5qrcN
 ZkJRCJZyU/XgmFIiuLT9Q1g77FOeH+MLEw3AjhZ748vMkg5rV/Vzr/DCs
 4Iyv7SZ8JFSNNVhUW6yK8bpmLF1SuQ4kjgequKcPCdLyTCeH2QmVmASrh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="449098880"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="449098880"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:15:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10850"; a="785717938"
X-IronPort-AV: E=Sophos;i="6.03,193,1694761200"; d="scan'208";a="785717938"
Received: from roliveir-mobl1.ger.corp.intel.com ([10.251.222.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 02:14:54 -0700
Date: Mon, 2 Oct 2023 12:10:19 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 06/15] platform/x86/amd/pmf: Add support to get inputs
 from other subsystems
In-Reply-To: <59b3db5f-3dc8-4eca-84ce-983774b984d4@amd.com>
Message-ID: <dcf5e19-542d-9b2-3f3-a1135bfbbb51@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-7-Shyam-sundar.S-k@amd.com>
 <be35f637-23c7-64c2-65bf-5b1783801d16@linux.intel.com>
 <59b3db5f-3dc8-4eca-84ce-983774b984d4@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-675257746-1696236984=:2459"
Content-ID: <682c8c6-455c-f44e-ef7-41afa9cabc5@linux.intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-675257746-1696236984=:2459
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <ee554479-e743-3a7e-93ea-6568e983a151@linux.intel.com>

On Sat, 30 Sep 2023, Shyam Sundar S K wrote:
> On 9/26/2023 10:38 PM, Ilpo Järvinen wrote:
> > On Fri, 22 Sep 2023, Shyam Sundar S K wrote:
> > 
> >> PMF driver sends changing inputs from each subystem to TA for evaluating
> >> the conditions in the policy binary.
> >>
> >> Add initial support of plumbing in the PMF driver for Smart PC to get
> >> information from other subsystems in the kernel.
> >>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
> >>  drivers/platform/x86/amd/pmf/pmf.h    |  18 ++++
> >>  drivers/platform/x86/amd/pmf/spc.c    | 118 ++++++++++++++++++++++++++
> >>  drivers/platform/x86/amd/pmf/tee-if.c |   3 +
> >>  4 files changed, 140 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/platform/x86/amd/pmf/spc.c
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> >> index d2746ee7369f..6b26e48ce8ad 100644
> >> --- a/drivers/platform/x86/amd/pmf/Makefile
> >> +++ b/drivers/platform/x86/amd/pmf/Makefile
> >> @@ -7,4 +7,4 @@
> >>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
> >>  amd-pmf-objs := core.o acpi.o sps.o \
> >>  		auto-mode.o cnqf.o \
> >> -		tee-if.o
> >> +		tee-if.o spc.o
> >> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> >> index 81acf2a37366..e64b4d285624 100644
> >> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >> @@ -146,6 +146,21 @@ struct smu_pmf_metrics {
> >>  	u16 infra_gfx_maxfreq; /* in MHz */
> >>  	u16 skin_temp; /* in centi-Celsius */
> >>  	u16 device_state;
> >> +	u16 curtemp; /* in centi-Celsius */
> >> +	u16 filter_alpha_value;
> >> +	u16 avg_gfx_clkfrequency;
> >> +	u16 avg_fclk_frequency;
> >> +	u16 avg_gfx_activity;
> >> +	u16 avg_socclk_frequency;
> >> +	u16 avg_vclk_frequency;
> >> +	u16 avg_vcn_activity;
> >> +	u16 avg_dram_reads;
> >> +	u16 avg_dram_writes;
> >> +	u16 avg_socket_power;
> >> +	u16 avg_core_power[2];
> >> +	u16 avg_core_c0residency[16];
> >> +	u16 spare1;
> >> +	u32 metrics_counter;
> >>  } __packed;
> >>  
> >>  enum amd_stt_skin_temp {
> >> @@ -592,4 +607,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
> >>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
> >>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
> >>  int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
> >> +
> >> +/* Smart PC - TA interfaces */
> >> +void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
> >>  #endif /* PMF_H */
> >> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> >> new file mode 100644
> >> index 000000000000..08159cd5f853
> >> --- /dev/null
> >> +++ b/drivers/platform/x86/amd/pmf/spc.c
> >> @@ -0,0 +1,118 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * AMD Platform Management Framework Driver - Smart PC Capabilities
> >> + *
> >> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
> >> + * All Rights Reserved.
> >> + *
> >> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> + *          Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> + */
> >> +
> >> +#include <acpi/button.h>
> >> +#include <linux/power_supply.h>
> >> +#include "pmf.h"
> >> +
> >> +static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> >> +{
> >> +	u16 max, avg = 0;
> >> +	int i;
> >> +
> >> +	memset(dev->buf, 0, sizeof(dev->m_table));
> >> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> >> +	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> >> +
> >> +	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> >> +	in->ev_info.skin_temperature = dev->m_table.skin_temp;
> >> +
> >> +	/* get the avg C0 residency of all the cores */
> >> +	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++)
> >> +		avg += dev->m_table.avg_core_c0residency[i];
> > 
> > Is this safe from overflow?
> 
> Yes I think. Can you elaborate a bit more please if there a overflow
> and I am missing it?

You're adding 16 * u16 together into a single u16 here. If it overflows, 
the average of averages calculated below will be pseudo-garbage. (I don't 
know what's the maximum value in the field so it could be safe).

> Thanks,
> Shyam
> 
> > 
> >> +
> >> +	/* get the max C0 residency of all the cores */
> >> +	max = dev->m_table.avg_core_c0residency[0];
> >> +	for (i = 1; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
> >> +		if (dev->m_table.avg_core_c0residency[i] > max)
> >> +			max = dev->m_table.avg_core_c0residency[i];

Why this is done in the different loop? AFAICT, it could be in the same 
loop as avg calculation above. (I know you start from = 1 but it won't 
change the result when starting with 0 index).

> >> +	}
> >> +
> >> +	in->ev_info.avg_c0residency = avg / ARRAY_SIZE(dev->m_table.avg_core_c0residency);

-- 
 i.



> >> +	in->ev_info.max_c0residency = max;
> >> +	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
> >> +}
> >> +
> >> +static const char * const pmf_battery_supply_name[] = {
> >> +	"BATT",
> >> +	"BAT0",
> >> +};
> >> +
> >> +static int get_battery_prop(enum power_supply_property prop)
> >> +{
> >> +	union power_supply_propval value;
> >> +	struct power_supply *psy;
> >> +	int i, ret = -EINVAL;
> >> +
> >> +	for (i = 0; i < ARRAY_SIZE(pmf_battery_supply_name); i++) {
> >> +		psy = power_supply_get_by_name(pmf_battery_supply_name[i]);
> >> +		if (!psy)
> >> +			continue;
> >> +
> >> +		ret = power_supply_get_property(psy, prop, &value);
> >> +		if (ret) {
> >> +			power_supply_put(psy);
> >> +			return ret;
> >> +		}
> >> +	}
> >> +
> >> +	return value.intval;
> >> +}
> >> +
> >> +static int amd_pmf_get_battery_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> >> +{
> >> +	int val;
> >> +
> >> +	val = get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
> >> +	if (val != 1)
> >> +		return -EINVAL;
> >> +
> >> +	in->ev_info.bat_percentage = get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);
> >> +	/* all values in mWh metrics */
> >> +	in->ev_info.bat_design = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) / 1000;
> >> +	in->ev_info.full_charge_capacity = get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) / 1000;
> >> +	in->ev_info.drain_rate = get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) / 1000;
> > 
> > You don't need literal, use the defines provided in linux/units.h.
> > 
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> >> +{
> >> +	int val;
> >> +
> >> +	switch (dev->current_profile) {
> >> +	case PLATFORM_PROFILE_PERFORMANCE:
> >> +		val = TA_BEST_PERFORMANCE;
> >> +		break;
> >> +	case PLATFORM_PROFILE_BALANCED:
> >> +		val = TA_BETTER_PERFORMANCE;
> >> +		break;
> >> +	case PLATFORM_PROFILE_LOW_POWER:
> >> +		val = TA_BEST_BATTERY;
> >> +		break;
> >> +	default:
> >> +		dev_err(dev->dev, "Unknown Platform Profile.\n");
> >> +		return -EOPNOTSUPP;
> >> +	}
> >> +	in->ev_info.power_slider = val;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> >> +{
> >> +	/* TA side lid open is 1 and close is 0, hence the ! here */
> >> +	in->ev_info.lid_state = !acpi_lid_open();
> >> +	in->ev_info.power_source = amd_pmf_get_power_source();
> >> +	amd_pmf_get_smu_info(dev, in);
> >> +	amd_pmf_get_battery_info(dev, in);
> >> +	amd_pmf_get_slider_info(dev, in);
> >> +}
> >> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> >> index a8b05e746efd..eb25d5ce3a9a 100644
> >> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> >> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> >> @@ -113,6 +113,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
> >>  {
> >>  	struct ta_pmf_shared_memory *ta_sm = NULL;
> >>  	struct ta_pmf_enact_result *out = NULL;
> >> +	struct ta_pmf_enact_table *in = NULL;
> >>  	struct tee_param param[MAX_TEE_PARAM];
> >>  	struct tee_ioctl_invoke_arg arg;
> >>  	int ret = 0;
> >> @@ -123,11 +124,13 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
> >>  	memset(dev->shbuf, 0, dev->policy_sz);
> >>  	ta_sm = (struct ta_pmf_shared_memory *)dev->shbuf;
> >>  	out = &ta_sm->pmf_output.policy_apply_table;
> >> +	in = &ta_sm->pmf_input.enact_table;
> >>  
> >>  	memset(ta_sm, 0, sizeof(struct ta_pmf_shared_memory));
> >>  	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES;
> >>  	ta_sm->if_version = PMF_TA_IF_VERSION__MAJOR;
> >>  
> >> +	amd_pmf_populate_ta_inputs(dev, in);
> >>  	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER__ENACT_POLICIES, &arg, param);
> >>  
> >>  	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
> >>
> > 
> 
--8323329-675257746-1696236984=:2459--
