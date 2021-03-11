Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79418337043
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 11:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92FE6EB84;
	Thu, 11 Mar 2021 10:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A279A6EB83
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 10:42:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4A77E64F94
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 10:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615459346;
 bh=H2ZbqfFKNi6a1OhN9IPkMG4OnxH4tFI9hiZEoVKzYhI=;
 h=From:To:Subject:Date:From;
 b=ek1XHYSrYlNMjfZnTorA7bJOvhqZ2tEyxkyFwfTwiK87smoC8FuptlKX5hq3Z8nC1
 yjgjrl2rJsSq6F6NPC8zsfOg34WNwcCvLKESO7x7DlxG4yX7oudTc/32vVzVJ36rgx
 Syy+p2eNcYghaoAUglEH9y6G0bDsXPuSDGBiYDE3bEA9pfpoFCK6M85RwXvy6mrtcc
 3YB3tTU/r+4nDEPrIGbjSueD9eLhmDvlM/Rk9Db6TEY0IRJIvZ2yRHM/LX/MW+Y5fe
 4fB/F3RGYJucodVq6Vi6SkR/cDdXz+FG5CaPd0pMofuTHWhoI0RV5fMSx1ByhIcjCU
 ksWjLdWaH8lZg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3F68D653BD; Thu, 11 Mar 2021 10:42:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212229] New: STM32F469: vblank wait timed out on output to
 /sys/class/graphics/fb0/pan
Date: Thu, 11 Mar 2021 10:42:25 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Console/Framebuffers
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugentoo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: jsimmons@infradead.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression attachments.created
Message-ID: <bug-212229-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212229

            Bug ID: 212229
           Summary: STM32F469: vblank wait timed out on output to
                    /sys/class/graphics/fb0/pan
           Product: Drivers
           Version: 2.5
    Kernel Version: Linux version 5.9.16 (ygenks@xps)
                    (arm-buildroot-uclinux-uclibcgnueabi-gcc.br_real
                    (Buildroot 2020.11.2-87-g0611b1a4ab) 9.3.0, GNU ld
                    (GNU Binutils) 2.32) #3 PREEMPT Thu Mar 11 12:39:46
                    +03 2021
          Hardware: ARM
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Console/Framebuffers
          Assignee: jsimmons@infradead.org
          Reporter: eugentoo@gmail.com
                CC: dri-devel@lists.freedesktop.org
        Regression: No

Created attachment 295797
  --> https://bugzilla.kernel.org/attachment.cgi?id=295797&action=edit
Kernel config

Distribution:         
Buildroot 2020.11.3

Kernel version:
Linux version 5.9.16 (arm-buildroot-uclinux-uclibcgnueabi-gcc.br_real
(Buildroot 2020.11.2-87-g0611b1a4ab) 9.3.0, GNU ld (GNU Binutils) 2.32) #3
PREEMPT Thu Mar 11 12:39:46 +03 2021

Kernel config: 
in attachment

Customized device tree fragment:
https://github.com/Ygenks/buildroot/blob/2020.11.3-stm32f469-bringup/board/stmicroelectronics/stm32f469-disco/linux/stm32f469-disco.dts

Buildroot config:
https://github.com/Ygenks/buildroot/blob/2020.11.3-stm32f469-bringup/configs/stm32f469_disco_defconfig

Hardware environment:
STM32F469i-disco board
https://www.st.com/resource/en/user_manual/dm00218846-discovery-kit-with-stm32f469ni-mcu-stmicroelectronics.pdf


Problem description:

After enabling STM32 DRM MIPI DSI subsystem, frambuffer subsystem and virtual
terminal for STM32F469 MCU, I've tried to output graphic pattern on the
OTM8009A display module from Orisetech with following commands:

# Enable full DRM debug
echo 0xff > /sys/module/drm/parameters/debug
# Write to framebuffer
echo 0 0 > /sys/class/graphics/fb0/pan

