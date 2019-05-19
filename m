Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F24D22700
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A7E89192;
	Sun, 19 May 2019 14:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1148689192
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 14:34:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EBA7F72168; Sun, 19 May 2019 14:34:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110710] Non recoverable crashes when entering screensaver
Date: Sun, 19 May 2019 14:34:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: freedesktop@soerensoerensen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110710-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1281246840=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1281246840==
Content-Type: multipart/alternative; boundary="15582764631.a7Ef9C4fB.20381"
Content-Transfer-Encoding: 7bit


--15582764631.a7Ef9C4fB.20381
Date: Sun, 19 May 2019 14:34:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110710

            Bug ID: 110710
           Summary: Non recoverable crashes when entering screensaver
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: freedesktop@soerensoerensen.de

Created attachment 144300
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144300&action=3Dedit
Logs

Computer crashes each time the screensaver is started and the whole machine
must be restarted forcefully. I can't even switch to other virtual consoles=
.=20

I'm running Fedora 30 using Sway 1 as WM.=20

The following message appears in the log A LOT:

May 19 15:36:24 workstation kernel: ------------[ cut here ]------------
May 19 15:36:24 workstation kernel: Global lock should be Set,
overall_update_type should be UPDATE_TYPE_MED or UPDATE_TYPE_FULL
May 19 15:36:24 workstation kernel: WARNING: CPU: 3 PID: 2983 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6079
amdgpu_dm_atomic_check+0x42b/0x470 [amdgpu]
May 19 15:36:24 workstation kernel: Modules linked in: xt_CHECKSUM
ipt_MASQUERADE tun devlink bridge stp llc ip6t_rpfilter ip6t_REJECT
nf_reject_ipv6 xt_conntrack ebtable_nat ip6table_nat nf_nat_ipv6
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat_ipv4 nf_n=
at
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables sunrpc vfat fat edac_mce_amd kvm_amd
snd_hda_codec_realtek ccp snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi kvm snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep
snd_seq irqbypass snd_seq_device snd_pcm wmi_bmof k10temp snd_timer sp5100_=
tco
i2c_piix4 snd soundcore joydev gpio_amdpt gpio_generic pcc_cpufreq acpi_cpu=
freq
dm_crypt amdgpu crct10dif_pclmul crc32_pclmul crc32c_intel chash amd_iommu_=
v2
gpu_sched i2c_algo_bit ttm drm_kms_helper ghash_clmulni_intel drm nvme
nvme_core r8169 wmi video pinctrl_amd
May 19 15:36:24 workstation kernel: CPU: 3 PID: 2983 Comm: sway Tainted: G=
=20=20=20=20=20
  W         5.0.16-300.fc30.x86_64 #1
