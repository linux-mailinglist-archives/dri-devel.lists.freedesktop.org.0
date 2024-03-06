Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4A8873AB4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 16:33:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9B01132AB;
	Wed,  6 Mar 2024 15:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kEDDuxey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A823F1132A9;
 Wed,  6 Mar 2024 15:33:01 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6e655a12c81so91627b3a.1; 
 Wed, 06 Mar 2024 07:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709739181; x=1710343981; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Hnl5ItBtTjGnl7VXzdIWei9Hpq+3pvvKl+jU/jMQXY=;
 b=kEDDuxeypG5VKoEni2NMf5FHND9t2BJ+5NUoSgcQYzFsWBxIUzMno19RQ51PfTrlun
 BMg/2vh6gYIPF9Y21TmjjMSrdggy/+v79B65p68X9GpOy07QfokNmcjjtD4oQ9QQLJDY
 /ogho+cCjeogVUFGyXQ5WGaG2ieOURq51tlhDExDcTgR4HySUiEfJWYoHQUkkHMqD/k/
 zjkJgfoPj9Hq02XQyfBO8ewd+amg4mkrAvH7R2oKyG0li42WGxH99ESSOElZqawqp5XF
 5jerk7W86wcOK8JTkV2WxBoA4s/qnXgEIweCKAo2ipLwMrKE6MlXUkclf0vEdNL/802s
 S2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709739181; x=1710343981;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Hnl5ItBtTjGnl7VXzdIWei9Hpq+3pvvKl+jU/jMQXY=;
 b=jW+V9INpSAM86KbqZBPPQ8DKObAAa4R0qk/Dukcno3t+NtcHnZHLm7t5pE5DNZef8X
 dptImw01ZCMr33VenREXphnEbUT8owtrjcQHta5EiDTO8lCgUsQlYD5XjAnv43km8Vsc
 r1ELN9HVgCRQifxTWjMrObALupym4NiA/mwluuRuWtFopPtlOlg80CXt3OaKtsZmhOSw
 P20xGOfweNlu4M+XJLXxcRzg3WjtZn/fU67sL6koyciDXhoZU9LsFeqVGY4/heXEzP8F
 VFpJtgrII4rESqreh85pDYViKmtQvrxbkvmjG0t0YbfXzZD5JeGQY+WNjFnyI6T31BX5
 sDWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn/VK2XswpZ9rbcIx7np1gCOXBLq2D0+t0KwXjTbqRwgseCU9AxfkbQLAD+2IN9knZmAhcRE79/j38Gb/hPVJ9Nb7KSV5CS+ZIjbCzH7/XJrN/imywMmJSX2soPmr7MaY3vf05ObQQeQkrHVuaqw==
X-Gm-Message-State: AOJu0YwljDgzrSyhbgPqrLBq7PIys6GfgNEOoKlkm0cL8quYiEjPWRwN
 xAKJ+FPTy5OnzoBBdJSGn8tcBDJC+kMblYTOjK5TNPsuMUWTY5NpPzTMv11XsRthTsDFX+Ev3MI
 h03qz+lzXIyEC7ui/krmDM8VjOpxdUU/y
X-Google-Smtp-Source: AGHT+IEf0yh1i+3wNQjO6qx4f+4uedbnCLdNShdu0wUbDWuEhEAuhRYS/PMYdUx9hIsoZclqaEvi/Jc6ehxQY8pKJ+o=
X-Received: by 2002:a17:90b:1107:b0:29b:84e6:70c with SMTP id
 gi7-20020a17090b110700b0029b84e6070cmr9412pjb.2.1709739180741; Wed, 06 Mar
 2024 07:33:00 -0800 (PST)
MIME-Version: 1.0
References: <20240306090408.3453152-1-sunil.khatri@amd.com>
 <2f792620-fd8a-412e-9130-e276ba36d5a0@amd.com>
 <5e2899cd-75b4-4ddd-97ff-4e10a2e67fbb@amd.com>
 <66815303-bd9c-4dfc-ae1a-bbdc5d1bb47c@amd.com>
 <17e12147-79dd-44ba-b8ae-b96fb72dcfbd@amd.com>
 <CADnq5_OkeH1x4YgSv6uw0HLb5c-5NOXnzQPJHsDvb=NmEePB-A@mail.gmail.com>
 <e5781df5-5244-465e-b986-c1802e1262db@gmail.com>
 <0df75ff4-ece5-4eaa-93bd-6f03ec31ecfa@amd.com>
