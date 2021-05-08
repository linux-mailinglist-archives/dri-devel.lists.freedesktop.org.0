Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815DF3770E8
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 11:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE446E875;
	Sat,  8 May 2021 09:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2022A6E870
 for <dri-devel@lists.freedesktop.org>; Sat,  8 May 2021 09:30:59 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id t11so16171105lfl.11
 for <dri-devel@lists.freedesktop.org>; Sat, 08 May 2021 02:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qtec.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eWJyRyeQ5MxvA7qcuiyWtFi5pFj6BXtkfVg0lxOlM48=;
 b=ONor3CYJ+G3cplIPzRuAHbRye/FwGNd69CMsXxLB7DF1f7B+iE7S7GcA997J3Y/9zv
 2Q6LVICRameG0dNDL9S1kiP45h7RO37u7mWg+QCzR6flp+jJg4iysGe40fU2ubu+MOs8
 l9CKAgwtYsJ8EmZFBe/8BpGNSatd1N/YDoS6/pmJwwMMa1px5rwKLILN4s97Z0VWo8lE
 tWpQGoChoQvXPXbjdpardWnm2H2H4VpXwFFjImjq++ugoYURb/LGFyyYhkc31Db7AJk7
 Nq4ll+ugY9Y+1YYSSZ5QQwQTYKwfEx5O8Q1AEkZhvfQ7pB+UXwBfy2iniKi14+MehD2b
 x4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eWJyRyeQ5MxvA7qcuiyWtFi5pFj6BXtkfVg0lxOlM48=;
 b=bBRd15X7FE5gJa7rPxvHQ1wyl6xH5vQNrwXSswMc0PQRRsAIUtMJrEH0o0tGLiVyyY
 uTq05OMuy7DKsZzDySZkw9VIhqhtIwVn76nEZgNurpf0j7UlGMQBG2D2ib16PLk6z7gH
 /FgmkaKOWbVA4xx29kw3FmDdf69PeeEbOGryLl1Z0UJsCLU1YzFqMUy4N1UmMyrCV2Gy
 1ffX4yS4b7tIUYybXjNwoJlK7zVXHzkarqxdibnt9Ba27uhilF47HbMzur3PcKkoOEjk
 IgKkUedw5nsKP/I48xObNw0kMQX0T6dk0uaxLDz/rK8A/HfH7fYBKItp+k2lh5/x1bWF
 Yx3w==
X-Gm-Message-State: AOAM532wYPaWlP2EPN+bqqh3p+MikjVm2j5a0si9JpxEsAkRWug7uSsQ
 OhwxnOWaUySJXrOuniY2dYxs82zDifdFiorTBaNQXg==
X-Google-Smtp-Source: ABdhPJwcMrHQNEMqUJXEnpuVQuWQ1t9VzK8eBl/rXycSqJgd1R1UV/10l4P7xu9ewe9JGqzRWaWkrKxYz76Hoa3hH1A=
X-Received: by 2002:a05:6512:304c:: with SMTP id
 b12mr9280009lfb.3.1620466257288; 
 Sat, 08 May 2021 02:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210318083236.43578-1-daniel@qtec.com>
 <MN2PR12MB37755DAAB03FC0065E98EF1183699@MN2PR12MB3775.namprd12.prod.outlook.com>
 <CADnq5_MMTBXt50sqJvYmXWn0uBALz2fNvpSrCfjSuMa99VLa=w@mail.gmail.com>
 <375f0915-83b3-c729-b95f-939d828d24d0@amd.com>
 <CAH1Ww+TNMpk-LYYaM=SG9XGK4wcGY3+w8rJzihUw=4EpzVV9EQ@mail.gmail.com>
 <aae87a0a-d643-8ee9-d0f8-e983f8613a88@gmail.com>
 <CADnq5_NbGz3UaXeTybZBeCSUwxaV8bNxKkaVwtLoZQGSvkbYYg@mail.gmail.com>
 <CAH1Ww+TSv3_LR_sf6hm_-i27=1Wb8Aay5FjOQq2Csh9jvKheCA@mail.gmail.com>
 <605b85ab-57ce-86ed-1899-8874450dd318@amd.com>
In-Reply-To: <605b85ab-57ce-86ed-1899-8874450dd318@amd.com>
From: Daniel Gomez <daniel@qtec.com>
Date: Sat, 8 May 2021 11:30:46 +0200
Message-ID: <CAH1Ww+QosqhDuK8JWnS_AK+DJd7Tf2uB7vnRSYNo_1bnn9tD_w@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/ttm: Fix memory leak userptr pages
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/alternative; boundary="000000000000a2f2b305c1ce3317"
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "dagmcr@gmail.com" <dagmcr@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a2f2b305c1ce3317
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi guys,


On Wed, 7 Apr 2021 at 11:27, Christian K=C3=B6nig <christian.koenig@amd.com=
>
wrote:

