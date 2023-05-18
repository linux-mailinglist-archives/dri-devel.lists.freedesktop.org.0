Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 870A4707D1D
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 11:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3029310E07C;
	Thu, 18 May 2023 09:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D2E10E04A;
 Thu, 18 May 2023 09:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684403004; x=1715939004;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=/nnIjDUErA7Mcz2PpqQCVWzrR0L9qc9fQ85Z7pq+Bko=;
 b=kqW8ICuTiXEkbGhkaTPYGyCVAkR7DsqzugfqSHWENFEkj4UP7ldcnviO
 +ESvd0nXBLeoklNt57GqwZeGtv1FHRBeBotJUWts5DZLrX2FSgrCX9v7g
 y6HJMy2cgFb38Q/HieLvlLW4kmomk5fT+6M5ALHOIRtcYUHQzxx9ot6z9
 5L2+dVRzQF2pVsChwUDFAt3ygtXSXFlL1q5o7ukdohzdXhJ7GOh+DG9Kb
 cQe5YVjHpy0alxWvA4Mi9aL4PWbCZNCq0DEZDL1wnV4zq2WEAt//f81k0
 q/RZV7LUpnFJQ33nNJJQzTRzLDq/pwdhmTNJ0jedPBjWcimbOZLUiAzNm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336588217"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="336588217"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 02:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="846403338"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200"; d="scan'208";a="846403338"
Received: from cfeltham-mobl.ger.corp.intel.com (HELO [10.213.201.177])
 ([10.213.201.177])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 02:43:19 -0700
Message-ID: <1420ed7c-d3c2-7768-f954-4a88036448a9@linux.intel.com>
Date: Thu, 18 May 2023 10:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 8/9] drm/fdinfo: Add comm/cmdline override fields
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Rob Clark <robdclark@gmail.com>
References: <20230427175340.1280952-1-robdclark@gmail.com>
 <20230427175340.1280952-9-robdclark@gmail.com>
 <135ff649-e50c-50f4-55ba-a1b615865e02@linux.intel.com>
 <CAF6AEGvKnPgtna4yjN56mMjCLqpjs8B8K152VWxmPs1NdY78vA@mail.gmail.com>
 <b615ba5e-c15a-226b-959b-e76216015f83@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <b615ba5e-c15a-226b-959b-e76216015f83@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


In case you were waiting for me looking at the rest of the series, there 
was this reply from the previous round I can expand on.

On 02/05/2023 08:50, Tvrtko Ursulin wrote:
> 
> On 01/05/2023 17:58, Rob Clark wrote:
>> On Fri, Apr 28, 2023 at 4:05 AM Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>
>>>
>>> On 27/04/2023 18:53, Rob Clark wrote:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> These are useful in particular for VM scenarios where the process which
>>>> has opened to drm device file is just a proxy for the real user in a VM
>>>> guest.
>>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>    Documentation/gpu/drm-usage-stats.rst | 18 ++++++++++++++++++
>>>>    drivers/gpu/drm/drm_file.c            | 15 +++++++++++++++
>>>>    include/drm/drm_file.h                | 19 +++++++++++++++++++
>>>>    3 files changed, 52 insertions(+)
>>>>
>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst 
>>>> b/Documentation/gpu/drm-usage-stats.rst
>>>> index 58dc0d3f8c58..e4877cf8089c 100644
>>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>>> @@ -73,6 +73,24 @@ scope of each device, in which case `drm-pdev` 
>>>> shall be present as well.
>>>>    Userspace should make sure to not double account any usage 
>>>> statistics by using
>>>>    the above described criteria in order to associate data to 
>>>> individual clients.
>>>>
>>>> +- drm-comm-override: <valstr>
>>>> +
>>>> +Returns the client executable override string.  Some drivers 
>>>> support letting
>>>> +userspace override this in cases where the userspace is simply a 
>>>> "proxy".
>>>> +Such as is the case with virglrenderer drm native context, where 
>>>> the host
>>>> +process is just forwarding command submission, etc, from guest 
>>>> userspace.
>>>> +This allows the proxy to make visible the executable name of the 
>>>> actual
>>>> +app in the VM guest.
>>>> +
>>>> +- drm-cmdline-override: <valstr>
>>>> +
>>>> +Returns the client cmdline override string.  Some drivers support 
>>>> letting
>>>> +userspace override this in cases where the userspace is simply a 
>>>> "proxy".
>>>> +Such as is the case with virglrenderer drm native context, where 
>>>> the host
>>>> +process is just forwarding command submission, etc, from guest 
>>>> userspace.
>>>> +This allows the proxy to make visible the cmdline of the actual app 
>>>> in the
>>>> +VM guest.
>>>
>>> Perhaps it would be okay to save space here by not repeating the
>>> description, like:
>>>
>>> drm-comm-override: <valstr>
>>> drm-cmdline-override: <valstr>
>>>
>>> Long description blah blah...
>>> This allows the proxy to make visible the _executable name *and* command
>>> line_ blah blah..
>>>
>>>> +
>>>>    Utilization
>>>>    ^^^^^^^^^^^
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>> index 9321eb0bf020..d7514c313af1 100644
>>>> --- a/drivers/gpu/drm/drm_file.c
>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>> @@ -178,6 +178,8 @@ struct drm_file *drm_file_alloc(struct drm_minor 
>>>> *minor)
>>>>        spin_lock_init(&file->master_lookup_lock);
>>>>        mutex_init(&file->event_read_lock);
>>>>
>>>> +     mutex_init(&file->override_lock);
>>>> +
>>>>        if (drm_core_check_feature(dev, DRIVER_GEM))
>>>>                drm_gem_open(dev, file);
>>>>
>>>> @@ -292,6 +294,8 @@ void drm_file_free(struct drm_file *file)
>>>>        WARN_ON(!list_empty(&file->event_list));
>>>>
>>>>        put_pid(file->pid);
>>>> +     kfree(file->override_comm);
>>>> +     kfree(file->override_cmdline);
>>>>        kfree(file);
>>>>    }
>>>>
>>>> @@ -995,6 +999,17 @@ void drm_show_fdinfo(struct seq_file *m, struct 
>>>> file *f)
>>>>                           PCI_SLOT(pdev->devfn), 
>>>> PCI_FUNC(pdev->devfn));
>>>>        }
>>>>
>>>> +     mutex_lock(&file->override_lock);
>>>
>>> You could add a fast unlocked check before taking the mutex for no risk
>>> apart a transient false negative. For 99.9999% of userspace it would
>>> mean no pointless lock/unlock cycle.
>>
>> I'm not sure I get your point?  This needs to be serialized against
>> userspace setting the override values
> 
> if (file->override_comm || file->override_cmdline) {
>      mutex_lock(&file->override_lock);
>      if (file->override_comm)
>          drm_printf(&p, "drm-comm-override:\t%s\n",
>                 file->override_comm);
>      if (file->override_cmdline)
>          drm_printf(&p, "drm-cmdline-override:\t%s\n",
>                 file->override_cmdline);
>      mutext_unlock(&file->override_lock);
> }
> 
> No risk apart for a transient false negative (which is immaterial for 
> userspace since fdinfo reads are not ordered versus the override setting 
> anyway) and 99.9% of deployments can get by not needing to pointlessly 
> cycle the lock.

