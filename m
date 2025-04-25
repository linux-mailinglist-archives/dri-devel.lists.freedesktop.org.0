Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6328A9C201
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 10:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2442E10E8D4;
	Fri, 25 Apr 2025 08:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hDPVItuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8705810E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 08:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745571071; x=1777107071;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L/KfqH9MZtQOA04gWuzJIE/ONGhE4FALNIovQZn85cM=;
 b=hDPVItuTY0HFQ92/tZ6tJpLNLxeaBQkUJoheR8fkqXyere25tpdJpynU
 xUUwwRKXPDccvtTPijbrkTzctysn+j5hwCCA8PHZtiqq4Ij7QQGsmkdpj
 WFErCPhTydx/Bdsddi1Gblb0fKqWdXo67hdRv5h6uNSuNI/k+d6OUihtu
 jF9AP9Q0lDdefCLstVGGc45hhOCJ36xA/EJDwVE6Xj12VvlSjbuXx6FDG
 A/LLKR6/j0XPx7whqC2yhYzGUcujZJqa7GT494ZGg84y09Rz4d7+wlIBC
 4VZuiivNCC+2QnIPinKyTl4bzWPrfleA/DkWfW4ChinlAa1jTg6zxcy0Y w==;
X-CSE-ConnectionGUID: lVhH5vpwSh+gtKagtUyG6A==
X-CSE-MsgGUID: ajSQk8JlSOuwOoPYV1n+xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47111779"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47111779"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:51:11 -0700
X-CSE-ConnectionGUID: hiC/UaFJS7+roJ0Ckn6PAg==
X-CSE-MsgGUID: ze3sgRZaT7aBWcVSXeIeDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="137657833"
Received: from pwilma-mobl1.ger.corp.intel.com (HELO [10.245.252.249])
 ([10.245.252.249])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 01:51:09 -0700
Message-ID: <261a616d-7eb7-417d-aee8-905f93f78491@linux.intel.com>
Date: Fri, 25 Apr 2025 10:51:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix the D0i2 disable test mode
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@linux.intel.com>
References: <20250416102629.384626-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250416102629.384626-1-maciej.falkowski@linux.intel.com>
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
> From: Andrzej Kacprowski <Andrzej.Kacprowski@linux.intel.com>
> 
> Correct setup of D0i2 disable which was
> by mistake set up to value 1 and use BIT(1) instead.
> 
> Fixes: 011529fe8112 ("accel/ivpu: Implement D0i2 disable test mode")
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@linux.intel.com>
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_fw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index 5e1d709c6a46..ccaaf6c100c0 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -544,7 +544,7 @@ static void ivpu_fw_boot_params_print(struct ivpu_device *vdev, struct vpu_boot_
>  		 boot_params->d0i3_entry_vpu_ts);
>  	ivpu_dbg(vdev, FW_BOOT, "boot_params.system_time_us = %llu\n",
>  		 boot_params->system_time_us);
> -	ivpu_dbg(vdev, FW_BOOT, "boot_params.power_profile = %u\n",
> +	ivpu_dbg(vdev, FW_BOOT, "boot_params.power_profile = 0x%x\n",
>  		 boot_params->power_profile);
>  }
>  
> @@ -646,7 +646,7 @@ void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params
>  	boot_params->d0i3_residency_time_us = 0;
>  	boot_params->d0i3_entry_vpu_ts = 0;
>  	if (IVPU_WA(disable_d0i2))
> -		boot_params->power_profile = 1;
> +		boot_params->power_profile |= BIT(1);
>  
>  	boot_params->system_time_us = ktime_to_us(ktime_get_real());
>  	wmb(); /* Flush WC buffers after writing bootparams */

