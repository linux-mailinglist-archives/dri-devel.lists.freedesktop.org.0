Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 868E3565BF2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6759F10F94E;
	Mon,  4 Jul 2022 16:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD7A10E038
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 09:02:16 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id p69so8055517iod.10
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 02:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2SeN0JcfoNKpJw5VeU2/8FnTNMxuNVHExcgA8hg1isU=;
 b=sIEuSIM95KvwmUSKevTYQCZjTdM5hFf4VD/NyEsa3WEyh+PGNnWRmS3j15974/cGPE
 mtIwOD5W9uXEnaBYGFmTnWUlez/3qpNdwNeDiuqrp85FYN/cN/6xaoeo6UcZrM4/Vv2x
 ss2A2CWdZ3pyQzsPsy4XzbVIFaPWVnaJX0nDgBUNdId4hsN6HmJTWdVF10zbjrLM7zMc
 8Y+Rx6eI06YxQ9DkpFuzqgunSNeLc8IeUVcTaK3Xh+jkzP+mnofGkwFBYrokPfIt6IYt
 Xz64jpiTaZbZdWwNlc043l54D+bvasq31J7UhCQoMqYNUJZhD7mlD4LCd/iFl24BEdmI
 NFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2SeN0JcfoNKpJw5VeU2/8FnTNMxuNVHExcgA8hg1isU=;
 b=CUoEPItMtYk4c3mjsrU6CUHmpMqG40KrNMTL726TKKQdDePUjtSXg6PIBWkjoWH1gl
 zsFk4j1UMI790SPm3jOVIAQ6u7Cp6maRTcM+N93alAFX2CrsxhpUQ11HpxJmsqFz898Y
 5R5U1YXea68G8UNRRXgKOMYXanUMu6WlRUzFFnuWblrzKxGt7VYnb52rsyrfAS+A/Rbj
 emSaDbOhVXKqctkgnrw2ViZMfnox5yoSdeDxzkEMpdYqPbHAR9V4NNi1kS2ffHFj5okE
 7cyfcNu/KrKUFVlAxPTW50TtIRY6yWflgtUwNTZdiAUAwiKyFHFM0tgzyad880d0rj12
 QF7w==
X-Gm-Message-State: AJIora+osgV3NERxk56eyzW1ABjPvhPNoJsHxSJasvM+S78t80ijmViQ
 vvWQiP32MxcHme09s1DMe7WnqUNXV7Vksy09denzKg==
X-Google-Smtp-Source: AGRyM1t1HXGYjU0u4nuqTwEXetxUoitm3Vb5oSttKC1QYU/82ZX97AMiMNfykr18l+oR9/d7MJi+BRe1RTx2iDcYFOs=
X-Received: by 2002:a02:c503:0:b0:339:ec67:b0a4 with SMTP id
 s3-20020a02c503000000b00339ec67b0a4mr18011548jam.27.1656925334280; Mon, 04
 Jul 2022 02:02:14 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 4 Jul 2022 14:32:03 +0530
Message-ID: <CA+G9fYsjOUPw5OstKzoFvTEmUtXGk9+WLugTfmbeiMEg_vpL7A@mail.gmail.com>
Subject: v5.19-rc5: igt-test: Unable to handle kernel write to read-only
 memory at virtual address - drm_dev_unregister
To: open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
 regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
 linux-clk <linux-clk@vger.kernel.org>, igt-dev@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, Arkadiusz Hiler <arek@hiler.eu>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While running igt testing on arm64 Qcomm db410c the following kernel warning
and crash reported with Linux mainline kernel.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

