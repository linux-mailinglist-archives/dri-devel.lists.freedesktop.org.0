Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A0602420
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FBD10E0AA;
	Tue, 18 Oct 2022 06:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616B010E07E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 06:06:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id d26so29711399ejc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 23:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EWA2hwkSsjImpnq19q3HqZSD12LMEEGS/Z8QL4wjg38=;
 b=PlFNPKCJedgthU3/o4ldkwo2E18LMZq2FUtOM0A06YZtVYiqwG9UgqCvkXD5MjqBc6
 Gf4Puz/Kt69IvxcoKgPLhH0HrCTfC7mneSWix/gGWu/NG8Ofx9Xt/+iDG8CnrLE4O/+X
 vdxLP6MYsBHDEBlslKwZ+1FsnOo6MVw6YQQ4cHZGeVTP8twBkcv8xHvGx79EcjK+U7G+
 uwSCbTGSygG2+k6sbaXNcf6BS5JbZ3lxn6ynO2Re/mXmR474xrCwzM3SpamLdii00oIo
 Rd3iPY9eeE15fajBiEWFh2KzLvDABe7o/SmBshIZ3oYiTf4VxgV7Wec5Wh4AeD3zJZyD
 w3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EWA2hwkSsjImpnq19q3HqZSD12LMEEGS/Z8QL4wjg38=;
 b=NyMSbR4spXo1KlgACGNVSmOJgrDozUviYzMEyFwEaVWlXWxHwLF524cKcXDtzZQFeu
 wsiihNoMXJfQWdpTAaPmwguGVMZq8geKYL7L5cCP12dEkNEbp4c/j4H8ZqZxAaW3YI/n
 UfFkeRpqhq8Z3t09rbMZI5vuMbeInoeD8wKxjW0rwrKExAv8jvR6G3s4yTO5oKx5+T2P
 v9ibCjFQzW8g0rHHn7qNOIIdsh0/SMJ6SV25nQ1lyQF6c0HJgs/fkRhR40ARllmxdqMi
 615aYAX6YKdsbFm+7HYk96yCEy9eoWzZ2da9QjXdzWiJ5EeylGOyClr3gJ5z0/+VwPI6
 keaA==
X-Gm-Message-State: ACrzQf2ZUbasrRi1OGaN4iQsrlSIYlG1+1C1Z2wCSTO76XxwIEpC8bNE
 5BMbRcblSTkYXqOCwVPFZM2UAjw/3bcvSLaO1fw2LA==
X-Google-Smtp-Source: AMsMyM4RyZP8sSlrtRJ1YUStexYkP8CwNNxT5ec0eOrpuadDuuDmrcFwpr65UBh+W3VdsP1mSVpK4FxQK2EkHCVg8wk=
X-Received: by 2002:a17:907:7b93:b0:770:1d4f:4de9 with SMTP id
 ne19-20020a1709077b9300b007701d4f4de9mr1048423ejc.201.1666073168638; Mon, 17
 Oct 2022 23:06:08 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 18 Oct 2022 11:35:57 +0530
Message-ID: <CA+G9fYu4cZW8_S3OvQwqaT4CYfVh5vyPAGSkENWXuBN4FJ67vQ@mail.gmail.com>
Subject: kunit: drm_framebuffer: kernel BUG at drivers/gpu/drm/drm_buddy.c
To: open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following kernel BUG reported while running kunit drm_framebuffer tests
on Linux mainline 6.1.0-rc1.

