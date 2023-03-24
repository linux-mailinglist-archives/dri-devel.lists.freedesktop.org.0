Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D16C8000
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 15:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E4B10E536;
	Fri, 24 Mar 2023 14:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4675B10E536;
 Fri, 24 Mar 2023 14:37:35 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id ew6so8696308edb.7;
 Fri, 24 Mar 2023 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679668654;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DHjxc7YqFiruNYQh4lzhm2+VmJfX/7i5vzias2lKLP8=;
 b=LmaW6z7mTf9UR3LZkZW8pXgtWAJ7dyqkgupf8hnzQx2bHEz9TaQ4g3xxGrXpzWD/6G
 7U/aKRzwITvjr0L83G7XPykBI24y/8tshOgXBk2FZLZ2v36y3INEE7fRr7RAuyq/GMja
 hp+99PzFK/wiV9h3qSXGk/jB6rmByEdhlFbw3s5IxWoxuR0xSUcf5QbV61L/b76kI5GJ
 bVcG+i03NHcCyGaVpt22FVNDG5+lskcEnDRs3gTFedvL+azdWeabt5iaRbHWConk+njR
 wCvlBoEXQ3QOV0w8TOrD8xmfewnHFQ/eS8Tdknr+Cc89Yao7vpjCjSR2o48TJ2MekRnq
 UEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679668654;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DHjxc7YqFiruNYQh4lzhm2+VmJfX/7i5vzias2lKLP8=;
 b=PjS/JO1++oKySbq115heCU+1x3Yeo1fDG6zzgGVIt4laVcgNQxz3PKk1nfv6Or0ewy
 UL5vjao234GYDKSIGwYzEpdyrHQLIcNa8n4Tth2QsfigkUlzqbtqlQca9E+9asU7kIJ1
 TUMDZMhavU/bau/bJKtHsU9aP3nXRUBJdNFNgKMdObLBvLdxUsRNix8K1cncwC7m9Rp2
 Rxks6dw3EDZYdZfb3kyj2TWzgYZP/TCxDx0EiG5tdUimK/DoTtWWFrNQGOZiskxqBzFn
 GzaTTR+Ap+AhpIcc626dZp8LMPKHor/TnCTiY95n0+vROOr3EvWFqld2KFxGmDMPSV6f
 aujw==
X-Gm-Message-State: AAQBX9eLMFfnEDWhpyQtinEhrvT3qP5cgBmKZ3lAAkiyYLjrKsffNPOL
 93MavYWERFUjVpvuuUGCM5Y=
X-Google-Smtp-Source: AKy350beaNNiQbozUqU9TuWLhc3Bx41zp0ZZ7z0unEmWfBPAJAxfH7TtucTiHgBihBxiFiLuu17h1Q==
X-Received: by 2002:a17:906:4d8b:b0:92f:7c42:8631 with SMTP id
 s11-20020a1709064d8b00b0092f7c428631mr2925477eju.16.1679668653500; 
 Fri, 24 Mar 2023 07:37:33 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:9775:6320:cc82:f772?
 ([2a02:908:1256:79a0:9775:6320:cc82:f772])
 by smtp.gmail.com with ESMTPSA id
 ml23-20020a170906cc1700b0092ce8344078sm10367704ejb.33.2023.03.24.07.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 07:37:32 -0700 (PDT)
Message-ID: <d2862c24-c374-730a-4d7f-676a5fd21784@gmail.com>
Date: Fri, 24 Mar 2023 15:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: BUG: KASAN: slab-use-after-free in
 drm_sched_get_cleanup_job+0x47b/0x5c0 [gpu_sched]
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsMMzsYsMbFoX+ThrjVwq9DLnWiNhappxtmA=NAzPHYVMQ@mail.gmail.com>
 <66bb5e3a-c62b-d529-5c9b-f9d29bd51809@gmail.com>
 <CABXGCsOZciq2LtjYZ+g=9mxjtqTkkbzDgH-vWrkWZ+cdDxeTyQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABXGCsOZciq2LtjYZ+g=9mxjtqTkkbzDgH-vWrkWZ+cdDxeTyQ@mail.gmail.com>
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
Cc: "Grodzovsky, Andrey" <andrey.grodzovsky@amd.com>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.23 um 20:05 schrieb Mikhail Gavrilov:
> On Tue, Mar 21, 2023 at 11:47 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Hi Mikhail,
>>
>> That looks like a reference counting issue to me.
>>
>> I'm going to take a look, but we have already fixed one of those recently.
>>
>> Probably best that you try this on drm-fixes, just to double check that
>> this isn't the same issue.
>>
> Hi Christian,
> you meant this branch?
> $ git clone -b drm-fixes git://anongit.freedesktop.org/drm/drm linux-drm

