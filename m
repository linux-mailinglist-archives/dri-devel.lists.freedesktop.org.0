Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DE8596060
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 18:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803DD112890;
	Tue, 16 Aug 2022 16:35:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A6C11A3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 16:35:02 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 p12-20020a7bcc8c000000b003a5360f218fso9675130wma.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc; bh=aSgfhg0ra4QeeNOPUK4Fe3iHQwl6otADoE+WTu25cUQ=;
 b=oO75P0zgzZSelgKq8X5/8n7pR64lNzguHHIZv6Qigk0vcqor6yyx+UvwgJVjHHDTmr
 JpOFXa1sAk8IS2Ge9QGldAcDHK1vjwBpmmgDBOPmEaKMPM37BBml+Vasa6ceMaXfy8ys
 vA5YlGf9GJpp9kCTlm59YWlDxjGi0qUF2njrrvH0jvyRtfU1uSXfVgQBdjRN+nQiTrIa
 K1tx2KUJ9Qf6yuH4X2xvmavbOcD6thNdXp36tW7K0Q7lR4dm6E/Kgvxeyn1nvbAUUm55
 oCW8uPSTKuvZjjteUVAZG+fJ6XL4Y+bL3tbiCzlmzexpifuTzdMGSCPUxJ+atCFRYW4f
 BIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=aSgfhg0ra4QeeNOPUK4Fe3iHQwl6otADoE+WTu25cUQ=;
 b=VEMG/AAsN1u/hX8KNLxm0SkMZgW4YCTsmZSSF9oIQyyaPqXUhCda2H1yAJBiXi2TyW
 EabGYNMi4OFKdVwZzyLICOZxR/C/A21xy4p4bcvFPlswLG8mY9EnlengRllU07rAkkJT
 27zOWfB828LR4t85bZNmD3bF2T8Eemofckq0eDAR+D+dwravAsMPjE0Gqhj4GtRanTlN
 Jf3XNNCgtjWys1wkcg/8/lb/SoBMw38zLXueRF8THLw5J6j5ZcRLRymny7SNqHj05tOH
 zsPLFE6Xpf36jyR7PcTJbInSFWcFJGf00to7TptZCiAg4ajMkUJ1huTs/Ceh4JaX93Px
 9YrQ==
X-Gm-Message-State: ACgBeo12rJ27X7A7yf2WtgQbPtNgPWAsQ5rwh9UXKKjgdTXZRGsw0ps6
 e0iGAqOMOWPP7ic5Auq6wlA=
X-Google-Smtp-Source: AA6agR7ZXmAf9LGFTKUCiRhx2DtRo35VpbC8Ein623TDCJlD2TEoSklMR8Cn7TN7XqMHn5kp2f0KhA==
X-Received: by 2002:a05:600c:3492:b0:3a5:e1a0:24c9 with SMTP id
 a18-20020a05600c349200b003a5e1a024c9mr9372869wmq.177.1660667701050; 
 Tue, 16 Aug 2022 09:35:01 -0700 (PDT)
Received: from debian ([2405:201:8005:80f3:49ef:62cd:4783:3947])
 by smtp.gmail.com with ESMTPSA id
 co26-20020a0560000a1a00b0021e2fccea97sm10756131wrb.64.2022.08.16.09.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 09:35:00 -0700 (PDT)
