Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E3873C3D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 17:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D1610FD82;
	Wed,  6 Mar 2024 16:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T/p8uTqQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05A210E752;
 Wed,  6 Mar 2024 16:30:05 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-47259486a1fso1591069137.2; 
 Wed, 06 Mar 2024 08:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709742604; x=1710347404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKa2+aZw7mxRLTdBTV7peWPgzstxZR+rf9Vg4ELR4PA=;
 b=T/p8uTqQ4XtyotauBgDORBJF87CzCui4DFdhnAwCub8/0Sm0eG2lmCRnDBUjJFSQ1G
 Roio5sdtDOteV4pzW+139ZoUgrvW8CdsdGrhp02rO5FT24pdZj0xiQNerjghZcX7WcKf
 MNlasrbJDBdADa0kSKSskihcKmVucCub0L5UC06rE7264XrJmmnJ70HT3enyY+lPxPic
 Oakd8s50VgWRvF1pojH8O8xoJ64+fZIns78JbzQv+CydazA5YJtursesKew/IH4psOq2
 uchuDrV1t4GUfejwzJiRr5ii1qXkWWXI0Sua6vw0HtRA65CTBelovtfIYuHz3nhdTsSh
 DAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709742604; x=1710347404;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YKa2+aZw7mxRLTdBTV7peWPgzstxZR+rf9Vg4ELR4PA=;
 b=GsLe7MzWwl0SknNlPj7KcFlNhma0sGYYvKlgT4NTivD7tb74yRbsAMlt/zuIHLG82T
 4Df1cGDZOrsoDjRc+/53hxS4F1MVxhEJCdRwiLmxMcpk/GooVPMi0SyOamdyI+Ywl5Kj
 IKb4n3jMABWyHSARn4IE+A0hIhUeTJ+rZgL8g/bqlU51HwjByMWVslXrTv6SZqpRcxhS
 Co/nE7G3iYhsN+HaIS/Ps6eMoMzF8UDolLPqDXfLKRXYeXtQgY+unztm6MPCvkGnfsvk
 f3PTPm2fW92OAcKxx6H6yr2MK2JtaLmGQD83Z9hqnAvvYPDRrfp+ktxGEtsTyYiM32FL
 yhCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7aBMDeWMtjjBL5cU0TvpuRztW/SraOrRLKABDjZquoIaHp230FKY3D878mRxQER32GL5koWmUtCx9GGkwWZjbo0QDBBoTbkl7gSgNzrc7LQsVRF5Ebw4fAVCy8enxmsCcW9CakrC3SBs7nLfRTg==
X-Gm-Message-State: AOJu0Yw62D1659/t77oX6za42LFIpen7O3d91plX78KgfvPQ+/JZLYlF
 F32asY1AbdwfC02rav+gOg0mstpr5CnjqLPLC/hYnj0iH1zGinuhDRlqn1+BfZU3N1uQ+3SgBGn
 zYGM5NckSy2x72Dip7DibYzrcKnQ=
X-Google-Smtp-Source: AGHT+IHuIEOhrQ3Rmb46wwD20rShh9vfJ6Oe6qY45TKKBytn7QHIFy7GIpyLpD5/uKDSKxuGf9eSQ61Ze9qN6N70Rfg=
X-Received: by 2002:a05:6102:304d:b0:472:6e61:8df9 with SMTP id
 w13-20020a056102304d00b004726e618df9mr6899732vsa.3.1709742604172; Wed, 06 Mar
 2024 08:30:04 -0800 (PST)
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
 <CADnq5_MzPxxGHEUuZBv9AWZ0cfdurPxf6jvXxuTPfTkJ5he3yQ@mail.gmail.com>
 <81f2c1bf-6c44-4d7c-aab5-83fa097a21ff@amd.com>
In-Reply-To: <81f2c1bf-6c44-4d7c-aab5-83fa097a21ff@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Mar 2024 11:29:51 -0500
Message-ID: <CADnq5_MRZSJ3uzfyaHvzt63pEvoXki3K-UoLrNVKV2wAcB2J_g@mail.gmail.com>
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