In-Reply-To: <0df75ff4-ece5-4eaa-93bd-6f03ec31ecfa@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Mar 2024 10:32:47 -0500
Message-ID: <CADnq5_PGn_a81HPAd5kO8yi8s_wizdJH-ZT2PC=qs02AFc_Atg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
To: "Khatri, Sunil" <sukhatri@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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

On Wed, Mar 6, 2024 at 10:13=E2=80=AFAM Khatri, Sunil <sukhatri@amd.com> wr=
ote:
>
>
> On 3/6/2024 8:34 PM, Christian K=C3=B6nig wrote:
> > Am 06.03.24 um 15:29 schrieb Alex Deucher:
> >> On Wed, Mar 6, 2024 at 8:04=E2=80=AFAM Khatri, Sunil <sukhatri@amd.com=
> wrote:
> >>>
> >>> On 3/6/2024 6:12 PM, Christian K=C3=B6nig wrote:
> >>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
> >>>>> On 3/6/2024 3:37 PM, Christian K=C3=B6nig wrote:
> >>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
> >>>>>>> When an  page fault interrupt is raised there
> >>>>>>> is a lot more information that is useful for
> >>>>>>> developers to analyse the pagefault.
> >>>>>> Well actually those information are not that interesting because
> >>>>>> they are hw generation specific.
> >>>>>>
> >>>>>> You should probably rather use the decoded strings here, e.g. hub,
> >>>>>> client, xcc_id, node_id etc...
> >>>>>>
> >>>>>> See gmc_v9_0_process_interrupt() an example.
> >>>>>> I saw this v9 does provide more information than what v10 and v11
> >>>>>> provide like node_id and fault from which die but thats again very
> >>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats information
> >>>>>> is not there in v10 and v11.
> >>>>> I agree to your point but, as of now during a pagefault we are
> >>>>> dumping this information which is useful like which client
> >>>>> has generated an interrupt and for which src and other information
> >>>>> like address. So i think to provide the similar information in the
> >>>>> devcoredump.
> >>>>>
> >>>>> Currently we do not have all this information from either job or vm
> >>>>> being derived from the job during a reset. We surely could add more
> >>>>> relevant information later on as per request but this information i=
s
> >>>>> useful as
> >>>>> eventually its developers only who would use the dump file provided
> >>>>> by customer to debug.
> >>>>>
> >>>>> Below is the information that i dump in devcore and i feel that is
> >>>>> good information but new information could be added which could be
> >>>>> picked later.
> >>>>>
> >>>>>> Page fault information
> >>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
> >>>>>> in page starting at address 0x0000000000000000 from client 0x1b
> >>>>>> (UTCL2)
> >>>> This is a perfect example what I mean. You record in the patch is th=
e
> >>>> client_id, but this is is basically meaningless unless you have acce=
ss
> >>>> to the AMD internal hw documentation.
> >>>>
> >>>> What you really need is the client in decoded form, in this case
> >>>> UTCL2. You can keep the client_id additionally, but the decoded clie=
nt
> >>>> string is mandatory to have I think.
> >>>>
> >>>> Sure i am capturing that information as i am trying to minimise the
> >>>> memory interaction to minimum as we are still in interrupt context
> >>>> here that why i recorded the integer information compared to decodin=
g
> >>> and writing strings there itself but to postpone till we dump.
> >>>
> >>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and client
> >>> string from client id. So are we good to go with the information with
> >>> the above information of sharing details in devcoredump using the
> >>> additional information from pagefault cached.
> >> I think amdgpu_vm_fault_info() has everything you need already (vmhub,
> >> status, and addr).  client_id and src_id are just tokens in the
> >> interrupt cookie so we know which IP to route the interrupt to. We
> >> know what they will be because otherwise we'd be in the interrupt
> >> handler for a different IP.  I don't think ring_id has any useful
> >> information in this context and vmid and pasid are probably not too
> >> useful because they are just tokens to associate the fault with a
> >> process.  It would be better to have the process name.
>
> Just to share context here Alex, i am preparing this for devcoredump, my
> intention was to replicate the information which in KMD we are sharing
> in Dmesg for page faults. If assuming we do not add client id specially
> we would not be able to share enough information in devcoredump.
> It would be just address and hub(gfxhub/mmhub) and i think that is
> partial information as src id and client id and ip block shares good
> information.

