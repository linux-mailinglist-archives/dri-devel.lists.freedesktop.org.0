Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4283D63426B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 18:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC42510E20F;
	Tue, 22 Nov 2022 17:25:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C46310E20F;
 Tue, 22 Nov 2022 17:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669137935; x=1700673935;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ex1Ri5YE43gYyqUh0NJqWutpzBbuebIrbYB7ZJdEoDY=;
 b=inideWJW91ViUu7bT6BcFibJctsPy3Qc+m4HicLFlWnKbS+XDgE2MylI
 Rf+162Z5mWrUKZN9kKNdk45QBOivy9fBAHeDrwKIf6C2w2N5AgMCKH6Si
 JjuoII/r/f4qlSNs6s5s0AQeAlzr10hD+u4dl153JOABQW6hybh/MDrj5
 VCcoKdkZgMIxA0WgXgNHLqWqbzRGOt/dzF7qMyywJMKKHPFAck/YUz+KT
 HcAY3sQLLlGyTKw5ij1hY3CSfpmN+pIEzauTvYSn+AbIcX12XzSw0x4yf
 bXjmv2nW0J6OZ7hznvIosTIgc3n03mT8nlFfWEBCTTpsRPaqutZFmlDSv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="315685391"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="315685391"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 09:18:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="619287384"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="619287384"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga006.jf.intel.com with ESMTP; 22 Nov 2022 09:18:00 -0800
Received: from [10.249.128.57] (sdompke-mobl1.ger.corp.intel.com
 [10.249.128.57])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 2AMHHwZR002319; Tue, 22 Nov 2022 17:17:59 GMT
Message-ID: <258b2016-3bbc-80ee-b187-bc6d93699359@intel.com>
Date: Tue, 22 Nov 2022 18:17:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.5.0
Subject: Re: [PATCH v2 2/5] drm/i915/huc: Add HuC specific debug print wrappers
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
 <20221118015858.2548106-3-John.C.Harrison@Intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20221118015858.2548106-3-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18.11.2022 02:58, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Create a set of HuC printers and start using them.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_huc.c | 31 ++++++++++----------------
