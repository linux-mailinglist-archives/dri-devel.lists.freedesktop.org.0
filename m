Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C226EF3A8
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 13:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5106F10E0A8;
	Wed, 26 Apr 2023 11:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15EB10E02A;
 Wed, 26 Apr 2023 11:50:48 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-94f0dd117dcso1025936566b.3; 
 Wed, 26 Apr 2023 04:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682509844; x=1685101844;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XF0xGBHcygJCTr9DzdnzFyeSKOCMIRoKzWbHkPb9VhY=;
 b=MCGhx/CQjW9fcbY26z9zbcRwNn59cGN4h712Ax0ubkNa/Ykdtaq/w053opUz2jcXZL
 5kgLHeP7bRh02ZZ5ocT63MoMP+gw/CL9gPRig8u4RFFVbpw2XyBsxG0mJlWYNdKAsTBD
 n1gLERaBnDy2pcT9PYY5iENt4FCNS+1apNKhWOQCzpAsGxGe/Ygws+D32/KkvoYWwxnP
 yc92RoMqvIcNwcsbbpPKuSwfU3jnGytfWzOqJ6EeD2nOz3IOUd5SHq2F1r67QFqSTv2I
 weNLD6V+3ZioZZFWJb0SFiqpG5+PoeG+7DQti2qe1ILxn+WS+CR4gYVXbHmSCYZxIvEN
 uSTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682509844; x=1685101844;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XF0xGBHcygJCTr9DzdnzFyeSKOCMIRoKzWbHkPb9VhY=;
 b=RZHilBFHsvA09gp06mpdrMnVJ9XTC6hUL6AggxkGisk7uScd4ScXVFF2SFox/l4nZ+
 /irryLs1AJ8qL1zjZ0f/Cp7PX7wpfCsKNt3WUMUlbGv/o1X4qDWtpu29AKTV21QfawiJ
 yaSiE1wG6YWlt8yLzY3lqOze/ONrr0l1d7CXatnuRFpXZValdTKEx3Du716EL9amOF4H
 1CABiDBgpRxU5JVcflPbVi90S1Jza7vhB4tIHy9BKZsw81pqHiNEAm5GcBoWKQVqOU4r
 sHhqZHG14dj8yYI0l+T5i3e9LwsfAczx4BO5By9hC/28WuZWUn3vJi0sWeTfjYT4LIIL
 EU4w==
X-Gm-Message-State: AAQBX9clrGo6xGun420x6RWR+bYhVbHQkr8Sn0uYKJpouL88PrYMYcLj
 mdhrqTLJrk5Rsl+tHu2eIW8=
X-Google-Smtp-Source: AKy350Z71KMuGV1F4MXStGrjlYbWN9Jx8ikRoIS+9QeyKM4R5f65g0VkG8B509qCbJbNUCiF8TkZVw==
X-Received: by 2002:a17:906:fd47:b0:94e:75f8:668 with SMTP id
 wi7-20020a170906fd4700b0094e75f80668mr14592285ejb.56.1682509844176; 
 Wed, 26 Apr 2023 04:50:44 -0700 (PDT)
