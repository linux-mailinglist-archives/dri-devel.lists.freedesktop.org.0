Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE3EADAECE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 13:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EA210E34F;
	Mon, 16 Jun 2025 11:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IzuDTfu6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85D810E34F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750073956; x=1781609956;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sdsaLDaPNFhC9ZHXsKEoSirjH8ni09+1Gxz2ngF4vKg=;
 b=IzuDTfu6Vfi+wmoQObkoJDoKhuENZ/NG5C24/bshin5w/ohBrtRwis5b
 FNLEqKs2TkfCYjGuGYpkaeVw3ZDKkzcEg/kAV2svvYK+r06Ru9PkH5JCz
 /pY4gZVlKnAT8hx/I6IwfM3Acb6vCGlBUX9INBmzzKmDAigKn/DnYSj+D
 lO645lYXPGrCVDNWwZ1bAZm/VjKP0iEelNQVHa1p3g4LXF8sVYIQGXwa9
 U748WfqIDcwdxR2keJf3kyATvJ0X+rs+uqYRBBGFqeelwMdz1Yxy00P4m
 zTGdKGJCUYrH5v3b8fStGVXaQLbci5WoPh8vo9VySRQwdCGczesMF/LeO g==;
X-CSE-ConnectionGUID: m+3A74XiSbmJ+drbFOa27Q==
X-CSE-MsgGUID: UhJfajrYSN2+roUIRO8Vqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63246647"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="63246647"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 04:39:15 -0700
X-CSE-ConnectionGUID: Y9d0lXf5Sy2MCOSarEFeFA==
X-CSE-MsgGUID: 0wl8ZYwZQYq2+NpmTFXIvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="185710903"
Received: from wegrzynx-mobl5.ger.corp.intel.com (HELO [10.245.115.76])
 ([10.245.115.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 04:39:13 -0700
Message-ID: <63067b4e-235a-4a27-af49-a67eabd99b06@linux.intel.com>
Date: Mon, 16 Jun 2025 13:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add initial Wildcat Lake support
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com
References: <20250605161947.1237727-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250605161947.1237727-1-maciej.falkowski@linux.intel.com>
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

On 6/5/2025 6:19 PM, Maciej Falkowski wrote:
> Add support for Wildcat Lake (WCL) CPUs.
> Wildcat Lake contains NPU5 just like Panther Lake
> hence the initial support is very simple and adds
> only PCI IDs.
> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_drv.c   | 1 +
>  drivers/accel/ivpu/ivpu_drv.h   | 3 +++
>  drivers/accel/ivpu/ivpu_hw_ip.c | 1 +
>  3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
> index 0e7748c5e117..3d6d52492536 100644
> --- a/drivers/accel/ivpu/ivpu_drv.c
> +++ b/drivers/accel/ivpu/ivpu_drv.c
> @@ -704,6 +704,7 @@ static struct pci_device_id ivpu_pci_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_ARL) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_LNL) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_PTL_P) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_WCL) },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, ivpu_pci_ids);
> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
> index b6d6b3238b59..17aa3532c76d 100644
> --- a/drivers/accel/ivpu/ivpu_drv.h
> +++ b/drivers/accel/ivpu/ivpu_drv.h
> @@ -26,6 +26,7 @@
>  #define PCI_DEVICE_ID_ARL	0xad1d
>  #define PCI_DEVICE_ID_LNL	0x643e
>  #define PCI_DEVICE_ID_PTL_P	0xb03e
> +#define PCI_DEVICE_ID_WCL	0xfd3e
>  
>  #define IVPU_HW_IP_37XX 37
>  #define IVPU_HW_IP_40XX 40
> @@ -241,6 +242,7 @@ static inline int ivpu_hw_ip_gen(struct ivpu_device *vdev)
>  	case PCI_DEVICE_ID_LNL:
>  		return IVPU_HW_IP_40XX;
>  	case PCI_DEVICE_ID_PTL_P:
> +	case PCI_DEVICE_ID_WCL:
>  		return IVPU_HW_IP_50XX;
>  	default:
>  		dump_stack();
> @@ -257,6 +259,7 @@ static inline int ivpu_hw_btrs_gen(struct ivpu_device *vdev)
>  		return IVPU_HW_BTRS_MTL;
>  	case PCI_DEVICE_ID_LNL:
>  	case PCI_DEVICE_ID_PTL_P:
> +	case PCI_DEVICE_ID_WCL:
>  		return IVPU_HW_BTRS_LNL;
>  	default:
>  		dump_stack();
> diff --git a/drivers/accel/ivpu/ivpu_hw_ip.c b/drivers/accel/ivpu/ivpu_hw_ip.c
> index 823f6a57dc54..2bf9882ab52e 100644
> --- a/drivers/accel/ivpu/ivpu_hw_ip.c
> +++ b/drivers/accel/ivpu/ivpu_hw_ip.c
> @@ -683,6 +683,7 @@ static void pwr_island_delay_set(struct ivpu_device *vdev)
>  		return;
>  
>  	switch (ivpu_device_id(vdev)) {
> +	case PCI_DEVICE_ID_WCL:
>  	case PCI_DEVICE_ID_PTL_P:
>  		post = high ? 18 : 0;
>  		post1 = 0;

