Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B219643A35C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 21:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14CED6E158;
	Mon, 25 Oct 2021 19:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4846E158;
 Mon, 25 Oct 2021 19:56:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z14so13713776wrg.6;
 Mon, 25 Oct 2021 12:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=fu2Mi7DnL8iLdASq34yxD9huFIf/iOlmr0sSlsR66IU=;
 b=GAJTY0HPMn8Kr8cDoOwhpu9JfuXpQFdYx0A9rmngpzCPox61Ar/0leXT5XRf7HnX6q
 h99DgTH+KRtq2OcNRcGGGSkIgEYguRFC89Kt0/ynj+/4UHinDZ7aGkcK8QWooCJydeLl
 k1pw2DWwOxYMFQ9l+Gwe3uJKQJzrbRw72bynxmcfD0dJY/J/y1QMN7b/GcEwJ8+ESliD
 yGvxjQ+CbaIOww/7jAo4dPUoSPwXSFbIVADNqUlRQY85CBFfVDDfh416cg7N2L7QyPb+
 OSs//A34U5lVk+UUy/OzB2oaK8JEXMqq4d6RtkE+7hclARb0Lov2MSSsPVQebiyyZ4UC
 scpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=fu2Mi7DnL8iLdASq34yxD9huFIf/iOlmr0sSlsR66IU=;
 b=UAHMpxbCvecyYfZeNqLgoB+eH5EoDyaswzCTaf14esPFzrVZ80PWZjKNUJVUF7AIZT
 yUW0s1xlQulXt/DDmoKhuKDy8IOF0Gues6sn4egeS+MR/JzyVWiBCiG040wQP7QvncVI
 48CeeMomFWwl6A+e1kPtKEGaehUHcBNkowCoyDexuO6a8Ie9B8TPLjfhUxV0OuO85B7g
 0wPioTGnCVZH+5f2QARbTR4E1NywYGBdK6vfRmp5GHwYZskwpENOvMaXrfnQNdh59mBa
 NUtsQZQjZdpyOrx+yv719jZWa3hHyNNOFjGmjSO8v25q2epoNCHmxZY0duGVha/qId4i
 8mVg==
X-Gm-Message-State: AOAM533gqI3IYSV5V9x6B6D07Nt6CP96O9ZESsfTuhsWE6fWe8SCxgtQ
 xmEZ3heu0aqYp7BOK3Cm9b822oPk97c=
X-Google-Smtp-Source: ABdhPJxjxq77QEp4YNR/yYYTjC2QRtJGwU1yCezH4VnWc0aRvzGhRQSTXByE4mxGSTPGX7Wmy1E1PQ==
X-Received: by 2002:a5d:588a:: with SMTP id n10mr14865518wrf.285.1635191803186; 
 Mon, 25 Oct 2021 12:56:43 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5fb1:8fbc:4a43:8b8b?
 ([2a02:908:1252:fb60:5fb1:8fbc:4a43:8b8b])
 by smtp.gmail.com with ESMTPSA id d16sm9469520wrq.66.2021.10.25.12.56.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 12:56:42 -0700 (PDT)
Subject: Re: Lockdep spalt on killing a processes
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, chris@chris-wilson.co.uk,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
 <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
 <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
 <2639d027-b6c8-ee09-5e9a-564308949c53@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cbeac930-84c3-7a62-0b3d-4cef3074139d@gmail.com>
Date: Mon, 25 Oct 2021 21:56:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2639d027-b6c8-ee09-5e9a-564308949c53@amd.com>
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

In general I'm all there to get this fixed, but there is one major 
problem: Drivers don't expect the lock to be dropped.

What we could do is to change all drivers so they call always call the 
dma_fence_signal functions and drop the _locked variants. This way we 
could move calling the callback out of the spinlock.

But that requires audit of all drivers, so quite a lot of work to do.

Regards,
Christian.

