Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A9C420722
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 10:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E166E845;
	Mon,  4 Oct 2021 08:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC376E845;
 Mon,  4 Oct 2021 08:14:48 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 g198-20020a1c20cf000000b0030d60cd7fd6so4031390wmg.0; 
 Mon, 04 Oct 2021 01:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=epvwc8hMiy8V5DJnccM8xBXIHs3taEl4KDpfNE5pjLc=;
 b=CTnERKKkYFzRtpjW3+HA0DYBpwgqfR2xziugYruDteZVMB5h50TzUyJDC0B19mVb4F
 4TkmFr9908AXsPEDDLqt6BWORc6MdwJDpez6w+un/qktNPAzXUbRhxfA9M+MXhO2ExLl
 6evBMsXeTMU4sq6xvh1c8Q7OGiz66P0zj4mU9YFaD1U8jOuMJMRS13mFpxVs2sgR8EG4
 oFiVarWVAz6XbC+vLr/vQp7s2C8llqiM4viKbB/jl6zrQkGzEwlTMPQixJqzW0aXWOOE
 eTz5Duy5jtS4b1K616tuxAkYjTVsHA25KtovZf0X7mmjegSDN724/zzfx/l+U25miwQh
 2gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=epvwc8hMiy8V5DJnccM8xBXIHs3taEl4KDpfNE5pjLc=;
 b=hHYFqyEc1+fF37oA2vqBDCZF6OiyTbwV7Mo6PE0madDDLcSSv6/5NLzJ0FnvKF8IiQ
 Gtnh46omhVbsOEMUzVBlFu9FhKhugHjAtatR9bCHpKGkmTEMzD8p+pY+8+nXf75Kdwq4
 a1WGoAGMTBez86VGPSBmM85Dt8Chdedo1ZGqx65VALqFVxhFBQyK2JQLBE8xQcrPoeiC
 tXhdQAZxTFFwZG+8kIE9UZJq+iKczaciKFUxPGSa/Em4loVy8CLsNUYbQ3jHu0M+au3p
 aAqM6tt8vgSFdNv8wzHfMxUxpPTNJtYI00mV7PPuKc/uahHhvTui7x/xFKyVniSu+vxn
 zOqA==
X-Gm-Message-State: AOAM531hUwT/gyPXa10S/vaTcUvmcQqqdWT0CmfR7jA8mGlTiD/JIpFk
 aTKnFV/UmSiUZiPjDfstd81ZJUUPvOY=
X-Google-Smtp-Source: ABdhPJyNHh5rEdnpDzn3WQVM5IT6izTz5tjXFOIGkAVY7ie0KGA3lZyZS5WOGlABnBj2UZNSWTnLgg==
X-Received: by 2002:a1c:7704:: with SMTP id t4mr11122608wmi.167.1633335287274; 
 Mon, 04 Oct 2021 01:14:47 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id k17sm15357505wmj.0.2021.10.04.01.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:14:46 -0700 (PDT)
Subject: Re: Lockdep spalt on killing a processes
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
Date: Mon, 4 Oct 2021 10:14:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

The problem is a bit different.

The callback is on the dependent fence, while we need to signal the 
scheduler fence.

Daniel is right that this needs an irq_work struct to handle this properly.

Christian.

