Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3E873BD7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 17:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531D310EE32;
	Wed,  6 Mar 2024 16:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="brwZ/8dN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FB510EE32;
 Wed,  6 Mar 2024 16:15:13 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5ce6b5e3c4eso5188303a12.2; 
 Wed, 06 Mar 2024 08:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709741713; x=1710346513; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6mgyk+SRqCqbyYVzDj5P8lgKuz98g4ztK8la5iKbeIo=;
 b=brwZ/8dN3do9hOjv6wVRzEHuj1ShMPOUldB+5rYvUrVfWh0JIAO/OxDKMszEICCSK+
 QUqwuzdDHR+GiJpd7m8smVjq/VnLxEh9WQjOvRA2NZOqCABksZjDv9jVhuUS1dDiu7UL
 a510U6Qo7F8qO6Q7Jtzav6bvjQKNrLBF/XbJJCtdktopf5DUyeRuNQNKHsAeRNe+RNc2
 80lzBZ3Vqfx8XTcHIQ3NnCh2okR8NCmhZ3g4NV4i0AUdg12l0GcOqIxoGVTm/UOLPNMU
 g80bIKaj3RcGbRR0NXSAAt7nSbBbHvDNvIXxmP1j5uqdBfCB2wquLvq0q6u0uwXRVfK9
 XKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709741713; x=1710346513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6mgyk+SRqCqbyYVzDj5P8lgKuz98g4ztK8la5iKbeIo=;
 b=cVRXpxgoSvyaEFq/VwTrvFXKArauN6bMGuq+x6EhvW4fiPqVYFum5uy+UWK5squGVI
 UReGdpEmROmQwfrXF8MPeTPx1L97wPmhkntpzzTLhhODR7a917mGMa5k5cqC4B08VCyI
 C4bhSnPvIL4/cffiP5SipDUV8nYYXdJnKRW90SKUwuggeXLZkG6Y77dWCasVPwYj1VDW
 lQ1x4b6YpRcO2/nuhuO7n+VMit1MFoboKSFBdaWnyr7Gy3Y9n5w7vBXJSHPusgBzp4Aq
 jQ9zw/SPejod9ffAuvPk7uYfmuYXgIo+Fz8YKXFSjzrXBSH60N0qtdBs3TmTNX4IBin8
 yUWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi3fZ541fsKmJAwx4eI1emCGZ+04VyeFldf1LFcrx7aaOnTcvss//BXF2s/aauokhEgmiMnTHULFelfjSKiPQbwl3hEW1Ft43mVMLZNwllLLGRmdLr1BVouQy4sPBIZMuvIkiFuOzWkwOIhCH/Cw==
X-Gm-Message-State: AOJu0YyQUmhh1bVeNyM6FVFpKGaoNGbYXz3s+En8t/V5Ipp9GLy4pP3I
 HNX4ZLSZM0/88lKLJlJTGigFzgGIn+L5r2m88LMzsnquCJ/uZCHNvpzwnqMCtPMDVVAydj7CBPT
 831ptb1X3YzkqU7eSki4dLk0Qb+Q=
X-Google-Smtp-Source: AGHT+IG8qsYHRZ9Bm6oW4pO/D9KSHbgwj4wrcMjQzh2tfMDrXzxOTPUhcv84CXG0EN6VGnhGNLI88rwMhx3zdDhjsfc=
X-Received: by 2002:a17:90a:de06:b0:299:33c5:9583 with SMTP id
 m6-20020a17090ade0600b0029933c59583mr12605391pjv.14.1709741712742; Wed, 06
 Mar 2024 08:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20240306090408.3453152-1-sunil.khatri@amd.com>
 <2f792620-fd8a-412e-9130-e276ba36d5a0@amd.com>
 <5e2899cd-75b4-4ddd-97ff-4e10a2e67fbb@amd.com>
 <66815303-bd9c-4dfc-ae1a-bbdc5d1bb47c@amd.com>
 <17e12147-79dd-44ba-b8ae-b96fb72dcfbd@amd.com>
 <CADnq5_OkeH1x4YgSv6uw0HLb5c-5NOXnzQPJHsDvb=NmEePB-A@mail.gmail.com>
 <e5781df5-5244-465e-b986-c1802e1262db@gmail.com>
 <0df75ff4-ece5-4eaa-93bd-6f03ec31ecfa@amd.com>
 <bfaaad63-a5d7-4ceb-8e1c-d541f76f4037@amd.com>
 <852e4f0e-c743-44c2-a2bb-59f0e8e25e1b@amd.com>
In-Reply-To: <852e4f0e-c743-44c2-a2bb-59f0e8e25e1b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Mar 2024 11:15:00 -0500
Message-ID: <CADnq5_MzPxxGHEUuZBv9AWZ0cfdurPxf6jvXxuTPfTkJ5he3yQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: cache in more vm fault information
To: "Khatri, Sunil" <sukhatri@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
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

