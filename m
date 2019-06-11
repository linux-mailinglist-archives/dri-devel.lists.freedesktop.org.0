Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1161C3C3DC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 08:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3778A89137;
	Tue, 11 Jun 2019 06:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 40EA689137
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 06:17:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3D45C72167; Tue, 11 Jun 2019 06:17:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110886] After S3 resume, kernel:
 [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
 [CRTC:57:crtc-0] flip_done timed out
Date: Tue, 11 Jun 2019 06:17:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kai.heng.feng@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110886-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1054565636=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1054565636==
Content-Type: multipart/alternative; boundary="15602338601.cbBC919.30838"
Content-Transfer-Encoding: 7bit


--15602338601.cbBC919.30838
Date: Tue, 11 Jun 2019 06:17:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110886

            Bug ID: 110886
           Summary: After S3 resume, kernel:
                    [drm:drm_atomic_helper_wait_for_flip_done
                    [drm_kms_helper]] *ERROR* [CRTC:57:crtc-0] flip_done
                    timed out
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: kai.heng.feng@canonical.com

System: HP ProBook 645 G4
APU: Ryzen 3 PRO 2300U

After system S3 resume, the system may freeze:

Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:57:crtc-0] flip_done timed out
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[CRTC:57:crtc-0] flip_done timed out
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[CONNECTOR:65:eDP-1] flip_done timed out
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[PLANE:50:plane-3] flip_done timed out
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: WARNING: CPU: 1 PID: 1058 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5580
amdgpu_dm_atomic_commit_tail+0x19f4/0x1a80 [amdgpu]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: Modules linked in: ccm
nls_iso8859_1 amdgpu snd_hda_codec_conexant arc4 iwlmvm snd_hda_codec_gener=
ic
amd_iommu_v2 ledtrig_audio snd_hda_codec_hdmi gpu_sched kvm_amd snd_hda_int=
el
i2c_
algo_bit snd_hda_codec ccp ttm snd_hwdep kvm snd_hda_core drm_kms_helper
mac80211 snd_pcm irqbypass syscopyarea snd_seq sysfillrect iwlwifi snd_timer
sysimgblt snd_seq_device snd fb_sys_fops drm crct10dif_pclmul crc32_pclmul =
so
undcore cfg80211 ghash_clmulni_intel rtsx_pci_ms aesni_intel hp_wmi
sparse_keymap k10temp wmi_bmof memstick aes_x86_64 ucsi_acpi glue_helper
hp_accel typec_ucsi typec crypto_simd cryptd video hp_wireless wmi joydev
input_leds l
is3lv02d mac_hid input_polldev serio_raw sch_fq_codel parport_pc ppdev lp
parport ip_tables x_tables autofs4 rtsx_pci_sdmmc psmouse i2c_piix4 ahci
rtsx_pci libahci r8169 realtek i2c_hid hid
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: CPU: 1 PID: 1058 Comm:
kworker/u32:6 Not tainted 5.2.0-rc1+ #2
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: Hardware name: HP HP ProBook 645
G4/8401, BIOS Q82 Ver. 01.07.01 05/06/2019
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: Workqueue: events_unbound
async_run_entry_fn
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x19f4/0x1a80 [amdgpu]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: Code: ff ff 8b b0 90 04 00 00 4=
8 c7
c7 61 bc bf c0 e8 c2 0a b5 ff 0f b6 85 06 fe ff ff 88 85 08 fe ff ff 49 8b =
45
08 e9 f9 f1 ff ff <0f> 0b e9 1d f3 ff ff 0f 0b 48 8b 06 0f b6 8e e0 0
1 00 00 bf 04 00
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: RSP: 0018:ffffb1e4c243b8e0 EFLA=
GS:
00010002
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: RAX: 0000000000000002 RBX:
0000000000000202 RCX: ffff9a8fd18b6970
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: RDX: 0000000000000001 RSI:
0000000000000202 RDI: ffff9a8fd02a5958
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: RBP: ffffb1e4c243bb20 R08:
ffffb1e4c243b7f4 R09: 0000000000000000
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: R10: 0000000000000000 R11:
ffffb1e4c243b838 R12: ffff9a8fe2ba0400
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: R13: ffff9a8fe1495f80 R14:
ffff9a8fd18b6800 R15: ffff9a8fd2280000
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: FS:  0000000000000000(0000)
GS:ffff9a8fe7c40000(0000) knlGS:0000000000000000
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: CR2: 0000000000000000 CR3:
000000020f434000 CR4: 00000000003406e0
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: Call Trace:
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  commit_tail+0x42/0x70
[drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ? commit_tail+0x42/0x70
[drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
drm_atomic_helper_commit+0x113/0x120 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  amdgpu_dm_atomic_commit+0xb1/0=
xf0
[amdgpu]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  drm_atomic_commit+0x4a/0x50 [d=
rm]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
restore_fbdev_mode_atomic+0x1bf/0x1d0 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  restore_fbdev_mode+0x4e/0x160
[drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ? _cond_resched+0x19/0x30
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
drm_fb_helper_restore_fbdev_mode_unlocked+0x4e/0xa0 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  drm_fb_helper_set_par+0x2d/0x50
[drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
drm_fb_helper_hotplug_event.part.41+0x97/0xc0 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
drm_fb_helper_output_poll_changed+0x23/0x30 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
drm_kms_helper_hotplug_event+0x2a/0x40 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  amdgpu_device_resume+0x319/0x3=
a0
[amdgpu]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  amdgpu_pmops_resume+0x31/0x60
[amdgpu]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  pci_pm_resume+0x6d/0xa0
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ? pci_pm_suspend_late+0x40/0x40
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  dpm_run_callback+0x5b/0x150
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  device_resume+0xb8/0x200
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  async_resume+0x1d/0x30
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  async_run_entry_fn+0x3c/0x150
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  process_one_work+0x20f/0x410
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  worker_thread+0x34/0x400
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  kthread+0x120/0x140
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ? process_one_work+0x410/0x410
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ? __kthread_parkme+0x70/0x70
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ret_from_fork+0x22/0x40
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: ---[ end trace 55daf5798b2f5f1a
]---

Test conducted on latest amdgpu/amd-staging-drm-next, it's commit
40cc64619a2580b26f924bcabdefd555e7831a14 as of now.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602338601.cbBC919.30838
Date: Tue, 11 Jun 2019 06:17:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After S3 resume, kernel: [drm:drm_atomic_helper_wait_for_=
flip_done [drm_kms_helper]] *ERROR* [CRTC:57:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886">110886</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>After S3 resume, kernel: [drm:drm_atomic_helper_wait_for_flip=
_done [drm_kms_helper]] *ERROR* [CRTC:57:crtc-0] flip_done timed out
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>kai.heng.feng&#64;canonical.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>System: HP ProBook 645 G4
APU: Ryzen 3 PRO 2300U

After system S3 resume, the system may freeze:

Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:
[drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:57:crtc-0] flip_done timed out
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[CRTC:57:crtc-0] flip_done timed out
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[CONNECTOR:65:eDP-1] flip_done timed out
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:
[drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper]] *ERROR*
[PLANE:50:plane-3] flip_done timed out
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: WARNING: CPU: 1 PID: 1058 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5580
amdgpu_dm_atomic_commit_tail+0x19f4/0x1a80 [amdgpu]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: Modules linked in: ccm
nls_iso8859_1 amdgpu snd_hda_codec_conexant arc4 iwlmvm snd_hda_codec_gener=
ic
amd_iommu_v2 ledtrig_audio snd_hda_codec_hdmi gpu_sched kvm_amd snd_hda_int=
el
i2c_
algo_bit snd_hda_codec ccp ttm snd_hwdep kvm snd_hda_core drm_kms_helper
mac80211 snd_pcm irqbypass syscopyarea snd_seq sysfillrect iwlwifi snd_timer
sysimgblt snd_seq_device snd fb_sys_fops drm crct10dif_pclmul crc32_pclmul =
so
undcore cfg80211 ghash_clmulni_intel rtsx_pci_ms aesni_intel hp_wmi
sparse_keymap k10temp wmi_bmof memstick aes_x86_64 ucsi_acpi glue_helper
hp_accel typec_ucsi typec crypto_simd cryptd video hp_wireless wmi joydev
input_leds l
is3lv02d mac_hid input_polldev serio_raw sch_fq_codel parport_pc ppdev lp
parport ip_tables x_tables autofs4 rtsx_pci_sdmmc psmouse i2c_piix4 ahci
rtsx_pci libahci r8169 realtek i2c_hid hid
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: CPU: 1 PID: 1058 Comm:
kworker/u32:6 Not tainted 5.2.0-rc1+ #2
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: Hardware name: HP HP ProBook 645
G4/8401, BIOS Q82 Ver. 01.07.01 05/06/2019
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: Workqueue: events_unbound
async_run_entry_fn
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x19f4/0x1a80 [amdgpu]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: Code: ff ff 8b b0 90 04 00 00 4=
8 c7
c7 61 bc bf c0 e8 c2 0a b5 ff 0f b6 85 06 fe ff ff 88 85 08 fe ff ff 49 8b =
45
08 e9 f9 f1 ff ff &lt;0f&gt; 0b e9 1d f3 ff ff 0f 0b 48 8b 06 0f b6 8e e0 0
1 00 00 bf 04 00
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: RSP: 0018:ffffb1e4c243b8e0 EFLA=
GS:
00010002
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: RAX: 0000000000000002 RBX:
0000000000000202 RCX: ffff9a8fd18b6970
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: RDX: 0000000000000001 RSI:
0000000000000202 RDI: ffff9a8fd02a5958
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: RBP: ffffb1e4c243bb20 R08:
ffffb1e4c243b7f4 R09: 0000000000000000
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: R10: 0000000000000000 R11:
ffffb1e4c243b838 R12: ffff9a8fe2ba0400
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: R13: ffff9a8fe1495f80 R14:
ffff9a8fd18b6800 R15: ffff9a8fd2280000
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: FS:  0000000000000000(0000)
GS:ffff9a8fe7c40000(0000) knlGS:0000000000000000
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: CR2: 0000000000000000 CR3:
000000020f434000 CR4: 00000000003406e0
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: Call Trace:
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  commit_tail+0x42/0x70
[drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ? commit_tail+0x42/0x70
[drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
drm_atomic_helper_commit+0x113/0x120 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  amdgpu_dm_atomic_commit+0xb1/0=
xf0
[amdgpu]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  drm_atomic_commit+0x4a/0x50 [d=
rm]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
restore_fbdev_mode_atomic+0x1bf/0x1d0 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  restore_fbdev_mode+0x4e/0x160
[drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ? _cond_resched+0x19/0x30
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
drm_fb_helper_restore_fbdev_mode_unlocked+0x4e/0xa0 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  drm_fb_helper_set_par+0x2d/0x50
[drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
drm_fb_helper_hotplug_event.part.41+0x97/0xc0 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
drm_fb_helper_output_poll_changed+0x23/0x30 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:=20
drm_kms_helper_hotplug_event+0x2a/0x40 [drm_kms_helper]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  amdgpu_device_resume+0x319/0x3=
a0
[amdgpu]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  amdgpu_pmops_resume+0x31/0x60
[amdgpu]
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  pci_pm_resume+0x6d/0xa0
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ? pci_pm_suspend_late+0x40/0x40
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  dpm_run_callback+0x5b/0x150
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  device_resume+0xb8/0x200
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  async_resume+0x1d/0x30
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  async_run_entry_fn+0x3c/0x150
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  process_one_work+0x20f/0x410
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  worker_thread+0x34/0x400
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  kthread+0x120/0x140
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ? process_one_work+0x410/0x410
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ? __kthread_parkme+0x70/0x70
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel:  ret_from_fork+0x22/0x40
Jun 11 01:40:21 u-HP-ProBook-645-G4 kernel: ---[ end trace 55daf5798b2f5f1a
]---

Test conducted on latest amdgpu/amd-staging-drm-next, it's commit
40cc64619a2580b26f924bcabdefd555e7831a14 as of now.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602338601.cbBC919.30838--

--===============1054565636==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1054565636==--
