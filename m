Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284CEDE09
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 10:36:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2F4892A5;
	Mon, 29 Apr 2019 08:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC8C489274
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 08:36:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E8F4772155; Mon, 29 Apr 2019 08:36:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110381] Failed to updateMST allocation table forpipe idx:0
Date: Mon, 29 Apr 2019 08:36:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugs.freedesktop.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110381-502-jHPfrhEimo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110381-502@http.bugs.freedesktop.org/>
References: <bug-110381-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2134209148=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2134209148==
Content-Type: multipart/alternative; boundary="15565270002.81EcBd.20407"
Content-Transfer-Encoding: 7bit


--15565270002.81EcBd.20407
Date: Mon, 29 Apr 2019 08:36:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110381

--- Comment #1 from Paul Menzel <pmenzel+bugs.freedesktop.org@molgen.mpg.de=
> ---
This still happens with Linux 5.1-rc6.

```
[Fri Apr 26 16:02:16 2019] [drm] DM_MST: stopping TM on aconnector:
00000000c53c37c4 [id: 59]
[Fri Apr 26 16:02:16 2019] [drm] DM_MST: Disabling connector: 00000000d0028=
6a1
[id: 70] [master: 00000000c53c37c4]
[Fri Apr 26 16:02:16 2019] [drm] DM_MST: Disabling connector: 00000000e78a9=
cad
[id: 75] [master: 00000000c53c37c4]
[Fri Apr 26 16:02:19 2019] usb 1-10: USB disconnect, device number 9
[Mon Apr 29 10:16:33 2019] [drm] DM_MST: starting TM on aconnector:
00000000c53c37c4 [id: 59]
[Mon Apr 29 10:16:33 2019] [drm] DM_MST: added connector: 00000000f322b7c6 =
[id:
83] [master: 00000000c53c37c4]
[Mon Apr 29 10:16:33 2019] [drm] SADs count is: -2, don't need to read it
[Mon Apr 29 10:16:33 2019] [drm] DM_MST: added connector: 00000000d75129fc =
[id:
103] [master: 00000000c53c37c4]
[Mon Apr 29 10:16:34 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:16:34 2019] [drm] SADs count is: -2, don't need to read it
[Mon Apr 29 10:16:34 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:16:34 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:16:34 2019] WARNING: CPU: 3 PID: 466 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2354
update_mst_stream_alloc_table+0x144/0x150 [amdgpu]
[Mon Apr 29 10:16:34 2019] Modules linked in: fuse rpcsec_gss_krb5 nfsv4 nfs
8021q garp stp mrp llc input_leds led_class amdgpu snd_hda_codec_realtek
snd_hda_codec_generic i915 chash gpu_sched ttm iosf_mbi snd_hda_codec_hdmi
drm_kms_helper snd_hda_intel intel_gtt snd_hda_codec drm x86_pkg_temp_therm=
al
fb_sys_fops syscopyarea snd_hda_core kvm_intel snd_pcm kvm snd_timer snd
sysfillrect irqbypass wmi_bmof soundcore crc32c_intel sysimgblt video wmi n=
fsd
auth_rpcgss oid_registry nfs_acl lockd grace sunrpc efivarfs ip_tables x_ta=
bles
unix ipv6 autofs4
[Mon Apr 29 10:16:34 2019] CPU: 3 PID: 466 Comm: Xorg Kdump: loaded Not tai=
nted
5.1.0-rc6.mx64.258 #1
[Mon Apr 29 10:16:34 2019] Hardware name: Dell Inc. Precision 3630
Tower/0NNNCT, BIOS 1.0.4 07/17/2018
[Mon Apr 29 10:16:34 2019] RIP: 0010:update_mst_stream_alloc_table+0x144/0x=
150
[amdgpu]
[Mon Apr 29 10:16:34 2019] Code: 63 d0 48 83 c2 13 48 c1 e2 04 4d 8b 4c 10 =
08
4d 8b 54 10 10 4d 89 0c 24 4d 89 54 24 08 39 c1 75 81 e9 67 ff ff ff 31 c0 =
eb
f3 <0f> 0b e9 14 ff ff ff e8 f0 15 88 e0 0f 1f 44 00 00 41 55 41 54 49
[Mon Apr 29 10:16:34 2019] RSP: 0018:ffffc9000252b6b0 EFLAGS: 00010202
[Mon Apr 29 10:16:34 2019] RAX: 0000000000000002 RBX: ffff88846410c5c0 RCX:
0000000000000000
[Mon Apr 29 10:16:34 2019] RDX: ffffc9000252b784 RSI: ffff88844d848a80 RDI:
ffffc9000252b710
[Mon Apr 29 10:16:34 2019] RBP: ffffc9000252b750 R08: ffff888460a53c00 R09:
ffff888384600000
[Mon Apr 29 10:16:34 2019] R10: ffffc9000252b768 R11: ffffc9000252b6b0 R12:
ffff888460a53c00
[Mon Apr 29 10:16:34 2019] R13: ffff88846410c000 R14: 0000000000000002 R15:
ffff888454a70000
[Mon Apr 29 10:16:34 2019] FS:  00007f906be66540(0000)
GS:ffff88846c0c0000(0000) knlGS:0000000000000000
[Mon Apr 29 10:16:34 2019] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Mon Apr 29 10:16:34 2019] CR2: 00000000006c7448 CR3: 000000044c81c006 CR4:
00000000003606e0
[Mon Apr 29 10:16:34 2019] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[Mon Apr 29 10:16:34 2019] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[Mon Apr 29 10:16:34 2019] Call Trace:
[Mon Apr 29 10:16:34 2019]  ? mutex_lock+0xe/0x30
[Mon Apr 29 10:16:34 2019]  ? core_link_enable_stream+0x47a/0x1090 [amdgpu]
[Mon Apr 29 10:16:34 2019]  core_link_enable_stream+0x47a/0x1090 [amdgpu]
[Mon Apr 29 10:16:34 2019]  dce110_apply_ctx_to_hw+0x3f1/0x480 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? dce110_apply_ctx_for_surface+0x250/0x2b0 [amd=
gpu]
[Mon Apr 29 10:16:34 2019]  dc_commit_state+0x2d6/0x560 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? drm_calc_timestamping_constants+0xe5/0x150 [d=
rm]
[Mon Apr 29 10:16:34 2019]  amdgpu_dm_atomic_commit_tail+0x388/0x1960 [amdg=
pu]
[Mon Apr 29 10:16:34 2019]  ? bw_calcs+0x6f8/0x1cd0 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? dce112_validate_bandwidth+0x3e/0x70 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? dc_validate_global_state+0x2d4/0x360 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? amdgpu_bo_pin_restricted+0x68/0x290 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? _cond_resched+0x15/0x40
[Mon Apr 29 10:16:34 2019]  ? wait_for_common+0x3d/0x180
[Mon Apr 29 10:16:34 2019]  ? _cond_resched+0x15/0x40
[Mon Apr 29 10:16:34 2019]  ? wait_for_common+0x3d/0x180
[Mon Apr 29 10:16:34 2019]  ? dm_plane_helper_prepare_fb+0x117/0x370 [amdgp=
u]
[Mon Apr 29 10:16:34 2019]  ? commit_tail+0x3d/0x70 [drm_kms_helper]
[Mon Apr 29 10:16:34 2019]  commit_tail+0x3d/0x70 [drm_kms_helper]
[Mon Apr 29 10:16:34 2019]  drm_atomic_helper_commit+0xfc/0x110
[drm_kms_helper]
[Mon Apr 29 10:16:34 2019]  drm_atomic_helper_set_config+0x80/0x90
[drm_kms_helper]
[Mon Apr 29 10:16:34 2019]  drm_mode_setcrtc+0x170/0x6c0 [drm]
[Mon Apr 29 10:16:34 2019]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[Mon Apr 29 10:16:34 2019]  drm_ioctl_kernel+0x88/0xf0 [drm]
[Mon Apr 29 10:16:34 2019]  drm_ioctl+0x2f8/0x3b0 [drm]
[Mon Apr 29 10:16:34 2019]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[Mon Apr 29 10:16:34 2019]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[Mon Apr 29 10:16:34 2019]  do_vfs_ioctl+0xa4/0x630
[Mon Apr 29 10:16:34 2019]  ? __sys_recvmsg+0x8a/0xa0
[Mon Apr 29 10:16:34 2019]  ksys_ioctl+0x3a/0x70
[Mon Apr 29 10:16:34 2019]  __x64_sys_ioctl+0x16/0x20
[Mon Apr 29 10:16:34 2019]  do_syscall_64+0x48/0x100
[Mon Apr 29 10:16:34 2019]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[Mon Apr 29 10:16:34 2019] RIP: 0033:0x7f90699b4647
[Mon Apr 29 10:16:34 2019] Code: 00 00 00 48 8b 05 41 58 2c 00 64 c7 00 26 =
00
00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 =
0f
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 11 58 2c 00 f7 d8 64 89 01 48
[Mon Apr 29 10:16:34 2019] RSP: 002b:00007ffefc39edf8 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[Mon Apr 29 10:16:34 2019] RAX: ffffffffffffffda RBX: 00007ffefc39ee30 RCX:
00007f90699b4647
[Mon Apr 29 10:16:34 2019] RDX: 00007ffefc39ee30 RSI: 00000000c06864a2 RDI:
000000000000000b
[Mon Apr 29 10:16:34 2019] RBP: 00007ffefc39ee30 R08: 0000000000000000 R09:
00000000016deaf0
[Mon Apr 29 10:16:34 2019] R10: 00007ffefc39eef0 R11: 0000000000000246 R12:
00000000c06864a2
[Mon Apr 29 10:16:34 2019] R13: 000000000000000b R14: 0000000000000000 R15:
00000000016deaf0
[Mon Apr 29 10:16:34 2019] ---[ end trace f73ac3cc2c839e40 ]---
[Mon Apr 29 10:17:17 2019] usb 1-10: new high-speed USB device number 10 us=
ing
xhci_hcd
[Mon Apr 29 10:17:17 2019] usb-storage 1-10:1.0: USB Mass Storage device
detected
[Mon Apr 29 10:17:17 2019] scsi host5: usb-storage 1-10:1.0
[Mon Apr 29 10:17:18 2019] scsi 5:0:0:0: Direct-Access     Linux    File-CD
Gadget   0000 PQ: 0 ANSI: 2
[Mon Apr 29 10:17:18 2019] sd 5:0:0:0: Attached scsi generic sg2 type 0
[Mon Apr 29 10:17:18 2019] sd 5:0:0:0: Power-on or device reset occurred
[Mon Apr 29 10:17:18 2019] sd 5:0:0:0: [sdc] Attached SCSI removable disk
[Mon Apr 29 10:17:20 2019] usb 1-10: USB disconnect, device number 10
[Mon Apr 29 10:17:21 2019] usb 1-10: new high-speed USB device number 11 us=
ing
xhci_hcd
[Mon Apr 29 10:17:21 2019] usb-storage 1-10:1.0: USB Mass Storage device
detected
[Mon Apr 29 10:17:21 2019] scsi host5: usb-storage 1-10:1.0
[Mon Apr 29 10:17:22 2019] scsi 5:0:0:0: Direct-Access     Linux    File-CD
Gadget   0000 PQ: 0 ANSI: 2
[Mon Apr 29 10:17:22 2019] sd 5:0:0:0: Attached scsi generic sg2 type 0
[Mon Apr 29 10:17:22 2019] sd 5:0:0:0: Power-on or device reset occurred
[Mon Apr 29 10:17:22 2019] sd 5:0:0:0: [sdc] Attached SCSI removable disk
[Mon Apr 29 10:18:07 2019] usb 1-10: USB disconnect, device number 11
[Mon Apr 29 10:18:07 2019] usb 1-10: new high-speed USB device number 12 us=
ing
xhci_hcd
[Mon Apr 29 10:18:07 2019] usb-storage 1-10:1.0: USB Mass Storage device
detected
[Mon Apr 29 10:18:07 2019] scsi host5: usb-storage 1-10:1.0
[Mon Apr 29 10:18:08 2019] scsi 5:0:0:0: Direct-Access     Linux    File-CD
Gadget   0000 PQ: 0 ANSI: 2
[Mon Apr 29 10:18:08 2019] sd 5:0:0:0: Attached scsi generic sg2 type 0
[Mon Apr 29 10:18:08 2019] sd 5:0:0:0: Power-on or device reset occurred
[Mon Apr 29 10:18:08 2019] sd 5:0:0:0: [sdc] Attached SCSI removable disk
[Mon Apr 29 10:19:23 2019] [drm] DM_MST: stopping TM on aconnector:
00000000c53c37c4 [id: 59]
[Mon Apr 29 10:19:23 2019] [drm] DM_MST: Disabling connector: 00000000f322b=
7c6
[id: 83] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:23 2019] [drm] DM_MST: Disabling connector: 00000000d7512=
9fc
[id: 103] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:24 2019] [drm] DM_MST: starting TM on aconnector:
00000000c53c37c4 [id: 59]
[Mon Apr 29 10:19:25 2019] [drm] DM_MST: added connector: 0000000017233044 =
[id:
92] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:25 2019] [drm] SADs count is: -2, don't need to read it
[Mon Apr 29 10:19:25 2019] [drm] DM_MST: added connector: 00000000e263cd87 =
[id:
108] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:25 2019] [drm] SADs count is: -2, don't need to read it
[Mon Apr 29 10:19:25 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:19:25 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:19:39 2019] [drm] DM_MST: stopping TM on aconnector:
00000000c53c37c4 [id: 59]
[Mon Apr 29 10:19:39 2019] [drm] DM_MST: Disabling connector: 0000000017233=
044
[id: 92] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:39 2019] [drm] DM_MST: Disabling connector: 00000000e263c=
d87
[id: 108] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:43 2019] [drm] DM_MST: starting TM on aconnector:
00000000c53c37c4 [id: 59]
[Mon Apr 29 10:19:43 2019] [drm] DM_MST: added connector: 000000001c781c8d =
[id:
85] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:43 2019] [drm] amdgpu_dm_irq_schedule_work FAILED src 12
[Mon Apr 29 10:19:43 2019] [drm] SADs count is: -2, don't need to read it
[Mon Apr 29 10:19:43 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:19:44 2019] [drm] DM_MST: added connector: 00000000e78a9cad =
[id:
97] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:44 2019] [drm] SADs count is: -2, don't need to read it
```

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565270002.81EcBd.20407
Date: Mon, 29 Apr 2019 08:36:40 +0000
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
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Failed to updateMST allocation table forpipe idx:0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110381">bug 11038=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pmenzel+bugs.freedesktop.org&#64;molgen.mpg.de" title=3D"Paul Menzel &lt;pm=
enzel+bugs.freedesktop.org&#64;molgen.mpg.de&gt;"> <span class=3D"fn">Paul =
Menzel</span></a>
</span></b>
        <pre>This still happens with Linux 5.1-rc6.