May 19 15:36:24 workstation kernel: Hardware name: Gigabyte Technology Co.,
Ltd. AB350M-DS3H/AB350M-DS3H-CF, BIOS F24c 12/06/2018
May 19 15:36:24 workstation kernel: RIP:
0010:amdgpu_dm_atomic_check+0x42b/0x470 [amdgpu]
May 19 15:36:24 workstation kernel: Code: ff 49 8b 57 20 41 8b 77 60 48 c7 =
c7
f8 0d 4c c0 e8 8a 32 df ff eb 80 31 db e9 6d fe ff ff 48 c7 c7 48 0d 4c c0 =
e8
84 1f d7 f0 <0f> 0b e9 8d fe ff ff 48 c7 c7 a8 0d 4c c0 e8 71 1f d7 f0 0f 0=
b e9
May 19 15:36:24 workstation kernel: RSP: 0018:ffffb900424efb68 EFLAGS: 0001=
0286
May 19 15:36:24 workstation kernel: RAX: 0000000000000000 RBX: 000000000000=
0000
RCX: 0000000000000000
May 19 15:36:24 workstation kernel: RDX: 0000000000000004 RSI: ffffffffb29b=
067c
RDI: 0000000000000246
May 19 15:36:24 workstation kernel: RBP: ffff8d304e4b9800 R08: 0000090c1eec=
5c2d
R09: ffffb900424efb00
May 19 15:36:24 workstation kernel: R10: 0000000000018630 R11: 000000000000=
0003
R12: 0000000000000000
May 19 15:36:24 workstation kernel: R13: ffff8d3046c74800 R14: ffff8d3000e3=
5050
R15: ffff8d304c1cc280
May 19 15:36:24 workstation kernel: FS:  00007f37bba61a80(0000)
GS:ffff8d3050ac0000(0000) knlGS:0000000000000000
May 19 15:36:24 workstation kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
May 19 15:36:24 workstation kernel: CR2: 0000000001054e78 CR3: 000000040a5b=
e000
CR4: 00000000003406e0
May 19 15:36:24 workstation kernel: Call Trace:
May 19 15:36:24 workstation kernel: drm_atomic_check_only+0x57f/0x7b0 [drm]
May 19 15:36:24 workstation kernel: ? drm_event_reserve_init_locked+0x4c/0x=
80
[drm]
May 19 15:36:24 workstation kernel: drm_atomic_nonblocking_commit+0x13/0x50
[drm]
May 19 15:36:24 workstation kernel: drm_mode_atomic_ioctl+0x821/0x920 [drm]
May 19 15:36:24 workstation kernel: ? drm_atomic_set_property+0x990/0x990 [=
drm]
May 19 15:36:24 workstation kernel: drm_ioctl_kernel+0xa7/0xf0 [drm]
May 19 15:36:24 workstation kernel: drm_ioctl+0x208/0x390 [drm]
May 19 15:36:24 workstation kernel: ? drm_atomic_set_property+0x990/0x990 [=
drm]
May 19 15:36:24 workstation kernel: ? __handle_mm_fault+0xd5f/0x1ae0
May 19 15:36:24 workstation kernel: amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
May 19 15:36:24 workstation kernel: do_vfs_ioctl+0x405/0x660
May 19 15:36:24 workstation kernel: ksys_ioctl+0x5e/0x90
May 19 15:36:24 workstation kernel: __x64_sys_ioctl+0x16/0x20
May 19 15:36:24 workstation kernel: do_syscall_64+0x5b/0x170
May 19 15:36:24 workstation kernel: entry_SYSCALL_64_after_hwframe+0x44/0xa9
May 19 15:36:24 workstation kernel: RIP: 0033:0x7f37bc7be03b
May 19 15:36:24 workstation kernel: Code: 0f 1e fa 48 8b 05 4d de 0c 00 64 =
c7
00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 =
00
00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d de 0c 00 f7 d8 64 89 0=
1 48
May 19 15:36:24 workstation kernel: RSP: 002b:00007ffffe52a508 EFLAGS: 0000=
0246
ORIG_RAX: 0000000000000010
May 19 15:36:24 workstation kernel: RAX: ffffffffffffffda RBX: 00007ffffe52=
a550
RCX: 00007f37bc7be03b
May 19 15:36:24 workstation kernel: RDX: 00007ffffe52a550 RSI: 00000000c038=
64bc
RDI: 0000000000000009
May 19 15:36:24 workstation kernel: RBP: 00000000c03864bc R08: 000000000000=
000d
R09: 00000000010819c0
May 19 15:36:24 workstation kernel: R10: 0000000000000002 R11: 000000000000=
0246
R12: 0000000001054e40
May 19 15:36:24 workstation kernel: R13: 0000000000000009 R14: 000000000117=
3f90
R15: 000000000115d5b0
May 19 15:36:24 workstation kernel: ---[ end trace 55f366954055c952 ]---
May 19 15:36:24 workstation kernel: ------------[ cut here ]------------

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15582764631.a7Ef9C4fB.20381
Date: Sun, 19 May 2019 14:34:23 +0000
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
   title=3D"NEW - Non recoverable crashes when entering screensaver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110710">110710</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Non recoverable crashes when entering screensaver
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
          <td>major
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
          <td>freedesktop&#64;soerensoerensen.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144300=
