Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F6EE4921
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 13:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B0D6E977;
	Fri, 25 Oct 2019 11:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 269BB6E977
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 11:03:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1F029720E2; Fri, 25 Oct 2019 11:03:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112134] Failed to load firmware on Raven Ridge
Date: Fri, 25 Oct 2019 11:03:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: samuele.decarli@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112134-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1412522562=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1412522562==
Content-Type: multipart/alternative; boundary="15720014020.bc8ab54.27630"
Content-Transfer-Encoding: 7bit


--15720014020.bc8ab54.27630
Date: Fri, 25 Oct 2019 11:03:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112134

            Bug ID: 112134
           Summary: Failed to load firmware on Raven Ridge
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: samuele.decarli@gmail.com

Using an HP EliteBook 745 G5, with a AMD Ryzen 7 PRO 2700U. Running Arch Li=
nux,
kernel version 5.3.7, linux firmware version 20190923.417a9c6-1, mesa versi=
on
19.2.2

The laptop boots, but fails to initialise the GPU, making it unusable. Boot=
ing
with an older kernel version (4.19.80) works, and reveals the following
messages in the log:

Oct 25 12:43:06 archer kernel: amdgpu 0000:04:00.0: Direct firmware load for
amdgpu/raven_kicker_rlc.bin failed with >
Oct 25 12:43:06 archer kernel: amdgpu 0000:04:00.0: gfx9: Failed to load
firmware "amdgpu/raven_kicker_rlc.bin"
Oct 25 12:43:06 archer kernel: [drm:gfx_v9_0_sw_init.cold [amdgpu]] *ERROR*
Failed to load gfx firmware!
Oct 25 12:43:06 archer kernel: [drm:amdgpu_device_init.cold [amdgpu]] *ERRO=
R*
sw_init of IP block <gfx_v9_0> failed -2
Oct 25 12:43:06 archer kernel: amdgpu 0000:04:00.0: amdgpu_device_ip_init
failed
Oct 25 12:43:06 archer kernel: amdgpu 0000:04:00.0: Fatal error during GPU =
init
Oct 25 12:43:06 archer kernel: [drm] amdgpu: finishing device.
Oct 25 12:43:06 archer kernel: [TTM] Finalizing pool allocator
Oct 25 12:43:06 archer kernel: [TTM] Finalizing DMA pool allocator
Oct 25 12:43:06 archer kernel: [TTM] Zone  kernel: Used memory at exit: 0 K=
iB
Oct 25 12:43:06 archer kernel: [TTM] Zone   dma32: Used memory at exit: 0 K=
iB
Oct 25 12:43:06 archer kernel: [drm] amdgpu: ttm finalized
Oct 25 12:43:06 archer kernel: ------------[ cut here ]------------
Oct 25 12:43:06 archer kernel: sysfs group 'fw_version' not found for kobje=
ct
'0000:04:00.0'
Oct 25 12:43:06 archer kernel: WARNING: CPU: 5 PID: 355 at fs/sysfs/group.c=
:278
sysfs_remove_group+0x74/0x80
Oct 25 12:43:06 archer kernel: Modules linked in: amd64_edac_mod(-) amdgpu(=
+)
edac_mce_amd kvm_amd msr ccp kvm joydev>
Oct 25 12:43:06 archer kernel:  libps2 ahci libahci libata crc32c_intel
xhci_pci scsi_mod xhci_hcd ehci_pci ehci_hcd >
Oct 25 12:43:06 archer kernel: CPU: 5 PID: 355 Comm: systemd-udevd Not tain=
ted
5.3.7-arch1-1-ARCH #1
Oct 25 12:43:06 archer kernel: Hardware name: HP HP EliteBook 745 G5/83D5, =
BIOS
Q81 Ver. 01.08.00 07/16/2019
Oct 25 12:43:06 archer kernel: RIP: 0010:sysfs_remove_group+0x74/0x80
Oct 25 12:43:06 archer kernel: Code: ff 5b 48 89 ef 5d 41 5c e9 19 bb ff ff=
 48
