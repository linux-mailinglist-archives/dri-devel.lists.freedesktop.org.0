Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5300FB91915
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 16:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1562E10E1C6;
	Mon, 22 Sep 2025 14:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="0EVlroPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D7810E1C6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 14:03:08 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso2396663f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 07:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1758549787; x=1759154587;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BnDwnUvydVIS9CMEgTJEKyggVVR1m3PZbWJ4JMnG7LY=;
 b=0EVlroPzBeyCryL9d7L6k9f9VYwQpwsK0EFASRvVgohk8nakgoFwRLc9XSrE3/dh+O
 a3u44MtESLDesRnL0fii4G8ARzJh2sotSKFHLKLHwI4T29cYvG0vMmi/TuOWywgq+8IB
 fqYm2LNqUHkYE6TJQ0DFoBQ/F/bY/B/Y5f6b9eK2AeaQEb0MIh3fJqcFlMtrty7+pK8S
 WrxZyBQojN5HHADr7f7lzeSQQqkU5ecRsmXB/OQqILEulzisSm6qbAwc/VBx+2CbQ/b6
 xPWUNswSjF2M3Z1pM9lEgJLbD64VpvgwPnRg3O/xM9cV0vauzU8Y5uskgwRr9F42kzjU
 C4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758549787; x=1759154587;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BnDwnUvydVIS9CMEgTJEKyggVVR1m3PZbWJ4JMnG7LY=;
 b=MJfmp7Pk3Z18mb27gvPmASZz5GEvB4FnAFxb5bJhMTU1zimsPP80LdOaXEZFavBDdP
 SAQFCB5fOZg6KkrbAq3pWFQYUvYQ3i6hGJ7Uoqn66tJojtuUcHE01OdIBPGPl9VH1sRP
 pOJ4pWJOQlj5hEq8GurvXwZAzoblsr+X6dIPhfUL2isHWLu7qoiskcLjlYZjM+nINmza
 ucKzNCiRr9fkeUu7SMBLXcXUPKS3AXqDQbeqkM2aK14QJHTC6RaQjHbC8oRB98o5uT2w
 md2cgYo+kYWCA1s//AK4O+tpOcS0oKVs+upfo7Y01pPaT9VAS6FOeGTfMOAfIJ8H6AoF
 mmMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE2/OSNUWTkCVLOtFOnFWG4MbMRSIn9QmJ/DodsT0GiUh90dZvePCLch5OUVcEJFCBk3TprDNYKBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqUJbU2BNO8K6ucmAK0YDVsuPlMv3M5NT44VREANNOMj53CGiN
 Yw/vFbw0ywuDloP8lsOShre2i5ETufyKoqBLMCAREDASz3j+OninewV4DwxvByxTBiQ=
X-Gm-Gg: ASbGncu6tran/QwhFqUAsrASXN+0Q1KAG0Rulukl0pBAMy22dCQikztP6CLo5gu29Db
 u1qmiBsCgAm0c3rCDgPdktUB3Df4slbnDvSoge/RAnFsU0GfTOsWz02TL6yAulOVC8uV8WI+Udm
 LT3IGse85ZsgU6D2a7R5yOZSJUQ+84gvLtsGvKvwf5ww/csbM4WZ7fBrKgF2i169eJiGcnq+L3J
 SZgeCnt0m111x6HGqubDF4cbIikDoXVWVYyVoVgR6Wx63p8ALknlffw3rtMusib4ldqn/4ooW2Y
 YdPBP9macKca06t9igW+JYtYOLW9wHeQu6yv6a3XuCxN7b4Wk6InpXmPX6X9gNp+0v6d5D7SyMv
 soPqglWNAkYRjK8H6OP9qGyRRKP9vDuhiks4=
X-Google-Smtp-Source: AGHT+IEuHDWivMsA1X9IpMlcxkiY55lkIZKmZwt09tw1zka48MY9tMOGc8X7ZZu9nJed8gpJL0TprA==
X-Received: by 2002:a05:6000:2dc7:b0:3e3:5951:95ff with SMTP id
 ffacd0b85a97d-3ee86d6ce08mr11173962f8f.62.1758549786464; 
 Mon, 22 Sep 2025 07:03:06 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3fcb01a9049sm5532688f8f.61.2025.09.22.07.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 07:03:05 -0700 (PDT)
