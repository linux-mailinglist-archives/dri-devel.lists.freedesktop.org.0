Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4696EE2BF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 15:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A29F10E2A3;
	Tue, 25 Apr 2023 13:20:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C21410E291;
 Tue, 25 Apr 2023 13:20:05 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-74e07d97aeaso55951685a.1; 
 Tue, 25 Apr 2023 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682428804; x=1685020804;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dPg6SfS4S5qIc0SsszzUxTwFyGlk4cEDc8p3l837TIE=;
 b=eQ+e6K2lkYZ0Fjk6NVtmRuX3UFIkYNbg6i1iepkXkt0TZdh3pQcEBAD1IMUX5dqk9B
 Nb2s1G7G/AlOS7QkhIiSvRocQP7nAETk00MmDoNBFNtL1wyzQy8KuY4hi+j19Eldlk1X
 s3FBCrKo2Usp+nhxgWn1SgZvqdRkvIm2Q9KIF9db1EWePUsD/ejb3T64Hr0NeM5AEnVE
 vHa4EXTCITlQhg0BcI1+gdOHHj2y85Eo/zoLMsMCZnktDpAo1Jynl77OFUzDGzw4WRiQ
 GhoLjmeIyNf8h0kNFLKMJr3wKVtSfv6B2F9Fd/J+TP+qVp9f1qu0XpaUUckRtOQegyIh
 Uqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682428804; x=1685020804;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dPg6SfS4S5qIc0SsszzUxTwFyGlk4cEDc8p3l837TIE=;
 b=jLmuO1zSyn3ZPm8kdCFLJCl1VUv11rhD2L3unWZOekjs4wybaLw0V8F6CLywAcd7S+
 3IYzhBHrnHUqSKuUJzefy3uuPWO5Tv4O/PEvuK/uZbP4Dda34OxDt6v8oFTbv7sJiiHR
 RDVzE46KtvzVg8A0Np+PhooLcrK6AMY78TUSrE0iWQ7TS4yH30uG1uUXnnQ2kAoR+i8w
 Qg0GXvvnw7EJVWGWF1Lxw7bgQmHtBNhotpfp1dq3h7IBHUcJ2zMd4g/w/k2eBls0DKmI
 wuzdZe43bwExyuIuWe9Ko9bCXa1dP234kt3Jvj1ZU0liJbIyrZX/cXVqesV3XVwqU35K
 atQQ==
X-Gm-Message-State: AAQBX9dXmin2kCa8e4g3LWgM8L3C/CGigRlrvQ5eP2VGS6sgIo4VBwYI
 kngHiblEC2pE7CVXmd6n8ORnE7Sk48Gcam02FGU=
X-Google-Smtp-Source: AKy350a/7JZDIj4H/GrXMI7M22X1M/RjssfVeGvA8EtJ684C37HhZs13O2yIZt3QZKKbwpPgZCSqGXXFxG7cmTNtcEM=
X-Received: by 2002:a05:6214:4104:b0:5ef:5132:7af9 with SMTP id
 kc4-20020a056214410400b005ef51327af9mr25507916qvb.3.1682428803987; Tue, 25
 Apr 2023 06:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
 <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
 <CABXGCsOTEpJG_0NWdGXRvcXQ4iTav6AUJm-U4SQb-vVzjoL6rA@mail.gmail.com>
 <10b2570f-a297-d236-fa7b-2e001a4dff12@gmail.com>
 <CABXGCsPcPY8dqZm0aF4c1p0ZvMYHy+NksMrZi9xK0=WdE5_osA@mail.gmail.com>
 <d96519fb-9e12-5a81-a60b-384dcb286f28@gmail.com>
 <CABXGCsP2JQMtNjBROSLs2y612iLZuCyoe-uD6OScAWbKHBWsCA@mail.gmail.com>
 <b6ab0086-7d52-2a41-2f76-44694faed317@amd.com>
 <CABXGCsP+LSPE9fH4TW781w67ju=HrNMe9s0kigqBarketr_Qog@mail.gmail.com>