89 ef e8 f1 b7 ff ff eb cc 49 8b 14 24>
Oct 25 12:43:06 archer kernel: RSP: 0018:ffffb4c6006039e0 EFLAGS: 00010282
Oct 25 12:43:06 archer kernel: RAX: 0000000000000000 RBX: ffffffffc1173ba0 =
RCX:
0000000000000000
Oct 25 12:43:06 archer kernel: RDX: 0000000000000001 RSI: 0000000000000092 =
RDI:
00000000ffffffff
Oct 25 12:43:06 archer kernel: RBP: 0000000000000000 R08: 0000000000000408 =
R09:
0000000000000004
Oct 25 12:43:06 archer kernel: R10: 0000000000000000 R11: 0000000000000001 =
R12:
ffff9f02dd0250b0
Oct 25 12:43:06 archer kernel: R13: ffff9f02c7350018 R14: ffff9f02d18d65e0 =
R15:
0000000000000000
Oct 25 12:43:06 archer kernel: FS:  00007ffbcde2c840(0000)
GS:ffff9f02dfd40000(0000) knlGS:0000000000000000
Oct 25 12:43:06 archer kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Oct 25 12:43:06 archer kernel: CR2: 00007f0e64a20cb0 CR3: 000000041a66a000 =
CR4:
00000000003406e0
Oct 25 12:43:06 archer kernel: Call Trace:
Oct 25 12:43:06 archer kernel:  amdgpu_device_fini+0x462/0x496 [amdgpu]
Oct 25 12:43:06 archer kernel:  amdgpu_driver_unload_kms+0x4a/0x90 [amdgpu]
Oct 25 12:43:06 archer kernel:  amdgpu_driver_load_kms.cold+0xaa/0xaf [amdg=
pu]
Oct 25 12:43:06 archer kernel:  drm_dev_register+0x111/0x150 [drm]
Oct 25 12:43:06 archer kernel:  amdgpu_pci_probe+0xbd/0x120 [amdgpu]
Oct 25 12:43:06 archer kernel:  ? __pm_runtime_resume+0x49/0x60
Oct 25 12:43:06 archer kernel:  local_pci_probe+0x42/0x80
Oct 25 12:43:06 archer kernel:  ? pci_match_device+0xc5/0x100
Oct 25 12:43:06 archer kernel:  pci_device_probe+0x104/0x1a0
Oct 25 12:43:06 archer kernel:  really_probe+0xf0/0x380
Oct 25 12:43:06 archer kernel:  driver_probe_device+0xb6/0x100
Oct 25 12:43:06 archer kernel:  device_driver_attach+0x53/0x60
Oct 25 12:43:06 archer kernel:  __driver_attach+0x8a/0x150
Oct 25 12:43:06 archer kernel:  ? device_driver_attach+0x60/0x60
Oct 25 12:43:06 archer kernel:  ? device_driver_attach+0x60/0x60
Oct 25 12:43:06 archer kernel:  bus_for_each_dev+0x89/0xd0
Oct 25 12:43:06 archer kernel:  bus_add_driver+0x14a/0x1e0
Oct 25 12:43:06 archer kernel:  driver_register+0x6c/0xb0
Oct 25 12:43:06 archer kernel:  ? 0xffffffffc0c12000
Oct 25 12:43:06 archer kernel:  do_one_initcall+0x59/0x234
Oct 25 12:43:06 archer kernel:  do_init_module+0x5c/0x230
Oct 25 12:43:06 archer kernel:  load_module+0x218f/0x2400
Oct 25 12:43:06 archer kernel:  ? __se_sys_init_module+0x114/0x180
Oct 25 12:43:06 archer kernel:  __se_sys_init_module+0x114/0x180
Oct 25 12:43:06 archer kernel:  do_syscall_64+0x5f/0x1c0
Oct 25 12:43:06 archer kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Oct 25 12:43:06 archer kernel: RIP: 0033:0x7ffbcf64ad2e
Oct 25 12:43:06 archer kernel: Code: 48 8b 0d 55 01 0c 00 f7 d8 64 89 01 48=
 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00>
Oct 25 12:43:06 archer kernel: RSP: 002b:00007ffe696d7fe8 EFLAGS: 00000246
ORIG_RAX: 00000000000000af
Oct 25 12:43:06 archer kernel: RAX: ffffffffffffffda RBX: 000055ed1ee6f680 =
RCX:
00007ffbcf64ad2e
Oct 25 12:43:06 archer kernel: RDX: 00007ffbcf29a84d RSI: 000000000084ea31 =
RDI:
000055ed1fe9f230
Oct 25 12:43:06 archer kernel: RBP: 00007ffbcf29a84d R08: 000055ed1ecb001a =
R09:
0000000000000002
Oct 25 12:43:06 archer kernel: R10: 000055ed1ecb0010 R11: 0000000000000246 =
R12:
000055ed1fe9f230
Oct 25 12:43:06 archer kernel: R13: 000055ed1ee89a90 R14: 0000000000020000 =
R15:
000055ed1ee6f680
Oct 25 12:43:06 archer kernel: ---[ end trace 8e90a248b2fec769 ]---
Oct 25 12:43:06 archer kernel: amdgpu: probe of 0000:04:00.0 failed with er=
ror
-2
Oct 25 12:43:06 archer systemd-udevd[359]: renderD128: Failed to process
device, ignoring: No such file or directory
Oct 25 12:43:06 archer systemd-udevd[373]: card0: Failed to process device,
ignoring: No such file or directory

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15720014020.bc8ab54.27630
Date: Fri, 25 Oct 2019 11:03:22 +0000
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
   title=3D"NEW - Failed to load firmware on Raven Ridge"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112134">112134</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Failed to load firmware on Raven Ridge
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
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
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>samuele.decarli&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Using an HP EliteBook 745 G5, with a AMD Ryzen 7 PRO 2700U. Ru=
nning Arch Linux,
kernel version 5.3.7, linux firmware version 20190923.417a9c6-1, mesa versi=
on
19.2.2

