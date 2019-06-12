Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4F042B07
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 17:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B13758970E;
	Wed, 12 Jun 2019 15:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 570798970B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 15:36:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5384772167; Wed, 12 Jun 2019 15:36:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110906] [Regression 5.2-rc4] Frozen screen with `Memory manager
 not clean during takedown.`
Date: Wed, 12 Jun 2019 15:36:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110906-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0412538313=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0412538313==
Content-Type: multipart/alternative; boundary="15603537782.d9a5.30183"
Content-Transfer-Encoding: 7bit


--15603537782.d9a5.30183
Date: Wed, 12 Jun 2019 15:36:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110906

            Bug ID: 110906
           Summary: [Regression 5.2-rc4] Frozen screen with `Memory
                    manager not clean during takedown.`
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: pmenzel+bugs.freedesktop.org@molgen.mpg.de

Created attachment 144521
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144521&action=3Dedit
Linux kernel 5.2-rc4 messages

There is a regression between Linux 5.2-rc3 and 5.2-rc4.

The screen just freezes with start-up messages (mainly systemd notification=
s),
and the login screen is not shown. Logging in remotely using SSH is possibl=
e.
The X server cannot start as no screens are found. Linux logs the messages
below.

[   11.452246] ------------[ cut here ]------------
[   11.452697] Memory manager not clean during takedown.
[   11.453131] WARNING: CPU: 3 PID: 180 at drivers/gpu/drm/drm_mm.c:939
drm_mm_takedown+0x20/0x30 [drm]
[   11.453917] Modules linked in: amdgpu(+) input_leds led_class gpu_sched =
ttm
drm_kms_helper x86_pkg_temp_thermal snd_hda_codec_realtek snd_hda_codec_hdmi
snd_hda_codec_generic kvm_intel snd_hda_intel snd_hda_codec kvm snd_hda_core
drm snd_pcm snd_timer wmi_bmof snd fb_sys_fops wmi syscopyarea irqbypass
soundcore sysfillrect sysimgblt video crc32c_intel nfsd auth_rpcgss
oid_registry nfs_acl lockd grace sunrpc ip_tables x_tables unix ipv6 autofs4
[   11.457343] CPU: 3 PID: 180 Comm: systemd-udevd Not tainted
5.2.0-rc4.mx64.270 #1
[   11.458004] Hardware name: Dell Inc. OptiPlex 5040/0R790T, BIOS 1.2.7
01/15/2016
[   11.458653] RIP: 0010:drm_mm_takedown+0x20/0x30 [drm]
[   11.459081] Code: ff ff e8 a3 1d e3 e0 0f 1f 00 0f 1f 44 00 00 48 8b 47 =
38
48 83 c7 38 48 39 c7 75 02 f3 c3 48 c7 c7 00 1f 27 a0 e8 00 1b e3 e0 <0f> 0=
b c3
0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41
[   11.460680] RSP: 0018:ffffc9000127fa48 EFLAGS: 00010282
[   11.461110] RAX: 0000000000000000 RBX: ffff8882515c4030 RCX:
0000000000000006
[   11.461735] RDX: 0000000000000007 RSI: 0000000000000096 RDI:
ffff8882543964c0
[   11.462319] RBP: ffff88824db4fa00 R08: 00000000000002e6 R09:
0000000000000038
[   11.462943] R10: 0000000000000000 R11: ffffc9000127f8e8 R12:
ffff8882515c41c0
[   11.463527] R13: 0000000000000000 R14: 0000000000000170 R15:
ffff8882405a7500
[   11.464151] FS:  00007fa1d302e840(0000) GS:ffff888254380000(0000)
knlGS:0000000000000000
[   11.464844] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.465316] CR2: 00007fa1d04b9860 CR3: 000000024a60c001 CR4:
00000000003606e0
[   11.465941] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   11.466526] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   11.467151] Call Trace:
[   11.467410]  amdgpu_vram_mgr_fini+0x27/0xa0 [amdgpu]
[   11.467864]  ttm_bo_clean_mm+0xa5/0xe0 [ttm]
[   11.468248]  amdgpu_ttm_fini+0x72/0xd0 [amdgpu]
[   11.468690]  amdgpu_bo_fini+0xe/0x30 [amdgpu]
[   11.469083]  gmc_v6_0_sw_fini+0x26/0x50 [amdgpu]
[   11.469490]  amdgpu_device_fini+0x368/0x4b0 [amdgpu]
[   11.469966]  amdgpu_driver_unload_kms+0xb4/0x150 [amdgpu]
[   11.470435]  amdgpu_driver_load_kms+0x169/0x310 [amdgpu]
[   11.470917]  drm_dev_register+0x118/0x1b0 [drm]
[   11.471316]  amdgpu_pci_probe+0xcb/0x160 [amdgpu]
[   11.471748]  local_pci_probe+0x42/0x90
[   11.472062]  pci_device_probe+0x143/0x1b0
[   11.472396]  really_probe+0x1b6/0x2b0
[   11.472744]  driver_probe_device+0x50/0xf0
[   11.473085]  device_driver_attach+0x4f/0x60
[   11.473433]  __driver_attach+0x6c/0xb0
[   11.473786]  ? device_driver_attach+0x60/0x60
[   11.474148]  bus_for_each_dev+0x76/0xc0
[   11.474468]  bus_add_driver+0x176/0x1f0
[   11.474829]  ? 0xffffffffa07ae000
[   11.475107]  driver_register+0x5b/0xe0
[   11.475420]  ? 0xffffffffa07ae000
[   11.475740]  do_one_initcall+0x4f/0x200
[   11.476061]  ? _cond_resched+0x15/0x40
[   11.476374]  ? kmem_cache_alloc_trace+0xdf/0x1f0
[   11.476798]  do_init_module+0x5b/0x214
[   11.477111]  load_module+0x1d98/0x2170
[   11.477425]  __se_sys_finit_module+0xb1/0xd0
[   11.477819]  do_syscall_64+0x48/0x130
[   11.478126]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   11.478544] RIP: 0033:0x7fa1d1e45d19
[   11.478884] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 3f 21 2c 00 f7 d8 64 89 01 48
[   11.480441] RSP: 002b:00007fffb682ee38 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   11.481091] RAX: ffffffffffffffda RBX: 0000000000681350 RCX:
00007fa1d1e45d19
[   11.481715] RDX: 0000000000000000 RSI: 00007fa1d279154b RDI:
0000000000000015
[   11.482299] RBP: 00007fa1d279154b R08: 0000000000000000 R09:
0000000000000000
[   11.482914] R10: 0000000000000015 R11: 0000000000000246 R12:
0000000000000000
[   11.483498] R13: 0000000000677e00 R14: 0000000000020000 R15:
000000000067a800
[   11.484124] ---[ end trace c489a0ac8a25869d ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603537782.d9a5.30183
Date: Wed, 12 Jun 2019 15:36:18 +0000
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
   title=3D"NEW - [Regression 5.2-rc4] Frozen screen with `Memory manager n=
ot clean during takedown.`"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110906">110906</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Regression 5.2-rc4] Frozen screen with `Memory manager not c=
lean during takedown.`
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
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
          <td>pmenzel+bugs.freedesktop.org&#64;molgen.mpg.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144521=
" name=3D"attach_144521" title=3D"Linux kernel 5.2-rc4 messages">attachment=
 144521</a> <a href=3D"attachment.cgi?id=3D144521&amp;action=3Dedit" title=
=3D"Linux kernel 5.2-rc4 messages">[details]</a></span>
Linux kernel 5.2-rc4 messages

There is a regression between Linux 5.2-rc3 and 5.2-rc4.

The screen just freezes with start-up messages (mainly systemd notification=
s),
and the login screen is not shown. Logging in remotely using SSH is possibl=
e.
The X server cannot start as no screens are found. Linux logs the messages
below.

[   11.452246] ------------[ cut here ]------------
[   11.452697] Memory manager not clean during takedown.
[   11.453131] WARNING: CPU: 3 PID: 180 at drivers/gpu/drm/drm_mm.c:939
drm_mm_takedown+0x20/0x30 [drm]
[   11.453917] Modules linked in: amdgpu(+) input_leds led_class gpu_sched =
ttm
drm_kms_helper x86_pkg_temp_thermal snd_hda_codec_realtek snd_hda_codec_hdmi
snd_hda_codec_generic kvm_intel snd_hda_intel snd_hda_codec kvm snd_hda_core
drm snd_pcm snd_timer wmi_bmof snd fb_sys_fops wmi syscopyarea irqbypass
soundcore sysfillrect sysimgblt video crc32c_intel nfsd auth_rpcgss
oid_registry nfs_acl lockd grace sunrpc ip_tables x_tables unix ipv6 autofs4
[   11.457343] CPU: 3 PID: 180 Comm: systemd-udevd Not tainted
5.2.0-rc4.mx64.270 #1
[   11.458004] Hardware name: Dell Inc. OptiPlex 5040/0R790T, BIOS 1.2.7
01/15/2016
[   11.458653] RIP: 0010:drm_mm_takedown+0x20/0x30 [drm]
[   11.459081] Code: ff ff e8 a3 1d e3 e0 0f 1f 00 0f 1f 44 00 00 48 8b 47 =
38
48 83 c7 38 48 39 c7 75 02 f3 c3 48 c7 c7 00 1f 27 a0 e8 00 1b e3 e0 &lt;0f=
&gt; 0b c3
0f 1f 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 41
[   11.460680] RSP: 0018:ffffc9000127fa48 EFLAGS: 00010282
[   11.461110] RAX: 0000000000000000 RBX: ffff8882515c4030 RCX:
0000000000000006
[   11.461735] RDX: 0000000000000007 RSI: 0000000000000096 RDI:
ffff8882543964c0
[   11.462319] RBP: ffff88824db4fa00 R08: 00000000000002e6 R09:
0000000000000038
[   11.462943] R10: 0000000000000000 R11: ffffc9000127f8e8 R12:
ffff8882515c41c0
[   11.463527] R13: 0000000000000000 R14: 0000000000000170 R15:
ffff8882405a7500
[   11.464151] FS:  00007fa1d302e840(0000) GS:ffff888254380000(0000)
knlGS:0000000000000000
[   11.464844] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.465316] CR2: 00007fa1d04b9860 CR3: 000000024a60c001 CR4:
00000000003606e0
[   11.465941] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   11.466526] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   11.467151] Call Trace:
[   11.467410]  amdgpu_vram_mgr_fini+0x27/0xa0 [amdgpu]
[   11.467864]  ttm_bo_clean_mm+0xa5/0xe0 [ttm]
[   11.468248]  amdgpu_ttm_fini+0x72/0xd0 [amdgpu]
[   11.468690]  amdgpu_bo_fini+0xe/0x30 [amdgpu]
[   11.469083]  gmc_v6_0_sw_fini+0x26/0x50 [amdgpu]
[   11.469490]  amdgpu_device_fini+0x368/0x4b0 [amdgpu]
[   11.469966]  amdgpu_driver_unload_kms+0xb4/0x150 [amdgpu]
[   11.470435]  amdgpu_driver_load_kms+0x169/0x310 [amdgpu]
[   11.470917]  drm_dev_register+0x118/0x1b0 [drm]
[   11.471316]  amdgpu_pci_probe+0xcb/0x160 [amdgpu]
[   11.471748]  local_pci_probe+0x42/0x90
[   11.472062]  pci_device_probe+0x143/0x1b0
[   11.472396]  really_probe+0x1b6/0x2b0
[   11.472744]  driver_probe_device+0x50/0xf0
[   11.473085]  device_driver_attach+0x4f/0x60
[   11.473433]  __driver_attach+0x6c/0xb0
[   11.473786]  ? device_driver_attach+0x60/0x60
[   11.474148]  bus_for_each_dev+0x76/0xc0
[   11.474468]  bus_add_driver+0x176/0x1f0
[   11.474829]  ? 0xffffffffa07ae000
[   11.475107]  driver_register+0x5b/0xe0
[   11.475420]  ? 0xffffffffa07ae000
[   11.475740]  do_one_initcall+0x4f/0x200
[   11.476061]  ? _cond_resched+0x15/0x40
[   11.476374]  ? kmem_cache_alloc_trace+0xdf/0x1f0
[   11.476798]  do_init_module+0x5b/0x214
[   11.477111]  load_module+0x1d98/0x2170
[   11.477425]  __se_sys_finit_module+0xb1/0xd0
[   11.477819]  do_syscall_64+0x48/0x130
[   11.478126]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   11.478544] RIP: 0033:0x7fa1d1e45d19
[   11.478884] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 3f 21 2c 00 f7 d8 64 89 01 48
[   11.480441] RSP: 002b:00007fffb682ee38 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[   11.481091] RAX: ffffffffffffffda RBX: 0000000000681350 RCX:
00007fa1d1e45d19
[   11.481715] RDX: 0000000000000000 RSI: 00007fa1d279154b RDI:
0000000000000015
[   11.482299] RBP: 00007fa1d279154b R08: 0000000000000000 R09:
0000000000000000
[   11.482914] R10: 0000000000000015 R11: 0000000000000246 R12:
0000000000000000
[   11.483498] R13: 0000000000677e00 R14: 0000000000020000 R15:
000000000067a800
[   11.484124] ---[ end trace c489a0ac8a25869d ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603537782.d9a5.30183--

--===============0412538313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0412538313==--