metadata:
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline
  git_sha: 88084a3df1672e131ddc1b4e39eeacfd39864acf
  git_describe: v5.19-rc5
  kernel_version: 5.19.0-rc5
  kernel-config: https://builds.tuxbuild.com/2BSEyt8Sb19HSj6SnBFiMo6kiQh/config
  build-url: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline/-/pipelines/579007773
  artifact-location: https://builds.tuxbuild.com/2BSEyt8Sb19HSj6SnBFiMo6kiQh
  vmlinux.xz: https://builds.tuxbuild.com/2BSEyt8Sb19HSj6SnBFiMo6kiQh/vmlinux.xz
  System.map: https://builds.tuxbuild.com/2BSEyt8Sb19HSj6SnBFiMo6kiQh/System.map
  toolchain: gcc-11
  igt-gpu-tools__url: https://gitlab.freedesktop.org/drm/igt-gpu-tools


+ ./igt-test.sh -d /usr/share/igt-gpu-tools -t CHAMELIUM -c
10.66.16.71 -h HDMI-A-1
Going to run igt Chamelium test
Generate ~/.igtrc
Generate Chamelium test list
igt@kms_chamelium@hdmi-hpd
igt@kms_chamelium@hdmi-hpd-fast

<trim>

Subtest hdmi-hpd-storm-disable: SKIP (0.000s)
[181.885373] [08/88] kms_chamelium (hdmi-crc-single)
[  181.932031] Console: switching to colour dummy device 80x25
[  181.932276] [IGT] kms_chamelium: executing
[  182.178035] [IGT] kms_chamelium: starting subtest hdmi-crc-single
[  183.696310] [drm:mdp5_irq_error_handler [msm]] *ERROR* errors: 04000000
[  186.819771] msm_mdp 1a01000.mdp: vblank time out, crtc=0
[  197.407969] [IGT] kms_chamelium: exiting, ret=98
[  198.123226] Console: switching to colour frame buffer device 240x67
[  208.352251] msm_mdp 1a01000.mdp: [drm] *ERROR* flip_done timed out
[  208.352889] msm_mdp 1a01000.mdp: [drm] *ERROR* [CRTC:57:crtc-0]
commit wait timed out
[  218.592308] msm_mdp 1a01000.mdp: [drm] *ERROR* flip_done timed out
[  218.592951] msm_mdp 1a01000.mdp: [drm] *ERROR* [PLANE:33:plane-0]
commit wait timed out
[  218.598698] ------------[ cut here ]------------
[  218.605711] WARNING: CPU: 0 PID: 6 at
drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:807
mdp5_crtc_atomic_flush+0x1b8/0x1d0 [msm]
[  218.611025] Modules linked in: rfkill snd_soc_hdmi_codec venus_enc
venus_dec videobuf2_dma_contig adv7511 pm8916_wdt smsc75xx cec
qcom_wcnss_pil msm qrtr qcom_camss venus_core qcom_q6v5_mss
videobuf2_dma_sg gpu_sched qcom_pil_info v4l2_fwnode qcom_q6v5
snd_soc_lpass_apq8016 drm_dp_aux_bus qcom_sysmon v4l2_async
snd_soc_lpass_cpu v4l2_mem2mem drm_display_helper display_connector
qcom_common videobuf2_memops qcom_glink_smem snd_soc_msm8916_analog
snd_soc_msm8916_digital snd_soc_apq8016_sbc snd_soc_lpass_platform
videobuf2_v4l2 qmi_helpers snd_soc_qcom_common drm_kms_helper
qcom_spmi_vadc mdt_loader qcom_spmi_temp_alarm videobuf2_common
rtc_pm8xxx drm qcom_vadc_common i2c_qcom_cci qnoc_msm8916 qcom_stats
socinfo qcom_pon crct10dif_ce qcom_rng icc_smd_rpm rmtfs_mem fuse
[  218.671585] CPU: 0 PID: 6 Comm: kworker/0:0 Not tainted 5.19.0-rc5 #1
[  218.689678] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[  218.696036] Workqueue: events drm_mode_rmfb_work_fn [drm]
[  218.702723] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  218.708118] pc : mdp5_crtc_atomic_flush+0x1b8/0x1d0 [msm]
[  218.714784] lr : mdp5_crtc_atomic_flush+0x44/0x1d0 [msm]
[  218.720337] sp : ffff800008053b10
[  218.725571] x29: ffff800008053b10 x28: 0000000000000001 x27: ffff00000ca3c2c8
[  218.729045] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000020
[  218.736165] x23: 0000000000000070 x22: 0000000000000038 x21: ffff00000f374200
[  218.743281] x20: ffff00000ca3e000 x19: ffff00000ca3c000 x18: 0000000000000001
[  218.750398] x17: 0000000000000004 x16: 0000000000000000 x15: 0000000000000000
[  218.757516] x14: 0000000000000020 x13: 0000000000000000 x12: 0000000000000020
[  218.764635] x11: 00000000ffffffff x10: ffff000004f1e678 x9 : ffff800001566000
[  218.771753] x8 : ffff000003295140 x7 : 0000000000000000 x6 : 0000000000000000
[  218.778871] x5 : ffff00000ca3e000 x4 : 0000000000000000 x3 : 0000000000000000
[  218.785987] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000023d0980
[  218.793108] Call trace:
[  218.799906]  mdp5_crtc_atomic_flush+0x1b8/0x1d0 [msm]
[  218.802347]  drm_atomic_helper_commit_planes+0x160/0x210 [drm_kms_helper]
[  218.807678]  msm_atomic_commit_tail+0x1b0/0x8d0 [msm]
[  218.814327]  commit_tail+0xac/0x184 [drm_kms_helper]
[  218.819355]  drm_atomic_helper_commit+0x150/0x37c [drm_kms_helper]
[  218.824471]  drm_atomic_commit+0xb0/0xf0 [drm]
[  218.830345]  drm_framebuffer_remove+0x444/0x4e4 [drm]
[  218.834813]  drm_mode_rmfb_work_fn+0x84/0xac [drm]
[  218.839919]  process_one_work+0x1dc/0x450
[  218.844544]  worker_thread+0x2d0/0x450
[  218.848605]  kthread+0x100/0x110
[  218.852216]  ret_from_fork+0x10/0x20
[  218.855630] ---[ end trace 0000000000000000 ]---
[  218.920029] msm_mdp 1a01000.mdp: vblank time out, crtc=0
[  229.088439] msm_mdp 1a01000.mdp: [drm] *ERROR* flip_done timed out
[  229.094070] msm_mdp 1a01000.mdp: [drm] *ERROR* [CRTC:57:crtc-0]
commit wait timed out
[  239.328613] msm_mdp 1a01000.mdp: [drm] *ERROR* flip_done timed out
[  239.334313] msm_mdp 1a01000.mdp: [drm] *ERROR*
[CONNECTOR:32:HDMI-A-1] commit wait timed out
[  249.568128] msm_mdp 1a01000.mdp: [drm] *ERROR* flip_done timed out
[  249.574071] msm_mdp 1a01000.mdp: [drm] *ERROR* [PLANE:33:plane-0]
commit wait timed out
[  249.712800] l6: Underflow of regulator enable count
[  249.731423] Failed to disable vddio: -EINVAL
[  249.742843] msm_dsi_phy 1a98300.dsi-phy: Runtime PM usage count underflow!
[  249.788343] ------------[ cut here ]------------
[  249.799580] WARNING: CPU: 1 PID: 918 at
drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c:807
mdp5_crtc_atomic_flush+0x1b8/0x1d0 [msm]
[  249.811889] Modules linked in: rfkill snd_soc_hdmi_codec venus_enc
venus_dec videobuf2_dma_contig adv7511 pm8916_wdt smsc75xx cec
qcom_wcnss_pil msm qrtr qcom_camss venus_core qcom_q6v5_mss
videobuf2_dma_sg gpu_sched qcom_pil_info v4l2_fwnode qcom_q6v5
snd_soc_lpass_apq8016 drm_dp_aux_bus qcom_sysmon v4l2_async
snd_soc_lpass_cpu v4l2_mem2mem drm_display_helper display_connector
qcom_common videobuf2_memops qcom_glink_smem snd_soc_msm8916_analog
snd_soc_msm8916_digital snd_soc_apq8016_sbc snd_soc_lpass_platform
videobuf2_v4l2 qmi_helpers snd_soc_qcom_common drm_kms_helper
qcom_spmi_vadc mdt_loader qcom_spmi_temp_alarm videobuf2_common
rtc_pm8xxx drm qcom_vadc_common i2c_qcom_cci qnoc_msm8916 qcom_stats
socinfo qcom_pon crct10dif_ce qcom_rng icc_smd_rpm rmtfs_mem fuse
[  249.910734] CPU: 1 PID: 918 Comm: kms_chamelium Tainted: G        W
        5.19.0-rc5 #1
