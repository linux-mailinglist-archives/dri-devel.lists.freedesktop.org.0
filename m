Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89A8101D29
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6711F6ECE8;
	Tue, 19 Nov 2019 08:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA0D46ECDF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:26:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C6560720E2; Tue, 19 Nov 2019 08:26:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107296] WARNING: CPU: 0 PID: 370 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1355
 dcn_bw_update_from_pplib+0x16b/0x280 [amdgpu]
Date: Tue, 19 Nov 2019 08:26:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fabstz-it@yahoo.fr
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-107296-502-0nla356ZsL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107296-502@http.bugs.freedesktop.org/>
References: <bug-107296-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0425675853=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0425675853==
Content-Type: multipart/alternative; boundary="15741519836.9051e1ECD.17568"
Content-Transfer-Encoding: 7bit


--15741519836.9051e1ECD.17568
Date: Tue, 19 Nov 2019 08:26:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107296

Fab Stz <fabstz-it@yahoo.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|WORKSFORME                  |---
             Status|RESOLVED                    |REOPENED

--- Comment #24 from Fab Stz <fabstz-it@yahoo.fr> ---
This is not fixed at all for me with -> I Reopen
Linux debian 5.3.0-2-amd64 #1 SMP Debian 5.3.9-2 (2019-11-12) x86_64 GNU/Li=
nux

CPU/APU : Ahtlon 200GE with integrated vega 3
MB: Asus PRIME B450M-A, BIOS 1823 10/15/2019



