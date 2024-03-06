Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A064873918
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1807E1125EF;
	Wed,  6 Mar 2024 14:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SrCBVRoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F43A11322B;
 Wed,  6 Mar 2024 14:29:14 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1dcce5e84bcso55894055ad.1; 
 Wed, 06 Mar 2024 06:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709735354; x=1710340154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6BJPk+nF2s8SJbHx5A0qKo3fTEzhCr5XKFS56tvgZrw=;
 b=SrCBVRoKXEMy9mhOK4JjvueSkMbejWiUCm7HkZB/THWlJJ7ArH5FRL/YFxBWFG5V+E
 qmEDjKPeIcxsnUGwld/Dy1nDxgD4A2/dcW0G/rTGU56peHap2SRm3BLtOCFCtTUfjtXZ
 v81haxUBQYV3magblDVghSsjU4ZGeRX8Xw/uhJUOzFc8Q0JvItvo18f1eV2njTSArkUN
 yXxJNuRHYcr4qXGytVovw4mCORhGBldJ1qVfQ8FjK6A34W3xpi472nqt/fsGCvIaXHiq
 3rhqHnJ5+kilbkNyFTGJuEGihaL2+N4uDWejqksokr8g5h9bfdPxqpfbwfWgu5Q5ujcb
 Wfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709735354; x=1710340154;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6BJPk+nF2s8SJbHx5A0qKo3fTEzhCr5XKFS56tvgZrw=;
 b=g/xLKIx8EBNcIQqdT1IVVSQKcCHiYozybL9u33RHh9pJxGTP1XGhvGaQc1RZOmeOgK
 DeYwpWwML+80LR3CiyNIDsu+gbmKb6MUT4EiaUln5ZxnVELIriz1rVIrr1PzS/SmtRWW
 9frJiyMqWluObZocGwzt6nvaJ8qQGOzs0CMbdTuVGkMZzVdfHDTgXRCrvhloW32/C0vf
 DyDTXd05V1NSObm5f1WcxyGp5uymxHS2NCTZPczUfyDpCkgPvfGRfEmSjl5YvL2ZX67T
 5rT0bSIqL2wd4Yb3zYWirE20DOPHi85FTUlETQJX8y0LtsM2r2hanWU3PyJJVX+3o9uI
 AFEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkt2b2ZRSkYyyyvSbs/fCAETz9XjS6lESQHcJNuM5CwtF3CRJFV99o8vHfXuj+n2y17VgejhjyH4zrqdJwoCpo0t0Ew+3rdBBHh6sJiOomC8RIwsSfTM3SeAvqER+nWU6Xp4bUugkegtT21RWFEA==
X-Gm-Message-State: AOJu0YzbYk/zE5YIChSZGoiSnFirSzGAdSEX1I46RyRZ5anC98Sq23vE
 uIxrBRLm2u4ua8T01R4Um5NL/l3jEICtmZGgVVYHo/wgOAiIwHOUU3ZgGBCsD16kCQ5HxcOHyws
 v4jZq1VNOidh0R81ihQ9BJfYtmg3QJKTRswg=
X-Google-Smtp-Source: AGHT+IGoP8Y2deM2LdARnpuZrV2fMX2Bw8NkQlSNzVdaewxYRTZsmevCNY/7EVO3PgkUsypAOs35UqnOCLzlJI96izo=
X-Received: by 2002:a17:902:c20c:b0:1dc:d6ba:ed4c with SMTP id
 12-20020a170902c20c00b001dcd6baed4cmr4881166pll.2.1709735353681; Wed, 06 Mar
 2024 06:29:13 -0800 (PST)
MIME-Version: 1.0
References: <20240306090408.3453152-1-sunil.khatri@amd.com>
 <2f792620-fd8a-412e-9130-e276ba36d5a0@amd.com>
 <5e2899cd-75b4-4ddd-97ff-4e10a2e67fbb@amd.com>
 <66815303-bd9c-4dfc-ae1a-bbdc5d1bb47c@amd.com>
 <17e12147-79dd-44ba-b8ae-b96fb72dcfbd@amd.com>
