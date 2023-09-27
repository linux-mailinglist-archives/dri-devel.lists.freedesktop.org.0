Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B04537B03D9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 14:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA3010E4FB;
	Wed, 27 Sep 2023 12:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CE810E4FA;
 Wed, 27 Sep 2023 12:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695817160; x=1727353160;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=GKfJ0soqMajnD3txP3ekBig1PNDmD03WDZihZps6OGs=;
 b=gTnZ2kJKKe7Tzt0FpAPf5U1QhC0aMFYzCkD2Nj92hLJDu/zRlbrXL1KH
 HFs8jP+aP12VZvGEKIJG1WwbUOoL1yJYgjB76sziww8ec4JPcuRr++Ps+
 QZ+lxzEB2UlDe4tJPXTYclq6IZlSysLHoejPFPYZIOxCPCgGz8wZM6bYu
 S0vc+av5rpQu/PqmIpTwtFbVDdR+PPKJhHvFDQhvc5boi6PjjzHhTcWO1
 0Hy5lNanSzpjGMzpnM7Q4mK2Hj1kSYdeJ4Lk70zqXuQ7MCObjhlEGO7nx
 9/qbN5TrrWbpDd+zaMkIlQbjox5IPrO0TgsWpzurNSGEOr4e88fUAs996 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384598134"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="384598134"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="814853821"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="814853821"
Received: from clkuhl-mobl.amr.corp.intel.com (HELO
 idecesar-mobl.ger.corp.intel.com) ([10.252.53.225])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 05:19:11 -0700
Date: Wed, 27 Sep 2023 15:19:08 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 04/15] platform/x86/amd/pmf: Add support for PMF Policy
 Binary
In-Reply-To: <20230922175056.244940-5-Shyam-sundar.S-k@amd.com>
Message-ID: <18feb3c4-e8c4-9767-48a-7e3ef1c9cc@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-5-Shyam-sundar.S-k@amd.com>
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

> PMF Policy binary is a encrypted and signed binary that will be part
> of the BIOS. PMF driver via the ACPI interface checks the existence
> of Smart PC bit. If the advertised bit is found, PMF driver walks
> the acpi namespace to find out the policy binary size and the address
> which has to be passed to the TA during the TA init sequence.
> 
> The policy binary is comprised of inputs (or the events) and outputs
> (or the actions). With the PMF ecosystem, OEMs generate the policy
> binary (or could be multiple binaries) that contains a supported set
> of inputs and outputs which could be specifically carved out for each
> usage segment (or for each user also) that could influence the system
> behavior either by enriching the user experience or/and boost/throttle
> power limits.
> 
> Once the TA init command succeeds, the PMF driver sends the changing
> events in the current environment to the TA for a constant sampling
> frequency time (the event here could be a lid close or open) and
> if the policy binary has corresponding action built within it, the
> TA sends the action for it in the subsequent enact command.
> 
> If the inputs sent to the TA has no output defined in the policy
> binary generated by OEMs, there will be no action to be performed
> by the PMF driver.
> 
> Example policies:
> 
> 1) if slider is performance ; set the SPL to 40W
> Here PMF driver registers with the platform profile interface and
> when the slider position is changed, PMF driver lets the TA know
> about this. TA sends back an action to update the Sustained
> Power Limit (SPL). PMF driver updates this limit via the PMFW mailbox.
> 
> 2) if user_away ; then lock the system
> Here PMF driver hooks to the AMD SFH driver to know the user presence
> and send the inputs to TA and if the condition is met, the TA sends
> the action of locking the system. PMF driver generates a uevent and
> based on the udev rule in the userland the system gets locked with
> systemctl.
> 
> The intent here is to provide the OEM's to make a policy to lock the
> system when the user is away ; but the userland can make a choice to
> ignore it.
> 
> and so on.
> 
> The OEMs will have an utility to create numerous such policies and
> the policies shall be reviewed by AMD before signing and encrypting
> them. Policies are shared between operating systems to have seemless user
> experience.
> 
> Since all this action has to happen via the "amdtee" driver, currently
> there is no caller for it in the kernel which can load the amdtee driver.
> Without amdtee driver loading onto the system the "tee" calls shall fail
> from the PMF driver. Hence an explicit "request_module" has been added
> to address this.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

> +struct pmf_action_table {
> +	unsigned long spl; /* in mW */
> +	unsigned long sppt; /* in mW */
> +	unsigned long sppt_apuonly; /* in mW */
> +	unsigned long fppt; /* in mW */
> +	unsigned long stt_minlimit; /* in mW */
> +	unsigned long stt_skintemp_apu; /* in C */
> +	unsigned long stt_skintemp_hs2; /* in C */
> +};

> +static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> +{
> +	u32 val;
> +	int idx;
> +
> +	for (idx = 0; idx < out->actions_count; idx++) {
> +		val = out->actions_list[idx].value;
> +		switch (out->actions_list[idx].action_index) {
> +		case PMF_POLICY_SPL:
> +			if (dev->prev_data->spl != val) {
> +				amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPL : %d\n", val);

The %d does not match u32.

> +				dev->prev_data->spl = val;

Why is ->spl (and the others too) unsigned long if it's only assigned u32?

> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT:
> +			if (dev->prev_data->sppt != val) {
> +				amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT : %d\n", val);
> +				dev->prev_data->sppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_FPPT:
> +			if (dev->prev_data->fppt != val) {
> +				amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
> +				dev_dbg(dev->dev, "update FPPT : %d\n", val);
> +				dev->prev_data->fppt = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_SPPT_APU_ONLY:
> +			if (dev->prev_data->sppt_apuonly != val) {
> +				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, val, NULL);
> +				dev_dbg(dev->dev, "update SPPT_APU_ONLY : %d\n", val);
> +				dev->prev_data->sppt_apuonly = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_MIN:
> +			if (dev->prev_data->stt_minlimit != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_MIN : %d\n", val);
> +				dev->prev_data->stt_minlimit = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_APU:
> +			if (dev->prev_data->stt_skintemp_apu != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_SKINTEMP_APU : %d\n", val);
> +				dev->prev_data->stt_skintemp_apu = val;
> +			}
> +			break;
> +
> +		case PMF_POLICY_STT_SKINTEMP_HS2:
> +			if (dev->prev_data->stt_skintemp_hs2 != val) {
> +				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, val, NULL);
> +				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2 : %d\n", val);
> +				dev->prev_data->stt_skintemp_hs2 = val;
> +			}
> +			break;
> +		}
> +	}
> +}
> +


-- 
 i.