```
[Fri Apr 26 16:02:16 2019] [drm] DM_MST: stopping TM on aconnector:
00000000c53c37c4 [id: 59]
[Fri Apr 26 16:02:16 2019] [drm] DM_MST: Disabling connector: 00000000d0028=
6a1
[id: 70] [master: 00000000c53c37c4]
[Fri Apr 26 16:02:16 2019] [drm] DM_MST: Disabling connector: 00000000e78a9=
cad
[id: 75] [master: 00000000c53c37c4]
[Fri Apr 26 16:02:19 2019] usb 1-10: USB disconnect, device number 9
[Mon Apr 29 10:16:33 2019] [drm] DM_MST: starting TM on aconnector:
00000000c53c37c4 [id: 59]
[Mon Apr 29 10:16:33 2019] [drm] DM_MST: added connector: 00000000f322b7c6 =
[id:
83] [master: 00000000c53c37c4]
[Mon Apr 29 10:16:33 2019] [drm] SADs count is: -2, don't need to read it
[Mon Apr 29 10:16:33 2019] [drm] DM_MST: added connector: 00000000d75129fc =
[id:
103] [master: 00000000c53c37c4]
[Mon Apr 29 10:16:34 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:16:34 2019] [drm] SADs count is: -2, don't need to read it
[Mon Apr 29 10:16:34 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:16:34 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:16:34 2019] WARNING: CPU: 3 PID: 466 at
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2354
update_mst_stream_alloc_table+0x144/0x150 [amdgpu]
[Mon Apr 29 10:16:34 2019] Modules linked in: fuse rpcsec_gss_krb5 nfsv4 nfs
8021q garp stp mrp llc input_leds led_class amdgpu snd_hda_codec_realtek
snd_hda_codec_generic i915 chash gpu_sched ttm iosf_mbi snd_hda_codec_hdmi
drm_kms_helper snd_hda_intel intel_gtt snd_hda_codec drm x86_pkg_temp_therm=
al
fb_sys_fops syscopyarea snd_hda_core kvm_intel snd_pcm kvm snd_timer snd
sysfillrect irqbypass wmi_bmof soundcore crc32c_intel sysimgblt video wmi n=
fsd
auth_rpcgss oid_registry nfs_acl lockd grace sunrpc efivarfs ip_tables x_ta=
bles
unix ipv6 autofs4
[Mon Apr 29 10:16:34 2019] CPU: 3 PID: 466 Comm: Xorg Kdump: loaded Not tai=
nted
5.1.0-rc6.mx64.258 #1
[Mon Apr 29 10:16:34 2019] Hardware name: Dell Inc. Precision 3630
Tower/0NNNCT, BIOS 1.0.4 07/17/2018
[Mon Apr 29 10:16:34 2019] RIP: 0010:update_mst_stream_alloc_table+0x144/0x=
150
[amdgpu]
[Mon Apr 29 10:16:34 2019] Code: 63 d0 48 83 c2 13 48 c1 e2 04 4d 8b 4c 10 =
08
4d 8b 54 10 10 4d 89 0c 24 4d 89 54 24 08 39 c1 75 81 e9 67 ff ff ff 31 c0 =
eb
f3 &lt;0f&gt; 0b e9 14 ff ff ff e8 f0 15 88 e0 0f 1f 44 00 00 41 55 41 54 49
[Mon Apr 29 10:16:34 2019] RSP: 0018:ffffc9000252b6b0 EFLAGS: 00010202
[Mon Apr 29 10:16:34 2019] RAX: 0000000000000002 RBX: ffff88846410c5c0 RCX:
0000000000000000
[Mon Apr 29 10:16:34 2019] RDX: ffffc9000252b784 RSI: ffff88844d848a80 RDI:
ffffc9000252b710
[Mon Apr 29 10:16:34 2019] RBP: ffffc9000252b750 R08: ffff888460a53c00 R09:
ffff888384600000
[Mon Apr 29 10:16:34 2019] R10: ffffc9000252b768 R11: ffffc9000252b6b0 R12:
ffff888460a53c00
[Mon Apr 29 10:16:34 2019] R13: ffff88846410c000 R14: 0000000000000002 R15:
ffff888454a70000
[Mon Apr 29 10:16:34 2019] FS:  00007f906be66540(0000)
GS:ffff88846c0c0000(0000) knlGS:0000000000000000
[Mon Apr 29 10:16:34 2019] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Mon Apr 29 10:16:34 2019] CR2: 00000000006c7448 CR3: 000000044c81c006 CR4:
00000000003606e0
[Mon Apr 29 10:16:34 2019] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[Mon Apr 29 10:16:34 2019] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[Mon Apr 29 10:16:34 2019] Call Trace:
[Mon Apr 29 10:16:34 2019]  ? mutex_lock+0xe/0x30
[Mon Apr 29 10:16:34 2019]  ? core_link_enable_stream+0x47a/0x1090 [amdgpu]
[Mon Apr 29 10:16:34 2019]  core_link_enable_stream+0x47a/0x1090 [amdgpu]
[Mon Apr 29 10:16:34 2019]  dce110_apply_ctx_to_hw+0x3f1/0x480 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? dce110_apply_ctx_for_surface+0x250/0x2b0 [amd=
gpu]
[Mon Apr 29 10:16:34 2019]  dc_commit_state+0x2d6/0x560 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? drm_calc_timestamping_constants+0xe5/0x150 [d=
rm]
[Mon Apr 29 10:16:34 2019]  amdgpu_dm_atomic_commit_tail+0x388/0x1960 [amdg=
pu]
[Mon Apr 29 10:16:34 2019]  ? bw_calcs+0x6f8/0x1cd0 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? dce112_validate_bandwidth+0x3e/0x70 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? dc_validate_global_state+0x2d4/0x360 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? amdgpu_bo_pin_restricted+0x68/0x290 [amdgpu]
[Mon Apr 29 10:16:34 2019]  ? _cond_resched+0x15/0x40
[Mon Apr 29 10:16:34 2019]  ? wait_for_common+0x3d/0x180
[Mon Apr 29 10:16:34 2019]  ? _cond_resched+0x15/0x40
[Mon Apr 29 10:16:34 2019]  ? wait_for_common+0x3d/0x180
[Mon Apr 29 10:16:34 2019]  ? dm_plane_helper_prepare_fb+0x117/0x370 [amdgp=
u]
[Mon Apr 29 10:16:34 2019]  ? commit_tail+0x3d/0x70 [drm_kms_helper]
[Mon Apr 29 10:16:34 2019]  commit_tail+0x3d/0x70 [drm_kms_helper]
[Mon Apr 29 10:16:34 2019]  drm_atomic_helper_commit+0xfc/0x110
[drm_kms_helper]
[Mon Apr 29 10:16:34 2019]  drm_atomic_helper_set_config+0x80/0x90
[drm_kms_helper]
[Mon Apr 29 10:16:34 2019]  drm_mode_setcrtc+0x170/0x6c0 [drm]
[Mon Apr 29 10:16:34 2019]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[Mon Apr 29 10:16:34 2019]  drm_ioctl_kernel+0x88/0xf0 [drm]
[Mon Apr 29 10:16:34 2019]  drm_ioctl+0x2f8/0x3b0 [drm]
[Mon Apr 29 10:16:34 2019]  ? drm_mode_getcrtc+0x180/0x180 [drm]
[Mon Apr 29 10:16:34 2019]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
[Mon Apr 29 10:16:34 2019]  do_vfs_ioctl+0xa4/0x630
[Mon Apr 29 10:16:34 2019]  ? __sys_recvmsg+0x8a/0xa0
[Mon Apr 29 10:16:34 2019]  ksys_ioctl+0x3a/0x70
[Mon Apr 29 10:16:34 2019]  __x64_sys_ioctl+0x16/0x20
[Mon Apr 29 10:16:34 2019]  do_syscall_64+0x48/0x100
[Mon Apr 29 10:16:34 2019]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[Mon Apr 29 10:16:34 2019] RIP: 0033:0x7f90699b4647
[Mon Apr 29 10:16:34 2019] Code: 00 00 00 48 8b 05 41 58 2c 00 64 c7 00 26 =
00
00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 =
0f
05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 11 58 2c 00 f7 d8 64 89 01 48
[Mon Apr 29 10:16:34 2019] RSP: 002b:00007ffefc39edf8 EFLAGS: 00000246
ORIG_RAX: 0000000000000010
[Mon Apr 29 10:16:34 2019] RAX: ffffffffffffffda RBX: 00007ffefc39ee30 RCX:
00007f90699b4647
[Mon Apr 29 10:16:34 2019] RDX: 00007ffefc39ee30 RSI: 00000000c06864a2 RDI:
000000000000000b
[Mon Apr 29 10:16:34 2019] RBP: 00007ffefc39ee30 R08: 0000000000000000 R09:
00000000016deaf0
[Mon Apr 29 10:16:34 2019] R10: 00007ffefc39eef0 R11: 0000000000000246 R12:
00000000c06864a2
[Mon Apr 29 10:16:34 2019] R13: 000000000000000b R14: 0000000000000000 R15:
00000000016deaf0
[Mon Apr 29 10:16:34 2019] ---[ end trace f73ac3cc2c839e40 ]---
[Mon Apr 29 10:17:17 2019] usb 1-10: new high-speed USB device number 10 us=
ing
xhci_hcd
[Mon Apr 29 10:17:17 2019] usb-storage 1-10:1.0: USB Mass Storage device
detected
[Mon Apr 29 10:17:17 2019] scsi host5: usb-storage 1-10:1.0
[Mon Apr 29 10:17:18 2019] scsi 5:0:0:0: Direct-Access     Linux    File-CD
Gadget   0000 PQ: 0 ANSI: 2
[Mon Apr 29 10:17:18 2019] sd 5:0:0:0: Attached scsi generic sg2 type 0
[Mon Apr 29 10:17:18 2019] sd 5:0:0:0: Power-on or device reset occurred
[Mon Apr 29 10:17:18 2019] sd 5:0:0:0: [sdc] Attached SCSI removable disk
[Mon Apr 29 10:17:20 2019] usb 1-10: USB disconnect, device number 10
[Mon Apr 29 10:17:21 2019] usb 1-10: new high-speed USB device number 11 us=
ing
xhci_hcd
[Mon Apr 29 10:17:21 2019] usb-storage 1-10:1.0: USB Mass Storage device
detected
[Mon Apr 29 10:17:21 2019] scsi host5: usb-storage 1-10:1.0
[Mon Apr 29 10:17:22 2019] scsi 5:0:0:0: Direct-Access     Linux    File-CD
Gadget   0000 PQ: 0 ANSI: 2
[Mon Apr 29 10:17:22 2019] sd 5:0:0:0: Attached scsi generic sg2 type 0
[Mon Apr 29 10:17:22 2019] sd 5:0:0:0: Power-on or device reset occurred
[Mon Apr 29 10:17:22 2019] sd 5:0:0:0: [sdc] Attached SCSI removable disk
[Mon Apr 29 10:18:07 2019] usb 1-10: USB disconnect, device number 11
[Mon Apr 29 10:18:07 2019] usb 1-10: new high-speed USB device number 12 us=
ing
xhci_hcd
[Mon Apr 29 10:18:07 2019] usb-storage 1-10:1.0: USB Mass Storage device
detected
[Mon Apr 29 10:18:07 2019] scsi host5: usb-storage 1-10:1.0
[Mon Apr 29 10:18:08 2019] scsi 5:0:0:0: Direct-Access     Linux    File-CD
Gadget   0000 PQ: 0 ANSI: 2
[Mon Apr 29 10:18:08 2019] sd 5:0:0:0: Attached scsi generic sg2 type 0
[Mon Apr 29 10:18:08 2019] sd 5:0:0:0: Power-on or device reset occurred
[Mon Apr 29 10:18:08 2019] sd 5:0:0:0: [sdc] Attached SCSI removable disk
[Mon Apr 29 10:19:23 2019] [drm] DM_MST: stopping TM on aconnector:
00000000c53c37c4 [id: 59]
[Mon Apr 29 10:19:23 2019] [drm] DM_MST: Disabling connector: 00000000f322b=
7c6
[id: 83] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:23 2019] [drm] DM_MST: Disabling connector: 00000000d7512=
9fc
[id: 103] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:24 2019] [drm] DM_MST: starting TM on aconnector:
00000000c53c37c4 [id: 59]
[Mon Apr 29 10:19:25 2019] [drm] DM_MST: added connector: 0000000017233044 =
[id:
92] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:25 2019] [drm] SADs count is: -2, don't need to read it
[Mon Apr 29 10:19:25 2019] [drm] DM_MST: added connector: 00000000e263cd87 =
[id:
108] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:25 2019] [drm] SADs count is: -2, don't need to read it
[Mon Apr 29 10:19:25 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:19:25 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:19:39 2019] [drm] DM_MST: stopping TM on aconnector:
00000000c53c37c4 [id: 59]
[Mon Apr 29 10:19:39 2019] [drm] DM_MST: Disabling connector: 0000000017233=
044
[id: 92] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:39 2019] [drm] DM_MST: Disabling connector: 00000000e263c=
d87
[id: 108] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:43 2019] [drm] DM_MST: starting TM on aconnector:
00000000c53c37c4 [id: 59]
[Mon Apr 29 10:19:43 2019] [drm] DM_MST: added connector: 000000001c781c8d =
[id:
85] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:43 2019] [drm] amdgpu_dm_irq_schedule_work FAILED src 12
[Mon Apr 29 10:19:43 2019] [drm] SADs count is: -2, don't need to read it
[Mon Apr 29 10:19:43 2019] [drm] Failed to updateMST allocation table forpi=
pe
idx:0
[Mon Apr 29 10:19:44 2019] [drm] DM_MST: added connector: 00000000e78a9cad =
[id:
97] [master: 00000000c53c37c4]
[Mon Apr 29 10:19:44 2019] [drm] SADs count is: -2, don't need to read it
```</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565270002.81EcBd.20407--

--===============2134209148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2134209148==--
