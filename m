Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A5F7E059F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 16:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E325C10E16E;
	Fri,  3 Nov 2023 15:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D23C10E16F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699025701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6I+svjCQClpGsA/iiv76PtiyM5cXX4stVU2i+dbhzLc=;
 b=RcC+/LMpZr4270dux5vl7hjIThyPUuSMsi1Ndr1fOo7FLjwHbRFJRWoBay8FLHofB0wxmi
 sASLEijbd9w9fjlbsFbSrTb/iKEq8UsURtaxqkScIyFgxluVcXc3T6EsuF7FkNbCuZsmq3
 QqWzVy1AD/YsJ1Cawj4G1g3N8KM0o4Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-VCOuoBDQN-qgCt-vwCyqHg-1; Fri, 03 Nov 2023 11:34:57 -0400
X-MC-Unique: VCOuoBDQN-qgCt-vwCyqHg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9dd58f58281so37661666b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 08:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699025696; x=1699630496;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6I+svjCQClpGsA/iiv76PtiyM5cXX4stVU2i+dbhzLc=;
 b=u9eXs+TzM82YzXsVuzXIsrBkGpl/YcglO4i8bbdM1FVk5wi4r0soswhcmv7lEDaK8T
 BaiQNkiIFhboZsnTrK3sbDc2iv1WErk7WkhOiX7YhrL/1qiuNkNCCDwKz+VPKTZQz+bX
 VmaGjxrhlY1nQbHr/YCzm9dwjvv0oR6nfgAOHQdYpaNuyWAfp11LjJTkcNY6Ln2/Jqok
 oGLpdi9vdCwt3E6JnYAIAF1EjEVGRy4714U+WKBT4Bk6ywY9CWoStqKRVVzn1vN0ya66
 o/QZrSK+A4AyrxRtFiuJRIyhVwnD1X9Rv/MVg7vR6EzkK9ReKSQHRb59MfuOJRaKIgg7
 T3AA==
X-Gm-Message-State: AOJu0YxGsEFE7GanvWcJKxWr2bMGe4SBJTh3fSbczbKM363UnXfQxRX6
 ZTH59GA4oRjtN/8HPlgRlC0WaTPahi9XkFdLKs+HVYEkL0LQl2SJ+U39T2Enj6FKpqqmkhu4WHR
 8Lk6OY1ZfD8HqMwKdLxfpzAIwfjM/
X-Received: by 2002:a17:907:70b:b0:9d2:20ee:b18b with SMTP id
 xb11-20020a170907070b00b009d220eeb18bmr7011267ejb.42.1699025696192; 
 Fri, 03 Nov 2023 08:34:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcavitI/4kLy5wUxzFp28EtbVYH8+6GnuzSW7WRACZHvJjkbO37JEYLqM+10ndfWpBM88axg==
X-Received: by 2002:a17:907:70b:b0:9d2:20ee:b18b with SMTP id
 xb11-20020a170907070b00b009d220eeb18bmr7011213ejb.42.1699025695692; 
 Fri, 03 Nov 2023 08:34:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a1709062e8b00b0099ce025f8ccsm1022109eji.186.2023.11.03.08.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Nov 2023 08:34:55 -0700 (PDT)
Message-ID: <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
Date: Fri, 3 Nov 2023 16:34:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231101233113.8059-1-dakr@redhat.com>
 <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, boris.brezillon@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/23 15:04, Christian König wrote:
> Am 03.11.23 um 14:14 schrieb Danilo Krummrich:
>> On Fri, Nov 03, 2023 at 08:18:35AM +0100, Christian König wrote:
>>> Am 02.11.23 um 00:31 schrieb Danilo Krummrich:
>>>> Implement reference counting for struct drm_gpuvm.
>>>  From the design point of view what is that good for?
>> It was discussed in this thread [1].
>>
>> Essentially, the idea is to make sure that vm_bo->vm is always valid without the
>> driver having the need to take extra care. It also ensures that GPUVM can't be
>> freed with mappings still held.
> 
> Well in this case I have some objections to this. The lifetime of the VM is driver and use case specific.

That's fine, I don't see how this changes with a reference count.

> 
> Especially we most likely don't want the VM to live longer than the application which originally used it. If you make the GPUVM an independent object you actually open up driver abuse for the lifetime of this.