[    1.575098] [drm] DM_PPLIB: values for F clock
[    1.575099] [drm] DM_PPLIB:   0 in kHz, 3649 in mV
[    1.575099] [drm] DM_PPLIB:   0 in kHz, 3649 in mV
[    1.575100] [drm] DM_PPLIB:   0 in kHz, 3649 in mV
[    1.575100] [drm] DM_PPLIB:   1200000 in kHz, 4399 in mV
[    1.575101] ------------[ cut here ]------------
[    1.575206] WARNING: CPU: 1 PID: 151 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1452
dcn_bw_update_from_pplib.cold+0x73/0x9c [amdgpu]
[    1.575207] Modules linked in: amdgpu(+) gpu_sched i2c_algo_bit ttm
drm_kms_helper xhci_pci crc32c_intel drm psmouse ahci i2c_piix4 libahci
xhci_hcd libata usbcore scsi_mod mfd_core usb_common wmi video gpio_amdpt
gpio_generic button
[    1.575217] CPU: 1 PID: 151 Comm: systemd-udevd Not tainted 5.3.0-2-amd6=
4 #1
Debian 5.3.9-2
[    1.575218] Hardware name: System manufacturer System Product Name/PRIME
B450M-A, BIOS 1823 10/15/2019
[    1.575304] RIP: 0010:dcn_bw_update_from_pplib.cold+0x73/0x9c [amdgpu]
[    1.575306] Code: 48 8b 93 60 03 00 00 db 42 78 83 f9 02 77 37 b8 02 00 =
00
00 8d 71 ff e9 3b fc f3 ff 48 c7 c7 c0 af 6d c0 31 c0 e8 4c bc 6c dd <0f> 0=
b e9
b5 fc f3 ff 48 c7 c7 c0 af 6d c0 31 c0 e8 37 bc 6c dd 0f
[    1.575307] RSP: 0018:ffffb77040437650 EFLAGS: 00010246
[    1.575308] RAX: 0000000000000024 RBX: ffff9e9207a90000 RCX:
000000000000032e
[    1.575309] RDX: 0000000000000000 RSI: 0000000000000086 RDI:
0000000000000247
[    1.575310] RBP: ffff9e9208cb7680 R08: 000000000000032e R09:
0000000000000004
[    1.575310] R10: 0000000000000000 R11: 0000000000000001 R12:
ffffb770404376f0
[    1.575311] R13: 0000000000000001 R14: ffff9e9209613200 R15:
ffffb77040437880
[    1.575312] FS:  00007f43eee43d40(0000) GS:ffff9e9217240000(0000)
knlGS:0000000000000000
[    1.575313] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.575313] CR2: 00007ffd4d5e9d28 CR3: 0000000209774000 CR4:
00000000003406e0
[    1.575314] Call Trace:
[    1.575402]  dcn10_create_resource_pool+0x99d/0xa50 [amdgpu]
[    1.575407]  ? _cond_resched+0x15/0x30
[    1.575409]  ? kmem_cache_alloc_trace+0x18d/0x210
[    1.575491]  ? firmware_parser_create+0x17e/0x5f0 [amdgpu]
[    1.575571]  dc_create_resource_pool+0x1b2/0x1d0 [amdgpu]
[    1.575653]  ? dal_gpio_service_create+0x95/0xe0 [amdgpu]
[    1.575732]  dc_create+0x233/0x660 [amdgpu]
[    1.575806]  ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
[    1.575885]  amdgpu_dm_init+0x130/0x1b0 [amdgpu]
[    1.575962]  ? phm_wait_for_register_unequal.part.0+0x50/0x80 [amdgpu]
[    1.576039]  dm_hw_init+0xe/0x20 [amdgpu]
[    1.576125]  amdgpu_device_init.cold+0x1502/0x1738 [amdgpu]
[    1.576183]  amdgpu_driver_load_kms+0x58/0x1c0 [amdgpu]
[    1.576195]  drm_dev_register+0x111/0x150 [drm]
[    1.576252]  amdgpu_pci_probe+0x154/0x1b0 [amdgpu]
[    1.576255]  local_pci_probe+0x42/0x80
[    1.576258]  pci_device_probe+0x104/0x1a0
[    1.576261]  really_probe+0xf0/0x380
[    1.576263]  driver_probe_device+0x59/0xd0
[    1.576265]  device_driver_attach+0x53/0x60
[    1.576266]  __driver_attach+0x8a/0x150
[    1.576268]  ? device_driver_attach+0x60/0x60
[    1.576270]  bus_for_each_dev+0x78/0xc0
[    1.576272]  bus_add_driver+0x14a/0x1e0
[    1.576273]  driver_register+0x6c/0xb0
[    1.576274]  ? 0xffffffffc085d000
[    1.576277]  do_one_initcall+0x46/0x1f4
[    1.576278]  ? _cond_resched+0x15/0x30
[    1.576280]  ? kmem_cache_alloc_trace+0x1d4/0x210
[    1.576282]  ? do_init_module+0x23/0x230
[    1.576283]  do_init_module+0x5c/0x230
[    1.576284]  load_module+0x2349/0x24f0
[    1.576287]  ? __do_sys_finit_module+0xaf/0x110
[    1.576288]  __do_sys_finit_module+0xaf/0x110
[    1.576290]  do_syscall_64+0x53/0x140
[    1.576292]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    1.576294] RIP: 0033:0x7f43ef62df59
[    1.576296] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3=
d 01
f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01 48
[    1.576296] RSP: 002b:00007ffd4d5ee0f8 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    1.576298] RAX: ffffffffffffffda RBX: 00005643081f44b0 RCX:
00007f43ef62df59
[    1.576298] RDX: 0000000000000000 RSI: 00007f43ef532cad RDI:
0000000000000011
[    1.576299] RBP: 00007f43ef532cad R08: 0000000000000000 R09:
0000000000000000
[    1.576299] R10: 0000000000000011 R11: 0000000000000246 R12:
0000000000000000
[    1.576300] R13: 00005643081e1aa0 R14: 0000000000020000 R15:
00005643081f44b0
[    1.576302] ---[ end trace 0ec2ed871fa17fbb ]---
[    1.576306] [drm] DM_PPLIB: values for DCF clock
[    1.576307] [drm] DM_PPLIB:   300000 in kHz, 3649 in mV
[    1.576307] [drm] DM_PPLIB:   600000 in kHz, 3974 in mV
[    1.576308] [drm] DM_PPLIB:   626000 in kHz, 4174 in mV
[    1.576308] [drm] DM_PPLIB:   654000 in kHz, 4325 in mV

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15741519836.9051e1ECD.17568
Date: Tue, 19 Nov 2019 08:26:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:fabstz-it=
&#64;yahoo.fr" title=3D"Fab Stz &lt;fabstz-it&#64;yahoo.fr&gt;"> <span clas=
s=3D"fn">Fab Stz</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdg=
pu/../display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x28=
0 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296">bug 10729=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>WORKSFORME
           </td>
           <td>---
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdg=
pu/../display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x28=
0 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdg=
pu/../display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x28=
0 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296">bug 10729=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fabstz-it&#64;yahoo.fr" title=3D"Fab Stz &lt;fabstz-it&#64;yahoo.fr&gt;"> <=
span class=3D"fn">Fab Stz</span></a>
</span></b>
        <pre>This is not fixed at all for me with -&gt; I Reopen