>  drivers/gpu/drm/i915/gt/uc/intel_huc.h | 23 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index be855811d85df..0bbbc7192da63 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -107,11 +107,9 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
>  
>  	if (!intel_huc_is_authenticated(huc)) {
>  		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
> -			drm_notice(&huc_to_gt(huc)->i915->drm,
> -				   "timed out waiting for MEI GSC init to load HuC\n");
> +			huc_notice(huc, "Timed out waiting for MEI GSC init to load FW\n");
>  		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
> -			drm_notice(&huc_to_gt(huc)->i915->drm,
> -				   "timed out waiting for MEI PXP init to load HuC\n");
> +			huc_notice(huc, "Timed out waiting for MEI PXP init to load FW\n");
>  		else
>  			MISSING_CASE(huc->delayed_load.status);
>  
> @@ -174,8 +172,7 @@ static int gsc_notifier(struct notifier_block *nb, unsigned long action, void *d
>  
>  	case BUS_NOTIFY_DRIVER_NOT_BOUND: /* mei driver fails to be bound */
>  	case BUS_NOTIFY_UNBIND_DRIVER: /* mei driver about to be unbound */
> -		drm_info(&huc_to_gt(huc)->i915->drm,
> -			 "mei driver not bound, disabling HuC load\n");
> +		huc_info(huc, "- mei driver not bound, disabling HuC load\n");
>  		gsc_init_error(huc);
>  		break;
>  	}
> @@ -193,8 +190,7 @@ void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus
>  	huc->delayed_load.nb.notifier_call = gsc_notifier;
>  	ret = bus_register_notifier(bus, &huc->delayed_load.nb);
>  	if (ret) {
> -		drm_err(&huc_to_gt(huc)->i915->drm,
> -			"failed to register GSC notifier\n");
> +		huc_err(huc, "Failed to register GSC notifier\n");
>  		huc->delayed_load.nb.notifier_call = NULL;
>  		gsc_init_error(huc);
>  	}
> @@ -284,8 +280,7 @@ static int check_huc_loading_mode(struct intel_huc *huc)
>  			      GSC_LOADS_HUC;
>  
>  	if (fw_needs_gsc != hw_uses_gsc) {
> -		drm_err(&gt->i915->drm,
> -			"mismatch between HuC FW (%s) and HW (%s) load modes\n",
> +		huc_err(huc, "Mismatch between FW (%s) and HW (%s) load modes\n",
>  			HUC_LOAD_MODE_STRING(fw_needs_gsc),
>  			HUC_LOAD_MODE_STRING(hw_uses_gsc));
>  		return -ENOEXEC;
> @@ -294,19 +289,17 @@ static int check_huc_loading_mode(struct intel_huc *huc)
>  	/* make sure we can access the GSC via the mei driver if we need it */
>  	if (!(IS_ENABLED(CONFIG_INTEL_MEI_PXP) && IS_ENABLED(CONFIG_INTEL_MEI_GSC)) &&
>  	    fw_needs_gsc) {
> -		drm_info(&gt->i915->drm,
> -			 "Can't load HuC due to missing MEI modules\n");
> +		huc_info(huc, "Can't load due to missing MEI modules\n");
>  		return -EIO;
>  	}
>  
> -	drm_dbg(&gt->i915->drm, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));
> +	huc_dbg(huc, "GSC loads huc=%s\n", str_yes_no(fw_needs_gsc));

this will give:

	"GT0: HuC GSC loads huc=yes"

but maybe better to change that to get:

	"GT0: HuC loaded by GSC=yes"

so this should be:

	huc_dbg(huc, "loaded by GSC=%s\n", str_yes_no(fw_needs_gsc));

>  
>  	return 0;
>  }
>  
>  int intel_huc_init(struct intel_huc *huc)
>  {
> -	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
>  	int err;
>  
>  	err = check_huc_loading_mode(huc);
> @@ -323,7 +316,7 @@ int intel_huc_init(struct intel_huc *huc)
>  
>  out:
>  	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
> -	drm_info(&i915->drm, "HuC init failed with %d\n", err);
> +	huc_info(huc, "init failed with %d\n", err);
>  	return err;
>  }
>  
> @@ -366,13 +359,13 @@ int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
>  	delayed_huc_load_complete(huc);
>  
>  	if (ret) {
> -		drm_err(&gt->i915->drm, "HuC: Firmware not verified %d\n", ret);
> +		huc_err(huc, "firmware not verified %d\n", ret);
>  		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
>  		return ret;
>  	}
>  
>  	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
> -	drm_info(&gt->i915->drm, "HuC authenticated\n");
> +	huc_info(huc, "authenticated\n");
>  	return 0;
>  }
>  
> @@ -407,7 +400,7 @@ int intel_huc_auth(struct intel_huc *huc)
>  
>  	ret = intel_guc_auth_huc(guc, intel_guc_ggtt_offset(guc, huc->fw.rsa_data));
>  	if (ret) {
> -		DRM_ERROR("HuC: GuC did not ack Auth request %d\n", ret);
> +		huc_err(huc, "auth request not acked by GuC: %d\n", ret);
>  		goto fail;
>  	}
>  
> @@ -419,7 +412,7 @@ int intel_huc_auth(struct intel_huc *huc)
>  	return 0;
>  
>  fail:
> -	i915_probe_error(gt->i915, "HuC: Authentication failed %d\n", ret);
> +	huc_probe_error(huc, "authentication failed %d\n", ret);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index 52db03620c609..f253c1c19f12f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -16,6 +16,29 @@
>  
>  struct bus_type;
>  
> +#define huc_err(_huc, _fmt, ...) \
> +	gt_err(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
> +
> +#define huc_warn(_huc, _fmt, ...) \
> +	gt_warn(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
> +
> +#define huc_notice(_huc, _fmt, ...) \
> +	gt_notice(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
> +
> +#define huc_info(_huc, _fmt, ...) \
> +	gt_info(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
> +
> +#define huc_dbg(_huc, _fmt, ...) \
> +	gt_dbg(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)
> +
> +#define huc_probe_error(_huc, _fmt, ...) \
> +	do { \
> +		if (i915_error_injected()) \
> +			huc_dbg(_huc, _fmt, ##__VA_ARGS__); \
> +		else \
> +			huc_err(_huc, _fmt, ##__VA_ARGS__); \
> +	} while (0)

shouldn't we use gt_probe_error() here ?

#define huc_probe_error(_huc, _fmt, ...) \
	gt_probe_error(huc_to_gt(_huc), "HuC " _fmt, ##__VA_ARGS__)

> +
>  enum intel_huc_delayed_load_status {
>  	INTEL_HUC_WAITING_ON_GSC = 0,
>  	INTEL_HUC_WAITING_ON_PXP,
