Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B91D435297
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 20:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC346E9FA;
	Wed, 20 Oct 2021 18:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88ACD6E9FA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:24:31 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i20so28608573edj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 11:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=7wgOrtW4kNMgDGFBayDR7NepP+nkjDyN/nZep5skNo4=;
 b=Y1JIeYON777wT0WBG7EWb1ZxJP6Nt5ZmXlRkfiHUgWgW0B2VSDPNgfkVcHFIhd49+e
 wobk/cEW+ITkKFzZ5vOMSfu/sYOn341+9gqRf2b+HhFT00vBIZO0MoLt1cHStkygC5Ak
 yyPmkzsnrgdCWinXUyIXdnKOVFyMif6IRXUIcwqHNDfo1MmzwdKtQGz4n+2bs6LITZQl
 rz2MoFoqF6rFaZHgubHy0+OXLAjL3ERBw6YGkT+WNjCy4zzGeTR5AQEp1/gS+ZX4aDtp
 KqPVzjaipUYBthoEc4PuNGs1gQbMhhk3+7V3Zyr3d8+JUOi/wOBuhSI/UKwf+/6WDJbk
 gDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=7wgOrtW4kNMgDGFBayDR7NepP+nkjDyN/nZep5skNo4=;
 b=Zd/nGjTDBzqIUNryxuXx47DP9RuVRNb1b53gXmb4OxfDe8Pcr0qmTnX3fU4bwE8wtV
 m3DisJcTJB0OhByf9+vbqhFcd9w2mH7FIEruPY5vTcX7w5dpTecs3+wlCxuW3EWsLKeE
 QZTaYTl7A9fC/1dJb7SykDhCs86+tNj6Tv2s5J5S6/U7sflMhZBnE2IyZlzBmfzqxjBC
 mt0r7YryeO0wma6R7vjUwAJTmZr4pXyTPcvQyEH6Z/5xX2+4YHnCtK0vAaWfcB0mI0pv
 w8sYACefaJBe66SHnnKD4pgdQtGHxdDW2yo3nS3ziiv97R2nP8gqQUtdlFBChSkG8WmG
 DbfA==
X-Gm-Message-State: AOAM5326E9RHO2GHwNpM3smur0kwV5OCdTvlzP9er2xRQjrTR4H5Cvs/
 BX+oaBbD6zOauPR4MMWR21LSS2OmtpwMhSAH6Dn3DA==
X-Google-Smtp-Source: ABdhPJzERw9O+P2DfPqtK7BVQLjR7ZoMOPp/OnTZixSdN0JoFdPPAnVgHST4OnNfdsRK3rrXAMGS/mC9zwO5Bb25STY=
X-Received: by 2002:a05:6402:90c:: with SMTP id
 g12mr798259edz.198.1634754268561; 
 Wed, 20 Oct 2021 11:24:28 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 20 Oct 2021 23:54:16 +0530
Message-ID: <CA+G9fYv3jAjBKHM-CjrMzNgrptx-rpYVmGaD39OBiBeuz7osfg@mail.gmail.com>
Subject: [next] [dragonboard 410c] Unable to handle kernel paging request at
 virtual address 00000000007c4240
To: open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, dri-devel@lists.freedesktop.org
Cc: Vlastimil Babka <vbabka@suse.cz>, Marco Elver <elver@google.com>, 
 Vijayanand Jitta <vjitta@codeaurora.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Oliver Glitta <glittao@gmail.com>, 
 Imran Khan <imran.f.khan@oracle.com>, lkft-triage@lists.linaro.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
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

Following kernel crash noticed on linux next 20211020 tag.
while booting on arm64 architecture dragonboard 410c device.

I see the following config is enabled in 20211020 tag builds.
CONFIG_STACKDEPOT=y

