Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FB2A7553E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 09:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A267010E1D9;
	Sat, 29 Mar 2025 08:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Yl72oXYm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7731A10E1D9;
 Sat, 29 Mar 2025 08:47:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BE1485C4182;
 Sat, 29 Mar 2025 08:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7E4C4CEEA;
 Sat, 29 Mar 2025 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743238038;
 bh=UPs6afNysjVF8h/3+Y75VzGR39u1ywbOKXOZ8qPthPk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Yl72oXYmvX3q8szjT5m48a1PdMNmH1xaHw7uXm97vmDe/A/rOqwx9AhwJlARJiTQ5
 cKUreQwSu0TNLCX18YLW8RtAH5gjsDlhwOd1bNrlUGio+7hFmeLzztfNZgKtfQkS+M
 0FHgFP+8U37OuPibh+k2KRLZJKbiIZAik+lCiFMXXBigQ3w5dBwhieg+PwRzN+JQ8Y
 mvjC7oD/19rUgmu27p97DONxJD46PBltYErTa3uPvOQfOqhtI7bOMosSSV/y9ED6fv
 7KNt24Go47baUNCwgJU36o6V3AZjNCXxEj7rRJ56pZQZUpPr0m4kBP9b2XnQUyYmRF
 8iKmslesaY+pA==
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ac2a9a74d9cso535212066b.1; 
 Sat, 29 Mar 2025 01:47:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWIeBE4WJQ8wc29/JVq2pKcZKBAqqJOIM5No8HDwq/JsVxp6DxoP37TMm2SvZtwKBnSioKN0giS@lists.freedesktop.org,
 AJvYcCXK/l3+2W8dSoaM/qPhlmknECd4e7CKVZ/HMvnODSgqYpcCaE3AaqHhZlJQLaARntHXos9m3woj57X2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeqvO1G/N7Bsx8Abqn7oNk5HVcXBHzbznqrr5W5dPG2eaGnATN
 JYtEz2FbDla21xwlzV/R2gAMqyqi7KFgbZ/LXDK7SYnPWQ0FAorKiqcBVY3hDw/GU48v5SdwYvh
 H9xJfkgjJG5+TMds4UzGatVC1vtg=
X-Google-Smtp-Source: AGHT+IF0VwJJywkU/wSFDVMa3zB1GXQY8Jsc1CaI8i6cr3LbAsmuDOEj58wnqyoF+ZyYAKx5PRb6WxKG7WyUuzAv8Tc=
X-Received: by 2002:a17:907:9693:b0:ac3:3fe4:3378 with SMTP id
 a640c23a62f3a-ac738a0d30bmr188620766b.12.1743238036967; Sat, 29 Mar 2025
 01:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250318111717.2161235-1-chenhuacai@loongson.cn>
 <b8c481f2-a280-4f86-8080-2c6dcffc4629@amd.com>
 <CAAhV-H7cch+koOSJAFe70c8Pk02snK7M=andyfwbCgiNdg4aVg@mail.gmail.com>
 <87d0601b-c1cb-402b-aecd-23a5d371da66@amd.com>
 <712b77ef-c7f7-47a4-9609-47b179f15662@amd.com>
 <CAAhV-H6AMm1X4zyhj7-jqiaCpd-Yfco88d4KODd5_jUfhyi8Cg@mail.gmail.com>
 <4a4e462a-ac83-4515-a64e-25238fb67ef2@amd.com>
In-Reply-To: <4a4e462a-ac83-4515-a64e-25238fb67ef2@amd.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 29 Mar 2025 16:47:09 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4+nxxoLrDb2rgGt_n3wZ4Pw6wOyJJWZ7+16XqLVorvJg@mail.gmail.com>
X-Gm-Features: AQ5f1JpyQoLNtPjEGukjRjzBdFnwj3P_EQtLLbLcbs6kZ5m_sAja3ipoAi8Y-2Y
Message-ID: <CAAhV-H4+nxxoLrDb2rgGt_n3wZ4Pw6wOyJJWZ7+16XqLVorvJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Protect
 dml2_create()/dml2_copy()/dml2_create_copy()
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Alex Hung <alex.hung@amd.com>, Huacai Chen <chenhuacai@loongson.cn>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 stable@vger.kernel.org, Austin.Zheng@amd.com
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

Hi, Aurabindo,