Last command ends with kernel exception:[   66.500596]
[drm:drm_atomic_state_init] Allocated atomic state a15f0561
[   66.502126] [drm:drm_mode_object_get] OBJ ID: 38 (2)
[   66.503888] [drm:drm_atomic_get_plane_state] Added [PLANE:33:plane-0]
6275dc03 state to a15f0561
[   66.506318] [drm:drm_mode_object_get] OBJ ID: 39 (1)
[   66.508073] [drm:drm_atomic_get_crtc_state] Added [CRTC:35:crtc-0] f2c93995
state to a15f0561
[   66.509895] [drm:drm_atomic_get_plane_state] Added [PLANE:36:plane-1]
3f7997d2 state to a15f0561
[   66.511287] [drm:drm_atomic_set_fb_for_plane] Set [NOFB] for
[PLANE:36:plane-1] state 3f7997d2
[   66.512972] [drm:drm_atomic_set_fb_for_plane] Set [FB:38] for
[PLANE:33:plane-0] state 6275dc03
[   66.514687] [drm:drm_mode_object_get] OBJ ID: 38 (3)
[   66.515820] [drm:drm_mode_object_put] OBJ ID: 38 (4)
[   66.517632] [drm:drm_atomic_add_affected_connectors] Adding all current
connectors for [CRTC:35:crtc-0] to a15f0561
[   66.518912] [drm:drm_mode_object_get] OBJ ID: 32 (4)
[   66.520049] [drm:drm_mode_object_get] OBJ ID: 32 (5)
[   66.521869] [drm:drm_atomic_get_connector_state] Added [CONNECTOR:32:DSI-1]
8f9b11f6 state to a15f0561
[   66.523030] [drm:drm_mode_object_put] OBJ ID: 32 (5)
[   66.525084] [drm:drm_atomic_set_crtc_for_connector] Link
[CONNECTOR:32:DSI-1] state 8f9b11f6 to [NOCRTC]
[   66.526253] [drm:drm_mode_object_get] OBJ ID: 32 (4)
[   66.527869] [drm:drm_atomic_set_crtc_for_connector] Link
[CONNECTOR:32:DSI-1] state 8f9b11f6 to [CRTC:35:crtc-0]
[   66.529274] [drm:drm_atomic_check_only] checking a15f0561
[   66.530665] [drm:drm_atomic_helper_check_modeset] Updating routing for
[CONNECTOR:32:DSI-1]
[   66.532342] [drm:drm_atomic_helper_check_modeset] [CONNECTOR:32:DSI-1] keeps
[ENCODER:31:DPI-31], now on [CRTC:35:crtc-0]
[   66.534645] [drm:drm_atomic_add_encoder_bridges] Adding all bridges for
[encoder:31:DPI-31] to a15f0561
[   66.536607] [drm:drm_atomic_get_private_obj_state] Added new private object
41b1bb6c state b53daef0 to a15f0561
[   66.538321] [drm:drm_atomic_add_encoder_bridges] Adding all bridges for
[encoder:31:DPI-31] to a15f0561
[   66.539298] [drm:ltdc_plane_atomic_check] 
[   66.540067] [drm:ltdc_plane_atomic_check] 
[   66.541452] [drm:drm_atomic_commit] committing a15f0561
[   66.544452] stm32-display 40016800.display-controller:
[drm:drm_calc_timestamping_constants] crtc 35: hwmode: htotal 708, vtotal 839,
vdisplay 800
[   66.546354] stm32-display 40016800.display-controller:
[drm:drm_calc_timestamping_constants] crtc 35: clock 29700 kHz framedur
20000404 linedur 23838
[   66.548126] [drm:ltdc_plane_atomic_update] plane:33 fb:38 (480x800)@(0,0) ->
(480x800)@(0,0)
[   66.549066] [drm:ltdc_plane_atomic_update] fb: phys 0xc0600000
[   66.549881] [drm:ltdc_crtc_atomic_flush] 
[   66.550655] [drm:ltdc_crtc_enable_vblank] 
[   66.552747] stm32-display 40016800.display-controller:
[drm:drm_vblank_enable] enabling vblank on crtc 0, ret: 0
[   66.555413] stm32-display 40016800.display-controller:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal] crtc 0 : v p(0,0)@
66.440496 -> 66.440496 [e 17 us, 0 rep]
[   66.557840] stm32-display 40016800.display-controller:
[drm:drm_update_vblank_count] crtc 0: Calculating number of vblanks. diff_ns =
45639547247, framedur_ns = 20000404)
[   66.560381] stm32-display 40016800.display-controller:
[drm:drm_update_vblank_count] updating vblank count on crtc 0: current=271,
diff=2282, hw=0 hw_last=0
[   66.563073] stm32-display 40016800.display-controller:
[drm:drm_crtc_vblank_helper_get_vblank_timestamp_internal] crtc 0 : v p(0,0)@
66.448156 -> 66.448156 [e 17 us, 0 rep]
[   66.565476] stm32-display 40016800.display-controller:
[drm:drm_update_vblank_count] crtc 0: Calculating number of vblanks. diff_ns =
7660378, framedur_ns = 20000404)