In-Reply-To: <17e12147-79dd-44ba-b8ae-b96fb72dcfbd@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Mar 2024 09:29:00 -0500
Message-ID: <CADnq5_OkeH1x4YgSv6uw0HLb5c-5NOXnzQPJHsDvb=NmEePB-A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
To: "Khatri, Sunil" <sukhatri@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sunil Khatri <sunil.khatri@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
 Pan@rtg-sunil-navi33.amd.com, Xinhui <Xinhui.Pan@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mukul Joshi <mukul.joshi@amd.com>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Mar 6, 2024 at 8:04=E2=80=AFAM Khatri, Sunil <sukhatri@amd.com> wro=
te:
>
>
> On 3/6/2024 6:12 PM, Christian K=C3=B6nig wrote:
> > Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
> >>
> >> On 3/6/2024 3:37 PM, Christian K=C3=B6nig wrote:
> >>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
> >>>> When an  page fault interrupt is raised there
> >>>> is a lot more information that is useful for
> >>>> developers to analyse the pagefault.
> >>>
> >>> Well actually those information are not that interesting because
> >>> they are hw generation specific.
> >>>
> >>> You should probably rather use the decoded strings here, e.g. hub,
> >>> client, xcc_id, node_id etc...
> >>>
> >>> See gmc_v9_0_process_interrupt() an example.
> >>> I saw this v9 does provide more information than what v10 and v11
> >>> provide like node_id and fault from which die but thats again very
> >>> specific to IP_VERSION(9, 4, 3)) i dont know why thats information
> >>> is not there in v10 and v11.
> >>
> >> I agree to your point but, as of now during a pagefault we are
> >> dumping this information which is useful like which client
> >> has generated an interrupt and for which src and other information
> >> like address. So i think to provide the similar information in the
> >> devcoredump.
> >>
> >> Currently we do not have all this information from either job or vm
> >> being derived from the job during a reset. We surely could add more
> >> relevant information later on as per request but this information is
> >> useful as
> >> eventually its developers only who would use the dump file provided
> >> by customer to debug.
> >>
> >> Below is the information that i dump in devcore and i feel that is
> >> good information but new information could be added which could be
> >> picked later.
> >>
> >>> Page fault information
> >>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
> >>> in page starting at address 0x0000000000000000 from client 0x1b (UTCL=
2)
> >
> > This is a perfect example what I mean. You record in the patch is the
> > client_id, but this is is basically meaningless unless you have access
> > to the AMD internal hw documentation.
> >
> > What you really need is the client in decoded form, in this case
> > UTCL2. You can keep the client_id additionally, but the decoded client
> > string is mandatory to have I think.
> >
> > Sure i am capturing that information as i am trying to minimise the
> > memory interaction to minimum as we are still in interrupt context
> > here that why i recorded the integer information compared to decoding
> and writing strings there itself but to postpone till we dump.
>
> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and client
> string from client id. So are we good to go with the information with
> the above information of sharing details in devcoredump using the
> additional information from pagefault cached.

I think amdgpu_vm_fault_info() has everything you need already (vmhub,
status, and addr).  client_id and src_id are just tokens in the
interrupt cookie so we know which IP to route the interrupt to.  We
know what they will be because otherwise we'd be in the interrupt
handler for a different IP.  I don't think ring_id has any useful
information in this context and vmid and pasid are probably not too
useful because they are just tokens to associate the fault with a
process.  It would be better to have the process name.

Alex