[  249.925068] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[  249.939565] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  249.954285] pc : mdp5_crtc_atomic_flush+0x1b8/0x1d0 [msm]
[  249.969740] lr : mdp5_crtc_atomic_flush+0x44/0x1d0 [msm]
[  249.985242] sp : ffff80000c413970
[  250.000193] x29: ffff80000c413970 x28: 0000000000000001 x27: ffff00000ca3c2c8
[  250.015308] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000020
[  250.030393] x23: 0000000000000070 x22: 0000000000000038 x21: ffff00000f374800
[  250.045369] x20: ffff00000ca3e000 x19: ffff00000ca3c000 x18: 0000000000000000
[  250.060301] x17: 000000040044ffff x16: 00400032b5503510 x15: 0000000000000000
[  250.075233] x14: ffff0000032b2080 x13: ffff800001773000 x12: 0000000030d4d91d
[  250.090193] x11: 000000000000000c x10: ffff80000aa62ac0 x9 : ffff800001566000
[  250.105153] x8 : ffff00000f0f6180 x7 : 0000000000000000 x6 : 0000000000000000
[  250.120023] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
[  250.134629] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000023d0900
[  250.148685] Call trace:
[  250.162090]  mdp5_crtc_atomic_flush+0x1b8/0x1d0 [msm]
[  250.175726]  drm_atomic_helper_commit_planes+0x160/0x210 [drm_kms_helper]
[  250.188575]  msm_atomic_commit_tail+0x1b0/0x8d0 [msm]
[  250.201697]  commit_tail+0xac/0x184 [drm_kms_helper]
[  250.214380]  drm_atomic_helper_commit+0x150/0x37c [drm_kms_helper]
[  250.227064]  drm_atomic_commit+0xb0/0xf0 [drm]
[  250.239967]  drm_client_modeset_commit_atomic+0x208/0x260 [drm]
[  250.252865]  drm_client_modeset_commit_locked+0x68/0x1a0 [drm]
[  250.265757]  drm_client_modeset_commit+0x3c/0x64 [drm]
[  250.278572]  drm_fb_helper_lastclose+0x78/0xd0 [drm_kms_helper]
[  250.291139]  drm_lastclose+0x44/0x90 [drm]
[  250.303977]  drm_release+0x100/0x120 [drm]
[  250.316785]  __fput+0x78/0x22c
[  250.329016]  ____fput+0x1c/0x30
[  250.341205]  task_work_run+0x8c/0x1ac
[  250.353465]  do_exit+0x2f8/0x984
[  250.365655]  do_group_exit+0x40/0xb0
[  250.377785]  __wake_up_parent+0x0/0x3c
[  250.389954]  invoke_syscall+0x50/0x120
[  250.402114]  el0_svc_common.constprop.0+0x104/0x124
[  250.414237]  do_el0_svc+0x3c/0xcc
[  250.426298]  el0_svc+0x38/0xc0
[  250.438237]  el0t_64_sync_handler+0xbc/0x140
[  250.450160]  el0t_64_sync+0x18c/0x190
[  250.462003] ---[ end trace 0000000000000000 ]---
Starting subtest: hdmi-crc-single
Subtest hdmi-crc-single: FAIL (15.228s)
[250.605238] [09/88] kms_chamelium (hdmi-crc-fast)
[  250.648392] Console: switching to colour dummy device 80x25
[  250.648623] [IGT] kms_chamelium: executing
[  250.854890] ------------[ cut here ]------------
[  250.854984] gcc_mdss_ahb_clk already disabled
[  250.858801] WARNING: CPU: 2 PID: 64 at drivers/clk/clk.c:964
clk_core_disable+0x24c/0x264
[  250.862889] Modules linked in: rfkill snd_soc_hdmi_codec venus_enc
venus_dec videobuf2_dma_contig adv7511 pm8916_wdt smsc75xx cec
qcom_wcnss_pil msm qrtr qcom_camss venus_core qcom_q6v5_mss
videobuf2_dma_sg gpu_sched qcom_pil_info v4l2_fwnode qcom_q6v5
snd_soc_lpass_apq8016 drm_dp_aux_bus qcom_sysmon v4l2_async
snd_soc_lpass_cpu v4l2_mem2mem drm_display_helper display_connector
qcom_common videobuf2_memops qcom_glink_smem snd_soc_msm8916_analog
snd_soc_msm8916_digital snd_soc_apq8016_sbc snd_soc_lpass_platform
videobuf2_v4l2 qmi_helpers snd_soc_qcom_common drm_kms_helper
qcom_spmi_vadc mdt_loader qcom_spmi_temp_alarm videobuf2_common
rtc_pm8xxx drm qcom_vadc_common i2c_qcom_cci qnoc_msm8916 qcom_stats
socinfo qcom_pon crct10dif_ce qcom_rng icc_smd_rpm rmtfs_mem fuse
[  250.880779] [IGT] kms_chamelium: starting subtest hdmi-crc-fast
[  250.916679] CPU: 2 PID: 64 Comm: kworker/2:2 Tainted: G        W
     5.19.0-rc5 #1
