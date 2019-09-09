Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4571ADF83
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 21:38:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE8D89DC9;
	Mon,  9 Sep 2019 19:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 216AE89DC7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 19:38:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1E0C772167; Mon,  9 Sep 2019 19:38:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111487] AMD vega - display off/on -> solid green display
Date: Mon, 09 Sep 2019 19:38:31 +0000
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
Message-ID: <bug-111487-502-XtdoXXvORy@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1055735518=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1055735518==
Content-Type: multipart/alternative; boundary="15680579111.1cfE92.30293"
Content-Transfer-Encoding: 7bit


--15680579111.1cfE92.30293
Date: Mon, 9 Sep 2019 19:38:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111487

--- Comment #6 from bzz <bzz@atomicbee.cz> ---
New kernel, problem still here:


[  242.669782] WARNING: CPU: 2 PID: 183 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
[  242.669782] Modules linked in: vhost_net vhost tap fuse tun ebtable_filt=
er
ebtables ip6table_filter ip6_tables iptable_filter ip_tables x_tables bpfil=
ter
scsi_transport_iscsi af_packet br_netfilter bridge stp llc iscsi_ibft
iscsi_boot_sysfs msr raid1 dm_raid raid456 md_mod async_raid6_recov
async_memcpy async_pq async_xor async_tx nls_iso8859_1 nls_cp437 vfat fat
edac_mce_amd kvm_amd ccp kvm irqbypass crct10dif_pclmul crc32_pclmul
ghash_clmulni_intel aesni_intel snd_hda_codec_realtek snd_hda_codec_generic
aes_x86_64 crypto_simd ledtrig_audio snd_hda_codec_hdmi cryptd glue_helper
eeepc_wmi snd_hda_intel asus_wmi pcspkr sparse_keymap rfkill snd_hda_codec
sp5100_tco wmi_bmof k10temp i2c_piix4 snd_hda_core snd_hwdep snd_pcm snd_ti=
mer
snd soundcore r8169 joydev realtek libphy gpio_amdpt gpio_generic pcc_cpufr=
eq
button acpi_cpufreq hid_logitech_hidpp btrfs libcrc32c xor uas usb_storage
raid6_pq hid_logitech_dj hid_generic usbhid amdgpu crc32c_intel amd_iommu_v2
gpu_sched i2c_algo_bit ttm
[  242.669793]  drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
drm xhci_pci xhci_hcd usbcore wmi video pinctrl_amd sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
[  242.669796] CPU: 2 PID: 183 Comm: kworker/u64:10 Tainted: G        W=20=
=20=20=20=20=20=20=20
5.2.11-1-default #1 openSUSE Tumbleweed (unreleased)
[  242.669797] Hardware name: System manufacturer System Product Name/PRIME
B450M-A, BIOS 1804 07/29/2019
[  242.669801] Workqueue: events_unbound commit_work [drm_kms_helper]
[  242.669841] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
29
[amdgpu]
[  242.669842] Code: 83 c8 ff e9 59 c9 f9 ff 48 c7 c7 b8 4a 7e c0 e8 bc 2c =
fb
e0 0f 0b 83 c8 ff e9 43 c9 f9 ff 48 c7 c7 b8 4a 7e c0 e8 a6 2c fb e0 <0f> 0=
b 80
bb 93 01 00 00 00 75 05 e9 29 ed f9 ff 48 8b 83 80 02 00
[  242.669843] RSP: 0018:ffffa7744350bb18 EFLAGS: 00010286
[  242.669843] RAX: 0000000000000024 RBX: ffff8b6be7aa1000 RCX:
0000000000000006
[  242.669844] RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff8b712ea99a10
[  242.669844] RBP: ffff8b6be7aa1000 R08: 000000000001a53c R09:
0000000000000001
[  242.669844] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff8b6f046181b8
[  242.669845] R13: 0000000000000000 R14: ffff8b6be7aa1000 R15:
ffff8b6f04619318
[  242.669845] FS:  0000000000000000(0000) GS:ffff8b712ea80000(0000)
knlGS:0000000000000000
[  242.669846] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  242.669846] CR2: 0000000804158a48 CR3: 00000007b62f4000 CR4:
00000000003406e0
[  242.669847] Call Trace:
[  242.669887]  dcn10_pipe_control_lock.part.0+0x69/0x70 [amdgpu]
[  242.669925]  dc_commit_updates_for_stream+0x901/0xbe0 [amdgpu]
[  242.669963]  amdgpu_dm_commit_planes.constprop.0+0x6b4/0x880 [amdgpu]
[  242.670001]  amdgpu_dm_atomic_commit_tail+0x9be/0xd30 [amdgpu]
[  242.670002]  ? __switch_to_asm+0x40/0x70
[  242.670003]  ? __switch_to_asm+0x34/0x70
[  242.670003]  ? __switch_to_asm+0x40/0x70
[  242.670004]  ? __switch_to_asm+0x34/0x70
[  242.670004]  ? __switch_to_asm+0x40/0x70
[  242.670005]  ? __switch_to_asm+0x34/0x70
[  242.670005]  ? __switch_to_asm+0x40/0x70
[  242.670006]  ? __switch_to_asm+0x34/0x70
[  242.670006]  ? __switch_to_asm+0x40/0x70
[  242.670008]  ? trace_hardirqs_off_thunk+0x1a/0x33
[  242.670009]  ? wait_for_completion_timeout+0xf3/0x110
[  242.670010]  ? finish_task_switch+0x7d/0x290
[  242.670014]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[  242.670017]  commit_tail+0x3c/0x70 [drm_kms_helper]
[  242.670019]  process_one_work+0x1df/0x3c0
[  242.670020]  worker_thread+0x4d/0x400
[  242.670021]  kthread+0xf9/0x130
[  242.670021]  ? process_one_work+0x3c0/0x3c0
[  242.670022]  ? kthread_park+0x80/0x80
[  242.670023]  ret_from_fork+0x27/0x50
[  242.670024] ---[ end trace 253676aaf03c94d7 ]---
[  242.670609] [drm] pstate TEST_DEBUG_DATA: 0x36F60000
[  242.670610] ------------[ cut here ]------------
[  242.670658] WARNING: CPU: 2 PID: 183 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
[  242.670658] Modules linked in: vhost_net vhost tap fuse tun ebtable_filt=
er
ebtables ip6table_filter ip6_tables iptable_filter ip_tables x_tables bpfil=
ter
scsi_transport_iscsi af_packet br_netfilter bridge stp llc iscsi_ibft
iscsi_boot_sysfs msr raid1 dm_raid raid456 md_mod async_raid6_recov
async_memcpy async_pq async_xor async_tx nls_iso8859_1 nls_cp437 vfat fat
edac_mce_amd kvm_amd ccp kvm irqbypass crct10dif_pclmul crc32_pclmul
ghash_clmulni_intel aesni_intel snd_hda_codec_realtek snd_hda_codec_generic
aes_x86_64 crypto_simd ledtrig_audio snd_hda_codec_hdmi cryptd glue_helper
eeepc_wmi snd_hda_intel asus_wmi pcspkr sparse_keymap rfkill snd_hda_codec
sp5100_tco wmi_bmof k10temp i2c_piix4 snd_hda_core snd_hwdep snd_pcm snd_ti=
mer
snd soundcore r8169 joydev realtek libphy gpio_amdpt gpio_generic pcc_cpufr=
eq
button acpi_cpufreq hid_logitech_hidpp btrfs libcrc32c xor uas usb_storage
raid6_pq hid_logitech_dj hid_generic usbhid amdgpu crc32c_intel amd_iommu_v2
gpu_sched i2c_algo_bit ttm
[  242.670670]  drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
drm xhci_pci xhci_hcd usbcore wmi video pinctrl_amd sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
[  242.670673] CPU: 2 PID: 183 Comm: kworker/u64:10 Tainted: G        W=20=
=20=20=20=20=20=20=20
5.2.11-1-default #1 openSUSE Tumbleweed (unreleased)
[  242.670673] Hardware name: System manufacturer System Product Name/PRIME
B450M-A, BIOS 1804 07/29/2019
[  242.670677] Workqueue: events_unbound commit_work [drm_kms_helper]
[  242.670718] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
29
[amdgpu]
[  242.670719] Code: 83 c8 ff e9 59 c9 f9 ff 48 c7 c7 b8 4a 7e c0 e8 bc 2c =
fb
e0 0f 0b 83 c8 ff e9 43 c9 f9 ff 48 c7 c7 b8 4a 7e c0 e8 a6 2c fb e0 <0f> 0=
b 80
bb 93 01 00 00 00 75 05 e9 29 ed f9 ff 48 8b 83 80 02 00
[  242.670720] RSP: 0018:ffffa7744350bb38 EFLAGS: 00010282
[  242.670721] RAX: 0000000000000024 RBX: ffff8b6be7aa1000 RCX:
0000000000000006
[  242.670721] RDX: 0000000000000007 RSI: 0000000000000096 RDI:
ffff8b712ea99a10
[  242.670721] RBP: ffffa7744350bbb8 R08: 000000000001a569 R09:
0000000000000001
[  242.670722] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff8b6f046181b8
[  242.670722] R13: 0000000000000000 R14: ffff8b6be7aa1000 R15:
ffff8b6f04619318
[  242.670723] FS:  0000000000000000(0000) GS:ffff8b712ea80000(0000)
knlGS:0000000000000000
[  242.670723] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  242.670724] CR2: 0000000804158a48 CR3: 00000007b62f4000 CR4:
00000000003406e0
[  242.670727] Call Trace:
[  242.670765]  dc_commit_updates_for_stream+0x901/0xbe0 [amdgpu]
[  242.670803]  amdgpu_dm_commit_planes.constprop.0+0x6b4/0x880 [amdgpu]
[  242.670841]  amdgpu_dm_atomic_commit_tail+0x9be/0xd30 [amdgpu]
[  242.670842]  ? __switch_to_asm+0x40/0x70
[  242.670843]  ? __switch_to_asm+0x34/0x70
[  242.670844]  ? __switch_to_asm+0x40/0x70
[  242.670844]  ? __switch_to_asm+0x34/0x70
[  242.670846]  ? __switch_to_asm+0x40/0x70
[  242.670847]  ? __switch_to_asm+0x34/0x70
[  242.670847]  ? __switch_to_asm+0x40/0x70
[  242.670848]  ? __switch_to_asm+0x34/0x70
[  242.670848]  ? __switch_to_asm+0x40/0x70
[  242.670850]  ? trace_hardirqs_off_thunk+0x1a/0x33
[  242.670851]  ? wait_for_completion_timeout+0xf3/0x110
[  242.670852]  ? finish_task_switch+0x7d/0x290
[  242.670856]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[  242.670860]  commit_tail+0x3c/0x70 [drm_kms_helper]
[  242.670861]  process_one_work+0x1df/0x3c0
[  242.670862]  worker_thread+0x4d/0x400
[  242.670863]  kthread+0xf9/0x130
[  242.670864]  ? process_one_work+0x3c0/0x3c0
[  242.670865]  ? kthread_park+0x80/0x80
[  242.670865]  ret_from_fork+0x27/0x50
[  242.670866] ---[ end trace 253676aaf03c94d8 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15680579111.1cfE92.30293
Date: Mon, 9 Sep 2019 19:38:31 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111487#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD vega - display off/on -&gt; solid green display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111487">bug 11148=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bzz&#64;atomicbee.cz" title=3D"bzz &lt;bzz&#64;atomicbee.cz&gt;"> <span cla=
ss=3D"fn">bzz</span></a>
</span></b>
        <pre>New kernel, problem still here:


[  242.669782] WARNING: CPU: 2 PID: 183 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
[  242.669782] Modules linked in: vhost_net vhost tap fuse tun ebtable_filt=
er
ebtables ip6table_filter ip6_tables iptable_filter ip_tables x_tables bpfil=
ter
scsi_transport_iscsi af_packet br_netfilter bridge stp llc iscsi_ibft
iscsi_boot_sysfs msr raid1 dm_raid raid456 md_mod async_raid6_recov
async_memcpy async_pq async_xor async_tx nls_iso8859_1 nls_cp437 vfat fat
edac_mce_amd kvm_amd ccp kvm irqbypass crct10dif_pclmul crc32_pclmul
ghash_clmulni_intel aesni_intel snd_hda_codec_realtek snd_hda_codec_generic
aes_x86_64 crypto_simd ledtrig_audio snd_hda_codec_hdmi cryptd glue_helper
eeepc_wmi snd_hda_intel asus_wmi pcspkr sparse_keymap rfkill snd_hda_codec
sp5100_tco wmi_bmof k10temp i2c_piix4 snd_hda_core snd_hwdep snd_pcm snd_ti=
mer
snd soundcore r8169 joydev realtek libphy gpio_amdpt gpio_generic pcc_cpufr=
eq
button acpi_cpufreq hid_logitech_hidpp btrfs libcrc32c xor uas usb_storage
raid6_pq hid_logitech_dj hid_generic usbhid amdgpu crc32c_intel amd_iommu_v2
gpu_sched i2c_algo_bit ttm
[  242.669793]  drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
drm xhci_pci xhci_hcd usbcore wmi video pinctrl_amd sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
[  242.669796] CPU: 2 PID: 183 Comm: kworker/u64:10 Tainted: G        W=20=
=20=20=20=20=20=20=20
5.2.11-1-default #1 openSUSE Tumbleweed (unreleased)
[  242.669797] Hardware name: System manufacturer System Product Name/PRIME
B450M-A, BIOS 1804 07/29/2019
[  242.669801] Workqueue: events_unbound commit_work [drm_kms_helper]
[  242.669841] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
29
[amdgpu]
[  242.669842] Code: 83 c8 ff e9 59 c9 f9 ff 48 c7 c7 b8 4a 7e c0 e8 bc 2c =
fb
e0 0f 0b 83 c8 ff e9 43 c9 f9 ff 48 c7 c7 b8 4a 7e c0 e8 a6 2c fb e0 &lt;0f=
&gt; 0b 80
bb 93 01 00 00 00 75 05 e9 29 ed f9 ff 48 8b 83 80 02 00
[  242.669843] RSP: 0018:ffffa7744350bb18 EFLAGS: 00010286
[  242.669843] RAX: 0000000000000024 RBX: ffff8b6be7aa1000 RCX:
0000000000000006
[  242.669844] RDX: 0000000000000007 RSI: 0000000000000092 RDI:
ffff8b712ea99a10
[  242.669844] RBP: ffff8b6be7aa1000 R08: 000000000001a53c R09:
0000000000000001
[  242.669844] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff8b6f046181b8
[  242.669845] R13: 0000000000000000 R14: ffff8b6be7aa1000 R15:
ffff8b6f04619318
[  242.669845] FS:  0000000000000000(0000) GS:ffff8b712ea80000(0000)
knlGS:0000000000000000
[  242.669846] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  242.669846] CR2: 0000000804158a48 CR3: 00000007b62f4000 CR4:
00000000003406e0
[  242.669847] Call Trace:
[  242.669887]  dcn10_pipe_control_lock.part.0+0x69/0x70 [amdgpu]
[  242.669925]  dc_commit_updates_for_stream+0x901/0xbe0 [amdgpu]
[  242.669963]  amdgpu_dm_commit_planes.constprop.0+0x6b4/0x880 [amdgpu]
[  242.670001]  amdgpu_dm_atomic_commit_tail+0x9be/0xd30 [amdgpu]
[  242.670002]  ? __switch_to_asm+0x40/0x70
[  242.670003]  ? __switch_to_asm+0x34/0x70
[  242.670003]  ? __switch_to_asm+0x40/0x70
[  242.670004]  ? __switch_to_asm+0x34/0x70
[  242.670004]  ? __switch_to_asm+0x40/0x70
[  242.670005]  ? __switch_to_asm+0x34/0x70
[  242.670005]  ? __switch_to_asm+0x40/0x70
[  242.670006]  ? __switch_to_asm+0x34/0x70
[  242.670006]  ? __switch_to_asm+0x40/0x70
[  242.670008]  ? trace_hardirqs_off_thunk+0x1a/0x33
[  242.670009]  ? wait_for_completion_timeout+0xf3/0x110
[  242.670010]  ? finish_task_switch+0x7d/0x290
[  242.670014]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[  242.670017]  commit_tail+0x3c/0x70 [drm_kms_helper]
[  242.670019]  process_one_work+0x1df/0x3c0
[  242.670020]  worker_thread+0x4d/0x400
[  242.670021]  kthread+0xf9/0x130
[  242.670021]  ? process_one_work+0x3c0/0x3c0
[  242.670022]  ? kthread_park+0x80/0x80
[  242.670023]  ret_from_fork+0x27/0x50
[  242.670024] ---[ end trace 253676aaf03c94d7 ]---
[  242.670609] [drm] pstate TEST_DEBUG_DATA: 0x36F60000
[  242.670610] ------------[ cut here ]------------
[  242.670658] WARNING: CPU: 2 PID: 183 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:854
dcn10_verify_allow_pstate_change_high.cold+0xc/0x229 [amdgpu]
[  242.670658] Modules linked in: vhost_net vhost tap fuse tun ebtable_filt=
er
ebtables ip6table_filter ip6_tables iptable_filter ip_tables x_tables bpfil=
ter
scsi_transport_iscsi af_packet br_netfilter bridge stp llc iscsi_ibft
iscsi_boot_sysfs msr raid1 dm_raid raid456 md_mod async_raid6_recov
async_memcpy async_pq async_xor async_tx nls_iso8859_1 nls_cp437 vfat fat
edac_mce_amd kvm_amd ccp kvm irqbypass crct10dif_pclmul crc32_pclmul
ghash_clmulni_intel aesni_intel snd_hda_codec_realtek snd_hda_codec_generic
aes_x86_64 crypto_simd ledtrig_audio snd_hda_codec_hdmi cryptd glue_helper
eeepc_wmi snd_hda_intel asus_wmi pcspkr sparse_keymap rfkill snd_hda_codec
sp5100_tco wmi_bmof k10temp i2c_piix4 snd_hda_core snd_hwdep snd_pcm snd_ti=
mer
snd soundcore r8169 joydev realtek libphy gpio_amdpt gpio_generic pcc_cpufr=
eq
button acpi_cpufreq hid_logitech_hidpp btrfs libcrc32c xor uas usb_storage
raid6_pq hid_logitech_dj hid_generic usbhid amdgpu crc32c_intel amd_iommu_v2
gpu_sched i2c_algo_bit ttm
[  242.670670]  drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops
drm xhci_pci xhci_hcd usbcore wmi video pinctrl_amd sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua efivarfs
[  242.670673] CPU: 2 PID: 183 Comm: kworker/u64:10 Tainted: G        W=20=
=20=20=20=20=20=20=20
5.2.11-1-default #1 openSUSE Tumbleweed (unreleased)
[  242.670673] Hardware name: System manufacturer System Product Name/PRIME
B450M-A, BIOS 1804 07/29/2019
[  242.670677] Workqueue: events_unbound commit_work [drm_kms_helper]
[  242.670718] RIP: 0010:dcn10_verify_allow_pstate_change_high.cold+0xc/0x2=
29
[amdgpu]
[  242.670719] Code: 83 c8 ff e9 59 c9 f9 ff 48 c7 c7 b8 4a 7e c0 e8 bc 2c =
fb
e0 0f 0b 83 c8 ff e9 43 c9 f9 ff 48 c7 c7 b8 4a 7e c0 e8 a6 2c fb e0 &lt;0f=
&gt; 0b 80
bb 93 01 00 00 00 75 05 e9 29 ed f9 ff 48 8b 83 80 02 00
[  242.670720] RSP: 0018:ffffa7744350bb38 EFLAGS: 00010282
[  242.670721] RAX: 0000000000000024 RBX: ffff8b6be7aa1000 RCX:
0000000000000006
[  242.670721] RDX: 0000000000000007 RSI: 0000000000000096 RDI:
ffff8b712ea99a10
[  242.670721] RBP: ffffa7744350bbb8 R08: 000000000001a569 R09:
0000000000000001
[  242.670722] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff8b6f046181b8
[  242.670722] R13: 0000000000000000 R14: ffff8b6be7aa1000 R15:
ffff8b6f04619318
[  242.670723] FS:  0000000000000000(0000) GS:ffff8b712ea80000(0000)
knlGS:0000000000000000
[  242.670723] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  242.670724] CR2: 0000000804158a48 CR3: 00000007b62f4000 CR4:
00000000003406e0
[  242.670727] Call Trace:
[  242.670765]  dc_commit_updates_for_stream+0x901/0xbe0 [amdgpu]
[  242.670803]  amdgpu_dm_commit_planes.constprop.0+0x6b4/0x880 [amdgpu]
[  242.670841]  amdgpu_dm_atomic_commit_tail+0x9be/0xd30 [amdgpu]
[  242.670842]  ? __switch_to_asm+0x40/0x70
[  242.670843]  ? __switch_to_asm+0x34/0x70
[  242.670844]  ? __switch_to_asm+0x40/0x70
[  242.670844]  ? __switch_to_asm+0x34/0x70
[  242.670846]  ? __switch_to_asm+0x40/0x70
[  242.670847]  ? __switch_to_asm+0x34/0x70
[  242.670847]  ? __switch_to_asm+0x40/0x70
[  242.670848]  ? __switch_to_asm+0x34/0x70
[  242.670848]  ? __switch_to_asm+0x40/0x70
[  242.670850]  ? trace_hardirqs_off_thunk+0x1a/0x33
[  242.670851]  ? wait_for_completion_timeout+0xf3/0x110
[  242.670852]  ? finish_task_switch+0x7d/0x290
[  242.670856]  ? commit_tail+0x3c/0x70 [drm_kms_helper]
[  242.670860]  commit_tail+0x3c/0x70 [drm_kms_helper]
[  242.670861]  process_one_work+0x1df/0x3c0
[  242.670862]  worker_thread+0x4d/0x400
[  242.670863]  kthread+0xf9/0x130
[  242.670864]  ? process_one_work+0x3c0/0x3c0
[  242.670865]  ? kthread_park+0x80/0x80
[  242.670865]  ret_from_fork+0x27/0x50
[  242.670866] ---[ end trace 253676aaf03c94d8 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15680579111.1cfE92.30293--

--===============1055735518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1055735518==--