Message-ID: <5e2c677e-d4d8-4c79-8c89-3a09cd815696@ursulin.net>
Date: Mon, 22 Sep 2025 15:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: unable to handle kernel NULL pointer dereference in
 eb_release_vmas
To: =?UTF-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 intel-gfx@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch,
 andi.shyti@linux.intel.com, ville.syrjala@linux.intel.com,
 nitin.r.gote@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, syzkaller@googlegroups.com,
 Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <CAGfirffPy5biFVLtSNEW60UCXa6_=-=NrQbU7iLQ8+BXnFQ=1A@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAGfirffPy5biFVLtSNEW60UCXa6_=-=NrQbU7iLQ8+BXnFQ=1A@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/09/2025 13:56, 김강민 wrote:
> Dear Linux kernel developers and maintainers,
> 
> This is to report a kernel bug discovered in the i915 driver using my
> modified syzkaller.
> 
> Kernel driver involved: i915
> 
> Version detected by syzkaller:
> - Commit version: c330cb607721
> 
> Latest version tested for NULL pointer dereference and memory leak:
> - Commit version: 07e27ad16399
> 
> Note: The .config used in syzkaller differs from the one used in the
> latest version. Therefore, the configuration file used in syzkaller is
> referred to as .config(syzkaller), while the configuration file used
> in the latest version is referred to as .config(latest).
> 
> 
> In function eb_lookup_vmas(), values are assigned to eb->vma[i].vma
> through eb_add_vma(), with the operation being repeated
> eb->buffer_count times.
> If eb->buffer_count is set to 2 (as configured in the PoC, though
> values greater than 2 are also possible), then eb_add_vma() should
> normally be executed twice. However, if during the initial execution
> the check in eb_add_vma() fails, an error is returned, preventing the
> second execution of eb_add_vma(). Instead, control flow proceeds
> directly into eb_release_vmas().
> At this point, eb_release_vmas() contains a logic that iterates over
> eb->buffer_count in order to process vma. As a consequence, during the
> access procedure involving eb->vma[1].vma, a NULL Pointer Dereference
> occurs.
> As a result, the ongoing process is interrupted, which prevents the
> allocated heap structures, such as the timeline, from being properly
> freed. Consequently, this leads to memory exhaustion (OOM) and
> ultimately results in a denial-of-service (DoS) condition.

