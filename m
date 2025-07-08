Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920FBAFD7B4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 21:56:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFD910E077;
	Tue,  8 Jul 2025 19:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iSfNCryA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C84710E077
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 19:56:14 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-31393526d0dso3333786a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 12:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752004573; x=1752609373; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fcuG5E4fTyzhfyZjqsSebYPzJkILt8R+EifxtuZ0S9Q=;
 b=iSfNCryATW8gjcEkJJmN2t9cLOBnh68mopHeimnIJQOfTkngYxyN1FKlfxXBbxz3xE
 dyg+d/DD5dm0FfD41kfGSCzK9dF08+Nm8mf9SFfe6ue8+QE4KQTnEqCEuDKNyvrhxUiP
 +bDkph4W97thqZyhefBMmCZQ/AVrcgwiBMhcdsOhui3UT74ZyB3CHqayzzLzZBt+V4ac
 BQO5XolaqhSg1Apt1ZYoWTiWulbEns9rsBFoFqN5z5SPbkp5gDqt4xNXIVZW2Ty2t+eA
 VjN4Wg6h+Mf8cDZnfBZPZmWLrDopt4C+A6lEUSPeAsYYps2AQc5RRLI80XfvT/wcsP5e
 nZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752004573; x=1752609373;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fcuG5E4fTyzhfyZjqsSebYPzJkILt8R+EifxtuZ0S9Q=;
 b=WPbst06FW42eTWumA/k/BYT2TgquXPrX/biJkjpej/7bDTNAVGd3QnYLm7ng2taUF3
 HiNUmoA9oP48D8detIjWiq0qsmtaqQP4c/9pm5+EzLyxV585XnCf+az8ZQQ4/9QrX9zt
 nBRQXncdBnSFF9gBdkAkRWdTpOkokeqdFRI7VSeLV7fuZRFWHE1GcSP+Oj1oZ3GwrO1T
 +4UG9eQEJCG7E8D0sRdRIJm6/Uvj/aB/iefVyVU2nIX6NvDLTrsD9XmiDnG/mt5H0Vvl
 7p1B/TfIO3o1qddYbOkCAS6s8GzCsWu4ynZDX/1vHKAcxru+n/nRBNGoADozNpSXVPtZ
 M9gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfaFrCWRf284IqMSj+Ep/bvif7bOu1sXjgcZjNPcksSZeB0VayuVQVdGKeO6GuY06rt1WoAJ8kQNA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFfLwv/XVQfEqUGM3+pOjhOuWMqyijcjetpRnx0IsHgwTA3K09
 JgHGdTOhg0BXD9HWDjMK6ZUG+1E0iMZpv1vyxbLmXL/U8vGGjbZWv9+Kw3rwMZsMNozXXIR75W4
 i3kCcZbMQ7dC3zyHw4dLdvrhVZrOjmwPFPHDABztn0g==
X-Gm-Gg: ASbGncvcLdlHVUTqnw7FH8NaO410Qt7QDBFwxwgsdU+iP1QeMNEhE0BVnk3xi4GrBjl
 pX6DfODE+HDtZrOyZDqZlE3xVbg3vCViNxwrkK3McB8x2W2LhPRPUX+GjVG0pGXXQdke5ZzbHeR
 4d6Ri8dk3NQdfYiBgq+9HZyRGMfsz7sk4S07fTaTwGLQxO8xTKrRT7jSRGnM0rbKF5SLrYUxiUf
 q9q
X-Google-Smtp-Source: AGHT+IH1WcHMrc+Cx7EB48e8fd7QMVUFeWNKORr34eb7+XKwNQeqddn6j25Gc7eNrqIxILdBkq7WHCsCmrgo2+4jX5k=
X-Received: by 2002:a17:90b:540c:b0:313:2adc:b4c4 with SMTP id
 98e67ed59e1d1-31c2ee883f8mr524731a91.24.1752004573492; Tue, 08 Jul 2025
 12:56:13 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 9 Jul 2025 01:26:02 +0530
