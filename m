Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F8392E2D7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 10:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F27910E9A1;
	Thu, 11 Jul 2024 08:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Qu4eOd0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF8410E9A1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 08:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OXitQpNMG1POGcbL2X2uEZUFGOeoLt0xxw6f6PMPsLw=; b=Qu4eOd0dW/HHrJrL4xorvTQKAO
 5I6A9fRraADMMsL5wp++60zarUsDWQ2UFceathk5kHKRqOY3CR+WyE3JXjRfM/00iJQS3tiW7XPD9
 m/7TErc46yZg0zKe9ospb0fdDR6906qRNsKYK3h0W76vHNH8QXf9GrFU0a9QnRklxT5pSB9WDaaY4
 ZNObDtFOHJ6obKAFnv0fvKFcUzy4EJcHsUlKB4Srg8qLZCkTfnwVQwjgfrgM8+uWDeSP+NJNstlK7
 ZOmglI7OfMYnYFtJAx3rz3NOHafDQQ3RB5fWIM2rH+Ai0UsAzt35LALMBpwa2oXruKLg4t4xk8Cex
 ob0oRxKg==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRpca-00DbvE-2j; Thu, 11 Jul 2024 10:57:48 +0200
Message-ID: <53571f4d-c9fc-4628-9d18-99cb3071daef@igalia.com>
Date: Thu, 11 Jul 2024 09:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] drm/v3d: Move perfmon init completely into own unit
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-10-tursulin@igalia.com>
 <8c989edc-5e37-4c6b-aea3-219658d1d88f@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <8c989edc-5e37-4c6b-aea3-219658d1d88f@igalia.com>
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


On 10/07/2024 18:38, Maíra Canal wrote:
> On 7/10/24 10:41, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Now that the build time dependencies on various array sizes have been
>> removed, we can move the perfmon init completely into its own compilation
>> unit and remove the hardcoded defines.
>>
>> This improves on the temporary fix quickly delivered in
>> 792d16b5375d ("drm/v3d: Move perfmon init completely into own unit").
> 
> I believe you mean:
> 
> 9c3951ec27b9 ("drm/v3d: Fix perfmon build error/warning")
> 
> Currently, it is reference the current patch.

Well that was a hillarious mistake, well spotted!

Regards,

Tvrtko

