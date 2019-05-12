Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D28711AE2E
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2019 22:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987E589304;
	Sun, 12 May 2019 20:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC6C389308
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2019 20:58:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D6F44721CD; Sun, 12 May 2019 20:58:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109692] deadlock occurs during GPU reset
Date: Sun, 12 May 2019 20:58:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109692-502-3QGfkYcGqZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109692-502@http.bugs.freedesktop.org/>
References: <bug-109692-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1495493921=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1495493921==
Content-Type: multipart/alternative; boundary="15576947363.D263Ae.8334"
Content-Transfer-Encoding: 7bit


--15576947363.D263Ae.8334
Date: Sun, 12 May 2019 20:58:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109692

--- Comment #42 from mikhail.v.gavrilov@gmail.com ---
Andrey, could you look on another GPU reset issue?

[18735.255511] sony 0003:054C:09CC.0008: input,hidraw4: USB HID v81.11 Game=
pad
[Sony Interactive Entertainment Wireless Controller] on
usb-0000:0c:00.3-1.4.4/input3
[18735.340415] usbcore: registered new interface driver snd-usb-audio
[18742.241131] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page0 timeou=
t,
signaled seq=3D201025, emitted seq=3D201027
[18742.241141] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[18742.241196] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[18742.241200] amdgpu 0000:0b:00.0: GPU reset begin!
[18742.251116] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D2264508, emitted seq=3D2264510
[18742.251153] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process chrome pid 17912 thread chrome:cs0 pid 17915
[18742.251156] amdgpu 0000:0b:00.0: GPU reset begin!
[18742.754134] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page1 timeou=
t,
signaled seq=3D15388, emitted seq=3D15388
[18742.754203] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[18742.754207] amdgpu 0000:0b:00.0: GPU reset begin!
[18751.968977] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeou=
t,
signaled seq=3D346, emitted seq=3D346
[18751.969042] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process chrome pid 3587 thread chrome:cs0 pid 3604
[18751.969047] amdgpu 0000:0b:00.0: GPU reset begin!
[18753.504894] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[18763.744722] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[18763.744758] amdgpu: [powerplay] Failed to send message 0x47, response
0xffffffff
[18763.744770] amdgpu: [powerplay] Failed to send message 0x28, response
0xffffffff
[18763.744772] amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min
uclk failed!
[18763.744784] amdgpu: [powerplay] Failed to send message 0x28, response
0xffffffff
[18763.744785] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[18763.744796] amdgpu: [powerplay] Failed to send message 0x28, response
0xffffffff
[18763.744798] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!
[18763.744809] amdgpu: [powerplay] Failed to send message 0x26, response
0xffffffff
[18763.744810] amdgpu: [powerplay] Failed to set soft min gfxclk !
[18763.744811] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[18763.779547] [drm] REG_WAIT timeout 10us * 3000 tries -
dce110_stream_encoder_dp_blank line:950
[18763.779651] WARNING: CPU: 4 PID: 25404 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:277
generic_reg_wait.cold+0x29/0x30 [amdgpu]
[18763.779652] Modules linked in: snd_usb_audio hid_sony ff_memless
snd_usbmidi_lib snd_rawmidi snd_seq_dummy uinput fuse rfcomm cmac
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter ip6t_REJ=
ECT
nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 ip_set nfnetlink ebtable_filter ebtables ip6table_filter
ip6_tables iptable_filter ip_tables bnep sunrpc vfat fat arc4 joydev r8822b=
e(C)
snd_hda_codec_realtek snd_hda_codec_generic edac_mce_amd ledtrig_audio
eeepc_wmi snd_hda_codec_hdmi asus_wmi kvm_amd sparse_keymap snd_hda_intel v=
ideo
wmi_bmof mac80211 snd_hda_codec kvm snd_hda_core snd_hwdep snd_seq btusb bt=
rtl
snd_seq_device btbcm irqbypass btintel bluetooth snd_pcm crct10dif_pclmul
cfg80211 crc32_pclmul snd_timer ghash_clmulni_intel snd sp5100_tco ecdh_gen=
eric
soundcore i2c_piix4 k10temp rfkill ccp
[18763.779676]  gpio_amdpt gpio_generic pcc_cpufreq acpi_cpufreq xfs libcrc=
32c
amdgpu chash gpu_sched amd_iommu_v2 ttm drm_kms_helper igb drm nvme dca
i2c_algo_bit crc32c_intel nvme_core wmi pinctrl_amd
[18763.779687] CPU: 4 PID: 25404 Comm: kworker/4:0 Tainted: G         C=20=
=20=20=20=20=20=20
5.1.0-1.fc31.x86_64 #1
[18763.779689] Hardware name: System manufacturer System Product Name/ROG S=
TRIX
X470-I GAMING, BIOS 2202 04/11/2019
[18763.779694] Workqueue: events drm_sched_job_timedout [gpu_sched]
[18763.779764] RIP: 0010:generic_reg_wait.cold+0x29/0x30 [amdgpu]
[18763.779766] Code: ff 44 8b 44 24 68 48 8b 4c 24 60 48 c7 c7 10 c0 8b c0 =
8b
54 24 58 8b 34 24 e8 b0 59 92 d0 41 83 7c 24 20 01 0f 84 9b 78 fe ff <0f> 0=
b e9
94 78 fe ff e8 9a 4d ed ff 48 c7 c7 00 b0 95 c0 e8 de 5f
[18763.779767] RSP: 0018:ffff9b5320bb7720 EFLAGS: 00010297
[18763.779769] RAX: 0000000000000052 RBX: 0000000000000bb9 RCX:
0000000000000000
[18763.779771] RDX: 0000000000000000 RSI: ffff8d40fd9168c8 RDI:
ffff8d40fd9168c8
[18763.779772] RBP: 00000000000050e2 R08: ffff8d40fd9168c8 R09:
000000000000053d
[18763.779773] R10: ffff8d411e39d7d0 R11: ffff9b5320bb75d5 R12:
ffff8d40f97ca580
[18763.779774] R13: 00000000000050e2 R14: 00000000ffffffff R15:
00000000ffffffff
[18763.779776] FS:  0000000000000000(0000) GS:ffff8d40fd900000(0000)
knlGS:0000000000000000
[18763.779778] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[18763.779779] CR2: 00000c0d6e33c000 CR3: 000000027ed00000 CR4:
00000000003406e0
[18763.779780] Call Trace:
[18763.779854]  dce110_stream_encoder_dp_blank+0x159/0x2e0 [amdgpu]
[18763.779921]  core_link_disable_stream+0x42/0x270 [amdgpu]
[18763.779987]  dce110_reset_hw_ctx_wrap+0xca/0x1f0 [amdgpu]
[18763.780053]  dce110_apply_ctx_to_hw+0x4a/0x490 [amdgpu]
[18763.780100]  ? amdgpu_pm_compute_clocks+0xb9/0x5e0 [amdgpu]
[18763.780168]  ? dm_pp_apply_display_requirements+0x19e/0x1b0 [amdgpu]
[18763.780232]  dc_commit_state+0x26b/0x570 [amdgpu]
[18763.780236]  ? vsnprintf+0x3aa/0x4f0
[18763.780304]  amdgpu_dm_atomic_commit_tail+0x3e2/0x1980 [amdgpu]
[18763.780308]  ? vt_console_print+0x74/0x3f0
[18763.780311]  ? up+0x12/0x60
[18763.780314]  ? irq_work_queue+0x91/0xa0
[18763.780316]  ? wake_up_klogd+0x30/0x40
[18763.780318]  ? vprintk_emit+0x1ef/0x250
[18763.780320]  ? printk+0x58/0x6f
[18763.780328]  ? drm_atomic_helper_wait_for_dependencies+0x1e4/0x1f0
[drm_kms_helper]
[18763.780341]  ? drm_err+0x72/0x90 [drm]
[18763.780349]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[18763.780356]  commit_tail+0x3c/0x70 [drm_kms_helper]
[18763.780364]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[18763.780371]  drm_atomic_helper_disable_all+0x144/0x160 [drm_kms_helper]
[18763.780378]  drm_atomic_helper_suspend+0x60/0xf0 [drm_kms_helper]
[18763.780445]  dm_suspend+0x1c/0x60 [amdgpu]
[18763.780489]  amdgpu_device_ip_suspend_phase1+0x91/0xc0 [amdgpu]
[18763.780532]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[18763.780601]  amdgpu_device_pre_asic_reset+0x1f4/0x209 [amdgpu]
[18763.780668]  amdgpu_device_gpu_recover+0x77/0x731 [amdgpu]
[18763.780730]  amdgpu_job_timedout+0xf7/0x120 [amdgpu]
[18763.780733]  drm_sched_job_timedout+0x3a/0x70 [gpu_sched]
[18763.780737]  process_one_work+0x19d/0x380
[18763.780739]  worker_thread+0x50/0x3b0
[18763.780742]  kthread+0xfb/0x130
[18763.780744]  ? process_one_work+0x380/0x380
[18763.780745]  ? kthread_park+0x90/0x90
[18763.780748]  ret_from_fork+0x22/0x40
[18763.780751] ---[ end trace 1b9ec5613589027e ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15576947363.D263Ae.8334
Date: Sun, 12 May 2019 20:58:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - deadlock occurs during GPU reset"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109692#c42">Comme=
nt # 42</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - deadlock occurs during GPU reset"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109692">bug 10969=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mikhail.v.gavrilov&#64;gmail.com" title=3D"mikhail.v.gavrilov&#64;gmail.com=
">mikhail.v.gavrilov&#64;gmail.com</a>
</span></b>
        <pre>Andrey, could you look on another GPU reset issue?

[18735.255511] sony 0003:054C:09CC.0008: input,hidraw4: USB HID v81.11 Game=
pad
[Sony Interactive Entertainment Wireless Controller] on
usb-0000:0c:00.3-1.4.4/input3
[18735.340415] usbcore: registered new interface driver snd-usb-audio
[18742.241131] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page0 timeou=
t,
signaled seq=3D201025, emitted seq=3D201027
[18742.241141] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[18742.241196] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[18742.241200] amdgpu 0000:0b:00.0: GPU reset begin!
[18742.251116] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D2264508, emitted seq=3D2264510
[18742.251153] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process chrome pid 17912 thread chrome:cs0 pid 17915
[18742.251156] amdgpu 0000:0b:00.0: GPU reset begin!
[18742.754134] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring page1 timeou=
t,
signaled seq=3D15388, emitted seq=3D15388
[18742.754203] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process  pid 0 thread  pid 0
[18742.754207] amdgpu 0000:0b:00.0: GPU reset begin!
[18751.968977] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeou=
t,
signaled seq=3D346, emitted seq=3D346
[18751.969042] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process chrome pid 3587 thread chrome:cs0 pid 3604
[18751.969047] amdgpu 0000:0b:00.0: GPU reset begin!
[18753.504894] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:47:crtc-0] flip_done timed out
[18763.744722] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [PLANE:45:plane-5] flip_done timed out
[18763.744758] amdgpu: [powerplay] Failed to send message 0x47, response
0xffffffff
[18763.744770] amdgpu: [powerplay] Failed to send message 0x28, response
0xffffffff
[18763.744772] amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min
uclk failed!
[18763.744784] amdgpu: [powerplay] Failed to send message 0x28, response
0xffffffff
[18763.744785] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[18763.744796] amdgpu: [powerplay] Failed to send message 0x28, response
0xffffffff
[18763.744798] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!
[18763.744809] amdgpu: [powerplay] Failed to send message 0x26, response
0xffffffff
[18763.744810] amdgpu: [powerplay] Failed to set soft min gfxclk !
[18763.744811] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!
[18763.779547] [drm] REG_WAIT timeout 10us * 3000 tries -
dce110_stream_encoder_dp_blank line:950
[18763.779651] WARNING: CPU: 4 PID: 25404 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:277
generic_reg_wait.cold+0x29/0x30 [amdgpu]
[18763.779652] Modules linked in: snd_usb_audio hid_sony ff_memless
snd_usbmidi_lib snd_rawmidi snd_seq_dummy uinput fuse rfcomm cmac
nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT ip6t_rpfilter ip6t_REJ=
ECT
nf_reject_ipv6 ipt_REJECT nf_reject_ipv4 xt_conntrack ebtable_nat ip6table_=
nat
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 ip_set nfnetlink ebtable_filter ebtables ip6table_filter
ip6_tables iptable_filter ip_tables bnep sunrpc vfat fat arc4 joydev r8822b=
e(C)
snd_hda_codec_realtek snd_hda_codec_generic edac_mce_amd ledtrig_audio
eeepc_wmi snd_hda_codec_hdmi asus_wmi kvm_amd sparse_keymap snd_hda_intel v=
ideo
wmi_bmof mac80211 snd_hda_codec kvm snd_hda_core snd_hwdep snd_seq btusb bt=
rtl
snd_seq_device btbcm irqbypass btintel bluetooth snd_pcm crct10dif_pclmul
cfg80211 crc32_pclmul snd_timer ghash_clmulni_intel snd sp5100_tco ecdh_gen=
eric
soundcore i2c_piix4 k10temp rfkill ccp
[18763.779676]  gpio_amdpt gpio_generic pcc_cpufreq acpi_cpufreq xfs libcrc=
32c
amdgpu chash gpu_sched amd_iommu_v2 ttm drm_kms_helper igb drm nvme dca
i2c_algo_bit crc32c_intel nvme_core wmi pinctrl_amd
[18763.779687] CPU: 4 PID: 25404 Comm: kworker/4:0 Tainted: G         C=20=
=20=20=20=20=20=20
5.1.0-1.fc31.x86_64 #1
[18763.779689] Hardware name: System manufacturer System Product Name/ROG S=
TRIX
X470-I GAMING, BIOS 2202 04/11/2019
[18763.779694] Workqueue: events drm_sched_job_timedout [gpu_sched]
[18763.779764] RIP: 0010:generic_reg_wait.cold+0x29/0x30 [amdgpu]
[18763.779766] Code: ff 44 8b 44 24 68 48 8b 4c 24 60 48 c7 c7 10 c0 8b c0 =
8b
54 24 58 8b 34 24 e8 b0 59 92 d0 41 83 7c 24 20 01 0f 84 9b 78 fe ff &lt;0f=
&gt; 0b e9
94 78 fe ff e8 9a 4d ed ff 48 c7 c7 00 b0 95 c0 e8 de 5f
[18763.779767] RSP: 0018:ffff9b5320bb7720 EFLAGS: 00010297
[18763.779769] RAX: 0000000000000052 RBX: 0000000000000bb9 RCX:
0000000000000000
[18763.779771] RDX: 0000000000000000 RSI: ffff8d40fd9168c8 RDI:
ffff8d40fd9168c8
[18763.779772] RBP: 00000000000050e2 R08: ffff8d40fd9168c8 R09:
000000000000053d
[18763.779773] R10: ffff8d411e39d7d0 R11: ffff9b5320bb75d5 R12:
ffff8d40f97ca580
[18763.779774] R13: 00000000000050e2 R14: 00000000ffffffff R15:
00000000ffffffff
[18763.779776] FS:  0000000000000000(0000) GS:ffff8d40fd900000(0000)
knlGS:0000000000000000
[18763.779778] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[18763.779779] CR2: 00000c0d6e33c000 CR3: 000000027ed00000 CR4:
00000000003406e0
[18763.779780] Call Trace:
[18763.779854]  dce110_stream_encoder_dp_blank+0x159/0x2e0 [amdgpu]
[18763.779921]  core_link_disable_stream+0x42/0x270 [amdgpu]
[18763.779987]  dce110_reset_hw_ctx_wrap+0xca/0x1f0 [amdgpu]
[18763.780053]  dce110_apply_ctx_to_hw+0x4a/0x490 [amdgpu]
[18763.780100]  ? amdgpu_pm_compute_clocks+0xb9/0x5e0 [amdgpu]
[18763.780168]  ? dm_pp_apply_display_requirements+0x19e/0x1b0 [amdgpu]
[18763.780232]  dc_commit_state+0x26b/0x570 [amdgpu]
[18763.780236]  ? vsnprintf+0x3aa/0x4f0
[18763.780304]  amdgpu_dm_atomic_commit_tail+0x3e2/0x1980 [amdgpu]
[18763.780308]  ? vt_console_print+0x74/0x3f0
[18763.780311]  ? up+0x12/0x60
[18763.780314]  ? irq_work_queue+0x91/0xa0
[18763.780316]  ? wake_up_klogd+0x30/0x40
[18763.780318]  ? vprintk_emit+0x1ef/0x250
[18763.780320]  ? printk+0x58/0x6f
[18763.780328]  ? drm_atomic_helper_wait_for_dependencies+0x1e4/0x1f0
[drm_kms_helper]
[18763.780341]  ? drm_err+0x72/0x90 [drm]
[18763.780349]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[18763.780356]  commit_tail+0x3c/0x70 [drm_kms_helper]
[18763.780364]  drm_atomic_helper_commit+0x108/0x110 [drm_kms_helper]
[18763.780371]  drm_atomic_helper_disable_all+0x144/0x160 [drm_kms_helper]
[18763.780378]  drm_atomic_helper_suspend+0x60/0xf0 [drm_kms_helper]
[18763.780445]  dm_suspend+0x1c/0x60 [amdgpu]
[18763.780489]  amdgpu_device_ip_suspend_phase1+0x91/0xc0 [amdgpu]
[18763.780532]  amdgpu_device_ip_suspend+0x1c/0x60 [amdgpu]
[18763.780601]  amdgpu_device_pre_asic_reset+0x1f4/0x209 [amdgpu]
[18763.780668]  amdgpu_device_gpu_recover+0x77/0x731 [amdgpu]
[18763.780730]  amdgpu_job_timedout+0xf7/0x120 [amdgpu]
[18763.780733]  drm_sched_job_timedout+0x3a/0x70 [gpu_sched]
[18763.780737]  process_one_work+0x19d/0x380
[18763.780739]  worker_thread+0x50/0x3b0
[18763.780742]  kthread+0xfb/0x130
[18763.780744]  ? process_one_work+0x380/0x380
[18763.780745]  ? kthread_park+0x90/0x90
[18763.780748]  ret_from_fork+0x22/0x40
[18763.780751] ---[ end trace 1b9ec5613589027e ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15576947363.D263Ae.8334--

--===============1495493921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1495493921==--