[  250.916724] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[  250.916748] Workqueue: pm pm_runtime_work
[  250.916802] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  250.916848] pc : clk_core_disable+0x24c/0x264
[  250.916900] lr : clk_core_disable+0x24c/0x264
[  250.974624] sp : ffff80000b24bbb0
[  250.978938] x29: ffff80000b24bbb0 x28: 0000000000000000 x27: 0000000000000000
[  250.982243] x26: 0000000000000000 x25: 0000000000000000 x24: ffff00000d8b5900
[  250.989360] x23: ffff80000abea618 x22: 0000000000000000 x21: ffff00000d8bbe80
[  250.996478] x20: ffff000003270700 x19: ffff000003270700 x18: ffffffffffffffff
[  251.003597] x17: 000000040044ffff x16: 00400032b5503510 x15: ffff80008b24b897
[  251.010716] x14: 0000000000000000 x13: 64656c6261736964 x12: 2079646165726c61
[  251.017833] x11: 206b6c635f626861 x10: ffff80000aa4a7a8 x9 : ffff8000081a1528
[  251.024951] x8 : 00000000ffffefff x7 : ffff80000aa4a7a8 x6 : 0000000000000000
[  251.032071] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 0000000000000027
[  251.039186] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000003b29040
[  251.046307] Call trace:
[  251.053413]  clk_core_disable+0x24c/0x264
[  251.055675]  clk_disable+0x3c/0x5c
[  251.059841]  clk_bulk_disable+0x44/0x60
[  251.063140]  mdss_runtime_suspend+0x48/0xa0 [msm]
[  251.066878]  pm_generic_runtime_suspend+0x38/0x50
[  251.071736]  genpd_runtime_suspend+0xc4/0x310
[  251.076421]  __rpm_callback+0x50/0x180
[  251.080760]  rpm_callback+0x74/0x80
[  251.084406]  rpm_suspend+0x110/0x640
[  251.087793]  pm_runtime_work+0xd0/0xd4
[  251.091611]  process_one_work+0x1dc/0x450
[  251.095170]  worker_thread+0x154/0x450
[  251.099251]  kthread+0x100/0x110
[  251.102896]  ret_from_fork+0x10/0x20
[  251.106281] ---[ end trace 0000000000000000 ]---
[  251.110531] ------------[ cut here ]------------
[  251.114483] gcc_mdss_ahb_clk already unprepared
[  251.119155] WARNING: CPU: 2 PID: 64 at drivers/clk/clk.c:822
clk_core_unprepare+0x210/0x230