> Apart from this fix, this is
> 
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> 
> Best Regards,
> - Maíra
> 
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> References: 792d16b5375d ("drm/v3d: Move perfmon init completely into 
>> own unit")
>> ---
>>   drivers/gpu/drm/v3d/v3d_drv.c                 |  9 +---
>>   drivers/gpu/drm/v3d/v3d_drv.h                 |  6 +--
>>   drivers/gpu/drm/v3d/v3d_perfmon.c             | 44 +++++++++++--------
>>   .../gpu/drm/v3d/v3d_performance_counters.h    | 16 ++++---
>>   4 files changed, 40 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c 
>> b/drivers/gpu/drm/v3d/v3d_drv.c
>> index a47f00b443d3..491c638a4d74 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.c
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
>> @@ -95,7 +95,7 @@ static int v3d_get_param_ioctl(struct drm_device 
>> *dev, void *data,
>>           args->value = 1;
>>           return 0;
>>       case DRM_V3D_PARAM_MAX_PERF_COUNTERS:
>> -        args->value = v3d->max_counters;
>> +        args->value = v3d->perfmon_info.max_counters;
>>           return 0;
>>       default:
>>           DRM_DEBUG("Unknown parameter %d\n", args->param);
>> @@ -298,12 +298,7 @@ static int v3d_platform_drm_probe(struct 
>> platform_device *pdev)
>>       v3d->cores = V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_NCORES);
>>       WARN_ON(v3d->cores > 1); /* multicore not yet implemented */
>> -    if (v3d->ver >= 71)
>> -        v3d->max_counters = V3D_V71_NUM_PERFCOUNTERS;
>> -    else if (v3d->ver >= 42)
>> -        v3d->max_counters = V3D_V42_NUM_PERFCOUNTERS;
>> -    else
>> -        v3d->max_counters = 0;
>> +    v3d_perfmon_init(v3d);
>>       v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
>>       if (IS_ERR(v3d->reset)) {
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h 
>> b/drivers/gpu/drm/v3d/v3d_drv.h
>> index 00fe5d993175..6d2d34cd135c 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>> @@ -104,10 +104,7 @@ struct v3d_dev {
>>       int ver;
>>       bool single_irq_line;
>> -    /* Different revisions of V3D have different total number of 
>> performance
>> -     * counters
>> -     */
>> -    unsigned int max_counters;
>> +    struct v3d_perfmon_info perfmon_info;
>>       void __iomem *hub_regs;
>>       void __iomem *core_regs[3];
>> @@ -568,6 +565,7 @@ int v3d_sched_init(struct v3d_dev *v3d);
>>   void v3d_sched_fini(struct v3d_dev *v3d);
>>   /* v3d_perfmon.c */
>> +void v3d_perfmon_init(struct v3d_dev *v3d);
>>   void v3d_perfmon_get(struct v3d_perfmon *perfmon);
>>   void v3d_perfmon_put(struct v3d_perfmon *perfmon);
>>   void v3d_perfmon_start(struct v3d_dev *v3d, struct v3d_perfmon 
>> *perfmon);
>> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c 
>> b/drivers/gpu/drm/v3d/v3d_perfmon.c
>> index b7d0b02e1a95..cd7f1eedf17f 100644
>> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
>> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
>> @@ -195,6 +195,23 @@ static const struct v3d_perf_counter_desc 
>> v3d_v71_performance_counters[] = {
>>       {"QPU", "QPU-stalls-other", "[QPU] Stalled qcycles waiting for 
>> any other reason (vary/W/Z)"},
>>   };
>> +void v3d_perfmon_init(struct v3d_dev *v3d)
>> +{
>> +    const struct v3d_perf_counter_desc *counters = NULL;
>> +    unsigned int max = 0;
>> +
>> +    if (v3d->ver >= 71) {
>> +        counters = v3d_v71_performance_counters;
>> +        max = ARRAY_SIZE(v3d_v71_performance_counters);
>> +    } else if (v3d->ver >= 42) {
>> +        counters = v3d_v42_performance_counters;
>> +        max = ARRAY_SIZE(v3d_v42_performance_counters);
>> +    }
>> +
>> +    v3d->perfmon_info.max_counters = max;
>> +    v3d->perfmon_info.counters = counters;
>> +}
>> +
>>   void v3d_perfmon_get(struct v3d_perfmon *perfmon)
>>   {
>>       if (perfmon)
>> @@ -321,7 +338,7 @@ int v3d_perfmon_create_ioctl(struct drm_device 
>> *dev, void *data,
>>       /* Make sure all counters are valid. */
>>       for (i = 0; i < req->ncounters; i++) {
>> -        if (req->counters[i] >= v3d->max_counters)
>> +        if (req->counters[i] >= v3d->perfmon_info.max_counters)
>>               return -EINVAL;
>>       }
>> @@ -416,26 +433,15 @@ int v3d_perfmon_get_counter_ioctl(struct 
>> drm_device *dev, void *data,
>>               return -EINVAL;
>>       }
>> -    /* Make sure that the counter ID is valid */
>> -    if (req->counter >= v3d->max_counters)
>> -        return -EINVAL;
>> -
>> -    BUILD_BUG_ON(ARRAY_SIZE(v3d_v42_performance_counters) !=
>> -             V3D_V42_NUM_PERFCOUNTERS);
>> -    BUILD_BUG_ON(ARRAY_SIZE(v3d_v71_performance_counters) !=
>> -             V3D_V71_NUM_PERFCOUNTERS);
>> -    BUILD_BUG_ON(V3D_MAX_COUNTERS < V3D_V42_NUM_PERFCOUNTERS);
>> -    BUILD_BUG_ON(V3D_MAX_COUNTERS < V3D_V71_NUM_PERFCOUNTERS);
>> -    BUILD_BUG_ON((V3D_MAX_COUNTERS != V3D_V42_NUM_PERFCOUNTERS) &&
>> -             (V3D_MAX_COUNTERS != V3D_V71_NUM_PERFCOUNTERS));
>> -
>> -    if (v3d->ver >= 71)
>> -        counter = &v3d_v71_performance_counters[req->counter];
>> -    else if (v3d->ver >= 42)
>> -        counter = &v3d_v42_performance_counters[req->counter];
>> -    else
>> +    if (!v3d->perfmon_info.max_counters)
>>           return -EOPNOTSUPP;
>> +    /* Make sure that the counter ID is valid */
>> +    if (req->counter >= v3d->perfmon_info.max_counters)
>> +        return -EINVAL;
>> +
>> +    counter = &v3d->perfmon_info.counters[req->counter];
>> +
>>       strscpy(req->name, counter->name, sizeof(req->name));
>>       strscpy(req->category, counter->category, sizeof(req->category));
>>       strscpy(req->description, counter->description, 
>> sizeof(req->description));
>> diff --git a/drivers/gpu/drm/v3d/v3d_performance_counters.h 
>> b/drivers/gpu/drm/v3d/v3d_performance_counters.h
>> index 131b2909522a..d919a2fc9449 100644
>> --- a/drivers/gpu/drm/v3d/v3d_performance_counters.h
>> +++ b/drivers/gpu/drm/v3d/v3d_performance_counters.h
>> @@ -19,11 +19,17 @@ struct v3d_perf_counter_desc {
>>       char description[256];
>>   };
>> +struct v3d_perfmon_info {
>> +    /*
>> +     * Different revisions of V3D have different total number of
>> +     * performance counters.
>> +     */
>> +    unsigned int max_counters;
>> -#define V3D_V42_NUM_PERFCOUNTERS (87)
>> -#define V3D_V71_NUM_PERFCOUNTERS (93)
>> -
>> -/* Maximum number of performance counters supported by any version of 
>> V3D */
>> -#define V3D_MAX_COUNTERS (93)
>> +    /*
>> +     * Array of counters valid for the platform.
>> +     */
>> +    const struct v3d_perf_counter_desc *counters;
>> +};
>>   #endif