" name=3D"attach_144300" title=3D"Logs">attachment 144300</a> <a href=3D"at=
tachment.cgi?id=3D144300&amp;action=3Dedit" title=3D"Logs">[details]</a></s=
pan>
Logs

Computer crashes each time the screensaver is started and the whole machine
must be restarted forcefully. I can't even switch to other virtual consoles=
.=20

I'm running Fedora 30 using Sway 1 as WM.=20

The following message appears in the log A LOT:

May 19 15:36:24 workstation kernel: ------------[ cut here ]------------
May 19 15:36:24 workstation kernel: Global lock should be Set,
overall_update_type should be UPDATE_TYPE_MED or UPDATE_TYPE_FULL
May 19 15:36:24 workstation kernel: WARNING: CPU: 3 PID: 2983 at
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6079
amdgpu_dm_atomic_check+0x42b/0x470 [amdgpu]
May 19 15:36:24 workstation kernel: Modules linked in: xt_CHECKSUM
ipt_MASQUERADE tun devlink bridge stp llc ip6t_rpfilter ip6t_REJECT
nf_reject_ipv6 xt_conntrack ebtable_nat ip6table_nat nf_nat_ipv6
ip6table_mangle ip6table_raw ip6table_security iptable_nat nf_nat_ipv4 nf_n=
at
iptable_mangle iptable_raw iptable_security nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 libcrc32c ip_set nfnetlink ebtable_filter ebtables
ip6table_filter ip6_tables sunrpc vfat fat edac_mce_amd kvm_amd
snd_hda_codec_realtek ccp snd_hda_codec_generic ledtrig_audio
snd_hda_codec_hdmi kvm snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep
snd_seq irqbypass snd_seq_device snd_pcm wmi_bmof k10temp snd_timer sp5100_=
tco
i2c_piix4 snd soundcore joydev gpio_amdpt gpio_generic pcc_cpufreq acpi_cpu=
freq
dm_crypt amdgpu crct10dif_pclmul crc32_pclmul crc32c_intel chash amd_iommu_=
v2
gpu_sched i2c_algo_bit ttm drm_kms_helper ghash_clmulni_intel drm nvme
nvme_core r8169 wmi video pinctrl_amd
May 19 15:36:24 workstation kernel: CPU: 3 PID: 2983 Comm: sway Tainted: G=
=20=20=20=20=20
  W         5.0.16-300.fc30.x86_64 #1