Received: from [192.168.178.21] (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a1709060a0e00b0094efcc4a076sm8140458ejf.164.2023.04.26.04.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 04:50:43 -0700 (PDT)
Message-ID: <17626d0f-5f40-c483-deb5-bfba8b5daf97@gmail.com>
Date: Wed, 26 Apr 2023 13:50:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: BUG: KASAN: null-ptr-deref in drm_sched_job_cleanup+0x96/0x290
 [gpu_sched]
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: "Chen, Guchun" <Guchun.Chen@amd.com>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsPZxgpFzAVN=eFXu0WV+Jk0vB4rv4p+Jt31C841LcqV=A@mail.gmail.com>
 <CABXGCsO0sST8+MvQs=T1JP49ogRsaHPT9gMQZGJ3dY7v3m0H8g@mail.gmail.com>
 <CABXGCsOTEpJG_0NWdGXRvcXQ4iTav6AUJm-U4SQb-vVzjoL6rA@mail.gmail.com>
 <10b2570f-a297-d236-fa7b-2e001a4dff12@gmail.com>
 <CABXGCsPcPY8dqZm0aF4c1p0ZvMYHy+NksMrZi9xK0=WdE5_osA@mail.gmail.com>
 <d96519fb-9e12-5a81-a60b-384dcb286f28@gmail.com>
 <CABXGCsP2JQMtNjBROSLs2y612iLZuCyoe-uD6OScAWbKHBWsCA@mail.gmail.com>
 <b6ab0086-7d52-2a41-2f76-44694faed317@amd.com>
 <CABXGCsP+LSPE9fH4TW781w67ju=HrNMe9s0kigqBarketr_Qog@mail.gmail.com>
 <CABXGCsNSqJVv4Cerc3_P_59ioUZU2M7Z_TMp2yZKqe3si0QqyA@mail.gmail.com>
 <BL0PR12MB2465BE82A18038353E48E025F1659@BL0PR12MB2465.namprd12.prod.outlook.com>
 <989d7a71-ebfc-d245-9e05-a5a46085234e@amd.com>
In-Reply-To: <989d7a71-ebfc-d245-9e05-a5a46085234e@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sending that once more from my mailing list address since AMD internal 
servers are blocking the mail.

Regards,
Christian.

Am 26.04.23 um 13:48 schrieb Christian König:
> WTF? I own you a beer!
>
> I've fixed exactly that problem during the review process of the 
> cleanup patch and because of this didn't considered that the code is 
> still there.
>
> It also explains why we don't see that in our testing.
>
> @Mikhail can you test that patch with drm-misc-next?
>
> Thanks,
> Christian.
>
> Am 26.04.23 um 04:00 schrieb Chen, Guchun:
>> After reviewing this whole history, maybe attached patch is able to 
>> fix your problem. Can you have a try please?
>>
>> Regards,
>> Guchun
>>
>>> -----Original Message-----
>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>>> Mikhail Gavrilov
>>> Sent: Tuesday, April 25, 2023 9:20 PM
>>> To: Koenig, Christian <Christian.Koenig@amd.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>; dri-devel <dri-
>>> devel@lists.freedesktop.org>; amd-gfx list 
>>> <amd-gfx@lists.freedesktop.org>;
>>> Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
>>> Subject: Re: BUG: KASAN: null-ptr-deref in
>>> drm_sched_job_cleanup+0x96/0x290 [gpu_sched]
>>>
>>> On Thu, Apr 20, 2023 at 3:32 PM Mikhail Gavrilov
>>> <mikhail.v.gavrilov@gmail.com> wrote:
>>>> Important don't give up.
>>>> https://youtu.be/25zhHBGIHJ8 [40 min]
>>>> https://youtu.be/utnDR26eYBY [50 min]
>>>> https://youtu.be/DJQ_tiimW6g [12 min]
>>>> https://youtu.be/Y6AH1oJKivA [6 min]
>>>> Yes the issue is everything reproducible, but time to time it not
>>>> happens at first attempt.
>>>> I also uploaded other videos which proves that the issue definitely
>>>> exists if someone will launch those games in turn.
>>>> Reproducibility is only a matter of time.
>>>>
>>>> Anyway I didn't want you to spend so much time trying to reproduce it.
>>>> This monkey business fits me more than you.
>>>> It would be better if I could collect more useful info.
>>> Christian,
>>> Did you manage to reproduce the problem?
>>>
>>> At the weekend I faced with slab-use-after-free in
>>> amdgpu_vm_handle_moved.
>>> I didn't play in the games at this time.
>>> The Xwayland process was affected so it leads to desktop hang.
>>>
>>> ================================================================
>>> ==
>>> BUG: KASAN: slab-use-after-free in
>>> amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu] Read of size 8 at addr
>>> ffff888295c66190 by task Xwayland:cs0/173185
>>>
>>> CPU: 21 PID: 173185 Comm: Xwayland:cs0 Tainted: G        W L
>>> -------  --- 6.3.0-0.rc7.20230420gitcb0856346a60.59.fc39.x86_64+debug
>>> #1
>>> Hardware name: System manufacturer System Product Name/ROG STRIX
>>> X570-I GAMING, BIOS 4601 02/02/2023 Call Trace:
>>>   <TASK>
>>>   dump_stack_lvl+0x76/0xd0
>>>   print_report+0xcf/0x670
>>>   ? amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]  ?
>>> amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]
>>>   kasan_report+0xa8/0xe0
>>>   ? amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]
>>>   amdgpu_vm_handle_moved+0x286/0x2d0 [amdgpu]
>>>   amdgpu_cs_ioctl+0x2b7e/0x5630 [amdgpu]
>>>   ? __pfx___lock_acquire+0x10/0x10
>>>   ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]  ? 
>>> mark_lock+0x101/0x16e0  ?
>>> __lock_acquire+0xe54/0x59f0  ? __pfx_lock_release+0x10/0x10  ?
>>> __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
>>>   drm_ioctl_kernel+0x1fc/0x3d0
>>>   ? __pfx_drm_ioctl_kernel+0x10/0x10
>>>   drm_ioctl+0x4c5/0xaa0
>>>   ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]  ?
>>> __pfx_drm_ioctl+0x10/0x10  ? _raw_spin_unlock_irqrestore+0x66/0x80
>>>   ? lockdep_hardirqs_on+0x81/0x110
>>>   ? _raw_spin_unlock_irqrestore+0x4f/0x80
>>>   amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
>>>   __x64_sys_ioctl+0x131/0x1a0
>>>   do_syscall_64+0x60/0x90
>>>   ? do_syscall_64+0x6c/0x90
>>>   ? lockdep_hardirqs_on+0x81/0x110
>>>   ? do_syscall_64+0x6c/0x90
>>>   ? lockdep_hardirqs_on+0x81/0x110
>>>   ? do_syscall_64+0x6c/0x90
>>>   ? lockdep_hardirqs_on+0x81/0x110
>>>   ? do_syscall_64+0x6c/0x90
>>>   ? lockdep_hardirqs_on+0x81/0x110
>>>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>> RIP: 0033:0x7ffb71b0892d
>>> Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00
>>> 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> 
>>> c2 3d 00
>>> f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
>>> RSP: 002b:00007ffb677fe840 EFLAGS: 00000246 ORIG_RAX:
>>> 0000000000000010
>>> RAX: ffffffffffffffda RBX: 00007ffb677fe9f8 RCX: 00007ffb71b0892d
>>> RDX: 00007ffb677fe900 RSI: 00000000c0186444 RDI: 000000000000000d
>>> RBP: 00007ffb677fe890 R08: 00007ffb677fea50 R09: 00007ffb677fe8e0
>>> R10: 0000556c4611bec0 R11: 0000000000000246 R12: 00007ffb677fe900
>>> R13: 00000000c0186444 R14: 000000000000000d R15: 00007ffb677fe9f8
>>> </TASK>
>>>
>>> Allocated by task 173181:
>>>   kasan_save_stack+0x33/0x60
>>>   kasan_set_track+0x25/0x30
>>>   __kasan_kmalloc+0x8f/0xa0
>>>   __kmalloc_node+0x65/0x160
>>>   amdgpu_bo_create+0x31e/0xfb0 [amdgpu]
>>>   amdgpu_bo_create_user+0xca/0x160 [amdgpu]
>>>   amdgpu_gem_create_ioctl+0x398/0x980 [amdgpu]
>>>   drm_ioctl_kernel+0x1fc/0x3d0
>>>   drm_ioctl+0x4c5/0xaa0
>>>   amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
>>>   __x64_sys_ioctl+0x131/0x1a0
>>>   do_syscall_64+0x60/0x90
>>>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>>
>>> Freed by task 173185:
>>>   kasan_save_stack+0x33/0x60
>>>   kasan_set_track+0x25/0x30
>>>   kasan_save_free_info+0x2e/0x50
>>>   __kasan_slab_free+0x10b/0x1a0
>>>   slab_free_freelist_hook+0x11e/0x1d0
>>>   __kmem_cache_free+0xc0/0x2e0
>>>   ttm_bo_release+0x667/0x9e0 [ttm]
>>>   amdgpu_bo_unref+0x35/0x70 [amdgpu]
>>>   amdgpu_gem_object_free+0x73/0xb0 [amdgpu]
>>>   drm_gem_handle_delete+0xe3/0x150
>>>   drm_ioctl_kernel+0x1fc/0x3d0
>>>   drm_ioctl+0x4c5/0xaa0
>>>   amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
>>>   __x64_sys_ioctl+0x131/0x1a0
>>>   do_syscall_64+0x60/0x90
>>>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>>
>>> Last potentially related work creation:
>>>   kasan_save_stack+0x33/0x60
>>>   __kasan_record_aux_stack+0x97/0xb0
>>>   __call_rcu_common.constprop.0+0xf8/0x1af0
>>>   drm_sched_fence_release_scheduled+0xb8/0xe0 [gpu_sched]
>>>   dma_resv_reserve_fences+0x4dc/0x7f0
>>>   ttm_eu_reserve_buffers+0x3f6/0x1190 [ttm]
>>>   amdgpu_cs_ioctl+0x204d/0x5630 [amdgpu]
>>>   drm_ioctl_kernel+0x1fc/0x3d0
>>>   drm_ioctl+0x4c5/0xaa0
>>>   amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
>>>   __x64_sys_ioctl+0x131/0x1a0
>>>   do_syscall_64+0x60/0x90
>>>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>>
>>> Second to last potentially related work creation:
>>>   kasan_save_stack+0x33/0x60
>>>   __kasan_record_aux_stack+0x97/0xb0
>>>   __call_rcu_common.constprop.0+0xf8/0x1af0
>>>   drm_sched_fence_release_scheduled+0xb8/0xe0 [gpu_sched]
>>>   amdgpu_ctx_add_fence+0x2b1/0x390 [amdgpu]
>>>   amdgpu_cs_ioctl+0x44d0/0x5630 [amdgpu]
>>>   drm_ioctl_kernel+0x1fc/0x3d0
>>>   drm_ioctl+0x4c5/0xaa0
>>>   amdgpu_drm_ioctl+0xd2/0x1b0 [amdgpu]
>>>   __x64_sys_ioctl+0x131/0x1a0
>>>   do_syscall_64+0x60/0x90
>>>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
>>>
>>> The buggy address belongs to the object at ffff888295c66000 which 
>>> belongs
>>> to the cache kmalloc-1k of size 1024 The buggy address is located 
>>> 400 bytes
>>> inside of  freed 1024-byte region [ffff888295c66000, ffff888295c66400)
>>>
>>> The buggy address belongs to the physical page:
>>> page:00000000125ffbe3 refcount:1 mapcount:0 mapping:0000000000000000
>>> index:0x0 pfn:0x295c60
>>> head:00000000125ffbe3 order:3 entire_mapcount:0 nr_pages_mapped:0
>>> pincount:0 anon flags:
>>> 0x17ffffc0010200(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
>>> raw: 0017ffffc0010200 ffff88810004cdc0 0000000000000000
>>> dead000000000001
>>> raw: 0000000000000000 0000000000100010 00000001ffffffff
>>> 0000000000000000 page dumped because: kasan: bad access detected
>>>
>>> Memory state around the buggy address:
>>>   ffff888295c66080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>   ffff888295c66100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>> ffff888295c66180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>                           ^
>>>   ffff888295c66200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>>   ffff888295c66280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>> ================================================================
>>> ==
>>>
>>> -- 
>>> Best Regards,
>>> Mike Gavrilov.
>