Could be about 544460c33821 ("drm/i915: Multi-BB execbuf"). Unwind on 
error there seems different than for example what ed29c2691188 
("drm/i915: Fix userptr so we do not have to worry about obj->mm.lock, 
v7.") did after eb_add_vma() succeeded. Because 544460c33821 added 
checks and return code to eb_add_vma() which actually happens _after_ 
the vma is added to the eb. So at that point it could be effectively the 
same internal state as if the eb_add_vma() succeeded. In which case one 
of the two error unwinds is wrong.

Adding some folks to have a look.

Regards,

Tvrtko

> Bug Report
> ==================================================================
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:3e!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:42!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:40!
> i915 0000:00:04.0: [drm] Resetting vcs0 for preemption time out
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> #PF: supervisor write access in kernel mode
> #PF: error_code(0x0002) - not-present page
> PGD 5132a067 P4D 5132a067 PUD 0
> Oops: Oops: 0002 [#1] SMP KASAN NOPTI
> CPU: 4 UID: 0 PID: 107163 Comm: syz.9.21041 Tainted: G    B
>     6.17.0-rc2-00446-gc330cb607721 #2 PREEMPT(voluntary)
> Tainted: [B]=BAD_PAGE
> Hardware name: QEMU Ubuntu 24.04 PC (i440FX + PIIX, 1996), BIOS
> 1.16.3-debian-1.16.3-2 04/01/2014
> RIP: 0010:arch_atomic_fetch_add arch/x86/include/asm/atomic.h:93 [inline] [i915]
> RIP: 0010:raw_atomic_fetch_sub_release
> include/linux/atomic/atomic-arch-fallback.h:949 [inline] [i915]
> RIP: 0010:atomic_fetch_sub_release
> include/linux/atomic/atomic-instrumented.h:401 [inline] [i915]
> RIP: 0010:__refcount_sub_and_test include/linux/refcount.h:389 [inline] [i915]
> RIP: 0010:__refcount_dec_and_test include/linux/refcount.h:432 [inline] [i915]
> RIP: 0010:refcount_dec_and_test include/linux/refcount.h:450 [inline] [i915]
> RIP: 0010:kref_put include/linux/kref.h:64 [inline] [i915]
> RIP: 0010:__drm_gem_object_put include/drm/drm_gem.h:511 [inline] [i915]
> RIP: 0010:i915_gem_object_put
> drivers/gpu/drm/i915/gem/i915_gem_object.h:144 [inline] [i915]
> RIP: 0010:i915_vma_put drivers/gpu/drm/i915/i915_vma.h:204 [inline] [i915]
> RIP: 0010:eb_release_vmas+0x175/0xca0
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1097 [i915]
> Code: 89 f8 48 c1 e8 03 42 80 3c 20 00 0f 85 1e 0a 00 00 4d 8b ad b8
> 00 00 00 be 04 00 00 00 4c 89 ef e8 50 d8 47 c1 b8 ff ff ff ff <f0> 41
> 0f c1 45 00 85 c0 89 04 24 0f 8e 80 06 00 00 e8 65 15 16 c1
> RSP: 0018:ffff88803ae37750 EFLAGS: 00000202
> RAX: 00000000ffffffff RBX: ffff88803ae378b0 RCX: 0000000000000000
> RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffff88803ae376f8
> RBP: 0000000000000050 R08: 0000000000000001 R09: ffffed100880d140
> R10: ffff888044068a03 R11: 000000005fdf007e R12: dffffc0000000000
> R13: 0000000000000000 R14: ffff88806131f900 R15: ffff88806131f8f8
> FS:  00007f63571476c0(0000) GS:ffff8880e7434000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 000000006041c000 CR4: 00000000000006f0
> Call Trace:
>   <TASK>
>   i915_gem_do_execbuffer+0x2786/0x6f30
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3457 [i915]
>   i915_gem_execbuffer2_ioctl+0x301/0x720
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3601 [i915]
>   drm_ioctl_kernel+0x18c/0x310 drivers/gpu/drm/drm_ioctl.c:796
>   drm_ioctl+0x501/0xb20 drivers/gpu/drm/drm_ioctl.c:893
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:598 [inline]
>   __se_sys_ioctl fs/ioctl.c:584 [inline]
>   __x64_sys_ioctl+0x15e/0x1d0 fs/ioctl.c:584
>   do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>   do_syscall_64+0xa4/0x260 arch/x86/entry/syscall_64.c:94
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f63586f4a6d
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48
> 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
> 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f6357147018 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f6358935fa0 RCX: 00007f63586f4a6d
> RDX: 0000200000000140 RSI: 00000000c0406469 RDI: 0000000000000003
> RBP: 00007f6358798d0d R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007f6358936038 R14: 00007f6358935fa0 R15: 00007ffcfc0b6320
>   </TASK>
> Modules linked in: i915 i2c_algo_bit drm_buddy ttm drm_display_helper
> CR2: 0000000000000000
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:arch_atomic_fetch_add arch/x86/include/asm/atomic.h:93 [inline] [i915]
> RIP: 0010:raw_atomic_fetch_sub_release
> include/linux/atomic/atomic-arch-fallback.h:949 [inline] [i915]
> RIP: 0010:atomic_fetch_sub_release
> include/linux/atomic/atomic-instrumented.h:401 [inline] [i915]
> RIP: 0010:__refcount_sub_and_test include/linux/refcount.h:389 [inline] [i915]
> RIP: 0010:__refcount_dec_and_test include/linux/refcount.h:432 [inline] [i915]
> RIP: 0010:refcount_dec_and_test include/linux/refcount.h:450 [inline] [i915]
> RIP: 0010:kref_put include/linux/kref.h:64 [inline] [i915]
> RIP: 0010:__drm_gem_object_put include/drm/drm_gem.h:511 [inline] [i915]
> RIP: 0010:i915_gem_object_put
> drivers/gpu/drm/i915/gem/i915_gem_object.h:144 [inline] [i915]
> RIP: 0010:i915_vma_put drivers/gpu/drm/i915/i915_vma.h:204 [inline] [i915]
> RIP: 0010:eb_release_vmas+0x175/0xca0
> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1097 [i915]
> Code: 89 f8 48 c1 e8 03 42 80 3c 20 00 0f 85 1e 0a 00 00 4d 8b ad b8
> 00 00 00 be 04 00 00 00 4c 89 ef e8 50 d8 47 c1 b8 ff ff ff ff <f0> 41
> 0f c1 45 00 85 c0 89 04 24 0f 8e 80 06 00 00 e8 65 15 16 c1
> RSP: 0018:ffff88803ae37750 EFLAGS: 00000202
> RAX: 00000000ffffffff RBX: ffff88803ae378b0 RCX: 0000000000000000
> RDX: 0000000000000001 RSI: 0000000000000004 RDI: ffff88803ae376f8
> RBP: 0000000000000050 R08: 0000000000000001 R09: ffffed100880d140
> R10: ffff888044068a03 R11: 000000005fdf007e R12: dffffc0000000000
> R13: 0000000000000000 R14: ffff88806131f900 R15: ffff88806131f8f8
> FS:  00007f63571476c0(0000) GS:ffff8880e7434000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000000 CR3: 000000006041c000 CR4: 00000000000006f0
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> i915 0000:00:04.0: [drm] GPU HANG: ecode 12:4:277ffefe
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> i915 0000:00:04.0: [drm] Resetting rcs0 for preemption time out
> i915 0000:00:04.0: [drm] GPU HANG: ecode 12:1:e75ffefe
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:4!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:6!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:4!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:a!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:8!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:c!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:14!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:12!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:10!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:e!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:16!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:20!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:1e!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:1c!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:1a!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:18!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:22!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2a!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:28!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:26!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:24!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2e!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2c!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:30!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:36!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:34!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:32!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:40!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:3e!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:3c!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:3a!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:38!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:48!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:46!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:44!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:42!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:4e!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:4c!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:4a!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:50!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:5a!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:58!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:56!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:54!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:52!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:62!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:60!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:5e!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:5c!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:66!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:64!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:6c!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:6a!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:68!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:4!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> i915 0000:00:04.0: [drm] Resetting rcs0 for preemption time out
> i915 0000:00:04.0: [drm] GPU HANG: ecode 12:1:e75ffefe
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:4!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:4!
> Fence expiration time out i915-0000:00:04.0:0000:00:04.0:2!
> ----------------
> Code disassembly (best guess):
>     0:   89 f8                   mov    %edi,%eax
>     2:   48 c1 e8 03             shr    $0x3,%rax
>     6:   42 80 3c 20 00          cmpb   $0x0,(%rax,%r12,1)
>     b:   0f 85 1e 0a 00 00       jne    0xa2f
>    11:   4d 8b ad b8 00 00 00    mov    0xb8(%r13),%r13
>    18:   be 04 00 00 00          mov    $0x4,%esi
>    1d:   4c 89 ef                mov    %r13,%rdi
>    20:   e8 50 d8 47 c1          call   0xc147d875
>    25:   b8 ff ff ff ff          mov    $0xffffffff,%eax
> * 2a:   f0 41 0f c1 45 00       lock xadd %eax,0x0(%r13) <-- trapping
> instruction
>    30:   85 c0                   test   %eax,%eax
>    32:   89 04 24                mov    %eax,(%rsp)
>    35:   0f 8e 80 06 00 00       jle    0x6bb
>    3b:   e8 65 15 16 c1          call   0xc11615a5
> ==================================================================
> 
> Kmemleak Report
> ==================================================================
> 
> unreferenced object 0xffff8880051f6700 (size 768):
>    comm "poc", pid 334, jiffies 4294686493
>    hex dump (first 32 bytes):
>      01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      00 80 53 05 80 88 ff ff 00 00 00 00 00 00 00 00  ..S.............
>    backtrace (crc b8e44992):
>      kmem_cache_alloc_noprof+0x26d/0x310
>      intel_context_create+0x1a/0x40 [i915]
>      i915_gem_create_context+0x473/0x830 [i915]
>      i915_gem_context_open+0xce/0x150 [i915]
>      i915_gem_open+0x8e/0x100 [i915]
>      drm_file_alloc+0x1e1/0x2b0
>      drm_open_helper+0x80/0x130
>      drm_open+0x6e/0x100
>      drm_stub_open+0x99/0xd0
>      chrdev_open+0xb3/0x220
>      do_dentry_open+0x14c/0x440
>      vfs_open+0x29/0xe0
>      path_openat+0x319/0x12a0
>      do_filp_open+0xd2/0x180
>      do_sys_openat2+0x85/0xe0
>      __x64_sys_openat+0x51/0xa0
> unreferenced object 0xffff8880054ca800 (size 1024):
>    comm "poc", pid 334, jiffies 4294686493
>    hex dump (first 32 bytes):
>      01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      02 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00  ................
>    backtrace (crc 88e4d8c7):
>      __kvmalloc_node_noprof+0x3d3/0x530
>      i915_gem_execbuffer2_ioctl+0xad/0x270 [i915]
>      drm_ioctl_kernel+0xa8/0x100
>      drm_ioctl+0x229/0x4c0
>      __x64_sys_ioctl+0x8e/0xe0
>      do_syscall_64+0xa4/0x280
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> unreferenced object 0xffff888005f675e0 (size 32):
>    comm "poc", pid 334, jiffies 4294686493
>    hex dump (first 32 bytes):
>      00 00 00 00 00 00 00 00 e0 a8 4c 05 80 88 ff ff  ..........L.....
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc 4f73f88f):
>      __kmalloc_noprof+0x2ec/0x420
>      i915_gem_do_execbuffer+0x5fc/0x2c50 [i915]
>      i915_gem_execbuffer2_ioctl+0xfe/0x270 [i915]
>      drm_ioctl_kernel+0xa8/0x100
>      drm_ioctl+0x229/0x4c0
>      __x64_sys_ioctl+0x8e/0xe0
>      do_syscall_64+0xa4/0x280
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> unreferenced object 0xffff88800517fc80 (size 64):
>    comm "poc", pid 334, jiffies 4294686493
>    hex dump (first 32 bytes):
>      01 00 00 00 00 00 00 00 80 79 02 05 80 88 ff ff  .........y......
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc 5d02cde2):
>      __kmalloc_cache_noprof+0x284/0x320
>      intel_engine_create_ring+0x2b/0x180 [i915]
>      lrc_alloc+0xc0/0x240 [i915]
>      intel_context_alloc_state+0x66/0x120 [i915]
>      i915_gem_do_execbuffer+0x14b4/0x2c50 [i915]
>      i915_gem_execbuffer2_ioctl+0xfe/0x270 [i915]
>      drm_ioctl_kernel+0xa8/0x100
>      drm_ioctl+0x229/0x4c0
>      __x64_sys_ioctl+0x8e/0xe0
>      do_syscall_64+0xa4/0x280
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> unreferenced object 0xffff888004ec1600 (size 512):
>    comm "poc", pid 334, jiffies 4294686493
>    hex dump (first 32 bytes):
>      4a 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  J...............
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc 803bd2a7):
>      __kmalloc_cache_noprof+0x284/0x320
>      __intel_timeline_create+0x29/0x1e0 [i915]
>      lrc_alloc+0xf2/0x240 [i915]
>      intel_context_alloc_state+0x66/0x120 [i915]
>      i915_gem_do_execbuffer+0x14b4/0x2c50 [i915]
>      i915_gem_execbuffer2_ioctl+0xfe/0x270 [i915]
>      drm_ioctl_kernel+0xa8/0x100
>      drm_ioctl+0x229/0x4c0
>      __x64_sys_ioctl+0x8e/0xe0
>      do_syscall_64+0xa4/0x280
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> ==================================================================
> 
> Please let me know if any further information is required.
> 
> Best Regards,
> GangMin Kim.

