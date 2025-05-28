Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09ADAC664C
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3324710E2A1;
	Wed, 28 May 2025 09:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWDJNZFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E9310E2A1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748425953; x=1779961953;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rCFS/foDqkHrqtWq7TADMWRqoO8X7Mjl+yqgrT4ZHBA=;
 b=NWDJNZFRUtvy4+IpjUjx3ZiVPOu8m3nY0s7BC0q8uLFVLanyIdwEf8az
 NTBIeJpy/1f9s5VrM6QftY2Yl1yq+g7RpgtuIHmcqQe9gmXvO0uU2n0c4
 VY2SA/4H9YcXNncMwGh6WDjP9DAqJHNI9QJ/Z55i1rpUA/KJ36Aawd5DC
 4hkSQjzck3hHkr+QPaSF2KdrnSefznT9v8If33XKdjpMPTlF08SZ/Aklf
 oC7xM8x2YEe8JH7FpohqQDCzXCxKLWbRahllNg4xJTNYD77tiAvKWnP5i
 IsLJh1e8cbd+XYW5Y+XXJY4qXrExxzv8YmiGUmalnnDmou8C7t9OaC6kg w==;
X-CSE-ConnectionGUID: RnqOzvuET5izxxC7D1j6DQ==
X-CSE-MsgGUID: nbyppkwsS0+Kh2hJUqns8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50143893"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50143893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:52:33 -0700
X-CSE-ConnectionGUID: Eyjhw2k5RD2yvvbHlGQq0w==
X-CSE-MsgGUID: J1o5et9SRpyafie6NhxyrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="148234800"
Received: from fbeltech-mobl2.ger.corp.intel.com (HELO [10.245.80.225])
 ([10.245.80.225])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:52:32 -0700
Message-ID: <a56c10eb-30d3-4e8e-83b7-7984e75c8d89@linux.intel.com>
Date: Wed, 28 May 2025 11:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Use firmware names from upstream repo
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com, stable@vger.kernel.org
References: <20250506092030.280276-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250506092030.280276-1-jacek.lawrynowicz@linux.intel.com>
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

On 5/6/2025 11:20 AM, Jacek Lawrynowicz wrote:
> Use FW names from linux-firmware repo instead of deprecated ones.
> 
> Fixes: c140244f0cfb ("accel/ivpu: Add initial Panther Lake support")
> Cc: <stable@vger.kernel.org> # v6.13+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_fw.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
> index ccaaf6c100c02..9db741695401e 100644
> --- a/drivers/accel/ivpu/ivpu_fw.c
> +++ b/drivers/accel/ivpu/ivpu_fw.c
> @@ -55,18 +55,18 @@ static struct {
>  	int gen;
>  	const char *name;
>  } fw_names[] = {
> -	{ IVPU_HW_IP_37XX, "vpu_37xx.bin" },
> +	{ IVPU_HW_IP_37XX, "intel/vpu/vpu_37xx_v1.bin" },
>  	{ IVPU_HW_IP_37XX, "intel/vpu/vpu_37xx_v0.0.bin" },
> -	{ IVPU_HW_IP_40XX, "vpu_40xx.bin" },
> +	{ IVPU_HW_IP_40XX, "intel/vpu/vpu_40xx_v1.bin" },
>  	{ IVPU_HW_IP_40XX, "intel/vpu/vpu_40xx_v0.0.bin" },
> -	{ IVPU_HW_IP_50XX, "vpu_50xx.bin" },
> +	{ IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v1.bin" },
>  	{ IVPU_HW_IP_50XX, "intel/vpu/vpu_50xx_v0.0.bin" },
>  };
>  
>  /* Production fw_names from the table above */
> -MODULE_FIRMWARE("intel/vpu/vpu_37xx_v0.0.bin");
> -MODULE_FIRMWARE("intel/vpu/vpu_40xx_v0.0.bin");
> -MODULE_FIRMWARE("intel/vpu/vpu_50xx_v0.0.bin");
> +MODULE_FIRMWARE("intel/vpu/vpu_37xx_v1.bin");
> +MODULE_FIRMWARE("intel/vpu/vpu_40xx_v1.bin");
> +MODULE_FIRMWARE("intel/vpu/vpu_50xx_v1.bin");
>  
>  static int ivpu_fw_request(struct ivpu_device *vdev)
>  {

