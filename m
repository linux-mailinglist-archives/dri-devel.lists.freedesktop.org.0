Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949EBB675B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 17:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC426F3D9;
	Wed, 18 Sep 2019 15:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E12426F3D9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 15:46:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DDD5772167; Wed, 18 Sep 2019 15:46:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110610] kernel BUG at
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5611
Date: Wed, 18 Sep 2019 15:46:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ddrambler@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110610-502-zudrEpNedU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110610-502@http.bugs.freedesktop.org/>
References: <bug-110610-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1065925601=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1065925601==
Content-Type: multipart/alternative; boundary="15688215842.de34a.6022"
Content-Transfer-Encoding: 7bit


--15688215842.de34a.6022
Date: Wed, 18 Sep 2019 15:46:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110610

--- Comment #2 from Danil Pleshakov <ddrambler@gmail.com> ---
Same problem here.
uname -a
> Linux gentoo 5.2.13-gentoo #3 SMP Sat Sep 14 15:24:37 MSK 2019 x86_64 Int=
el(R) Core(TM) i5-7400 CPU @ 3.00GHz GenuineIntel GNU/Linux

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

[    2.587904] amdgpu 0000:01:00.0: 000000003ae4f723 pin failed
[    2.587963] WARNING: CPU: 2 PID: 570 at
drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:925 amdgpu_bo_unpin+0xc3/0xf0
[amdgpu]
[    2.587964] Modules linked in: amdgpu(+) mfd_core gpu_sched ttm
[    2.587967] CPU: 2 PID: 570 Comm: systemd-udevd Not tainted 5.2.13-gento=
o #3
[    2.587967] Hardware name: Gigabyte Technology Co., Ltd. H110N/H110N-CF,
BIOS F22 11/07/2017
[    2.588003] RIP: 0010:amdgpu_bo_unpin+0xc3/0xf0 [amdgpu]
[    2.588004] Code: ff 48 83 c0 0c 48 39 d0 75 ea 48 8d 73 30 48 8d 7b 50 =
48
8d 54 24 08 e8 ab c3 fb ff 85 c0 74 a1 e9 22 4f 1a 00 e8 1d a3 ff c8 <0f> 0=
b 48
8b bd a0 bf ff ff 48 89 da 48 c7 c6 94 a7 4a c0 e8 66 63
[    2.588005] RSP: 0018:ffffa513c27d7858 EFLAGS: 00010246
[    2.588006] RAX: 0000000000000000 RBX: ffff97fb69443800 RCX:
ffff97fb697f4270
[    2.588006] RDX: ffff97fb694438f8 RSI: ffff97fb697f4060 RDI:
ffff97fb69443800
[    2.588007] RBP: ffff97fb697f4060 R08: ffff97fb697f4270 R09:
ffff97fb697f4270
[    2.588007] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff97fb69443850
[    2.588008] R13: ffff97fb697f4060 R14: ffff97fb69443ad0 R15:
00000000fffffff4
[    2.588008] FS:  00007fb089b2f340(0000) GS:ffff97fb6eb00000(0000)
knlGS:0000000000000000
[    2.588009] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.588009] CR2: 00005649fb91d688 CR3: 000000042baa4001 CR4:
00000000003606e0
[    2.588010] Call Trace:
[    2.588050]  ? amdgpu_vram_mgr_new+0x313/0x3a0 [amdgpu]
[    2.588085]  amdgpufb_destroy_pinned_object+0x58/0xc0 [amdgpu]
[    2.588120]  amdgpufb_create+0x21f/0x440 [amdgpu]
[    2.588123]  __drm_fb_helper_initial_config_and_unlock+0x277/0x4a0
[    2.588158]  amdgpu_fbdev_init+0xbf/0xf0 [amdgpu]
[    2.588208]  amdgpu_device_init.cold.37+0xe00/0x10e0 [amdgpu]
[    2.588211]  ? kmalloc_order+0xf/0x30
[    2.588245]  amdgpu_driver_load_kms+0x73/0x190 [amdgpu]
[    2.588248]  drm_dev_register+0x108/0x140
[    2.588281]  amdgpu_pci_probe+0xc6/0x130 [amdgpu]
[    2.588283]  local_pci_probe+0x3d/0x70
[    2.588284]  ? pci_assign_irq+0x22/0xd0
[    2.588285]  pci_device_probe+0xc9/0x160
[    2.588288]  really_probe+0xcd/0x240
[    2.588289]  driver_probe_device+0x47/0xb0
[    2.588291]  device_driver_attach+0x4a/0x50
[    2.588292]  __driver_attach+0x46/0xb0
[    2.588293]  ? device_driver_attach+0x50/0x50
[    2.588294]  bus_for_each_dev+0x72/0xb0
[    2.588296]  bus_add_driver+0x1a1/0x1c0
[    2.588297]  ? 0xffffffffc05a6000
[    2.588298]  driver_register+0x66/0xb0
[    2.588299]  ? 0xffffffffc05a6000
[    2.588300]  do_one_initcall+0x41/0x1df
[    2.588302]  ? _cond_resched+0x10/0x20
[    2.588303]  ? kmem_cache_alloc_trace+0x33/0x150
[    2.588305]  do_init_module+0x55/0x200
[    2.588307]  load_module+0x231a/0x2470
[    2.588309]  ? __do_sys_finit_module+0xba/0xe0
[    2.588310]  __do_sys_finit_module+0xba/0xe0
[    2.588311]  do_syscall_64+0x43/0x110
[    2.588313]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    2.588314] RIP: 0033:0x7fb08a2d2e09
[    2.588315] Code: 00 00 00 75 05 48 83 c4 18 c3 e8 12 8d 01 00 66 90 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 57 90 0c 00 f7 d8 64 89 01 48
[    2.588316] RSP: 002b:00007ffdd7f41a98 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    2.588317] RAX: ffffffffffffffda RBX: 00005649fb90b450 RCX:
00007fb08a2d2e09
[    2.588317] RDX: 0000000000000000 RSI: 00007fb08a43791d RDI:
000000000000000c
[    2.588318] RBP: 00007fb08a43791d R08: 0000000000000000 R09:
00005649fb9040d0
[    2.588318] R10: 000000000000000c R11: 0000000000000246 R12:
0000000000000000
[    2.588319] R13: 00005649fb90ac00 R14: 0000000000020000 R15:
00005649fb90b450
[    2.588320] ---[ end trace ddf323dd8a4d2f04 ]---
[    2.588324] amdgpu 0000:01:00.0: 000000003ae4f723 unpin not necessary
[    2.588360] [drm:amdgpufb_create [amdgpu]] *ERROR* failed to create fbcon
object -12

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

