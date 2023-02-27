Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2F6A3F6A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 11:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3694110E1B8;
	Mon, 27 Feb 2023 10:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2725F10E1B8;
 Mon, 27 Feb 2023 10:22:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id o15so21094222edr.13;
 Mon, 27 Feb 2023 02:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8S3LguPW17QuJ9y7oNHXcA8eXMmuyMSxs+rw2usrIA8=;
 b=hhPX0VVm0DcYtBRb5dpIHPfZ/LuIAE9JEVWcH55xlIJmrjmhvYe/j0wmK9SkEhCpLY
 agyicyQIR2CLDqYjDhvHEyvGV5AwOR54D1pgp0L5Oe24BgPmdmqTl0ARa/ZGEt9DUMo+
 mTBu9YqCq248OHATwLh5fvslhh07bUAm6iJl7829OXtsPp8m5rOWVJjHGjKmaX23n/aF
 mtNHGnOOGWYsAkiUXF8FDCwzAkb72YykVQe75M4n8k8+j55UCmpk/tLuoMKczeSjXDci
 ZYvKLHGVTzWeMcPcUgw8VWl+Op/QLuvl+FpHqwOgvE2HrqmlcyVXMtcHyDvLHsJd3U40
 WKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8S3LguPW17QuJ9y7oNHXcA8eXMmuyMSxs+rw2usrIA8=;
 b=4rw7ZHG3zlePjNcaMHCAZM2O4XEYVosUMvYi+whlU9XK+T/dOxKOvcgl7OPSWAqKco
 Se59fXcVCbvKKuSAJMfxVDTr8getxzB33qdz7EnOfx+R9E1EUJ+SR1d7mYguNTxIWrxc
 soC7rgHdICtvFmbwBaA+ajTkv0tWI2I1Nf4kNkgRYe3Y+7v/uxZx/tEjx/bSKC/qvDpa
 3wWNVPAHygs/JSKZNDqkeTFJn/VcjQNJBNwFs39Ri5RVkA+TvFeZ5eXAsUzWDR8T1sCj
 rjCRrxPTJzAYyxcvAdxNDnGvercWq287sPJJ0kkEExuTy46EPUY7Fo3BD+k/BIy6Fs/B
 q0Ew==
X-Gm-Message-State: AO0yUKVp95i9XHSZl8xk2RqNdrD7to8QuAZkZfdIfpc32PKH0RKelAuh
 aykLU8Od4cWW4z6LyzFvjZg=
X-Google-Smtp-Source: AK7set81QyyPazmXOoc/6sx0uh9dWTW2xXj/82CtOvc0vqbAHhhhBjVSexpM9JHiVw5hWxva99ZsHw==
X-Received: by 2002:a17:906:4081:b0:878:72d0:2817 with SMTP id
 u1-20020a170906408100b0087872d02817mr32441205ejj.29.1677493362229; 
 Mon, 27 Feb 2023 02:22:42 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 f2-20020a170906824200b008f0143dfa9dsm3082079ejx.33.2023.02.27.02.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 02:22:41 -0800 (PST)
Message-ID: <e2975d53-840c-a104-8b2d-c302f502c894@gmail.com>
Date: Mon, 27 Feb 2023 11:22:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: amdgpu didn't start with pci=nocrs parameter, get error "Fatal
 error during GPU init"
Content-Language: en-US
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
References: <CABXGCsMbqw2qzWSCDfp3cNrYVJ1oxLv8Aixfm_Dt91x1cvFX4w@mail.gmail.com>
 <a99e6def-68be-3f2b-4e01-ac26cdb80f49@gmail.com>
 <CABXGCsM7JPxtQm6B7vk+ZcXfphgQm=ArJZKiDUdbk9hujyRtmg@mail.gmail.com>
 <43016018-4d0a-94dc-ce93-b4bff2dce71c@gmail.com>
 <90b1c9f8-1674-e9ec-e6d8-2fa1967439b3@gmail.com>
 <CABXGCsN2NutEmi==JBDD5G2Bj=DJ6vm87_Cbubycz-WowUOh5w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CABXGCsN2NutEmi==JBDD5G2Bj=DJ6vm87_Cbubycz-WowUOh5w@mail.gmail.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.02.23 um 17:21 schrieb Mikhail Gavrilov:
> On Fri, Feb 24, 2023 at 8:31 PM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Sorry I totally missed that you attached the full dmesg to your original
>> mail.
>>
>> Yeah, the driver did fail gracefully. But then X doesn't come up and
>> then gdm just dies.
> Are you sure that these messages should be present when the driver
> fails gracefully?

Unfortunately yes. We could clean that up a bit more so that you don't 
run into a BUG() assertion, but what essentially happens here is that we 
completely fail to talk to the hardware.

In this situation we can't even re-enable vesa or text console any more.