On Wed, Mar 6, 2024 at 11:21=E2=80=AFAM Khatri, Sunil <sukhatri@amd.com> wr=
ote:
>
>
> On 3/6/2024 9:45 PM, Alex Deucher wrote:
> > On Wed, Mar 6, 2024 at 11:06=E2=80=AFAM Khatri, Sunil <sukhatri@amd.com=
> wrote:
> >>
> >> On 3/6/2024 9:07 PM, Christian K=C3=B6nig wrote:
> >>> Am 06.03.24 um 16:13 schrieb Khatri, Sunil:
> >>>> On 3/6/2024 8:34 PM, Christian K=C3=B6nig wrote:
> >>>>> Am 06.03.24 um 15:29 schrieb Alex Deucher:
> >>>>>> On Wed, Mar 6, 2024 at 8:04=E2=80=AFAM Khatri, Sunil <sukhatri@amd=
.com> wrote:
> >>>>>>> On 3/6/2024 6:12 PM, Christian K=C3=B6nig wrote:
> >>>>>>>> Am 06.03.24 um 11:40 schrieb Khatri, Sunil:
> >>>>>>>>> On 3/6/2024 3:37 PM, Christian K=C3=B6nig wrote:
> >>>>>>>>>> Am 06.03.24 um 10:04 schrieb Sunil Khatri:
> >>>>>>>>>>> When an  page fault interrupt is raised there
> >>>>>>>>>>> is a lot more information that is useful for
> >>>>>>>>>>> developers to analyse the pagefault.
> >>>>>>>>>> Well actually those information are not that interesting becau=
se
> >>>>>>>>>> they are hw generation specific.
> >>>>>>>>>>
> >>>>>>>>>> You should probably rather use the decoded strings here, e.g. =
hub,
> >>>>>>>>>> client, xcc_id, node_id etc...
> >>>>>>>>>>
> >>>>>>>>>> See gmc_v9_0_process_interrupt() an example.
> >>>>>>>>>> I saw this v9 does provide more information than what v10 and =
v11
> >>>>>>>>>> provide like node_id and fault from which die but thats again =
very
> >>>>>>>>>> specific to IP_VERSION(9, 4, 3)) i dont know why thats informa=
tion
> >>>>>>>>>> is not there in v10 and v11.
> >>>>>>>>> I agree to your point but, as of now during a pagefault we are
> >>>>>>>>> dumping this information which is useful like which client
> >>>>>>>>> has generated an interrupt and for which src and other informat=
ion
> >>>>>>>>> like address. So i think to provide the similar information in =
the
> >>>>>>>>> devcoredump.
> >>>>>>>>>
> >>>>>>>>> Currently we do not have all this information from either job o=
r vm
> >>>>>>>>> being derived from the job during a reset. We surely could add =
more
> >>>>>>>>> relevant information later on as per request but this
> >>>>>>>>> information is
> >>>>>>>>> useful as
> >>>>>>>>> eventually its developers only who would use the dump file prov=
ided
> >>>>>>>>> by customer to debug.
> >>>>>>>>>
> >>>>>>>>> Below is the information that i dump in devcore and i feel that=
 is
> >>>>>>>>> good information but new information could be added which could=
 be
