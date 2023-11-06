Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9047F7E28F7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 16:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1243010E350;
	Mon,  6 Nov 2023 15:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A6E10E34B;
 Mon,  6 Nov 2023 15:48:15 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6bcbfecf314so1502471b3a.1; 
 Mon, 06 Nov 2023 07:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699285695; x=1699890495; darn=lists.freedesktop.org;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=FWLi0aC/vUChCMscQWk31Got82qVh6+aB5Z9pJSbwtA=;
 b=WrDSFXPabS/POGyNtnsg3eguKtT0eCbjP7Q3DSxnmAngn3BrTOGHE+yYZIPhKbDTIU
 IwYsLXzTqNX9ts9n2Sdq9fOmirq+KC3wIEl8tIahpPKnQPTwUVHvC+mLOmEoU/D+iMbr
 cvX/6NT35BNAoFrCrkSOKDDQ7B5yDRietNiG8kavZqdEgbJ6lzsmGq7jhPq5jv85QcBM
 hq/rzFCQZgAF4bWUL/Y9yBNNXW3/0VVHFRfTLh2dcH/tOhL0PN2Dob4mxh5rrOC5ymor
 bKy5ywNyoFfxbZHFM4UeWztPWUz2opGwYjHJaCSAPjA8mhTwUiaWYwS4uTSH2ReVPv2e
 aabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699285695; x=1699890495;
 h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FWLi0aC/vUChCMscQWk31Got82qVh6+aB5Z9pJSbwtA=;
 b=QBeR58AXjGe6/i8rDp+f7titqqATrrMGsIXCz0wu0RwR2dcApjhrGrNhkLeNudssJX
 h3aWdfOss0520P9Rdte/Pg1YOxQh4SR7sg+vwtzo9Jn32OZahnoAaLww7HikuL4dNeyG
 u+u9Te1KAatp5nqjGHNQkDZ7/BhSbT4eF82I/LTlvRw3ZEAKt3Kns6JlfcAs87mv+/S8
 HZDpFu1CED//M3kGmq9F8eaOIIB4gI5OAwB9F7bMiLtmIQgacbcVQyLeYl+ElMQtSUqK
 Y8CU12RBMRO3MWbvNXarwCsb+XdcfN/PkuSbo2h9B8N64fbUzg0jhkISlJlFlhHDnbTZ
 rNRw==
X-Gm-Message-State: AOJu0Ywj4ej/vrJ2rXm/nGWOAvTg6BjVgiy+RQdqP6E+3hgci812PUUY
 oFyO+aGOco4jR2UN9dhLunU=
X-Google-Smtp-Source: AGHT+IEwzIncczeU/zAYUk4OiFz+nf6DuIFSArvT7ELmMc7ZmcCjN40tyD/Cbmei8T8oColAyybj4Q==
X-Received: by 2002:a05:6a00:4a14:b0:68e:2fd4:288a with SMTP id
 do20-20020a056a004a1400b0068e2fd4288amr30514066pfb.3.1699285695015; 
 Mon, 06 Nov 2023 07:48:15 -0800 (PST)
