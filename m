Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D69C6CC8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 11:23:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DD210E6BF;
	Wed, 13 Nov 2024 10:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eenX3yrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9E410E6BF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731493423; x=1763029423;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1NJclrHY+c/0JlcxaJ85QCbt7t3fjkwkvW8wdas1LCQ=;
 b=eenX3yrZEAe+gtZg9yureEVQ3dTWWnI3OVCkxa5v/1DT4SfYqEenxxPN
 dGR8tfuk+Czv/0AP+lfry++r1igwfbOR1CGddObAJpDbXW0vbS6oQG790
 c/nN9878NqjS7Rog/0sTexSqj/BVjazQkJ0tA0QJ7x73XGsFAefJ5xkYR
 UOWsL1a5y3RYq2qwneGJcrC9VrkwjEaFCty+q0TQBGu8GTraM/uD5BiTJ
 TQDMb41AUp5bZL8hMzp6DixPuO5AmFD7kvY4NiFt7r0UDjddo1ACG+0vZ
 Zd0OF87vYrNLHNrKZHRc+PJFwbmElGWxIwFgr89JMqxpb3508fI5y7Og1 g==;
X-CSE-ConnectionGUID: UlPn2ctzTA+kdE/UeWMTug==
X-CSE-MsgGUID: dIJwcSdRSnKqzpyqUzFkDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31470034"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="31470034"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 02:23:43 -0800
X-CSE-ConnectionGUID: 8Op7CCtYSWurJjgt1Vi00A==
X-CSE-MsgGUID: RICydwwyTI2mbvr3l7pNHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="87992111"
Received: from lhuot-mobl.amr.corp.intel.com (HELO [10.245.80.201])
 ([10.245.80.201])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 02:23:42 -0800
Message-ID: <1090e813-3296-45b7-b51e-eae7d7e71da0@linux.intel.com>
Date: Wed, 13 Nov 2024 11:23:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix Qemu crash when running in passthrough
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com, stable@vger.kernel.org,
 Karol Wachowski <karol.wachowski@linux.intel.com>
References: <20241106105549.2757115-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241106105549.2757115-1-jacek.lawrynowicz@linux.intel.com>
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

On 11/6/2024 11:55 AM, Jacek Lawrynowicz wrote:
> Restore PCI state after putting the NPU in D0.
> Restoring state before powering up the device caused a Qemu crash
> if NPU was running in passthrough mode and recovery was performed.
> 
> Fixes: 3534eacbf101 ("accel/ivpu: Fix PCI D0 state entry in resume")
> Cc: <stable@vger.kernel.org> # v6.8+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
> index 59d3170f5e354..5aac3d64045d3 100644
> --- a/drivers/accel/ivpu/ivpu_pm.c
> +++ b/drivers/accel/ivpu/ivpu_pm.c
> @@ -73,8 +73,8 @@ static int ivpu_resume(struct ivpu_device *vdev)
>  	int ret;
>  
>  retry:
> -	pci_restore_state(to_pci_dev(vdev->drm.dev));
>  	pci_set_power_state(to_pci_dev(vdev->drm.dev), PCI_D0);
> +	pci_restore_state(to_pci_dev(vdev->drm.dev));
>  
>  	ret = ivpu_hw_power_up(vdev);
>  	if (ret) {