Right, we don't want that. But I don't see how the reference count prevents that.

Independant object is relative. struct drm_gpuvm is still embedded into a driver
specific structure. It's working the same way as with struct drm_gem_obejct.

> 
> Additional to that see below for a quite real problem with this.
> 
>>> Background is that the most common use case I see is that this object is
>>> embedded into something else and a reference count is then not really a good
>>> idea.
>> Do you have a specific use-case in mind where this would interfere?
> 
> Yes, absolutely. For an example see amdgpu_mes_self_test(), here we initialize a temporary amdgpu VM for an in kernel unit test which runs during driver load.
> 
> When the function returns I need to guarantee that the VM is destroyed or otherwise I will mess up normal operation.

Nothing prevents that. The reference counting is well defined. If the driver did not
take additional references (which is clearly up to the driver taking care of) and all
VM_BOs and mappings are cleaned up, the reference count is guaranteed to be 1 at this
point.

Also note that if the driver would have not cleaned up all VM_BOs and mappings before
shutting down the VM, it would have been a bug anyways and the driver would potentially
leak memory and UAF issues.

Hence, If the VM is still alive at a point where you don't expect it to be, then it's
simply a driver bug.

> 
> Reference counting is nice when you don't know who else is referring to your VM, but the cost is that you also don't know when the object will guardedly be destroyed.
> 
> I can trivially work around this by saying that the generic GPUVM object has a different lifetime than the amdgpu specific object, but that opens up doors for use after free again.

If your driver never touches the VM's reference count and exits the VM with a clean state
(no mappings and no VM_BOs left), effectively, this is the same as having no reference
count.

In the very worst case you could argue that we trade a potential UAF *and* memroy leak
(no reference count) with *only* a memory leak (with reference count), which to me seems
reasonable.