[    3.337687] ------------[ cut here ]------------
[    3.337695] WARNING: CPU: 0 PID: 624 at
drivers/gpu/drm/drm_atomic_helper.c:3016
__drm_atomic_helper_set_config.cold.49+0xc/0x53
[    3.337695] Modules linked in: amdgpu mfd_core gpu_sched ttm
[    3.337698] CPU: 0 PID: 624 Comm: plymouthd Tainted: G        W=20=20=20=
=20=20=20=20=20
5.2.13-gentoo #3
[    3.337699] Hardware name: Gigabyte Technology Co., Ltd. H110N/H110N-CF,
BIOS F22 11/07/2017
[    3.337701] RIP: 0010:__drm_atomic_helper_set_config.cold.49+0xc/0x53
[    3.337702] Code: 0b e9 23 ef ff ff 48 c7 c7 e0 fc 60 8a e8 78 8a bd ff =
0f
0b b8 ea ff ff ff e9 85 f4 ff ff 48 c7 c7 e0 fc 60 8a e8 60 8a bd ff <0f> 0=
b e9
bb fa ff ff 48 c7 c7 e0 fc 60 8a e8 4d 8a bd ff 0f 0b e9
[    3.337703] RSP: 0018:ffffa513c2787d90 EFLAGS: 00010246
[    3.337703] RAX: 0000000000000024 RBX: ffff97fb6884b200 RCX:
ffffffff8a847658
[    3.337704] RDX: 0000000000000000 RSI: 0000000000000096 RDI:
ffffffff8aeef7ac
[    3.337704] RBP: ffff97fb67f94100 R08: 0000000000000377 R09:
0000000000000000
[    3.337705] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff97fb68a6f400
[    3.337705] R13: 000000006838ff00 R14: ffff97fb69565000 R15:
ffff97fb6838ff00
[    3.337706] FS:  00007f4e4239a740(0000) GS:ffff97fb6ea00000(0000)
knlGS:0000000000000000
[    3.337707] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.337707] CR2: 00005641fbc47b68 CR3: 000000042969a003 CR4:
00000000003606f0
[    3.337708] Call Trace:
[    3.337710]  restore_fbdev_mode_atomic+0x158/0x1d0
[    3.337712]  drm_fb_helper_restore_fbdev_mode_unlocked+0x40/0x90
[    3.337713]  drm_lastclose+0x2a/0x50
[    3.337715]  drm_release+0x72/0x74
[    3.337717]  __fput+0xb1/0x220
[    3.337718]  task_work_run+0x79/0xa0
[    3.337720]  exit_to_usermode_loop+0x9d/0xa0
[    3.337721]  do_syscall_64+0xe1/0x110
[    3.337724]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    3.337725] RIP: 0033:0x7f4e42636778
[    3.337726] Code: 00 00 48 83 ec 28 64 48 8b 04 25 28 00 00 00 48 89 44 =
24
18 31 c0 48 8d 05 65 8f 0d 00 8b 00 85 c0 75 27 b8 03 00 00 00 0f 05 <48> 3=
d 00
f0 ff ff 77 50 48 8b 74 24 18 64 48 33 34 25 28 00 00 00
[    3.337726] RSP: 002b:00007fff7cefc8a0 EFLAGS: 00000246 ORIG_RAX:
0000000000000003
[    3.337727] RAX: 0000000000000000 RBX: 00005641fbc44bc0 RCX:
00007f4e42636778
[    3.337728] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000009
[    3.337728] RBP: 0000000000000009 R08: 00005641fbc44bd0 R09:
00005641fbc44bc0
[    3.337728] R10: 00007f4e4270ac40 R11: 0000000000000246 R12:
000000000000e200
[    3.337729] R13: 00005641fbc40d50 R14: 0000000000000001 R15:
00005641fbc420a0
[    3.337730] ---[ end trace ddf323dd8a4d2f05 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15688215842.de34a.6022
Date: Wed, 18 Sep 2019 15:46:24 +0000
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
   title=3D"NEW - kernel BUG at drivers/gpu/drm/amd/amdgpu/../display/amdgp=
u_dm/amdgpu_dm.c:5611"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110610#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - kernel BUG at drivers/gpu/drm/amd/amdgpu/../display/amdgp=
u_dm/amdgpu_dm.c:5611"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110610">bug 11061=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ddrambler&#64;gmail.com" title=3D"Danil Pleshakov &lt;ddrambler&#64;gmail.c=
om&gt;"> <span class=3D"fn">Danil Pleshakov</span></a>
</span></b>
        <pre>Same problem here.
uname -a
<span class=3D"quote">&gt; Linux gentoo 5.2.13-gentoo #3 SMP Sat Sep 14 15:=
24:37 MSK 2019 x86_64 Intel(R) Core(TM) i5-7400 CPU &#64; 3.00GHz GenuineIn=
tel GNU/Linux</span >

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

[    2.587904] amdgpu 0000:01:00.0: 000000003ae4f723 pin failed
[    2.587963] WARNING: CPU: 2 PID: 570 at
drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:925 amdgpu_bo_unpin+0xc3/0xf0
[amdgpu]
[    2.587964] Modules linked in: amdgpu(+) mfd_core gpu_sched ttm
[    2.587967] CPU: 2 PID: 570 Comm: systemd-udevd Not tainted 5.2.13-gento=
o #3
[    2.587967] Hardware name: Gigabyte Technology Co., Ltd. H110N/H110N-CF,
BIOS F22 11/07/2017
[    2.588003] RIP: 0010:amdgpu_bo_unpin+0xc3/0xf0 [amdgpu]
[    2.588004] Code: ff 48 83 c0 0c 48 39 d0 75 ea 48 8d 73 30 48 8d 7b 50 =
48
8d 54 24 08 e8 ab c3 fb ff 85 c0 74 a1 e9 22 4f 1a 00 e8 1d a3 ff c8 &lt;0f=
&gt; 0b 48
8b bd a0 bf ff ff 48 89 da 48 c7 c6 94 a7 4a c0 e8 66 63
[    2.588005] RSP: 0018:ffffa513c27d7858 EFLAGS: 00010246
[    2.588006] RAX: 0000000000000000 RBX: ffff97fb69443800 RCX:
ffff97fb697f4270
[    2.588006] RDX: ffff97fb694438f8 RSI: ffff97fb697f4060 RDI:
ffff97fb69443800
[    2.588007] RBP: ffff97fb697f4060 R08: ffff97fb697f4270 R09:
ffff97fb697f4270
[    2.588007] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff97fb69443850
[    2.588008] R13: ffff97fb697f4060 R14: ffff97fb69443ad0 R15:
00000000fffffff4
[    2.588008] FS:  00007fb089b2f340(0000) GS:ffff97fb6eb00000(0000)
knlGS:0000000000000000
[    2.588009] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.588009] CR2: 00005649fb91d688 CR3: 000000042baa4001 CR4:
00000000003606e0
[    2.588010] Call Trace:
[    2.588050]  ? amdgpu_vram_mgr_new+0x313/0x3a0 [amdgpu]
[    2.588085]  amdgpufb_destroy_pinned_object+0x58/0xc0 [amdgpu]
[    2.588120]  amdgpufb_create+0x21f/0x440 [amdgpu]
[    2.588123]  __drm_fb_helper_initial_config_and_unlock+0x277/0x4a0
[    2.588158]  amdgpu_fbdev_init+0xbf/0xf0 [amdgpu]
[    2.588208]  amdgpu_device_init.cold.37+0xe00/0x10e0 [amdgpu]
[    2.588211]  ? kmalloc_order+0xf/0x30
[    2.588245]  amdgpu_driver_load_kms+0x73/0x190 [amdgpu]
[    2.588248]  drm_dev_register+0x108/0x140
[    2.588281]  amdgpu_pci_probe+0xc6/0x130 [amdgpu]
[    2.588283]  local_pci_probe+0x3d/0x70
[    2.588284]  ? pci_assign_irq+0x22/0xd0
[    2.588285]  pci_device_probe+0xc9/0x160
[    2.588288]  really_probe+0xcd/0x240
[    2.588289]  driver_probe_device+0x47/0xb0
[    2.588291]  device_driver_attach+0x4a/0x50
[    2.588292]  __driver_attach+0x46/0xb0
[    2.588293]  ? device_driver_attach+0x50/0x50
[    2.588294]  bus_for_each_dev+0x72/0xb0
[    2.588296]  bus_add_driver+0x1a1/0x1c0
[    2.588297]  ? 0xffffffffc05a6000
[    2.588298]  driver_register+0x66/0xb0
[    2.588299]  ? 0xffffffffc05a6000
[    2.588300]  do_one_initcall+0x41/0x1df
[    2.588302]  ? _cond_resched+0x10/0x20
[    2.588303]  ? kmem_cache_alloc_trace+0x33/0x150
[    2.588305]  do_init_module+0x55/0x200
[    2.588307]  load_module+0x231a/0x2470
[    2.588309]  ? __do_sys_finit_module+0xba/0xe0
[    2.588310]  __do_sys_finit_module+0xba/0xe0
[    2.588311]  do_syscall_64+0x43/0x110
[    2.588313]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    2.588314] RIP: 0033:0x7fb08a2d2e09
[    2.588315] Code: 00 00 00 75 05 48 83 c4 18 c3 e8 12 8d 01 00 66 90 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 57 90 0c 00 f7 d8 64 89 01 48
[    2.588316] RSP: 002b:00007ffdd7f41a98 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    2.588317] RAX: ffffffffffffffda RBX: 00005649fb90b450 RCX:
00007fb08a2d2e09
[    2.588317] RDX: 0000000000000000 RSI: 00007fb08a43791d RDI:
000000000000000c
[    2.588318] RBP: 00007fb08a43791d R08: 0000000000000000 R09:
00005649fb9040d0
[    2.588318] R10: 000000000000000c R11: 0000000000000246 R12:
0000000000000000
[    2.588319] R13: 00005649fb90ac00 R14: 0000000000020000 R15:
00005649fb90b450
[    2.588320] ---[ end trace ddf323dd8a4d2f04 ]---
[    2.588324] amdgpu 0000:01:00.0: 000000003ae4f723 unpin not necessary
[    2.588360] [drm:amdgpufb_create [amdgpu]] *ERROR* failed to create fbcon
object -12

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

