Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B036E0E07
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 15:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1FD10EAD6;
	Thu, 13 Apr 2023 13:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3DE10EAF2;
 Thu, 13 Apr 2023 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681391218; x=1712927218;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=LoGE80xffzbicXBgrWxTE0wJdR6NHDZ2ZOFGY3Zi3Uo=;
 b=eJHXRKqYsdiEjTakMrPxuBTzjmI96XY7kSWOIpU62IPvKoItAfuxdKGo
 IWsHhbcTLP8KAko/ZRC26TJXEwLdLazoFfKpQn3jOz4Q4KQAoQsbdp6Zz
 3Z5w3QIc8U/M2mZh/8nnv3WptZ/wwNI/lupJDMnwnavy3bJSVYtgHFulF
 0AsEYBXNsZZLW7KS4NyzbEL9dZTzXgAwIZ+qGWsZa5FkYIRQOFS8Ge/04
 ITiuwC3kaPMJ/vnYe2KGXPNPJkNtnfmIGSOIUuRcmEkpnIN581NczbIpU
 jUy2wB9JHwQWUvdLTTQx/i+0aHTuHcq20ixLf7Qg5kBeKvDmSIg+dOKeN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="409331744"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="409331744"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 06:04:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="719819771"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="719819771"
Received: from mmcgar2x-mobl1.ger.corp.intel.com (HELO [10.213.231.135])
 ([10.213.231.135])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 06:03:56 -0700
Message-ID: <137052df-3551-86a0-c7d0-42935ebd5ac6@linux.intel.com>
Date: Thu, 13 Apr 2023 14:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/6] drm: Add common fdinfo helper
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230412224311.23511-1-robdclark@gmail.com>
 <20230412224311.23511-2-robdclark@gmail.com>
 <ce87917c-6cf1-b1e7-4782-61a7e47aa92d@amd.com>
 <ZDfBZIuiAuMhuULd@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZDfBZIuiAuMhuULd@phenom.ffwll.local>
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


On 13/04/2023 09:46, Daniel Vetter wrote:
> On Thu, Apr 13, 2023 at 10:07:11AM +0200, Christian König wrote:
>> Am 13.04.23 um 00:42 schrieb Rob Clark:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Handle a bit of the boiler-plate in a single case, and make it easier to
>>> add some core tracked stats.
>>>
>>> v2: Update drm-usage-stats.rst, 64b client-id, rename drm_show_fdinfo
>>>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> ---
>>>    Documentation/gpu/drm-usage-stats.rst | 10 +++++++-
>>>    drivers/gpu/drm/drm_file.c            | 35 +++++++++++++++++++++++++++
>>>    include/drm/drm_drv.h                 |  7 ++++++
>>>    include/drm/drm_file.h                |  4 +++
>>>    4 files changed, 55 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>> index b46327356e80..2ab32c40e93c 100644
>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>> @@ -126,7 +126,15 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
>>>    time active without considering what frequency the engine is operating as a
>>>    percentage of it's maximum frequency.
>>> +Implementation Details
>>> +======================
>>> +
>>> +Drivers should use drm_show_fdinfo() in their `struct file_operations`, and
>>> +implement &drm_driver.show_fdinfo if they wish to provide any stats which
>>> +are not provided by drm_show_fdinfo().  But even driver specific stats should
>>> +be documented above and where possible, aligned with other drivers.
>>
>> I'm really wondering if it wouldn't be less mid-layering if we let the
>> drivers call the drm function to print the common values instead of the
>> other way around?
> 
> The idea is that we plug this into DRM_GEM_FOPS and then everyone gets it
> by default. So it's a bit a tradeoff between midlayering and having
> inconsistent uapi between drivers. And there's generic tools that parse
> this, so consistency across drivers is good.
> 
> My gut feeling was that after a bit of experimenting with lots of
> different drivers for fdinfo stuff it's time to push for a bit more
> standardization and less fragmentation.
> 
> We can of course later on course-correct and shuffle things around again,
> e.g. by pushing more things into the gem_bo_fops->status hook (ttm and
> other memory manager libs could implement a decent one by default), or
> moving more into the drm_driver->show_fdinfo callback again.
> 
> If you look at kms we also shuffle things back&forth between core (for
> more consistency) and drivers (for more flexibility where needed).
> 
> The important part here imo is that we start with some scaffolding to be
> able to do this. Like another thing that I think we want is some
> drm_fdinfo_print functions that make sure the formatting is guaranteed
> consistents and we don't trip up parsers (like some drivers use " \t" as
> separator instead of just "\t", I guess by accident).

