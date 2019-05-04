Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B3113B19
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2019 18:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1247989363;
	Sat,  4 May 2019 16:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 490E389363
 for <dri-devel@lists.freedesktop.org>; Sat,  4 May 2019 16:07:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4380E7215A; Sat,  4 May 2019 16:07:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110610] kernel BUG at
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5611
Date: Sat, 04 May 2019 16:07:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ernstp@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110610-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0360620792=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0360620792==
Content-Type: multipart/alternative; boundary="15569860481.5d6f.23533"
Content-Transfer-Encoding: 7bit


--15569860481.5d6f.23533
Date: Sat, 4 May 2019 16:07:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110610

            Bug ID: 110610
           Summary: kernel BUG at
                    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu
                    _dm.c:5611
           Product: DRI
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: ernstp@gmail.com

Hi,

I was playing with the experimental fractional scaling for X11 in Gnome in
Ubuntu Disco. When I logged out I got this error.

xserver-xorg-video-amdgpu                  19.0.1+git1903191844.bd4ffd4
linux-image-5.0.0-14-generic               5.0.0-14.15
libgl1-mesa-dri:amd64                      19.0.2-1ubuntu1
libdrm-amdgpu1:amd64                       2.4.97-1ubuntu1

------------[ cut here ]------------
kernel BUG at drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5=
611!
invalid opcode: 0000 [#1] SMP NOPTI
CPU: 10 PID: 4211 Comm: Xorg Not tainted 5.0.0-14-generic #15-Ubuntu
Hardware name: System manufacturer System Product Name/PRIME X370-PRO, BIOS
4008 04/13/2018
RIP: 0010:dm_update_crtcs_state+0x60d/0x670 [amdgpu]
Code: bc fc ff ff 48 85 db 0f 84 7e fd ff ff 48 c7 45 a0 00 00 00 00 48 c7 =
45
c0 00 00 00 00 48 c7 45 b8 00 00 00 00 e9 65 fe ff ff <0f> 0b b8 ea ff ff f=
f 48
8b 7d b8 48 85 ff 0f 84 4b fc ff ff 89 45
RSP: 0018:ffff9c71c9763ab0 EFLAGS: 00010246
RAX: 0000000000000001 RBX: 0000000000000000 RCX: 0000000000002ad8
RDX: 0000000000002ad7 RSI: ffff8df77eca7160 RDI: ffff8df77e406e80
RBP: ffff9c71c9763b20 R08: 0000000000027160 R09: ffffffffc0882796
R10: fffffb221fd26a00 R11: 00000000f0000080 R12: ffff8df7749ad800
R13: ffff8df774076800 R14: 0000000000000000 R15: ffff8df71c768c80
FS:  00007f009b637a80(0000) GS:ffff8df77ec80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f009ba3d5c8 CR3: 000000060440e000 CR4: 00000000003406e0
Call Trace:
 amdgpu_dm_atomic_check+0x1c3/0x460 [amdgpu]
 drm_atomic_check_only+0x59e/0x7c0 [drm]
 drm_atomic_commit+0x18/0x50 [drm]
 restore_fbdev_mode_atomic+0x1bf/0x1d0 [drm_kms_helper]
 restore_fbdev_mode+0x51/0x160 [drm_kms_helper]
 ? _cond_resched+0x19/0x30
 drm_fb_helper_restore_fbdev_mode_unlocked+0x4e/0xa0 [drm_kms_helper]
 drm_fb_helper_set_par+0x2d/0x50 [drm_kms_helper]
 drm_fb_helper_hotplug_event.part.38+0x97/0xc0 [drm_kms_helper]
 drm_fb_helper_restore_fbdev_mode_unlocked+0x7a/0xa0 [drm_kms_helper]
 drm_fb_helper_lastclose+0x15/0x20 [drm_kms_helper]
 amdgpu_driver_lastclose_kms+0xe/0x20 [amdgpu]
 drm_lastclose+0x35/0x100 [drm]
 drm_release+0xe8/0x120 [drm]
 __fput+0xbc/0x230
 ____fput+0xe/0x10
 task_work_run+0x9d/0xc0
 do_exit+0x2da/0xb30
 ? handle_mm_fault+0xe1/0x210
 do_group_exit+0x43/0xb0
 __x64_sys_exit_group+0x18/0x20
 do_syscall_64+0x5a/0x110
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f009bb4a926
Code: Bad RIP value.
RSP: 002b:00007ffff209d968 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f009bc4f6d0 RCX: 00007f009bb4a926
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 0000000000000000 R08: 00000000000000e7 R09: fffffffffffffc78
R10: 0000000000000042 R11: 0000000000000246 R12: 00007f009bc4f6d0
R13: 0000000000000603 R14: 00007f009bc53108 R15: 0000000000000000
Modules linked in: aufs overlay edac_mce_amd kvm irqbypass nls_iso8859_1
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio amdgpu
snd_hda_codec_hdmi input_leds joydev snd_hda_intel snd_hda_codec
crct10dif_pclmul snd_hda_core crc32_pclmul snd_hwdep ghash_clmulni_intel
snd_pcm chash snd_seq_midi amd_iommu_v2 snd_seq_midi_event aesni_intel
gpu_sched snd_rawmidi ttm aes_x86_64 drm_kms_helper crypto_simd cryptd
eeepc_wmi snd_seq glue_helper asus_wmi drm sparse_keymap video snd_seq_devi=
ce
mxm_wmi k10temp wmi_bmof snd_timer fb_sys_fops syscopyarea sysfillrect
sysimgblt ccp snd soundcore mac_hid sch_fq_codel parport_pc ppdev lp parport
ip_tables x_tables autofs4 hid_generic usbhid hid igb i2c_piix4 i2c_algo_bit
nvme ahci dca libahci nvme_core gpio_amdpt wmi gpio_generic
---[ end trace 721f50ce38f2bef8 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569860481.5d6f.23533
Date: Sat, 4 May 2019 16:07:28 +0000
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
   title=3D"NEW - kernel BUG at drivers/gpu/drm/amd/amdgpu/../display/amdgp=
u_dm/amdgpu_dm.c:5611"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110610">110610</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>kernel BUG at drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm=
/amdgpu_dm.c:5611
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>ernstp&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi,

I was playing with the experimental fractional scaling for X11 in Gnome in
Ubuntu Disco. When I logged out I got this error.

xserver-xorg-video-amdgpu                  19.0.1+git1903191844.bd4ffd4
linux-image-5.0.0-14-generic               5.0.0-14.15
libgl1-mesa-dri:amd64                      19.0.2-1ubuntu1
libdrm-amdgpu1:amd64                       2.4.97-1ubuntu1

------------[ cut here ]------------
kernel BUG at drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5=
611!
invalid opcode: 0000 [#1] SMP NOPTI
CPU: 10 PID: 4211 Comm: Xorg Not tainted 5.0.0-14-generic #15-Ubuntu
Hardware name: System manufacturer System Product Name/PRIME X370-PRO, BIOS
4008 04/13/2018
RIP: 0010:dm_update_crtcs_state+0x60d/0x670 [amdgpu]
Code: bc fc ff ff 48 85 db 0f 84 7e fd ff ff 48 c7 45 a0 00 00 00 00 48 c7 =
45
c0 00 00 00 00 48 c7 45 b8 00 00 00 00 e9 65 fe ff ff &lt;0f&gt; 0b b8 ea f=
f ff ff 48
8b 7d b8 48 85 ff 0f 84 4b fc ff ff 89 45
RSP: 0018:ffff9c71c9763ab0 EFLAGS: 00010246
RAX: 0000000000000001 RBX: 0000000000000000 RCX: 0000000000002ad8
RDX: 0000000000002ad7 RSI: ffff8df77eca7160 RDI: ffff8df77e406e80
RBP: ffff9c71c9763b20 R08: 0000000000027160 R09: ffffffffc0882796
R10: fffffb221fd26a00 R11: 00000000f0000080 R12: ffff8df7749ad800
R13: ffff8df774076800 R14: 0000000000000000 R15: ffff8df71c768c80
FS:  00007f009b637a80(0000) GS:ffff8df77ec80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f009ba3d5c8 CR3: 000000060440e000 CR4: 00000000003406e0
Call Trace:
 amdgpu_dm_atomic_check+0x1c3/0x460 [amdgpu]
 drm_atomic_check_only+0x59e/0x7c0 [drm]
 drm_atomic_commit+0x18/0x50 [drm]
 restore_fbdev_mode_atomic+0x1bf/0x1d0 [drm_kms_helper]
 restore_fbdev_mode+0x51/0x160 [drm_kms_helper]
 ? _cond_resched+0x19/0x30
 drm_fb_helper_restore_fbdev_mode_unlocked+0x4e/0xa0 [drm_kms_helper]
 drm_fb_helper_set_par+0x2d/0x50 [drm_kms_helper]
 drm_fb_helper_hotplug_event.part.38+0x97/0xc0 [drm_kms_helper]
 drm_fb_helper_restore_fbdev_mode_unlocked+0x7a/0xa0 [drm_kms_helper]
 drm_fb_helper_lastclose+0x15/0x20 [drm_kms_helper]
 amdgpu_driver_lastclose_kms+0xe/0x20 [amdgpu]
 drm_lastclose+0x35/0x100 [drm]
 drm_release+0xe8/0x120 [drm]
 __fput+0xbc/0x230
 ____fput+0xe/0x10
 task_work_run+0x9d/0xc0
 do_exit+0x2da/0xb30
 ? handle_mm_fault+0xe1/0x210
 do_group_exit+0x43/0xb0
 __x64_sys_exit_group+0x18/0x20
 do_syscall_64+0x5a/0x110
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f009bb4a926
Code: Bad RIP value.
RSP: 002b:00007ffff209d968 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f009bc4f6d0 RCX: 00007f009bb4a926
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 0000000000000000 R08: 00000000000000e7 R09: fffffffffffffc78
R10: 0000000000000042 R11: 0000000000000246 R12: 00007f009bc4f6d0
R13: 0000000000000603 R14: 00007f009bc53108 R15: 0000000000000000
Modules linked in: aufs overlay edac_mce_amd kvm irqbypass nls_iso8859_1
snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio amdgpu
snd_hda_codec_hdmi input_leds joydev snd_hda_intel snd_hda_codec
crct10dif_pclmul snd_hda_core crc32_pclmul snd_hwdep ghash_clmulni_intel
snd_pcm chash snd_seq_midi amd_iommu_v2 snd_seq_midi_event aesni_intel
gpu_sched snd_rawmidi ttm aes_x86_64 drm_kms_helper crypto_simd cryptd
eeepc_wmi snd_seq glue_helper asus_wmi drm sparse_keymap video snd_seq_devi=
ce
mxm_wmi k10temp wmi_bmof snd_timer fb_sys_fops syscopyarea sysfillrect
sysimgblt ccp snd soundcore mac_hid sch_fq_codel parport_pc ppdev lp parport
ip_tables x_tables autofs4 hid_generic usbhid hid igb i2c_piix4 i2c_algo_bit
nvme ahci dca libahci nvme_core gpio_amdpt wmi gpio_generic
---[ end trace 721f50ce38f2bef8 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569860481.5d6f.23533--

--===============0360620792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0360620792==--