This fast path bypass I think is worth it but up to you if you are 
really opposed. It's just that I don't see a point for cycling the mutex 
for nothing in majority of cases.

>>>
>>>> +     if (file->override_comm) {
>>>> +             drm_printf(&p, "drm-comm-override:\t%s\n",
>>>> +                        file->override_comm);
>>>> +     }
>>>> +     if (file->override_cmdline) {
>>>> +             drm_printf(&p, "drm-cmdline-override:\t%s\n",
>>>> +                        file->override_cmdline);
>>>> +     }
>>>> +     mutex_unlock(&file->override_lock);
>>>> +
>>>>        if (dev->driver->show_fdinfo)
>>>>                dev->driver->show_fdinfo(&p, file);
>>>>    }
>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>> index 1339e925af52..604d05fa6f0c 100644
>>>> --- a/include/drm/drm_file.h
>>>> +++ b/include/drm/drm_file.h
>>>> @@ -370,6 +370,25 @@ struct drm_file {
>>>>         */
>>>>        struct drm_prime_file_private prime;
>>>>
>>>> +     /**
>>>> +      * @comm: Overridden task comm
>>>> +      *
>>>> +      * Accessed under override_lock
>>>> +      */
>>>> +     char *override_comm;
>>>> +
>>>> +     /**
>>>> +      * @cmdline: Overridden task cmdline
>>>> +      *
>>>> +      * Accessed under override_lock
>>>> +      */
>>>> +     char *override_cmdline;
>>>> +
>>>> +     /**
>>>> +      * @override_lock: Serialize access to override_comm and 
>>>> override_cmdline
>>>> +      */
>>>> +     struct mutex override_lock;
>>>> +
>>>
>>> I don't think this should go to drm just yet though. Only one driver can
>>> make use of it so I'd leave it for later and print from msm_show_fdinfo
>>> for now.
>>
>> This was my original approach but danvet asked that it be moved into
>> drm for consistency across drivers.  (And really, I want the in-flight
>> amd and intel native-context stuff to motivate adding similar features
>> to amdgpu/i915/xe.)
> 
> IMO if implementation is not shared, not even by using helpers, I don't 
> think data storage should be either, but it's not a deal breaker.

To summarise my thoughts on the patch (v4):

I am not really keen on the split of data fields in common and no common 
implementation or helpers.

For what the drm-usage-stats.rst are concerned it looks completely fine. 
And feature really will be useful in virtualised stacks.

Code in this patch is also completely fine.

Therefore you can have an r-b on those parts, but with reservations on 
whether it makes sense to put the fields under drm_file just yet. That 
should be fine under the r-b rules AFAIU. Ideally you can collect an ack 
from someone else too.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> 
> Regards,
> 
> Tvrtko
> 
>>
>> BR,
>> -R
>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>        /* private: */
>>>>    #if IS_ENABLED(CONFIG_DRM_LEGACY)
>>>>        unsigned long lock_count; /* DRI1 legacy lock count */