On this particular part I'd say it's even better to keep userspace on 
their toes and not let them hardcode assumption about how much and what 
whitespace characters to expect.

Otherwise I agree that mid-layer or not can be changed later, as long as 
my opens from elsewhere in the thread are closed before merging.

Regards,

Tvrtko

>> Apart from thatquestion the patch looks good to me.
> 
> Ack? Or want the above recorded in the commit message, I think it'd make
> sense to put it there.
> -Daniel
> 
>>
>> Christian.
>>
>>> +
>>>    Driver specific implementations
>>> -===============================
>>> +-------------------------------
>>>    :ref:`i915-usage-stats`
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index a51ff8cee049..6d5bdd684ae2 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -148,6 +148,7 @@ bool drm_dev_needs_global_mutex(struct drm_device *dev)
>>>     */
>>>    struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>    {
>>> +	static atomic64_t ident = ATOMIC_INIT(0);
>>>    	struct drm_device *dev = minor->dev;
>>>    	struct drm_file *file;
>>>    	int ret;
>>> @@ -156,6 +157,8 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>    	if (!file)
>>>    		return ERR_PTR(-ENOMEM);
>>> +	/* Get a unique identifier for fdinfo: */
>>> +	file->client_id = atomic64_inc_return(&ident);
>>>    	file->pid = get_pid(task_pid(current));
>>>    	file->minor = minor;
>>> @@ -868,6 +871,38 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>>>    }
>>>    EXPORT_SYMBOL(drm_send_event);
>>> +/**
>>> + * drm_show_fdinfo - helper for drm file fops
>>> + * @seq_file: output stream
>>> + * @f: the device file instance
>>> + *
>>> + * Helper to implement fdinfo, for userspace to query usage stats, etc, of a
>>> + * process using the GPU.  See also &drm_driver.show_fdinfo.
>>> + *
>>> + * For text output format description please see Documentation/gpu/drm-usage-stats.rst
>>> + */
>>> +void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>> +{
>>> +	struct drm_file *file = f->private_data;
>>> +	struct drm_device *dev = file->minor->dev;
>>> +	struct drm_printer p = drm_seq_file_printer(m);
>>> +
>>> +	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
>>> +	drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
>>> +
>>> +	if (dev_is_pci(dev->dev)) {
>>> +		struct pci_dev *pdev = to_pci_dev(dev->dev);
>>> +
>>> +		drm_printf(&p, "drm-pdev:\t%04x:%02x:%02x.%d\n",
>>> +			   pci_domain_nr(pdev->bus), pdev->bus->number,
>>> +			   PCI_SLOT(pdev->devfn), PCI_FUNC(pdev->devfn));
>>> +	}
>>> +
>>> +	if (dev->driver->show_fdinfo)
>>> +		dev->driver->show_fdinfo(&p, file);
>>> +}
>>> +EXPORT_SYMBOL(drm_show_fdinfo);
>>> +
>>>    /**
>>>     * mock_drm_getfile - Create a new struct file for the drm device
>>>     * @minor: drm minor to wrap (e.g. #drm_device.primary)
>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index 5b86bb7603e7..5edf2a13733b 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -401,6 +401,13 @@ struct drm_driver {
>>>    			       struct drm_device *dev, uint32_t handle,
>>>    			       uint64_t *offset);
>>> +	/**
>>> +	 * @show_fdinfo:
>>> +	 *
>>> +	 * Print device specific fdinfo.  See Documentation/gpu/drm-usage-stats.rst.
>>> +	 */
>>> +	void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>>> +
>>>    	/** @major: driver major number */
>>>    	int major;
>>>    	/** @minor: driver minor number */
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 0d1f853092ab..6de6d0e9c634 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -258,6 +258,9 @@ struct drm_file {
>>>    	/** @pid: Process that opened this file. */
>>>    	struct pid *pid;
>>> +	/** @client_id: A unique id for fdinfo */
>>> +	u64 client_id;
>>> +
>>>    	/** @magic: Authentication magic, see @authenticated. */
>>>    	drm_magic_t magic;
>>> @@ -437,6 +440,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
>>>    void drm_send_event_timestamp_locked(struct drm_device *dev,
>>>    				     struct drm_pending_event *e,
>>>    				     ktime_t timestamp);
>>> +void drm_show_fdinfo(struct seq_file *m, struct file *f);
>>>    struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>>
> 