<trim>

Starting subtest: hdmi-cmp-planes-random
Subtest hdmi-cmp-planes-random: FAIL (3.678s)
[343.808430] [15/88] kms_chamelium (hdmi-frame-dump)
[  343.847491] Console: switching to colour dummy device 80x25
[  343.847744] [IGT] kms_chamelium: executing
[  344.119508] [IGT] kms_chamelium: starting subtest hdmi-frame-dump
[  345.897236] [IGT] kms_chamelium: exiting, ret=98
[  346.012383] Unable to handle kernel write to read-only memory at
virtual address ffff80000175a5a8
[  346.012543] Mem abort info:
[  346.020830]   ESR = 0x000000009600004f
[  346.022947]   EC = 0x25: DABT (current EL), IL = 32 bits
[  346.026999]   SET = 0, FnV = 0
[  346.032300]   EA = 0, S1PTW = 0
[  346.035073]   FSC = 0x0f: level 3 permission fault
[  346.038225] Data abort info:
[  346.043079]   ISV = 0, ISS = 0x0000004f
[  346.046116]   CM = 0, WnR = 1
[  346.049677] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000081eff000
[  346.052834] [ffff80000175a5a8] pgd=10000000bfeff003,
p4d=10000000bfeff003, pud=10000000bfefe003, pmd=100000008c9fc003,
pte=006000008bb6ff83
[  346.059541] Internal error: Oops: 9600004f [#1] PREEMPT SMP
[  346.071693] Modules linked in: rfkill snd_soc_hdmi_codec venus_enc
venus_dec videobuf2_dma_contig adv7511 pm8916_wdt smsc75xx cec
qcom_wcnss_pil msm qrtr qcom_camss venus_core qcom_q6v5_mss
videobuf2_dma_sg gpu_sched qcom_pil_info v4l2_fwnode qcom_q6v5
snd_soc_lpass_apq8016 drm_dp_aux_bus qcom_sysmon v4l2_async
snd_soc_lpass_cpu v4l2_mem2mem drm_display_helper display_connector
qcom_common videobuf2_memops qcom_glink_smem snd_soc_msm8916_analog
snd_soc_msm8916_digital snd_soc_apq8016_sbc snd_soc_lpass_platform
videobuf2_v4l2 qmi_helpers snd_soc_qcom_common drm_kms_helper
qcom_spmi_vadc mdt_loader qcom_spmi_temp_alarm videobuf2_common
rtc_pm8xxx drm qcom_vadc_common i2c_qcom_cci qnoc_msm8916 qcom_stats
socinfo qcom_pon crct10dif_ce qcom_rng icc_smd_rpm rmtfs_mem fuse
[  346.123074] CPU: 1 PID: 962 Comm: kworker/1:0 Tainted: G        W
      5.19.0-rc5 #1
[  346.145304] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[  346.153030] Workqueue: events adv7511_hpd_work [adv7511]
[  346.159971] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  346.165267] pc : drm_dev_unregister+0x38/0xb4 [drm]
[  346.171950] lr : msm_drm_uninit.isra.0+0x190/0x1c0 [msm]
[  346.176811] sp : ffff80000bfbb840
[  346.182363] x29: ffff80000bfbb840 x28: ffff00000b803000 x27: ffff00000b803018