> >>>>>>>>> picked later.
> >>>>>>>>>
> >>>>>>>>>> Page fault information
> >>>>>>>>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
> >>>>>>>>>> in page starting at address 0x0000000000000000 from client 0x1=
b
> >>>>>>>>>> (UTCL2)
> >>>>>>>> This is a perfect example what I mean. You record in the patch i=
s
> >>>>>>>> the
> >>>>>>>> client_id, but this is is basically meaningless unless you have
> >>>>>>>> access
> >>>>>>>> to the AMD internal hw documentation.
> >>>>>>>>
> >>>>>>>> What you really need is the client in decoded form, in this case
> >>>>>>>> UTCL2. You can keep the client_id additionally, but the decoded
> >>>>>>>> client
> >>>>>>>> string is mandatory to have I think.
> >>>>>>>>
> >>>>>>>> Sure i am capturing that information as i am trying to minimise =
the
> >>>>>>>> memory interaction to minimum as we are still in interrupt conte=
xt
> >>>>>>>> here that why i recorded the integer information compared to
> >>>>>>>> decoding
> >>>>>>> and writing strings there itself but to postpone till we dump.
> >>>>>>>
> >>>>>>> Like decoding to the gfxhub/mmhub based on vmhub/vmid_src and cli=
ent
> >>>>>>> string from client id. So are we good to go with the information =
with
> >>>>>>> the above information of sharing details in devcoredump using the
> >>>>>>> additional information from pagefault cached.
> >>>>>> I think amdgpu_vm_fault_info() has everything you need already (vm=
hub,
> >>>>>> status, and addr).  client_id and src_id are just tokens in the
> >>>>>> interrupt cookie so we know which IP to route the interrupt to. We
> >>>>>> know what they will be because otherwise we'd be in the interrupt
> >>>>>> handler for a different IP.  I don't think ring_id has any useful
> >>>>>> information in this context and vmid and pasid are probably not to=
o
> >>>>>> useful because they are just tokens to associate the fault with a
> >>>>>> process.  It would be better to have the process name.
> >>>> Just to share context here Alex, i am preparing this for devcoredump=
,
> >>>> my intention was to replicate the information which in KMD we are
> >>>> sharing in Dmesg for page faults. If assuming we do not add client i=
d
> >>>> specially we would not be able to share enough information in
> >>>> devcoredump.
> >>>> It would be just address and hub(gfxhub/mmhub) and i think that is
> >>>> partial information as src id and client id and ip block shares good
> >>>> information.
> >>>>
> >>>> For process related information we are capturing that information
> >>>> part of dump from existing functionality.
> >>>> **** AMDGPU Device Coredump ****
> >>>> version: 1
> >>>> kernel: 6.7.0-amd-staging-drm-next
> >>>> module: amdgpu
> >>>> time: 45.084775181
> >>>> process_name: soft_recovery_p PID: 1780
> >>>>
> >>>> Ring timed out details
> >>>> IP Type: 0 Ring Name: gfx_0.0.0
> >>>>
> >>>> Page fault information
> >>>> [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:32773)
> >>>> in page starting at address 0x0000000000000000 from client 0x1b (UTC=
L2)
> >>>> VRAM is lost due to GPU reset!
> >>>>
> >>>> Regards
> >>>> Sunil
> >>>>
> >>>>> The decoded client name would be really useful I think since the
> >>>>> fault handled is a catch all and handles a whole bunch of different
> >>>>> clients.
> >>>>>
> >>>>> But that should be ideally passed in as const string instead of the
> >>>>> hw generation specific client_id.
> >>>>>
> >>>>> As long as it's only a pointer we also don't run into the trouble
> >>>>> that we need to allocate memory for it.
> >>>> I agree but i prefer adding the client id and decoding it in
> >>>> devcorecump using soc15_ih_clientid_name[fault_info->client_id]) is
> >>>> better else we have to do an sprintf this string to fault_info in ir=
q
> >>>> context which is writing more bytes to memory i guess compared to an
> >>>> integer:)
> >>> Well I totally agree that we shouldn't fiddle to much in the interrup=
t
> >>> handler, but exactly what you suggest here won't work.
> >>>
> >>> The client_id is hw generation specific, so the only one who has that
> >>> is the hw generation specific fault handler. Just compare the defines
> >>> here:
> >>>
> >>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c#L83
> >>>
> >>>
> >>> and here:
> >>>
> >>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/am=
dgpu/gfxhub_v11_5_0.c#L38
> >>>
> >>>
> >> Got your point. Let me see but this is a lot of work in irq context.
> >> Either we can drop totally the client id thing as alex is suggesting
> >> here as its always be same client and src id or let me come up with a
> >> patch and see if its acceptable.
> >>
> >> Also as Alex pointed we need to decode from status register which kind
> >> of page fault it is (permission, read, write etc) this all is again
> >> family specific and thats all in IRQ context. Not feeling good about i=
t
> >> but let me try to share all that in a new patch.
> >>
> > I don't think you need to decode it.  As long as you have a way to
> > identify the chip, we can just include the raw status register and the
> > developer can decode it when they look at the devcoredump.
>
> Got it Alex.
> I will try to add chip information along with status register value
> only. We have below two values in adev, i think this along with status
> register should suffice.
> enum amd_asic_type        asic_type;

You can skip asic_type.  It's not really used anymore.

> uint32_t            family;

Please also include the PCI DID, VID and RID and
amdgpu_ip_version(adev, GC_HWIP, 0).  You can include all of the IP
versions if you want for completeness, but GC should be enough.

Alex

