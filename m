Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04745BE2E1C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 12:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368E310E9BE;
	Thu, 16 Oct 2025 10:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XNqgGv1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D1910E9BA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:44:48 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b55517e74e3so634470a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 03:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760611487; x=1761216287; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=idI0QB240u0sJsMGBvFXgYaH1URVwhRv/+IzbU7+Rbw=;
 b=XNqgGv1lY9AkJB4vGD9wPHnwY/uTzsNSCsJUe4A2zZ2J0pEHkdiIZETMJPEXzOypGC
 T3EcwXcHXRXWOIJ0uKAi6AGKapoF7mW3r/nAKegI+uy4v9c4HyNOnlt+poZfhb5aOGCQ
 c6L25a3wjdNWjARTRIAEw43pKiLfAniUrDzvtMRIo4Vr5bZUJn1YGXqUue9aA6XeJ5qw
 k6z8jqYN8+JxZufjFKsnPtld9nsTrWaJXj4CLHcSAiZhA1Mck9Y7gITXSb70JSlrh4vH
 rlsUBulqSk5rOUFHauRNAuNMzhOq5ZOkIroCDF+f+CblWfk2rcMrdTM07uP5uneh/pC+
 Gh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760611487; x=1761216287;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=idI0QB240u0sJsMGBvFXgYaH1URVwhRv/+IzbU7+Rbw=;
 b=UXQZYmdtAZhoGDOfGFjPwILpKFJAeax4bhfB/tYxjvsNQiNYAvy9HY9j3vrPLc8AYE
 F3Rsnfja1IHQzW0UEu8L/B5yVZ27uiFTs2SnjYCna3HFha2gVxfnh+r69yfBSITLLmWB
 HpVK5QrQP/9NEf2wMmsWUKpy3teQf3Jh0di8GJyg2gbBhqWfI9cHuNrW7r90s7qwoDbN
 x6iz2/B1mD+WlKVBjRByvx7ITTizzv6m42DmUGMdnqTGuxt3GizWf3RcBGpw4wSPHRep
 Q1/bWlLk0L7vD2bpqJHYLc6mLKUtzkISUsCvCyCwM+bhwYai2duJ86nhmxx7yDn9R6Mk
 tt0A==
X-Gm-Message-State: AOJu0Yz9/JIE44orYEmsbWz9pypXW/231SUPVOpiSFJ/2BHPOCpqpmsQ
 gim2V2MtKjtFRpfXodWcQrphd6Ve75/MtsQE4T+Ga2emM8hGLD/kzM+qBLn2AuVbscGJhgkiUGv
 LErnKmbAEB8txKtCgcfAR0ugJEse10csLkKbCIMz4JPWZ54SzpTZJWWw=
X-Gm-Gg: ASbGncvIqixXyv7GrAfv1osgtSzdG3CDysoIoPrlvwMn44LO1Gtn8gW/Uch4puPorx5
 egfFocL90LPkJZti8SAxVwMAO4vnCdjmAjRrj8pBnPOAvbG3oyqYpuplUnEoWu6GXd/CwLfl5Ej
 k5u/bzGFJMKcyLxjrehLHaNxwDcIXb4/a6MvZwAkUW+6Gpys++dB1xMwBF0OQz60cubXmuDN5hM
 zi0dXKjf0VqJAJ1d5iKXcpmy0NKo0HlVXjwDTMMdRZ+MwcSxu1ooM88ivKKsRg8kpCbX8eLvZjA
 EMkYnRjlNs/Lqmsm7YbGs2gU4D/IXzv3MM/TOr7bWybXajBU/mZDoAsdk/VK2JYo
X-Google-Smtp-Source: AGHT+IEPY/5S2tkggfuLp3oD5F9OLEskbq6IsVnBNsvCjw8LxAoTpzJ6R5WvQHLqebqcj6ozMCADrO0NyMZ2ygz54Us=
X-Received: by 2002:a17:902:ec83:b0:267:d2f9:2327 with SMTP id
 d9443c01a7336-2902739b36dmr460860835ad.27.1760611487240; Thu, 16 Oct 2025
 03:44:47 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 16 Oct 2025 16:14:36 +0530
X-Gm-Features: AS18NWCOCPygc6MstdsohR6QGJ32VyACC4u8LK8GX7Ej2KusoZDYlUabwuiSksU
Message-ID: <CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com>
Subject: next-20251014: Internal error: Oops:
 drm_bridge_connector_hdmi_cec_init drmm_connector_hdmi_cec_register
