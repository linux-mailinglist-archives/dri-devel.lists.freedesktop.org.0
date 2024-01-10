Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A85829CA8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 15:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9436510E04D;
	Wed, 10 Jan 2024 14:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5634C10E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 14:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704897195; x=1736433195;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=NpG06HC604bnDwEBrGWio7nBhpa8tUqNtasVIP1QdO0=;
 b=i23EjIvw6fapGY+aEPZT/B1v4VG3bC1wMxFzXpHU1YywCNjBhQ7ODMZq
 95t34nO9IbFCUB37ne8+/jrULRi1xKZn0EYCwHubX4mKAFDihBf5NeZyE
 dX08dcXOpPqxHnlh8ixDO11dQNVa2yONN2MBSLilcYvKgDts4ttFrNl9J
 bsCbJ3EpJCWVJMTdOEhQaU3wP0fKbuyru4fA2zky4nUMbLReLLi5xsG10
 CwzMdvrL7PXj2Hv3N2KgzTpQ217k2f7ftkla38EUO8H5qYd9hGVLv2w3V
 zTA/+IMSnly0gbZvtV96y13V+sI7M8Q1dDNljZuC5k2bWb63IjgPKU7XY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="20027498"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="20027498"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 06:33:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="955391798"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; d="scan'208";a="955391798"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.245.80.160])
 ([10.245.80.160])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2024 06:33:12 -0800