May 19 15:36:24 workstation kernel: Hardware name: Gigabyte Technology Co.,
Ltd. AB350M-DS3H/AB350M-DS3H-CF, BIOS F24c 12/06/2018
May 19 15:36:24 workstation kernel: RIP:
0010:amdgpu_dm_atomic_check+0x42b/0x470 [amdgpu]
May 19 15:36:24 workstation kernel: Code: ff 49 8b 57 20 41 8b 77 60 48 c7 =
c7
f8 0d 4c c0 e8 8a 32 df ff eb 80 31 db e9 6d fe ff ff 48 c7 c7 48 0d 4c c0 =
e8
84 1f d7 f0 &lt;0f&gt; 0b e9 8d fe ff ff 48 c7 c7 a8 0d 4c c0 e8 71 1f d7 f=
0 0f 0b e9
May 19 15:36:24 workstation kernel: RSP: 0018:ffffb900424efb68 EFLAGS: 0001=
0286
May 19 15:36:24 workstation kernel: RAX: 0000000000000000 RBX: 000000000000=
0000
RCX: 0000000000000000
May 19 15:36:24 workstation kernel: RDX: 0000000000000004 RSI: ffffffffb29b=
067c
RDI: 0000000000000246
May 19 15:36:24 workstation kernel: RBP: ffff8d304e4b9800 R08: 0000090c1eec=
5c2d
R09: ffffb900424efb00
May 19 15:36:24 workstation kernel: R10: 0000000000018630 R11: 000000000000=
0003
R12: 0000000000000000
May 19 15:36:24 workstation kernel: R13: ffff8d3046c74800 R14: ffff8d3000e3=
5050
R15: ffff8d304c1cc280
May 19 15:36:24 workstation kernel: FS:  00007f37bba61a80(0000)
GS:ffff8d3050ac0000(0000) knlGS:0000000000000000
May 19 15:36:24 workstation kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
May 19 15:36:24 workstation kernel: CR2: 0000000001054e78 CR3: 000000040a5b=
e000
CR4: 00000000003406e0
May 19 15:36:24 workstation kernel: Call Trace:
May 19 15:36:24 workstation kernel: drm_atomic_check_only+0x57f/0x7b0 [drm]
May 19 15:36:24 workstation kernel: ? drm_event_reserve_init_locked+0x4c/0x=
80
[drm]
May 19 15:36:24 workstation kernel: drm_atomic_nonblocking_commit+0x13/0x50
[drm]
May 19 15:36:24 workstation kernel: drm_mode_atomic_ioctl+0x821/0x920 [drm]
May 19 15:36:24 workstation kernel: ? drm_atomic_set_property+0x990/0x990 [=
drm]
May 19 15:36:24 workstation kernel: drm_ioctl_kernel+0xa7/0xf0 [drm]
May 19 15:36:24 workstation kernel: drm_ioctl+0x208/0x390 [drm]
May 19 15:36:24 workstation kernel: ? drm_atomic_set_property+0x990/0x990 [=
drm]
May 19 15:36:24 workstation kernel: ? __handle_mm_fault+0xd5f/0x1ae0
May 19 15:36:24 workstation kernel: amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
May 19 15:36:24 workstation kernel: do_vfs_ioctl+0x405/0x660
May 19 15:36:24 workstation kernel: ksys_ioctl+0x5e/0x90
May 19 15:36:24 workstation kernel: __x64_sys_ioctl+0x16/0x20
May 19 15:36:24 workstation kernel: do_syscall_64+0x5b/0x170
May 19 15:36:24 workstation kernel: entry_SYSCALL_64_after_hwframe+0x44/0xa9
May 19 15:36:24 workstation kernel: RIP: 0033:0x7f37bc7be03b
May 19 15:36:24 workstation kernel: Code: 0f 1e fa 48 8b 05 4d de 0c 00 64 =
c7
00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 =
00
00 00 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b 0d 1d de 0c 00 f7 d8 6=
4 89 01 48
May 19 15:36:24 workstation kernel: RSP: 002b:00007ffffe52a508 EFLAGS: 0000=
0246
ORIG_RAX: 0000000000000010
May 19 15:36:24 workstation kernel: RAX: ffffffffffffffda RBX: 00007ffffe52=
a550
RCX: 00007f37bc7be03b
May 19 15:36:24 workstation kernel: RDX: 00007ffffe52a550 RSI: 00000000c038=
64bc
RDI: 0000000000000009
May 19 15:36:24 workstation kernel: RBP: 00000000c03864bc R08: 000000000000=
000d
R09: 00000000010819c0
May 19 15:36:24 workstation kernel: R10: 0000000000000002 R11: 000000000000=
0246
R12: 0000000001054e40
May 19 15:36:24 workstation kernel: R13: 0000000000000009 R14: 000000000117=
3f90
R15: 000000000115d5b0
May 19 15:36:24 workstation kernel: ---[ end trace 55f366954055c952 ]---
May 19 15:36:24 workstation kernel: ------------[ cut here ]------------</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15582764631.a7Ef9C4fB.20381--

--===============1281246840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1281246840==--
