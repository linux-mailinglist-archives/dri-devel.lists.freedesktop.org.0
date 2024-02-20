Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3185C184
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 17:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0262910E4F1;
	Tue, 20 Feb 2024 16:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DedQTk2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3D510E4F0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 16:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708446905; x=1739982905;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j/Afb2Dxl4RH/+nknh0QbyQZ6iTzJWFVe41iWcwGHvk=;
 b=DedQTk2VM4n/ETmFx3ErDU8AaJJpzWnS0Hu9tgnUnpIstEf/6kxUUTNw
 /uVgNm3fXijGCPNkyJ/xXNrrzK6jmFle/aHWWohNmEgpK0mNcmYvDRWci
 Wfvhfy/QOaoctP4HrtmiplyFlsmdr+bukxXIqpCQrAq72Wru3gjZGXAT9
 UEqCBikh/I0T/2iEioR9R2oVjt671dRjUjT34qpKdxc+aWjUTWlZ9m527
 uExpw9y0X3wSweE3BCbRd1CONcT7IxpMeUkfT5ICYMRq1M/yWxxIfLy2z
 frHOfZd8qW0lsXRSSBzWnrpq2UKW+3CSZMMzC3aS/IkPFh2A/SCI2PUCh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="3023566"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="3023566"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 08:35:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="827179336"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="827179336"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.114.39])
 ([10.245.114.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 08:35:02 -0800
Message-ID: <c82a9ceb-9e3b-419a-a6ea-7838a9959afb@linux.intel.com>
Date: Tue, 20 Feb 2024 17:34:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Don't enable any tiles by default on
 VPU40xx
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>, stable@vger.kernel.org
References: <20240220110830.1439719-1-jacek.lawrynowicz@linux.intel.com>
 <20240220131624.1447813-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240220131624.1447813-1-jacek.lawrynowicz@linux.intel.com>
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

On 20.02.2024 14:16, Jacek Lawrynowicz wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> There is no point in requesting 1 tile on VPU40xx as the FW will
> probably need more tiles to run workloads, so it will have to
> reconfigure PLL anyway. Don't enable any tiles and allow the FW to
> perform initial tile configuration.
> 
> This improves NPU boot stability as the tiles are always enabled only
> by the FW from the same initial state.
> 
> Fixes: 79cdc56c4a54 ("accel/ivpu: Add initial support for VPU 4")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_hw_40xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_40xx.c b/drivers/accel/ivpu/ivpu_hw_40xx.c
> index 1c995307c113..a1523d0b1ef3 100644
> --- a/drivers/accel/ivpu/ivpu_hw_40xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_40xx.c
> @@ -24,7 +24,7 @@
>  #define SKU_HW_ID_SHIFT              16u
>  #define SKU_HW_ID_MASK               0xffff0000u
>  
> -#define PLL_CONFIG_DEFAULT           0x1
> +#define PLL_CONFIG_DEFAULT           0x0
>  #define PLL_CDYN_DEFAULT             0x80
>  #define PLL_EPP_DEFAULT              0x80
>  #define PLL_REF_CLK_FREQ	     (50 * 1000000)
