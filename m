Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB17B0592
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:36:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FE910E51F;
	Wed, 27 Sep 2023 13:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152D010E51F;
 Wed, 27 Sep 2023 13:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695821805; x=1727357805;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=fdvcNS8sPUuvoomLIhYt1Lp4qOK7EMXglT6h/GgFXOg=;
 b=hkkXWMKUIb8z3myhPJWGoW0Wn0m2jgBlCBXGUJDcpZGE/K9dB46849Or
 FNHzsg+SQqE2oc57gtVLViQUP8XsO6U4+JUAgUnZr/EuOWliBNmpAo989
 /4mO2VdDZTcIN+6cs7VyHU2DCW+XRu+qhnQpYLEMmH9VVSuL6oE+K6KaB
 XLDVKkfUPVfsAto84wIaavIuW5jEre+htHC0LquRteod3b0GQK093L+O+
 Zy0cC2a53bGQw7iCawdZ4iTXqehLqCIrWJfcBwq1SppwCyP4KLOTO3N4Q
 Y65Jfgwqb9wgY56jH//5MpSFJsePubymgHhU5J+8/c+TI3M4FaTcZJ5Zn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384614747"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="384614747"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:36:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996157205"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="996157205"
Received: from clkuhl-mobl.amr.corp.intel.com (HELO
 idecesar-mobl.ger.corp.intel.com) ([10.252.53.225])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:36:39 -0700
Date: Wed, 27 Sep 2023 16:36:37 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
In-Reply-To: <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
Message-ID: <2a5b242b-b074-7fdb-fcdb-683d52b9da3@linux.intel.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
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
 markgross@kernel.org, hdegoede@redhat.com, benjamin.tissoires@redhat.com,
 mario.limonciello@amd.com, linux-input@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Sep 2023, Shyam Sundar S K wrote:

> For the Smart PC Solution to fully work, it has to enact to the actions
> coming from TA. Add the initial code path for set interface to AMDGPU.
> 
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>  drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>  include/linux/amd-pmf-io.h              |  1 +
>  4 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> index 232d11833ddc..5c567bff0548 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
> +
> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
> +{
> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
> +	struct backlight_device *bd;
> +
> +	if (!(adev->flags & AMD_IS_APU)) {
> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
> +		return -ENODEV;
> +	}
> +
> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
> +	if (!bd)
> +		return -ENODEV;
> +
> +	backlight_device_set_brightness(bd, pmf->brightness);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 9032df4ba48a..ce89cc0daa5a 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -73,6 +73,7 @@
>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
>  #define PMF_POLICY_SYSTEM_STATE					9
> +#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
>  #define PMF_POLICY_P3T						38
>  
>  /* TA macros */
> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {
>  };
>  
>  struct pmf_action_table {
> +	unsigned long display_brightness;
>  	enum system_state system_state;
>  	unsigned long spl; /* in mW */
>  	unsigned long sppt; /* in mW */
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 1608996654e8..eefffff83a4c 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>  	return 0;
>  }
>  
> -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)

Changing return type but no caller is changed to handle the error??

>  {
>  	u32 val, event = 0;
> -	int idx;
> +	int idx, ret;
>  
>  	for (idx = 0; idx < out->actions_count; idx++) {
>  		val = out->actions_list[idx].value;
> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  				dev->prev_data->system_state = 0;
>  			}
>  			break;
> +
> +		case PMF_POLICY_DISPLAY_BRIGHTNESS:
> +			ret = amd_pmf_get_gfx_data(&dev->gfx_data);
> +			if (ret)
> +				return ret;
> +
> +			dev->prev_data->display_brightness = dev->gfx_data.brightness;
> +			if (dev->prev_data->display_brightness != val) {
> +				dev->gfx_data.brightness = val;
> +				amd_pmf_set_gfx_data(&dev->gfx_data);
> +				dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %d\n", val);
> +			}
> +			break;
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
> index a2d4af231362..ecae387ddaa6 100644
> --- a/include/linux/amd-pmf-io.h
> +++ b/include/linux/amd-pmf-io.h
> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
>  };
>  
>  int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>  #endif
> 

-- 
 i.