Regards,
Christian.

>
> turning off the locking correctness validator.
> CPU: 14 PID: 470 Comm: (udev-worker) Tainted: G             L
> -------  ---  6.3.0-0.rc0.20230222git5b7c4cabbb65.3.fc39.x86_64+debug
> #1
> Hardware name: ASUSTeK COMPUTER INC. ROG Strix G513QY_G513QY/G513QY,
> BIOS G513QY.320 09/07/2022
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x57/0x90
>   register_lock_class+0x47d/0x490
>   __lock_acquire+0x74/0x21f0
>   ? lock_release+0x155/0x450
>   lock_acquire+0xd2/0x320
>   ? amdgpu_irq_disable_all+0x37/0xf0 [amdgpu]
>   ? lock_is_held_type+0xce/0x120
>   _raw_spin_lock_irqsave+0x4d/0xa0
>   ? amdgpu_irq_disable_all+0x37/0xf0 [amdgpu]
>   amdgpu_irq_disable_all+0x37/0xf0 [amdgpu]
>   amdgpu_device_fini_hw+0x43/0x2c0 [amdgpu]
>   amdgpu_driver_load_kms+0xe8/0x190 [amdgpu]
>   amdgpu_pci_probe+0x140/0x420 [amdgpu]
>   local_pci_probe+0x41/0x90
>   pci_device_probe+0xc3/0x230
>   really_probe+0x1b6/0x410
>   __driver_probe_device+0x78/0x170
>   driver_probe_device+0x1f/0x90
>   __driver_attach+0xd2/0x1c0
>   ? __pfx___driver_attach+0x10/0x10
>   bus_for_each_dev+0x8a/0xd0
>   bus_add_driver+0x141/0x230
>   driver_register+0x77/0x120
>   ? __pfx_init_module+0x10/0x10 [amdgpu]
>   do_one_initcall+0x6e/0x350
>   do_init_module+0x4a/0x220
>   __do_sys_init_module+0x192/0x1c0
>   do_syscall_64+0x5b/0x80
>   ? asm_exc_page_fault+0x22/0x30
>   ? lockdep_hardirqs_on+0x7d/0x100
>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
> RIP: 0033:0x7fd58cfcb1be
> Code: 48 8b 0d 4d 0c 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
> 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d
> 01 f0 ff ff 73 01 c3 48 8b 0d 1a 0c 0c 00 f7 d8 64 89 01
> RSP: 002b:00007ffd1d1065d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
> RAX: ffffffffffffffda RBX: 000055b0b5aa6d70 RCX: 00007fd58cfcb1be
> RDX: 000055b0b5a96670 RSI: 00000000016b6156 RDI: 00007fd589392010
> RBP: 00007ffd1d106690 R08: 000055b0b5a93bd0 R09: 00000000016b6ff0
> R10: 000055b5eea2c333 R11: 0000000000000246 R12: 000055b0b5a96670
> R13: 0000000000020000 R14: 000055b0b5a9c170 R15: 000055b0b5aa58a0
>   </TASK>
> amdgpu: probe of 0000:03:00.0 failed with error -12
> amdgpu 0000:08:00.0: enabling device (0006 -> 0007)
> [drm] initializing kernel modesetting (RENOIR 0x1002:0x1638 0x1043:0x16C2 0xC4).
>
>
> list_add corruption. prev->next should be next (ffffffffc0940328), but
> was 0000000000000000. (prev=ffff8c9b734062b0).
> ------------[ cut here ]------------
> kernel BUG at lib/list_debug.c:30!
> invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> CPU: 14 PID: 470 Comm: (udev-worker) Tainted: G             L
> -------  ---  6.3.0-0.rc0.20230222git5b7c4cabbb65.3.fc39.x86_64+debug
> #1
> Hardware name: ASUSTeK COMPUTER INC. ROG Strix G513QY_G513QY/G513QY,
> BIOS G513QY.320 09/07/2022
> RIP: 0010:__list_add_valid+0x74/0x90
> Code: 8d ff 0f 0b 48 89 c1 48 c7 c7 a0 3d b3 99 e8 a3 ed 8d ff 0f 0b
> 48 89 d1 48 89 c6 4c 89 c2 48 c7 c7 f8 3d b3 99 e8 8c ed 8d ff <0f> 0b
> 48 89 f2 48 89 c1 48 89 fe 48 c7 c7 50 3e b3 99 e8 75 ed 8d
> RSP: 0018:ffffa50f81aafa00 EFLAGS: 00010246
> RAX: 0000000000000075 RBX: ffff8c9b734062b0 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000027 RDI: 00000000ffffffff
> RBP: ffff8c9b734062b0 R08: 0000000000000000 R09: ffffa50f81aaf8a0
> R10: 0000000000000003 R11: ffff8caa1d2fffe8 R12: ffff8c9b7c0a5e48
> R13: 0000000000000000 R14: ffffffffc13a6d20 R15: 0000000000000000
> FS:  00007fd58c6a5940(0000) GS:ffff8ca9d9a00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055b0b5a955e0 CR3: 000000017e860000 CR4: 0000000000750ee0
> PKRU: 55555554
> Call Trace:
>   <TASK>
>   ttm_device_init+0x184/0x1c0 [ttm]
>   amdgpu_ttm_init+0xb8/0x610 [amdgpu]
>   ? _printk+0x60/0x80
>   gmc_v9_0_sw_init+0x4a3/0x7c0 [amdgpu]
>   amdgpu_device_init+0x14e5/0x2520 [amdgpu]
>   amdgpu_driver_load_kms+0x15/0x190 [amdgpu]
>   amdgpu_pci_probe+0x140/0x420 [amdgpu]
>   local_pci_probe+0x41/0x90
>   pci_device_probe+0xc3/0x230
>   really_probe+0x1b6/0x410
>   __driver_probe_device+0x78/0x170
>   driver_probe_device+0x1f/0x90
>   __driver_attach+0xd2/0x1c0
>   ? __pfx___driver_attach+0x10/0x10
>   bus_for_each_dev+0x8a/0xd0
>   bus_add_driver+0x141/0x230
>   driver_register+0x77/0x120
>   ? __pfx_init_module+0x10/0x10 [amdgpu]
>   do_one_initcall+0x6e/0x350
>   do_init_module+0x4a/0x220
>   __do_sys_init_module+0x192/0x1c0
>   do_syscall_64+0x5b/0x80
>   ? asm_exc_page_fault+0x22/0x30
>   ? lockdep_hardirqs_on+0x7d/0x100
>   entry_SYSCALL_64_after_hwframe+0x72/0xdc
> RIP: 0033:0x7fd58cfcb1be
> Code: 48 8b 0d 4d 0c 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
> 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d
> 01 f0 ff ff 73 01 c3 48 8b 0d 1a 0c 0c 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffd1d1065d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
> RAX: ffffffffffffffda RBX: 000055b0b5aa6d70 RCX: 00007fd58cfcb1be
> RDX: 000055b0b5a96670 RSI: 00000000016b6156 RDI: 00007fd589392010
> RBP: 00007ffd1d106690 R08: 000055b0b5a93bd0 R09: 00000000016b6ff0
> R10: 000055b5eea2c333 R11: 0000000000000246 R12: 000055b0b5a96670
> R13: 0000000000020000 R14: 000055b0b5a9c170 R15: 000055b0b5aa58a0
>   </TASK>
> Modules linked in: amdgpu(+) drm_ttm_helper hid_asus ttm asus_wmi
> iommu_v2 crct10dif_pclmul ledtrig_audio drm_buddy crc32_pclmul
> sparse_keymap gpu_sched crc32c_intel polyval_clmulni platform_profile
> hid_multitouch polyval_generic drm_display_helper nvme rfkill
> ucsi_acpi ghash_clmulni_intel nvme_core typec_ucsi serio_raw
> sp5100_tco ccp sha512_ssse3 r8169 cec typec nvme_common i2c_hid_acpi
> video i2c_hid wmi ip6_tables ip_tables fuse
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:__list_add_valid+0x74/0x90
> Code: 8d ff 0f 0b 48 89 c1 48 c7 c7 a0 3d b3 99 e8 a3 ed 8d ff 0f 0b
> 48 89 d1 48 89 c6 4c 89 c2 48 c7 c7 f8 3d b3 99 e8 8c ed 8d ff <0f> 0b
> 48 89 f2 48 89 c1 48 89 fe 48 c7 c7 50 3e b3 99 e8 75 ed 8d
> RSP: 0018:ffffa50f81aafa00 EFLAGS: 00010246
> RAX: 0000000000000075 RBX: ffff8c9b734062b0 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000027 RDI: 00000000ffffffff
> RBP: ffff8c9b734062b0 R08: 0000000000000000 R09: ffffa50f81aaf8a0
> R10: 0000000000000003 R11: ffff8caa1d2fffe8 R12: ffff8c9b7c0a5e48
> R13: 0000000000000000 R14: ffffffffc13a6d20 R15: 0000000000000000
> FS:  00007fd58c6a5940(0000) GS:ffff8ca9d9a00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055b0b5a955e0 CR3: 000000017e860000 CR4: 0000000000750ee0
> PKRU: 55555554
> (udev-worker) (470) used greatest stack depth: 12416 bytes left
>
> I thought that gracefully means switching to svga mode and showing the
> desktop with software rendering (exactly as it happens when I
> blacklist amdgpu driver). Currently the boot process stucking and the
> local console is unavailable.
>
>