Message-ID: <67b0ba4b-bfd1-4cef-8215-2658ad8a8acb@linux.intel.com>
Date: Wed, 10 Jan 2024 15:33:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] accel/ivpu: Remove deprecated
 DRM_IVPU_PARAM_CONTEXT_PRIORITY
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
 <20240105112218.351265-11-jacek.lawrynowicz@linux.intel.com>
 <d95363cc-4dbd-7f72-7acb-c1f94caa0a7e@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <d95363cc-4dbd-7f72-7acb-c1f94caa0a7e@quicinc.com>
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
Cc: "Wachowski, Karol" <karol.wachowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05.01.2024 18:29, Jeffrey Hugo wrote:
> On 1/5/2024 4:22 AM, Jacek Lawrynowicz wrote:
>> From: "Wachowski, Karol" <karol.wachowski@intel.com>
>>
>> DRM_IVPU_PARAM_CONTEXT_PRIORITY has been deprecated because it
>> has been replaced with DRM_IVPU_JOB_PRIORITY levels set with
>> submit IOCTL and was unused anyway.
>>
>> Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/accel/ivpu/ivpu_drv.c | 11 -----------
>>   drivers/accel/ivpu/ivpu_drv.h |  1 -
>>   drivers/accel/ivpu/ivpu_job.c |  3 +++
>>   include/uapi/drm/ivpu_accel.h | 21 ++++++++++++++++++++-
>>   4 files changed, 23 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
>> index ec66c2c39877..546c0899bb9e 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.c
>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>> @@ -177,9 +177,6 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>>       case DRM_IVPU_PARAM_CONTEXT_BASE_ADDRESS:
>>           args->value = vdev->hw->ranges.user.start;
>>           break;
>> -    case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
>> -        args->value = file_priv->priority;
>> -        break;
>>       case DRM_IVPU_PARAM_CONTEXT_ID:
>>           args->value = file_priv->ctx.id;
>>           break;
>> @@ -219,17 +216,10 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>>     static int ivpu_set_param_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   {
>> -    struct ivpu_file_priv *file_priv = file->driver_priv;
>>       struct drm_ivpu_param *args = data;
>>       int ret = 0;
>>         switch (args->param) {
>> -    case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
>> -        if (args->value <= DRM_IVPU_CONTEXT_PRIORITY_REALTIME)
>> -            file_priv->priority = args->value;
>> -        else
>> -            ret = -EINVAL;
>> -        break;
>>       default:
>>           ret = -EINVAL;
>>       }
>> @@ -258,7 +248,6 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>>       }
>>         file_priv->vdev = vdev;
>> -    file_priv->priority = DRM_IVPU_CONTEXT_PRIORITY_NORMAL;
>>       kref_init(&file_priv->ref);
>>       mutex_init(&file_priv->lock);
>>   diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
>> index 9b6e336626e3..7a6bc1918780 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.h
>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>> @@ -146,7 +146,6 @@ struct ivpu_file_priv {
>>       struct mutex lock; /* Protects cmdq */
>>       struct ivpu_cmdq *cmdq[IVPU_NUM_ENGINES];
>>       struct ivpu_mmu_context ctx;
>> -    u32 priority;
>>       bool has_mmu_faults;
>>   };
>>   diff --git a/drivers/accel/ivpu/ivpu_job.c b/drivers/accel/ivpu/ivpu_job.c
>> index 7206cf9cdb4a..82e40bb4803c 100644
>> --- a/drivers/accel/ivpu/ivpu_job.c
>> +++ b/drivers/accel/ivpu/ivpu_job.c
>> @@ -488,6 +488,9 @@ int ivpu_submit_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>       if (params->engine > DRM_IVPU_ENGINE_COPY)
>>           return -EINVAL;
>>   +    if (params->priority > DRM_IVPU_JOB_PRIORITY_REALTIME)
>> +        return -EINVAL;
>> +
>>       if (params->buffer_count == 0 || params->buffer_count > JOB_MAX_BUFFER_COUNT)
>>           return -EINVAL;
>>   diff --git a/include/uapi/drm/ivpu_accel.h b/include/uapi/drm/ivpu_accel.h
>> index de1944e42c65..cc9a0504ee2f 100644
>> --- a/include/uapi/drm/ivpu_accel.h
>> +++ b/include/uapi/drm/ivpu_accel.h
>> @@ -13,7 +13,7 @@ extern "C" {
>>   #endif
>>     #define DRM_IVPU_DRIVER_MAJOR 1
>> -#define DRM_IVPU_DRIVER_MINOR 0
>> +#define DRM_IVPU_DRIVER_MINOR 1
> 
> I remember when this driver was going through initial review before acceptance, Oded mentioned that the DRM driver version mechanism was deprecated and to not use it.  Based on that, it seems like you should not be incrementing the minor number.

I wanted to use minor version in tests to verify the UAPI but this is not very important. I can leave this as is.

>>     #define DRM_IVPU_GET_PARAM          0x00
>>   #define DRM_IVPU_SET_PARAM          0x01
>> @@ -64,11 +64,18 @@ extern "C" {
>>     #define DRM_IVPU_PLATFORM_TYPE_SILICON        0
>>   +/* Deprecated - to be removed */
>>   #define DRM_IVPU_CONTEXT_PRIORITY_IDLE        0
>>   #define DRM_IVPU_CONTEXT_PRIORITY_NORMAL    1
>>   #define DRM_IVPU_CONTEXT_PRIORITY_FOCUS        2
>>   #define DRM_IVPU_CONTEXT_PRIORITY_REALTIME  3
> 
> $SUBJECT suggests these are being removed, not just deprecated.  Also, shouldn't DRM_IVPU_PARAM_CONTEXT_PRIORITY which is a few lines above this be deprecated/removed/something?

OK, I'll correct the subject and add "deprecated" comment to DRM_IVPU_PARAM_CONTEXT_PRIORITY.

>>   +#define DRM_IVPU_JOB_PRIORITY_DEFAULT  0
>> +#define DRM_IVPU_JOB_PRIORITY_IDLE     1
>> +#define DRM_IVPU_JOB_PRIORITY_NORMAL   2
>> +#define DRM_IVPU_JOB_PRIORITY_FOCUS    3
>> +#define DRM_IVPU_JOB_PRIORITY_REALTIME 4
>> +
>>   /**
>>    * DRM_IVPU_CAP_METRIC_STREAMER
>>    *
>> @@ -286,6 +293,18 @@ struct drm_ivpu_submit {
>>        * to be executed. The offset has to be 8-byte aligned.
>>        */
>>       __u32 commands_offset;
>> +
>> +    /**
>> +     * @priority:
>> +     *
>> +     * Priority to be set for related job command queue, can be one of the following:
>> +     * %DRM_IVPU_JOB_PRIORITY_DEFAULT
>> +     * %DRM_IVPU_JOB_PRIORITY_IDLE
>> +     * %DRM_IVPU_JOB_PRIORITY_NORMAL
>> +     * %DRM_IVPU_JOB_PRIORITY_FOCUS
>> +     * %DRM_IVPU_JOB_PRIORITY_REALTIME
>> +     */
>> +    __u32 priority;
> 
> I think this breaks the uapi (which makes me think you are using the driver minor version above to detect).  This struct is passed to DRM_IOW which uses the struct size to calculate the ioctl number.  By changing the size of this struct, you change the ioctl number, and make it so that old userspace (with the old number) cannot work with newer kernels.
> 
> I beleive last time I brought up a uapi breakage, I was told that your userspace han't been offically released yet.  Is that still the case?
> 
> Seems odd though, because you are incrementing the driver minor number above which makes me think you need to communicate this change to userspace, which seems to suggest you might have old userspace out in the wild...

The user-space part of the driver was already released but it have never used DRM_IVPU_PARAM_CONTEXT_PRIORITY.
I've tested the new kmd with old umd and ioctls work fine. drm_ioctl() handles the difference in user vs driver arg size.
I think it is perfectly safe to extend the ioctl arg. The ioctl number is passed directly to DRM_IOW(), I can't see where it would be calculated based on arg size.

Regards,
Jacek
