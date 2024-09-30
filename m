Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC198A00D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 13:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032C910E3E6;
	Mon, 30 Sep 2024 11:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kIV2ux13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2642910E3E6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 11:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727694098; x=1759230098;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T7v0xp6t2xrN8J0/g/0Pxlz2lhL4REa8gYYFgUGcy6c=;
 b=kIV2ux137AfJdsRkF/UnDDjhx14ZtAYEV+2knTvU9BbXBhsHc6F4izoN
 OQ8qI66/0luenJdCkYXONLaaSL0lEAwy+KWweI+Gl7p5sBms82tDb3B64
 osSvuk+suDs203jsPRge9lOF/yuq9dGyPLkSU9RnACTKmYkqNumRjmLH9
 fMJODt9rR1F/bPHqiOPjcRPuxHT3MxuboIyp7BkYPXE9MDF+R5fJZxKO+
 nWjbuoe/3QlOPDg/ojE6KRz8Urvpac37WN7qRDQw8BIVRpCSltU7qAX54
 xh7oebPeQmz1OhuoTPpHbJEp2YOAPM4pbjYp9+HBbnkXfZX4BXxAqIWqG A==;
X-CSE-ConnectionGUID: xXCPPZrURgOSLA0HGVaPYQ==
X-CSE-MsgGUID: 6nXwDVBKTrWQsVNhpHT7AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26240743"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="26240743"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 04:01:38 -0700
X-CSE-ConnectionGUID: 1iMpsglVT/O+fDtGUT5iQg==
X-CSE-MsgGUID: BKgbntCNTqu7om9OJFglPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="78022401"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 04:01:36 -0700
Message-ID: <d6152b59-2566-4f3c-8d4b-a72e7cccfafc@linux.intel.com>
Date: Mon, 30 Sep 2024 13:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/29] accel/ivpu: Add test_mode bit to force turbo
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-18-jacek.lawrynowicz@linux.intel.com>
 <94b9a0e4-7cbb-31e0-7973-92242ee9a4d5@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <94b9a0e4-7cbb-31e0-7973-92242ee9a4d5@quicinc.com>
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

On 9/27/2024 11:25 PM, Jeffrey Hugo wrote:
> On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>
>> Add new test_mode BIT(9) that forces firmware to
>> enable turbo burst mode.
>>
>> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_drv.h | 1 +
>>   drivers/accel/ivpu/ivpu_job.c | 5 +++++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
>> index 9acef14deab57..151ab9f2ddc9b 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.h
>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>> @@ -197,6 +197,7 @@ extern bool ivpu_force_snoop;
>>   #define IVPU_TEST_MODE_PREEMPTION_DISABLE BIT(6)
>>   #define IVPU_TEST_MODE_HWS_EXTRA_EVENTS      BIT(7)
>>   #define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
>> +#define IVPU_TEST_MODE_TURBO          BIT(9)
>>   extern int ivpu_test_mode;
>>     struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
>> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>> index 8798fb2046abc..dc5cf7ded9439 100644
>> --- a/drivers/accel/ivpu/ivpu_job.c
>> +++ b/drivers/accel/ivpu/ivpu_job.c
>> @@ -202,6 +202,11 @@ ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 eng
>>       jobq_header->engine_idx = engine;
>>       jobq_header->head = 0;
>>       jobq_header->tail = 0;
>> +    if (ivpu_test_mode & IVPU_TEST_MODE_TURBO) {
>> +        ivpu_dbg(vdev, JOB, "Turbo mode enabled");
>> +        jobq_header->flags = VPU_JOB_QUEUE_FLAGS_TURBO_MODE;
> 
> I don't see VPU_JOB_QUEUE_FLAGS_TURBO_MODE defined.  What am I missing?
>

VPU_JOB_QUEUE_FLAGS_TURBO_MODE is defined in FW headers.
It was added to the FW years ago and now we've started using it in the Linux driver.

>> +    }
>> +
>>       wmb(); /* Flush WC buffer for jobq->header */
>>         if (vdev->fw->sched_mode == VPU_SCHEDULING_MODE_HW) {
> 