We also need to include the status register value.  That contains the
important information (type of access, fault type, client, etc.).
Client_id and src_id are only used to route the interrupt to the right
software code.  E.g., a different client_id and src_id would be a
completely different interrupt (e.g., vblank or fence, etc.).  For GPU
page faults the client_id and src_id will always be the same.

The devcoredump should also include information about the GPU itself
as well (e.g., PCI DID/VID, maybe some of the relevant IP versions).

Alex

>
> For process related information we are capturing that information part
> of dump from existing functionality.
> **** AMDGPU Device Coredump ****
> version: 1
> kernel: 6.7.0-amd-staging-drm-next
> module: amdgpu
> time: 45.084775181
> process_name: soft_recovery_p PID: 1780
>
> Ring timed out details
> IP Type: 0 Ring Name: gfx_0.0.0
>
> Page fault information
> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
> in page starting at address 0x0000000000000000 from client 0x1b (UTCL2)
> VRAM is lost due to GPU reset!
>
> Regards
> Sunil
>
> >
> > The decoded client name would be really useful I think since the fault
> > handled is a catch all and handles a whole bunch of different clients.
> >
> > But that should be ideally passed in as const string instead of the hw
> > generation specific client_id.
> >
> > As long as it's only a pointer we also don't run into the trouble that
> > we need to allocate memory for it.
>
> I agree but i prefer adding the client id and decoding it in devcorecump
> using soc15_ih_clientid_name[fault_info->client_id]) is better else we
> have to do an sprintf this string to fault_info in irq context which is
> writing more bytes to memory i guess compared to an integer:)
>
> We can argue on values like pasid and vmid and ring id to be taken off
> if they are totally not useful.
>
> Regards
> Sunil
>
> >
> > Christian.
> >
> >>
> >> Alex
> >>
> >>> regards
> >>> sunil
> >>>
> >>>> Regards,
> >>>> Christian.
> >>>>
> >>>>> Regards
> >>>>> Sunil Khatri
> >>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>> Add all such information in the last cached
> >>>>>>> pagefault from an interrupt handler.
> >>>>>>>
> >>>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> >>>>>>> ---
> >>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
> >>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
> >>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
> >>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
> >>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
> >>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
> >>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
> >>>>>>>    7 files changed, 18 insertions(+), 8 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>> index 4299ce386322..b77e8e28769d 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
> >>>>>>> amdgpu_vm *vm, struct seq_file *m)
> >>>>>>>     * Cache the fault info for later use by userspace in debuggin=
g.
> >>>>>>>     */
> >>>>>>>    void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
> >>>>>>> -                  unsigned int pasid,
> >>>>>>> +                  struct amdgpu_iv_entry *entry,
> >>>>>>>                      uint64_t addr,
> >>>>>>>                      uint32_t status,
> >>>>>>>                      unsigned int vmhub)
> >>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
> >>>>>>> amdgpu_device *adev,
> >>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
> >>>>>>>    -    vm =3D xa_load(&adev->vm_manager.pasids, pasid);
> >>>>>>> +    vm =3D xa_load(&adev->vm_manager.pasids, entry->pasid);
> >>>>>>>        /* Don't update the fault cache if status is 0.  In the
> >>>>>>> multiple
> >>>>>>>         * fault case, subsequent faults will return a 0 status
> >>>>>>> which is
> >>>>>>>         * useless for userspace and replaces the useful fault
> >>>>>>> status, so
> >>>>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct
> >>>>>>> amdgpu_device *adev,
> >>>>>>>        if (vm && status) {
> >>>>>>>            vm->fault_info.addr =3D addr;
> >>>>>>>            vm->fault_info.status =3D status;
> >>>>>>> +        vm->fault_info.client_id =3D entry->client_id;
> >>>>>>> +        vm->fault_info.src_id =3D entry->src_id;
> >>>>>>> +        vm->fault_info.vmid =3D entry->vmid;
> >>>>>>> +        vm->fault_info.pasid =3D entry->pasid;
> >>>>>>> +        vm->fault_info.ring_id =3D entry->ring_id;
> >>>>>>>            if (AMDGPU_IS_GFXHUB(vmhub)) {
> >>>>>>>                vm->fault_info.vmhub =3D AMDGPU_VMHUB_TYPE_GFX;
> >>>>>>>                vm->fault_info.vmhub |=3D
> >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>> index 047ec1930d12..c7782a89bdb5 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
> >>>>>>>        uint32_t    status;
> >>>>>>>        /* which vmhub? gfxhub, mmhub, etc. */
> >>>>>>>        unsigned int    vmhub;
> >>>>>>> +    unsigned int    client_id;
> >>>>>>> +    unsigned int    src_id;
> >>>>>>> +    unsigned int    ring_id;
> >>>>>>> +    unsigned int    pasid;
> >>>>>>> +    unsigned int    vmid;
> >>>>>>>    };
> >>>>>>>      struct amdgpu_vm {
> >>>>>>> @@ -605,7 +610,7 @@ static inline void
> >>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
> >>>>>>>    }
> >>>>>>>      void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev=
,
> >>>>>>> -                  unsigned int pasid,
> >>>>>>> +                  struct amdgpu_iv_entry *entry,
> >>>>>>>                      uint64_t addr,
> >>>>>>>                      uint32_t status,
> >>>>>>>                      unsigned int vmhub);
> >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(struct
> >>>>>>> amdgpu_device *adev,
> >>>>>>>            status =3D RREG32(hub->vm_l2_pro_fault_status);
> >>>>>>>            WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr=
,
> >>>>>>> status,
> >>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
> >>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) :
> >>>>>>> AMDGPU_GFXHUB(0));
> >>>>>>>        }
> >>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>> index 527dc917e049..bcf254856a3e 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(struct
> >>>>>>> amdgpu_device *adev,
> >>>>>>>            status =3D RREG32(hub->vm_l2_pro_fault_status);
> >>>>>>>            WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid, addr=
,
> >>>>>>> status,
> >>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status,
> >>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) :
> >>>>>>> AMDGPU_GFXHUB(0));
> >>>>>>>        }
> >>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>> @@ -1270,7 +1270,7 @@ static int gmc_v7_0_process_interrupt(struc=
t
> >>>>>>> amdgpu_device *adev,
> >>>>>>>        if (!addr && !status)
> >>>>>>>            return 0;
> >>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
> >>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
> >>>>>>> status, AMDGPU_GFXHUB(0));
> >>>>>>>          if (amdgpu_vm_fault_stop =3D=3D AMDGPU_VM_FAULT_STOP_FIR=
ST)
> >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>> index d20e5f20ee31..a271bf832312 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>> @@ -1438,7 +1438,7 @@ static int gmc_v8_0_process_interrupt(struc=
t
> >>>>>>> amdgpu_device *adev,
> >>>>>>>        if (!addr && !status)
> >>>>>>>            return 0;
> >>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
> >>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
> >>>>>>> status, AMDGPU_GFXHUB(0));
> >>>>>>>          if (amdgpu_vm_fault_stop =3D=3D AMDGPU_VM_FAULT_STOP_FIR=
ST)
> >>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
> >>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struct
> >>>>>>> amdgpu_device *adev,
> >>>>>>>        rw =3D REG_GET_FIELD(status, VM_L2_PROTECTION_FAULT_STATUS=
,
> >>>>>>> RW);
> >>>>>>>        WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
> >>>>>>> status, vmhub);
> >>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status,
> >>>>>>> vmhub);
> >>>>>>>          dev_err(adev->dev,
> >>>>>>>            "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
> >