X-Gm-Features: Ac12FXw5XamTN-G7jH7C1o7OwNlZc4uAmE5CpwkARwumTP0dviyOQNAlpADWzt8
Message-ID: <CA+G9fYtvLHtjKbw-zpqGmtmBMgyJ0B8aiVwd8R=vRnj9YOZ3Xw@mail.gmail.com>
Subject: next-20250702 kernel NULL pointer dereference
 adv7511_cec_register_volatile
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
 Linux Regressions <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Abdun Nihaal <abdun.nihaal@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
 Ben Copeland <benjamin.copeland@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Regression on the Dragonboard 410c while booting Linux next-20250702 tag
kernel the following kernel crash noticed. This is specific to the device.

Test environments:
- Dragonboard-410c

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

This issue started from next-20250702
Good: next-20250625
Bad: next-20250702 till next-20250708

Boot regression: next-20250702 kernel NULL pointer dereference
adv7511_cec_register_volatile

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

I am investigating this issue,
Planning to revert and re-build and test in a loop.
  c871c199accb3 regmap: fix potential memory leak of regmap_bus

FYI,
The modules were not built with debug information enabled,
which is why some address-to-line mappings are missing.

## Boot log

[   10.847835]  cs_system_cfg: CoreSight Configuration manager initialised
[   10.867200] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000398
[   10.867258] Mem abort info:
[   10.875089]   ESR = 0x0000000096000004
[   10.877585]   EC = 0x25: DABT (current EL), IL = 32 bits
[   10.881411]   SET = 0, FnV = 0
[   10.886870]   EA = 0, S1PTW = 0
[   10.889738]   FSC = 0x04: level 0 translation fault
[   10.892763] Data abort info:
[   10.897638]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[   10.900751]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[   10.906056]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   10.911178] user pgtable: 4k pages, 48-bit VAs, pgdp=000000008358a000
[   10.916562] [0000000000000398] pgd=0000000000000000, p4d=0000000000000000
[   10.922903] Internal error: Oops: 0000000096000004 [#1]  SMP
[   10.929659] Modules linked in: v4l2_async v4l2_mem2mem coresight
qcom_q6v5 snd_compress llcc_qcom ocmem qcom_sysmon drm_exec snd_pcm
videobuf2_v4l2 gpu_sched adv7511 qcom_common drm_dp_aux_bus snd_timer
videodev qcom_glink_smem drm_display_helper mdt_loader snd qmi_helpers
videobuf2_memops cec videobuf2_common qnoc_msm8916 qcom_spmi_vadc
soundcore qcom_spmi_temp_alarm qcom_pon qcom_vadc_common
drm_client_lib rtc_pm8xxx phy_qcom_usb_hs mc ramoops display_connector
qcom_rng rpmsg_ctrl qcom_stats reed_solomon socinfo rpmsg_char
rmtfs_mem drm_kms_helper drm fuse backlight ip_tables x_tables
[   10.965027] CPU: 1 UID: 0 PID: 250 Comm: irq/48-3-0039 Not tainted
6.16.0-rc4-next-20250702 #1 PREEMPT
[   10.987220] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   10.996416] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   11.003359] pc : adv7511_cec_register_volatile+0xc/0x30 adv7511
[   11.010042] lr : regmap_volatile (drivers/base/regmap/regmap.c:153)
[   11.016286] sp : ffff8000832e3bf0
[   11.020277] x29: ffff8000832e3bf0 x28: 0000000000000000 x27: ffff8000821bb000
[   11.023757] x26: 00000000ffffffff x25: 0000000000000004 x24: 0000000000000001
[   11.030876] x23: ffff8000801db37c x22: ffff000004839000 x21: ffff000004839000
[   11.037994] x20: 0000000000000081 x19: ffff8000832e3cc0 x18: 0000000000000001
[   11.045112] x17: 00000000000000c7 x16: 00000000000000c4 x15: ffff00000af04a60
[   11.052231] x14: 0000000000000000 x13: ffff00000af04a60 x12: 0000000000000000
[   11.059349] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[   11.066467] x8 : 005fffffffffffff x7 : ffff000005850400 x6 : 0000000000000000
[   11.073584] x5 : ffff00000ac78a00 x4 : ffff8000832e3910 x3 : ffff00000ac78980
[   11.080703] x2 : ffff8000832e3cc0 x1 : 0000000000000081 x0 : ffff00000483b020
[   11.087822] Call trace:
[   11.094930] adv7511_cec_register_volatile+0xc/0x30 adv7511 (P)
[   11.097194] regcache_read (drivers/base/regmap/regcache.c:273)
[   11.103438] _regmap_read (drivers/base/regmap/regmap.c:2805)
[   11.107084] regmap_read (drivers/base/regmap/regmap.c:2850)
[   11.110643] adv7511_cec_irq_process+0x6c/0x2d0 adv7511
[   11.113859] adv7511_irq_process+0xf8/0x130 adv7511
[   11.119326] adv7511_irq_handler+0x18/0x28 adv7511
[   11.124362] irq_thread_fn (kernel/irq/manage.c:1131)
[   11.129394] irq_thread (kernel/irq/manage.c:1257)
[   11.132953] kthread (kernel/kthread.c:465)
[   11.136164] ret_from_fork (arch/arm64/kernel/entry.S:863)
[ 11.139642] Code: d65f03c0 d503245f f9403c09 92fff408 (f941cd29)
All code
========
   0: d65f03c0 ret
   4: d503245f bti c
   8: f9403c09 ldr x9, [x0, #120]
   c: 92fff408 mov x8, #0x5fffffffffffff      // #27021597764222975
  10:* f941cd29 ldr x9, [x9, #920] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f941cd29 ldr x9, [x9, #920]
[   11.143205] ---[ end trace 0000000000000000 ]---

<trim >

[   11.934731] WARNING: drivers/iommu/io-pgtable-arm.c:569 at
arm_lpae_map_pages+0x94/0x170, CPU#0: udev-worker)/212
[   11.938388] Modules linked in: snd_soc_lpass_platform venus_core(+)
coresight_tmc(+) coresight_replicator snd_soc_msm8916_analog
snd_soc_apq8016_sbc snd_soc_qcom_common qrtr snd_soc_core
videobuf2_dma_sg coresight_stm coresight_funnel qcom_q6v5_mss
coresight_tpiu v4l2_fwnode stm_core coresight_cti snd_pcm_dmaengine
qcom_pil_info v4l2_async v4l2_mem2mem coresight qcom_q6v5 snd_compress
llcc_qcom ocmem qcom_sysmon drm_exec snd_pcm videobuf2_v4l2 gpu_sched
adv7511 qcom_common drm_dp_aux_bus snd_timer videodev qcom_glink_smem
drm_display_helper mdt_loader snd qmi_helpers videobuf2_memops cec
videobuf2_common qnoc_msm8916 qcom_spmi_vadc soundcore
qcom_spmi_temp_alarm qcom_pon qcom_vadc_common drm_client_lib
rtc_pm8xxx phy_qcom_usb_hs mc ramoops display_connector qcom_rng
rpmsg_ctrl qcom_stats reed_solomon socinfo rpmsg_char rmtfs_mem
drm_kms_helper drm fuse backlight ip_tables x_tables
[   12.004415] CPU: 0 UID: 0 PID: 212 Comm: (udev-worker) Tainted: G
   D             6.16.0-rc4-next-20250702 #1 PREEMPT
[   12.026582] Tainted: [D]=DIE
[   12.037498] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   12.040458] pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   12.047139] pc : arm_lpae_map_pages (drivers/iommu/io-pgtable-arm.c:?)
[   12.053818] lr : qcom_iommu_map (drivers/iommu/arm/arm-smmu/qcom_iommu.c:441)
[   12.058332] sp : ffff800083263320
[   12.062410] x29: ffff800083263320 x28: ffffffffffffffff x27: 0000000000000000
[   12.065715] x26: ffff00000323b908 x25: ffff00000323ba38 x24: 00000000dd800000
[   12.072834] x23: 000000008d900000 x22: 0000000000100000 x21: 0000000000000002
[   12.079952] x20: 0000000000000003 x19: ffff800083263398 x18: 0000000000000002
[   12.087070] x17: 0000000000000000 x16: 000000000000000b x15: ffff00000586e540
[   12.094188] x14: 0000000000000000 x13: 000000000225ce00 x12: 0000000000ffffff
[   12.101308] x11: 0000000001000000 x10: 0000000000000000 x9 : 0000000000000001
[   12.108424] x8 : 0000000000001000 x7 : ffff800083263398 x6 : 0000000000000820
[   12.115544] x5 : 0000000000000003 x4 : 0000000000000002 x3 : 0000000000100000
[   12.122660] x2 : 000000008d900000 x1 : 00000000dd800000 x0 : 00000000ffffffea
[   12.129780] Call trace:
[   12.136888] arm_lpae_map_pages (drivers/iommu/io-pgtable-arm.c:?) (P)
[   12.139150] iommu_map_nosync (drivers/iommu/iommu.c:2511)
[   12.143661] iommu_map_sg (drivers/iommu/iommu.c:2679)
[   12.147740] __iommu_dma_alloc_noncontiguous (drivers/iommu/dma-iommu.c:982)
[   12.151390] iommu_dma_alloc (drivers/iommu/dma-iommu.c:1007
drivers/iommu/dma-iommu.c:1650)
[   12.156682] dma_alloc_attrs (kernel/dma/mapping.c:639)
[   12.160240] venus_hfi_create+0xa8/0x2a4 venus_core
[   12.164064] hfi_create+0x58/0x70 venus_core
[   12.169270] venus_probe+0x1e4/0x410 venus_core
[   12.173611] platform_probe (drivers/base/platform.c:1405)
[   12.178382] really_probe (drivers/base/dd.c:581)
[   12.182029] __driver_probe_device (drivers/base/dd.c:?)
[   12.185676] driver_probe_device (drivers/base/dd.c:829)
[   12.190015] __driver_attach (drivers/base/dd.c:1216)
[   12.193921] bus_for_each_dev (drivers/base/bus.c:369)
[   12.197741] driver_attach (drivers/base/dd.c:1233)
[   12.201907] bus_add_driver (drivers/base/bus.c:679)
[   12.205466] driver_register (drivers/base/driver.c:250)
[   12.209025] __platform_driver_register (drivers/base/platform.c:867)
[   12.212846] init_module+0x20/0xfc0 venus_core
[   12.217708] do_one_initcall (init/main.c:1247)
[   12.222393] do_init_module (kernel/module/main.c:3046)
[   12.225953] load_module (kernel/module/main.c:3516)
[   12.229773] __arm64_sys_finit_module (kernel/module/main.c:3708
kernel/module/main.c:3720 kernel/module/main.c:3746
kernel/module/main.c:3730 kernel/module/main.c:3730)
[   12.233507] invoke_syscall (arch/arm64/kernel/syscall.c:50)
[   12.238279] el0_svc_common (arch/arm64/kernel/syscall.c:139)
[   12.241924] do_el0_svc (arch/arm64/kernel/syscall.c:152)
[   12.245568] el0_svc (arch/arm64/kernel/entry-common.c:169)
[   12.248868] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:825)
[   12.251822] el0t_64_sync (arch/arm64/kernel/entry.S:600)
[   12.256249] ---[ end trace 0000000000000000 ]---
[   12.260539] qcom-venus 1d00000.video-codec: probe with driver
qcom-venus failed with error -12

## Source
* Kernel version: 6.16.0-rc4-next-20250702
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 50c8770a42faf8b1c7abe93e7c114337f580a97d
* Git describe: next-20250702
* Project: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250702
* Architectures: arm64
* Toolchains: clang-20
* Kconfigs: clang-20-lkftconfig

## Build
* Test log: https://lkft.validation.linaro.org/scheduler/job/8340008#L3918
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250702/testruns/1508774/
* Test plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2zJjZIDW19DCm0eKABryy1jSCKy
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2zJjWqcwkW83XEGlOylHYZ8h98F/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2zJjWqcwkW83XEGlOylHYZ8h98F/config

--
Linaro LKFT
https://lkft.linaro.org