-------------- vvv Exception here vvv -----------------

[   66.567972] stm32-display 40016800.display-controller:
[drm:drm_update_vblank_count] updating vblank count on crtc 0: current=2553,
diff=0, hw=0 hw_last=0
[   76.753724] ------------[ cut here ]------------
[   76.755426] WARNING: CPU: 0 PID: 46 at
drivers/gpu/drm/drm_atomic_helper.c:1496
drm_atomic_helper_wait_for_vblanks+0x12f/0x164
[   76.755840] [CRTC:35:crtc-0] vblank wait timed out
[   76.756751] CPU: 0 PID: 46 Comm: sh Tainted: G        W         5.9.16 #3
[   76.757117] Hardware name: STM32 (Device Tree Support)
[   76.759186] [<900030bd>] (unwind_backtrace) from [<9000246b>]
(show_stack+0xb/0xc)
[   76.760841] [<9000246b>] (show_stack) from [<901c8345>] (__warn+0x79/0x8c)
[   76.762302] [<901c8345>] (__warn) from [<901c8397>]
(warn_slowpath_fmt+0x3f/0x74)
[   76.764937] [<901c8397>] (warn_slowpath_fmt) from [<90141a63>]
(drm_atomic_helper_wait_for_vblanks+0x12f/0x164)
[   76.767391] [<90141a63>] (drm_atomic_helper_wait_for_vblanks) from
[<90142603>] (drm_atomic_helper_commit_tail+0x35/0x40)
[   76.769689] [<90142603>] (drm_atomic_helper_commit_tail) from [<901426f9>]
(commit_tail+0xeb/0xfa)
[   76.771960] [<901426f9>] (commit_tail) from [<90142a15>]
(drm_atomic_helper_commit+0x95/0xa0)

--------------  Exception here  -----------------

The screen is totally blank.
Controlling brightness doesn't work too:

~ # echo 255 > /sys/class/backlight/40016c00.dsi.0/brightness
[ 3147.258092] stm32-display-dsi 40016c00.dsi: failed to write command FIFO
[ 3147.265921] [drm] mipi dsi dcs write buffer failed
[ 3147.293878] stm32-display-dsi 40016c00.dsi: failed to write command FIFO
[ 3147.301125] [drm] mipi dsi dcs write buffer failed

