Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1BF41F007
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9C16EDAD;
	Fri,  1 Oct 2021 14:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40E16EDF1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:52:39 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id o19so7444878wms.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/CGT87weSLNSLviR6HDxsD3ODsSwC6t+MSAnoc0H6x4=;
 b=Dtfz/uJtIn8A4gWLnZhsOqj7PUHvf7J0RhRjTqSerZkCA/F3luAcT/tYT1PTEFIR/5
 tl+miazljU4T8KYep5Jij1lGOBK9XPVi2hZaYQOQ2E40N69CnhipbkjPKtgHHHlfH277
 Gmt6S/SjExk4qI/d2InV7A72765UFEgmkkb4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/CGT87weSLNSLviR6HDxsD3ODsSwC6t+MSAnoc0H6x4=;
 b=VUndNyBlJYVLGhbVoK3kCByXATq8eT1fqelzINEbwCTrgJ78EQGTQtG7tvE8IGrj91
 MqvuMB8ixrGHnB5laJB9Ej2pPnbRtS6/J8HCaPuVIVMK1bNfBSqZiAxa3NeEJ0TuoJU0
 WoVbWh4XRpZQR+OYZm7O8ccn3nVz//jXpIvn7nMFtmWeXKNs5aB9Bu8aO9Q4qo7KpLUO
 nfzbl9oZkE/ZU6xWrO0WP2FZoDYuBZ+zS/tgWnVm3J3ntrqyNliEFLp+RpjExJOfYC/+
 0qciepPuz5gUoZmAGetFCR1pc1kNCI8BC7AxqD0GxlvLBbXhugc6cbAqBGenXHkVeNcG
 EhFg==
X-Gm-Message-State: AOAM53386RvN8dSGLv6zhivsKs7TU5z+WPNWlEOWB4FWpxICHeJTA2Bs
 icxEzkw1y7T8RHGzkXIT3Nll/g==
X-Google-Smtp-Source: ABdhPJyz/V/hiM+gvpgyDu2/QXEUTQiVsBbzQoWwm2Ar03thNSGQaeuWMja+19M6F2a4mPieID6TdA==
X-Received: by 2002:a1c:1dcb:: with SMTP id d194mr2131815wmd.161.1633099958260; 
 Fri, 01 Oct 2021 07:52:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j4sm6074660wrt.67.2021.10.01.07.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 07:52:37 -0700 (PDT)
Date: Fri, 1 Oct 2021 16:52:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: Lockdep spalt on killing a processes
Message-ID: <YVcgtLTlPXb5vLXg@phenom.ffwll.local>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Fri, Oct 01, 2021 at 12:50:35PM +0200, Christian König wrote:
> Hey, Andrey.
> 
> while investigating some memory management problems I've got the logdep
> splat below.
> 
> Looks like something is wrong with drm_sched_entity_kill_jobs_cb(), can you
> investigate?

Probably needs more irq_work so that we get rid of fence completion
signalling recursions.
-Daniel

> 
> Thanks,
> Christian.
> 
> [11176.741052] ============================================
> [11176.741056] WARNING: possible recursive locking detected
> [11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
> [11176.741066] --------------------------------------------
> [11176.741070] swapper/12/0 is trying to acquire lock:
> [11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, at:
> dma_fence_signal+0x28/0x80
> [11176.741088]
>                but task is already holding lock:
> [11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at:
> dma_fence_signal+0x28/0x80
> [11176.741100]
>                other info that might help us debug this:
> [11176.741104]  Possible unsafe locking scenario:
> 
> [11176.741108]        CPU0
> [11176.741110]        ----
> [11176.741113]   lock(&fence->lock);
> [11176.741118]   lock(&fence->lock);
> [11176.741122]
>                 *** DEADLOCK ***
> 
> [11176.741125]  May be due to missing lock nesting notation
> 
> [11176.741128] 2 locks held by swapper/12/0:
> [11176.741133]  #0: ffff9c339c30f768 (&ring->fence_drv.lock){-.-.}-{3:3},
> at: dma_fence_signal+0x28/0x80
> [11176.741142]  #1: ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at:
> dma_fence_signal+0x28/0x80
> [11176.741151]
>                stack backtrace:
> [11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted
> 5.15.0-rc1-00031-g9d546d600800 #171
> [11176.741160] Hardware name: System manufacturer System Product Name/PRIME
> X399-A, BIOS 0808 10/12/2018
> [11176.741165] Call Trace:
> [11176.741169]  <IRQ>
> [11176.741173]  dump_stack_lvl+0x5b/0x74
> [11176.741181]  dump_stack+0x10/0x12
> [11176.741186]  __lock_acquire.cold+0x208/0x2df
> [11176.741197]  lock_acquire+0xc6/0x2d0
> [11176.741204]  ? dma_fence_signal+0x28/0x80
> [11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
> [11176.741219]  ? dma_fence_signal+0x28/0x80
> [11176.741225]  dma_fence_signal+0x28/0x80
> [11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
> [11176.741240]  drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
> [11176.741248]  dma_fence_signal_timestamp_locked+0xac/0x1a0
> [11176.741254]  dma_fence_signal+0x3b/0x80
> [11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
> [11176.741268]  drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
> [11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
> [11176.741284]  dma_fence_signal_timestamp_locked+0xac/0x1a0
> [11176.741290]  dma_fence_signal+0x3b/0x80
> [11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
> [11176.741504]  sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
> [11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
> [11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
> [11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
> [11176.742393]  __handle_irq_event_percpu+0x4f/0x2c0
> [11176.742402]  handle_irq_event_percpu+0x33/0x80
> [11176.742408]  handle_irq_event+0x39/0x60
> [11176.742414]  handle_edge_irq+0x93/0x1d0
> [11176.742419]  __common_interrupt+0x50/0xe0
> [11176.742426]  common_interrupt+0x80/0x90
> [11176.742431]  </IRQ>
> [11176.742436]  asm_common_interrupt+0x1e/0x40
> [11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
> [11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 ff e8 37 5d
> 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff fb 66 0f 1f 44 00 00 <45>
> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 2b 75 c8 48 8d 14 40 48 8d
> [11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
> [11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 RCX:
> 0000000000000000
> [11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
> ffffffff9efeed78
> [11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 R09:
> 0000000000000001
> [11176.742473] R10: 0000000000000001 R11: 0000000000000001 R12:
> ffff9c3350b0e800
> [11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 R15:
> 0000000000000002
> [11176.742483]  ? cpuidle_enter_state+0xf8/0x470
> [11176.742489]  ? cpuidle_enter_state+0xf8/0x470
> [11176.742495]  cpuidle_enter+0x2e/0x40
> [11176.742500]  call_cpuidle+0x23/0x40
> [11176.742506]  do_idle+0x201/0x280
> [11176.742512]  cpu_startup_entry+0x20/0x30
> [11176.742517]  start_secondary+0x11f/0x160
> [11176.742523]  secondary_startup_64_no_verify+0xb0/0xbb
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
