Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D9C1D2DC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 21:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214A610E832;
	Wed, 29 Oct 2025 20:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZXrvpF+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384C710E832
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761768932; x=1793304932;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tapUVCKPQsx0/C3v6Uie6D9E4sYHuTdAvewHRXhJGHg=;
 b=eZXrvpF+sh1MecXe3Cb58Ni81sRZpiIIoBmuJmv6vvP817sqwglGezZs
 oST1xSjuhMOrHobWEAn807z5GxgncQGM4aF2NkFITJDWDUTkBSA/+mXQP
 3pBkbWYYgsIUXvFf1kNYmLAYXe/28l3IfUnGM36aslHwlIUtif/81ZEaL
 6LH2vLKcFTyiGdmZDcpR+HNFWblrm2IIKiDiT7d9cM8yF5+Yo0O6y4VsR
 M/gG9KGcWO6+1VyWrN9Q9B92xE0Oo4fy47AHiHMeUg16XP8/IJYJ1B4uz
 K7H3egzg1EWaI6T4iKI58xQjlKn8ZXHYNgZ1FkYaTxSlgqJUeYs9ik1EG A==;
X-CSE-ConnectionGUID: vdHzDcDfR2WY0LS8JZpoIQ==
X-CSE-MsgGUID: xWdBmIuyQ1iSKlj36Yt6uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="63811774"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="63811774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:15:32 -0700
X-CSE-ConnectionGUID: mJCWfA3GRSW2wWG2aO33lw==
X-CSE-MsgGUID: 5rN5bmy2TNS5c3sjwuN/lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; d="scan'208";a="185640143"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.94.253.106])
 ([10.94.253.106])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 13:15:30 -0700
Message-ID: <4addc373-322f-4ccf-b0b1-b375c9c4936d@linux.intel.com>
Date: Wed, 29 Oct 2025 21:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Disallow setting sched mode HW starting from
 NPU6
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, maciej.falkowski@linux.intel.com, lizhi.hou@amd.com
References: <20251028070722.135236-1-karol.wachowski@linux.intel.com>
 <5fad073e-22fb-4de8-b990-aab43fa53417@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <5fad073e-22fb-4de8-b990-aab43fa53417@oss.qualcomm.com>
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

On 10/29/2025 8:52 PM, Jeff Hugo wrote:
> On 10/28/2025 1:07 AM, Karol Wachowski wrote:
>
> $SUBJECT suggests that HW mode is disallowed, but the commit text says
> OS mode is disallowed. Feels like the subject has a typo, or is
> confusing. Everything else looks ok to me. 
Yes, that definitely was unintended. I will send updated v2 in a moment.
>
>> OS scheduling mode gets deprecated starting from NPU6 onward.
>> Print warning and fallback to HW scheduling mode if OS mode is
>> explicitly selected with sched_mode parameter.
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_drv.c | 2 +-
>>   drivers/accel/ivpu/ivpu_fw.c  | 6 ++++++
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_drv.c
>> b/drivers/accel/ivpu/ivpu_drv.c
>> index ca68730dee88..b305effcf003 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.c
>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>> @@ -57,7 +57,7 @@ MODULE_PARM_DESC(pll_max_ratio, "Maximum PLL ratio
>> used to set NPU frequency");
>>     int ivpu_sched_mode = IVPU_SCHED_MODE_AUTO;
>>   module_param_named(sched_mode, ivpu_sched_mode, int, 0444);
>> -MODULE_PARM_DESC(sched_mode, "Scheduler mode: -1 - Use default
>> scheduler, 0 - Use OS scheduler, 1 - Use HW scheduler");
>> +MODULE_PARM_DESC(sched_mode, "Scheduler mode: -1 - Use default
>> scheduler, 0 - Use OS scheduler (supported on 27XX - 50XX), 1 - Use
>> HW scheduler");
>>     bool ivpu_disable_mmu_cont_pages;
>>   module_param_named(disable_mmu_cont_pages,
>> ivpu_disable_mmu_cont_pages, bool, 0444);
>> diff --git a/drivers/accel/ivpu/ivpu_fw.c b/drivers/accel/ivpu/ivpu_fw.c
>> index aa032b39dbe3..48386d2cddbb 100644
>> --- a/drivers/accel/ivpu/ivpu_fw.c
>> +++ b/drivers/accel/ivpu/ivpu_fw.c
>> @@ -144,6 +144,12 @@ bool ivpu_is_within_range(u64 addr, size_t size,
>> struct ivpu_addr_range *range)
>>   static u32
>>   ivpu_fw_sched_mode_select(struct ivpu_device *vdev, const struct
>> vpu_firmware_header *fw_hdr)
>>   {
>> +    if (ivpu_hw_ip_gen(vdev) >= IVPU_HW_IP_60XX &&
>> +        ivpu_sched_mode == VPU_SCHEDULING_MODE_OS) {
>> +        ivpu_warn(vdev, "OS sched mode is not supported, using HW
>> mode\n");
>> +        return VPU_SCHEDULING_MODE_HW;
>> +    }
>> +
>>       if (ivpu_sched_mode != IVPU_SCHED_MODE_AUTO)
>>           return ivpu_sched_mode;
>>   
>
