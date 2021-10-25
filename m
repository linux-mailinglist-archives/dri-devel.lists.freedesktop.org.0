Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D89A4397FA
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 15:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED80289C52;
	Mon, 25 Oct 2021 13:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3FD89C52;
 Mon, 25 Oct 2021 13:58:43 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id 77so11788761qkh.6;
 Mon, 25 Oct 2021 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=XAsYVtDkbLBLnmS42ewkQs9qrufhT6ANs66bBgPb9xY=;
 b=Q5EZlPvpljrpgXxtTu8sNkVy6cBDBS/7MZDdJc6jD+XLN1i9xwzfwDMQQcZfabkF07
 06W25iis3bpq0/b2Ef/B7hD15yTrHd83fIaJlGvcytJfs+EaSv8OKjxE5cSlvlz9PjZg
 +BcmfZkgf+i7S7AI2vkytX28clBnXiUabqhDVpNujfJS6YWJ34EuwzbbgwjL2FW2c60s
 yajxKGXATTvFlO/U4AuwpPXKMUMMHUb4fzxoQSuAF0b9QC3fRAp6tGNiiY8DC5qoPOg/
 zLgDZNRZBJbPWum5N5nq4V0m7XgVOs4eEcjPCoqLDiDJgadvyuuoiczM72H+EaYvovfr
 RfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=XAsYVtDkbLBLnmS42ewkQs9qrufhT6ANs66bBgPb9xY=;
 b=0kZVnNL/hmQ1Bb9D5i24ZPK5EAHpunYg0iPN081ekhSgMcmpRYLk00qLGbxthiEzPU
 YYXxggQpLQntDe1Dsk5NoB3OllSS1vsQ32noAGhU43tF3/UEQj3/5PGwqQv/0VR/Q7KQ
 4jYxHPBw3SeMUuiPVtig3+0fKGY+EDg5CfySayvnKGmZ+JlzKmbIWz8tpN7JCHcchL6a
 HDKu8NuRCo8eISeqF3eivsQcSWQLRiUIVbzsgTQwjbdu++/4F1Dvr6LeCu9P7zkeUGlq
 mEfNdXh9abgdxyhmN9goDpO9i0tS2DmM32BNl1UbZQUwqJqlSWzE2G9c5/nRtl27efIG
 i9rg==
X-Gm-Message-State: AOAM533e0KcbpexNhnJqVedt7z1m/Uz3ptAPKO5aGRXhU89NyDhBWseT
 N9s37R+Q3luEEjAQkSrr8IxNd7IjPWQ=
X-Google-Smtp-Source: ABdhPJywjtvb87bHx5lj6xIYG2rrfOWusXaqjyKqgnmLV2ERmrkapnYz0+kyc+K9rh7wCNhavenArQ==
X-Received: by 2002:a05:620a:639:: with SMTP id
 25mr13292828qkv.324.1635170322052; 
 Mon, 25 Oct 2021 06:58:42 -0700 (PDT)
Received: from mua.localhost ([2600:1700:e380:2c20::49])
 by smtp.gmail.com with ESMTPSA id i13sm8405311qtp.87.2021.10.25.06.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 06:58:41 -0700 (PDT)
Message-ID: <77945f63-5613-a386-6d0e-8162f0c5483a@gmail.com>
Date: Mon, 25 Oct 2021 09:58:40 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.0
Subject: Re: amdgpu "Fatal error during GPU init"; Ryzen 5600G integrated GPU
 + kernel 5.14.13
Content-Language: en-US
From: PGNet Dev <pgnet.dev@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <b4adea1b-9a21-75d2-7ee7-25d4f28ef6f8@gmail.com>
 <2303555f-42cd-180c-7a67-1d104bceea7d@gmail.com>
In-Reply-To: <2303555f-42cd-180c-7a67-1d104bceea7d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: PGNet Dev <pgnet.dev@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

adding a trace,

