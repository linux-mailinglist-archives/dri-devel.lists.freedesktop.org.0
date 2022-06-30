Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 911F5562002
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 18:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A627110F319;
	Thu, 30 Jun 2022 16:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0CC10F319
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 16:11:36 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 p6-20020a4aa846000000b0042599456d32so2951203oom.9
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ebuDjjYvCn67A/ZUjfTPJiUITfX+4rysbbkqGg2nGLI=;
 b=HhBKTpe4Tlkzwktgdf4itiANzlx6CO61F3GvAzY16HOAazW63Cl4oZQ2z3EXEve9y4
 QNiwVmO1PCOjlQgIbrlHg7H8dfNwDGZno+l0aDrkrAe3sOOqWo4ag3La9SipsaPJdBZJ
 dJoUnRvirWU73foatn0TYKtNXR2QX5lPYTR9BQhimyaXWq/EgeBaYfMK6NZjQE32PGWu
 wGEtA0ZBov+1JYJ9NyJRqPl07NDsuqIGbD2qq7/sHSw3y+MjDLnMpv7kDaZ4uOkB5N7Y
 dbXTyekAfvky+jsrGtN1TcySGS3Md1Yml127R5HHN/fnxArYBxSuz2rc9AnS0acxiB5z
 gXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ebuDjjYvCn67A/ZUjfTPJiUITfX+4rysbbkqGg2nGLI=;
 b=i/tvAoDod/Mkl64hgFqoXdVfbogEgRunvkghFW4cYF3CZJZ6aMD4xyLlc/W+w9scVj
 NUzk/VF4RzFUd7HB250VlyD71kSxEzLG69GLAx3WpQrdaeO/MmX72JmEZVjfiRBgU6Sb
 ydLsOnfRbYYiZIb9HgtSTajAvyr40fS6X5YFVRIb+a/eD7uZPtZFdSriLnrNN9GGdCd3
 G0f41AJJkcZku3NFtTJDbNfLVSWk9/wBZ8thxgn8ppTi2uxoIZdU4LfjXDfgEpc8ljQr
 EA5J66DSlVtad/dTOOpbnBey3yholUnrvrsIsszJri9P5GM3LObLedaGX8fuOOu141hT
 SIQA==
X-Gm-Message-State: AJIora9IOhUkas35B8l+lhT4+VQicSpgdixL7MuyAPmM1BjkAIQALFkk
 ZjuxgVYJ3UdSpFHItSaaubrCwBd19gG2zzeBvxGPa+Rr9kLeCg==
X-Google-Smtp-Source: AGRyM1tGNSbCPdbHfcJ/1d923LhfQ9joj5XYIiO1XhAY1NdZMGqSmyqXD2GhXRgjBoJuQ9e78/EFELJrN8T80akVx6A=
X-Received: by 2002:a4a:e616:0:b0:425:9f4c:36b2 with SMTP id
 f22-20020a4ae616000000b004259f4c36b2mr4134090oot.77.1656605494837; Thu, 30
 Jun 2022 09:11:34 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 30 Jun 2022 21:41:23 +0530
Message-ID: <CA+G9fYve16J7=4f+WAVrTUspxkKA+3BonHzGyk8VP=U+D9irOQ@mail.gmail.com>
Subject: [next] Rpi4 : WARNING: at drivers/gpu/drm/vc4/vc4_hdmi_regs.h:487
 vc5_hdmi_reset+0x1f0/0x240 [vc4]