> 
> Regards,
> Christian.
> 
>>> Thanks,
>>> Christian.
>> [1]https://lore.kernel.org/dri-devel/6fa058a4-20d3-44b9-af58-755cfb375d75@redhat.com/
>>
>>>> Signed-off-by: Danilo Krummrich<dakr@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_gpuvm.c            | 44 +++++++++++++++++++-------
>>>>    drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 +++++++++---
>>>>    include/drm/drm_gpuvm.h                | 31 +++++++++++++++++-
>>>>    3 files changed, 78 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>>>> index 53e2c406fb04..6a88eafc5229 100644
>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>> @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>>>>    	gpuvm->rb.tree = RB_ROOT_CACHED;
>>>>    	INIT_LIST_HEAD(&gpuvm->rb.list);
>>>> +	kref_init(&gpuvm->kref);
>>>> +
>>>>    	gpuvm->name = name ? name : "unknown";
>>>>    	gpuvm->flags = flags;
>>>>    	gpuvm->ops = ops;
>>>> @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>>>> -/**
>>>> - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
>>>> - * @gpuvm: pointer to the &drm_gpuvm to clean up
>>>> - *
>>>> - * Note that it is a bug to call this function on a manager that still
>>>> - * holds GPU VA mappings.
>>>> - */
>>>> -void
>>>> -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>> +static void
>>>> +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
>>>>    {
>>>>    	gpuvm->name = NULL;
>>>> @@ -790,7 +785,33 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>>>>    	drm_gem_object_put(gpuvm->r_obj);
>>>>    }
>>>> -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
>>>> +
>>>> +static void
>>>> +drm_gpuvm_free(struct kref *kref)
>>>> +{
>>>> +	struct drm_gpuvm *gpuvm = container_of(kref, struct drm_gpuvm, kref);
>>>> +
>>>> +	if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
>>>> +		return;
>>>> +
>>>> +	drm_gpuvm_fini(gpuvm);
>>>> +
>>>> +	gpuvm->ops->vm_free(gpuvm);
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_gpuvm_bo_put() - drop a struct drm_gpuvm reference
>>>> + * @gpuvm: the &drm_gpuvm to release the reference of
>>>> + *
>>>> + * This releases a reference to @gpuvm.
>>>> + */
>>>> +void
>>>> +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
>>>> +{
>>>> +	if (gpuvm)
>>>> +		kref_put(&gpuvm->kref, drm_gpuvm_free);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>>>>    static int
>>>>    __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>>> @@ -843,7 +864,7 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>>>>    	if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
>>>>    		return -EINVAL;
>>>> -	return __drm_gpuva_insert(gpuvm, va);
>>>> +	return __drm_gpuva_insert(drm_gpuvm_get(gpuvm), va);
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gpuva_insert);
>>>> @@ -876,6 +897,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
>>>>    	}
>>>>    	__drm_gpuva_remove(va);
>>>> +	drm_gpuvm_put(va->vm);
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> index 54be12c1272f..cb2f06565c46 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>> @@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
>>>>    	}
>>>>    }
>>>> +static void
>>>> +nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
>>>> +{
>>>> +	struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
>>>> +
>>>> +	kfree(uvmm);
>>>> +}
>>>> +
>>>> +static const struct drm_gpuvm_ops gpuvm_ops = {
>>>> +	.vm_free = nouveau_uvmm_free,
>>>> +};
>>>> +
>>>>    int
>>>>    nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>>>>    			   void *data,
>>>> @@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>>>>    		       NOUVEAU_VA_SPACE_END,
>>>>    		       init->kernel_managed_addr,
>>>>    		       init->kernel_managed_size,
>>>> -		       NULL);
>>>> +		       &gpuvm_ops);
>>>>    	/* GPUVM takes care from here on. */
>>>>    	drm_gem_object_put(r_obj);
>>>> @@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>>>>    	return 0;
>>>>    out_gpuvm_fini:
>>>> -	drm_gpuvm_destroy(&uvmm->base);
>>>> -	kfree(uvmm);
>>>> +	drm_gpuvm_put(&uvmm->base);
>>>>    out_unlock:
>>>>    	mutex_unlock(&cli->mutex);
>>>>    	return ret;
>>>> @@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
>>>>    	mutex_lock(&cli->mutex);
>>>>    	nouveau_vmm_fini(&uvmm->vmm);
>>>> -	drm_gpuvm_destroy(&uvmm->base);
>>>> -	kfree(uvmm);
>>>> +	drm_gpuvm_put(&uvmm->base);
>>>>    	mutex_unlock(&cli->mutex);
>>>>    }
>>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
>>>> index 0c2e24155a93..4e6e1fd3485a 100644
>>>> --- a/include/drm/drm_gpuvm.h
>>>> +++ b/include/drm/drm_gpuvm.h
>>>> @@ -247,6 +247,11 @@ struct drm_gpuvm {
>>>>    		struct list_head list;
>>>>    	} rb;
>>>> +	/**
>>>> +	 * @kref: reference count of this object
>>>> +	 */
>>>> +	struct kref kref;
>>>> +
>>>>    	/**
>>>>    	 * @kernel_alloc_node:
>>>>    	 *
>>>> @@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>>>>    		    u64 start_offset, u64 range,
>>>>    		    u64 reserve_offset, u64 reserve_range,
>>>>    		    const struct drm_gpuvm_ops *ops);
>>>> -void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
>>>> +
>>>> +/**
>>>> + * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
>>>> + * @gpuvm: the &drm_gpuvm to acquire the reference of
>>>> + *
>>>> + * This function acquires an additional reference to @gpuvm. It is illegal to
>>>> + * call this without already holding a reference. No locks required.
>>>> + */
>>>> +static inline struct drm_gpuvm *
>>>> +drm_gpuvm_get(struct drm_gpuvm *gpuvm)
>>>> +{
>>>> +	kref_get(&gpuvm->kref);
>>>> +
>>>> +	return gpuvm;
>>>> +}
>>>> +
>>>> +void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
>>>>    bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
>>>>    bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
>>>> @@ -673,6 +694,14 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
>>>>     * operations to drivers.
>>>>     */
>>>>    struct drm_gpuvm_ops {
>>>> +	/**
>>>> +	 * @vm_free: called when the last reference of a struct drm_gpuvm is
>>>> +	 * dropped
>>>> +	 *
>>>> +	 * This callback is mandatory.
>>>> +	 */
>>>> +	void (*vm_free)(struct drm_gpuvm *gpuvm);
>>>> +
>>>>    	/**
>>>>    	 * @op_alloc: called when the &drm_gpuvm allocates
>>>>    	 * a struct drm_gpuva_op
> 