>
> Regards
> Sunil Khatri
>
> >
> > Alex
> >
> >
> >> Regards
> >> Sunil.
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>> We can argue on values like pasid and vmid and ring id to be taken
> >>>> off if they are totally not useful.
> >>>>
> >>>> Regards
> >>>> Sunil
> >>>>
> >>>>> Christian.
> >>>>>
> >>>>>> Alex
> >>>>>>
> >>>>>>> regards
> >>>>>>> sunil
> >>>>>>>
> >>>>>>>> Regards,
> >>>>>>>> Christian.
> >>>>>>>>
> >>>>>>>>> Regards
> >>>>>>>>> Sunil Khatri
> >>>>>>>>>
> >>>>>>>>>> Regards,
> >>>>>>>>>> Christian.
> >>>>>>>>>>
> >>>>>>>>>>> Add all such information in the last cached
> >>>>>>>>>>> pagefault from an interrupt handler.
> >>>>>>>>>>>
> >>>>>>>>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> >>>>>>>>>>> ---
> >>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
> >>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h | 7 ++++++-
> >>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 2 +-
> >>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c | 2 +-
> >>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c  | 2 +-
> >>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c  | 2 +-
> >>>>>>>>>>>     drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c  | 2 +-
> >>>>>>>>>>>     7 files changed, 18 insertions(+), 8 deletions(-)
> >>>>>>>>>>>
> >>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>>>>>> index 4299ce386322..b77e8e28769d 100644
> >>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> >>>>>>>>>>> @@ -2905,7 +2905,7 @@ void amdgpu_debugfs_vm_bo_info(struct
> >>>>>>>>>>> amdgpu_vm *vm, struct seq_file *m)
> >>>>>>>>>>>      * Cache the fault info for later use by userspace in
> >>>>>>>>>>> debugging.
> >>>>>>>>>>>      */
> >>>>>>>>>>>     void amdgpu_vm_update_fault_cache(struct amdgpu_device *a=
dev,
> >>>>>>>>>>> -                  unsigned int pasid,
> >>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
> >>>>>>>>>>>                       uint64_t addr,
> >>>>>>>>>>>                       uint32_t status,
> >>>>>>>>>>>                       unsigned int vmhub)
> >>>>>>>>>>> @@ -2915,7 +2915,7 @@ void amdgpu_vm_update_fault_cache(struc=
t
> >>>>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>>> xa_lock_irqsave(&adev->vm_manager.pasids, flags);
> >>>>>>>>>>>     -    vm =3D xa_load(&adev->vm_manager.pasids, pasid);
> >>>>>>>>>>> +    vm =3D xa_load(&adev->vm_manager.pasids, entry->pasid);
> >>>>>>>>>>>         /* Don't update the fault cache if status is 0.  In t=
he
> >>>>>>>>>>> multiple
> >>>>>>>>>>>          * fault case, subsequent faults will return a 0 stat=
us
> >>>>>>>>>>> which is
> >>>>>>>>>>>          * useless for userspace and replaces the useful faul=
t
> >>>>>>>>>>> status, so
> >>>>>>>>>>> @@ -2924,6 +2924,11 @@ void amdgpu_vm_update_fault_cache(stru=
ct
> >>>>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>>>         if (vm && status) {
> >>>>>>>>>>>             vm->fault_info.addr =3D addr;
> >>>>>>>>>>>             vm->fault_info.status =3D status;
> >>>>>>>>>>> +        vm->fault_info.client_id =3D entry->client_id;
> >>>>>>>>>>> +        vm->fault_info.src_id =3D entry->src_id;
> >>>>>>>>>>> +        vm->fault_info.vmid =3D entry->vmid;
> >>>>>>>>>>> +        vm->fault_info.pasid =3D entry->pasid;
> >>>>>>>>>>> +        vm->fault_info.ring_id =3D entry->ring_id;
> >>>>>>>>>>>             if (AMDGPU_IS_GFXHUB(vmhub)) {
> >>>>>>>>>>>                 vm->fault_info.vmhub =3D AMDGPU_VMHUB_TYPE_GF=
X;
> >>>>>>>>>>>                 vm->fault_info.vmhub |=3D
> >>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>>>>>> index 047ec1930d12..c7782a89bdb5 100644
> >>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> >>>>>>>>>>> @@ -286,6 +286,11 @@ struct amdgpu_vm_fault_info {
> >>>>>>>>>>>         uint32_t    status;
> >>>>>>>>>>>         /* which vmhub? gfxhub, mmhub, etc. */
> >>>>>>>>>>>         unsigned int    vmhub;
> >>>>>>>>>>> +    unsigned int    client_id;
> >>>>>>>>>>> +    unsigned int    src_id;
> >>>>>>>>>>> +    unsigned int    ring_id;
> >>>>>>>>>>> +    unsigned int    pasid;
> >>>>>>>>>>> +    unsigned int    vmid;
> >>>>>>>>>>>     };
> >>>>>>>>>>>       struct amdgpu_vm {
> >>>>>>>>>>> @@ -605,7 +610,7 @@ static inline void
> >>>>>>>>>>> amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
> >>>>>>>>>>>     }
> >>>>>>>>>>>       void amdgpu_vm_update_fault_cache(struct amdgpu_device
> >>>>>>>>>>> *adev,
> >>>>>>>>>>> -                  unsigned int pasid,
> >>>>>>>>>>> +                  struct amdgpu_iv_entry *entry,
> >>>>>>>>>>>                       uint64_t addr,
> >>>>>>>>>>>                       uint32_t status,
> >>>>>>>>>>>                       unsigned int vmhub);
> >>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>>>>>> index d933e19e0cf5..6b177ce8db0e 100644
> >>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
> >>>>>>>>>>> @@ -150,7 +150,7 @@ static int gmc_v10_0_process_interrupt(st=
ruct
> >>>>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>>>             status =3D RREG32(hub->vm_l2_pro_fault_status);
> >>>>>>>>>>>             WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>>>>>>>>     -        amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>>>>>>>>> addr,
> >>>>>>>>>>> status,
> >>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, stat=
us,
> >>>>>>>>>>>                              entry->vmid_src ? AMDGPU_MMHUB0(=
0) :
> >>>>>>>>>>> AMDGPU_GFXHUB(0));
> >>>>>>>>>>>         }
> >>>>>>>>>>>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>>>>>> index 527dc917e049..bcf254856a3e 100644
> >>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c
> >>>>>>>>>>> @@ -121,7 +121,7 @@ static int gmc_v11_0_process_interrupt(st=
ruct
> >>>>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>>>             status =3D RREG32(hub->vm_l2_pro_fault_status);
> >>>>>>>>>>>             WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>>>>>>>>     -        amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>>>>>>>>> addr,
> >>>>>>>>>>> status,
> >>>>>>>>>>> +        amdgpu_vm_update_fault_cache(adev, entry, addr, stat=
us,
> >>>>>>>>>>>                              entry->vmid_src ? AMDGPU_MMHUB0(=
0) :
> >>>>>>>>>>> AMDGPU_GFXHUB(0));
> >>>>>>>>>>>         }
> >>>>>>>>>>>     diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>>>>>> index 3da7b6a2b00d..e9517ebbe1fd 100644
> >>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
> >>>>>>>>>>> @@ -1270,7 +1270,7 @@ static int
> >>>>>>>>>>> gmc_v7_0_process_interrupt(struct
> >>>>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>>>         if (!addr && !status)
> >>>>>>>>>>>             return 0;
> >>>>>>>>>>>     -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
> >>>>>>>>>>>                          ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT=
,
> >>>>>>>>>>> status, AMDGPU_GFXHUB(0));
> >>>>>>>>>>>           if (amdgpu_vm_fault_stop =3D=3D AMDGPU_VM_FAULT_STO=
P_FIRST)
> >>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>>>>>> index d20e5f20ee31..a271bf832312 100644
> >>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
> >>>>>>>>>>> @@ -1438,7 +1438,7 @@ static int
> >>>>>>>>>>> gmc_v8_0_process_interrupt(struct
> >>>>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>>>         if (!addr && !status)
> >>>>>>>>>>>             return 0;
> >>>>>>>>>>>     -    amdgpu_vm_update_fault_cache(adev, entry->pasid,
> >>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry,
> >>>>>>>>>>>                          ((u64)addr) << AMDGPU_GPU_PAGE_SHIFT=
,
> >>>>>>>>>>> status, AMDGPU_GFXHUB(0));
> >>>>>>>>>>>           if (amdgpu_vm_fault_stop =3D=3D AMDGPU_VM_FAULT_STO=
P_FIRST)
> >>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>>>>>> index 47b63a4ce68b..dc9fb1fb9540 100644
> >>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> >>>>>>>>>>> @@ -666,7 +666,7 @@ static int gmc_v9_0_process_interrupt(str=
uct
> >>>>>>>>>>> amdgpu_device *adev,
> >>>>>>>>>>>         rw =3D REG_GET_FIELD(status,
> >>>>>>>>>>> VM_L2_PROTECTION_FAULT_STATUS, RW);
> >>>>>>>>>>>         WREG32_P(hub->vm_l2_pro_fault_cntl, 1, ~1);
> >>>>>>>>>>>     -    amdgpu_vm_update_fault_cache(adev, entry->pasid, add=
r,
> >>>>>>>>>>> status, vmhub);
> >>>>>>>>>>> +    amdgpu_vm_update_fault_cache(adev, entry, addr, status,
> >>>>>>>>>>> vmhub);
> >>>>>>>>>>>           dev_err(adev->dev,
> >>>>>>>>>>> "VM_L2_PROTECTION_FAULT_STATUS:0x%08X\n",
