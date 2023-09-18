Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED1A7A4839
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 13:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D3D10E274;
	Mon, 18 Sep 2023 11:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4EF10E272
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 11:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695036090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=caZBuHO02JTq4izkwN1/2mH03NPW+7BFGaAKa0BCkPU=;
 b=YNhD5BybBrzql7oC2vQsRcL3kw7hP78iSTZntQUFgO0u3+J3Nb/MGYMG6cppA/VCS7945q
 s/UnE+eX8xDN/UQoj9h0ekXj9DGTYPBgWKqE3EKnZr2jwXCEoRW4JNcfQmTHgREk1xTfVn
 /xWiEh9m4RcSeENjGRfNEVezrkfvsw0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-mNwlfOgwOGGk0LHAGgN9PQ-1; Mon, 18 Sep 2023 07:21:28 -0400
X-MC-Unique: mNwlfOgwOGGk0LHAGgN9PQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-99bca0b9234so282868866b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 04:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695036087; x=1695640887;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=caZBuHO02JTq4izkwN1/2mH03NPW+7BFGaAKa0BCkPU=;
 b=uVX7uL4w2vdL+O0i9KJn1/cqDJDQ9jeXsW9Id2vGMQf7ysTN6cpscm1LHjiRZcIlzw
 zpYP53JG+U9BKJPQete+u1/8EgJQvlNbBk3lbFdpmpw9Iaio/tw7IaVoUaDv4CxKyqL+
 O6uO6pxSIbq962iaKfa7i9P+iIS3zlo5F4bBqnoqvh5T3FtYG2vn55lZD9BPwcvof7M9
 1oD2kpUo/chHT44vnU6qTAYPOc0a72xunHrlMfw2nwqD3fxH2fMP0SCIWC0GF+IQXC75
 W7j+VqxvsjFxtKXRQhmFeT20MnavTP+YgSX+/Sa595j98XXbwcXVAGF/5amsQgBV7yub
 /1XQ==
X-Gm-Message-State: AOJu0YxmoXDPn3K2sU/dn+gZDpsRsCuVu6Of0f8N1VesI54dN+EKVnuG
 20njNS3o+So3T5+ttO55Eupo76x/+51FF12rFPFOZqA/5jC9Y8AoysTwdx2GY1sged8N8qdZay3
 tOe1MXDNcyVguGTlLujvaYZQ19+ya
X-Received: by 2002:a17:906:ef8b:b0:99e:f3b:2f78 with SMTP id
 ze11-20020a170906ef8b00b0099e0f3b2f78mr6887998ejb.67.1695036087515; 
 Mon, 18 Sep 2023 04:21:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKBeaIMtKSN+PQ9xk2jJqYcltfzlDVIZ/zML2GbxV4AM0vQzV2UBQOLUiQN5WboaLzn81l9w==
X-Received: by 2002:a17:906:ef8b:b0:99e:f3b:2f78 with SMTP id
 ze11-20020a170906ef8b00b0099e0f3b2f78mr6887978ejb.67.1695036087099; 
 Mon, 18 Sep 2023 04:21:27 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 kg11-20020a17090776eb00b009a1a653770bsm6341125ejc.87.2023.09.18.04.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 04:21:26 -0700 (PDT)
