Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA399B83236
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 08:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1659510E2A5;
	Thu, 18 Sep 2025 06:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgtUeh9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C93210E2A5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758176863; x=1789712863;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EyuXDXdt+Wjay8Ps8Ke6c97SPq24AAkoMa7yl3mQIXw=;
 b=NgtUeh9WrphzZWUnW9fW4aPkMgKPcJnxJi9rOx/uFKm/vmhfZfkVHfFb
 F+LBdaOQtW1hr/YrZCeGBeXhC0uk8zkh8mdH82lVteGOMOgjfvkJFJDbM
 GgfuiCVT8ch0Ps48Q6xQ3Lb1jn0+c49LEHt69iXIWuQrFJxMQvGhVXewZ
 lRSA7K/PVnEElRt4bW2Kv9yNXHFRW3sW1+FWeDeKOE9kSQLmD3aAcVLE/
 +xaT9AaOJSPBtYlHB1hqLZcASXNeq9fyY38SuHJP22GEET/9UEnAVW23g
 ath5W/wsEFEjmz5Jt/FQpNbX4NbEd1j9ODLzkIuZMQPDcd0AEQ9xWK8cj w==;
X-CSE-ConnectionGUID: wwvXEP3IT6O3QB3ZPL+okg==
X-CSE-MsgGUID: 62/lDZDbR669XUT23DoilA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60384651"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="60384651"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 23:27:42 -0700
X-CSE-ConnectionGUID: VcZWmzv6QU+k22zO8CnWrA==
X-CSE-MsgGUID: BLIcJV6lQ9Cp18gncXF+oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="175027236"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.245.255.10])
 ([10.245.255.10])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 23:27:40 -0700
Message-ID: <1e9a03f7-092f-4ab9-b64d-d859913206d8@linux.intel.com>
Date: Thu, 18 Sep 2025 08:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Remove unused firmware boot parameters
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250915103553.830151-1-karol.wachowski@linux.intel.com>
 <53deb7b1-17eb-366e-3f8c-847a7a903032@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <53deb7b1-17eb-366e-3f8c-847a7a903032@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 9/15/2025 7:13 PM, Lizhi Hou wrote:
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
> On 9/15/25 03:35, Karol Wachowski wrote:
>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>
>> Remove references to firmware boot parameters that were never used
>> by any production version of device firmware.
>>
>> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_fw.c | 9 ---------
>>   1 file changed, 9 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
>> index 6e0941d324a8..32f513499829 100644
>> --- a/drivers/accel/ivpu/ivpu_fw.c
>> +++ b/drivers/accel/ivpu/ivpu_fw.c
>> @@ -518,11 +518,6 @@ static void ivpu_fw_boot_params_print(struct
>> ivpu_device *vdev, struct vpu_boot_
>>       ivpu_dbg(vdev, FW_BOOT,
>> "boot_params.cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg = 0x%x\n",
>>            boot_params->cache_defaults[VPU_BOOT_L2_CACHE_CFG_NN].cfg);
>>   -    ivpu_dbg(vdev, FW_BOOT,
>> "boot_params.global_memory_allocator_base = 0x%llx\n",
>> -         boot_params->global_memory_allocator_base);
>> -    ivpu_dbg(vdev, FW_BOOT,
>> "boot_params.global_memory_allocator_size = 0x%x\n",
>> -         boot_params->global_memory_allocator_size);
>> -
>>       ivpu_dbg(vdev, FW_BOOT, "boot_params.shave_nn_fw_base = 0x%llx\n",
>>            boot_params->shave_nn_fw_base);
>>   @@ -530,10 +525,6 @@ static void ivpu_fw_boot_params_print(struct
>> ivpu_device *vdev, struct vpu_boot_
>>            boot_params->watchdog_irq_mss);
>>       ivpu_dbg(vdev, FW_BOOT, "boot_params.watchdog_irq_nce = 0x%x\n",
>>            boot_params->watchdog_irq_nce);
>> -    ivpu_dbg(vdev, FW_BOOT, "boot_params.host_to_vpu_irq = 0x%x\n",
>> -         boot_params->host_to_vpu_irq);
>> -    ivpu_dbg(vdev, FW_BOOT, "boot_params.job_done_irq = 0x%x\n",
>> -         boot_params->job_done_irq);
>>         ivpu_dbg(vdev, FW_BOOT, "boot_params.host_version_id = 0x%x\n",
>>            boot_params->host_version_id);
