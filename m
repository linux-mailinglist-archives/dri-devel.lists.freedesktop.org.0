Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46D5AD71FE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 15:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B65510E3E4;
	Thu, 12 Jun 2025 13:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfshRyHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1925F10E3E4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749735088; x=1781271088;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qxfM6Qsom/P4T+Pwug00l9SUc+5/sf9U8ki/Rw9thqM=;
 b=BfshRyHit+MwL2LoSfZavP9MAIkT9Q8X2Ba+nvYI2/X/2kJjb7VV+9ww
 sq+rUm3XI34/oF22wCopnaG9DlUnVwPE0/cuX/HLji27KEuRQGYI5Jt7v
 HQHze/8LPhFFMzI2JBLkzgjAOvUWXJc13OAC34x20zf76DOxGdNk569+F
 z+o9dYaYrIoQxRz+S3++YboRmHz3z9zzme23TMKnm60FZyLcfCyCwRzqi
 H56TZRQmzkcQ0G3/nZQTJRcobKufRskJR1zq+xYSm/tkAcbOFHqqKObKa
 HjosQR/u0lopT4IfdXZlchuKJtzXAIK6a91cNp/kcpYMj0VuIpsadEwj/ g==;
X-CSE-ConnectionGUID: FSrPHH4jRPqltjS0q3ss4Q==
X-CSE-MsgGUID: kNGkSKD5QQiA+u9GvgRjYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62195612"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="62195612"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:31:27 -0700
X-CSE-ConnectionGUID: nvj6QM/4T02gWwvMqasdgg==
X-CSE-MsgGUID: yeL+oWnUTmiG1qq6miOlcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147425818"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 06:31:25 -0700
Message-ID: <62bb72af-d633-442f-a598-ec632508f074@linux.intel.com>
Date: Thu, 12 Jun 2025 15:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add turbo flag to the DRM_IVPU_CMDQ_CREATE
 ioctl
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jacek.lawrynowicz@linux.intel.com,
 lizhi.hou@amd.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250605162001.1237789-1-maciej.falkowski@linux.intel.com>
 <3a3fc0d9-afb4-4a37-bbfd-944fe7721e0a@oss.qualcomm.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <3a3fc0d9-afb4-4a37-bbfd-944fe7721e0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 6/6/2025 6:30 PM, Jeff Hugo wrote:

> On 6/5/2025 10:20 AM, Maciej Falkowski wrote:
>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>
>> Introduces a new parameter to the DRM_IVPU_CMDQ_CREATE ioctl,
>
> Introduce
Ack, thanks.
>
>> enabling turbo mode for jobs submitted via the command queue.
>> Turbo mode allows jobs to run at higher frequencies,
>> potentially improving performance for demanding workloads.
>>
>> The change also adds the IVPU_TEST_MODE_TURBO_DISABLE flag
>
> "This change" is redundant. Just start with "Also add the..."
Ack, thanks.
>
>> to allow test mode to explicitly disable turbo mode
>> requested by the application.
>> The IVPU_TEST_MODE_TURBO mode has been renamed to
>> IVPU_TEST_MODE_TURBO_ENABLE for clarity and consistency.
>>
>> +/* Command queue flags */
>> +#define DRM_IVPU_CMDQ_FLAG_TURBO 0x00000001
>> +
>>   /**
>>    * struct drm_ivpu_cmdq_create - Create command queue for job 
>> submission
>>    */
>> @@ -462,6 +465,17 @@ struct drm_ivpu_cmdq_create {
>>        * %DRM_IVPU_JOB_PRIORITY_REALTIME
>>        */
>>       __u32 priority;
>> +    /**
>> +     * @flags:
>> +     *
>> +     * Supported flags:
>> +     *
>> +     * %DRM_IVPU_CMDQ_FLAG_TURBO
>> +     *
>> +     * Enable low-latency mode for the command queue. The NPU will 
>> maximize performance
>> +     * when executing jobs from such queue at the cost of increased 
>> power usage.
>> +     */
>> +    __u32 flags;
>
> This is going to break the struct size on compat.  You probably need a 
> __u32 reserved to maintain 64-bit alignment. 

Thank you for suggestion,
I think compat is preserved here as u32 imposes 4 byte alignment on 64bit
so the alignment is going to be 12 bytes on both 32bit and 64bit, I 
tested this manually.
Please correct me if I am wrong.

Best regards,
Maciej