> Am 07.04.21 um 09:47 schrieb Daniel Gomez:
> > On Tue, 6 Apr 2021 at 22:56, Alex Deucher <alexdeucher@gmail.com> wrote=
:
> >> On Mon, Mar 22, 2021 at 6:34 AM Christian K=C3=B6nig
> >> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>> Hi Daniel,
> >>>
> >>> Am 22.03.21 um 10:38 schrieb Daniel Gomez:
> >>>> On Fri, 19 Mar 2021 at 21:29, Felix Kuehling <felix.kuehling@amd.com=
>
> wrote:
> >>>>> This caused a regression in kfdtest in a large-buffer stress test
> after
> >>>>> memory allocation for user pages fails:
> >>>> I'm sorry to hear that. BTW, I guess you meant amdgpu leak patch and
> >>>> not this one.
> >>>> Just some background for the mem leak patch if helps to understand
> this:
> >>>> The leak was introduce here:
> >>>>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommi=
t%2F%3Fid%3D0b988ca1c7c4c73983b4ea96ef7c2af2263c87eb&amp;data=3D04%7C01%7CC=
hristian.Koenig%40amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3dd8961fe488=
4e608e11a82d994e183d%7C0%7C0%7C637533784761980218%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3D%2FeOQf12NBkC3YGZ7QW66%2FT%2FpyM3DjEb9IMbqUvISMfo%3D&amp;reserved=
=3D0
> >>>> where the bound status was introduced for all drm drivers including
> >>>> radeon and amdgpu. So this patch just reverts the logic to the
> >>>> original code but keeping the bound status. In my case, the binding
> >>>> code allocates the user pages memory and returns without bounding (a=
t
> >>>> amdgpu_gtt_mgr_has_gart_addr). So,
> >>>> when the unbinding happens, the memory needs to be cleared to preven=
t
> the leak.
> >>> Ah, now I understand what's happening here. Daniel your patch is not
> >>> really correct.
> >>>
> >>> The problem is rather that we don't set the tt object to bound if it
> >>> doesn't have a GTT address.
> >>>
> >>> Going to provide a patch for this.
> >> Did this patch ever land?
> > I don't think so but I might send a v2 following Christian's comment
> > if you guys agree.
>
> Somebody else already provided a patch which I reviewed, but I'm not
> sure if that landed either.
>
> > Also, the patch here is for radeon but the pagefault issue reported by
> > Felix is affected by the amdgpu one:
> >
> > radeon patch: drm/radeon/ttm: Fix memory leak userptr pages
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.kernel.org%2Fproject%2Fdri-devel%2Fpatch%2F20210318083236.43578-1-dani=
el%40qtec.com%2F&amp;data=3D04%7C01%7CChristian.Koenig%40amd.com%7C65d21b6f=
02da409ac7b508d8f9997367%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63753=
3784761980218%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DHSMK%2FqYz%2Bzz9qbKc%2FITU=
WluBDeaW9YrgyH8p0L640%2F0%3D&amp;reserved=3D0
> >
> > amdgpu patch: drm/amdgpu/ttm: Fix memory leak userptr pages
> >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.kernel.org%2Fproject%2Fdri-devel%2Fpatch%2F20210317160840.36019-1-dani=
el%40qtec.com%2F&amp;data=3D04%7C01%7CChristian.Koenig%40amd.com%7C65d21b6f=
02da409ac7b508d8f9997367%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63753=
3784761980218%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DUsUZ4YjCSjHmzlPB07oTaGrsnt=
TrQSwlGk%2BxUjwDiag%3D&amp;reserved=3D0
> >
> > I assume both need to be fixed with the same approach.
>
> Yes correct. Let me double check where that fix went.


This patch (actually, the memory leak fix for amdgpu not radeon) has landed
in mainline and has been back-ported to the stable branches. I just want to
verify with you if that=E2=80=99s okay and the NULL pointer issue reported =
by Felix
is fixed by this other patch:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c?id=3D3c3dc654333f6389803cdcaf03912e9=
4173ae510

Thanks,
Daniel

