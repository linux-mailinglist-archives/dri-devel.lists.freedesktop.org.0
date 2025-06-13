Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E1AD852E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 10:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA3E10E8B6;
	Fri, 13 Jun 2025 08:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gp0DYJ7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10ED110E8B6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749801724; x=1781337724;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lGdmcR1u4VLmKmc5jy0Sy1tYwq0u7J632J3kaO6XwCY=;
 b=gp0DYJ7HJGnOR5FhhzzfMeKONxXOf97DJ6xRdwSFnv11HrikcUcfapU/
 qlAZozPnD6/Ylz+AM+NhsCQ4XcD6gFaryn/Tf5dG8+NuTcbX0yBJvpYzy
 gIbCG69o+wX3ylSXX13uJy5h1yfDHL9NUkm83gawflDbwf4jeIS+wRHtJ
 j4xPNK2jsya6trBg1IqNRoo6v4fesUP+pLq//uOxZfV+31yOgtVfIEoBt
 giWc2eLBWT+GB9aTNP7lF2ZIO1hXxR6M6yG3Tq3Zf9mELYmjKGT6uLXlR
 64KgesqXTymP0lgIqInH/JFVdjxJe3djzv4754WCFSmsUg1JGzQdp/2TO Q==;
X-CSE-ConnectionGUID: JUgVVjQhTK2JDtXllKoVbg==
X-CSE-MsgGUID: AVBUbA7jSQCVQM2G1lu68Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69454008"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="69454008"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 01:02:03 -0700
X-CSE-ConnectionGUID: LcprCvGxS+KIQwnCnbzjSA==
X-CSE-MsgGUID: bhDmvB6mSQO/D0BDWJv3Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; d="scan'208";a="148650164"
Received: from mellis1x-mobl.amr.corp.intel.com (HELO [10.245.252.206])
 ([10.245.252.206])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2025 01:01:59 -0700
Message-ID: <5e12681e-20ab-4f89-a28d-7c6234aa7fee@linux.intel.com>
Date: Fri, 13 Jun 2025 10:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Add turbo flag to the DRM_IVPU_CMDQ_CREATE
 ioctl
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, lizhi.hou@amd.com,
 Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20250605162001.1237789-1-maciej.falkowski@linux.intel.com>
 <3a3fc0d9-afb4-4a37-bbfd-944fe7721e0a@oss.qualcomm.com>
 <62bb72af-d633-442f-a598-ec632508f074@linux.intel.com>
 <fbc00bc7-19c0-413a-bfdc-625255c12c33@oss.qualcomm.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <fbc00bc7-19c0-413a-bfdc-625255c12c33@oss.qualcomm.com>
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

Hi,

On 6/12/2025 3:42 PM, Jeff Hugo wrote:
> On 6/12/2025 7:31 AM, Falkowski, Maciej wrote:
>> On 6/6/2025 6:30 PM, Jeff Hugo wrote:
>>
>>> On 6/5/2025 10:20 AM, Maciej Falkowski wrote:
>>>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>>>
>>>> Introduces a new parameter to the DRM_IVPU_CMDQ_CREATE ioctl,
>>>
>>> Introduce
>> Ack, thanks.
>>>
>>>> enabling turbo mode for jobs submitted via the command queue.
>>>> Turbo mode allows jobs to run at higher frequencies,
>>>> potentially improving performance for demanding workloads.
>>>>
>>>> The change also adds the IVPU_TEST_MODE_TURBO_DISABLE flag
>>>
>>> "This change" is redundant. Just start with "Also add the..."
>> Ack, thanks.
>>>
>>>> to allow test mode to explicitly disable turbo mode
>>>> requested by the application.
>>>> The IVPU_TEST_MODE_TURBO mode has been renamed to
>>>> IVPU_TEST_MODE_TURBO_ENABLE for clarity and consistency.
>>>>
>>>> +/* Command queue flags */
>>>> +#define DRM_IVPU_CMDQ_FLAG_TURBO 0x00000001
>>>> +
>>>>   /**
>>>>    * struct drm_ivpu_cmdq_create - Create command queue for job submission
>>>>    */
>>>> @@ -462,6 +465,17 @@ struct drm_ivpu_cmdq_create {
>>>>        * %DRM_IVPU_JOB_PRIORITY_REALTIME
>>>>        */
>>>>       __u32 priority;
>>>> +    /**
>>>> +     * @flags:
>>>> +     *
>>>> +     * Supported flags:
>>>> +     *
>>>> +     * %DRM_IVPU_CMDQ_FLAG_TURBO
>>>> +     *
>>>> +     * Enable low-latency mode for the command queue. The NPU will maximize performance
>>>> +     * when executing jobs from such queue at the cost of increased power usage.
>>>> +     */
>>>> +    __u32 flags;
>>>
>>> This is going to break the struct size on compat.  You probably need a __u32 reserved to maintain 64-bit alignment. 
>>
>> Thank you for suggestion,
>> I think compat is preserved here as u32 imposes 4 byte alignment on 64bit
>> so the alignment is going to be 12 bytes on both 32bit and 64bit, I tested this manually.
>> Please correct me if I am wrong.
> 
> Looks like I'm wrong.  Majority of the structures have 64-bit values, and I didn't clearly see that this specific one is only 32-bit values.
> 
> My initial comment was based on https://docs.kernel.org/process/botching-up-ioctls.html - specifically:
> 
> Pad the entire struct to a multiple of 64-bits if the structure contains 64-bit types - the structure size will otherwise differ on 32-bit versus 64-bit. Having a different structure size hurts when passing arrays of structures to the kernel, or if the kernel checks the structure size, which e.g. the drm core does.
> 
> Ok. This was the only functional comment, and it is resolved. The other two are trivial fixups, so I think with those -
> 
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Thanks for pointing this out anyway. It turns out we have alignment problems with couple other structures in UAPI.
We will send a separate fix for these.

Regards,
Jacek