Am 25.10.21 um 21:10 schrieb Andrey Grodzovsky:
> Adding back Daniel (somehow he got off the addresses list) and Chris 
> who worked a lot in this area.
>
> On 2021-10-21 2:34 a.m., Christian König wrote:
>>
>>
>> Am 20.10.21 um 21:32 schrieb Andrey Grodzovsky:
>>> On 2021-10-04 4:14 a.m., Christian König wrote:
>>>
>>>> The problem is a bit different.
>>>>
>>>> The callback is on the dependent fence, while we need to signal the 
>>>> scheduler fence.
>>>>
>>>> Daniel is right that this needs an irq_work struct to handle this 
>>>> properly.
>>>>
>>>> Christian.
>>>
>>>
>>> So we had some discussions with Christian regarding irq_work and 
>>> agreed I should look into doing it but stepping back for a sec -
>>>
>>> Why we insist on calling the dma_fence_cb  with fence->lock locked ? 
>>> Is it because of dma_fence_add_callback ?
>>> Because we first test for DMA_FENCE_FLAG_SIGNALED_BIT and only after 
>>> that lock the fence->lock ? If so, can't we
>>> move DMA_FENCE_FLAG_SIGNALED_BIT  check inside the locked section ? 
>>> Because if in theory
>>> we could call the cb with unlocked fence->lock (i.e. this kind of 
>>> iteration 
>>> https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/gpu/drm/ttm/ttm_resource.c#L117)
>>> we wouldn't have the lockdep splat. And in general, is it really
>>> the correct approach to call a third party code from a call back 
>>> with locked spinlock ? We don't know what the cb does inside
>>> and I don't see any explicit restrictions in documentation of 
>>> dma_fence_func_t what can and cannot be done there.
>>
>> Yeah, that's exactly what I meant with using the irq_work directly in 
>> the fence code.
>
>
> My idea is not to use irq work at all but instead to implement 
> unlocked dma_fence cb execution using iteration
> which drops the spinlock each time next cb is executed and acquiring 
> it again after (until cb_list is empy).
>
>
>>
>>
>> The problem is dma_fence_signal_locked() which is used by quite a 
>> number of drivers to signal the fence while holding the lock.
>
>
> For this I think we should not reuse dma_fence_signal_locked inside 
> dma_fence_signal and instead implement it using the
> unlocked iteration I mentioned above. I looked a bit in the code and 
> the history and I see that until some time ago
> (this commit by Chris 0fc89b6802ba1fcc561b0c906e0cefd384e3b2e5), 
> indeed dma_fence_signal was doing it's own, locked iteration
> and wasn't reusing dma_fence_signal_locked. This way whoever relies on 
> the dma_fence_signal_locked won't be impacted
> an who is not (like us in 
> drm_sched_fence_scheduled/drm_sched_fence_finished) should also not be 
> impacted by more narrow
> scope of the lock. I also looked at dma_fence_default_wait and how it 
> locks the fence->lock and check if fence is signaled
> before wait start and I don't see a problem there either.
>
> I attached quick draft of this proposal to clarify.
>
> Andrey
>
>
>>
>> Otherwise we could indeed simplify the fence handling a lot.
>>
>> Christian.
>>
>>>
>>> Andrey
>>>
>>>
>>>>
>>>> Am 01.10.21 um 17:10 schrieb Andrey Grodzovsky:
>>>>> From what I see here you supposed to have actual deadlock and not 
>>>>> only warning, sched_fence->finished is  first signaled from within
>>>>> hw fence done callback (drm_sched_job_done_cb) but then again from 
>>>>> within it's own callback (drm_sched_entity_kill_jobs_cb) and so
>>>>> looks like same fence  object is recursively signaled twice. This 
>>>>> leads to attempt to lock fence->lock second time while it's already
>>>>> locked. I don't see a need to call drm_sched_fence_finished from 
>>>>> within drm_sched_entity_kill_jobs_cb as this callback already 
>>>>> registered
>>>>> on sched_fence->finished fence (entity->last_scheduled == 
>>>>> s_fence->finished) and hence the signaling already took place.
>>>>>
>>>>> Andrey
>>>>>
>>>>> On 2021-10-01 6:50 a.m., Christian König wrote:
>>>>>> Hey, Andrey.
>>>>>>
>>>>>> while investigating some memory management problems I've got the 
>>>>>> logdep splat below.
>>>>>>
>>>>>> Looks like something is wrong with 
>>>>>> drm_sched_entity_kill_jobs_cb(), can you investigate?
>>>>>>
>>>>>> Thanks,
>>>>>> Christian.
>>>>>>
>>>>>> [11176.741052] ============================================
>>>>>> [11176.741056] WARNING: possible recursive locking detected
>>>>>> [11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
>>>>>> [11176.741066] --------------------------------------------
>>>>>> [11176.741070] swapper/12/0 is trying to acquire lock:
>>>>>> [11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, at: 
>>>>>> dma_fence_signal+0x28/0x80
>>>>>> [11176.741088]
>>>>>>                but task is already holding lock:
>>>>>> [11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
>>>>>> dma_fence_signal+0x28/0x80
>>>>>> [11176.741100]
>>>>>>                other info that might help us debug this:
>>>>>> [11176.741104]  Possible unsafe locking scenario:
>>>>>>
>>>>>> [11176.741108]        CPU0
>>>>>> [11176.741110]        ----
>>>>>> [11176.741113]   lock(&fence->lock);
>>>>>> [11176.741118]   lock(&fence->lock);
>>>>>> [11176.741122]
>>>>>>                 *** DEADLOCK ***
>>>>>>
>>>>>> [11176.741125]  May be due to missing lock nesting notation
>>>>>>
>>>>>> [11176.741128] 2 locks held by swapper/12/0:
>>>>>> [11176.741133]  #0: ffff9c339c30f768 
>>>>>> (&ring->fence_drv.lock){-.-.}-{3:3}, at: dma_fence_signal+0x28/0x80
>>>>>> [11176.741142]  #1: ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, 
>>>>>> at: dma_fence_signal+0x28/0x80
>>>>>> [11176.741151]
>>>>>>                stack backtrace:
>>>>>> [11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 
>>>>>> 5.15.0-rc1-00031-g9d546d600800 #171
>>>>>> [11176.741160] Hardware name: System manufacturer System Product 
>>>>>> Name/PRIME X399-A, BIOS 0808 10/12/2018
>>>>>> [11176.741165] Call Trace:
>>>>>> [11176.741169]  <IRQ>
>>>>>> [11176.741173]  dump_stack_lvl+0x5b/0x74
>>>>>> [11176.741181]  dump_stack+0x10/0x12
>>>>>> [11176.741186]  __lock_acquire.cold+0x208/0x2df
>>>>>> [11176.741197]  lock_acquire+0xc6/0x2d0
>>>>>> [11176.741204]  ? dma_fence_signal+0x28/0x80
>>>>>> [11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
>>>>>> [11176.741219]  ? dma_fence_signal+0x28/0x80
>>>>>> [11176.741225]  dma_fence_signal+0x28/0x80
>>>>>> [11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>>>> [11176.741240]  drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
>>>>>> [11176.741248] dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>>>> [11176.741254]  dma_fence_signal+0x3b/0x80
>>>>>> [11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>>>> [11176.741268]  drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
>>>>>> [11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>>>>>> [11176.741284] dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>>>> [11176.741290]  dma_fence_signal+0x3b/0x80
>>>>>> [11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
>>>>>> [11176.741504]  sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
>>>>>> [11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
>>>>>> [11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
>>>>>> [11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
>>>>>> [11176.742393]  __handle_irq_event_percpu+0x4f/0x2c0
>>>>>> [11176.742402]  handle_irq_event_percpu+0x33/0x80
>>>>>> [11176.742408]  handle_irq_event+0x39/0x60
>>>>>> [11176.742414]  handle_edge_irq+0x93/0x1d0
>>>>>> [11176.742419]  __common_interrupt+0x50/0xe0
>>>>>> [11176.742426]  common_interrupt+0x80/0x90
>>>>>> [11176.742431]  </IRQ>
>>>>>> [11176.742436]  asm_common_interrupt+0x1e/0x40
>>>>>> [11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
>>>>>> [11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 ff 
>>>>>> e8 37 5d 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff fb 66 
>>>>>> 0f 1f 44 00 00 <45> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 2b 75 c8 
>>>>>> 48 8d 14 40 48 8d
>>>>>> [11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
>>>>>> [11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 RCX: 
>>>>>> 0000000000000000
>>>>>> [11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
>>>>>> ffffffff9efeed78
>>>>>> [11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 R09: 
>>>>>> 0000000000000001
>>>>>> [11176.742473] R10: 0000000000000001 R11: 0000000000000001 R12: 
>>>>>> ffff9c3350b0e800
>>>>>> [11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 R15: 
>>>>>> 0000000000000002
>>>>>> [11176.742483]  ? cpuidle_enter_state+0xf8/0x470
>>>>>> [11176.742489]  ? cpuidle_enter_state+0xf8/0x470
>>>>>> [11176.742495]  cpuidle_enter+0x2e/0x40
>>>>>> [11176.742500]  call_cpuidle+0x23/0x40
>>>>>> [11176.742506]  do_idle+0x201/0x280
>>>>>> [11176.742512]  cpu_startup_entry+0x20/0x30
>>>>>> [11176.742517]  start_secondary+0x11f/0x160
>>>>>> [11176.742523]  secondary_startup_64_no_verify+0xb0/0xbb
>>>>>>
>>>>
>>