In-Reply-To: <CABXGCsP+LSPE9fH4TW781w67ju=HrNMe9s0kigqBarketr_Qog@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 25 Apr 2023 18:19:53 +0500
Message-ID: <CABXGCsNSqJVv4Cerc3_P_59ioUZU2M7Z_TMp2yZKqe3si0QqyA@mail.gmail.com>
Subject: Re: BUG: KASAN: null-ptr-deref in drm_sched_job_cleanup+0x96/0x290
 [gpu_sched]
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 20, 2023 at 3:32=E2=80=AFPM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> Important don't give up.
> https://youtu.be/25zhHBGIHJ8 [40 min]
> https://youtu.be/utnDR26eYBY [50 min]
> https://youtu.be/DJQ_tiimW6g [12 min]
> https://youtu.be/Y6AH1oJKivA [6 min]
> Yes the issue is everything reproducible, but time to time it not
> happens at first attempt.
> I also uploaded other videos which proves that the issue definitely
> exists if someone will launch those games in turn.
> Reproducibility is only a matter of time.
>
> Anyway I didn't want you to spend so much time trying to reproduce it.
> This monkey business fits me more than you.
> It would be better if I could collect more useful info.

Christian,
Did you manage to reproduce the problem?

At the weekend I faced with slab-use-after-free in amdgpu_vm_handle_moved.
I didn't play in the games at this time.
The Xwayland process was affected so it leads to desktop hang.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: slab-use-after-free in amdgpu_vm_handle_moved+0x286/0x2d0 [amdg=
pu]
Read of size 8 at addr ffff888295c66190 by task Xwayland:cs0/173185

CPU: 21 PID: 173185 Comm: Xwayland:cs0 Tainted: G        W    L
-------  ---  6.3.0-0.rc7.20230420gitcb0856346a60.59.fc39.x86_64+debug
#1
Hardware name: System manufacturer System Product Name/ROG STRIX
X570-I GAMING, BIOS 4601 02/02/2023
Call Trace:
 <TASK>
 dump_stack_lvl+0x76/0xd0
 print_report+0xcf/0x670
 ? amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]
 ? amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]
 kasan_report+0xa8/0xe0
 ? amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]
 amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]
 amdgpu_cs_ioctl+0x2b7e/0x5630 [amdgpu]
 ? __pfx___lock_acquire+0x10/0x10
 ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
 ? mark_lock+0x101/0x16e0
 ? __lock_acquire+0xe54/0x59f0
 ? __pfx_lock_release+0x10/0x10
 ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
 drm_ioctl_kernel+0x1fc/0x3d0
 ? __pfx_drm_ioctl_kernel+0x10/0x10
 drm_ioctl+0x4c5/0xaa0
 ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
 ? __pfx_drm_ioctl+0x10/0x10
 ? _raw_spin_unlock_irqrestore+0x66/0x80
 ? lockdep_hardirqs_on+0x81/0x110
 ? _raw_spin_unlock_irqrestore+0x4f/0x80
 amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
 __x64_sys_ioctl+0x131/0x1a0
 do_syscall_64+0x60/0x90
 ? do_syscall_64+0x6c/0x90
 ? lockdep_hardirqs_on+0x81/0x110
 ? do_syscall_64+0x6c/0x90
 ? lockdep_hardirqs_on+0x81/0x110
 ? do_syscall_64+0x6c/0x90
 ? lockdep_hardirqs_on+0x81/0x110
 ? do_syscall_64+0x6c/0x90
 ? lockdep_hardirqs_on+0x81/0x110
 entry_SYSCALL_64_after_hwframe+0x72/0xdc
RIP: 0033:0x7ffb71b0892d
Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00
00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2
3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
RSP: 002b:00007ffb677fe840 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffb677fe9f8 RCX: 00007ffb71b0892d
RDX: 00007ffb677fe900 RSI: 00000000c0186444 RDI: 000000000000000d
RBP: 00007ffb677fe890 R08: 00007ffb677fea50 R09: 00007ffb677fe8e0
R10: 0000556c4611bec0 R11: 0000000000000246 R12: 00007ffb677fe900
R13: 00000000c0186444 R14: 000000000000000d R15: 00007ffb677fe9f8
 </TASK>

