Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32650BB2901
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7509610E04B;
	Thu,  2 Oct 2025 05:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h/NGyLj1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F80710E04B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 05:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759384258; x=1790920258;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lOGX2tpeoGAfvPm6uhg9zcsQYNyF+/ENETT1ugfUJS0=;
 b=h/NGyLj1qFUmzjpW58LQxBBPKdRO/LSKns54mE7BSq7tLs0zNWkjJ3Vx
 EyVCOx57cjUSD0QKTrHVpg1zDlf7p+vNGDDWu7+6ae3r1qV1/r7Ku46oi
 gaSo3PPrwPhCsJmeYnteO+tLWcctusBaKHhJ74ngf9oHQEVSAuVvDl7hZ
 7RlmoExT3zEaMseVsWlmOcLoPAwG0JLv9mx0CohDsdx9A51trTnoa+IYH
 4Kh6fUvTqstzSoLy3ZDQNFNUAUzY7UHs3gqkGm5ZIeqfZYPc+H/Pa2u96
 xbrUdOVk1Z0FWRl0+/AapsO4i1CFwfZHT+3BiQQDarZIV5hCIgvhxPHiX A==;
X-CSE-ConnectionGUID: pWtYwJ/YQNWF/dfTsE4Nbg==
X-CSE-MsgGUID: FwoQCDw9Qzy5xRjyA34CcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61713224"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="61713224"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:50:58 -0700
X-CSE-ConnectionGUID: 5KeT2/fYS7uukrXedrmaLg==
X-CSE-MsgGUID: z8NlB+jBTX6djdXF260VKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="202704930"
Received: from kwachows-mobl.ger.corp.intel.com (HELO [10.245.124.106])
 ([10.245.124.106])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 22:50:56 -0700
Message-ID: <d9d4caa6-1df7-4a5e-ae27-321f3e0d3e31@linux.intel.com>
Date: Thu, 2 Oct 2025 07:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu: Fix DCT active percent format
To: Lizhi Hou <lizhi.hou@amd.com>, dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, jeff.hugo@oss.qualcomm.com,
 maciej.falkowski@linux.intel.com
References: <20251001104322.1249896-1-karol.wachowski@linux.intel.com>
 <989ad1ef-0719-ff91-c548-6b4435404954@amd.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <989ad1ef-0719-ff91-c548-6b4435404954@amd.com>
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

On 10/1/2025 6:40 PM, Lizhi Hou wrote:
> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
> On 10/1/25 03:43, Karol Wachowski wrote:
>> The pcode MAILBOX STATUS register PARAM2 field expects DCT active
>> percent in U1.7 value format. Convert percentage value to this
>> format before writing to the register.
>>
>> Fixes: a19bffb10c46 ("accel/ivpu: Implement DCT handling")
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_hw_btrs.c | 2 +-
>>   drivers/accel/ivpu/ivpu_hw_btrs.h | 2 +-
>>   drivers/accel/ivpu/ivpu_pm.c      | 9 +++++++--
>>   3 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.c
>> b/drivers/accel/ivpu/ivpu_hw_btrs.c
>> index afdb3b2aa72a..aa33f562d29c 100644
>> --- a/drivers/accel/ivpu/ivpu_hw_btrs.c
>> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.c
>> @@ -752,7 +752,7 @@ int ivpu_hw_btrs_dct_get_request(struct
>> ivpu_device *vdev, bool *enable)
>>       }
>>   }
>>   -void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool
>> enable, u32 active_percent)
>> +void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool
>> enable, u8 active_percent)
>>   {
>>       u32 val = 0;
>>       u32 cmd = enable ? DCT_ENABLE : DCT_DISABLE;
>> diff --git a/drivers/accel/ivpu/ivpu_hw_btrs.h
>> b/drivers/accel/ivpu/ivpu_hw_btrs.h
>> index 032c384ac3d4..c4c10e22f30f 100644
>> --- a/drivers/accel/ivpu/ivpu_hw_btrs.h
>> +++ b/drivers/accel/ivpu/ivpu_hw_btrs.h
>> @@ -36,7 +36,7 @@ u32 ivpu_hw_btrs_dpu_freq_get(struct ivpu_device
>> *vdev);
>>   bool ivpu_hw_btrs_irq_handler_mtl(struct ivpu_device *vdev, int irq);
>>   bool ivpu_hw_btrs_irq_handler_lnl(struct ivpu_device *vdev, int irq);
>>   int ivpu_hw_btrs_dct_get_request(struct ivpu_device *vdev, bool
>> *enable);
>> -void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool
>> enable, u32 active_percent);
>> +void ivpu_hw_btrs_dct_set_status(struct ivpu_device *vdev, bool
>> enable, u8 active_percent);
>>   u32 ivpu_hw_btrs_telemetry_offset_get(struct ivpu_device *vdev);
>>   u32 ivpu_hw_btrs_telemetry_size_get(struct ivpu_device *vdev);
>>   u32 ivpu_hw_btrs_telemetry_enable_get(struct ivpu_device *vdev);
>> diff --git a/drivers/accel/ivpu/ivpu_pm.c b/drivers/accel/ivpu/ivpu_pm.c
>> index 7514f580eef4..63c95307faa1 100644
>> --- a/drivers/accel/ivpu/ivpu_pm.c
>> +++ b/drivers/accel/ivpu/ivpu_pm.c
>> @@ -502,6 +502,11 @@ void ivpu_pm_irq_dct_work_fn(struct work_struct
>> *work)
>>       else
>>           ret = ivpu_pm_dct_disable(vdev);
>>   -    if (!ret)
>> -        ivpu_hw_btrs_dct_set_status(vdev, enable,
>> vdev->pm->dct_active_percent);
>> +    if (!ret) {
>> +        /* Convert percent to U1.7 format */
>> +        u8 val = DIV_ROUND_CLOSEST(vdev->pm->dct_active_percent *
>> 128, 100);
>> +
>> +        ivpu_hw_btrs_dct_set_status(vdev, enable, val);
>> +    }
>> +
>>   }