The laptop boots, but fails to initialise the GPU, making it unusable. Boot=
ing
with an older kernel version (4.19.80) works, and reveals the following
messages in the log:

Oct 25 12:43:06 archer kernel: amdgpu 0000:04:00.0: Direct firmware load for
amdgpu/raven_kicker_rlc.bin failed with &gt;
Oct 25 12:43:06 archer kernel: amdgpu 0000:04:00.0: gfx9: Failed to load
firmware &quot;amdgpu/raven_kicker_rlc.bin&quot;
Oct 25 12:43:06 archer kernel: [drm:gfx_v9_0_sw_init.cold [amdgpu]] *ERROR*
Failed to load gfx firmware!
Oct 25 12:43:06 archer kernel: [drm:amdgpu_device_init.cold [amdgpu]] *ERRO=
R*
sw_init of IP block &lt;gfx_v9_0&gt; failed -2
Oct 25 12:43:06 archer kernel: amdgpu 0000:04:00.0: amdgpu_device_ip_init
failed
Oct 25 12:43:06 archer kernel: amdgpu 0000:04:00.0: Fatal error during GPU =
init
Oct 25 12:43:06 archer kernel: [drm] amdgpu: finishing device.
Oct 25 12:43:06 archer kernel: [TTM] Finalizing pool allocator
Oct 25 12:43:06 archer kernel: [TTM] Finalizing DMA pool allocator
Oct 25 12:43:06 archer kernel: [TTM] Zone  kernel: Used memory at exit: 0 K=
iB
Oct 25 12:43:06 archer kernel: [TTM] Zone   dma32: Used memory at exit: 0 K=
iB
Oct 25 12:43:06 archer kernel: [drm] amdgpu: ttm finalized
Oct 25 12:43:06 archer kernel: ------------[ cut here ]------------
Oct 25 12:43:06 archer kernel: sysfs group 'fw_version' not found for kobje=
ct
'0000:04:00.0'
Oct 25 12:43:06 archer kernel: WARNING: CPU: 5 PID: 355 at fs/sysfs/group.c=
:278
sysfs_remove_group+0x74/0x80
Oct 25 12:43:06 archer kernel: Modules linked in: amd64_edac_mod(-) amdgpu(=
+)
edac_mce_amd kvm_amd msr ccp kvm joydev&gt;
Oct 25 12:43:06 archer kernel:  libps2 ahci libahci libata crc32c_intel
xhci_pci scsi_mod xhci_hcd ehci_pci ehci_hcd &gt;
Oct 25 12:43:06 archer kernel: CPU: 5 PID: 355 Comm: systemd-udevd Not tain=
ted
5.3.7-arch1-1-ARCH #1
Oct 25 12:43:06 archer kernel: Hardware name: HP HP EliteBook 745 G5/83D5, =
BIOS
Q81 Ver. 01.08.00 07/16/2019
Oct 25 12:43:06 archer kernel: RIP: 0010:sysfs_remove_group+0x74/0x80
Oct 25 12:43:06 archer kernel: Code: ff 5b 48 89 ef 5d 41 5c e9 19 bb ff ff=
 48
