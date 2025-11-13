Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39337C58E12
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41A910E1CD;
	Thu, 13 Nov 2025 16:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SOqGOZSe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517E110E1CD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763052796; x=1794588796;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=J0LTneI1w5+0lzY1O12kiuLMwx/JWYrlOjCzi0DReoI=;
 b=SOqGOZSeclCObBp9CNB4iSzKywUAn2tm7BpS7m0baQ6FwF0lK55bj9e8
 jzUZRCNCcflkeQzRiE9nM+1KlRNm1hxXS+x2NZGw3TvAVJZJpUjH79A9q
 8PdOp8ZdGOjXNlHm6K8cSew382h0MVfw20DxJ1V+rQUJimpEaZ/lmSIYT
 0OxdjVJYylj+vHYAOFRr85YBjF+jODk7D9Xpoygq4ERD8fsB6zLFxHS/9
 KnXGerLJamGUvdR0sHwTkPHJnHixc+NAwhholWUm/eo/hRGQhK7HX5bZY
 IdQd3iA04ohZRVIYVltsr1/JXlW8Sw3ElB4tYete009U1ALmN19eI/dLL w==;
X-CSE-ConnectionGUID: dVemL4bQRoG6RzPpV0J2Jw==
X-CSE-MsgGUID: gWw3V9OESsiYYUsW0fhyLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69005318"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="69005318"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:53:16 -0800
X-CSE-ConnectionGUID: drIi4XjdTmmPsoCB7w559w==
X-CSE-MsgGUID: l4WSpUDzRcW1RZZ4B5vlsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="212945564"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.18.39])
 ([10.246.18.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:53:14 -0800
Message-ID: <56ceb509-496f-41c1-a864-6b2eb841c24b@linux.intel.com>
Date: Thu, 13 Nov 2025 17:53:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Treat power-off failure as unrecoverable
 error
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20251106180521.1095218-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251106180521.1095218-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 11/6/2025 7:05 PM, Lizhi Hou wrote:
> Failing to set power off indicates an unrecoverable hardware or firmware
> error. Update the driver to treat such a failure as a fatal condition
> and stop further operations that depend on successful power state
> transition.
>
> This prevents undefined behavior when the hardware remains in an
> unexpected state after a failed power-off attempt.
>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_smu.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index 11c0e9e7b03a..bd94ee96c2bc 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -147,6 +147,16 @@ int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
>   {
>   	int ret;
>   
> +	/*
> +	 * Failing to set power off indicates an unrecoverable hardware or
> +	 * firmware error.
> +	 */
> +	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_OFF, 0, NULL);
> +	if (ret) {
> +		XDNA_ERR(ndev->xdna, "Access power failed, ret %d", ret);
> +		return ret;
> +	}
> +
>   	ret = aie2_smu_exec(ndev, AIE2_SMU_POWER_ON, 0, NULL);
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Power on failed, ret %d", ret);
