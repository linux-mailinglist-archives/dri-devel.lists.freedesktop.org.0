Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB387AB31D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 15:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249DA10E192;
	Fri, 22 Sep 2023 13:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A857710E192;
 Fri, 22 Sep 2023 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695390806; x=1726926806;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fHzqMNg62b1G73PiXOrYN6KRfPM9WDVRb9/gxvCfRQY=;
 b=nzrKAKYN0UoFaApxTa6MoXwE6zTGskw5vnMevJ8n+NQDGCg9PZfw4XsP
 H3PC65EOkQymiUhHwq5k7ft6a62QfBFQeZJLWtA8jU2BiUyPcf/Du1Egl
 jzkQ1peEmP4SfIKIL+odp2MxJqCShNlr21cBYl8iP2U7TSO9XekefNA/C
 Ua/77Om9WSgMqjlucoTALZJgL94RqFAzukagMy6wJwgCxQy8hW/7I3gEr
 OcXBtFCUSG/Qc5Hslp3W9YqbuGyXa5l1WNEbgRG6Hg3G8rxDLpfNWFJ4e
 O610FuDHZ/8ZzH7Dkb0crFcBearEbVgy7mtKJSLc1S29Iw0N/nnL8sBPs A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="467127546"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="467127546"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078377321"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; d="scan'208";a="1078377321"
Received: from placki-mobl.ger.corp.intel.com (HELO [10.213.200.149])
 ([10.213.200.149])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 06:53:21 -0700