On Wed, Mar 6, 2024 at 11:06=E2=80=AFAM Khatri, Sunil <sukhatri@amd.com> wr=
ote:
>
>
> On 3/6/2024 9:07 PM, Christian K=C3=B6nig wrote:
> > Am 06.03.24 um 16:13 schrieb Khatri, Sunil:
> >>
> >> On 3/6/2024 8:34 PM, Christian K=C3=B6nig wrote:
> >>> Am 06.03.24 um 15:29 schrieb Alex Deucher:
> >>>> On Wed, Mar 6, 2024 at 8:04=E2=80=AFAM Khatri, Sunil <sukhatri@amd.c=
om> wrote:
> >>>>>
> >>>>> On 3/6/2024 6:12 PM, Christian K=C3=B6nig wrote:
> >>>>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
> >>>>>>> On 3/6/2024 3:37 PM, Christian K=C3=B6nig wrote:
> >>>>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
> >>>>>>>>> When an  page fault interrupt is raised there
> >>>>>>>>> is a lot more information that is useful for
> >>>>>>>>> developers to analyse the pagefault.
> >>>>>>>> Well actually those information are not that interesting because
> >>>>>>>> they are hw generation specific.
> >>>>>>>>
> >>>>>>>> You should probably rather use the decoded strings here, e.g. hu=
b,
> >>>>>>>> client, xcc_id, node_id etc...
> >>>>>>>>
> >>>>>>>> See gmc_v9_0_process_interrupt() an example.
> >>>>>>>> I saw this v9 does provide more information than what v10 and v1=
1
> >>>>>>>> provide like node_id and fault from which die but thats again ve=
ry
> >>>>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats informati=
on
> >>>>>>>> is not there in v10 and v11.
> >>>>>>> I agree to your point but, as of now during a pagefault we are
> >>>>>>> dumping this information which is useful like which client
> >>>>>>> has generated an interrupt and for which src and other informatio=
n
> >>>>>>> like address. So i think to provide the similar information in th=
e
> >>>>>>> devcoredump.
> >>>>>>>
> >>>>>>> Currently we do not have all this information from either job or =
vm
> >>>>>>> being derived from the job during a reset. We surely could add mo=
re
> >>>>>>> relevant information later on as per request but this
> >>>>>>> information is
> >>>>>>> useful as
> >>>>>>> eventually its developers only who would use the dump file provid=
ed
> >>>>>>> by customer to debug.
> >>>>>>>
> >>>>>>> Below is the information that i dump in devcore and i feel that i=
s
> >>>>>>> good information but new information could be added which could b=
e
> >>>>>>> picked later.
> >>>>>>>
> >>>>>>>> Page fault information
> >>>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
> >>>>>>>> in page starting at address 0x0000000000000000 from client 0x1b
> >>>>>>>> (UTCL2)
> >>>>>> This is a perfect example what I mean. You record in the patch is
> >>>>>> the
> >>>>>> client_id, but this is is basically meaningless unless you have
> >>>>>> access
> >>>>>> to the AMD internal hw documentation.
> >>>>>>
> >>>>>> What you really need is the client in decoded form, in this case
> >>>>>> UTCL2. You can keep the client_id additionally, but the decoded
> >>>>>> client
> >>>>>> string is mandatory to have I think.
> >>>>>>
> >>>>>> Sure i am capturing that information as i am trying to minimise th=
e
> >>>>>> memory interaction to minimum as we are still in interrupt context
> >>>>>> here that why i recorded the integer information compared to
> >>>>>> decoding
> >>>>> and writing strings there itself but to postpone till we dump.
> >>>>>
> >>>>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and clien=
t
> >>>>> string from client id. So are we good to go with the information wi=
th
> >>>>> the above information of sharing details in devcoredump using the
> >>>>> additional information from pagefault cached.
> >>>> I think amdgpu_vm_fault_info() has everything you need already (vmhu=
b,
> >>>> status, and addr).  client_id and src_id are just tokens in the
> >>>> interrupt cookie so we know which IP to route the interrupt to. We
> >>>> know what they will be because otherwise we'd be in the interrupt
> >>>> handler for a different IP.  I don't think ring_id has any useful
> >>>> information in this context and vmid and pasid are probably not too
> >>>> useful because they are just tokens to associate the fault with a
> >>>> process.  It would be better to have the process name.
> >>
> >> Just to share context here Alex, i am preparing this for devcoredump,
> >> my intention was to replicate the information which in KMD we are
> >> sharing in Dmesg for page faults. If assuming we do not add client id
> >> specially we would not be able to share enough information in
> >> devcoredump.
> >> It would be just address and hub(gfxhub/mmhub) and i think that is
> >> partial information as src id and client id and ip block shares good
> >> information.
> >>
> >> For process related information we are capturing that information
> >> part of dump from existing functionality.
> >> **** AMDGPU Device Coredump ****
> >> version: 1
> >> kernel: 6.7.0-amd-staging-drm-next
> >> module: amdgpu
> >> time: 45.084775181
> >> process_name: soft_recovery_p PID: 1780
> >>
> >> Ring timed out details
> >> IP Type: 0 Ring Name: gfx_0.0.0
> >>
> >> Page fault information
> >> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
> >> in page starting at address 0x0000000000000000 from client 0x1b (UTCL2=
)
> >> VRAM is lost due to GPU reset!
> >>
> >> Regards
> >> Sunil
> >>
> >>>
> >>> The decoded client name would be really useful I think since the
> >>> fault handled is a catch all and handles a whole bunch of different
> >>> clients.
> >>>
> >>> But that should be ideally passed in as const string instead of the
> >>> hw generation specific client_id.
> >>>
> >>> As long as it's only a pointer we also don't run into the trouble
> >>> that we need to allocate memory for it.
> >>
> >> I agree but i prefer adding the client id and decoding it in
> >> devcorecump using soc15_ih_clientid_name[fault_info->client_id]) is
> >> better else we have to do an sprintf this string to fault_info in irq
> >> context which is writing more bytes to memory i guess compared to an
> >> integer:)
> >
> > Well I totally agree that we shouldn't fiddle to much in the interrupt
> > handler, but exactly what you suggest here won't work.
> >
> > The client_id is hw generation specific, so the only one who has that
> > is the hw generation specific fault handler. Just compare the defines
> > here:
> >
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdg=
pu/gmc_v9_0.c#L83
> >
> >
> > and here:
> >
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdg=
pu/gfxhub_v11_5_0.c#L38
> >
> >
> Got your point. Let me see but this is a lot of work in irq context.
> Either we can drop totally the client id thing as alex is suggesting
> here as its always be same client and src id or let me come up with a
> patch and see if its acceptable.
>
> Also as Alex pointed we need to decode from status register which kind
> of page fault it is (permission, read, write etc) this all is again
> family specific and thats all in IRQ context. Not feeling good about it
> but let me try to share all that in a new patch.
>