Received: from smtpclient.apple (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 a3-20020a636603000000b0058988954686sm5568321pgc.90.2023.11.06.07.48.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Nov 2023 07:48:14 -0800 (PST)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Message-Id: <58C142E3-2565-4817-BF4F-7F4D24771D8C@gmail.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_D785BDF5-C81B-494C-BD0C-05FC32A4822F"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH v2 2/3] drm/amdgpu: Add flag to disable implicit sync for
 GEM operations.
Date: Tue, 7 Nov 2023 00:47:59 +0900
In-Reply-To: <d044c075-3030-4d76-b507-398be639fa50@amd.com>
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231102140436.180989-1-ishitatsuyuki@gmail.com>
 <20231102140436.180989-3-ishitatsuyuki@gmail.com>
 <d044c075-3030-4d76-b507-398be639fa50@amd.com>
X-Mailer: Apple Mail (2.3774.200.91.1.1)
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Apple-Mail=_D785BDF5-C81B-494C-BD0C-05FC32A4822F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

> On Nov 6, 2023, at 22:44, Christian K=C3=B6nig =
<christian.koenig@amd.com> wrote:
>=20
>  Am 02.11.23 um 15:04 schrieb Tatsuyuki Ishi:
>> In Vulkan, it is the application's responsibility to perform adequate
>> synchronization before a sparse unmap, replace or BO destroy =
operation.
>> Until now, the kernel applied the same rule as =
implicitly-synchronized
>> APIs like OpenGL, which with per-VM BOs made page table updates stall =
the
>> queue completely. The newly added AMDGPU_VM_EXPLICIT_SYNC flag allows
>> drivers to opt-out of this behavior, while still ensuring adequate =
implicit
>> sync happens for kernel-initiated updates (e.g. BO moves).
>>=20
>> We record whether to use implicit sync or not for each freed mapping. =
To
>> avoid increasing the mapping struct's size, this is union-ized with =
the
>> interval tree field which is unused after the unmap.
>>=20
>> The reason this is done with a GEM ioctl flag, instead of being a VM =
/
>> context global setting, is that the current libdrm implementation =
shares
>> the DRM handle even between different kind of drivers (radeonsi vs =
radv).
>=20
> It would be nice if we could make this more future prove by not using =
a flag, but rather a drm_syncobj.

There is asynchronous VM_BIND and synchronous VM_BIND. Using syncobjs =
address asynchronous binds, but what this patch set solves is to add an =
explicitly synced synchronous bind.

Even within Vulkan, there are use cases for synchronous binds. This is =
when a non-sparse BO is destroyed (or created but that=E2=80=99s not =
synchronized). Such operations should still be explicit sync, unlike =
OpenGL where it syncs to previous submissions. So adding asynchronous =
bind doesn=E2=80=99t supersede this need.

I=E2=80=99ve also thought whether we can just make the unmap =
asynchronous, since the spec requires that destroyed stuff are not =
accessed in any way, but I think it will complicate behavior when the =
destruction of BO immediately follows.

We should implement asynchronous bind someday to make vkQueueBindSparse =
work (even) better, but that will likely involve a larger scope =
including the scheduler. Getting synchronous but explicitly synced binds =
should be simpler and a good incremental step.

Tatsuyuki.

> You can extend the drm_amdgpu_gem_va structure by adding a drm_syncobj =
handle and timeline point at the end.
>=20
> If the syncobj/timeline point results in a fence we give that as input =
dependency the operation has to wait for.
>=20
> And output fence can come later on as well, but that one is much more =
harder to handle.
>=20
> Regards,
> Christian.
>=20
>>=20
>> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
>> ---
>>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 14 ++++--
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  7 ++-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 ++-
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 47 =
+++++++++++--------
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 23 +++++----
>>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 +++----
>>  include/uapi/drm/amdgpu_drm.h                 |  2 +
>>  9 files changed, 71 insertions(+), 50 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index 7d6daf8d2bfa..10e129bff977 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -1196,7 +1196,7 @@ static void unmap_bo_from_gpuvm(struct kgd_mem =
*mem,
>>  	struct amdgpu_device *adev =3D entry->adev;
>>  	struct amdgpu_vm *vm =3D bo_va->base.vm;
>>  -	amdgpu_vm_bo_unmap(adev, bo_va, entry->va);
>> +	amdgpu_vm_bo_unmap(adev, bo_va, entry->va, true);
>>    	amdgpu_vm_clear_freed(adev, vm, &bo_va->last_pt_update);
>>  diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>> index 720011019741..612279e65bff 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>> @@ -122,7 +122,7 @@ int amdgpu_unmap_static_csa(struct amdgpu_device =
*adev, struct amdgpu_vm *vm,
>>  		}
>>  	}
>>  -	r =3D amdgpu_vm_bo_unmap(adev, bo_va, csa_addr);
>> +	r =3D amdgpu_vm_bo_unmap(adev, bo_va, csa_addr, true);
>>  	if (r) {
>>  		DRM_ERROR("failed to do bo_unmap on static CSA, =
err=3D%d\n", r);
>>  		goto error;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index a1b15d0d6c48..cca68b89754e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -667,9 +667,9 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, =
void *data,
>>  	const uint32_t valid_flags =3D AMDGPU_VM_DELAY_UPDATE |
>>  		AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE |
>>  		AMDGPU_VM_PAGE_EXECUTABLE | AMDGPU_VM_MTYPE_MASK |
>> -		AMDGPU_VM_PAGE_NOALLOC;
>> +		AMDGPU_VM_PAGE_NOALLOC | AMDGPU_VM_EXPLICIT_SYNC;
>>  	const uint32_t prt_flags =3D AMDGPU_VM_DELAY_UPDATE |
>> -		AMDGPU_VM_PAGE_PRT;
>> +		AMDGPU_VM_PAGE_PRT | AMDGPU_VM_EXPLICIT_SYNC;
>>    	struct drm_amdgpu_gem_va *args =3D data;
>>  	struct drm_gem_object *gobj;
>> @@ -680,6 +680,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, =
void *data,
>>  	struct drm_exec exec;
>>  	uint64_t va_flags;
>>  	uint64_t vm_size;
>> +	bool sync_unmap;
>>  	int r =3D 0;
>>    	if (args->va_address < AMDGPU_VA_RESERVED_SIZE) {
>> @@ -715,6 +716,8 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, =
void *data,
>>  		return -EINVAL;
>>  	}
>>  +	sync_unmap =3D !(args->flags & AMDGPU_VM_EXPLICIT_SYNC);
>> +
>>  	switch (args->operation) {
>>  	case AMDGPU_VA_OP_MAP:
>>  	case AMDGPU_VA_OP_UNMAP:
>> @@ -774,19 +777,20 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, =
void *data,
>>  				     va_flags);
>>  		break;
>>  	case AMDGPU_VA_OP_UNMAP:
>> -		r =3D amdgpu_vm_bo_unmap(adev, bo_va, args->va_address);
>> +		r =3D amdgpu_vm_bo_unmap(adev, bo_va, args->va_address,
>> +				       sync_unmap);
>>  		break;
>>    	case AMDGPU_VA_OP_CLEAR:
>>  		r =3D amdgpu_vm_bo_clear_mappings(adev, &fpriv->vm,
>>  						args->va_address,
>> -						args->map_size);
>> +						args->map_size, =
sync_unmap);
>>  		break;
>>  	case AMDGPU_VA_OP_REPLACE:
>>  		va_flags =3D amdgpu_gem_va_map_flags(adev, args->flags);
>>  		r =3D amdgpu_vm_bo_replace_map(adev, bo_va, =
args->va_address,
>>  					     args->offset_in_bo, =
args->map_size,
>> -					     va_flags);
>> +					     va_flags, sync_unmap);
>>  		break;
>>  	default:
>>  		break;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> index f3ee83cdf97e..28be03f1bbcf 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> @@ -67,7 +67,12 @@ struct amdgpu_bo_va_mapping {
>>  	struct rb_node			rb;
>>  	uint64_t			start;
>>  	uint64_t			last;
>> -	uint64_t			__subtree_last;
>> +	union {
>> +		/* BOs in interval tree only */
>> +		uint64_t		__subtree_last;
>> +		/* Freed BOs only */
>> +		bool			sync_unmap;
>> +	};
>>  	uint64_t			offset;
>>  	uint64_t			flags;
>>  };
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> index 2fd1bfb35916..e71443c8c59b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> @@ -276,6 +276,7 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,
>>  			     __field(long, last)
>>  			     __field(u64, offset)
>>  			     __field(u64, flags)
>> +			     __field(bool, sync_unmap)
>>  			     ),
>>    	    TP_fast_assign(
>> @@ -284,10 +285,11 @@ TRACE_EVENT(amdgpu_vm_bo_unmap,
>>  			   __entry->last =3D mapping->last;
>>  			   __entry->offset =3D mapping->offset;
>>  			   __entry->flags =3D mapping->flags;
>> +			   __entry->sync_unmap =3D mapping->sync_unmap;
>>  			   ),
>> -	    TP_printk("bo=3D%p, start=3D%lx, last=3D%lx, offset=3D%010llx,=
 flags=3D%llx",
>> +	    TP_printk("bo=3D%p, start=3D%lx, last=3D%lx, offset=3D%010llx,=
 flags=3D%llx, sync_unmap=3D%d",
>>  		      __entry->bo, __entry->start, __entry->last,
>> -		      __entry->offset, __entry->flags)
>> +		      __entry->offset, __entry->flags, =
__entry->sync_unmap)
>>  );
>>    DECLARE_EVENT_CLASS(amdgpu_vm_mapping,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index 7b9762f1cddd..a74472e16952 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -844,6 +844,7 @@ static void amdgpu_vm_tlb_seq_cb(struct dma_fence =
*fence,
>>   * @immediate: immediate submission in a page fault
>>   * @unlocked: unlocked invalidation during MM callback
>>   * @flush_tlb: trigger tlb invalidation after update completed
>> + * @sync_unmap: wait for BO users before unmapping
>>   * @resv: fences we need to sync to
>>   * @start: start of mapped range
>>   * @last: last mapped entry
>> @@ -861,8 +862,9 @@ static void amdgpu_vm_tlb_seq_cb(struct dma_fence =
*fence,
>>   */
>>  int amdgpu_vm_update_range(struct amdgpu_device *adev, struct =
amdgpu_vm *vm,
>>  			   bool immediate, bool unlocked, bool =
flush_tlb,
>> -			   struct dma_resv *resv, uint64_t start, =
uint64_t last,
>> -			   uint64_t flags, uint64_t offset, uint64_t =
vram_base,
>> +			   bool sync_unmap, struct dma_resv *resv,
>> +			   uint64_t start, uint64_t last, uint64_t =
flags,
>> +			   uint64_t offset, uint64_t vram_base,
>>  			   struct ttm_resource *res, dma_addr_t =
*pages_addr,
>>  			   struct dma_fence **fence)
>>  {
>> @@ -902,7 +904,7 @@ int amdgpu_vm_update_range(struct amdgpu_device =
*adev, struct amdgpu_vm *vm,
>>  	/* Implicitly sync to command submissions in the same VM before
>>  	 * unmapping. Sync to moving fences before mapping.
>>  	 */
>> -	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)))
>> +	if (!(flags & (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)) && =
sync_unmap)
>>  		sync_mode =3D AMDGPU_SYNC_EQ_OWNER;
>>  	else
>>  		sync_mode =3D AMDGPU_SYNC_EXPLICIT;
>> @@ -1145,10 +1147,10 @@ int amdgpu_vm_bo_update(struct amdgpu_device =
*adev, struct amdgpu_bo_va *bo_va,
>>  		trace_amdgpu_vm_bo_update(mapping);
>>    		r =3D amdgpu_vm_update_range(adev, vm, false, false, =
flush_tlb,
>> -					   resv, mapping->start, =
mapping->last,
>> -					   update_flags, =
mapping->offset,
>> -					   vram_base, mem, pages_addr,
>> -					   last_update);
>> +					   true, resv, mapping->start,
>> +					   mapping->last, update_flags,
>> +					   mapping->offset, vram_base, =
mem,
>> +					   pages_addr, last_update);
>>  		if (r)
>>  			return r;
>>  	}
>> @@ -1340,7 +1342,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device =
*adev,
>>  		    mapping->start < AMDGPU_GMC_HOLE_START)
>>  			init_pte_value =3D AMDGPU_PTE_DEFAULT_ATC;
>>  -		r =3D amdgpu_vm_update_range(adev, vm, false, false, =
true, resv,
>> +		r =3D amdgpu_vm_update_range(adev, vm, false, false, =
true,
>> +					   mapping->sync_unmap, resv,
>>  					   mapping->start, =
mapping->last,
>>  					   init_pte_value, 0, 0, NULL, =
NULL,
>>  					   &f);
>> @@ -1572,6 +1575,7 @@ int amdgpu_vm_bo_map(struct amdgpu_device =
*adev,
>>   * @offset: requested offset in the BO
>>   * @size: BO size in bytes
>>   * @flags: attributes of pages (read/write/valid/etc.)
>> + * @sync_unmap: wait for BO users before replacing existing mapping
>>   *
>>   * Add a mapping of the BO at the specefied addr into the VM. =
Replace existing
>>   * mappings as we do so.
>> @@ -1582,9 +1586,9 @@ int amdgpu_vm_bo_map(struct amdgpu_device =
*adev,
>>   * Object has to be reserved and unreserved outside!
>>   */
>>  int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
>> -			     struct amdgpu_bo_va *bo_va,
>> -			     uint64_t saddr, uint64_t offset,
>> -			     uint64_t size, uint64_t flags)
>> +			     struct amdgpu_bo_va *bo_va, uint64_t saddr,
>> +			     uint64_t offset, uint64_t size, uint64_t =
flags,
>> +			     bool sync_unmap)
>>  {
>>  	struct amdgpu_bo_va_mapping *mapping;
>>  	struct amdgpu_bo *bo =3D bo_va->base.bo;
>> @@ -1608,7 +1612,7 @@ int amdgpu_vm_bo_replace_map(struct =
amdgpu_device *adev,
>>  	if (!mapping)
>>  		return -ENOMEM;
>>  -	r =3D amdgpu_vm_bo_clear_mappings(adev, bo_va->base.vm, saddr, =
size);
>> +	r =3D amdgpu_vm_bo_clear_mappings(adev, bo_va->base.vm, saddr, =
size, sync_unmap);
>>  	if (r) {
>>  		kfree(mapping);
>>  		return r;
>> @@ -1633,6 +1637,7 @@ int amdgpu_vm_bo_replace_map(struct =
amdgpu_device *adev,
>>   * @adev: amdgpu_device pointer
>>   * @bo_va: bo_va to remove the address from
>>   * @saddr: where to the BO is mapped
>> + * @sync_unmap: wait for BO users before unmapping
>>   *
>>   * Remove a mapping of the BO at the specefied addr from the VM.
>>   *
>> @@ -1641,9 +1646,8 @@ int amdgpu_vm_bo_replace_map(struct =
amdgpu_device *adev,
>>   *
>>   * Object has to be reserved and unreserved outside!
>>   */
>> -int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>> -		       struct amdgpu_bo_va *bo_va,
>> -		       uint64_t saddr)
>> +int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct =
amdgpu_bo_va *bo_va,
>> +		       uint64_t saddr, bool sync_unmap)
>>  {
>>  	struct amdgpu_bo_va_mapping *mapping;
>>  	struct amdgpu_vm *vm =3D bo_va->base.vm;
>> @@ -1671,6 +1675,7 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device =
*adev,
>>  	list_del(&mapping->list);
>>  	amdgpu_vm_it_remove(mapping, &vm->va);
>>  	mapping->bo_va =3D NULL;
>> +	mapping->sync_unmap =3D sync_unmap;
>>  	trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>>    	if (valid)
>> @@ -1689,6 +1694,7 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device =
*adev,
>>   * @vm: VM structure to use
>>   * @saddr: start of the range
>>   * @size: size of the range
>> + * @sync_unmap: wait for BO users before unmapping
>>   *
>>   * Remove all mappings in a range, split them as appropriate.
>>   *
>> @@ -1696,8 +1702,8 @@ int amdgpu_vm_bo_unmap(struct amdgpu_device =
*adev,
>>   * 0 for success, error for failure.
>>   */
>>  int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>> -				struct amdgpu_vm *vm,
>> -				uint64_t saddr, uint64_t size)
>> +				struct amdgpu_vm *vm, uint64_t saddr,
>> +				uint64_t size, bool sync_unmap)
>>  {
>>  	struct amdgpu_bo_va_mapping *before, *after, *tmp, *next;
>>  	LIST_HEAD(removed);
>> @@ -1761,6 +1767,7 @@ int amdgpu_vm_bo_clear_mappings(struct =
amdgpu_device *adev,
>>  		    tmp->last =3D eaddr;
>>    		tmp->bo_va =3D NULL;
>> +		tmp->sync_unmap =3D sync_unmap;
>>  		list_add(&tmp->list, &vm->freed);
>>  		trace_amdgpu_vm_bo_unmap(NULL, tmp);
>>  	}
>> @@ -1889,6 +1896,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device =
*adev,
>>  		list_del(&mapping->list);
>>  		amdgpu_vm_it_remove(mapping, &vm->va);
>>  		mapping->bo_va =3D NULL;
>> +		mapping->sync_unmap =3D true;
>>  		trace_amdgpu_vm_bo_unmap(bo_va, mapping);
>>  		list_add(&mapping->list, &vm->freed);
>>  	}
>> @@ -2617,8 +2625,9 @@ bool amdgpu_vm_handle_fault(struct =
amdgpu_device *adev, u32 pasid,
>>  		goto error_unlock;
>>  	}
>>  -	r =3D amdgpu_vm_update_range(adev, vm, true, false, false, NULL, =
addr,
>> -				   addr, flags, value, 0, NULL, NULL, =
NULL);
>> +	r =3D amdgpu_vm_update_range(adev, vm, true, false, false, true, =
NULL,
>> +				   addr, addr, flags, value, 0, NULL, =
NULL,
>> +				   NULL);
>>  	if (r)
>>  		goto error_unlock;
>>  diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> index 204ab13184ed..73b7b49fdb2e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> @@ -423,12 +423,12 @@ void amdgpu_vm_bo_base_init(struct =
amdgpu_vm_bo_base *base,
>>  			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
>>  int amdgpu_vm_update_range(struct amdgpu_device *adev, struct =
amdgpu_vm *vm,
>>  			   bool immediate, bool unlocked, bool =
flush_tlb,
>> -			   struct dma_resv *resv, uint64_t start, =
uint64_t last,
>> -			   uint64_t flags, uint64_t offset, uint64_t =
vram_base,
>> +			   bool sync_unmap, struct dma_resv *resv,
>> +			   uint64_t start, uint64_t last, uint64_t =
flags,
>> +			   uint64_t offset, uint64_t vram_base,
>>  			   struct ttm_resource *res, dma_addr_t =
*pages_addr,
>>  			   struct dma_fence **fence);
>> -int amdgpu_vm_bo_update(struct amdgpu_device *adev,
>> -			struct amdgpu_bo_va *bo_va,
>> +int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct =
amdgpu_bo_va *bo_va,
>>  			bool clear);
>>  bool amdgpu_vm_evictable(struct amdgpu_bo *bo);
>>  void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
>> @@ -444,15 +444,14 @@ int amdgpu_vm_bo_map(struct amdgpu_device =
*adev,
>>  		     uint64_t addr, uint64_t offset,
>>  		     uint64_t size, uint64_t flags);
>>  int amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,
>> -			     struct amdgpu_bo_va *bo_va,
>> -			     uint64_t addr, uint64_t offset,
>> -			     uint64_t size, uint64_t flags);
>> -int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,
>> -		       struct amdgpu_bo_va *bo_va,
>> -		       uint64_t addr);
>> +			     struct amdgpu_bo_va *bo_va, uint64_t addr,
>> +			     uint64_t offset, uint64_t size, uint64_t =
flags,
>> +			     bool sync_unmap);
>> +int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, struct =
amdgpu_bo_va *bo_va,
>> +		       uint64_t addr, bool sync_unmap);
>>  int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>> -				struct amdgpu_vm *vm,
>> -				uint64_t saddr, uint64_t size);
>> +				struct amdgpu_vm *vm, uint64_t saddr,
>> +				uint64_t size, bool sync_unmap);
>>  struct amdgpu_bo_va_mapping *amdgpu_vm_bo_lookup_mapping(struct =
amdgpu_vm *vm,
>>  							 uint64_t addr);
>>  void amdgpu_vm_bo_trace_cs(struct amdgpu_vm *vm, struct =
ww_acquire_ctx *ticket);
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c =
b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> index bb16b795d1bc..6eb4a0a4bc84 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>> @@ -1291,9 +1291,9 @@ svm_range_unmap_from_gpu(struct amdgpu_device =
*adev, struct amdgpu_vm *vm,
>>    	pr_debug("[0x%llx 0x%llx]\n", start, last);
>>  -	return amdgpu_vm_update_range(adev, vm, false, true, true, NULL, =
start,
>> -				      last, init_pte_value, 0, 0, NULL, =
NULL,
>> -				      fence);
>> +	return amdgpu_vm_update_range(adev, vm, false, true, true, true, =
NULL,
>> +				      start, last, init_pte_value, 0, 0, =
NULL,
>> +				      NULL, fence);
>>  }
>>    static int
>> @@ -1398,12 +1398,12 @@ svm_range_map_to_gpu(struct =
kfd_process_device *pdd, struct svm_range *prange,
>>  		 * different memory partition based on fpfn/lpfn, we =
should use
>>  		 * same vm_manager.vram_base_offset regardless memory =
partition.
>>  		 */
>> -		r =3D amdgpu_vm_update_range(adev, vm, false, false, =
flush_tlb, NULL,
>> -					   last_start, prange->start + =
i,
>> -					   pte_flags,
>> -					   (last_start - prange->start) =
<< PAGE_SHIFT,
>> -					   bo_adev ? =
bo_adev->vm_manager.vram_base_offset : 0,
>> -					   NULL, dma_addr, =
&vm->last_update);
>> +		r =3D amdgpu_vm_update_range(
>> +			adev, vm, false, false, flush_tlb, true, NULL,
>> +			last_start, prange->start + i, pte_flags,
>> +			(last_start - prange->start) << PAGE_SHIFT,
>> +			bo_adev ? bo_adev->vm_manager.vram_base_offset : =
0,
>> +			NULL, dma_addr, &vm->last_update);
>>    		for (j =3D last_start - prange->start; j <=3D i; j++)
>>  			dma_addr[j] |=3D last_domain;
>> diff --git a/include/uapi/drm/amdgpu_drm.h =
b/include/uapi/drm/amdgpu_drm.h
>> index f477eda6a2b8..3cdcc299956e 100644
>> --- a/include/uapi/drm/amdgpu_drm.h
>> +++ b/include/uapi/drm/amdgpu_drm.h
>> @@ -556,6 +556,8 @@ struct drm_amdgpu_gem_op {
>>  #define AMDGPU_VM_MTYPE_RW		(5 << 5)
>>  /* don't allocate MALL */
>>  #define AMDGPU_VM_PAGE_NOALLOC		(1 << 9)
>> +/* don't sync on unmap */
>> +#define AMDGPU_VM_EXPLICIT_SYNC		(1 << 10)
>>    struct drm_amdgpu_gem_va {
>>  	/** GEM object handle */


--Apple-Mail=_D785BDF5-C81B-494C-BD0C-05FC32A4822F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><div><blockquote type=3D"cite"><div>On Nov 6, 2023, =
at 22:44, Christian K=C3=B6nig &lt;christian.koenig@amd.com&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div><meta =
charset=3D"UTF-8"><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">&nbsp;</span><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Am 02.11.23 um 15:04 schrieb Tatsuyuki =
Ishi:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;">In Vulkan, it is the application's =
responsibility to perform adequate<br>synchronization before a sparse =
unmap, replace or BO destroy operation.<br>Until now, the kernel applied =
the same rule as implicitly-synchronized<br>APIs like OpenGL, which with =
per-VM BOs made page table updates stall the<br>queue completely. The =
newly added AMDGPU_VM_EXPLICIT_SYNC flag allows<br>drivers to opt-out of =
this behavior, while still ensuring adequate implicit<br>sync happens =
for kernel-initiated updates (e.g. BO moves).<br><br>We record whether =
to use implicit sync or not for each freed mapping. To<br>avoid =
increasing the mapping struct's size, this is union-ized with =
the<br>interval tree field which is unused after the unmap.<br><br>The =
reason this is done with a GEM ioctl flag, instead of being a VM =
/<br>context global setting, is that the current libdrm implementation =
shares<br>the DRM handle even between different kind of drivers =
(radeonsi vs radv).<br></blockquote><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">It =
would be nice if we could make this more future prove by not using a =
flag, but rather a =
drm_syncobj.</span></div></blockquote><div><br></div><div>There is =
asynchronous VM_BIND and synchronous VM_BIND. Using syncobjs address =
asynchronous binds, but what this patch set solves is to add an =
explicitly synced synchronous bind.</div><div><br></div><div>Even within =
Vulkan, there are use cases for synchronous binds. This is when a =
non-sparse BO is destroyed (or created but that=E2=80=99s not =
synchronized). Such operations should still be explicit sync, unlike =
OpenGL where it syncs to previous submissions. So adding asynchronous =
bind doesn=E2=80=99t supersede this =
need.</div><div><br></div><div>I=E2=80=99ve also thought whether we can =
just make the unmap asynchronous, since the spec requires that destroyed =
stuff are not accessed in any way, but I think it will complicate =
behavior when the destruction of BO immediately =
follows.</div><div><br></div><div>We should implement asynchronous bind =
someday to make vkQueueBindSparse work (even) better, but that will =
likely involve a larger scope including the scheduler. Getting =
synchronous but explicitly synced binds should be simpler and a good =
incremental =
step.</div><div><br></div><div>Tatsuyuki.</div><br><blockquote =
type=3D"cite"><div><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">You can =
extend the drm_amdgpu_gem_va structure by adding a drm_syncobj handle =
and timeline point at the end.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">If the =
syncobj/timeline point results in a fence we give that as input =
dependency the operation has to wait for.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">And =
output fence can come later on as well, but that one is much more harder =
to handle.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">Regards,</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Christian.</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br>Signed-off-by: Tatsuyuki Ishi =
&lt;ishitatsuyuki@gmail.com&gt;<br>---<br>&nbsp;.../gpu/drm/amd/amdgpu/amd=
gpu_amdkfd_gpuvm.c &nbsp;| &nbsp;2 =
+-<br>&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;2 =
+-<br>&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 14 =
++++--<br>&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_object.h =
&nbsp;&nbsp;&nbsp;| &nbsp;7 =
++-<br>&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h =
&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;6 =
++-<br>&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 47 =
+++++++++++--------<br>&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 23 =
+++++----<br>&nbsp;drivers/gpu/drm/amd/amdkfd/kfd_svm.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 18 =
+++----<br>&nbsp;include/uapi/drm/amdgpu_drm.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;| &nbsp;2 +<br>&nbsp;9 files changed, 71 =
insertions(+), 50 deletions(-)<br><br>diff --git =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>index =
7d6daf8d2bfa..10e129bff977 100644<br>--- =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>+++ =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>@@ -1196,7 +1196,7 =
@@ static void unmap_bo_from_gpuvm(struct kgd_mem *mem,<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
amdgpu_device *adev =3D entry-&gt;adev;<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
amdgpu_vm *vm =3D bo_va-&gt;base.vm;<br>&nbsp;-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>amdgpu_vm_bo_unmap(adev, bo_va, entry-&gt;va);<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>amdgpu_vm_bo_unmap(adev, bo_va, entry-&gt;va, =
true);<br>&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>amdgpu_vm_clear_freed(adev, vm, =
&amp;bo_va-&gt;last_pt_update);<br>&nbsp;diff --git =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c<br>index =
720011019741..612279e65bff 100644<br>--- =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c<br>+++ =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c<br>@@ -122,7 +122,7 @@ int =
amdgpu_unmap_static_csa(struct amdgpu_device *adev, struct amdgpu_vm =
*vm,<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>}<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br>&nbsp;-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_bo_unmap(adev, bo_va, csa_addr);<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_bo_unmap(adev, bo_va, csa_addr, true);<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if (r) =
{<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>DRM_ERROR("failed to do bo_unmap on static CSA, err=3D%d\n", =
r);<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>goto error;<br>diff --git =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>index =
a1b15d0d6c48..cca68b89754e 100644<br>--- =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>+++ =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c<br>@@ -667,9 +667,9 @@ int =
amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>const =
uint32_t valid_flags =3D AMDGPU_VM_DELAY_UPDATE |<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>AMDGPU_VM_PAGE_READABLE | AMDGPU_VM_PAGE_WRITEABLE =
|<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>AMDGPU_VM_PAGE_EXECUTABLE | AMDGPU_VM_MTYPE_MASK |<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>AMDGPU_VM_PAGE_NOALLOC;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>AMDGPU_VM_PAGE_NOALLOC | =
AMDGPU_VM_EXPLICIT_SYNC;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>const uint32_t prt_flags =3D =
AMDGPU_VM_DELAY_UPDATE |<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>AMDGPU_VM_PAGE_PRT;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>AMDGPU_VM_PAGE_PRT | =
AMDGPU_VM_EXPLICIT_SYNC;<br>&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
drm_amdgpu_gem_va *args =3D data;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct drm_gem_object =
*gobj;<br>@@ -680,6 +680,7 @@ int amdgpu_gem_va_ioctl(struct drm_device =
*dev, void *data,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct drm_exec =
exec;<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>uint64_t va_flags;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>uint64_t vm_size;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bool =
sync_unmap;<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>int r =3D 0;<br>&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(args-&gt;va_address &lt; AMDGPU_VA_RESERVED_SIZE) {<br>@@ -715,6 +716,8 =
@@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void =
*data,<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>return -EINVAL;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br>&nbsp;+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>sync_unmap =3D !(args-&gt;flags &amp; =
AMDGPU_VM_EXPLICIT_SYNC);<br>+<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>switch (args-&gt;operation) =
{<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>case AMDGPU_VA_OP_MAP:<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>case AMDGPU_VA_OP_UNMAP:<br>@@ =
-774,19 +777,20 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void =
*data,<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;va_fl=
ags);<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>break;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>case =
AMDGPU_VA_OP_UNMAP:<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r =3D amdgpu_vm_bo_unmap(adev, =
bo_va, args-&gt;va_address);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r =3D amdgpu_vm_bo_unmap(adev, =
bo_va, args-&gt;va_address,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;sync_unmap);<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>break;<br>&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>case =
AMDGPU_VA_OP_CLEAR:<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_bo_clear_mappings(adev, &amp;fpriv-&gt;vm,<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>args-&gt;va_address,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>args-&gt;map_size);<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>args-&gt;map_size, sync_unmap);<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>break;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>case =
AMDGPU_VA_OP_REPLACE:<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>va_flags =3D =
amdgpu_gem_va_map_flags(adev, args-&gt;flags);<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_bo_replace_map(adev, bo_va, =
args-&gt;va_address,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;args-=
&gt;offset_in_bo, args-&gt;map_size,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;va_fl=
ags);<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;va_fl=
ags, sync_unmap);<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>break;<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>default:<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>break;<br>diff --git =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h<br>index =
f3ee83cdf97e..28be03f1bbcf 100644<br>--- =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h<br>+++ =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h<br>@@ -67,7 +67,12 @@ =
struct amdgpu_bo_va_mapping {<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct rb_node<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>rb;<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>uint64_t<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>start;<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>uint64_t<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>last;<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>uint64_t<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>__subtree_last;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>union {<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/* BOs in =
interval tree only */<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>uint64_t<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>__subtree_last;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>/* Freed BOs only */<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bool<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>sync_unmap;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>};<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>uint64_t<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>offset;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>uint64_t<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>flags;<br>&nbsp;};<br>diff --git =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>index =
2fd1bfb35916..e71443c8c59b 100644<br>--- =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>+++ =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h<br>@@ -276,6 +276,7 @@ =
TRACE_EVENT(amdgpu_vm_bo_unmap,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;__fie=
ld(long, last)<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;__fie=
ld(u64, offset)<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;__fie=
ld(u64, flags)<br>+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;__fie=
ld(bool, sync_unmap)<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;),<br=
>&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;TP_fast_ass=
ign(<br>@@ -284,10 +285,11 @@ =
TRACE_EVENT(amdgpu_vm_bo_unmap,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;__entry-&gt;last =
=3D mapping-&gt;last;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;__entry-&gt;offse=
t =3D mapping-&gt;offset;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;__entry-&gt;flags=
 =3D mapping-&gt;flags;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;__entry-&gt;sync_=
unmap =3D mapping-&gt;sync_unmap;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;),<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;TP_printk("=
bo=3D%p, start=3D%lx, last=3D%lx, offset=3D%010llx, =
flags=3D%llx",<br>+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;TP_printk("=
bo=3D%p, start=3D%lx, last=3D%lx, offset=3D%010llx, flags=3D%llx, =
sync_unmap=3D%d",<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;__entry-&gt;bo, __entry-&gt;start, __entry-&gt;last,<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;__entry-&gt;offset, __entry-&gt;flags)<br>+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;__entry-&gt;offset, __entry-&gt;flags, =
__entry-&gt;sync_unmap)<br>&nbsp;);<br>&nbsp;&nbsp;&nbsp;DECLARE_EVENT_CLA=
SS(amdgpu_vm_mapping,<br>diff --git =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>index =
7b9762f1cddd..a74472e16952 100644<br>--- =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>+++ =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>@@ -844,6 +844,7 @@ static =
void amdgpu_vm_tlb_seq_cb(struct dma_fence *fence,<br>&nbsp;&nbsp;* =
@immediate: immediate submission in a page fault<br>&nbsp;&nbsp;* =
@unlocked: unlocked invalidation during MM callback<br>&nbsp;&nbsp;* =
@flush_tlb: trigger tlb invalidation after update completed<br>+ * =
@sync_unmap: wait for BO users before unmapping<br>&nbsp;&nbsp;* @resv: =
fences we need to sync to<br>&nbsp;&nbsp;* @start: start of mapped =
range<br>&nbsp;&nbsp;* @last: last mapped entry<br>@@ -861,8 +862,9 @@ =
static void amdgpu_vm_tlb_seq_cb(struct dma_fence =
*fence,<br>&nbsp;&nbsp;*/<br>&nbsp;int amdgpu_vm_update_range(struct =
amdgpu_device *adev, struct amdgpu_vm *vm,<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;bool immediate, =
bool unlocked, bool flush_tlb,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;struct dma_resv =
*resv, uint64_t start, uint64_t last,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;uint64_t flags, =
uint64_t offset, uint64_t vram_base,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;bool =
sync_unmap, struct dma_resv *resv,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;uint64_t start, =
uint64_t last, uint64_t flags,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;uint64_t =
offset, uint64_t vram_base,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;struct =
ttm_resource *res, dma_addr_t *pages_addr,<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;struct =
dma_fence **fence)<br>&nbsp;{<br>@@ -902,7 +904,7 @@ int =
amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm =
*vm,<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>/* Implicitly sync to command submissions in the same VM =
before<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-converted-space">&nbsp;</span>* =
unmapping. Sync to moving fences before mapping.<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(!(flags &amp; (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)))<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(!(flags &amp; (AMDGPU_PTE_VALID | AMDGPU_PTE_PRT)) &amp;&amp; =
sync_unmap)<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>sync_mode =3D AMDGPU_SYNC_EQ_OWNER;<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>else<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>sync_mode =3D AMDGPU_SYNC_EXPLICIT;<br>@@ -1145,10 =
+1147,10 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct =
amdgpu_bo_va *bo_va,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	=
</span>trace_amdgpu_vm_bo_update(mapping);<br>&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_update_range(adev, vm, false, false, flush_tlb,<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;resv, =
mapping-&gt;start, mapping-&gt;last,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;update_flags, =
mapping-&gt;offset,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;vram_base, mem, =
pages_addr,<br>-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;last_update);<br>=
+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;true, resv, =
mapping-&gt;start,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;mapping-&gt;last,=
 update_flags,<br>+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;mapping-&gt;offse=
t, vram_base, mem,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;pages_addr, =
last_update);<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (r)<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
r;<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>}<br>@@ -1340,7 +1342,8 @@ int amdgpu_vm_clear_freed(struct =
amdgpu_device *adev,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;mapping-&gt=
;start &lt; AMDGPU_GMC_HOLE_START)<br>&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>init_pte_value =3D =
AMDGPU_PTE_DEFAULT_ATC;<br>&nbsp;-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_update_range(adev, vm, false, false, true, resv,<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_update_range(adev, vm, false, false, true,<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;mapping-&gt;sync_=
unmap, resv,<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;mapping-&gt;start=
, mapping-&gt;last,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;init_pte_value, =
0, 0, NULL, NULL,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&amp;f);<br>@@ =
-1572,6 +1575,7 @@ int amdgpu_vm_bo_map(struct amdgpu_device =
*adev,<br>&nbsp;&nbsp;* @offset: requested offset in the =
BO<br>&nbsp;&nbsp;* @size: BO size in bytes<br>&nbsp;&nbsp;* @flags: =
attributes of pages (read/write/valid/etc.)<br>+ * @sync_unmap: wait for =
BO users before replacing existing =
mapping<br>&nbsp;&nbsp;*<br>&nbsp;&nbsp;* Add a mapping of the BO at the =
specefied addr into the VM. Replace existing<br>&nbsp;&nbsp;* mappings =
as we do so.<br>@@ -1582,9 +1586,9 @@ int amdgpu_vm_bo_map(struct =
amdgpu_device *adev,<br>&nbsp;&nbsp;* Object has to be reserved and =
unreserved outside!<br>&nbsp;&nbsp;*/<br>&nbsp;int =
amdgpu_vm_bo_replace_map(struct amdgpu_device *adev,<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;struc=
t amdgpu_bo_va *bo_va,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;uint6=
4_t saddr, uint64_t offset,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;uint6=
4_t size, uint64_t flags)<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;struc=
t amdgpu_bo_va *bo_va, uint64_t saddr,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;uint6=
4_t offset, uint64_t size, uint64_t flags,<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;bool =
sync_unmap)<br>&nbsp;{<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct amdgpu_bo_va_mapping =
*mapping;<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>struct amdgpu_bo *bo =3D bo_va-&gt;base.bo;<br>@@ -1608,7 =
+1612,7 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device =
*adev,<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>if (!mapping)<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return -ENOMEM;<br>&nbsp;-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_bo_clear_mappings(adev, bo_va-&gt;base.vm, saddr, =
size);<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>r =3D amdgpu_vm_bo_clear_mappings(adev, bo_va-&gt;base.vm, saddr, =
size, sync_unmap);<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (r) {<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>kfree(mapping);<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return r;<br>@@ -1633,6 +1637,7 =
@@ int amdgpu_vm_bo_replace_map(struct amdgpu_device =
*adev,<br>&nbsp;&nbsp;* @adev: amdgpu_device pointer<br>&nbsp;&nbsp;* =
@bo_va: bo_va to remove the address from<br>&nbsp;&nbsp;* @saddr: where =
to the BO is mapped<br>+ * @sync_unmap: wait for BO users before =
unmapping<br>&nbsp;&nbsp;*<br>&nbsp;&nbsp;* Remove a mapping of the BO =
at the specefied addr from the VM.<br>&nbsp;&nbsp;*<br>@@ -1641,9 =
+1646,8 @@ int amdgpu_vm_bo_replace_map(struct amdgpu_device =
*adev,<br>&nbsp;&nbsp;*<br>&nbsp;&nbsp;* Object has to be reserved and =
unreserved outside!<br>&nbsp;&nbsp;*/<br>-int amdgpu_vm_bo_unmap(struct =
amdgpu_device *adev,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;struct amdgpu_bo_va *bo_va,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;uint64_t saddr)<br>+int amdgpu_vm_bo_unmap(struct amdgpu_device =
*adev, struct amdgpu_bo_va *bo_va,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;uint64_t saddr, bool sync_unmap)<br>&nbsp;{<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
amdgpu_bo_va_mapping *mapping;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct amdgpu_vm *vm =3D =
bo_va-&gt;base.vm;<br>@@ -1671,6 +1675,7 @@ int =
amdgpu_vm_bo_unmap(struct amdgpu_device *adev,<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>list_del(&amp;mapping-&gt;list);<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>amdgpu_vm_it_remove(mapping, &amp;vm-&gt;va);<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mapping-&gt;bo_va =3D NULL;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mapping-&gt;sync_unmap =3D =
sync_unmap;<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>trace_amdgpu_vm_bo_unmap(bo_va, =
mapping);<br>&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (valid)<br>@@ -1689,6 +1694,7 =
@@ int amdgpu_vm_bo_unmap(struct amdgpu_device *adev,<br>&nbsp;&nbsp;* =
@vm: VM structure to use<br>&nbsp;&nbsp;* @saddr: start of the =
range<br>&nbsp;&nbsp;* @size: size of the range<br>+ * @sync_unmap: wait =
for BO users before unmapping<br>&nbsp;&nbsp;*<br>&nbsp;&nbsp;* Remove =
all mappings in a range, split them as =
appropriate.<br>&nbsp;&nbsp;*<br>@@ -1696,8 +1702,8 @@ int =
amdgpu_vm_bo_unmap(struct amdgpu_device *adev,<br>&nbsp;&nbsp;* 0 for =
success, error for failure.<br>&nbsp;&nbsp;*/<br>&nbsp;int =
amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
amdgpu_vm *vm,<br>-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>uint64_t saddr, uint64_t size)<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
amdgpu_vm *vm, uint64_t saddr,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>uint64_t size, bool =
sync_unmap)<br>&nbsp;{<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>struct amdgpu_bo_va_mapping =
*before, *after, *tmp, *next;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>LIST_HEAD(removed);<br>@@ -1761,6 =
+1767,7 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device =
*adev,<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;tmp-&gt;las=
t =3D eaddr;<br>&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>tmp-&gt;bo_va =3D NULL;<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>tmp-&gt;sync_unmap =3D sync_unmap;<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>list_add(&amp;tmp-&gt;list, &amp;vm-&gt;freed);<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>trace_amdgpu_vm_bo_unmap(NULL, tmp);<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br>@@ =
-1889,6 +1896,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device =
*adev,<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>list_del(&amp;mapping-&gt;list);<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>amdgpu_vm_it_remove(mapping, &amp;vm-&gt;va);<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>mapping-&gt;bo_va =3D NULL;<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>mapping-&gt;sync_unmap =3D =
true;<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>trace_amdgpu_vm_bo_unmap(bo_va, mapping);<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>list_add(&amp;mapping-&gt;list, =
&amp;vm-&gt;freed);<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br>@@ -2617,8 +2625,9 @@ bool =
amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 =
pasid,<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>goto error_unlock;<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br>&nbsp;-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_update_range(adev, vm, true, false, false, NULL, =
addr,<br>-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;addr, flags, =
value, 0, NULL, NULL, NULL);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_update_range(adev, vm, true, false, false, true, =
NULL,<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;addr, addr, =
flags, value, 0, NULL, NULL,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;NULL);<br>&nbsp;<=
span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (r)<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>goto error_unlock;<br>&nbsp;diff =
--git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>index =
204ab13184ed..73b7b49fdb2e 100644<br>--- =
a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>+++ =
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h<br>@@ -423,12 +423,12 @@ void =
amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;struct =
amdgpu_vm *vm, struct amdgpu_bo *bo);<br>&nbsp;int =
amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm =
*vm,<br>&nbsp;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;bool immediate, =
bool unlocked, bool flush_tlb,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;struct dma_resv =
*resv, uint64_t start, uint64_t last,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;uint64_t flags, =
uint64_t offset, uint64_t vram_base,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;bool =
sync_unmap, struct dma_resv *resv,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;uint64_t start, =
uint64_t last, uint64_t flags,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;uint64_t =
offset, uint64_t vram_base,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;struct =
ttm_resource *res, dma_addr_t *pages_addr,<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;struct =
dma_fence **fence);<br>-int amdgpu_vm_bo_update(struct amdgpu_device =
*adev,<br>-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>struct amdgpu_bo_va *bo_va,<br>+int amdgpu_vm_bo_update(struct =
amdgpu_device *adev, struct amdgpu_bo_va *bo_va,<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>bool =
clear);<br>&nbsp;bool amdgpu_vm_evictable(struct amdgpu_bo =
*bo);<br>&nbsp;void amdgpu_vm_bo_invalidate(struct amdgpu_device =
*adev,<br>@@ -444,15 +444,14 @@ int amdgpu_vm_bo_map(struct =
amdgpu_device *adev,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;uint6=
4_t addr, uint64_t offset,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;uint6=
4_t size, uint64_t flags);<br>&nbsp;int amdgpu_vm_bo_replace_map(struct =
amdgpu_device *adev,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;struc=
t amdgpu_bo_va *bo_va,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;uint6=
4_t addr, uint64_t offset,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;uint6=
4_t size, uint64_t flags);<br>-int amdgpu_vm_bo_unmap(struct =
amdgpu_device *adev,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;struct amdgpu_bo_va *bo_va,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;uint64_t addr);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;struc=
t amdgpu_bo_va *bo_va, uint64_t addr,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;uint6=
4_t offset, uint64_t size, uint64_t flags,<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;bool =
sync_unmap);<br>+int amdgpu_vm_bo_unmap(struct amdgpu_device *adev, =
struct amdgpu_bo_va *bo_va,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;uint64_t addr, bool sync_unmap);<br>&nbsp;int =
amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
amdgpu_vm *vm,<br>-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>uint64_t saddr, uint64_t size);<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
amdgpu_vm *vm, uint64_t saddr,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>uint64_t size, bool =
sync_unmap);<br>&nbsp;struct amdgpu_bo_va_mapping =
*amdgpu_vm_bo_lookup_mapping(struct amdgpu_vm *vm,<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>uint64_t =
addr);<br>&nbsp;void amdgpu_vm_bo_trace_cs(struct amdgpu_vm *vm, struct =
ww_acquire_ctx *ticket);<br>diff --git =
a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c =
b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c<br>index =
bb16b795d1bc..6eb4a0a4bc84 100644<br>--- =
a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c<br>+++ =
b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c<br>@@ -1291,9 +1291,9 @@ =
svm_range_unmap_from_gpu(struct amdgpu_device *adev, struct amdgpu_vm =
*vm,<br>&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>pr_debug("[0x%llx 0x%llx]\n", =
start, last);<br>&nbsp;-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return =
amdgpu_vm_update_range(adev, vm, false, true, true, NULL, =
start,<br>-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;last, init_pte_value, 0, 0, NULL, NULL,<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;fence);<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return amdgpu_vm_update_range(adev, vm, false, true, true, true, =
NULL,<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;start, last, init_pte_value, 0, 0, NULL,<br>+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;NULL, fence);<br>&nbsp;}<br>&nbsp;&nbsp;&nbsp;static int<br>@@ -1398,12 =
+1398,12 @@ svm_range_map_to_gpu(struct kfd_process_device *pdd, struct =
svm_range *prange,<br>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* different memory =
partition based on fpfn/lpfn, we should use<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>* same =
vm_manager.vram_base_offset regardless memory partition.<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>*/<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_update_range(adev, vm, false, false, flush_tlb, =
NULL,<br>-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;last_start, =
prange-&gt;start + i,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;pte_flags,<br>-<s=
pan class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;(last_start - =
prange-&gt;start) &lt;&lt; PAGE_SHIFT,<br>-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;bo_adev ? =
bo_adev-&gt;vm_manager.vram_base_offset : 0,<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;NULL, dma_addr, =
&amp;vm-&gt;last_update);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>r =3D =
amdgpu_vm_update_range(<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>adev, vm, false, false, =
flush_tlb, true, NULL,<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>last_start, prange-&gt;start + i, =
pte_flags,<br>+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>(last_start - prange-&gt;start) &lt;&lt; =
PAGE_SHIFT,<br>+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>bo_adev ? bo_adev-&gt;vm_manager.vram_base_offset : =
0,<br>+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>NULL, dma_addr, =
&amp;vm-&gt;last_update);<br>&nbsp;&nbsp;&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>for (j =3D =
last_start - prange-&gt;start; j &lt;=3D i; j++)<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>dma_addr[j] |=3D last_domain;<br>diff --git =
a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h<br>index =
f477eda6a2b8..3cdcc299956e 100644<br>--- =
a/include/uapi/drm/amdgpu_drm.h<br>+++ =
b/include/uapi/drm/amdgpu_drm.h<br>@@ -556,6 +556,8 @@ struct =
drm_amdgpu_gem_op {<br>&nbsp;#define AMDGPU_VM_MTYPE_RW<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>(5 =
&lt;&lt; 5)<br>&nbsp;/* don't allocate MALL */<br>&nbsp;#define =
AMDGPU_VM_PAGE_NOALLOC<span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>(1 &lt;&lt; 9)<br>+/* don't sync on unmap */<br>+#define =
AMDGPU_VM_EXPLICIT_SYNC<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>(1 &lt;&lt; =
10)<br>&nbsp;&nbsp;&nbsp;struct drm_amdgpu_gem_va {<br>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>/** GEM =
object handle */</blockquote></div></blockquote></div><br></body></html>=

--Apple-Mail=_D785BDF5-C81B-494C-BD0C-05FC32A4822F--
