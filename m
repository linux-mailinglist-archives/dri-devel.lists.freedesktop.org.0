Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4B7A9C212
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED11A10E8D7;
	Fri, 25 Apr 2025 08:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GTOdHaHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A131910E8D6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745571090; x=1777107090;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3haJLTedau4sXV9L05Y3NxuA5jQpX2ZlIMU47OUXNGM=;
 b=GTOdHaHA7Ot9xzEmSrJmQwg0uQaJG1lW0axjEYewt9GKYMdnIjk6pqx7
 vIzJU1KLub8WGB94WnFARXLbEXqNWagThfOQgMiAoPVj4tzOjmVQXVkly
 rJiPbz3L4CuwnlqitkGG7ujdXaBBjFRaZlnrQcFM63bO7CwL3YZh0c2H9
 YUdenZIGfj+Eaw3xvaSP9otR1QPcsDSBNqU9C5cu6WMMxZeyiz6GGp+2P
 iKUTo1kNcAd8lzufE2J4FB4qqCP/EKvh6m3/0dog+kUSPikEJ3VkqzbGW
 iKxgWFEicNveMfo+cwturSNm/3y4ivWRaE/7K3jLMd/slNcdAeFLnvrNQ w==;
X-CSE-ConnectionGUID: 8TQize1ZTZGThkXcQiayPw==
X-CSE-MsgGUID: /ZmDimXYRymlHr+PhppkOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47243824"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47243824"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:51:30 -0700
X-CSE-ConnectionGUID: W1TGHBdoT4WEHvpN6syR0Q==
X-CSE-MsgGUID: KIdIY74TTc+5GK3g/5ULBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="133382880"
Received: from pwilma-mobl1.ger.corp.intel.com (HELO [10.245.252.249])
 ([10.245.252.249])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:51:27 -0700
Message-ID: <1f899e90-51e5-49f1-a621-4b0997aabfdf@linux.intel.com>
Date: Fri, 25 Apr 2025 10:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Correct DCT interrupt handling
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, lizhi.hou@amd.com,
 Karol Wachowski <karol.wachowski@intel.com>
References: <20250416102616.384577-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250416102616.384577-1-maciej.falkowski@linux.intel.com>
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

Applied to drm-misc-fixes

On 4/16/2025 12:26 PM, Maciej Falkowski wrote:
> From: Karol Wachowski <karol.wachowski@intel.com>
> 
> Fix improper use of dct_active_percent field in DCT interrupt handler
> causing DCT to never get enabled. Set dct_active_percent internally before
> IPC to ensure correct driver value even if IPC fails.
> Set default DCT value to 30 accordingly to HW architecture specification.
> 
> Fixes: a19bffb10c46 ("accel/ivpu: Implement DCT handling")
> Signed-off-by: Karol Wachowski <karol.wachowski@intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_hw_btrs.h |  2 +-
>  drivers/accel/ivpu/ivpu_pm.c      | 18 ++++++++++--------
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.h b/drivers/accel/ivpu/ivpu_hw_btrs.h
> index 300f749971d4..d2d82651976d 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.h
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.h
> @@ -14,7 +14,7 @@
>  #define PLL_PROFILING_FREQ_DEFAULT   38400000
>  #define PLL_PROFILING_FREQ_HIGH      400000000
>  
> -#define DCT_DEFAULT_ACTIVE_PERCENT 15u
> +#define DCT_DEFAULT_ACTIVE_PERCENT 30u
>  #define DCT_PERIOD_US		   35300u
>  
>  int ivpu_hw_btrs_info_init(struct ivpu_device *vdev);
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 1fe03fc16bbc..ea30db181cd7 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -448,16 +448,17 @@ int ivpu_pm_dct_enable(struct ivpu_device *vdev, u8 active_percent)
>  	active_us = (DCT_PERIOD_US * active_percent) / 100;
>  	inactive_us = DCT_PERIOD_US - active_us;
>  
> +	vdev->pm->dct_active_percent = active_percent;
> +
> +	ivpu_dbg(vdev, PM, "DCT requested %u%% (D0: %uus, D0i2: %uus)\n",
> +		 active_percent, active_us, inactive_us);
> +
>  	ret = ivpu_jsm_dct_enable(vdev, active_us, inactive_us);
>  	if (ret) {
>  		ivpu_err_ratelimited(vdev, "Failed to enable DCT: %d\n", ret);
>  		return ret;
>  	}
>  
> -	vdev->pm->dct_active_percent = active_percent;
> -
> -	ivpu_dbg(vdev, PM, "DCT set to %u%% (D0: %uus, D0i2: %uus)\n",
> -		 active_percent, active_us, inactive_us);
>  	return 0;
>  }
>  
> @@ -465,15 +466,16 @@ int ivpu_pm_dct_disable(struct ivpu_device *vdev)
>  {
>  	int ret;
>  
> +	vdev->pm->dct_active_percent = 0;
> +
> +	ivpu_dbg(vdev, PM, "DCT requested to be disabled\n");
> +
>  	ret = ivpu_jsm_dct_disable(vdev);
>  	if (ret) {
>  		ivpu_err_ratelimited(vdev, "Failed to disable DCT: %d\n", ret);
>  		return ret;
>  	}
>  
> -	vdev->pm->dct_active_percent = 0;
> -
> -	ivpu_dbg(vdev, PM, "DCT disabled\n");
>  	return 0;
>  }
>  
> @@ -486,7 +488,7 @@ void ivpu_pm_irq_dct_work_fn(struct work_struct *work)
>  	if (ivpu_hw_btrs_dct_get_request(vdev, &enable))
>  		return;
>  
> -	if (vdev->pm->dct_active_percent)
> +	if (enable)
>  		ret = ivpu_pm_dct_enable(vdev, DCT_DEFAULT_ACTIVE_PERCENT);
>  	else
>  		ret = ivpu_pm_dct_disable(vdev);