[    3.337687] ------------[ cut here ]------------
[    3.337695] WARNING: CPU: 0 PID: 624 at
drivers/gpu/drm/drm_atomic_helper.c:3016
__drm_atomic_helper_set_config.cold.49+0xc/0x53
[    3.337695] Modules linked in: amdgpu mfd_core gpu_sched ttm
[    3.337698] CPU: 0 PID: 624 Comm: plymouthd Tainted: G        W=20=20=20=
=20=20=20=20=20
5.2.13-gentoo #3
[    3.337699] Hardware name: Gigabyte Technology Co., Ltd. H110N/H110N-CF,
BIOS F22 11/07/2017
[    3.337701] RIP: 0010:__drm_atomic_helper_set_config.cold.49+0xc/0x53
[    3.337702] Code: 0b e9 23 ef ff ff 48 c7 c7 e0 fc 60 8a e8 78 8a bd ff =
0f
0b b8 ea ff ff ff e9 85 f4 ff ff 48 c7 c7 e0 fc 60 8a e8 60 8a bd ff &lt;0f=
&gt; 0b e9
bb fa ff ff 48 c7 c7 e0 fc 60 8a e8 4d 8a bd ff 0f 0b e9
[    3.337703] RSP: 0018:ffffa513c2787d90 EFLAGS: 00010246
[    3.337703] RAX: 0000000000000024 RBX: ffff97fb6884b200 RCX:
ffffffff8a847658
[    3.337704] RDX: 0000000000000000 RSI: 0000000000000096 RDI:
ffffffff8aeef7ac
[    3.337704] RBP: ffff97fb67f94100 R08: 0000000000000377 R09:
0000000000000000
[    3.337705] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff97fb68a6f400
[    3.337705] R13: 000000006838ff00 R14: ffff97fb69565000 R15:
ffff97fb6838ff00
[    3.337706] FS:  00007f4e4239a740(0000) GS:ffff97fb6ea00000(0000)
knlGS:0000000000000000
[    3.337707] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.337707] CR2: 00005641fbc47b68 CR3: 000000042969a003 CR4:
00000000003606f0
[    3.337708] Call Trace:
[    3.337710]  restore_fbdev_mode_atomic+0x158/0x1d0
[    3.337712]  drm_fb_helper_restore_fbdev_mode_unlocked+0x40/0x90
[    3.337713]  drm_lastclose+0x2a/0x50
[    3.337715]  drm_release+0x72/0x74
[    3.337717]  __fput+0xb1/0x220
[    3.337718]  task_work_run+0x79/0xa0
[    3.337720]  exit_to_usermode_loop+0x9d/0xa0
[    3.337721]  do_syscall_64+0xe1/0x110
[    3.337724]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    3.337725] RIP: 0033:0x7f4e42636778
[    3.337726] Code: 00 00 48 83 ec 28 64 48 8b 04 25 28 00 00 00 48 89 44 =
24
18 31 c0 48 8d 05 65 8f 0d 00 8b 00 85 c0 75 27 b8 03 00 00 00 0f 05 &lt;48=
&gt; 3d 00
f0 ff ff 77 50 48 8b 74 24 18 64 48 33 34 25 28 00 00 00
[    3.337726] RSP: 002b:00007fff7cefc8a0 EFLAGS: 00000246 ORIG_RAX:
0000000000000003
[    3.337727] RAX: 0000000000000000 RBX: 00005641fbc44bc0 RCX:
00007f4e42636778
[    3.337728] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000009
[    3.337728] RBP: 0000000000000009 R08: 00005641fbc44bd0 R09:
00005641fbc44bc0
[    3.337728] R10: 00007f4e4270ac40 R11: 0000000000000246 R12:
000000000000e200
[    3.337729] R13: 00005641fbc40d50 R14: 0000000000000001 R15:
00005641fbc420a0
[    3.337730] ---[ end trace ddf323dd8a4d2f05 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15688215842.de34a.6022--

--===============1065925601==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1065925601==--