To: open list <linux-kernel@vger.kernel.org>,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Emma Anholt <emma@anholt.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following kernel warning found on Rpi4 while booting linux next-20220630.
Boot log details [1] & [2].

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd083]
[    0.000000] Linux version 5.19.0-rc4-next-20220630
(tuxmake@tuxmake) (aarch64-linux-gnu-gcc (Debian 11.3.0-3) 11.3.0, GNU
ld (GNU Binutils for Debian) 2.38) #1 SMP PREEMPT @1656576657
[    0.000000] Machine model: Raspberry Pi 4 Model B
<trim>
[   21.702341] vc4-drm gpu: [drm] Couldn't stop firmware display driver: -22
[   21.711580] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
[   21.719271] ------------[ cut here ]------------
[   21.723971] WARNING: CPU: 0 PID: 246 at
drivers/gpu/drm/vc4/vc4_hdmi_regs.h:487 vc5_hdmi_reset+0x1f0/0x240
[vc4]
[   21.734403] Modules linked in: cfg80211(+) raspberrypi_hwmon
clk_raspberrypi bluetooth reset_raspberrypi crct10dif_ce vc4(+) cec
drm_display_helper rfkill iproc_rng200 drm_cma_helper drm_kms_helper
pwm_bcm2835 i2c_bcm2835 rng_core v3d bcm2711_thermal drm_shmem_helper
gpu_sched pcie_brcmstb drm fuse
[   21.761318] CPU: 0 PID: 246 Comm: systemd-udevd Not tainted
5.19.0-rc4-next-20220630 #1
[   21.769445] Hardware name: Raspberry Pi 4 Model B (DT)
[   21.774656] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   21.781725] pc : vc5_hdmi_reset+0x1f0/0x240 [vc4]
[   21.786587] lr : vc5_hdmi_reset+0x38/0x240 [vc4]
[   21.791356] sp : ffff80000b533630
[   21.794715] x29: ffff80000b533630 x28: 0000000000000000 x27: ffff0000411d4080
[   21.801967] x26: 0000000000000000 x25: ffff800009cdd980 x24: ffff80000ae15410
[   21.809218] x23: ffff000040fce000 x22: ffff0000fb83a978 x21: 0000000000000000
[   21.816467] x20: ffff0000411d4cf0 x19: ffff0000411d4080 x18: 0000000000000000
[   21.823716] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   21.830963] x14: 0000000000000000 x13: 0000000000000030 x12: 0101010101010101
[   21.838211] x11: 7f7f7f7f7f7f7f7f x10: ffff84000386a50f x9 : ffff8000093b1660
[   21.845460] x8 : 0101010101010101 x7 : 0000000000000000 x6 : 0000000000000001
[   21.852709] x5 : ffff80000a9bf2e0 x4 : ffff80000a9bf000 x3 : 0000000000000000
[   21.859958] x2 : 0000000000000001 x1 : 0000000000000002 x0 : ffff800001587ae8
[   21.867207] Call trace:
[   21.869684]  vc5_hdmi_reset+0x1f0/0x240 [vc4]
[   21.874188]  vc4_hdmi_runtime_resume+0x74/0xb0 [vc4]
[   21.879308]  vc4_hdmi_bind+0x22c/0x880 [vc4]
[   21.880064] cfg80211: Loading compiled-in X.509 certificates for
regulatory database
[   21.883719]  component_bind_all+0x130/0x290
[   21.883747]  vc4_drm_bind+0x19c/0x2a4 [vc4]
[   21.900105]  try_to_bring_up_aggregate_device+0x1f8/0x300
[   21.905597]  component_master_add_with_match+0xbc/0x104
[   21.910910]  vc4_platform_drm_probe+0xcc/0x10c [vc4]
[   21.916028]  platform_probe+0x74/0xf0
[   21.919750]  really_probe+0xc8/0x3e0
[   21.923385]  __driver_probe_device+0x84/0x190
[   21.927811]  driver_probe_device+0x44/0x100
[   21.932062]  __driver_attach+0xd8/0x210
[   21.935959]  bus_for_each_dev+0x7c/0xe0
[   21.939857]  driver_attach+0x30/0x3c
[   21.943489]  bus_add_driver+0x188/0x244
[   21.947384]  driver_register+0x84/0x140
[   21.951282]  __platform_driver_register+0x34/0x40
[   21.956055]  vc4_drm_register+0x5c/0x1000 [vc4]
[   21.960730]  do_one_initcall+0x50/0x2b0
[   21.964628]  do_init_module+0x50/0x200
[   21.968440]  load_module+0x1a8c/0x1f40
[   21.972243]  __do_sys_finit_module+0xac/0x12c
[   21.976663]  __arm64_sys_finit_module+0x2c/0x40
[   21.981259]  invoke_syscall+0x50/0x120
[   21.985069]  el0_svc_common.constprop.0+0x104/0x124
[   21.990024]  do_el0_svc+0x3c/0xd0
[   21.993392]  el0_svc+0x38/0xc0
[   21.996494]  el0t_64_sync_handler+0xbc/0x140
[   22.000828]  el0t_64_sync+0x18c/0x190
[   22.004544] ---[ end trace 0000000000000000 ]---
[   22.009327] ------------[ cut here ]------------
[   22.014009] WARNING: CPU: 0 PID: 246 at
drivers/gpu/drm/vc4/vc4_hdmi_regs.h:457 vc4_hdmi_read+0xec/0x134 [vc4]
[   22.024243] Modules linked in: cfg80211(+) raspberrypi_hwmon
clk_raspberrypi bluetooth reset_raspberrypi crct10dif_ce vc4(+) cec
drm_display_helper rfkill iproc_rng200 drm_cma_helper drm_kms_helper
pwm_bcm2835 i2c_bcm2835 rng_core v3d bcm2711_thermal drm_shmem_helper
gpu_sched pcie_brcmstb drm fuse
[   22.051149] CPU: 0 PID: 246 Comm: systemd-udevd Tainted: G        W
        5.19.0-rc4-next-20220630 #1
[   22.060684] Hardware name: Raspberry Pi 4 Model B (DT)
[   22.065894] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   22.072959] pc : vc4_hdmi_read+0xec/0x134 [vc4]
[   22.077631] lr : vc5_hdmi_reset+0xac/0x240 [vc4]

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 6cc11d2a1759275b856e464265823d94aabd5eaf
  git_describe: next-20220630
  kernel_version: 5.19.0-rc4
  kernel-config: https://builds.tuxbuild.com/2BHwwIpQQ4jA4OQSp6ecOQNPxTg/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next/-/pipelines/576712449
  artifact-location: https://builds.tuxbuild.com/2BHwwIpQQ4jA4OQSp6ecOQNPxTg
  toolchain: gcc-11

[1] https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220630/testrun/10438428/suite/log-parser-boot/tests/
[2] https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20220630/testrun/10438428/suite/log-parser-boot/test/check-kernel-exception-5227708/details/

--
Linaro LKFT
https://lkft.linaro.org
