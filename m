Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93470B3E040
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 12:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9E810E417;
	Mon,  1 Sep 2025 10:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UE8SYddK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F3810E417
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 10:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756722975; x=1788258975;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=At0xIjg6V3ZLyXZud/nZ+H/dJuNq2O2khU7HKVzGanw=;
 b=UE8SYddKws/1QRHIke820q3NE6e4W9YdNt/7SLMCvMq7O1z0wKenXSt0
 E/6E8ZjGqZ6hsf9gZCg80mCD9Tx4S/np9eljIEFN6mV6v4NwaWB5TwP97
 2FY5J0JZismQerMW2hpGdFUbmtwHwkzU7ke5T5rzBPzOZ276W3giVtgf3
 KwKN73T1acaGXBlTshZoEkvPvGqdIe5rBbW1PYZd/OnSxCp7CazTAyrb6
 gWPfWE+K93u/davaUvdl2f28wcxsa1EsJ5CEBQwYR0zv69H1RPwa2yHYn
 NpJ40nIMbXleMlF6cb9lZjcOTbRJMpsII+7HPzuBZ9mCMVqQrZbuaxkVY g==;
X-CSE-ConnectionGUID: k0+NniKLSFCW0AAevGNfeA==
X-CSE-MsgGUID: mEEHI55WTs+nbr7e+bmZiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59043503"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59043503"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:36:15 -0700
X-CSE-ConnectionGUID: wOOmpHIHRDKARiHTP2go1w==
X-CSE-MsgGUID: MZocjtk9S26Ch8AZRFlSEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="170536690"
Received: from dmilosz-mobl.ger.corp.intel.com (HELO [10.245.252.194])
 ([10.245.252.194])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:36:13 -0700
Message-ID: <da84de95-ee5b-42b8-a477-89b92c197895@linux.intel.com>
Date: Mon, 1 Sep 2025 12:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Make function parameter names consistent
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com
References: <20250808111014.328607-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250808111014.328607-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-next

On 8/8/2025 1:10 PM, Jacek Lawrynowicz wrote:
> Make ivpu_hw_btrs_dct_set_status() and ivpu_fw_boot_params_setup()
> declaration and definition parameter names consistent.
> 
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_fw.h      | 2 +-
>  drivers/accel/ivpu/ivpu_hw_btrs.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_fw.h b/drivers/accel/ivpu/ivpu_fw.h
> index 9a3935be1c057..7081913fb0dde 100644
> --- a/drivers/accel/ivpu/ivpu_fw.h
> +++ b/drivers/accel/ivpu/ivpu_fw.h
> @@ -45,7 +45,7 @@ struct ivpu_fw_info {
>  int ivpu_fw_init(struct ivpu_device *vdev);
>  void ivpu_fw_fini(struct ivpu_device *vdev);
>  void ivpu_fw_load(struct ivpu_device *vdev);
> -void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *bp);
> +void ivpu_fw_boot_params_setup(struct ivpu_device *vdev, struct vpu_boot_params *boot_params);
>  
>  static inline bool ivpu_fw_is_cold_boot(struct ivpu_device *vdev)
>  {
> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.h b/drivers/accel/ivpu/ivpu_hw_btrs.h
> index d2d82651976d1..032c384ac3d4d 100644
> --- a/drivers/accel/ivpu/ivpu_hw_btrs.h
> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.h
> @@ -36,7 +36,7 @@ u32 ivpu_hw_btrs_dpu_freq_get(struct ivpu_device *vdev);
>  bool ivpu_hw_btrs_irq_handler_mtl(struct ivpu_device *vdev, int irq);
>  bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq);
>  int ivpu_hw_btrs_dct_get_request(struct ivpu_device *vdev, bool *enable);
> -void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u32 dct_percent);
> +void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool enable, u32 active_percent);
>  u32 ivpu_hw_btrs_telemetry_offset_get(struct ivpu_device *vdev);
>  u32 ivpu_hw_btrs_telemetry_size_get(struct ivpu_device *vdev);
>  u32 ivpu_hw_btrs_telemetry_enable_get(struct ivpu_device *vdev);