>
> regards
> sunil
>
> >
> > Regards,
> > Christian.
> >
> >>
> >> Regards
> >> Sunil Khatri
> >>
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>
> >>>> Add all such information in the last cached
> >>>> pagefault from an interrupt handler.
> >>>>
> >>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> >>>> ---
> >>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
> >>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
> >>>>   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
> >>>>   drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
> >>>>   drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
> >>>>   drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
> >>>>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
> >>>>   7 files changed, 18 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>> index 4299ce386322..b77e8e28769d 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
> >>>> amdgpu_vm *vm, struct seq_file *m)
> >>>>    * Cache the fault info for later use by userspace in debugging.
> >>>>    */
> >>>>   void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
> >>>> -                  unsigned int pasid,
> >>>> +                  struct amdgpu_iv_entry *entry,
> >>>>                     uint64_t addr,
> >>>>                     uint32_t status,
> >>>>                     unsigned int vmhub)
> >>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
> >>>> amdgpu_device *adev,
> >>>>         xa_lock_irqsave(&adev->vm_manager.pasids, flags);
> >>>>   -    vm =3D xa_load(&adev->vm_manager.pasids, pasid);
> >>>> +    vm =3D xa_load(&adev->vm_manager.pasids, entry->pasid);
> >>>>       /* Don't update the fault cache if status is 0.  In the multip=
le
> >>>>        * fault case, subsequent faults will return a 0 status which =
is
> >>>>        * useless for userspace and replaces the useful fault
> >>>> status, so
> >>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct
> >>>> amdgpu_device *adev,
> >>>>       if (vm && status) {
> >>>>           vm->fault_info.addr =3D addr;
> >>>>           vm->fault_info.status =3D status;
> >>>> +        vm->fault_info.client_id =3D entry->client_id;
> >>>> +        vm->fault_info.src_id =3D entry->src_id;
> >>>> +        vm->fault_info.vmid =3D entry->vmid;
> >>>> +        vm->fault_info.pasid =3D entry->pasid;
> >>>> +        vm->fault_info.ring_id =3D entry->ring_id;
> >>>>           if (AMDGPU_IS_GFXHUB(vmhub)) {
> >>>>               vm->fault_info.vmhub =3D AMDGPU_VMHUB_TYPE_GFX;
> >>>>               vm->fault_info.vmhub |=3D
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>> index 047ec1930d12..c7782a89bdb5 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
> >>>>       uint32_t    status;
> >>>>       /* which vmhub? gfxhub, mmhub, etc. */
> >>>>       unsigned int    vmhub;
> >>>> +    unsigned int    client_id;
> >>>> +    unsigned int    src_id;
> >>>> +    unsigned int    ring_id;
> >>>> +    unsigned int    pasid;
> >>>> +    unsigned int    vmid;
> >>>>   };
> >>>>     struct amdgpu_vm {
> >>>> @@ -605,7 +610,7 @@ static inline void
> >>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
> >>>>   }
> >>>>     void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
> >>>> -                  unsigned int pasid,
> >>>> +                  struct amdgpu_iv_entry *entry,
> >>>>                     uint64_t addr,
> >>>>                     uint32_t status,
> >>>>                     unsigned int vmhub);
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>> index d933e19e0cf5..6b177ce8db0e 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct
> >>>> amdgpu_device *adev,
> >>>>           status =3D RREG32(hub->vm_l2_pro_fault_status);
> >>>>           WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>   -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
> >>>> status,
> >>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
> >>>>                            entry->vmid_src ? AMDGPU_MMHUB0(0) :
> >>>> AMDGPU_GFXHUB(0));
> >>>>       }
> >>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>> index 527dc917e049..bcf254856a3e 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct
> >>>> amdgpu_device *adev,
> >>>>           status =3D RREG32(hub->vm_l2_pro_fault_status);
> >>>>           WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>   -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
> >>>> status,
> >>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
> >>>>                            entry->vmid_src ? AMDGPU_MMHUB0(0) :
> >>>> AMDGPU_GFXHUB(0));
> >>>>       }
> >>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>> @@ -1270,7 +1270,7 @@ static int gmc_v7_0_process_interrupt(struct
> >>>> amdgpu_device *adev,
> >>>>       if (!addr && !status)
> >>>>           return 0;
> >>>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>> +    amdgpu_vm_update_fault_cache(adev, entry,
> >>>>                        ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
> >>>> status, AMDGPU_GFXHUB(0));
> >>>>         if (amdgpu_vm_fault_stop =3D=3D AMDGPU_VM_FAULT_STOP_FIRST)
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>> index d20e5f20ee31..a271bf832312 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>> @@ -1438,7 +1438,7 @@ static int gmc_v8_0_process_interrupt(struct
> >>>> amdgpu_device *adev,
> >>>>       if (!addr && !status)
> >>>>           return 0;
> >>>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>> +    amdgpu_vm_update_fault_cache(adev, entry,
> >>>>                        ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
> >>>> status, AMDGPU_GFXHUB(0));
> >>>>         if (amdgpu_vm_fault_stop =3D=3D AMDGPU_VM_FAULT_STOP_FIRST)
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>> index 47b63a4ce68b..dc9fb1fb9540 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct
> >>>> amdgpu_device *adev,
> >>>>       rw =3D REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS, RW=
);
> >>>>       WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>   -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
> >>>> status, vmhub);
> >>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status, vmhub);
> >>>>         dev_err(adev->dev,
> >>>>           "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
> >>>
> >