On Sat, Mar 29, 2025 at 2:27=E2=80=AFAM Aurabindo Pillai
<aurabindo.pillai@amd.com> wrote:
>
>
>
> On 2025-03-26 21:40, Huacai Chen wrote:
> > Hi, Alex,
> >
> > On Thu, Mar 27, 2025 at 8:10=E2=80=AFAM Alex Hung <alex.hung@amd.com> w=
rote:
> >>
> >> The following error messages showed up on an APU and a dGPU during tes=
ting.
> >>
> >> <3> [100.231411] BUG: sleeping function called from invalid context at
> >> include/linux/sched/mm.h:321
> >> <3> [100.231414] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid=
:
> >> 1711, name: kms_color
> >> <3> [100.231416] preempt_count: 2, expected: 0
> >> <3> [100.231417] RCU nest depth: 0, expected: 0
> >> <3> [100.231418] Preemption disabled at:
> >> <3> [100.231419] [<ffffffffc0c2843b>] dc_fpu_begin+0x2b/0xc0 [amdgpu]
> >> <4> [100.231626] CPU: 4 UID: 0 PID: 1711 Comm: kms_color Tainted: G
> >>     W          6.12.0+ #1
> >> <4> [100.231629] Tainted: [W]=3DWARN
> >> <4> [100.231631] Call Trace:
> >> <4> [100.231632]  <TASK>
> >> <4> [100.231633]  dump_stack_lvl+0x5b/0x70
> >> <4> [100.231638]  dump_stack+0x10/0x20
> >> <4> [100.231639]  __might_resched+0x170/0x1d0
> >> <4> [100.231643]  __might_sleep+0x44/0x70
> >> <4> [100.231645]  __alloc_pages_noprof+0x22f/0x370
> >> <4> [100.231649]  ___kmalloc_large_node+0x95/0x150
> >> <4> [100.231651]  ? preempt_count_add+0x4e/0xc0
> >> <4> [100.231653]  __kmalloc_large_noprof+0x1d/0xb0
> >> <4> [100.231655]  dml2_create_copy+0x27/0x60 [amdgpu]
> >> <4> [100.231827]  dc_state_create_copy+0x7e/0x170 [amdgpu]
> >> <4> [100.231995]  update_planes_and_stream_state+0x23c/0x600 [amdgpu]
> >> <4> [100.232189]  update_planes_and_stream_v2+0x22b/0x530 [amdgpu]
> >> <4> [100.232366]  ? amdgpu_dm_atomic_commit_tail+0x1310/0x4100 [amdgpu=
]
> >> <4> [100.232569]  ? commit_tail+0x96/0x140 [drm_kms_helper]
> >> <4> [100.232577]  dc_update_planes_and_stream+0x5b/0xe0 [amdgpu]
> >> <4> [100.232730]  amdgpu_dm_atomic_commit_tail+0x1fa7/0x4100 [amdgpu]
> >> <4> [100.232908]  ? stack_depot_save_flags+0x2c/0x730
> >> <4> [100.232915]  ? wait_for_completion_timeout+0x1d/0x30
> >> <4> [100.232917]  commit_tail+0x96/0x140 [drm_kms_helper]
> >> <4> [100.232923]  drm_atomic_helper_commit+0x12b/0x150 [drm_kms_helper=
]
> >> <4> [100.232927]  drm_atomic_commit+0xad/0xe0 [drm]
> >> <4> [100.232939]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> >> <4> [100.232956]  drm_atomic_helper_set_config+0x80/0xc0 [drm_kms_help=
er]
> >> <4> [100.232961]  drm_mode_setcrtc+0x22e/0x910 [drm]
> >> <4> [100.232975]  ? kfree+0x18f/0x350
> >> <4> [100.232977]  ? __pfx_drm_mode_setcrtc+0x10/0x10 [drm]
> >> <4> [100.232987]  drm_ioctl_kernel+0xa7/0x100 [drm]
> >> <4> [100.233004]  drm_ioctl+0x29d/0x500 [drm]
> >> <4> [100.233015]  ? __pfx_drm_mode_setcrtc+0x10/0x10 [drm]
> >> <4> [100.233026]  ? _raw_spin_unlock_irqrestore+0x1f/0x40
> >> <4> [100.233029]  amdgpu_drm_ioctl+0x4b/0x80 [amdgpu]
> >> <4> [100.233131]  __x64_sys_ioctl+0x92/0xd0
> >> <4> [100.233133]  x64_sys_call+0x1205/0x20d0
> >> <4> [100.233136]  do_syscall_64+0x50/0x110
> >> <4> [100.233138]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >> <4> [100.233142] RIP: 0033:0x7fb21e71a94f
> >> <4> [100.233144] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24
> >> 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 0=
0
> >> 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28=
 00
> >> <4> [100.233145] RSP: 002b:00007ffdd9a52e50 EFLAGS: 00000246 ORIG_RAX:
> >> 0000000000000010
> >> <4> [100.233148] RAX: ffffffffffffffda RBX: 00007ffdd9a52ee0 RCX:
> >> 00007fb21e71a94f
> >> <4> [100.233149] RDX: 00007ffdd9a52ee0 RSI: 00000000c06864a2 RDI:
> >> 0000000000000005
> >> <4> [100.233149] RBP: 00000000c06864a2 R08: 0000000000000000 R09:
> >> 00005609537f7b08
> >> <4> [100.233150] R10: 0000000000000000 R11: 0000000000000246 R12:
> >> 0000000000000000
> >> <4> [100.233151] R13: 0000000000000005 R14: 0000000000000000 R15:
> >> 00005609537e2848
> >> <4> [100.233152]  </TASK>
> > This seems caused by dml2_allocate_memory(), to fix this we can only
> > protect FPU in DML2, I can do it in the new version, but I want to
> > listen Aurabindo's opinion.
> >
> >
>
> It looks like dml21_apply_soc_bb_overrides() does have some division on
> double variables. I'm curious why we dont see this on our side. Was this
> seen on x86 or Loongson?
It is seen on Loongson.

>
> I think your approach is correct. Thanks for taking time to fix this. We
> can add it to weekly testing if you send us a patch.
V2 is sent, please take a look.
https://lore.kernel.org/dri-devel/20250327095334.3327111-1-chenhuacai@loong=
son.cn/T/#t

Huacai