Message-ID: <d8a61464-b3f5-ca9b-4852-ec6ee2b85ce2@redhat.com>
Date: Mon, 18 Sep 2023 13:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Nouveau] [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
From: Danilo Krummrich <dakr@redhat.com>
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <ZQCW6wzHYVdxl/IV@pollux>
 <701dfead-e240-b3fb-422c-d49fc7e04595@linux.intel.com>
 <ZQD2FFLP28bFgHXT@pollux>
 <cbff08ca845655dee44fbf498cdb37a3d5251bf3.camel@linux.intel.com>
 <ZQGoNovGz/4Y3xvf@pollux> <ef29b21d-157c-ead7-4b09-edf763d1f8b0@redhat.com>
 <e8b9a298-d4ea-9ee7-69fe-eb8ea1f9dc3d@linux.intel.com>
 <bdca7ebe-bc65-1db1-a247-490286a31307@redhat.com>
 <7c8c606dbf515bfe9aa3dc3ed6c23ae00d84ef9d.camel@linux.intel.com>
 <2c4bbd8c-ec2c-91ad-9f27-5476b7e65b4f@redhat.com>
Organization: RedHat
In-Reply-To: <2c4bbd8c-ec2c-91ad-9f27-5476b7e65b4f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/14/23 19:15, Danilo Krummrich wrote:
> On 9/14/23 19:13, Thomas Hellström wrote:
>> On Thu, 2023-09-14 at 17:27 +0200, Danilo Krummrich wrote:
>>> On 9/14/23 13:32, Thomas Hellström wrote:
>>>>
>>>> On 9/14/23 12:57, Danilo Krummrich wrote:
>>>>> On 9/13/23 14:16, Danilo Krummrich wrote:
>>>>>
>>>>> <snip>
>>>>>
>>>>>>>> And validate() can remove it while still holding all dma-
>>>>>>>> resv locks,
>>>>>>>> neat!
>>>>>>>> However, what if two tasks are trying to lock the VA space
>>>>>>>> concurrently? What
>>>>>>>> do we do when the drm_gpuvm_bo's refcount drops to zero in
>>>>>>>> drm_gpuva_unlink()?
>>>>>>>> Are we guaranteed that at this point of time the
>>>>>>>> drm_gpuvm_bo is not
>>>>>>>> on the
>>>>>>>> evicted list? Because otherwise we would call
>>>>>>>> drm_gpuvm_bo_destroy()
>>>>>>>> with the
>>>>>>>> dma-resv lock held, which wouldn't be allowed, since
>>>>>>>> drm_gpuvm_bo_destroy()
>>>>>>>> might drop the last reference to the drm_gem_object and
>>>>>>>> hence we'd
>>>>>>>> potentially
>>>>>>>> free the dma-resv lock while holding it, at least if it's
>>>>>>>> an external
>>>>>>>> object.
>>>>>>>
>>>>>>> Easiest way in this scheme is to think of the lists as being
>>>>>>> protected
>>>>>>> by the vm's resv lock. That means anybody calling unlink()
>>>>>>> must also
>>>>>>> hold the vm's resv lock. (Which is OK from an UAF point of
>>>>>>> view, but
>>>>>>> perhaps not from a locking inversion POW from an async list
>>>>>>> update).
>>>>>>
>>>>>> This would mean that on unlink() we'd need to hold the VM's
>>>>>> resv lock and the
>>>>>> corresponding GEM's resv lock (in case they're not the same
>>>>>> anyways) because the
>>>>>> VM's resv lock would protect the external / evicted object
>>>>>> lists and the GEM
>>>>>> objects resv lock protects the GEM's list of drm_gpuvm_bos and
>>>>>> the
>>>>>> drm_gpuvm_bo's list of drm_gpuvas.
>>>>>
>>>>> As mentioned below the same applies for drm_gpuvm_bo_put() since
>>>>> it might
>>>>> destroy the vm_bo, which includes removing the vm_bo from
>>>>> external / evicted
>>>>> object lists and the GEMs list of vm_bos.
>>>>>
>>>>> As mentioned, if the GEM's dma-resv is different from the VM's
>>>>> dma-resv we need
>>>>> to take both locks. Ultimately, this would mean we need a
>>>>> drm_exec loop, because
>>>>> we can't know the order in which to take these locks. Doing a
>>>>> full drm_exec loop
>>>>> just to put() a vm_bo doesn't sound reasonable to me.
>>>>>
>>>>> Can we instead just have an internal mutex for locking the lists
>>>>> such that we
>>>>> avoid taking and dropping the spinlocks, which we use currently,
>>>>> in a loop?
>>>>
>>>> You'd have the same locking inversion problem with a mutex, right?
>>>> Since in the eviction path you have resv->mutex, from exec you have
>>>> resv->mutex->resv because validate would attempt to grab resv.
>>>
>>> Both lists, evict and extobj, would need to have a separate mutex,
>>> not a common one.
>>> We'd also need a dedicated GEM gpuva lock. Then the only rule would
>>> be that you can't
>>> hold the dma-resv lock when calling put(). Which I admit is not that
>>> nice.
>>>
>>> With the current spinlock solution drivers wouldn't need to worry
>>> about anything locking
>>> related though. So maybe I come back to your proposal of having a
>>> switch for external
>>> locking with dma-resv locks entirely. Such that with external dma-
>>> resv locking I skip
>>> all the spinlocks and add lockdep checks instead.
>>>
>>> I think that makes the most sense in terms of taking advantage of
>>> external dma-resv locking
>>> where possible and on the other hand having a self-contained solution
>>> if not. This should
>>> get all concerns out of the way, yours, Christian's and Boris'.
>>
>> If we need additional locks yes, I'd prefer the opt-in/opt-out spinlock
>> solution, and check back after a while to see if we can remove either
>> option once most pitfalls are hit.
> 
> Sounds good, I'll prepare this for a V4.