Date: Tue, 16 Aug 2022 17:34:51 +0100
From: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: drm warning with mainline due to 467e30171b5b ("drm/vc4: hdmi: Move
 HDMI reset to pm_resume")
Message-ID: <YvvHK2zb1lbm2baU@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 torvalds@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi All,

Not sure if it has been reported but the mainline kernel shows a drm warning
on RPI4B.

[   14.821276] WARNING: CPU: 3 PID: 187 at drivers/gpu/drm/vc4/vc4_hdmi_regs.h:487 vc5_hdmi_reset+0x1f8/0x240 [vc4]
[   14.837288] Modules linked in: hci_uart btqca btrtl btbcm btintel btsdio(+) bluetooth bcm2835_v4l2(C) bcm2835_mmal_vchiq(C) videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common brcmfmac videodev brcmutil vc4(+) ecdh_generic ecc drm_display_helper mc raspberrypi_hwmon cec crct10dif_ce drm_cma_helper cfg80211 dwc2 udc_core i2c_brcmstb roles snd_bcm2835(C) drm_kms_helper pwm_bcm2835 drm xhci_pci xhci_pci_renesas snd_soc_core phy_generic ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd fb_sys_fops syscopyarea sysfillrect sysimgblt uio_pdrv_genirq uio aes_neon_bs aes_neon_blk
[   14.889917] CPU: 3 PID: 187 Comm: systemd-udevd Tainted: G         C         6.0.0-rc1-568035b01cfb #1
[   14.899355] Hardware name: Raspberry Pi 4 Model B (DT)
[   14.904561] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   14.911620] pc : vc5_hdmi_reset+0x1f8/0x240 [vc4]
[   14.916433] lr : vc5_hdmi_reset+0x38/0x240 [vc4]
[   14.921151] sp : ffff80000a85b640
[   14.923079] uart-pl011 fe201000.serial: no DMA platform data
[   14.924504] x29: ffff80000a85b640 x28: 0000000000000000 x27: ffff000056626080
[   14.937472] x26: ffff80000128e2d8 x25: ffff80000128e988 x24: 0000000000000000
[   14.944708] x23: ffff000040a58000 x22: ffff0000fb832978 x21: ffff000056626c90
[   14.951944] x20: 0000000000000000 x19: ffff000056626080 x18: 0000000000000014
[   14.959180] x17: 00000000e6b317d8 x16: 00000000c03e2fab x15: 00000000002ffc4a
[   14.966416] x14: 0000000000000000 x13: 0000000000000010 x12: 0101010101010101
[   14.973650] x11: ff7f7f7f7f7f7f7f x10: ffff840003584d5b x9 : ffff800001276518
[   14.980886] x8 : 0101010101010101 x7 : 0000000000000000 x6 : ffff000040e5d140
[   14.988120] x5 : 0000000000000000 x4 : ffff80000a85b580 x3 : 0000000000000000
[   14.995355] x2 : 0000000000000001 x1 : 0000000000000002 x0 : ffff8000012901c0
[   15.002591] Call trace:
[   15.005063]  vc5_hdmi_reset+0x1f8/0x240 [vc4]
[   15.009514]  vc4_hdmi_runtime_resume+0x74/0x2dc [vc4]
[   15.014671]  vc4_hdmi_bind+0x22c/0xa40 [vc4]
[   15.019038]  component_bind_all+0x114/0x264
[   15.023293]  vc4_drm_bind+0x160/0x2a4 [vc4]
[   15.027565]  try_to_bring_up_aggregate_device+0x1e4/0x2d0
[   15.033044]  component_master_add_with_match+0xcc/0x110
[   15.038340]  vc4_platform_drm_probe+0xc4/0xfc [vc4]
[   15.043327]  platform_probe+0x74/0xd0
[   15.047037]  really_probe+0xc8/0x3ec
[   15.050662]  __driver_probe_device+0x84/0x190
[   15.055079]  driver_probe_device+0x44/0x100
[   15.059318]  __driver_attach+0xd8/0x1d0
[   15.063206]  bus_for_each_dev+0x7c/0xe0
[   15.067090]  driver_attach+0x30/0x3c
[   15.070711]  bus_add_driver+0x188/0x244
[   15.074595]  driver_register+0x84/0x140
[   15.078482]  __platform_driver_register+0x34/0x40
[   15.083247]  vc4_drm_register+0x5c/0x1000 [vc4]
[   15.087881]  do_one_initcall+0x50/0x2bc
[   15.091770]  do_init_module+0x50/0x1f0
[   15.095569]  load_module+0x1a28/0x1fa0
[   15.099366]  __do_sys_finit_module+0xac/0x12c
[   15.103779]  __arm64_sys_finit_module+0x2c/0x40
[   15.108368]  invoke_syscall+0x50/0x120
[   15.112166]  el0_svc_common.constprop.0+0x6c/0x1b4
[   15.117021]  do_el0_svc+0x38/0xcc
[   15.120378]  el0_svc+0x30/0xd0
[   15.123472]  el0t_64_sync_handler+0x11c/0x150
[   15.127886]  el0t_64_sync+0x1a0/0x1a4
[   15.131595] ---[ end trace 0000000000000000 ]---

git bisect pointed to 467e30171b5b ("drm/vc4: hdmi: Move HDMI reset to pm_resume")
and reverting this commit has fixed the warning.

I will be happy to test any patch or provide any extra log if needed.

--
Regards
Sudip