Linux debian 5.3.0-2-amd64 #1 SMP Debian 5.3.9-2 (2019-11-12) x86_64 GNU/Li=
nux

CPU/APU : Ahtlon 200GE with integrated vega 3
MB: Asus PRIME B450M-A, BIOS 1823 10/15/2019



[    1.575098] [drm] DM_PPLIB: values for F clock
[    1.575099] [drm] DM_PPLIB:   0 in kHz, 3649 in mV
[    1.575099] [drm] DM_PPLIB:   0 in kHz, 3649 in mV
[    1.575100] [drm] DM_PPLIB:   0 in kHz, 3649 in mV
[    1.575100] [drm] DM_PPLIB:   1200000 in kHz, 4399 in mV
[    1.575101] ------------[ cut here ]------------
[    1.575206] WARNING: CPU: 1 PID: 151 at
drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1452
dcn_bw_update_from_pplib.cold+0x73/0x9c [amdgpu]
[    1.575207] Modules linked in: amdgpu(+) gpu_sched i2c_algo_bit ttm
drm_kms_helper xhci_pci crc32c_intel drm psmouse ahci i2c_piix4 libahci
xhci_hcd libata usbcore scsi_mod mfd_core usb_common wmi video gpio_amdpt
gpio_generic button
[    1.575217] CPU: 1 PID: 151 Comm: systemd-udevd Not tainted 5.3.0-2-amd6=
4 #1
Debian 5.3.9-2
[    1.575218] Hardware name: System manufacturer System Product Name/PRIME
B450M-A, BIOS 1823 10/15/2019
[    1.575304] RIP: 0010:dcn_bw_update_from_pplib.cold+0x73/0x9c [amdgpu]
[    1.575306] Code: 48 8b 93 60 03 00 00 db 42 78 83 f9 02 77 37 b8 02 00 =
00
00 8d 71 ff e9 3b fc f3 ff 48 c7 c7 c0 af 6d c0 31 c0 e8 4c bc 6c dd &lt;0f=
&gt; 0b e9
b5 fc f3 ff 48 c7 c7 c0 af 6d c0 31 c0 e8 37 bc 6c dd 0f
[    1.575307] RSP: 0018:ffffb77040437650 EFLAGS: 00010246
[    1.575308] RAX: 0000000000000024 RBX: ffff9e9207a90000 RCX:
000000000000032e
[    1.575309] RDX: 0000000000000000 RSI: 0000000000000086 RDI:
0000000000000247
[    1.575310] RBP: ffff9e9208cb7680 R08: 000000000000032e R09:
0000000000000004
[    1.575310] R10: 0000000000000000 R11: 0000000000000001 R12:
ffffb770404376f0
[    1.575311] R13: 0000000000000001 R14: ffff9e9209613200 R15:
ffffb77040437880
[    1.575312] FS:  00007f43eee43d40(0000) GS:ffff9e9217240000(0000)
knlGS:0000000000000000
[    1.575313] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.575313] CR2: 00007ffd4d5e9d28 CR3: 0000000209774000 CR4:
00000000003406e0
[    1.575314] Call Trace:
[    1.575402]  dcn10_create_resource_pool+0x99d/0xa50 [amdgpu]
[    1.575407]  ? _cond_resched+0x15/0x30
[    1.575409]  ? kmem_cache_alloc_trace+0x18d/0x210
[    1.575491]  ? firmware_parser_create+0x17e/0x5f0 [amdgpu]
[    1.575571]  dc_create_resource_pool+0x1b2/0x1d0 [amdgpu]
[    1.575653]  ? dal_gpio_service_create+0x95/0xe0 [amdgpu]
[    1.575732]  dc_create+0x233/0x660 [amdgpu]
[    1.575806]  ? amdgpu_cgs_create_device+0x23/0x50 [amdgpu]
[    1.575885]  amdgpu_dm_init+0x130/0x1b0 [amdgpu]
[    1.575962]  ? phm_wait_for_register_unequal.part.0+0x50/0x80 [amdgpu]
[    1.576039]  dm_hw_init+0xe/0x20 [amdgpu]
[    1.576125]  amdgpu_device_init.cold+0x1502/0x1738 [amdgpu]
[    1.576183]  amdgpu_driver_load_kms+0x58/0x1c0 [amdgpu]
[    1.576195]  drm_dev_register+0x111/0x150 [drm]
[    1.576252]  amdgpu_pci_probe+0x154/0x1b0 [amdgpu]
[    1.576255]  local_pci_probe+0x42/0x80
[    1.576258]  pci_device_probe+0x104/0x1a0
[    1.576261]  really_probe+0xf0/0x380
[    1.576263]  driver_probe_device+0x59/0xd0
[    1.576265]  device_driver_attach+0x53/0x60
[    1.576266]  __driver_attach+0x8a/0x150
[    1.576268]  ? device_driver_attach+0x60/0x60
[    1.576270]  bus_for_each_dev+0x78/0xc0
[    1.576272]  bus_add_driver+0x14a/0x1e0
[    1.576273]  driver_register+0x6c/0xb0
[    1.576274]  ? 0xffffffffc085d000
[    1.576277]  do_one_initcall+0x46/0x1f4
[    1.576278]  ? _cond_resched+0x15/0x30
[    1.576280]  ? kmem_cache_alloc_trace+0x1d4/0x210
[    1.576282]  ? do_init_module+0x23/0x230
[    1.576283]  do_init_module+0x5c/0x230
[    1.576284]  load_module+0x2349/0x24f0
[    1.576287]  ? __do_sys_finit_module+0xaf/0x110
[    1.576288]  __do_sys_finit_module+0xaf/0x110
[    1.576290]  do_syscall_64+0x53/0x140
[    1.576292]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[    1.576294] RIP: 0033:0x7f43ef62df59
[    1.576296] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 =
89
f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 &lt;48=
&gt; 3d 01
f0 ff ff 73 01 c3 48 8b 0d 07 6f 0c 00 f7 d8 64 89 01 48
[    1.576296] RSP: 002b:00007ffd4d5ee0f8 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    1.576298] RAX: ffffffffffffffda RBX: 00005643081f44b0 RCX:
00007f43ef62df59
[    1.576298] RDX: 0000000000000000 RSI: 00007f43ef532cad RDI:
0000000000000011
[    1.576299] RBP: 00007f43ef532cad R08: 0000000000000000 R09:
0000000000000000
[    1.576299] R10: 0000000000000011 R11: 0000000000000246 R12:
0000000000000000
[    1.576300] R13: 00005643081e1aa0 R14: 0000000000020000 R15:
00005643081f44b0
[    1.576302] ---[ end trace 0ec2ed871fa17fbb ]---
[    1.576306] [drm] DM_PPLIB: values for DCF clock
[    1.576307] [drm] DM_PPLIB:   300000 in kHz, 3649 in mV
[    1.576307] [drm] DM_PPLIB:   600000 in kHz, 3974 in mV
[    1.576308] [drm] DM_PPLIB:   626000 in kHz, 4174 in mV
[    1.576308] [drm] DM_PPLIB:   654000 in kHz, 4325 in mV</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15741519836.9051e1ECD.17568--

--===============0425675853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0425675853==--