Yeah, that one

Thanks for the info, looks like this isn't fixed.

Christian.

>
> If yes I just checked and unfortunately see this issue unfixed there.
>
> [ 1984.295833] ==================================================================
> [ 1984.295876] BUG: KASAN: slab-use-after-free in
> drm_sched_get_cleanup_job+0x47b/0x5c0 [gpu_sched]
> [ 1984.295898] Read of size 8 at addr ffff88814cadc4c0 by task sdma1/764
>
> [ 1984.295924] CPU: 12 PID: 764 Comm: sdma1 Tainted: G        W    L
>    6.3.0-rc3-drm-fixes+ #1
> [ 1984.295937] Hardware name: System manufacturer System Product
> Name/ROG STRIX X570-I GAMING, BIOS 4601 02/02/2023
> [ 1984.295951] Call Trace:
> [ 1984.295963]  <TASK>
> [ 1984.295975]  dump_stack_lvl+0x72/0xc0
> [ 1984.295991]  print_report+0xcf/0x670
> [ 1984.296007]  ? drm_sched_get_cleanup_job+0x47b/0x5c0 [gpu_sched]
> [ 1984.296030]  ? drm_sched_get_cleanup_job+0x47b/0x5c0 [gpu_sched]
> [ 1984.296047]  kasan_report+0xa4/0xe0
> [ 1984.296118]  ? drm_sched_get_cleanup_job+0x47b/0x5c0 [gpu_sched]
> [ 1984.296149]  drm_sched_get_cleanup_job+0x47b/0x5c0 [gpu_sched]
> [ 1984.296175]  drm_sched_main+0x643/0x990 [gpu_sched]
> [ 1984.296204]  ? __pfx_drm_sched_main+0x10/0x10 [gpu_sched]
> [ 1984.296222]  ? __pfx_autoremove_wake_function+0x10/0x10
> [ 1984.296290]  ? __kthread_parkme+0xc1/0x1f0
> [ 1984.296304]  ? __pfx_drm_sched_main+0x10/0x10 [gpu_sched]
> [ 1984.296321]  kthread+0x29e/0x340
> [ 1984.296334]  ? __pfx_kthread+0x10/0x10
> [ 1984.296501]  ret_from_fork+0x2c/0x50
> [ 1984.296518]  </TASK>
>
> [ 1984.296539] Allocated by task 12194:
> [ 1984.296552]  kasan_save_stack+0x2f/0x50
> [ 1984.296566]  kasan_set_track+0x21/0x30
> [ 1984.296578]  __kasan_kmalloc+0x8b/0x90
> [ 1984.296590]  amdgpu_driver_open_kms+0x10b/0x5a0 [amdgpu]
> [ 1984.297051]  drm_file_alloc+0x46e/0x880
> [ 1984.297064]  drm_open_helper+0x161/0x460
> [ 1984.297076]  drm_open+0x1e7/0x5c0
> [ 1984.297089]  drm_stub_open+0x24d/0x400
> [ 1984.297107]  chrdev_open+0x215/0x620
> [ 1984.297125]  do_dentry_open+0x5f1/0x1000
> [ 1984.297146]  path_openat+0x1b3d/0x28a0
> [ 1984.297164]  do_filp_open+0x1bd/0x400
> [ 1984.297180]  do_sys_openat2+0x140/0x420
> [ 1984.297197]  __x64_sys_openat+0x11f/0x1d0
> [ 1984.297213]  do_syscall_64+0x5b/0x80
> [ 1984.297231]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> [ 1984.297266] Freed by task 12195:
> [ 1984.297284]  kasan_save_stack+0x2f/0x50
> [ 1984.297303]  kasan_set_track+0x21/0x30
> [ 1984.297323]  kasan_save_free_info+0x2a/0x50
> [ 1984.297343]  __kasan_slab_free+0x107/0x1a0
> [ 1984.297361]  slab_free_freelist_hook+0x11e/0x1d0
> [ 1984.297373]  __kmem_cache_free+0xbc/0x2e0
> [ 1984.297385]  amdgpu_driver_postclose_kms+0x582/0x8d0 [amdgpu]
> [ 1984.297821]  drm_file_free.part.0+0x638/0xb70
> [ 1984.297834]  drm_release+0x1ea/0x470
> [ 1984.297845]  __fput+0x213/0x9e0
> [ 1984.297857]  task_work_run+0x11b/0x200
> [ 1984.297869]  exit_to_user_mode_prepare+0x23a/0x260
> [ 1984.297883]  syscall_exit_to_user_mode+0x16/0x50
> [ 1984.297896]  do_syscall_64+0x67/0x80
> [ 1984.297907]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> [ 1984.298033] Last potentially related work creation:
> [ 1984.298044]  kasan_save_stack+0x2f/0x50
> [ 1984.298057]  __kasan_record_aux_stack+0x97/0xb0
> [ 1984.298075]  __call_rcu_common.constprop.0+0xf8/0x1af0
> [ 1984.298095]  amdgpu_bo_list_put+0x1a4/0x1f0 [amdgpu]
> [ 1984.298557]  amdgpu_cs_parser_fini+0x293/0x5a0 [amdgpu]
> [ 1984.299055]  amdgpu_cs_ioctl+0x4f2a/0x5630 [amdgpu]
> [ 1984.299624]  drm_ioctl_kernel+0x1f8/0x3d0
> [ 1984.299637]  drm_ioctl+0x4c1/0xaa0
> [ 1984.299649]  amdgpu_drm_ioctl+0xce/0x1b0 [amdgpu]
> [ 1984.300083]  __x64_sys_ioctl+0x12d/0x1a0
> [ 1984.300097]  do_syscall_64+0x5b/0x80
> [ 1984.300109]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> [ 1984.300135] Second to last potentially related work creation:
> [ 1984.300149]  kasan_save_stack+0x2f/0x50
> [ 1984.300167]  __kasan_record_aux_stack+0x97/0xb0
> [ 1984.300185]  __call_rcu_common.constprop.0+0xf8/0x1af0
> [ 1984.300203]  amdgpu_bo_list_put+0x1a4/0x1f0 [amdgpu]
> [ 1984.300692]  amdgpu_cs_parser_fini+0x293/0x5a0 [amdgpu]
> [ 1984.301133]  amdgpu_cs_ioctl+0x4f2a/0x5630 [amdgpu]
> [ 1984.301577]  drm_ioctl_kernel+0x1f8/0x3d0
> [ 1984.301598]  drm_ioctl+0x4c1/0xaa0
> [ 1984.301610]  amdgpu_drm_ioctl+0xce/0x1b0 [amdgpu]
> [ 1984.302043]  __x64_sys_ioctl+0x12d/0x1a0
> [ 1984.302056]  do_syscall_64+0x5b/0x80
> [ 1984.302068]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
>
> [ 1984.302090] The buggy address belongs to the object at ffff88814cadc000
>                  which belongs to the cache kmalloc-4k of size 4096
> [ 1984.302103] The buggy address is located 1216 bytes inside of
>                  freed 4096-byte region [ffff88814cadc000, ffff88814cadd000)
>
> [ 1984.302129] The buggy address belongs to the physical page:
> [ 1984.302141] page:00000000103c1864 refcount:1 mapcount:0
> mapping:0000000000000000 index:0x0 pfn:0x14cad8
> [ 1984.302155] head:00000000103c1864 order:3 entire_mapcount:0
> nr_pages_mapped:0 pincount:0
> [ 1984.302168] flags:
> 0x17ffffc0010200(slab|head|node=0|zone=2|lastcpupid=0x1fffff)
> [ 1984.302184] raw: 0017ffffc0010200 ffff88810004d040 ffffea00311f0200
> dead000000000002
> [ 1984.302196] raw: 0000000000000000 0000000000040004 00000001ffffffff
> 0000000000000000
> [ 1984.302208] page dumped because: kasan: bad access detected
>
> [ 1984.302230] Memory state around the buggy address:
> [ 1984.302241]  ffff88814cadc380: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [ 1984.302252]  ffff88814cadc400: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [ 1984.302263] >ffff88814cadc480: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [ 1984.302274]                                            ^
> [ 1984.302285]  ffff88814cadc500: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [ 1984.302296]  ffff88814cadc580: fb fb fb fb fb fb fb fb fb fb fb fb
> fb fb fb fb
> [ 1984.302307] ==================================================================
> [ 1984.302339] Disabling lock debugging due to kernel taint
>