Allocated by task 173181:
 kasan_save_stack+0x33/0x60
 kasan_set_track+0x25/0x30
 __kasan_kmalloc+0x8f/0xa0
 __kmalloc_node+0x65/0x160
 amdgpu_bo_create+0x31e/0xfb0 [amdgpu]
 amdgpu_bo_create_user+0xca/0x160 [amdgpu]
 amdgpu_gem_create_ioctl+0x398/0x980 [amdgpu]
 drm_ioctl_kernel+0x1fc/0x3d0
 drm_ioctl+0x4c5/0xaa0
 amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
 __x64_sys_ioctl+0x131/0x1a0
 do_syscall_64+0x60/0x90
 entry_SYSCALL_64_after_hwframe+0x72/0xdc

Freed by task 173185:
 kasan_save_stack+0x33/0x60
 kasan_set_track+0x25/0x30
 kasan_save_free_info+0x2e/0x50
 __kasan_slab_free+0x10b/0x1a0
 slab_free_freelist_hook+0x11e/0x1d0
 __kmem_cache_free+0xc0/0x2e0
 ttm_bo_release+0x667/0x9e0 [ttm]
 amdgpu_bo_unref+0x35/0x70 [amdgpu]
 amdgpu_gem_object_free+0x73/0xb0 [amdgpu]
 drm_gem_handle_delete+0xe3/0x150
 drm_ioctl_kernel+0x1fc/0x3d0
 drm_ioctl+0x4c5/0xaa0
 amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
 __x64_sys_ioctl+0x131/0x1a0
 do_syscall_64+0x60/0x90
 entry_SYSCALL_64_after_hwframe+0x72/0xdc

Last potentially related work creation:
 kasan_save_stack+0x33/0x60
 __kasan_record_aux_stack+0x97/0xb0
 __call_rcu_common.constprop.0+0xf8/0x1af0
 drm_sched_fence_release_scheduled+0xb8/0xe0 [gpu_sched]
 dma_resv_reserve_fences+0x4dc/0x7f0
 ttm_eu_reserve_buffers+0x3f6/0x1190 [ttm]
 amdgpu_cs_ioctl+0x204d/0x5630 [amdgpu]
 drm_ioctl_kernel+0x1fc/0x3d0
 drm_ioctl+0x4c5/0xaa0
 amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
 __x64_sys_ioctl+0x131/0x1a0
 do_syscall_64+0x60/0x90
 entry_SYSCALL_64_after_hwframe+0x72/0xdc

Second to last potentially related work creation:
 kasan_save_stack+0x33/0x60
 __kasan_record_aux_stack+0x97/0xb0
 __call_rcu_common.constprop.0+0xf8/0x1af0
 drm_sched_fence_release_scheduled+0xb8/0xe0 [gpu_sched]
 amdgpu_ctx_add_fence+0x2b1/0x390 [amdgpu]
 amdgpu_cs_ioctl+0x44d0/0x5630 [amdgpu]
 drm_ioctl_kernel+0x1fc/0x3d0
 drm_ioctl+0x4c5/0xaa0
 amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
 __x64_sys_ioctl+0x131/0x1a0
 do_syscall_64+0x60/0x90
 entry_SYSCALL_64_after_hwframe+0x72/0xdc

The buggy address belongs to the object at ffff888295c66000
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 400 bytes inside of
 freed 1024-byte region [ffff888295c66000, ffff888295c66400)

The buggy address belongs to the physical page:
page:00000000125ffbe3 refcount:1 mapcount:0 mapping:0000000000000000
index:0x0 pfn:0x295c60
head:00000000125ffbe3 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:=
0
anon flags: 0x17ffffc0010200(slab|head|node=3D0|zone=3D2|lastcpupid=3D0x1ff=
fff)
raw: 0017ffffc0010200 ffff88810004cdc0 0000000000000000 dead000000000001
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888295c66080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888295c66100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888295c66180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff888295c66200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888295c66280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--=20
Best Regards,
Mike Gavrilov.
