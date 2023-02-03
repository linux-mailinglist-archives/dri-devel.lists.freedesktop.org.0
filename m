Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6CE689494
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 11:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB8E10E522;
	Fri,  3 Feb 2023 10:02:37 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA88D10E522;
 Fri,  3 Feb 2023 10:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675418555; x=1706954555;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6p8Nu1HUcoLOV3vD6WXLsAbcNuu/hKPCNjCgC1/qzvk=;
 b=b5v6f/lNd6rIsgEpusrljnM6fwzRmqE+/y0CQJGOJw5gjcm2WP9192D3
 V1FCM3CguuwRv3n1swi9mwGDDDNklMWeklU9TlIdFTsVigZtSqGb9glPE
 acAnEEw3ZETy3sJYJz+vqrgY/XmaKG6jcMOyhTsGyMNRl2CZ+7gT7wWAj
 QyDwXWIt0c5WNjKJdB/L1Q4dfmJtsQzGQ7+jLcl4h6QbXe/r7hJlI6Uuv
 /G0/NYW5qMSoZF4773ZMKtc4ROHZIH2wCe29J83CPl34hpHzxvC75d8un
 BHpYUAQ+tfD/DdIpLdcw3bjEhVA1Y11HxlIhMvePUIGcxudfLlN6YJ/Ws A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="309044501"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="309044501"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 02:02:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="754425636"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="754425636"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2023 02:02:34 -0800
Received: from [10.249.139.149] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.139.149])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 873F337833;
 Fri,  3 Feb 2023 10:02:33 +0000 (GMT)
Message-ID: <c467c002-bb7a-7a8b-ea49-589e1be1ff8f@intel.com>
Date: Fri, 3 Feb 2023 11:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] drm/i915/guc: More debug print updates - GuC logging
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230203001143.3323433-1-John.C.Harrison@Intel.com>
 <20230203001143.3323433-7-John.C.Harrison@Intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20230203001143.3323433-7-John.C.Harrison@Intel.com>
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



On 03.02.2023 01:11, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Update a bunch more debug prints to use the new GT based scheme.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_print.h     | 3 +++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c   | 3 +--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_print.h | 3 +++
>  3 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_print.h b/drivers/gpu/drm/i915/gt/intel_gt_print.h
> index 5d9da355ce242..55a336a9ff061 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_print.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_print.h
> @@ -28,6 +28,9 @@
>  #define gt_err_ratelimited(_gt, _fmt, ...) \
>  	drm_err_ratelimited(&(_gt)->i915->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>  
> +#define gt_notice_ratelimited(_gt, _fmt, ...) \
> +	dev_notice_ratelimited((_gt)->i915->drm.dev, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
> +
>  #define gt_probe_error(_gt, _fmt, ...) \
>  	do { \
>  		if (i915_error_injected()) \
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> index c3792ddeec802..818e9e0e66a83 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
> @@ -333,8 +333,7 @@ bool intel_guc_check_log_buf_overflow(struct intel_guc_log *log,
>  			log->stats[type].sampled_overflow += 16;
>  		}
>  
> -		dev_notice_ratelimited(guc_to_gt(log_to_guc(log))->i915->drm.dev,
> -				       "GuC log buffer overflow\n");
> +		guc_notice_ratelimited(log_to_guc(log), "log buffer overflow\n");
>  	}
>  
>  	return overflow;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
> index e75989d4ba067..2465d05638b40 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
> @@ -30,6 +30,9 @@
>  #define guc_err_ratelimited(_guc, _fmt, ...) \
>  	guc_printk((_guc), err_ratelimited, _fmt, ##__VA_ARGS__)
>  
> +#define guc_notice_ratelimited(_guc, _fmt, ...) \
> +	guc_printk((_guc), notice_ratelimited, _fmt, ##__VA_ARGS__)
> +
>  #define guc_probe_error(_guc, _fmt, ...) \
>  	guc_printk((_guc), probe_error, _fmt, ##__VA_ARGS__)
>  

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
