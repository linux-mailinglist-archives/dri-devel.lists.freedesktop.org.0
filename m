Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238B698A3D5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 15:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9505D10E446;
	Mon, 30 Sep 2024 13:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBnvcBVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE19010E446
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 13:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727701240; x=1759237240;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=t76PaJFzTAbaG+8R6VOvFMZ2axO2ZqIzVFceXX/x2qM=;
 b=XBnvcBVO3OVTj3BZRskpn0z2deTcI9RvoQ8EV3Rm3x0AtkaSGZsTwRa5
 B0sINpYi/AjVQa7mi2tycVxqbFoQz3sNs5AMxodFLGG4h6vJPZ8QQ6DE9
 u2+gnUonXkYpNjxlEKAm3fWnRD850G1bqTee0HF0C3egLqHcVlpm2j48Y
 iut98xtcu8QZdtuvKwykmap+731fNGIfuaMH+gDYLG2b01g8jXzM5arHx
 P5mGzONJFgQlKg+Xp6OSjEB2SyEPR+i82XFGdPTpZRh3eIz/M2OzTJKNL
 9mNYyuWxMFaxXowjqRHcfyvr/T+9o+VXPIVUkNvJLIQCIxA5njqOlk43W w==;
X-CSE-ConnectionGUID: iiT5K2WATjCCvFeltdCU7A==
X-CSE-MsgGUID: rgY3Pgp5RNGbQjki4emR7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="38173002"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="38173002"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:00:40 -0700
X-CSE-ConnectionGUID: a3eBT2UJTe+Qa8n+gQhrNQ==
X-CSE-MsgGUID: rfAJ9YeBTX+tXpCUUGfbig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="110768799"
Received: from jpdavis-mobl1.ger.corp.intel.com (HELO [10.246.18.68])
 ([10.246.18.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 06:00:39 -0700
Message-ID: <4447e231-a838-450e-affc-4ee97d3fe500@linux.intel.com>
Date: Mon, 30 Sep 2024 15:00:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/29] accel/ivpu: Add test_mode bit to force turbo
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
References: <20240924081754.209728-1-jacek.lawrynowicz@linux.intel.com>
 <20240924081754.209728-18-jacek.lawrynowicz@linux.intel.com>
 <94b9a0e4-7cbb-31e0-7973-92242ee9a4d5@quicinc.com>
 <d6152b59-2566-4f3c-8d4b-a72e7cccfafc@linux.intel.com>
Content-Language: en-US
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <d6152b59-2566-4f3c-8d4b-a72e7cccfafc@linux.intel.com>
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



On 9/30/2024 1:01 PM, Jacek Lawrynowicz wrote:
> On 9/27/2024 11:25 PM, Jeffrey Hugo wrote:
>> On 9/24/2024 2:17 AM, Jacek Lawrynowicz wrote:
>>> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>>
>>> Add new test_mode BIT(9) that forces firmware to
>>> enable turbo burst mode.
>>>
>>> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
>>> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>   drivers/accel/ivpu/ivpu_drv.h | 1 +
>>>   drivers/accel/ivpu/ivpu_job.c | 5 +++++
>>>   2 files changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
>>> index 9acef14deab57..151ab9f2ddc9b 100644
>>> --- a/drivers/accel/ivpu/ivpu_drv.h
>>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>>> @@ -197,6 +197,7 @@ extern bool ivpu_force_snoop;
>>>   #define IVPU_TEST_MODE_PREEMPTION_DISABLE BIT(6)
>>>   #define IVPU_TEST_MODE_HWS_EXTRA_EVENTS      BIT(7)
>>>   #define IVPU_TEST_MODE_DISABLE_TIMEOUTS   BIT(8)
>>> +#define IVPU_TEST_MODE_TURBO          BIT(9)
>>>   extern int ivpu_test_mode;
>>>     struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
>>> diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>>> index 8798fb2046abc..dc5cf7ded9439 100644
>>> --- a/drivers/accel/ivpu/ivpu_job.c
>>> +++ b/drivers/accel/ivpu/ivpu_job.c
>>> @@ -202,6 +202,11 @@ ivpu_cmdq_init(struct ivpu_file_priv *file_priv, struct ivpu_cmdq *cmdq, u16 eng
>>>       jobq_header->engine_idx = engine;
>>>       jobq_header->head = 0;
>>>       jobq_header->tail = 0;
>>> +    if (ivpu_test_mode & IVPU_TEST_MODE_TURBO) {
>>> +        ivpu_dbg(vdev, JOB, "Turbo mode enabled");
>>> +        jobq_header->flags = VPU_JOB_QUEUE_FLAGS_TURBO_MODE;
>>
>> I don't see VPU_JOB_QUEUE_FLAGS_TURBO_MODE defined.  What am I missing?
>>
> 
> VPU_JOB_QUEUE_FLAGS_TURBO_MODE is defined in FW headers.
> It was added to the FW years ago and now we've started using it in the Linux driver.

Sorry, I meant months, not years :)