Crash log,
[   18.583097] Unable to handle kernel paging request at virtual
address 00000000007c4240
[   18.583521] Mem abort info:
[   18.590286]   ESR = 0x96000004
[   18.592920]   EC = 0x25: DABT (current EL), IL = 32 bits
[   18.596103]   SET = 0, FnV = 0
[   18.601512]   EA = 0, S1PTW = 0
[   18.604384]   FSC = 0x04: level 0 translation fault
[   18.607447] Data abort info:
[   18.612296]   ISV = 0, ISS = 0x00000004
[   18.615451]   CM = 0, WnR = 0
[   18.618990] user pgtable: 4k pages, 48-bit VAs, pgdp=000000008b4c7000
[   18.622054] [00000000007c4240] pgd=0000000000000000, p4d=0000000000000000
[   18.628974] Internal error: Oops: 96000004 [#1] SMP
[   18.635073] Modules linked in: adv7511 cec snd_soc_lpass_apq8016
snd_soc_lpass_cpu snd_soc_lpass_platform snd_soc_msm8916_digital
qcom_camss qrtr snd_soc_apq8016_sbc videobuf2_dma_sg qcom_pon
qcom_spmi_vadc snd_soc_qcom_common qcom_q6v5_mss qcom_vadc_common
rtc_pm8xxx qcom_spmi_temp_alarm msm qcom_pil_info v4l2_fwnode
qcom_q6v5 snd_soc_msm8916_analog qcom_sysmon qcom_common v4l2_async
qnoc_msm8916 qcom_rng gpu_sched qcom_glink_smem venus_core
videobuf2_memops icc_smd_rpm qmi_helpers drm_kms_helper v4l2_mem2mem
mdt_loader display_connector i2c_qcom_cci videobuf2_v4l2 crct10dif_ce
videobuf2_common socinfo drm rmtfs_mem fuse
[   18.672948] CPU: 0 PID: 178 Comm: kworker/u8:3 Not tainted
5.15.0-rc6-next-20211020 #1
[   18.695000] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   18.695012] Workqueue: events_unbound deferred_probe_work_func
[   18.695033] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   18.715282] pc : __stack_depot_save+0x13c/0x4e0
[   18.722130] lr : stack_depot_save+0x14/0x20
[   18.726641] sp : ffff800014a23500
[   18.730801] x29: ffff800014a23500 x28: 00000000000f8848 x27: ffff800013acdf68
[   18.734294] x26: 0000000000000000 x25: 00000000007c4240 x24: ffff800014a23780
[   18.741413] x23: 0000000000000008 x22: ffff800014a235b8 x21: 0000000000000008
[   18.748530] x20: 00000000c32f8848 x19: ffff00001038cc18 x18: ffffffffffffffff
[   18.755649] x17: ffff80002d9f8000 x16: ffff800010004000 x15: 000000000000c426
[   18.762767] x14: 0000000000000000 x13: ffff800014a23780 x12: 0000000000000000
[   18.769885] x11: ffff00001038cc80 x10: ffff8000136e9ba0 x9 : ffff800014a235f4
[   18.777003] x8 : 0000000000000001 x7 : 00000000b664620b x6 : 0000000011a58b4a
[   18.784121] x5 : 000000001aa43464 x4 : 000000009e7d8b67 x3 : 0000000000000001
[   18.791239] x2 : 0000000000002800 x1 : ffff800013acd000 x0 : 00000000f2d429d8
[   18.798358] Call trace:
[   18.805451]  __stack_depot_save+0x13c/0x4e0
[   18.807716]  stack_depot_save+0x14/0x20
[   18.811881]  __drm_stack_depot_save+0x44/0x70 [drm]
[   18.815710]  modeset_lock.part.0+0xe0/0x1a4 [drm]
[   18.820571]  drm_modeset_lock_all_ctx+0x2d4/0x334 [drm]
[   18.825435]  drm_client_firmware_config.constprop.0.isra.0+0xc0/0x5d0 [drm]
[   18.830478]  drm_client_modeset_probe+0x328/0xbb0 [drm]
[   18.837413]  __drm_fb_helper_initial_config_and_unlock+0x54/0x5b4
[drm_kms_helper]
[   18.842633]  drm_fb_helper_initial_config+0x5c/0x70 [drm_kms_helper]
[   18.850266]  msm_fbdev_init+0x98/0x100 [msm]
[   18.856767]  msm_drm_bind+0x650/0x720 [msm]
[   18.861021]  try_to_bring_up_master+0x230/0x320
[   18.864926]  __component_add+0xc8/0x1c4
[   18.869435]  component_add+0x20/0x30
[   18.873253]  mdp5_dev_probe+0xe0/0x11c [msm]
[   18.877077]  platform_probe+0x74/0xf0
[   18.881328]  really_probe+0xc4/0x470
[   18.884883]  __driver_probe_device+0x11c/0x190
[   18.888534]  driver_probe_device+0x48/0x110
[   18.892786]  __device_attach_driver+0xa4/0x140
[   18.896869]  bus_for_each_drv+0x84/0xe0
[   18.901380]  __device_attach+0xe4/0x1c0
[   18.905112]  device_initial_probe+0x20/0x30
[   18.908932]  bus_probe_device+0xac/0xb4
[   18.913098]  deferred_probe_work_func+0xc8/0x120
[   18.916920]  process_one_work+0x280/0x6a0
[   18.921780]  worker_thread+0x80/0x454
[   18.925683]  kthread+0x178/0x184
[   18.929326]  ret_from_fork+0x10/0x20
[   18.932634] Code: d37d4e99 92404e9c f940077a 8b190359 (c8dfff33)
[   18.936203] ---[ end trace 3e289b724840642d ]---

Full log,
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20211020/testrun/6177937/suite/linux-log-parser/test/check-kernel-oops-3786583/log
https://lkft.validation.linaro.org/scheduler/job/3786583#L2549

Build config:
https://builds.tuxbuild.com/1zlLlQrUyHVr1MQ1gcler3dKaE6/config

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

steps to reproduce:
1) https://builds.tuxbuild.com/1zlLlQrUyHVr1MQ1gcler3dKaE6/tuxmake_reproducer.sh
2) Boot db410c device

--
Linaro LKFT
https://lkft.linaro.org