I don't think you need to decode it.  As long as you have a way to
identify the chip, we can just include the raw status register and the
developer can decode it when they look at the devcoredump.

Alex


> Regards
> Sunil.
>
> > Regards,
> > Christian.
> >
> >>
> >> We can argue on values like pasid and vmid and ring id to be taken
> >> off if they are totally not useful.
> >>
> >> Regards
> >> Sunil
> >>
> >>>
> >>> Christian.
> >>>
> >>>>
> >>>> Alex
> >>>>
> >>>>> regards
> >>>>> sunil
> >>>>>
> >>>>>> Regards,
> >>>>>> Christian.
> >>>>>>
> >>>>>>> Regards
> >>>>>>> Sunil Khatri
> >>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> Christian.
> >>>>>>>>
> >>>>>>>>> Add all such information in the last cached
> >>>>>>>>> pagefault from an interrupt handler.
> >>>>>>>>>
> >>>>>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> >>>>>>>>> ---
> >>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
> >>>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
> >>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
> >>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
> >>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
> >>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
> >>>>>>>>>    drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
> >>>>>>>>>    7 files changed, 18 insertions(+), 8 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>>>> index 4299ce386322..b77e8e28769d 100644
> >>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
> >>>>>>>>> amdgpu_vm *vm, struct seq_file *m)
> >>>>>>>>>     * Cache the fault info for later use by userspace in
> >>>>>>>>> debugging.
> >>>>>>>>>     */
> >>>>>>>>>    void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev=
,
> >>>>>>>>> -                  unsigned int pasid,
> >>>>>>>>> +                  struct amdgpu_iv_entry *entry,
> >>>>>>>>>                      uint64_t addr,
> >>>>>>>>>                      uint32_t status,
> >>>>>>>>>                      unsigned int vmhub)
> >>>>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struct
> >>>>>>>>> amdgpu_device *adev,
> >>>>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
> >>>>>>>>>    -    vm =3D xa_load(&adev->vm_manager.pasids, pasid);
> >>>>>>>>> +    vm =3D xa_load(&adev->vm_manager.pasids, entry->pasid);
> >>>>>>>>>        /* Don't update the fault cache if status is 0.  In the
> >>>>>>>>> multiple
> >>>>>>>>>         * fault case, subsequent faults will return a 0 status
> >>>>>>>>> which is
> >>>>>>>>>         * useless for userspace and replaces the useful fault
> >>>>>>>>> status, so
> >>>>>>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(struct
> >>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>        if (vm && status) {
> >>>>>>>>>            vm->fault_info.addr =3D addr;
> >>>>>>>>>            vm->fault_info.status =3D status;
> >>>>>>>>> +        vm->fault_info.client_id =3D entry->client_id;
> >>>>>>>>> +        vm->fault_info.src_id =3D entry->src_id;
> >>>>>>>>> +        vm->fault_info.vmid =3D entry->vmid;
> >>>>>>>>> +        vm->fault_info.pasid =3D entry->pasid;
> >>>>>>>>> +        vm->fault_info.ring_id =3D entry->ring_id;
> >>>>>>>>>            if (AMDGPU_IS_GFXHUB(vmhub)) {
> >>>>>>>>>                vm->fault_info.vmhub =3D AMDGPU_VMHUB_TYPE_GFX;
> >>>>>>>>>                vm->fault_info.vmhub |=3D
> >>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>>>> index 047ec1930d12..c7782a89bdb5 100644
> >>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
> >>>>>>>>>        uint32_t    status;
> >>>>>>>>>        /* which vmhub? gfxhub, mmhub, etc. */
> >>>>>>>>>        unsigned int    vmhub;
> >>>>>>>>> +    unsigned int    client_id;
> >>>>>>>>> +    unsigned int    src_id;
> >>>>>>>>> +    unsigned int    ring_id;
> >>>>>>>>> +    unsigned int    pasid;
> >>>>>>>>> +    unsigned int    vmid;
> >>>>>>>>>    };
> >>>>>>>>>      struct amdgpu_vm {
> >>>>>>>>> @@ -605,7 +610,7 @@ static inline void
> >>>>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
> >>>>>>>>>    }
> >>>>>>>>>      void amdgpu_vm_update_fault_cache(struct amdgpu_device
> >>>>>>>>> *adev,
> >>>>>>>>> -                  unsigned int pasid,
> >>>>>>>>> +                  struct amdgpu_iv_entry *entry,
> >>>>>>>>>                      uint64_t addr,
> >>>>>>>>>                      uint32_t status,
> >>>>>>>>>                      unsigned int vmhub);
> >>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
> >>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(stru=
ct
> >>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>            status =3D RREG32(hub->vm_l2_pro_fault_status);
> >>>>>>>>>            WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>>>>>>> addr,
> >>>>>>>>> status,
> >>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status=
,
> >>>>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) =
:
> >>>>>>>>> AMDGPU_GFXHUB(0));
> >>>>>>>>>        }
> >>>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>>>> index 527dc917e049..bcf254856a3e 100644
> >>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(stru=
ct
> >>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>            status =3D RREG32(hub->vm_l2_pro_fault_status);
> >>>>>>>>>            WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>>>>>>    -        amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>>>>>>> addr,
> >>>>>>>>> status,
> >>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, status=
,
> >>>>>>>>>                             entry->vmid_src ? AMDGPU_MMHUB0(0) =
:
> >>>>>>>>> AMDGPU_GFXHUB(0));
> >>>>>>>>>        }
> >>>>>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
> >>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>>>> @@ -1270,7 +1270,7 @@ static int
> >>>>>>>>> gmc_v7_0_process_interrupt(struct
> >>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>        if (!addr && !status)
> >>>>>>>>>            return 0;
> >>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
> >>>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
> >>>>>>>>> status, AMDGPU_GFXHUB(0));
> >>>>>>>>>          if (amdgpu_vm_fault_stop =3D=3D AMDGPU_VM_FAULT_STOP_F=
IRST)
> >>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>>>> index d20e5f20ee31..a271bf832312 100644
> >>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>>>> @@ -1438,7 +1438,7 @@ static int
> >>>>>>>>> gmc_v8_0_process_interrupt(struct
> >>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>        if (!addr && !status)
> >>>>>>>>>            return 0;
> >>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
> >>>>>>>>>                         ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT,
> >>>>>>>>> status, AMDGPU_GFXHUB(0));
> >>>>>>>>>          if (amdgpu_vm_fault_stop =3D=3D AMDGPU_VM_FAULT_STOP_F=
IRST)
> >>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
> >>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(struc=
t
> >>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>        rw =3D REG_GET_FIELD(status,
> >>>>>>>>> VM_L2_PROTECTION_FAULT_STATUS, RW);
> >>>>>>>>>        WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>>>>>>    -    amdgpu_vm_update_fault_cache(adev, entry->pasid, addr,
> >>>>>>>>> status, vmhub);
> >>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status,
> >>>>>>>>> vmhub);
> >>>>>>>>>          dev_err(adev->dev,
> >>>>>>>>> "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
> >>>
> >