Broadcast message from systemd-journald@dragonboard-410c (Mon
2022-07-04 00:31:16 UTC):

kernel[351]: [  346.059541] Internal error: Oops: 9600004f [#1] PREEMPT SMP
[  346.185580] x26: ffff00000b803090 x25: ffff00000ba39100 x24: ffff00000ca3c000

[  346.216430] x11: 0000000000000040 x10: ffff80000aa62ac0 x9 : ffff80000171bbc0
[  346.216469] x8 : ffff00000a273258 x7 : 0000000000000000 x6 : 0000000000000001
[  346.222703] x5 : 0000000000000000 x4 : 0000000000000000 x3 : dead000000000100
[  346.229820] x2 : 00000000016e8530 x1 : 0000000001000130 x0 : ffff80000175a558
[  346.236940] Call trace:
[  346.244052]  drm_dev_unregister+0x38/0xb4 [drm]
[  346.246313]  msm_drm_uninit.isra.0+0x190/0x1c0 [msm]
[  346.250827]  msm_drm_unbind+0x1c/0x30 [msm]
[  346.256034]  component_del+0xb0/0x16c
[  346.259940]  dsi_dev_detach+0x2c/0x40 [msm]
[  346.263758]  dsi_host_detach+0x28/0x6c [msm]
[  346.267752]  mipi_dsi_detach+0x34/0x50
[  346.272264]  adv7533_mode_set+0x68/0x90 [adv7511]
[  346.275826]  adv7511_bridge_mode_set+0x218/0x220 [adv7511]
[  346.280600]  drm_bridge_chain_mode_set+0x64/0x90 [drm]
[  346.285983]  crtc_set_mode+0x190/0x1e0 [drm_kms_helper]
[  346.291104]  drm_atomic_helper_commit_modeset_disables+0x48/0x60
[drm_kms_helper]
[  346.296228]  msm_atomic_commit_tail+0x1a0/0x8d0 [msm]
[  346.303867]  commit_tail+0xac/0x184 [drm_kms_helper]
[  346.308900]  drm_atomic_helper_commit+0x150/0x37c [drm_kms_helper]
[  346.313935]  drm_atomic_commit+0xb0/0xf0 [drm]
[  346.319926]  drm_client_modeset_commit_atomic+0x208/0x260 [drm]
[  346.324352]  drm_client_modeset_commit_locked+0x68/0x1a0 [drm]
[  346.330168]  drm_client_modeset_commit+0x3c/0x64 [drm]
[  346.336069]  drm_fb_helper_set_par+0xd4/0x130 [drm_kms_helper]
[  346.341192]  drm_fb_helper_hotplug_event.part.0+0xb8/0xf0 [drm_kms_helper]
[  346.347008]  drm_fb_helper_output_poll_changed+0x44/0x50 [drm_kms_helper]
[  346.353866]  drm_kms_helper_hotplug_event+0x38/0x50 [drm_kms_helper]
[  346.360723]  drm_bridge_connector_hpd_cb+0xa4/0xbc [drm_kms_helper]
[  346.367147]  drm_bridge_hpd_notify+0x48/0x64 [drm]
[  346.373135]  adv7511_hpd_work+0x124/0x13c [adv7511]
[  346.377996]  process_one_work+0x1dc/0x450
[  346.382769]  worker_thread+0x154/0x450
[  346.386935]  kthread+0x100/0x110
[  346.390581]  ret_from_fork+0x10/0x20
[  346.393973] Code: b940b821 0a020021 36d00041 97fff18b (3901427f)
[  346.397534] ---[ end trace 0000000000000000 ]---


kernel[351]: [  346.393973] Code: b940b821 0a020021 36d00041 97fff18b (3901427f)

[  346.617897] fbcon_init: detected unhandled fb_set_par error, error code -16
[  346.619178] Console: switching to colour frame buffer device 240x67
Starting subtest: hdmi-frame-dump
Subtest hdmi-frame-dump: FAIL (1.775s)

https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v5.19-rc5/testrun/10489230/suite/log-parser-test/test/check-kernel-oops-5238446/details/

--
Linaro LKFT
https://lkft.linaro.org