>
>
> Thanks,
> Christian.
>
> >
> > Daniel
> >> Alex
> >>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>> [17359.536303] amdgpu: init_user_pages: Failed to get user pages: -=
16
> >>>>> [17359.543746] BUG: kernel NULL pointer dereference, address:
> 0000000000000000
> >>>>> [17359.551494] #PF: supervisor read access in kernel mode
> >>>>> [17359.557375] #PF: error_code(0x0000) - not-present page
> >>>>> [17359.563247] PGD 0 P4D 0
> >>>>> [17359.566514] Oops: 0000 [#1] SMP PTI
> >>>>> [17359.570728] CPU: 8 PID: 5944 Comm: kfdtest Not tainted
> 5.11.0-kfd-fkuehlin #193
> >>>>> [17359.578760] Hardware name: ASUS All Series/X99-E WS/USB 3.1, BIO=
S
> 3201 06/17/2016
> >>>>> [17359.586971] RIP: 0010:amdgpu_ttm_backend_unbind+0x52/0x110
> [amdgpu]
> >>>>> [17359.594075] Code: 48 39 c6 74 1b 8b 53 0c 48 8d bd 80 a1 ff ff e=
8
> 24 62 00 00 85 c0 0f 85 ab 00 00 00 c6 43 54 00 5b 5d c3 48 8b 46 10 8b 4=
e
> 50 <48> 8b 30 48 85 f6 74 ba 8b 50 0c 48 8b bf 80 a1 ff ff 83 e1 01 45
> >>>>> [17359.614340] RSP: 0018:ffffa4764971fc98 EFLAGS: 00010206
> >>>>> [17359.620315] RAX: 0000000000000000 RBX: ffff950e8d4edf00 RCX:
> 0000000000000000
> >>>>> [17359.628204] RDX: 0000000000000000 RSI: ffff950e8d4edf00 RDI:
> ffff950eadec5e80
> >>>>> [17359.636084] RBP: ffff950eadec5e80 R08: 0000000000000000 R09:
> 0000000000000000
> >>>>> [17359.643958] R10: 0000000000000246 R11: 0000000000000001 R12:
> ffff950c03377800
> >>>>> [17359.651833] R13: ffff950eadec5e80 R14: ffff950c03377858 R15:
> 0000000000000000
> >>>>> [17359.659701] FS:  00007febb20cb740(0000) GS:ffff950ebfc00000(0000=
)
> knlGS:0000000000000000
> >>>>> [17359.668528] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>>> [17359.675012] CR2: 0000000000000000 CR3: 00000006d700e005 CR4:
> 00000000001706e0
> >>>>> [17359.682883] Call Trace:
> >>>>> [17359.686063]  amdgpu_ttm_backend_destroy+0x12/0x70 [amdgpu]
> >>>>> [17359.692349]  ttm_bo_cleanup_memtype_use+0x37/0x60 [ttm]
> >>>>> [17359.698307]  ttm_bo_release+0x278/0x5e0 [ttm]
> >>>>> [17359.703385]  amdgpu_bo_unref+0x1a/0x30 [amdgpu]
> >>>>> [17359.708701]  amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu+0x7e5/0x910
> [amdgpu]
> >>>>> [17359.716307]  kfd_ioctl_alloc_memory_of_gpu+0x11a/0x220 [amdgpu]
> >>>>> [17359.723036]  kfd_ioctl+0x223/0x400 [amdgpu]
> >>>>> [17359.728017]  ? kfd_dev_is_large_bar+0x90/0x90 [amdgpu]
> >>>>> [17359.734152]  __x64_sys_ioctl+0x8b/0xd0
> >>>>> [17359.738796]  do_syscall_64+0x2d/0x40
> >>>>> [17359.743259]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> >>>>> [17359.749205] RIP: 0033:0x7febb083b6d7
> >>>>> [17359.753681] Code: b3 66 90 48 8b 05 b1 47 2d 00 64 c7 00 26 00 0=
0
> 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0=
f
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 47 2d 00 f7 d8 64 89 01 48
> >>>>> [17359.774340] RSP: 002b:00007ffdb5522cd8 EFLAGS: 00000202 ORIG_RAX=
:
> 0000000000000010
> >>>>> [17359.782668] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
> 00007febb083b6d7
> >>>>> [17359.790566] RDX: 00007ffdb5522d60 RSI: 00000000c0284b16 RDI:
> 0000000000000003
> >>>>> [17359.798459] RBP: 00007ffdb5522d10 R08: 00007ffdb5522dd0 R09:
> 00000000c4000004
> >>>>> [17359.806352] R10: 0000000000000000 R11: 0000000000000202 R12:
> 0000559416e4e2aa
> >>>>> [17359.814251] R13: 0000000000000000 R14: 0000000000000021 R15:
> 0000000000000000
> >>>>> [17359.822140] Modules linked in: ip6table_filter ip6_tables
> iptable_filter amdgpu x86_pkg_temp_thermal drm_ttm_helper ttm iommu_v2
> gpu_sched ip_tables x_tables
> >>>>> [17359.837776] CR2: 0000000000000000
> >>>>> [17359.841888] ---[ end trace a6f27d64475b28c8 ]---
> >>>>> [17359.847318] RIP: 0010:amdgpu_ttm_backend_unbind+0x52/0x110
> [amdgpu]
> >>>>> [17359.854479] Code: 48 39 c6 74 1b 8b 53 0c 48 8d bd 80 a1 ff ff e=
8
> 24 62 00 00 85 c0 0f 85 ab 00 00 00 c6 43 54 00 5b 5d c3 48 8b 46 10 8b 4=
e
> 50 <48> 8b 30 48 85 f6 74 ba 8b 50 0c 48 8b bf 80 a1 ff ff 83 e1 01 45
> >>>>> [17359.874929] RSP: 0018:ffffa4764971fc98 EFLAGS: 00010206
> >>>>> [17359.881014] RAX: 0000000000000000 RBX: ffff950e8d4edf00 RCX:
> 0000000000000000
> >>>>> [17359.889007] RDX: 0000000000000000 RSI: ffff950e8d4edf00 RDI:
> ffff950eadec5e80
> >>>>> [17359.897008] RBP: ffff950eadec5e80 R08: 0000000000000000 R09:
> 0000000000000000
> >>>>> [17359.905020] R10: 0000000000000246 R11: 0000000000000001 R12:
> ffff950c03377800
> >>>>> [17359.913034] R13: ffff950eadec5e80 R14: ffff950c03377858 R15:
> 0000000000000000
> >>>>> [17359.921050] FS:  00007febb20cb740(0000) GS:ffff950ebfc00000(0000=
)
> knlGS:0000000000000000
> >>>>> [17359.930047] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>>>> [17359.936674] CR2: 0000000000000000 CR3: 00000006d700e005 CR4:
> 00000000001706e0
> >>>>   From what I understand, the init_user_pages fails (returns EBUSY)
> and
> >>>> the code goes to allocate_init_user_pages_failed where the unbind an=
d
> >>>> the userptr clear occurs.
> >>>> Can we prevent this if we save the bounding status + userptr alloc? =
so
> >>>> the function amdgpu_ttm_backend_unbind returns without trying to cle=
ar
> >>>> the userptr memory?
> >>>>
> >>>> Something like:
> >>>>
> >>>> amdgpu_ttm_backend_bind:
> >>>>       if (gtt->userptr) {
> >>>>           r =3D amdgpu_ttm_tt_pin_userptr(bdev, ttm);
> >>>>           if (r) ...
> >>>>          gtt->sg_table =3D true;
> >>>>      }
> >>>>
> >>>> amdgpu_ttm_backend_unbind:
> >>>> if (gtt->sg_table) {
> >>>>           if (gtt->user_ptr) ...
> >>>> }
> >>>>
> >>>> If you agree, I'll send a v2 patch. Otherwise, maybe we could return
> >>>> within amdgpu_ttm_tt_unpin_userptr if memory hasn't been allocated.
> >>>>
> >>>> Any other ideas?
> >>>>
> >>>> Regards,
> >>>> Daniel
> >>>>
> >>>>> Reverting this patch fixes the problem for me.
> >>>>>
> >>>>> Regards,
> >>>>>      Felix
> >>>>>
> >>>>> On 2021-03-18 10:57 p.m., Alex Deucher wrote:
> >>>>>> Applied.  Thanks!
> >>>>>>
> >>>>>> Alex
> >>>>>>
> >>>>>> On Thu, Mar 18, 2021 at 5:00 AM Koenig, Christian
> >>>>>> <Christian.Koenig@amd.com> wrote:
> >>>>>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>>>> ________________________________
> >>>>>>> Von: Daniel Gomez <daniel@qtec.com>
> >>>>>>> Gesendet: Donnerstag, 18. M=C3=A4rz 2021 09:32
> >>>>>>> Cc: dagmcr@gmail.com <dagmcr@gmail.com>; Daniel Gomez <
> daniel@qtec.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig,
> Christian <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>;
> Daniel Vetter <daniel@ffwll.ch>; amd-gfx@lists.freedesktop.org <
> amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <
> dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <
> linux-kernel@vger.kernel.org>
> >>>>>>> Betreff: [PATCH] drm/radeon/ttm: Fix memory leak userptr pages
> >>>>>>>
> >>>>>>> If userptr pages have been pinned but not bounded,
> >>>>>>> they remain uncleared.
> >>>>>>>
> >>>>>>> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> >>>>>>> ---
> >>>>>>>     drivers/gpu/drm/radeon/radeon_ttm.c | 5 +++--
> >>>>>>>     1 file changed, 3 insertions(+), 2 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
> b/drivers/gpu/drm/radeon/radeon_ttm.c
> >>>>>>> index e8c66d10478f..bbcc6264d48f 100644
> >>>>>>> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> >>>>>>> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> >>>>>>> @@ -485,13 +485,14 @@ static void radeon_ttm_backend_unbind(struc=
t
> ttm_bo_device *bdev, struct ttm_tt
> >>>>>>>             struct radeon_ttm_tt *gtt =3D (void *)ttm;
> >>>>>>>             struct radeon_device *rdev =3D radeon_get_rdev(bdev);
> >>>>>>>
> >>>>>>> +       if (gtt->userptr)
> >>>>>>> +               radeon_ttm_tt_unpin_userptr(bdev, ttm);
> >>>>>>> +
> >>>>>>>             if (!gtt->bound)
> >>>>>>>                     return;
> >>>>>>>
> >>>>>>>             radeon_gart_unbind(rdev, gtt->offset, ttm->num_pages)=
;
> >>>>>>>
> >>>>>>> -       if (gtt->userptr)
> >>>>>>> -               radeon_ttm_tt_unpin_userptr(bdev, ttm);
> >>>>>>>             gtt->bound =3D false;
> >>>>>>>     }
> >>>>>>>
> >>>>>>> --
> >>>>>>> 2.30.2
> >>>>>>>
> >>>>>>> _______________________________________________
> >>>>>>> dri-devel mailing list
> >>>>>>> dri-devel@lists.freedesktop.org
> >>>>>>>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%7CChri=
stian.Koenig%40amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637533784761980218%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DaU9ZAl66EOLKphjWFPXJPR%2BTM%2BZeeMv%2BVJC6vliEqrs%3D&amp;reserved=3D=
0
> >>>>>> _______________________________________________
> >>>>>> dri-devel mailing list
> >>>>>> dri-devel@lists.freedesktop.org
> >>>>>>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%7CChri=
stian.Koenig%40amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637533784761980218%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DaU9ZAl66EOLKphjWFPXJPR%2BTM%2BZeeMv%2BVJC6vliEqrs%3D&amp;reserved=3D=
0
> >>>> _______________________________________________
> >>>> amd-gfx mailing list
> >>>> amd-gfx@lists.freedesktop.org
> >>>>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7CChrist=
ian.Koenig%40amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3dd8961fe4884e608=
e11a82d994e183d%7C0%7C0%7C637533784761980218%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3DUSmYbhfkSfPcE1npvsMfRwBr9Ijresh1fH4cAeNEr2M%3D&amp;reserved=3D0
>
>

--000000000000a2f2b305c1ce3317
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi guys,</div><div dir=3D"auto"><br></div><div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 7 Apr 20=
21 at 11:27, Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@am=
d.com">christian.koenig@amd.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">=
Am 07.04.21 um 09:47 schrieb Daniel Gomez:<br>
&gt; On Tue, 6 Apr 2021 at 22:56, Alex Deucher &lt;<a href=3D"mailto:alexde=
ucher@gmail.com" target=3D"_blank">alexdeucher@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Mon, Mar 22, 2021 at 6:34 AM Christian K=C3=B6nig<br>
&gt;&gt; &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.com" target=3D"=
_blank">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; Hi Daniel,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Am 22.03.21 um 10:38 schrieb Daniel Gomez:<br>
&gt;&gt;&gt;&gt; On Fri, 19 Mar 2021 at 21:29, Felix Kuehling &lt;<a href=
=3D"mailto:felix.kuehling@amd.com" target=3D"_blank">felix.kuehling@amd.com=
</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt; This caused a regression in kfdtest in a large-buffer =
stress test after<br>
&gt;&gt;&gt;&gt;&gt; memory allocation for user pages fails:<br>
&gt;&gt;&gt;&gt; I&#39;m sorry to hear that. BTW, I guess you meant amdgpu =
leak patch and<br>
&gt;&gt;&gt;&gt; not this one.<br>
&gt;&gt;&gt;&gt; Just some background for the mem leak patch if helps to un=
derstand this:<br>
&gt;&gt;&gt;&gt; The leak was introduce here:<br>
&gt;&gt;&gt;&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fto=
rvalds%2Flinux.git%2Fcommit%2F%3Fid%3D0b988ca1c7c4c73983b4ea96ef7c2af2263c8=
7eb&amp;amp;data=3D04%7C01%7CChristian.Koenig%40amd.com%7C65d21b6f02da409ac=
7b508d8f9997367%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63753378476198=
0218%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D%2FeOQf12NBkC3YGZ7QW66%2FT%2Fpy=
M3DjEb9IMbqUvISMfo%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" target=3D"_b=
lank">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
it.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fc=
ommit%2F%3Fid%3D0b988ca1c7c4c73983b4ea96ef7c2af2263c87eb&amp;amp;data=3D04%=
7C01%7CChristian.Koenig%40amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3dd8=
961fe4884e608e11a82d994e183d%7C0%7C0%7C637533784761980218%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C1000&amp;amp;sdata=3D%2FeOQf12NBkC3YGZ7QW66%2FT%2FpyM3DjEb9IMbqUvISMfo%3D&=
amp;amp;reserved=3D0</a><br>
&gt;&gt;&gt;&gt; where the bound status was introduced for all drm drivers =
including<br>
&gt;&gt;&gt;&gt; radeon and amdgpu. So this patch just reverts the logic to=
 the<br>
&gt;&gt;&gt;&gt; original code but keeping the bound status. In my case, th=
e binding<br>
&gt;&gt;&gt;&gt; code allocates the user pages memory and returns without b=
ounding (at<br>
&gt;&gt;&gt;&gt; amdgpu_gtt_mgr_has_gart_addr). So,<br>
&gt;&gt;&gt;&gt; when the unbinding happens, the memory needs to be cleared=
 to prevent the leak.<br>
&gt;&gt;&gt; Ah, now I understand what&#39;s happening here. Daniel your pa=
tch is not<br>
&gt;&gt;&gt; really correct.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The problem is rather that we don&#39;t set the tt object to b=
ound if it<br>
&gt;&gt;&gt; doesn&#39;t have a GTT address.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Going to provide a patch for this.<br>
&gt;&gt; Did this patch ever land?<br>
&gt; I don&#39;t think so but I might send a v2 following Christian&#39;s c=
omment<br>
&gt; if you guys agree.<br>
<br>
Somebody else already provided a patch which I reviewed, but I&#39;m not <b=
r>
sure if that landed either.<br>
<br>
&gt; Also, the patch here is for radeon but the pagefault issue reported by=
<br>
&gt; Felix is affected by the amdgpu one:<br>
&gt;<br>
&gt; radeon patch: drm/radeon/ttm: Fix memory leak userptr pages<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fdri-devel%2Fpatch%2F2021031808323=
6.43578-1-daniel%40qtec.com%2F&amp;amp;data=3D04%7C01%7CChristian.Koenig%40=
amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3dd8961fe4884e608e11a82d994e18=
3d%7C0%7C0%7C637533784761980218%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DHSMK=
%2FqYz%2Bzz9qbKc%2FITUWluBDeaW9YrgyH8p0L640%2F0%3D&amp;amp;reserved=3D0" re=
l=3D"noreferrer" target=3D"_blank">https://nam11.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fdri-devel%2Fpa=
tch%2F20210318083236.43578-1-daniel%40qtec.com%2F&amp;amp;data=3D04%7C01%7C=
Christian.Koenig%40amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637533784761980218%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;amp;sdata=3DHSMK%2FqYz%2Bzz9qbKc%2FITUWluBDeaW9YrgyH8p0L640%2F0%3D&amp;a=
mp;reserved=3D0</a><br>
&gt;<br>
&gt; amdgpu patch: drm/amdgpu/ttm: Fix memory leak userptr pages<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fdri-devel%2Fpatch%2F2021031716084=
0.36019-1-daniel%40qtec.com%2F&amp;amp;data=3D04%7C01%7CChristian.Koenig%40=
amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3dd8961fe4884e608e11a82d994e18=
3d%7C0%7C0%7C637533784761980218%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DUsUZ=
4YjCSjHmzlPB07oTaGrsntTrQSwlGk%2BxUjwDiag%3D&amp;amp;reserved=3D0" rel=3D"n=
oreferrer" target=3D"_blank">https://nam11.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fpatchwork.kernel.org%2Fproject%2Fdri-devel%2Fpatch%2F=
20210317160840.36019-1-daniel%40qtec.com%2F&amp;amp;data=3D04%7C01%7CChrist=
ian.Koenig%40amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3dd8961fe4884e608=
e11a82d994e183d%7C0%7C0%7C637533784761980218%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp=
;sdata=3DUsUZ4YjCSjHmzlPB07oTaGrsntTrQSwlGk%2BxUjwDiag%3D&amp;amp;reserved=
=3D0</a><br>
&gt;<br>
&gt; I assume both need to be fixed with the same approach.<br>
<br>
Yes correct. Let me double check where that fix went.</blockquote><div dir=
=3D"auto"><br></div><div dir=3D"auto">This patch (actually, the memory leak=
 fix for amdgpu not radeon) has landed in mainline and has been back-ported=
 to the stable branches. I just want to verify with you if that=E2=80=99s o=
kay and the NULL pointer issue reported by Felix is fixed by this other pat=
ch:</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div><a href=3D"http=
s://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drive=
rs/gpu/drm/amd/amdgpu/amdgpu_ttm.c?id=3D3c3dc654333f6389803cdcaf03912e94173=
ae510">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/c=
ommit/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c?id=3D3c3dc654333f6389803cdcaf=
03912e94173ae510</a></div><br></div><div dir=3D"auto">Thanks,</div><div dir=
=3D"auto">Daniel</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1=
ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Thanks,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Daniel<br>
&gt;&gt; Alex<br>
&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; [17359.536303] amdgpu: init_user_pages: Failed to get =
user pages: -16<br>
&gt;&gt;&gt;&gt;&gt; [17359.543746] BUG: kernel NULL pointer dereference, a=
ddress: 0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.551494] #PF: supervisor read access in kernel m=
ode<br>
&gt;&gt;&gt;&gt;&gt; [17359.557375] #PF: error_code(0x0000) - not-present p=
age<br>
&gt;&gt;&gt;&gt;&gt; [17359.563247] PGD 0 P4D 0<br>
&gt;&gt;&gt;&gt;&gt; [17359.566514] Oops: 0000 [#1] SMP PTI<br>
&gt;&gt;&gt;&gt;&gt; [17359.570728] CPU: 8 PID: 5944 Comm: kfdtest Not tain=
ted 5.11.0-kfd-fkuehlin #193<br>
&gt;&gt;&gt;&gt;&gt; [17359.578760] Hardware name: ASUS All Series/X99-E WS=
/USB 3.1, BIOS 3201 06/17/2016<br>
&gt;&gt;&gt;&gt;&gt; [17359.586971] RIP: 0010:amdgpu_ttm_backend_unbind+0x5=
2/0x110 [amdgpu]<br>
&gt;&gt;&gt;&gt;&gt; [17359.594075] Code: 48 39 c6 74 1b 8b 53 0c 48 8d bd =
80 a1 ff ff e8 24 62 00 00 85 c0 0f 85 ab 00 00 00 c6 43 54 00 5b 5d c3 48 =
8b 46 10 8b 4e 50 &lt;48&gt; 8b 30 48 85 f6 74 ba 8b 50 0c 48 8b bf 80 a1 f=
f ff 83 e1 01 45<br>
&gt;&gt;&gt;&gt;&gt; [17359.614340] RSP: 0018:ffffa4764971fc98 EFLAGS: 0001=
0206<br>
&gt;&gt;&gt;&gt;&gt; [17359.620315] RAX: 0000000000000000 RBX: ffff950e8d4e=
df00 RCX: 0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.628204] RDX: 0000000000000000 RSI: ffff950e8d4e=
df00 RDI: ffff950eadec5e80<br>
&gt;&gt;&gt;&gt;&gt; [17359.636084] RBP: ffff950eadec5e80 R08: 000000000000=
0000 R09: 0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.643958] R10: 0000000000000246 R11: 000000000000=
0001 R12: ffff950c03377800<br>
&gt;&gt;&gt;&gt;&gt; [17359.651833] R13: ffff950eadec5e80 R14: ffff950c0337=
7858 R15: 0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.659701] FS:=C2=A0 00007febb20cb740(0000) GS:fff=
f950ebfc00000(0000) knlGS:0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.668528] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0=
000000080050033<br>
&gt;&gt;&gt;&gt;&gt; [17359.675012] CR2: 0000000000000000 CR3: 00000006d700=
e005 CR4: 00000000001706e0<br>
&gt;&gt;&gt;&gt;&gt; [17359.682883] Call Trace:<br>
&gt;&gt;&gt;&gt;&gt; [17359.686063]=C2=A0 amdgpu_ttm_backend_destroy+0x12/0=
x70 [amdgpu]<br>
&gt;&gt;&gt;&gt;&gt; [17359.692349]=C2=A0 ttm_bo_cleanup_memtype_use+0x37/0=
x60 [ttm]<br>
&gt;&gt;&gt;&gt;&gt; [17359.698307]=C2=A0 ttm_bo_release+0x278/0x5e0 [ttm]<=
br>
&gt;&gt;&gt;&gt;&gt; [17359.703385]=C2=A0 amdgpu_bo_unref+0x1a/0x30 [amdgpu=
]<br>
&gt;&gt;&gt;&gt;&gt; [17359.708701]=C2=A0 amdgpu_amdkfd_gpuvm_alloc_memory_=
of_gpu+0x7e5/0x910 [amdgpu]<br>
&gt;&gt;&gt;&gt;&gt; [17359.716307]=C2=A0 kfd_ioctl_alloc_memory_of_gpu+0x1=
1a/0x220 [amdgpu]<br>
&gt;&gt;&gt;&gt;&gt; [17359.723036]=C2=A0 kfd_ioctl+0x223/0x400 [amdgpu]<br=
>
&gt;&gt;&gt;&gt;&gt; [17359.728017]=C2=A0 ? kfd_dev_is_large_bar+0x90/0x90 =
[amdgpu]<br>
&gt;&gt;&gt;&gt;&gt; [17359.734152]=C2=A0 __x64_sys_ioctl+0x8b/0xd0<br>
&gt;&gt;&gt;&gt;&gt; [17359.738796]=C2=A0 do_syscall_64+0x2d/0x40<br>
&gt;&gt;&gt;&gt;&gt; [17359.743259]=C2=A0 entry_SYSCALL_64_after_hwframe+0x=
44/0xa9<br>
&gt;&gt;&gt;&gt;&gt; [17359.749205] RIP: 0033:0x7febb083b6d7<br>
&gt;&gt;&gt;&gt;&gt; [17359.753681] Code: b3 66 90 48 8b 05 b1 47 2d 00 64 =
c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 =
10 00 00 00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 81 47 2d 00 f=
7 d8 64 89 01 48<br>
&gt;&gt;&gt;&gt;&gt; [17359.774340] RSP: 002b:00007ffdb5522cd8 EFLAGS: 0000=
0202 ORIG_RAX: 0000000000000010<br>
&gt;&gt;&gt;&gt;&gt; [17359.782668] RAX: ffffffffffffffda RBX: 000000000000=
0001 RCX: 00007febb083b6d7<br>
&gt;&gt;&gt;&gt;&gt; [17359.790566] RDX: 00007ffdb5522d60 RSI: 00000000c028=
4b16 RDI: 0000000000000003<br>
&gt;&gt;&gt;&gt;&gt; [17359.798459] RBP: 00007ffdb5522d10 R08: 00007ffdb552=
2dd0 R09: 00000000c4000004<br>
&gt;&gt;&gt;&gt;&gt; [17359.806352] R10: 0000000000000000 R11: 000000000000=
0202 R12: 0000559416e4e2aa<br>
&gt;&gt;&gt;&gt;&gt; [17359.814251] R13: 0000000000000000 R14: 000000000000=
0021 R15: 0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.822140] Modules linked in: ip6table_filter ip6_=
tables iptable_filter amdgpu x86_pkg_temp_thermal drm_ttm_helper ttm iommu_=
v2 gpu_sched ip_tables x_tables<br>
&gt;&gt;&gt;&gt;&gt; [17359.837776] CR2: 0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.841888] ---[ end trace a6f27d64475b28c8 ]---<br=
>
&gt;&gt;&gt;&gt;&gt; [17359.847318] RIP: 0010:amdgpu_ttm_backend_unbind+0x5=
2/0x110 [amdgpu]<br>
&gt;&gt;&gt;&gt;&gt; [17359.854479] Code: 48 39 c6 74 1b 8b 53 0c 48 8d bd =
80 a1 ff ff e8 24 62 00 00 85 c0 0f 85 ab 00 00 00 c6 43 54 00 5b 5d c3 48 =
8b 46 10 8b 4e 50 &lt;48&gt; 8b 30 48 85 f6 74 ba 8b 50 0c 48 8b bf 80 a1 f=
f ff 83 e1 01 45<br>
&gt;&gt;&gt;&gt;&gt; [17359.874929] RSP: 0018:ffffa4764971fc98 EFLAGS: 0001=
0206<br>
&gt;&gt;&gt;&gt;&gt; [17359.881014] RAX: 0000000000000000 RBX: ffff950e8d4e=
df00 RCX: 0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.889007] RDX: 0000000000000000 RSI: ffff950e8d4e=
df00 RDI: ffff950eadec5e80<br>
&gt;&gt;&gt;&gt;&gt; [17359.897008] RBP: ffff950eadec5e80 R08: 000000000000=
0000 R09: 0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.905020] R10: 0000000000000246 R11: 000000000000=
0001 R12: ffff950c03377800<br>
&gt;&gt;&gt;&gt;&gt; [17359.913034] R13: ffff950eadec5e80 R14: ffff950c0337=
7858 R15: 0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.921050] FS:=C2=A0 00007febb20cb740(0000) GS:fff=
f950ebfc00000(0000) knlGS:0000000000000000<br>
&gt;&gt;&gt;&gt;&gt; [17359.930047] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0=
000000080050033<br>
&gt;&gt;&gt;&gt;&gt; [17359.936674] CR2: 0000000000000000 CR3: 00000006d700=
e005 CR4: 00000000001706e0<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0From what I understand, the init_user_pages fa=
ils (returns EBUSY) and<br>
&gt;&gt;&gt;&gt; the code goes to allocate_init_user_pages_failed where the=
 unbind and<br>