...
[    5.201715] [drm] amdgpu kernel modesetting enabled.
[    5.201902] amdgpu: Virtual CRAT table created for CPU
[    5.201909] amdgpu: Topology: Add CPU node
[    5.201968] checking generic (e1000000 1d5000) vs hw (c0000000 10000000)
[    5.201969] checking generic (e1000000 1d5000) vs hw (d0000000 200000)
[    5.201970] checking generic (e1000000 1d5000) vs hw (fc500000 80000)
[    5.201988] amdgpu 0000:30:00.0: enabling device (0000 -> 0003)
[    5.202020] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1638 0x1002:0x1636 0xC9).
[    5.202024] amdgpu 0000:30:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
[    5.202033] [drm] register mmio base: 0xFC500000
[    5.202033] [drm] register mmio size: 524288
[    5.202035] [drm] PCIE atomic ops is not supported
[    5.203075] [drm] add ip block number 0 <soc15_common>
[    5.203076] [drm] add ip block number 1 <gmc_v9_0>
[    5.203077] [drm] add ip block number 2 <vega10_ih>
[    5.203078] [drm] add ip block number 3 <psp>
[    5.203078] [drm] add ip block number 4 <smu>
[    5.203079] [drm] add ip block number 5 <gfx_v9_0>
[    5.203079] [drm] add ip block number 6 <sdma_v4_0>
[    5.203080] [drm] add ip block number 7 <dm>
[    5.203081] [drm] add ip block number 8 <vcn_v2_0>
[    5.203081] [drm] add ip block number 9 <jpeg_v2_0>
[    5.208784] [drm] BIOS signature incorrect 0 0
[    5.208789] amdgpu 0000:30:00.0: BAR 6: can't assign [??? 0x00000000 flags 0x20000000] (bogus alignment)
[    5.214038] [drm] BIOS signature incorrect 0 0
[    5.214042] amdgpu 0000:30:00.0: amdgpu: Unable to locate a BIOS ROM
[    5.214044] amdgpu 0000:30:00.0: amdgpu: Fatal error during GPU init
[    5.214045] amdgpu 0000:30:00.0: amdgpu: amdgpu: finishing device.
[    5.214048] ------------[ cut here ]------------
[    5.214049] WARNING: CPU: 5 PID: 539 at kernel/workqueue.c:3044 __flush_work.isra.0+0x1ef/0x200
[    5.214054] Modules linked in: fjes(-) amdgpu(+) raid1 ast drm_vram_helper drm_ttm_helper iommu_v2 ttm gpu_sched drm_kms_helper igb crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel cec dca i2c_algo_bit sp5100_tco ccp drm uas usb_storage wmi video sunrpc tcp_bbr nct6775 hwmon_vid k10temp
[    5.214065] CPU: 5 PID: 539 Comm: systemd-udevd Not tainted 5.14.13-200.fc34.x86_64 #1
[    5.214067] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./X470D4U, BIOS P4.20 04/14/2021
[    5.214068] RIP: 0010:__flush_work.isra.0+0x1ef/0x200
[    5.214070] Code: 8b 4d 00 48 8b 55 08 83 e1 08 48 0f ba 6d 00 03 80 c9 f0 e9 37 ff ff ff 0f 0b 48 83 c4 48 44 89 e0 5b 5d 41 5c 41 5d 41 5e c3 <0f> 0b 45 31 e4 e9 46 ff ff ff 0f 1f 80 00 00 00 00 0f 1f 44 00 00
[    5.214071] RSP: 0018:ffff9d5f00f0fa80 EFLAGS: 00010246
[    5.214073] RAX: 0000000000000011 RBX: 0000000000000000 RCX: 0000000000000027
[    5.214074] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff88bc91e25ab8
[    5.214074] RBP: ffff88bc91e25ab8 R08: 0000000000000000 R09: ffff9d5f00f0f898
[    5.214075] R10: ffff9d5f00f0f890 R11: ffff88c39e1fcfe8 R12: 0000000000000001
[    5.214075] R13: ffff88bc92622800 R14: ffff88bc91e20000 R15: ffff9d5f00f0fde0
[    5.214076] FS:  00007f231d7deb40(0000) GS:ffff88c37df40000(0000) knlGS:0000000000000000
[    5.214077] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    5.214078] CR2: 00007fa1bbfa5ff0 CR3: 0000000104b94000 CR4: 0000000000750ea0
[    5.214078] PKRU: 55555554
[    5.214079] Call Trace:
[    5.214082]  ? dev_printk_emit+0x3e/0x40
[    5.214085]  __cancel_work_timer+0xea/0x170
[    5.214086]  ? del_timer_sync+0x57/0x80
[    5.214089]  ttm_bo_lock_delayed_workqueue+0x11/0x20 [ttm]
[    5.214093]  amdgpu_device_fini_hw+0x33/0x2c5 [amdgpu]
[    5.214225]  amdgpu_driver_load_kms.cold+0x72/0x94 [amdgpu]
[    5.214338]  amdgpu_pci_probe+0x110/0x1a0 [amdgpu]
[    5.214420]  local_pci_probe+0x42/0x80
[    5.214423]  ? __cond_resched+0x16/0x40
[    5.214426]  pci_device_probe+0xd9/0x190
[    5.214427]  really_probe+0x1f5/0x3f0
[    5.214429]  __driver_probe_device+0xfe/0x180
[    5.214430]  driver_probe_device+0x1e/0x90
[    5.214431]  __driver_attach+0xc0/0x1c0
[    5.214433]  ? __device_attach_driver+0xe0/0xe0
[    5.214434]  ? __device_attach_driver+0xe0/0xe0
[    5.214434]  bus_for_each_dev+0x64/0x90
[    5.214436]  bus_add_driver+0x12b/0x1e0
[    5.214438]  driver_register+0x8f/0xe0
[    5.214439]  ? 0xffffffffc0d62000
[    5.214440]  do_one_initcall+0x44/0x1d0
[    5.214443]  ? kmem_cache_alloc_trace+0x15c/0x280
[    5.214445]  do_init_module+0x5c/0x270
[    5.214448]  __do_sys_init_module+0x11d/0x180
[    5.214450]  do_syscall_64+0x3b/0x90
[    5.214452]  ? handle_mm_fault+0xcf/0x2a0
[    5.214454]  ? do_user_addr_fault+0x1d5/0x680
[    5.214457]  ? syscall_exit_to_user_mode+0x18/0x40
[    5.214458]  ? exc_page_fault+0x72/0x150
[    5.214459]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[    5.214461] RIP: 0033:0x7f231e42a0fe
[    5.214463] Code: 48 8b 0d 7d 1d 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4a 1d 0c 00 f7 d8 64 89 01 48
[    5.214463] RSP: 002b:00007ffd8d40e9e8 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
[    5.214465] RAX: ffffffffffffffda RBX: 000055f6d5e2b7f0 RCX: 00007f231e42a0fe
[    5.214465] RDX: 00007f231e57d32c RSI: 0000000000d4ebde RDI: 00007f231bc53010
[    5.214466] RBP: 00007f231bc53010 R08: 000055f6d5e0e050 R09: 0000000000d4ebf0
[    5.214466] R10: 000055f38ab3874e R11: 0000000000000246 R12: 00007f231e57d32c
[    5.214467] R13: 000055f6d5e0f840 R14: 0000000000000007 R15: 000055f6d5deff30
[    5.214468] ---[ end trace ce1b3e6fbbcac425 ]---
[    5.214481] x86/PAT: systemd-udevd:539 freeing invalid memtype [mem 0x00000000-0xffffffffffffffff]
[    5.214539] amdgpu: probe of 0000:30:00.0 failed with error -22
[
...