Started happening from Linux next 6.0.0-rc1-next-20220818.
Stared happening on Linux mainline from
git_sha: 833477fce7a14d43ae4c07f8ddc32fa5119471a2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Crash log:
[   38.366527] ok 39 - drm_framebuffer
[   38.367919]     # Subtest: drm_buddy
[   38.367921]     1..6
[   38.368686] ------------[ cut here ]------------
[   38.370089] kernel BUG at drivers/gpu/drm/drm_buddy.c:140!
[   38.371111] invalid opcode: 0000 [#1] PREEMPT SMP
[   38.372003] CPU: 1 PID: 654 Comm: kunit_try_catch Tainted: G    B
         N 6.1.0-rc1 #1
[   38.373486] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[   38.374972] EIP: drm_buddy_init+0x2c0/0x340
[   38.375767] Code: 21 29 c1 83 f9 33 0f 86 27 ff ff ff 8d b4 26 00
00 00 00 8d b4 26 00 00 00 00 0f 0b 8d b6 00 00 00 00 0f 0b 8d b6 00
00 00 00 <0f> 0b 8d b6 00 00 00 00 0f bd 45 0c 0f 44 c1 83 c0 21 e9 e0
fd ff
[   38.379066] EAX: c1379898 EBX: c1aaf0a0 ECX: c1aaf090 EDX: c1aaf0b8
[   38.380196] ESI: 00000034 EDI: c2bcff20 EBP: c2bcfebc ESP: c2bcfe8c
[   38.381308] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010297
[   38.382507] CR0: 80050033 CR2: f4f5e000 CR3: 0f947000 CR4: 003506d0
[   38.383659] DR0: cf9aada4 DR1: cf9aada9 DR2: cf9aadaa DR3: cf9aadab
[   38.384760] DR6: ffff0ff0 DR7: 00000600
[   38.385441] Call Trace:
[   38.385909]  drm_test_buddy_alloc_limit+0x47/0x3c0
[   38.386772]  ? __switch_to_asm+0x8f/0xf0
[   38.387488]  ? __switch_to_asm+0x89/0xf0
[   38.388192]  ? __switch_to_asm+0x83/0xf0
[   38.388903]  ? finish_task_switch+0x80/0x2b0
[   38.389670]  ? __schedule+0x2dc/0xac0
[   38.390325]  ? trace_hardirqs_on+0x36/0xf0
[   38.391066]  ? finish_task_switch+0x80/0x2b0
[   38.391848]  ? __switch_to+0x18/0x1e0
[   38.392505]  ? drm_buddy_init_test+0x25/0x40
[   38.393287]  ? get_random_u32+0x8f/0xf0
[   38.393991]  ? drm_buddy_init_test+0x25/0x40
[   38.394775]  kunit_try_run_case+0x52/0x80
[   38.395524]  ? trace_hardirqs_on+0x36/0xf0
[   38.396259]  kunit_generic_run_threadfn_adapter+0x16/0x20
[   38.397231]  kthread+0xe0/0x110
[   38.397820]  ? kunit_try_catch_throw+0x20/0x20
[   38.398620]  ? kthread_complete_and_exit+0x20/0x20
[   38.399503]  ret_from_fork+0x1c/0x28
[   38.400174] Modules linked in:
[   38.400781] ---[ end trace 0000000000000000 ]---
[   38.401623] EIP: drm_buddy_init+0x2c0/0x340
[   38.402374] Code: 21 29 c1 83 f9 33 0f 86 27 ff ff ff 8d b4 26 00
00 00 00 8d b4 26 00 00 00 00 0f 0b 8d b6 00 00 00 00 0f 0b 8d b6 00
00 00 00 <0f> 0b 8d b6 00 00 00 00 0f bd 45 0c 0f 44 c1 83 c0 21 e9 e0
fd ff
[   38.405711] EAX: c1379898 EBX: c1aaf0a0 ECX: c1aaf090 EDX: c1aaf0b8
[   38.406830] ESI: 00000034 EDI: c2bcff20 EBP: c2bcfebc ESP: c2bcfe8c
[   38.407976] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010297
[   38.409186] CR0: 80050033 CR2: f4f5e000 CR3: 0f947000 CR4: 003506d0
login-action: exception
[login-action] Waiting for messages, (timeout 00:09:56)
[   38.410313] DR0: cf9aada4 DR1: cf9aada9 DR2: cf9aadaa DR3: cf9aadab
[   38.411481] DR6: ffff0ff0 DR7: 00000600
[  365.847635]     # drm_test_buddy_alloc_limit: try timed out
[  365.848890] ------------[ cut here ]------------
[  365.849823] refcount_t: addition on 0; use-after-free.
[  365.850822] WARNING: CPU: 3 PID: 1 at lib/refcount.c:25
refcount_warn_saturate+0x84/0x120
[  365.852421] Modules linked in:
[  365.853055] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G    B D
 N 6.1.0-rc1 #1
[  365.854612] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[  365.856032] EIP: refcount_warn_saturate+0x84/0x120
[  365.856931] Code: cf e8 bb 9a a1 00 0f 0b eb cf 8d 74 26 00 80 3d
54 c7 7d cf 00 75 c2 c7 04 24 90 41 43 cf b0 01 a2 54 c7 7d cf e8 97
9a a1 00 <0f> 0b eb ab 8d b4 26 00 00 00 00 90 80 3d 56 c7 7d cf 00 75
9a c7
[  365.860283] EAX: 0000002a EBX: c23a0000 ECX: ce17a1d2 EDX: 00000000
[  365.861373] ESI: c23a0018 EDI: c23a0000 EBP: c11cdc90 ESP: c11cdc8c
[  365.862567] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010296
[  365.863917] CR0: 80050033 CR2: 00000000 CR3: 0f947000 CR4: 003506d0
[  365.865113] DR0: cf9aadac DR1: cf9aadad DR2: cf9aadae DR3: cf9aadaf
[  365.866330] DR6: ffff0ff0 DR7: 00000600
[  365.867157] Call Trace:
[  365.867736]  kthread_stop+0x184/0x190
[  365.868480]  kunit_try_catch_run.cold+0x7b/0xc1
[  365.869373]  kunit_run_case_catch_errors+0x6e/0xa8
[  365.870394]  kunit_run_tests.cold+0x1c4/0x5fe
[  365.871218]  ? kunit_catch_run_case+0x50/0x50
[  365.872153]  ? kunit_module_notify+0x90/0x90
[  365.872945]  ? up_write+0x37/0x70
[  365.873565]  ? preempt_count_sub+0xc1/0x110
[  365.874356]  ? preempt_count_add+0x6c/0xd0
[  365.875120]  ? up_write+0x37/0x70
[  365.875723]  ? __debugfs_create_file+0xdb/0x1a0
[  365.876625]  ? up_write+0x37/0x70
[  365.877264]  ? debugfs_create_file+0x3c/0x50
[  365.878134]  ? kunit_debugfs_create_suite+0x90/0xa0
[  365.879046]  __kunit_test_suites_init+0x52/0x70
[  365.879873]  kunit_run_all_tests.cold+0xeb/0x170
[  365.880730]  ? kernel_init_freeable+0x1d0/0x209
[  365.881702]  kernel_init_freeable+0x1d5/0x209
[  365.882568]  ? rest_init+0xc0/0xc0
[  365.883240]  kernel_init+0x1a/0x110
[  365.883950]  ? schedule_tail_wrapper+0x9/0xc
[  365.884756]  ret_from_fork+0x1c/0x28
[  365.885431] ---[ end trace 0000000000000000 ]---
[  365.886320] BUG: kernel NULL pointer dereference, address: 00000000
[  365.887443] #PF: supervisor write access in kernel mode
login-action: exception
[login-action] Waiting for messages, (timeout 00:09:56)
[  365.888395] #PF: error_code(0x0002) - not-present page
[  365.889329] *pde = 00000000
[  365.889883] Oops: 0002 [#2] PREEMPT SMP
[  365.890599] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G    B D W
 N 6.1.0-rc1 #1
[  365.891980] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
BIOS 1.12.0-1 04/01/2014
[  365.893510] EIP: kthread_stop+0x42/0x190
[  365.894236] Code: 00 00 f0 0f c1 43 18 85 c0 0f 84 51 01 00 00 8d
50 01 09 c2 0f 88 fe 00 00 00 f6 43 1e 20 0f 84 14 01 00 00 8b bb 2c
04 00 00 <f0> 80 0f 02 89 d8 e8 83 f7 ff ff f0 80 4b 02 02 89 d8 e8 b7
2e 01
[  365.897721] EAX: 0000002a EBX: c23a0000 ECX: ce17a1d2 EDX: 00000000
[  365.898816] ESI: c23a0018 EDI: 00000000 EBP: c11cdca4 ESP: c11cdc98
[  365.899951] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010202
[  365.901188] CR0: 80050033 CR2: 00000000 CR3: 0f947000 CR4: 003506d0
[  365.902360] DR0: cf9aadac DR1: cf9aadad DR2: cf9aadae DR3: cf9aadaf
[  365.903457] DR6: ffff0ff0 DR7: 00000600
[  365.904164] Call Trace:
[  365.904650]  kunit_try_catch_run.cold+0x7b/0xc1
[  365.905538]  kunit_run_case_catch_errors+0x6e/0xa8
[  365.906471]  kunit_run_tests.cold+0x1c4/0x5fe
[  365.907297]  ? kunit_catch_run_case+0x50/0x50
[  365.908127]  ? kunit_module_notify+0x90/0x90
[  365.908935]  ? up_write+0x37/0x70
[  365.909565]  ? preempt_count_sub+0xc1/0x110
[  365.910336]  ? preempt_count_add+0x6c/0xd0
[  365.911094]  ? up_write+0x37/0x70
[  365.911763]  ? __debugfs_create_file+0xdb/0x1a0
[  365.912657]  ? up_write+0x37/0x70
[  365.913274]  ? debugfs_create_file+0x3c/0x50
[  365.914963]  ? kunit_debugfs_create_suite+0x90/0xa0
[  365.916691]  __kunit_test_suites_init+0x52/0x70
[  365.918568]  kunit_run_all_tests.cold+0xeb/0x170
[  365.919874]  ? kernel_init_freeable+0x1d0/0x209
[  365.922279]  kernel_init_freeable+0x1d5/0x209
[  365.923195]  ? rest_init+0xc0/0xc0
[  365.923922]  kernel_init+0x1a/0x110
[  365.924720]  ? schedule_tail_wrapper+0x9/0xc
[  365.925416]  ret_from_fork+0x1c/0x28
[  365.926043] Modules linked in:
[  365.926558] CR2: 0000000000000000
[  365.927137] ---[ end trace 0000000000000000 ]---
[  365.927898] EIP: drm_buddy_init+0x2c0/0x340
[  365.928623] Code: 21 29 c1 83 f9 33 0f 86 27 ff ff ff 8d b4 26 00
00 00 00 8d b4 26 00 00 00 00 0f 0b 8d b6 00 00 00 00 0f 0b 8d b6 00
00 00 00 <0f> 0b 8d b6 00 00 00 00 0f bd 45 0c 0f 44 c1 83 c0 21 e9 e0
fd ff
[  365.932581] EAX: c1379898 EBX: c1aaf0a0 ECX: c1aaf090 EDX: c1aaf0b8
[  365.933606] ESI: 00000034 EDI: c2bcff20 EBP: c2bcfebc ESP: c2bcfe8c
[  365.934846] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010297
[  365.936612] CR0: 80050033 CR2: 00000000 CR3: 0f947000 CR4: 003506d0
[  365.938215] DR0: cf9aadac DR1: cf9aadad DR2: cf9aadae DR3: cf9aadaf
[  365.939499] DR6: ffff0ff0 DR7: 00000600
[  365.940268] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x00000009
[  365.941729] Kernel Offset: disabled

URL:
[1] https://lkft.validation.linaro.org/scheduler/job/5689216#L2230
[2] https://lkft.validation.linaro.org/scheduler/job/5633224#L217

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
  git_sha: 9abf2313adc1ca1b6180c508c25f22f9395cc780
  git_describe: v6.1-rc1
  kernel_version: 6.1.0-rc1
  kernel-config: https://builds.tuxbuild.com/2GEkhTdtJyiEiwjlnDNtueheTdH/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline/-/pipelines/668166832
  artifact-location: https://builds.tuxbuild.com/2GEkhTdtJyiEiwjlnDNtueheTdH
  toolchain: gcc-11
  System.map: https://builds.tuxbuild.com/2GEkhTdtJyiEiwjlnDNtueheTdH/System.map
  vmlinux.xz: https://builds.tuxbuild.com/2GEkhTdtJyiEiwjlnDNtueheTdH/vmlinux.xz

--
Linaro LKFT
https://lkft.linaro.org