Message-ID: <68cbe1af-f485-41a4-111a-c695697ef26f@linux.intel.com>
Date: Fri, 22 Sep 2023 14:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 2/6] drm/panfrost: Add fdinfo support GPU load metrics
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
 <20230919233556.1458793-3-adrian.larumbe@collabora.com>
 <b23eb1dc-dd01-2086-f4e8-a5c3db389a14@linux.intel.com>
 <chpqiov6y5gbnx3cnmrxkijperhgjhtrrsk556jbumrihs3pxm@ahq3kuehj7xp>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <chpqiov6y5gbnx3cnmrxkijperhgjhtrrsk556jbumrihs3pxm@ahq3kuehj7xp>
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/09/2023 11:57, Adrián Larumbe wrote:
> On 20.09.2023 16:40, Tvrtko Ursulin wrote:
>> On 20/09/2023 00:34, Adrián Larumbe wrote:
>>> The drm-stats fdinfo tags made available to user space are drm-engine,
>>> drm-cycles, drm-max-freq and drm-curfreq, one per job slot.
>>>
>>> This deviates from standard practice in other DRM drivers, where a single
>>> set of key:value pairs is provided for the whole render engine. However,
>>> Panfrost has separate queues for fragment and vertex/tiler jobs, so a
>>> decision was made to calculate bus cycles and workload times separately.
>>>
>>> Maximum operating frequency is calculated at devfreq initialisation time.
>>> Current frequency is made available to user space because nvtop uses it
>>> when performing engine usage calculations.
>>>
>>> It is important to bear in mind that both GPU cycle and kernel time numbers
>>> provided are at best rough estimations, and always reported in excess from
>>> the actual figure because of two reasons:
>>>    - Excess time because of the delay between the end of a job processing,
>>>      the subsequent job IRQ and the actual time of the sample.
>>>    - Time spent in the engine queue waiting for the GPU to pick up the next
>>>      job.
>>>
>>> To avoid race conditions during enablement/disabling, a reference counting
>>> mechanism was introduced, and a job flag that tells us whether a given job
>>> increased the refcount. This is necessary, because user space can toggle
>>> cycle counting through a debugfs file, and a given job might have been in
>>> flight by the time cycle counting was disabled.
>>>
>>> The main goal of the debugfs cycle counter knob is letting tools like nvtop
>>> or IGT's gputop switch it at any time, to avoid power waste in case no
>>> engine usage measuring is necessary.
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>> ---
>>>    drivers/gpu/drm/panfrost/Makefile           |  2 +
>>>    drivers/gpu/drm/panfrost/panfrost_debugfs.c | 20 ++++++++
>>>    drivers/gpu/drm/panfrost/panfrost_debugfs.h | 13 +++++
>>>    drivers/gpu/drm/panfrost/panfrost_devfreq.c |  8 +++
>>>    drivers/gpu/drm/panfrost/panfrost_devfreq.h |  3 ++
>>>    drivers/gpu/drm/panfrost/panfrost_device.c  |  2 +
>>>    drivers/gpu/drm/panfrost/panfrost_device.h  | 13 +++++
>>>    drivers/gpu/drm/panfrost/panfrost_drv.c     | 57 ++++++++++++++++++++-
>>>    drivers/gpu/drm/panfrost/panfrost_gpu.c     | 41 +++++++++++++++
>>>    drivers/gpu/drm/panfrost/panfrost_gpu.h     |  4 ++
>>>    drivers/gpu/drm/panfrost/panfrost_job.c     | 24 +++++++++
>>>    drivers/gpu/drm/panfrost/panfrost_job.h     |  5 ++
>>>    12 files changed, 191 insertions(+), 1 deletion(-)
>>>    create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
>>>    create mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
>>> index 7da2b3f02ed9..2c01c1e7523e 100644
>>> --- a/drivers/gpu/drm/panfrost/Makefile
>>> +++ b/drivers/gpu/drm/panfrost/Makefile
>>> @@ -12,4 +12,6 @@ panfrost-y := \
>>>    	panfrost_perfcnt.o \
>>>    	panfrost_dump.o
>>> +panfrost-$(CONFIG_DEBUG_FS) += panfrost_debugfs.o
>>> +
>>>    obj-$(CONFIG_DRM_PANFROST) += panfrost.o
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.c b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
>>> new file mode 100644
>>> index 000000000000..cc14eccba206
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.c
>>> @@ -0,0 +1,20 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/* Copyright 2023 Collabora ltd. */
>>> +
>>> +#include <linux/debugfs.h>
>>> +#include <linux/platform_device.h>
>>> +#include <drm/drm_debugfs.h>
>>> +#include <drm/drm_file.h>
>>> +#include <drm/panfrost_drm.h>
>>> +
>>> +#include "panfrost_device.h"
>>> +#include "panfrost_gpu.h"
>>> +#include "panfrost_debugfs.h"
>>> +
>>> +void panfrost_debugfs_init(struct drm_minor *minor)
>>> +{
>>> +	struct drm_device *dev = minor->dev;
>>> +	struct panfrost_device *pfdev = platform_get_drvdata(to_platform_device(dev->dev));
>>> +
>>> +	debugfs_create_atomic_t("profile", 0600, minor->debugfs_root, &pfdev->profile_mode);
>>> +}
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_debugfs.h b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
>>> new file mode 100644
>>> index 000000000000..db1c158bcf2f
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_debugfs.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Copyright 2023 Collabora ltd.
>>> + */
>>> +
>>> +#ifndef PANFROST_DEBUGFS_H
>>> +#define PANFROST_DEBUGFS_H
>>> +
>>> +#ifdef CONFIG_DEBUG_FS
>>> +void panfrost_debugfs_init(struct drm_minor *minor);
>>> +#endif
>>> +
>>> +#endif  /* PANFROST_DEBUGFS_H */
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>>> index 58dfb15a8757..28caffc689e2 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
>>> @@ -58,6 +58,7 @@ static int panfrost_devfreq_get_dev_status(struct device *dev,
>>>    	spin_lock_irqsave(&pfdevfreq->lock, irqflags);
>>>    	panfrost_devfreq_update_utilization(pfdevfreq);
>>> +	pfdevfreq->current_frequency = status->current_frequency;
>>>    	status->total_time = ktime_to_ns(ktime_add(pfdevfreq->busy_time,
>>>    						   pfdevfreq->idle_time));
>>> @@ -117,6 +118,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>>>    	struct devfreq *devfreq;
>>>    	struct thermal_cooling_device *cooling;
>>>    	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
>>> +	unsigned long freq = ULONG_MAX;
>>>    	if (pfdev->comp->num_supplies > 1) {
>>>    		/*
>>> @@ -172,6 +174,12 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>>>    		return ret;
>>>    	}
>>> +	/* Find the fastest defined rate  */
>>> +	opp = dev_pm_opp_find_freq_floor(dev, &freq);
>>> +	if (IS_ERR(opp))
>>> +		return PTR_ERR(opp);
>>> +	pfdevfreq->fast_rate = freq;
>>> +
>>>    	dev_pm_opp_put(opp);
>>>    	/*
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
>>> index 1514c1f9d91c..48dbe185f206 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
>>> @@ -19,6 +19,9 @@ struct panfrost_devfreq {
>>>    	struct devfreq_simple_ondemand_data gov_data;
>>>    	bool opp_of_table_added;
>>> +	unsigned long current_frequency;
>>> +	unsigned long fast_rate;
>>> +
>>>    	ktime_t busy_time;
>>>    	ktime_t idle_time;
>>>    	ktime_t time_last_update;
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
>>> index fa1a086a862b..28f7046e1b1a 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>>> @@ -207,6 +207,8 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>>>    	spin_lock_init(&pfdev->as_lock);
>>> +	spin_lock_init(&pfdev->cycle_counter.lock);
>>> +
>>>    	err = panfrost_clk_init(pfdev);
>>>    	if (err) {
>>>    		dev_err(pfdev->dev, "clk init failed %d\n", err);
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>>> index b0126b9fbadc..1e85656dc2f7 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>>> @@ -107,6 +107,7 @@ struct panfrost_device {
>>>    	struct list_head scheduled_jobs;
>>>    	struct panfrost_perfcnt *perfcnt;
>>> +	atomic_t profile_mode;
>>>    	struct mutex sched_lock;
>>> @@ -121,6 +122,11 @@ struct panfrost_device {
>>>    	struct shrinker shrinker;
>>>    	struct panfrost_devfreq pfdevfreq;
>>> +
>>> +	struct {
>>> +		atomic_t use_count;
>>> +		spinlock_t lock;
>>> +	} cycle_counter;
>>>    };
>>>    struct panfrost_mmu {
>>> @@ -135,12 +141,19 @@ struct panfrost_mmu {
>>>    	struct list_head list;
>>>    };
>>> +struct panfrost_engine_usage {
>>> +	unsigned long long elapsed_ns[NUM_JOB_SLOTS];
>>> +	unsigned long long cycles[NUM_JOB_SLOTS];
>>> +};
>>> +
>>>    struct panfrost_file_priv {
>>>    	struct panfrost_device *pfdev;
>>>    	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
>>>    	struct panfrost_mmu *mmu;
>>> +
>>> +	struct panfrost_engine_usage engine_usage;
>>>    };
>>>    static inline struct panfrost_device *to_panfrost_device(struct drm_device *ddev)
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> index a2ab99698ca8..3c93a11deab1 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> @@ -20,6 +20,7 @@
>>>    #include "panfrost_job.h"
>>>    #include "panfrost_gpu.h"
>>>    #include "panfrost_perfcnt.h"
>>> +#include "panfrost_debugfs.h"
>>>    static bool unstable_ioctls;
>>>    module_param_unsafe(unstable_ioctls, bool, 0600);
>>> @@ -267,6 +268,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>>>    	job->requirements = args->requirements;
>>>    	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
>>>    	job->mmu = file_priv->mmu;
>>> +	job->engine_usage = &file_priv->engine_usage;
>>>    	slot = panfrost_job_get_slot(job);
>>> @@ -523,7 +525,55 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>>>    	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
>>>    };
>>> -DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
>>> +
>>> +static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
>>> +				     struct panfrost_file_priv *panfrost_priv,
>>> +				     struct drm_printer *p)
>>> +{
>>> +	int i;
>>> +
>>> +	/*
>>> +	 * IMPORTANT NOTE: drm-cycles and drm-engine measurements are not
>>> +	 * accurate, as they only provide a rough estimation of the number of
>>> +	 * GPU cycles and CPU time spent in a given context. This is due to two
>>> +	 * different factors:
>>> +	 * - Firstly, we must consider the time the CPU and then the kernel
>>> +	 *   takes to process the GPU interrupt, which means additional time and
>>> +	 *   GPU cycles will be added in excess to the real figure.
>>> +	 * - Secondly, the pipelining done by the Job Manager (2 job slots per
>>> +	 *   engine) implies there is no way to know exactly how much time each
>>> +	 *   job spent on the GPU.
>>> +	 */
>>> +
>>> +	static const char * const engine_names[] = {
>>> +		"fragment", "vertex-tiler", "compute-only"
>>> +	};
>>> +
>>> +	for (i = 0; i < NUM_JOB_SLOTS - 1; i++) {
>>
>> FWIW you could future proof this a bit by using "i < ARRAY_SIZE(engine_names)"
>> and avoid maybe silent out of bounds reads if someone updates NUM_JOB_SLOTS
>> and forgets about this loop. Or stick a warning of some sort.
>>
> NUM_JOB_SLOTS is actually the same as the number of engines in the device. I decided to follow
> this loop convention because that's what's being done across the driver when manipulating
> the engine queues, so I thought I'd stick to it for the sake of consistency. Bear in mind
> the loop doesn't pick up the compute-only engine because it's still not exposed to user space.
> 
> So NUM_JOB_SLOTS cannot change, unless a new engine were introduced, and then someone would
> have to update this array accordingly.

Exactly, and until they would, here we'd have a be silent out of bound 
memory access. Content of which even gets shared with userspace. ;)

>>> +		drm_printf(p, "drm-engine-%s:\t%llu ns\n",
>>> +			   engine_names[i], panfrost_priv->engine_usage.elapsed_ns[i]);
>>> +		drm_printf(p, "drm-cycles-%s:\t%llu\n",
>>> +			   engine_names[i], panfrost_priv->engine_usage.cycles[i]);
>>> +		drm_printf(p, "drm-maxfreq-%s:\t%lu Hz\n",
>>> +			   engine_names[i], pfdev->pfdevfreq.fast_rate);
>>> +		drm_printf(p, "drm-curfreq-%s:\t%lu Hz\n",
>>> +			   engine_names[i], pfdev->pfdevfreq.current_frequency);
>>
>> I envisaged a link to driver specific docs at the bottom of
>> drm-usage-stats.rst so it would be nice if drivers would be adding those
>> sections and describing their private keys, engine names etc. ;)
>>
> Currently there's no panfrost.rst file under Documentation/gpu. I guess I'll create a new
> one and add the engine descriptions and meaning of drm-curfreq key.

Yeah I have to do the same for i915 in my memory stats series. :)

Regards,

Tvrtko