To: dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, 
 lkft-triage@lists.linaro.org,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>, 
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

While booting and loading kernel modules on dragonboard 410c board
with Linux next
kernel next-20251014 and next-20251015 the following crash noticed,

First seen on next-20251014
Good: next-20251013
Bad:  next-20251014

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Boot regressions: next-20251014: Internal error: Oops:
drm_bridge_connector_hdmi_cec_init drmm_connector_hdmi_cec_register

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

The kernel modules are not built with debug_info and could not find
the line number.
### Boot
[    9.830602] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000098
[    9.841379] coresight-cpu-debug 856000.debug: Coresight debug-CPU3
initialized
[    9.843514] Mem abort info:
[    9.843523]   ESR = 0x0000000096000004
[    9.843528]   EC = 0x25: DABT (current EL), IL = 32 bits
[    9.843535]   SET = 0, FnV = 0
[    9.843539]   EA = 0, S1PTW = 0
[    9.843543]   FSC = 0x04: level 0 translation fault
[    9.843547] Data abort info:
[    9.843550]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    9.843554]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    9.903238] usb 1-1.2: new high-speed USB device number 3 using ci_hdrc
[    9.908692]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    9.908700] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000834a2000
[    9.908708] [0000000000000098] pgd=0000000000000000, p4d=0000000000000000
[    9.951360] Internal error: Oops: 0000000096000004 [#1]  SMP
[    9.958091] Modules linked in: coresight_cpu_debug qcom_wcnss_pil
coresight_stm coresight_tmc stm_core coresight_tpiu coresight_cti
coresight_replicator coresight_funnel snd_soc_lpass_apq8016 coresight
snd_soc_lpass_cpu msm adv7511 snd_soc_lpass_platform
snd_soc_msm8916_digital snd_soc_msm8916_analog snd_soc_apq8016_sbc
snd_soc_qcom_common qcom_camss snd_soc_core snd_pcm_dmaengine
llcc_qcom snd_compress venus_core qrtr snd_pcm videobuf2_dma_sg
ubwc_config qcom_spmi_temp_alarm qcom_pon v4l2_fwnode rtc_pm8xxx
qcom_q6v5_mss ocmem snd_timer qcom_spmi_vadc drm_gpuvm v4l2_mem2mem
v4l2_async qcom_pil_info snd qcom_vadc_common drm_exec qcom_q6v5
videobuf2_v4l2 gpu_sched qcom_sysmon soundcore drm_dp_aux_bus
qcom_common videodev qcom_glink_smem drm_display_helper mdt_loader
videobuf2_memops qmi_helpers qnoc_msm8916 qcom_stats qcom_rng cec
videobuf2_common mc drm_client_lib socinfo phy_qcom_usb_hs rpmsg_ctrl
rpmsg_char display_connector ramoops rmtfs_mem drm_kms_helper
reed_solomon fuse drm backlight ipv6
[   10.029607] CPU: 1 UID: 0 PID: 87 Comm: kworker/u16:3 Not tainted
6.18.0-rc1-next-20251015 #1 PREEMPT
[   10.051760] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[   10.060957] Workqueue: events_unbound deferred_probe_work_func
[   10.067812] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   10.073455] pc : drm_bridge_connector_hdmi_cec_init+0xc/0x3c
drm_display_helper
[   10.080320] lr : drmm_connector_hdmi_cec_register+0x104/0x1b0
drm_display_helper
[   10.087958] sp : ffff800082fe3640
[   10.091389] ci_hdrc ci_hdrc.0: remove, state 1
[   10.095399] x29: ffff800082fe3690 x28: 0000000000000001 x27: ffff00000aa97610
[   10.095414] x26: ffff00000aa97610 x25: 0000000000000008 x24: ffff80007ab7a0a8
[   10.095427] x23: 0000000000000003 x22: ffff0000049dd420
[   10.098816] usb usb1: USB disconnect, device number 1
[   10.103130]  x21: ffff000004245e10
[   10.103138] x20: ffff00000aa59000 x19: ffff00000aa4c080 x18: 00000002425c8888
[   10.103150] x17: 0000000000000400 x16: 00000002425c8888 x15: 0000000000000553
[   10.110393] usb 1-1: USB disconnect, device number 2
[   10.117450]
[   10.117454] x14: 00000000023660af x13: 0000000000000000 x12: 0000000000000000
[   10.117466] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[   10.117478] x8 : ffff80007ab4f3a0 x7 : 000000001e237337
[   10.126995] usb 1-1.2: USB disconnect, device number 3
[   10.127691]  x6 : 000000001e237337
[   10.176293] x5 : ffff8000826c5974 x4 : ffff00003fc734f0 x3 : 0000000000154401
[   10.179619] x2 : 0000000000000003 x1 : ffff00000aa4c080 x0 : 0000000000000000
[   10.186823] Call trace:
[   10.193932] drm_bridge_connector_hdmi_cec_init+0xc/0x3c
drm_display_helper (P)
[   10.196204] drm_bridge_connector_init+0x580/0x64c drm_display_helper
[   10.203839] msm_dsi_manager_connector_init+0xa0/0xd0 msm
[   10.210260] msm_dsi_modeset_init+0x70/0xb4 msm
[   10.215814] mdp5_kms_init+0xbec/0xe24 msm
[   10.220674] msm_drm_kms_init+0x80/0x220 msm
[   10.225018] msm_drm_init+0x1a8/0x1e0 msm
[   10.229268] msm_drm_bind+0x34/0x40 msm
[   10.233348]  try_to_bring_up_aggregate_device
(/builds/linux/drivers/base/component.c:249)
[   10.237516]  __component_add (/builds/linux/drivers/base/component.c:270)
[   10.242894]  component_add (/builds/linux/drivers/base/component.c:807)
[   10.246538] dsi_dev_attach+0x1c/0x28 msm
[   10.250363] dsi_host_attach+0x64/0x98 msm
[   10.254270]  devm_mipi_dsi_attach
(/builds/linux/drivers/gpu/drm/drm_mipi_dsi.c:384)
[   10.258779] adv7533_attach_dsi+0xac/0xf4 adv7511
[   10.262708] adv7511_probe+0x700/0x75c adv7511
[   10.262733]  i2c_device_probe (/builds/linux/drivers/i2c/i2c-core-base.c:604)
[   10.262749]  really_probe (/builds/linux/drivers/base/dd.c:583)
[   10.276313]  __driver_probe_device (/builds/linux/drivers/base/dd.c:?)
[   10.279962]  driver_probe_device (/builds/linux/drivers/base/dd.c:831)
[   10.284300]  __device_attach_driver (/builds/linux/drivers/base/dd.c:960)
[   10.288207]  bus_for_each_drv (/builds/linux/drivers/base/bus.c:462)
[   10.292719]  __device_attach (/builds/linux/drivers/base/dd.c:?)
[   10.296887]  device_initial_probe (/builds/linux/drivers/base/dd.c:1081)
[   10.300445]  bus_probe_device (/builds/linux/drivers/base/bus.c:539)
[   10.304613]  deferred_probe_work_func (/builds/linux/drivers/base/dd.c:125)
[   10.308780]  process_scheduled_works (/builds/linux/kernel/workqueue.c:3274)
[   10.313035]  worker_thread (/builds/linux/include/linux/list.h:381
/builds/linux/kernel/workqueue.c:952
/builds/linux/kernel/workqueue.c:3428)
[   10.317893]  kthread (/builds/linux/kernel/kthread.c:465)
[   10.321451]  ret_from_fork (/builds/linux/arch/arm64/kernel/entry.S:861)
[   10.324845] Code: d65f03c0 d503245f aa0003e1 f9449400 (f9404c08)
All code
========
   0: d65f03c0 ret
   4: d503245f bti c
   8: aa0003e1 mov x1, x0
   c: f9449400 ldr x0, [x0, #2344]
  10:* f9404c08 ldr x8, [x0, #152] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f9404c08 ldr x8, [x0, #152]
[   10.328407] ---[ end trace 0000000000000000 ]---


## Source
* Kernel version: 6.18.0-rc1-next-20251015
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
* Architectures: arm64 db410c
* Toolchains: gcc-13 and clang-21
* Kconfigs: defconfig+lkftconfig

## Build
* Test log: https://lkft.validation.linaro.org/scheduler/job/8493594#L2966
* Test details:
https://regressions.linaro.org/lkft/linux-next-master/next-20251015/log-parser-test/oops-Oops_SMP-ad06dc06/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/346UvyvsORKa7GkJXNgOdZm4Jc9
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/346UvE5jXrKAGFTkdkd35Z9HsUM/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/346UvE5jXrKAGFTkdkd35Z9HsUM/config

--
Linaro LKFT