&gt;&gt;&gt;&gt; the userptr clear occurs.<br>
&gt;&gt;&gt;&gt; Can we prevent this if we save the bounding status + userp=
tr alloc? so<br>
&gt;&gt;&gt;&gt; the function amdgpu_ttm_backend_unbind returns without try=
ing to clear<br>
&gt;&gt;&gt;&gt; the userptr memory?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Something like:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; amdgpu_ttm_backend_bind:<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gtt-&gt;userptr) {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_ttm_t=
t_pin_userptr(bdev, ttm);<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (r) ...<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtt-&gt;sg_table =3D tru=
e;<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; amdgpu_ttm_backend_unbind:<br>
&gt;&gt;&gt;&gt; if (gtt-&gt;sg_table) {<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (gtt-&gt;user_p=
tr) ...<br>
&gt;&gt;&gt;&gt; }<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; If you agree, I&#39;ll send a v2 patch. Otherwise, maybe w=
e could return<br>
&gt;&gt;&gt;&gt; within amdgpu_ttm_tt_unpin_userptr if memory hasn&#39;t be=
en allocated.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Any other ideas?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Daniel<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Reverting this patch fixes the problem for me.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Felix<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 2021-03-18 10:57 p.m., Alex Deucher wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; Applied.=C2=A0 Thanks!<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Alex<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Thu, Mar 18, 2021 at 5:00 AM Koenig, Christian<=
br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:Christian.Koenig@amd.com" ta=
rget=3D"_blank">Christian.Koenig@amd.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Reviewed-by: Christian K=C3=B6nig &lt;<a href=
=3D"mailto:christian.koenig@amd.com" target=3D"_blank">christian.koenig@amd=
.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ________________________________<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Von: Daniel Gomez &lt;<a href=3D"mailto:daniel=
@qtec.com" target=3D"_blank">daniel@qtec.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Gesendet: Donnerstag, 18. M=C3=A4rz 2021 09:32=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Cc: <a href=3D"mailto:dagmcr@gmail.com" target=
=3D"_blank">dagmcr@gmail.com</a> &lt;<a href=3D"mailto:dagmcr@gmail.com" ta=
rget=3D"_blank">dagmcr@gmail.com</a>&gt;; Daniel Gomez &lt;<a href=3D"mailt=
o:daniel@qtec.com" target=3D"_blank">daniel@qtec.com</a>&gt;; Deucher, Alex=
ander &lt;<a href=3D"mailto:Alexander.Deucher@amd.com" target=3D"_blank">Al=
exander.Deucher@amd.com</a>&gt;; Koenig, Christian &lt;<a href=3D"mailto:Ch=
ristian.Koenig@amd.com" target=3D"_blank">Christian.Koenig@amd.com</a>&gt;;=
 David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" target=3D"_blank">air=
lied@linux.ie</a>&gt;; Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch"=
 target=3D"_blank">daniel@ffwll.ch</a>&gt;; <a href=3D"mailto:amd-gfx@lists=
.freedesktop.org" target=3D"_blank">amd-gfx@lists.freedesktop.org</a> &lt;<=
a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@l=
ists.freedesktop.org</a>&gt;; <a href=3D"mailto:dri-devel@lists.freedesktop=
.org" target=3D"_blank">dri-devel@lists.freedesktop.org</a> &lt;<a href=3D"=
mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-devel@lists.f=
reedesktop.org</a>&gt;; <a href=3D"mailto:linux-kernel@vger.kernel.org" tar=
get=3D"_blank">linux-kernel@vger.kernel.org</a> &lt;<a href=3D"mailto:linux=
-kernel@vger.kernel.org" target=3D"_blank">linux-kernel@vger.kernel.org</a>=
&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Betreff: [PATCH] drm/radeon/ttm: Fix memory le=
ak userptr pages<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; If userptr pages have been pinned but not boun=
ded,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; they remain uncleared.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: Daniel Gomez &lt;<a href=3D"mai=
lto:daniel@qtec.com" target=3D"_blank">daniel@qtec.com</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0drivers/gpu/drm/radeon/rade=
on_ttm.c | 5 +++--<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A01 file changed, 3 insertion=
s(+), 2 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/radeon/radeon_ttm=
.c b/drivers/gpu/drm/radeon/radeon_ttm.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; index e8c66d10478f..bbcc6264d48f 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/radeon/radeon_ttm.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/radeon/radeon_ttm.c<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -485,13 +485,14 @@ static void radeon_ttm_b=
ackend_unbind(struct ttm_bo_device *bdev, struct ttm_tt<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct radeon_ttm_tt *gtt =3D (void *)ttm;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct radeon_device *rdev =3D radeon_get_rdev(bdev);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gtt-&gt;userpt=
r)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0radeon_ttm_tt_unpin_userptr(bdev, ttm);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (!gtt-&gt;bound)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0radeon_gart_unbind(rdev, gtt-&gt;offset, ttm-&gt;num_pages);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (gtt-&gt;userpt=
r)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0radeon_ttm_tt_unpin_userptr(bdev, ttm);<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0gtt-&gt;bound =3D false;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 2.30.2<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ______________________________________________=
_<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; dri-devel mailing list<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.=
org" target=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://nam11.safelinks.protection.=
outlook.com/?url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo=
%2Fdri-devel&amp;amp;data=3D04%7C01%7CChristian.Koenig%40amd.com%7C65d21b6f=
02da409ac7b508d8f9997367%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63753=
3784761980218%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DaU9ZAl66EOLKphjWFPXJPR=
%2BTM%2BZeeMv%2BVJC6vliEqrs%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" tar=
get=3D"_blank">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=
=3D04%7C01%7CChristian.Koenig%40amd.com%7C65d21b6f02da409ac7b508d8f9997367%=
7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637533784761980218%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;amp;sdata=3DaU9ZAl66EOLKphjWFPXJPR%2BTM%2BZeeMv%2BVJC6vliEq=
rs%3D&amp;amp;reserved=3D0</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; _______________________________________________<br=
>
&gt;&gt;&gt;&gt;&gt;&gt; dri-devel mailing list<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org"=
 target=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://nam11.safelinks.protection.outl=
ook.com/?url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fd=
ri-devel&amp;amp;data=3D04%7C01%7CChristian.Koenig%40amd.com%7C65d21b6f02da=
409ac7b508d8f9997367%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637533784=
761980218%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DaU9ZAl66EOLKphjWFPXJPR%2BT=
M%2BZeeMv%2BVJC6vliEqrs%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" target=
=3D"_blank">https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=3D=
04%7C01%7CChristian.Koenig%40amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3=
dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637533784761980218%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&amp;amp;sdata=3DaU9ZAl66EOLKphjWFPXJPR%2BTM%2BZeeMv%2BVJC6vliEqrs%=
3D&amp;amp;reserved=3D0</a><br>
&gt;&gt;&gt;&gt; _______________________________________________<br>
&gt;&gt;&gt;&gt; amd-gfx mailing list<br>
&gt;&gt;&gt;&gt; <a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D=
"_blank">amd-gfx@lists.freedesktop.org</a><br>
&gt;&gt;&gt;&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&a=
mp;amp;data=3D04%7C01%7CChristian.Koenig%40amd.com%7C65d21b6f02da409ac7b508=
d8f9997367%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637533784761980218%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DUSmYbhfkSfPcE1npvsMfRwBr9Ijresh1fH4c=
AeNEr2M%3D&amp;amp;reserved=3D0" rel=3D"noreferrer" target=3D"_blank">https=
://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.freede=
sktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%7C01%7CChristian=
.Koenig%40amd.com%7C65d21b6f02da409ac7b508d8f9997367%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C637533784761980218%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sd=
ata=3DUSmYbhfkSfPcE1npvsMfRwBr9Ijresh1fH4cAeNEr2M%3D&amp;amp;reserved=3D0</=
a><br>
<br>
</blockquote></div></div>

--000000000000a2f2b305c1ce3317--
