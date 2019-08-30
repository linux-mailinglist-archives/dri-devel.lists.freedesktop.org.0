Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C76A3D9D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 20:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DB5F6E3B4;
	Fri, 30 Aug 2019 18:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69E216E3B4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 18:20:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5DF0172161; Fri, 30 Aug 2019 18:20:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111487] AMD vega - display off/on -> solid green display
Date: Fri, 30 Aug 2019 18:20:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: bzz@atomicbee.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111487-502-u6vnRhlxsT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111487-502@http.bugs.freedesktop.org/>
References: <bug-111487-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1977266509=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1977266509==
Content-Type: multipart/alternative; boundary="15671892080.1A5E5.27032"
Content-Transfer-Encoding: 7bit


--15671892080.1A5E5.27032
Date: Fri, 30 Aug 2019 18:20:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111487

--- Comment #4 from bzz <bzz@atomicbee.cz> ---
weird story continues. I've switched cable HDMI - HDMI to HDMI - DVI-D (so
right now i cannot have full supported resolution by Dell U3014, but flicke=
ring
is gone and when i turn off and on display, i dont' have solid green screen=
.=20

Is the HDMI or higher resolution problem?=20

Anyway, i can still see warnings in dmesg:

[ 2556.247779] WARNING: CPU: 3 PID: 177 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:932
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
[ 2556.247779] Modules linked in: uas usb_storage fuse vhost_net vhost tap =
tun
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter ip_tables
x_tables bpfilter scsi_transport_iscsi af_packet br_netfilter bridge stp llc
iscsi_ibft iscsi_boot_sysfs msr nls_iso8859_1 nls_cp437 vfat fat edac_mce_a=
md
kvm_amd ccp kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
snd_hda_codec_realtek snd_hda_codec_generic aesni_intel ledtrig_audio
snd_hda_codec_hdmi aes_x86_64 crypto_simd snd_hda_intel snd_hda_codec cryptd
glue_helper snd_hda_core snd_hwdep eeepc_wmi snd_pcm pcspkr r8169 asus_wmi
snd_timer sparse_keymap realtek snd sp5100_tco rfkill wmi_bmof k10temp
i2c_piix4 soundcore libphy joydev gpio_amdpt gpio_generic button acpi_cpufr=
eq
hid_logitech_hidpp btrfs libcrc32c xor hid_logitech_dj raid6_pq hid_generic
usbhid amdgpu amd_iommu_v2 gpu_sched i2c_algo_bit ttm drm_kms_helper
crc32c_intel syscopyarea sysfillrect sysimgblt xhci_pci fb_sys_fops xhci_hcd
drm usbcore wmi video
[ 2556.247794]  pinctrl_amd sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc
scsi_dh_alua efivarfs
[ 2556.247797] CPU: 3 PID: 177 Comm: kworker/u64:8 Tainted: G        W=20=
=20=20=20=20=20=20=20
5.3.0-rc6-1.g2831011-default #1 openSUSE Tumbleweed (unreleased)
[ 2556.247797] Hardware name: System manufacturer System Product Name/PRIME
B450M-A, BIOS 1804 07/29/2019
[ 2556.247801] Workqueue: events_unbound commit_work [drm_kms_helper]
[ 2556.247848] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
29
[amdgpu]
[ 2556.247849] Code: 83 c8 ff e9 58 3d f8 ff 48 c7 c7 58 cb 98 c0 e8 b9 fa =
02
db 0f 0b 83 c8 ff e9 42 3d f8 ff 48 c7 c7 58 cb 98 c0 e8 a3 fa 02 db <0f> 0=
b 80
bb 9f 01 00 00 00 75 05 e9 d6 63 f8 ff 48 8b 83 f8 02 00
[ 2556.247850] RSP: 0018:ffffc1a0404779b8 EFLAGS: 00010286
[ 2556.247851] RAX: 0000000000000024 RBX: ffff9daa62a90000 RCX:
0000000000000006
[ 2556.247851] RDX: 0000000000000007 RSI: 0000000000000002 RDI:
ffff9daa6ead9a10
[ 2556.247852] RBP: ffff9da94e7a0000 R08: 000002532c3cd37f R09:
ffff9daa6e800000
[ 2556.247852] R10: 000000000005a06c R11: 0000000000032088 R12:
ffff9daa62a90000
[ 2556.247855] R13: ffff9daa19eac000 R14: ffff9daa64bedf00 R15:
ffff9da94e7a0f68
[ 2556.247855] FS:  0000000000000000(0000) GS:ffff9daa6eac0000(0000)
knlGS:0000000000000000
[ 2556.247856] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2556.247856] CR2: 0000000800626ce4 CR3: 00000007e7536000 CR4:
00000000003406e0
[ 2556.247857] Call Trace:
[ 2556.247900]  dcn10_apply_ctx_for_surface+0x587/0x6a0 [amdgpu]
[ 2556.247942]  commit_planes_for_stream+0x488/0x860 [amdgpu]
[ 2556.247983]  dc_commit_updates_for_stream+0x942/0xab0 [amdgpu]
[ 2556.248030]  amdgpu_dm_commit_planes.constprop.0+0x7d7/0x9a0 [amdgpu]
[ 2556.248072]  amdgpu_dm_atomic_commit_tail+0x94c/0xfb0 [amdgpu]
[ 2556.248073]  ? __wb_calc_thresh+0x2a/0x100
[ 2556.248074]  ? wb_calc_thresh+0x41/0x50
[ 2556.248075]  ? __switch_to_asm+0x40/0x70
[ 2556.248076]  ? __switch_to_asm+0x34/0x70
[ 2556.248076]  ? __switch_to_asm+0x40/0x70
[ 2556.248077]  ? __switch_to_asm+0x34/0x70
[ 2556.248079]  ? __switch_to_asm+0x40/0x70
[ 2556.248079]  ? __switch_to_asm+0x34/0x70
[ 2556.248080]  ? __switch_to_asm+0x40/0x70
[ 2556.248080]  ? __switch_to_asm+0x34/0x70
[ 2556.248081]  ? __switch_to_asm+0x40/0x70
[ 2556.248081]  ? __switch_to_asm+0x34/0x70
[ 2556.248082]  ? __switch_to_asm+0x40/0x70
[ 2556.248082]  ? __switch_to_asm+0x34/0x70
[ 2556.248083]  ? __switch_to_asm+0x40/0x70
[ 2556.248084]  ? __switch_to_asm+0x34/0x70
[ 2556.248085]  ? __switch_to_asm+0x40/0x70
[ 2556.248086]  ? trace_hardirqs_off_thunk+0x1a/0x30
[ 2556.248087]  ? wait_for_completion_timeout+0xf3/0x110
[ 2556.248088]  ? finish_task_switch+0x7e/0x280
[ 2556.248092]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 2556.248096]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 2556.248099]  process_one_work+0x1df/0x380
[ 2556.248100]  worker_thread+0x4d/0x400
[ 2556.248101]  kthread+0xf9/0x130
[ 2556.248102]  ? process_one_work+0x380/0x380
[ 2556.248103]  ? kthread_park+0x80/0x80
[ 2556.248103]  ret_from_fork+0x27/0x50
[ 2556.248104] ---[ end trace d9e405aa05e74f7a ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15671892080.1A5E5.27032
Date: Fri, 30 Aug 2019 18:20:08 +0000
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
   title=3D"NEW - AMD vega - display off/on -&gt; solid green display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111487#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD vega - display off/on -&gt; solid green display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111487">bug 11148=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bzz&#64;atomicbee.cz" title=3D"bzz &lt;bzz&#64;atomicbee.cz&gt;"> <span cla=
ss=3D"fn">bzz</span></a>
</span></b>
        <pre>weird story continues. I've switched cable HDMI - HDMI to HDMI=
 - DVI-D (so
right now i cannot have full supported resolution by Dell U3014, but flicke=
ring
is gone and when i turn off and on display, i dont' have solid green screen=
.=20

Is the HDMI or higher resolution problem?=20

Anyway, i can still see warnings in dmesg:

[ 2556.247779] WARNING: CPU: 3 PID: 177 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:932
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
[ 2556.247779] Modules linked in: uas usb_storage fuse vhost_net vhost tap =
tun
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter ip_tables
x_tables bpfilter scsi_transport_iscsi af_packet br_netfilter bridge stp llc
iscsi_ibft iscsi_boot_sysfs msr nls_iso8859_1 nls_cp437 vfat fat edac_mce_a=
md
kvm_amd ccp kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel
snd_hda_codec_realtek snd_hda_codec_generic aesni_intel ledtrig_audio
snd_hda_codec_hdmi aes_x86_64 crypto_simd snd_hda_intel snd_hda_codec cryptd
glue_helper snd_hda_core snd_hwdep eeepc_wmi snd_pcm pcspkr r8169 asus_wmi
snd_timer sparse_keymap realtek snd sp5100_tco rfkill wmi_bmof k10temp
i2c_piix4 soundcore libphy joydev gpio_amdpt gpio_generic button acpi_cpufr=
eq
hid_logitech_hidpp btrfs libcrc32c xor hid_logitech_dj raid6_pq hid_generic
usbhid amdgpu amd_iommu_v2 gpu_sched i2c_algo_bit ttm drm_kms_helper
crc32c_intel syscopyarea sysfillrect sysimgblt xhci_pci fb_sys_fops xhci_hcd
drm usbcore wmi video
[ 2556.247794]  pinctrl_amd sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_emc
scsi_dh_alua efivarfs
[ 2556.247797] CPU: 3 PID: 177 Comm: kworker/u64:8 Tainted: G        W=20=
=20=20=20=20=20=20=20
5.3.0-rc6-1.g2831011-default #1 openSUSE Tumbleweed (unreleased)
[ 2556.247797] Hardware name: System manufacturer System Product Name/PRIME
B450M-A, BIOS 1804 07/29/2019
[ 2556.247801] Workqueue: events_unbound commit_work [drm_kms_helper]
[ 2556.247848] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
29
[amdgpu]
[ 2556.247849] Code: 83 c8 ff e9 58 3d f8 ff 48 c7 c7 58 cb 98 c0 e8 b9 fa =
02
db 0f 0b 83 c8 ff e9 42 3d f8 ff 48 c7 c7 58 cb 98 c0 e8 a3 fa 02 db &lt;0f=
&gt; 0b 80
bb 9f 01 00 00 00 75 05 e9 d6 63 f8 ff 48 8b 83 f8 02 00
[ 2556.247850] RSP: 0018:ffffc1a0404779b8 EFLAGS: 00010286
[ 2556.247851] RAX: 0000000000000024 RBX: ffff9daa62a90000 RCX:
0000000000000006
[ 2556.247851] RDX: 0000000000000007 RSI: 0000000000000002 RDI:
ffff9daa6ead9a10
[ 2556.247852] RBP: ffff9da94e7a0000 R08: 000002532c3cd37f R09:
ffff9daa6e800000
[ 2556.247852] R10: 000000000005a06c R11: 0000000000032088 R12:
ffff9daa62a90000
[ 2556.247855] R13: ffff9daa19eac000 R14: ffff9daa64bedf00 R15:
ffff9da94e7a0f68
[ 2556.247855] FS:  0000000000000000(0000) GS:ffff9daa6eac0000(0000)
knlGS:0000000000000000
[ 2556.247856] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 2556.247856] CR2: 0000000800626ce4 CR3: 00000007e7536000 CR4:
00000000003406e0
[ 2556.247857] Call Trace:
[ 2556.247900]  dcn10_apply_ctx_for_surface+0x587/0x6a0 [amdgpu]
[ 2556.247942]  commit_planes_for_stream+0x488/0x860 [amdgpu]
[ 2556.247983]  dc_commit_updates_for_stream+0x942/0xab0 [amdgpu]
[ 2556.248030]  amdgpu_dm_commit_planes.constprop.0+0x7d7/0x9a0 [amdgpu]
[ 2556.248072]  amdgpu_dm_atomic_commit_tail+0x94c/0xfb0 [amdgpu]
[ 2556.248073]  ? __wb_calc_thresh+0x2a/0x100
[ 2556.248074]  ? wb_calc_thresh+0x41/0x50
[ 2556.248075]  ? __switch_to_asm+0x40/0x70
[ 2556.248076]  ? __switch_to_asm+0x34/0x70
[ 2556.248076]  ? __switch_to_asm+0x40/0x70
[ 2556.248077]  ? __switch_to_asm+0x34/0x70
[ 2556.248079]  ? __switch_to_asm+0x40/0x70
[ 2556.248079]  ? __switch_to_asm+0x34/0x70
[ 2556.248080]  ? __switch_to_asm+0x40/0x70
[ 2556.248080]  ? __switch_to_asm+0x34/0x70
[ 2556.248081]  ? __switch_to_asm+0x40/0x70
[ 2556.248081]  ? __switch_to_asm+0x34/0x70
[ 2556.248082]  ? __switch_to_asm+0x40/0x70
[ 2556.248082]  ? __switch_to_asm+0x34/0x70
[ 2556.248083]  ? __switch_to_asm+0x40/0x70
[ 2556.248084]  ? __switch_to_asm+0x34/0x70
[ 2556.248085]  ? __switch_to_asm+0x40/0x70
[ 2556.248086]  ? trace_hardirqs_off_thunk+0x1a/0x30
[ 2556.248087]  ? wait_for_completion_timeout+0xf3/0x110
[ 2556.248088]  ? finish_task_switch+0x7e/0x280
[ 2556.248092]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[ 2556.248096]  commit_tail+0x3c/0x70 [drm_kms_helper]
[ 2556.248099]  process_one_work+0x1df/0x380
[ 2556.248100]  worker_thread+0x4d/0x400
[ 2556.248101]  kthread+0xf9/0x130
[ 2556.248102]  ? process_one_work+0x380/0x380
[ 2556.248103]  ? kthread_park+0x80/0x80
[ 2556.248103]  ret_from_fork+0x27/0x50
[ 2556.248104] ---[ end trace d9e405aa05e74f7a ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15671892080.1A5E5.27032--

--===============1977266509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1977266509==--