Dmesg output:
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.9.16 (ygenks@xps)
(arm-buildroot-uclinux-uclibcgnueabi-gcc.br_real (Buildroot
2020.11.2-87-g0611b1a4ab) 9.3.0, GNU ld (GNU Binutils) 2.32) #3 PREEMPT Thu Mar
11 12:39:46 +03 2021
[    0.000000] CPU: ARMv7-M [410fc241] revision 1 (ARMv7M), cr=00000000
[    0.000000] CPU: unknown data cache, unknown instruction cache
[    0.000000] OF: fdt: Machine model: STMicroelectronics STM32F469i-DISCO
board
[    0.000000] Using ARMv7 PMSA Compliant MPU. Region independence: No, Used 5
of 8 regions
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x00000000c0000000-0x00000000c0ffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000c0ffffff]
[    0.000000] Initmem setup node 0 [mem 0x00000000c0000000-0x00000000c0ffffff]
[    0.000000] On node 0 totalpages: 4096
[    0.000000]   Normal zone: 32 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 4096 pages, LIFO batch:0
[    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=1*32768
[    0.000000] pcpu-alloc: [0] 0 
[    0.000000] Built 1 zonelists, mobility grouping off.  Total pages: 4064
[    0.000000] Kernel command line: root=/dev/ram mminit_loglevel=4 loglevel=8
[    0.000000] Dentry cache hash table entries: 2048 (order: 1, 8192 bytes,
linear)
[    0.000000] Inode-cache hash table entries: 1024 (order: 0, 4096 bytes,
linear)
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] Memory: 15840K/16384K available (1959K kernel code, 163K rwdata,
856K rodata, 92K init, 119K bss, 544K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10
jiffies.
[    0.000000] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.000000] /soc/interrupt-controller@40013c00: bank0
[    0.000000] random: get_random_bytes called from start_kernel+0x1e3/0x35c
with crng_init=0
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at drivers/clk/clk-divider.c:138
divider_recalc_rate+0x45/0x94
[    0.000000] pll-r: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.9.16 #3
[    0.000000] Hardware name: STM32 (Device Tree Support)
[    0.000000] [<900030bd>] (unwind_backtrace) from [<9000246b>]
(show_stack+0xb/0xc)
[    0.000000] [<9000246b>] (show_stack) from [<901c8345>] (__warn+0x79/0x8c)
[    0.000000] [<901c8345>] (__warn) from [<901c8397>]
(warn_slowpath_fmt+0x3f/0x74)
[    0.000000] [<901c8397>] (warn_slowpath_fmt) from [<90115559>]
(divider_recalc_rate+0x45/0x94)
[    0.000000] [<90115559>] (divider_recalc_rate) from [<901155cd>]
(clk_divider_recalc_rate+0x25/0x28)
[    0.000000] [<901155cd>] (clk_divider_recalc_rate) from [<90113dbd>]
(__clk_register+0x2f9/0x408)
[    0.000000] [<90113dbd>] (__clk_register) from [<90114a89>]
(clk_hw_register+0x19/0x26)
[    0.000000] [<90114a89>] (clk_hw_register) from [<901c97e9>]
(clk_register_pll_div.constprop.0+0x75/0xb0)
[    0.000000] [<901c97e9>] (clk_register_pll_div.constprop.0) from
[<901c990d>] (stm32f4_rcc_register_pll.constprop.0+0xe9/0x114)
[    0.000000] [<901c990d>] (stm32f4_rcc_register_pll.constprop.0) from
[<902ca43f>] (stm32f42xx_rcc_of_clk_init_driver+0x4a7/0x694)
[    0.000000] [<902ca43f>] (stm32f42xx_rcc_of_clk_init_driver) from
[<902c9f2b>] (of_clk_init+0x117/0x158)
[    0.000000] [<902c9f2b>] (of_clk_init) from [<902c22d1>]
(time_init+0x15/0x20)
[    0.000000] [<902c22d1>] (time_init) from [<902c087b>]
(start_kernel+0x20b/0x35c)
[    0.000000] [<902c087b>] (start_kernel) from [<00000000>] (0x0)
[    0.000000] ---[ end trace 4c7da8027ba5f86b ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at drivers/clk/clk-divider.c:138
divider_recalc_rate+0x45/0x94
[    0.000000] pllsai-q: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.9.16
#3
[    0.000000] Hardware name: STM32 (Device Tree Support)
[    0.000000] [<900030bd>] (unwind_backtrace) from [<9000246b>]
(show_stack+0xb/0xc)
[    0.000000] [<9000246b>] (show_stack) from [<901c8345>] (__warn+0x79/0x8c)
[    0.000000] [<901c8345>] (__warn) from [<901c8397>]
(warn_slowpath_fmt+0x3f/0x74)
[    0.000000] [<901c8397>] (warn_slowpath_fmt) from [<90115559>]
(divider_recalc_rate+0x45/0x94)
[    0.000000] [<90115559>] (divider_recalc_rate) from [<901155cd>]
(clk_divider_recalc_rate+0x25/0x28)
[    0.000000] [<901155cd>] (clk_divider_recalc_rate) from [<90113dbd>]
(__clk_register+0x2f9/0x408)
[    0.000000] [<90113dbd>] (__clk_register) from [<90114a89>]
(clk_hw_register+0x19/0x26)
[    0.000000] [<90114a89>] (clk_hw_register) from [<901c97e9>]
(clk_register_pll_div.constprop.0+0x75/0xb0)
[    0.000000] [<901c97e9>] (clk_register_pll_div.constprop.0) from
[<901c990d>] (stm32f4_rcc_register_pll.constprop.0+0xe9/0x114)
[    0.000000] [<901c990d>] (stm32f4_rcc_register_pll.constprop.0) from
[<902ca459>] (stm32f42xx_rcc_of_clk_init_driver+0x4c1/0x694)
[    0.000000] [<902ca459>] (stm32f42xx_rcc_of_clk_init_driver) from
[<902c9f2b>] (of_clk_init+0x117/0x158)
[    0.000000] [<902c9f2b>] (of_clk_init) from [<902c22d1>]
(time_init+0x15/0x20)
[    0.000000] [<902c22d1>] (time_init) from [<902c087b>]
(start_kernel+0x20b/0x35c)
[    0.000000] [<902c087b>] (start_kernel) from [<00000000>] (0x0)
[    0.000000] ---[ end trace 4c7da8027ba5f86c ]---
[    0.000000] ------------[ cut here ]------------
[    0.000000] WARNING: CPU: 0 PID: 0 at drivers/clk/clk-divider.c:138
divider_recalc_rate+0x45/0x94
[    0.000000] pllsai-r: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.9.16
#3
[    0.000000] Hardware name: STM32 (Device Tree Support)
[    0.000000] [<900030bd>] (unwind_backtrace) from [<9000246b>]
(show_stack+0xb/0xc)
[    0.000000] [<9000246b>] (show_stack) from [<901c8345>] (__warn+0x79/0x8c)
[    0.000000] [<901c8345>] (__warn) from [<901c8397>]
(warn_slowpath_fmt+0x3f/0x74)
[    0.000000] [<901c8397>] (warn_slowpath_fmt) from [<90115559>]
(divider_recalc_rate+0x45/0x94)
[    0.000000] [<90115559>] (divider_recalc_rate) from [<901155cd>]
(clk_divider_recalc_rate+0x25/0x28)
[    0.000000] [<901155cd>] (clk_divider_recalc_rate) from [<90113dbd>]
(__clk_register+0x2f9/0x408)
[    0.000000] [<90113dbd>] (__clk_register) from [<90114a89>]
(clk_hw_register+0x19/0x26)
[    0.000000] [<90114a89>] (clk_hw_register) from [<901c97e9>]
(clk_register_pll_div.constprop.0+0x75/0xb0)
[    0.000000] [<901c97e9>] (clk_register_pll_div.constprop.0) from
[<901c990d>] (stm32f4_rcc_register_pll.constprop.0+0xe9/0x114)
[    0.000000] [<901c990d>] (stm32f4_rcc_register_pll.constprop.0) from
[<902ca459>] (stm32f42xx_rcc_of_clk_init_driver+0x4c1/0x694)
[    0.000000] [<902ca459>] (stm32f42xx_rcc_of_clk_init_driver) from
[<902c9f2b>] (of_clk_init+0x117/0x158)
[    0.000000] [<902c9f2b>] (of_clk_init) from [<902c22d1>]
(time_init+0x15/0x20)
[    0.000000] [<902c22d1>] (time_init) from [<902c087b>]
(start_kernel+0x20b/0x35c)
[    0.000000] [<902c087b>] (start_kernel) from [<00000000>] (0x0)
[    0.000000] ---[ end trace 4c7da8027ba5f86d ]---
[    0.000000] clocksource: arm_system_timer: mask: 0xffffff max_cycles:
0xffffff, max_idle_ns: 331816030 ns
[    0.000000] ARM System timer initialized as clocksource
[    0.000705] sched_clock: 32 bits at 90MHz, resolution 11ns, wraps every
23860929530ns
[    0.001454] timer@40000c00: STM32 sched_clock registered
[    0.002813] Switching to timer-based delay loop, resolution 11ns
[    0.003546] timer@40000c00: STM32 delay timer registered
[    0.005080] clocksource: timer@40000c00: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 21236227187 ns
[    0.006860] /soc/timer@40000c00: STM32 clockevent driver initialized (32
bits)
[    0.044650] Console: colour dummy device 80x30
[    0.338349] printk: console [tty0] enabled
[    0.341119] Calibrating delay loop (skipped), value calculated using timer
frequency.. 180.00 BogoMIPS (lpj=900000)
[    0.346491] pid_max: default: 4096 minimum: 301
[    0.359538] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes,
linear)
[    0.363583] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes,
linear)
[    0.438277] rcu: Hierarchical SRCU implementation.
[    0.451978] devtmpfs: initialized
[    1.022581] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 19112604462750000 ns
[    1.027297] pinctrl core: initialized pinctrl subsystem
[    2.427251] stm32f469-pinctrl soc:pin-controller: No package detected, use
default one
[    2.481341] stm32f469-pinctrl soc:pin-controller: GPIOA bank added
[    2.500606] stm32f469-pinctrl soc:pin-controller: GPIOB bank added
[    2.519726] stm32f469-pinctrl soc:pin-controller: GPIOC bank added
[    2.538955] stm32f469-pinctrl soc:pin-controller: GPIOD bank added
[    2.558419] stm32f469-pinctrl soc:pin-controller: GPIOE bank added
[    2.577572] stm32f469-pinctrl soc:pin-controller: GPIOF bank added
[    2.596581] stm32f469-pinctrl soc:pin-controller: GPIOG bank added
[    2.615330] stm32f469-pinctrl soc:pin-controller: GPIOH bank added
[    2.635236] stm32f469-pinctrl soc:pin-controller: GPIOI bank added
[    2.654665] stm32f469-pinctrl soc:pin-controller: GPIOJ bank added
[    2.658672] random: fast init done
[    2.675817] stm32f469-pinctrl soc:pin-controller: GPIOK bank added
[    2.680404] stm32f469-pinctrl soc:pin-controller: Pinctrl STM32 initialized
[    3.213262] fbcon: Taking over console
[    3.298080] stm32-dma 40026000.dma-controller: STM32 DMA driver registered
[    3.392902] stm32-dma 40026400.dma-controller: STM32 DMA driver registered
[    3.542844] clocksource: Switched to clocksource timer@40000c00
[   11.432799] workingset: timestamp_bits=30 max_order=12 bucket_order=0
[   11.896537] io scheduler mq-deadline registered
[   11.898875] io scheduler kyber registered
[   11.968019] STM32 USART driver initialized
[   11.996799] 40004800.serial: ttySTM0 at MMIO 0x40004800 (irq = 32, base_baud
= 2812500) is a stm32-usart
[   13.010748] printk: console [ttySTM0] enabled
[   13.098458] random: crng init done
[   13.128497] stm32-display-dsi 40016c00.dsi: supply phy-dsi not found, using
dummy regulator
[   13.803759] stm32_rtc 40002800.rtc: registered as rtc0
[   13.812550] stm32_rtc 40002800.rtc: setting system clock to
2000-01-01T00:48:40 UTC (946687720)
[   13.831176] stm32_rtc 40002800.rtc: Date/Time must be initialized
[   13.860713] i2c /dev entries driver
[   13.980156] mmci-pl18x 40012c00.sdio: Got CD GPIO
[   14.012526] mmci-pl18x 40012c00.sdio: mmc0: PL180 manf 80 rev8 at 0x40012c00
irq 33,0 (pio)
[   15.253083] [drm] Initialized stm 1.0.0 20170330 for
40016800.display-controller on minor 0
[   15.827310] Console: switching to colour frame buffer device 60x50
[   16.655436] stm32-display 40016800.display-controller: [drm] fb0: stmdrmfb
frame buffer device
[   16.774113] input: gpio_keys as /devices/platform/gpio_keys/input/input0
[   16.881363] Freeing unused kernel memory: 28K
[   16.900370] This architecture does not have kernel memory protection.
[   16.928387] Run /init as init process
[   16.944506]   with arguments:
[   16.957856]     /init
[   16.968400]   with environment:
[   16.982443]     HOME=/
[   16.993970]     TERM=linux
[   17.006290]     mminit_loglevel=4
[   47.313970] mmc_vcard: disabling

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