I was considering getting rid of the spinlocks using srcu for both external and
evicted objects instead. This would get us rid of taking/dropping the spinlock in
every iteration step of the lists, limiting it to a single srcu_read_{lock,unlock}
call per list walk. Plus, obviously the list_add_rcu() and list_del_rcu() variants
as accessors. The accessors, would probably still need a spinlock to protect against
concurrent list_add_rcu()/list_del_rcu() calls, but I think those are not a concern.

Any concerns from your side with variant?

> 
> - Danilo
> 
>>
>> Thanks,
>> /Thomas
>>
>>
>>>
>>>>
>>>> That said, xe currently indeed does the vm+bo exec dance on vma
>>>> put.
>>>>
>>>> One reason why that seemingly horrible construct is good, is that
>>>> when evicting an extobj and you need to access individual vmas to
>>>> Zap page table entries or TLB flush, those VMAs are not allowed to
>>>> go away (we're not refcounting them). Holding the bo resv on gpuva
>>>> put prevents that from happening. Possibly one could use another
>>>> mutex to protect the gem->vm_bo list to achieve the same, but we'd
>>>> need to hold it on gpuva put.
>>>>
>>>> /Thomas
>>>>
>>>>
>>>>>
>>>>> - Danilo
>>>>>
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> For extobjs an outer lock would be enough in case of
>>>>>>>>>> Xe, but I
>>>>>>>>>> really would not
>>>>>>>>>> like to add even more complexity just to get the
>>>>>>>>>> spinlock out of
>>>>>>>>>> the way in case
>>>>>>>>>> the driver already has an outer lock protecting this
>>>>>>>>>> path.
>>>>>>>>>
>>>>>>>>> I must disagree here. These spinlocks and atomic
>>>>>>>>> operations are
>>>>>>>>> pretty
>>>>>>>>> costly and as discussed earlier this type of locking was
>>>>>>>>> the reason
>>>>>>>>> (at
>>>>>>>>> least according to the commit message) that made
>>>>>>>>> Christian drop the
>>>>>>>>> XArray
>>>>>>>>> use in drm_exec for the same set of objects: "The locking
>>>>>>>>> overhead
>>>>>>>>> is
>>>>>>>>> unecessary and measurable". IMHO the spinlock is the
>>>>>>>>> added
>>>>>>>>> complexity and a
>>>>>>>>> single wide lock following the drm locking guidelines set
>>>>>>>>> out by
>>>>>>>>> Daniel and
>>>>>>>>> David should really be the default choice with an opt-in
>>>>>>>>> for a
>>>>>>>>> spinlock if
>>>>>>>>> needed for async and pushing out to a wq is not an
>>>>>>>>> option.
>>>>>>>>
>>>>>>>> For the external object list an outer lock would work as
>>>>>>>> long as it's
>>>>>>>> not the
>>>>>>>> dma-resv lock of the corresponding GEM object, since here
>>>>>>>> we actually
>>>>>>>> need to
>>>>>>>> remove the list entry from the external object list on
>>>>>>>> drm_gpuvm_bo_destroy().
>>>>>>>> It's just a bit weird design wise that drivers would need
>>>>>>>> to take
>>>>>>>> this outer
>>>>>>>> lock on:
>>>>>>>>
>>>>>>>> - drm_gpuvm_bo_extobj_add()
>>>>>>>> - drm_gpuvm_bo_destroy()        (and hence also
>>>>>>>> drm_gpuvm_bo_put())
>>>>>>>> - drm_gpuva_unlink()            (because it needs to call
>>>>>>>> drm_gpuvm_bo_put())
>>>>>>>> - drm_gpuvm_exec_lock()
>>>>>>>> - drm_gpuvm_exec_lock_array()
>>>>>>>> - drm_gpuvm_prepare_range()
>>>>>>>>
>>>>>>>> Given that it seems reasonable to do all the required
>>>>>>>> locking
>>>>>>>> internally.
>>>>>>>
>>>>>>>   From a design POW, there has been a clear direction in XE to
>>>>>>> make
>>>>>>> things similar to mmap() / munmap(), so this outer lock,
>>>>>>> which in Xe is
>>>>>>> an rwsem, is used in a similar way as the mmap_lock. It's
>>>>>>> protecting
>>>>>>> the page-table structures and vma rb tree, the userptr
>>>>>>> structures and
>>>>>>> the extobj list. Basically it's taken early in the exec
>>>>>>> IOCTL, the
>>>>>>> VM_BIND ioctl, the compute rebind worker and the pagefault
>>>>>>> handler, so
>>>>>>> all of the above are just asserting that it is taken in the
>>>>>>> correct
>>>>>>> mode.
>>>>>>>
>>>>>>> But strictly with this scheme one could also use the vm's
>>>>>>> dma_resv for
>>>>>>> the extobj list since with drm_exec, it's locked before
>>>>>>> traversing the
>>>>>>> list.
>>>>>>>
>>>>>>> The whole point of this scheme is to rely on locks that you
>>>>>>> already are
>>>>>>> supposed to be holding for various reasons and is simple to
>>>>>>> comprehend.
>>>>>>
>>>>>> I don't agree that we're supposed to hold the VM's resv lock
>>>>>> anyways for
>>>>>> functions like drm_gpuvm_bo_put() or drm_gpuva_unlink(), but
>>>>>> I'm fine using it
>>>>>> for that purpose nevertheless.
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> In order to at least place lockdep checks, the driver would
>>>>>>>> need to
>>>>>>>> supply the
>>>>>>>> corresponding lock's lockdep_map, because the GPUVM
>>>>>>>> otherwise doesn't
>>>>>>>> know about
>>>>>>>> the lock.
>>>>>>>
>>>>>>> Yes, that sounds reasonable. One lockdep map per list.
>>>>>>
>>>>>> I'd really like to avoid that, especially now that everything
>>>>>> got simpler. We
>>>>>> should define the actual locks to take instead.
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Out of curiosity, what is the overhead of a spin_lock()
>>>>>>>> that doesn't
>>>>>>>> need to
>>>>>>>> spin?
>>>>>>>
>>>>>>> I guess it's hard to tell exactly, but it is much lower on
>>>>>>> modern x86
>>>>>>> than what it used to be. Not sure about ARM, which is the
>>>>>>> other
>>>>>>> architecture important to us. I figure if there is little
>>>>>>> cache-line
>>>>>>> bouncing the main overhead comes from the implied barriers.
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> A pretty simple way that would not add much code would be
>>>>>>>>>
>>>>>>>>> static void gpuvm_cond_spin_lock(const struct drm_gpuvm
>>>>>>>>> *gpuvm,
>>>>>>>>> spinlock_t
>>>>>>>>> *lock)
>>>>>>>>>
>>>>>>>>> {
>>>>>>>>>
>>>>>>>>>       if (!gpuvm->resv_protected_lists)
>>>>>>>>>           spin_lock(lock);
>>>>>>>>>
>>>>>>>>> }
>>>>>>>>>
>>>>>>>>>>> For such drivers, that would require anybody calling
>>>>>>>>>>> unlink to
>>>>>>>>>>> hold the vm's
>>>>>>>>>>> resv, though.
>>>>>>>>>> In V4 I want to go back to having a dedicated lock for
>>>>>>>>>> the GEMs
>>>>>>>>>> gpuva list (or
>>>>>>>>>> VM_BO list to be more precise). We can't just use the
>>>>>>>>>> dma-resv
>>>>>>>>>> lock for that
>>>>>>>>>> with VM_BO abstractions, because on destruction of a
>>>>>>>>>> VM_BO we
>>>>>>>>>> otherwise wouldn't
>>>>>>>>>> be allowed to already hold the dma-resv lock. That's
>>>>>>>>>> the fix I
>>>>>>>>>> was referring to
>>>>>>>>>> earlier.
>>>>>>>>>
>>>>>>>>> Yeah, I can see the need for a dedicated lock for the
>>>>>>>>> GEM's gpuva
>>>>>>>>> list, but
>>>>>>>>> holding the vm's dma-resv lock across the unlink
>>>>>>>>> shouldn't be a
>>>>>>>>> problem. We
>>>>>>>>> may free the object and a pointer to the vm's resv during
>>>>>>>>> unlink
>>>>>>>>> but we
>>>>>>>>> don't free the vm's resv.  It'd be a matter of ensuring
>>>>>>>>> that any
>>>>>>>>> calls to
>>>>>>>>> unlink from *within* drm_gpuvm allows it to be held.
>>>>>>>>
>>>>>>>> Drivers calling unlink() from the fence signaling path
>>>>>>>> can't use the
>>>>>>>> VM's
>>>>>>>> dma-resv lock.
>>>>>>>
>>>>>>> Yes, that made me a bit curious because in the current
>>>>>>> version the code
>>>>>>> required the object's dma_resv for unlink() which can't be
>>>>>>> grabbed
>>>>>>> either from the fence signaling path. So are there any
>>>>>>> drivers actually
>>>>>>> wanting to do that? If so, they will either need to resort to
>>>>>>> the
>>>>>>> current spinlock solution or they will need to call unlink
>>>>>>> from a
>>>>>>> workqueue item.
>>>>>>
>>>>>> As Boris already mentioned we have the dma-resv lock by default
>>>>>> or a driver
>>>>>> specific GEM gpuva lock as opt-in. Now, we can get rid of the
>>>>>> latter.
>>>>>>
>>>>>>>>
>>>>>>>> Also, what if the object is an external object? We can't
>>>>>>>> use the VM's
>>>>>>>> dma-resv
>>>>>>>> lock here.
>>>>>>>
>>>>>>> Why? Typically (sync) unlink is only ever called from an
>>>>>>> unbind-like
>>>>>>> operation where it should be trivial to grab the vm's resv.
>>>>>>> Or, for
>>>>>>> that matter any outer lock protecting the extobj list. Rule
>>>>>>> would be
>>>>>>> the drm_gpuvm_bo::entry::extobj  and
>>>>>>> drm_gpuvm_bo::entry::evict would
>>>>>>> be protected by either the vm's dma_resv (or possibly an
>>>>>>> outer lock in
>>>>>>> the case of the extobj list).
>>>>>>
>>>>>> Outer lock wouldn't have been working for updates in the async
>>>>>> path, but
>>>>>> shouldn't be relevant anymore. We could use the VM's resv for
>>>>>> that.
>>>>>>
>>>>>>>
>>>>>>>>    And we can't have the GEM objs dma-resv lock held when
>>>>>>>> calling
>>>>>>>> unlink(), since unlink() calls drm_gpuvm_bo_put(), which if
>>>>>>>> the
>>>>>>>> refcount drops
>>>>>>>> to zero calls drm_gpuvm_bo_destroy() and
>>>>>>>> drm_gpuvm_bo_destroy() might
>>>>>>>> drop the
>>>>>>>> last reference of the GEM object.
>>>>>>>
>>>>>>> Yes, but this is a different problem as to what exactly
>>>>>>> protects
>>>>>>> drm_gpuvm_bo::entry::gem. Either as you suggest an internal
>>>>>>> per bo list
>>>>>>> lock, or if we want to keep the bo's dma_resv we need to
>>>>>>> ensure that
>>>>>>> the caller of dma_resv_unlock(obj->resv) actually refcounts
>>>>>>> its obj
>>>>>>> pointer, and doesn't implicitly rely on the gpuvm_bo's
>>>>>>> refcount (I know
>>>>>>> Boris didn't like that, but requiring an explicit refcount
>>>>>>> for a
>>>>>>> pointer you dereference unless you're under a lock that
>>>>>>> ensures keeping
>>>>>>> the object alive is pretty much required?) But anyway for the
>>>>>>> drm_gpuvm_bo::entry::gem list protection (bo resv or internal
>>>>>>> spinlock)
>>>>>>> I don't have a strong preference.
>>>>>>
>>>>>> We can keep the GEM objects dma-resv lock, however as mentioned
>>>>>> above
>>>>>> drm_gpuva_unlink() and drm_gpuvm_bo_put() then requires both
>>>>>> the VM's resv lock
>>>>>> and the GEM's resv lock in case they differ.
>>>>>>
>>>>>
>>>>>>>>>
>>>>>
>>>>
>>>
>>