Am 01.10.21 um 17:10 schrieb Andrey Grodzovsky:
> From what I see here you supposed to have actual deadlock and not only 
> warning, sched_fence->finished is  first signaled from within
> hw fence done callback (drm_sched_job_done_cb) but then again from 
> within it's own callback (drm_sched_entity_kill_jobs_cb) and so
> looks like same fence  object is recursively signaled twice. This 
> leads to attempt to lock fence->lock second time while it's already
> locked. I don't see a need to call drm_sched_fence_finished from 
> within drm_sched_entity_kill_jobs_cb as this callback already registered
> on sched_fence->finished fence (entity->last_scheduled == 
> s_fence->finished) and hence the signaling already took place.
>
> Andrey
>
> On 2021-10-01 6:50 a.m., Christian König wrote:
>> Hey, Andrey.
>>
>> while investigating some memory management problems I've got the 
>> logdep splat below.
>>
>> Looks like something is wrong with drm_sched_entity_kill_jobs_cb(), 
>> can you investigate?
>>
>> Thanks,
>> Christian.
>>
>> [11176.741052] ============================================
>> [11176.741056] WARNING: possible recursive locking detected
>> [11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
>> [11176.741066] --------------------------------------------
>> [11176.741070] swapper/12/0 is trying to acquire lock:
>> [11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, at: 
>> dma_fence_signal+0x28/0x80
>> [11176.741088]
>>                but task is already holding lock:
>> [11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
>> dma_fence_signal+0x28/0x80
>> [11176.741100]
>>                other info that might help us debug this:
>> [11176.741104]  Possible unsafe locking scenario:
>>
>> [11176.741108]        CPU0
>> [11176.741110]        ----
>> [11176.741113]   lock(&fence->lock);
>> [11176.741118]   lock(&fence->lock);
>> [11176.741122]
>>                 *** DEADLOCK ***
>>
>> [11176.741125]  May be due to missing lock nesting notation
>>
>> [11176.741128] 2 locks held by swapper/12/0:
>> [11176.741133]  #0: ffff9c339c30f768 
>> (&ring->fence_drv.lock){-.-.}-{3:3}, at: dma_fence_signal+0x28/0x80
>> [11176.741142]  #1: ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
>> dma_fence_signal+0x28/0x80
>> [11176.741151]
>>                stack backtrace:
>> [11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 
>> 5.15.0-rc1-00031-g9d546d600800 #171
>> [11176.741160] Hardware name: System manufacturer System Product 
>> Name/PRIME X399-A, BIOS 0808 10/12/2018
>> [11176.741165] Call Trace:
>> [11176.741169]  <IRQ>
>> [11176.741173]  dump_stack_lvl+0x5b/0x74
>> [11176.741181]  dump_stack+0x10/0x12
>> [11176.741186]  __lock_acquire.cold+0x208/0x2df
>> [11176.741197]  lock_acquire+0xc6/0x2d0
>> [11176.741204]  ? dma_fence_signal+0x28/0x80
>> [11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
>> [11176.741219]  ? dma_fence_signal+0x28/0x80
>> [11176.741225]  dma_fence_signal+0x28/0x80
>> [11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>> [11176.741240]  drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
>> [11176.741248]  dma_fence_signal_timestamp_locked+0xac/0x1a0
>> [11176.741254]  dma_fence_signal+0x3b/0x80
>> [11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>> [11176.741268]  drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
>> [11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>> [11176.741284]  dma_fence_signal_timestamp_locked+0xac/0x1a0
>> [11176.741290]  dma_fence_signal+0x3b/0x80
>> [11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
>> [11176.741504]  sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
>> [11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
>> [11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
>> [11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
>> [11176.742393]  __handle_irq_event_percpu+0x4f/0x2c0
>> [11176.742402]  handle_irq_event_percpu+0x33/0x80
>> [11176.742408]  handle_irq_event+0x39/0x60
>> [11176.742414]  handle_edge_irq+0x93/0x1d0
>> [11176.742419]  __common_interrupt+0x50/0xe0
>> [11176.742426]  common_interrupt+0x80/0x90
>> [11176.742431]  </IRQ>
>> [11176.742436]  asm_common_interrupt+0x1e/0x40
>> [11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
>> [11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 ff e8 
>> 37 5d 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff fb 66 0f 1f 
>> 44 00 00 <45> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 2b 75 c8 48 8d 14 
>> 40 48 8d
>> [11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
>> [11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 RCX: 
>> 0000000000000000
>> [11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
>> ffffffff9efeed78
>> [11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 R09: 
>> 0000000000000001
>> [11176.742473] R10: 0000000000000001 R11: 0000000000000001 R12: 
>> ffff9c3350b0e800
>> [11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 R15: 
>> 0000000000000002
>> [11176.742483]  ? cpuidle_enter_state+0xf8/0x470
>> [11176.742489]  ? cpuidle_enter_state+0xf8/0x470
>> [11176.742495]  cpuidle_enter+0x2e/0x40
>> [11176.742500]  call_cpuidle+0x23/0x40
>> [11176.742506]  do_idle+0x201/0x280
>> [11176.742512]  cpu_startup_entry+0x20/0x30
>> [11176.742517]  start_secondary+0x11f/0x160
>> [11176.742523]  secondary_startup_64_no_verify+0xb0/0xbb
>>