89 ef e8 f1 b7 ff ff eb cc 49 8b 14 24&gt;
Oct 25 12:43:06 archer kernel: RSP: 0018:ffffb4c6006039e0 EFLAGS: 00010282
Oct 25 12:43:06 archer kernel: RAX: 0000000000000000 RBX: ffffffffc1173ba0 =
RCX:
0000000000000000
Oct 25 12:43:06 archer kernel: RDX: 0000000000000001 RSI: 0000000000000092 =
RDI:
00000000ffffffff
Oct 25 12:43:06 archer kernel: RBP: 0000000000000000 R08: 0000000000000408 =
R09:
0000000000000004
Oct 25 12:43:06 archer kernel: R10: 0000000000000000 R11: 0000000000000001 =
R12:
ffff9f02dd0250b0
Oct 25 12:43:06 archer kernel: R13: ffff9f02c7350018 R14: ffff9f02d18d65e0 =
R15:
0000000000000000
Oct 25 12:43:06 archer kernel: FS:  00007ffbcde2c840(0000)
GS:ffff9f02dfd40000(0000) knlGS:0000000000000000
Oct 25 12:43:06 archer kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Oct 25 12:43:06 archer kernel: CR2: 00007f0e64a20cb0 CR3: 000000041a66a000 =
CR4:
00000000003406e0
Oct 25 12:43:06 archer kernel: Call Trace:
Oct 25 12:43:06 archer kernel:  amdgpu_device_fini+0x462/0x496 [amdgpu]
Oct 25 12:43:06 archer kernel:  amdgpu_driver_unload_kms+0x4a/0x90 [amdgpu]
Oct 25 12:43:06 archer kernel:  amdgpu_driver_load_kms.cold+0xaa/0xaf [amdg=
pu]
Oct 25 12:43:06 archer kernel:  drm_dev_register+0x111/0x150 [drm]
Oct 25 12:43:06 archer kernel:  amdgpu_pci_probe+0xbd/0x120 [amdgpu]
Oct 25 12:43:06 archer kernel:  ? __pm_runtime_resume+0x49/0x60
Oct 25 12:43:06 archer kernel:  local_pci_probe+0x42/0x80
Oct 25 12:43:06 archer kernel:  ? pci_match_device+0xc5/0x100
Oct 25 12:43:06 archer kernel:  pci_device_probe+0x104/0x1a0
Oct 25 12:43:06 archer kernel:  really_probe+0xf0/0x380
Oct 25 12:43:06 archer kernel:  driver_probe_device+0xb6/0x100
Oct 25 12:43:06 archer kernel:  device_driver_attach+0x53/0x60
Oct 25 12:43:06 archer kernel:  __driver_attach+0x8a/0x150
Oct 25 12:43:06 archer kernel:  ? device_driver_attach+0x60/0x60
Oct 25 12:43:06 archer kernel:  ? device_driver_attach+0x60/0x60
Oct 25 12:43:06 archer kernel:  bus_for_each_dev+0x89/0xd0
Oct 25 12:43:06 archer kernel:  bus_add_driver+0x14a/0x1e0
Oct 25 12:43:06 archer kernel:  driver_register+0x6c/0xb0
Oct 25 12:43:06 archer kernel:  ? 0xffffffffc0c12000
Oct 25 12:43:06 archer kernel:  do_one_initcall+0x59/0x234
Oct 25 12:43:06 archer kernel:  do_init_module+0x5c/0x230
Oct 25 12:43:06 archer kernel:  load_module+0x218f/0x2400
Oct 25 12:43:06 archer kernel:  ? __se_sys_init_module+0x114/0x180
Oct 25 12:43:06 archer kernel:  __se_sys_init_module+0x114/0x180
Oct 25 12:43:06 archer kernel:  do_syscall_64+0x5f/0x1c0
Oct 25 12:43:06 archer kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
Oct 25 12:43:06 archer kernel: RIP: 0033:0x7ffbcf64ad2e
Oct 25 12:43:06 archer kernel: Code: 48 8b 0d 55 01 0c 00 f7 d8 64 89 01 48=
 83
c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00&gt;
Oct 25 12:43:06 archer kernel: RSP: 002b:00007ffe696d7fe8 EFLAGS: 00000246
ORIG_RAX: 00000000000000af
Oct 25 12:43:06 archer kernel: RAX: ffffffffffffffda RBX: 000055ed1ee6f680 =
RCX:
00007ffbcf64ad2e
Oct 25 12:43:06 archer kernel: RDX: 00007ffbcf29a84d RSI: 000000000084ea31 =
RDI:
000055ed1fe9f230
Oct 25 12:43:06 archer kernel: RBP: 00007ffbcf29a84d R08: 000055ed1ecb001a =
R09:
0000000000000002
Oct 25 12:43:06 archer kernel: R10: 000055ed1ecb0010 R11: 0000000000000246 =
R12:
000055ed1fe9f230
Oct 25 12:43:06 archer kernel: R13: 000055ed1ee89a90 R14: 0000000000020000 =
R15:
000055ed1ee6f680
Oct 25 12:43:06 archer kernel: ---[ end trace 8e90a248b2fec769 ]---
Oct 25 12:43:06 archer kernel: amdgpu: probe of 0000:04:00.0 failed with er=
ror
-2
Oct 25 12:43:06 archer systemd-udevd[359]: renderD128: Failed to process
device, ignoring: No such file or directory
Oct 25 12:43:06 archer systemd-udevd[373]: card0: Failed to process device,
ignoring: No such file or directory</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15720014020.bc8ab54.27630--

--===============1412522562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1412522562==--
