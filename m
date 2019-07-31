Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A137CC90
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 21:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BB689BA5;
	Wed, 31 Jul 2019 19:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9980389BA5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 19:11:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 909EE72167; Wed, 31 Jul 2019 19:11:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111273] crash calling AMDGPU_INFO_READ_MMR_REG with count set
 to -1
Date: Wed, 31 Jul 2019 19:11:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: trek00@inbox.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111273-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1520467343=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1520467343==
Content-Type: multipart/alternative; boundary="15646003190.715CC1.24803"
Content-Transfer-Encoding: 7bit


--15646003190.715CC1.24803
Date: Wed, 31 Jul 2019 19:11:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111273

            Bug ID: 111273
           Summary: crash calling AMDGPU_INFO_READ_MMR_REG with count set
                    to -1
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: trek00@inbox.ru

calling from libdrm_amdgpu
  amdgpu_read_mm_registers(dev, 0x8010 / 4, -1, 0xffffffff, 0, out)
leads to this dump:

WARNING: CPU: 3 PID: 30278 at mm/page_alloc.c:4377
__alloc_pages_nodemask+0x241/0x2b0
CPU: 3 PID: 30278 Comm: radeontop Not tainted 4.19.0-5-amd64 #1 Debian
4.19.37-5+deb10u1
RIP: 0010:__alloc_pages_nodemask+0x241/0x2b0
Code: 89 f7 89 ee 45 31 f6 e8 bd d5 ff ff e9 fb fe ff ff e8 e3 ac 01 00 e9 =
cb
fe ff ff 45 31 f6 81 e7 00 02 00 00 0f 85 e7 fe ff ff <0f> 0b e9 e0 fe ff f=
f 31
c0 e9 6a fe ff ff 65 48 8b 04 25 40 5c 01
RSP: 0018:ffffb64a01c27a58 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8b4853df0000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000016 RDI: 0000000000000000
RBP: 00000003fffffffc R08: 0000000000000001 R09: ffffffffc0f01ebf
R10: 0000000000000000 R11: 0000000000000000 R12: 00000000006000c0
R13: ffffb64a01c27d98 R14: 0000000000000000 R15: 0000000000000008
FS:  00007fa12fe5f280(0000) GS:ffff8b4856f80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa12f5f45b0 CR3: 000000010e498000 CR4: 00000000000406e0
Call Trace:
 kmalloc_order+0x14/0x30
 kmalloc_order_trace+0x1d/0xa0
 amdgpu_info_ioctl+0x908/0x1290 [amdgpu]
 ? get_page_from_freelist+0x7be/0x11b0
 ? unix_destruct_scm+0x80/0xa0
 ? select_idle_sibling+0x22/0x3a0
 ? kmem_cache_free+0x1a7/0x1d0
 ? free_unref_page_commit+0x91/0x100
 ? amdgpu_firmware_info.isra.5+0x210/0x210 [amdgpu]
 drm_ioctl_kernel+0xa1/0xf0 [drm]
 drm_ioctl+0x206/0x3a0 [drm]
 ? amdgpu_firmware_info.isra.5+0x210/0x210 [amdgpu]
 ? tlb_finish_mmu+0x1f/0x30
 ? unmap_region+0xdd/0x110
 amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
 do_vfs_ioctl+0xa4/0x630
 ksys_ioctl+0x60/0x90
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x53/0x110
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fa12faa8427
Code: 00 00 90 48 8b 05 69 aa 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff =
ff
c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 7=
3 01
c3 48 8b 0d 39 aa 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffc737ffda8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00005561b8c625b0 RCX: 00007fa12faa8427
RDX: 00007ffc737ffdf0 RSI: 0000000040206445 RDI: 0000000000000003
RBP: 00007ffc737ffdf0 R08: 0000000000000000 R09: 00005561b8c6a950
R10: fffffffffffffd06 R11: 0000000000000246 R12: 0000000040206445
R13: 0000000000000003 R14: 00007ffc7380002b R15: 0000000000000000
---[ end trace e7c99a8c5897d841 ]---

libdrm's amdgpu_read_mm_registers() calls drmCommandWrite(DRM_AMDGPU_INFO) =
with
AMDGPU_INFO_READ_MMR_REG query, that calls kernel's amdgpu_kms.c
amdgpu_info_ioctl()

it is not always reproducible, but it seems I can crash it once for each bo=
ot

the system is Debian 10 buster amd64 Linux 4.19.37 libdrm 2.4.97 chipset KA=
VERI

tell me if you need more info
thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15646003190.715CC1.24803
Date: Wed, 31 Jul 2019 19:11:59 +0000
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
   title=3D"NEW - crash calling AMDGPU_INFO_READ_MMR_REG with count set to =
-1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111273">111273</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>crash calling AMDGPU_INFO_READ_MMR_REG with count set to -1
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
          <td>trek00&#64;inbox.ru
          </td>
        </tr></table>
      <p>
        <div>
        <pre>calling from libdrm_amdgpu
  amdgpu_read_mm_registers(dev, 0x8010 / 4, -1, 0xffffffff, 0, out)
leads to this dump:

WARNING: CPU: 3 PID: 30278 at mm/page_alloc.c:4377
__alloc_pages_nodemask+0x241/0x2b0
CPU: 3 PID: 30278 Comm: radeontop Not tainted 4.19.0-5-amd64 #1 Debian
4.19.37-5+deb10u1
RIP: 0010:__alloc_pages_nodemask+0x241/0x2b0
Code: 89 f7 89 ee 45 31 f6 e8 bd d5 ff ff e9 fb fe ff ff e8 e3 ac 01 00 e9 =
cb
fe ff ff 45 31 f6 81 e7 00 02 00 00 0f 85 e7 fe ff ff &lt;0f&gt; 0b e9 e0 f=
e ff ff 31
c0 e9 6a fe ff ff 65 48 8b 04 25 40 5c 01
RSP: 0018:ffffb64a01c27a58 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8b4853df0000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000016 RDI: 0000000000000000
RBP: 00000003fffffffc R08: 0000000000000001 R09: ffffffffc0f01ebf
R10: 0000000000000000 R11: 0000000000000000 R12: 00000000006000c0
R13: ffffb64a01c27d98 R14: 0000000000000000 R15: 0000000000000008
FS:  00007fa12fe5f280(0000) GS:ffff8b4856f80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa12f5f45b0 CR3: 000000010e498000 CR4: 00000000000406e0
Call Trace:
 kmalloc_order+0x14/0x30
 kmalloc_order_trace+0x1d/0xa0
 amdgpu_info_ioctl+0x908/0x1290 [amdgpu]
 ? get_page_from_freelist+0x7be/0x11b0
 ? unix_destruct_scm+0x80/0xa0
 ? select_idle_sibling+0x22/0x3a0
 ? kmem_cache_free+0x1a7/0x1d0
 ? free_unref_page_commit+0x91/0x100
 ? amdgpu_firmware_info.isra.5+0x210/0x210 [amdgpu]
 drm_ioctl_kernel+0xa1/0xf0 [drm]
 drm_ioctl+0x206/0x3a0 [drm]
 ? amdgpu_firmware_info.isra.5+0x210/0x210 [amdgpu]
 ? tlb_finish_mmu+0x1f/0x30
 ? unmap_region+0xdd/0x110
 amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
 do_vfs_ioctl+0xa4/0x630
 ksys_ioctl+0x60/0x90
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x53/0x110
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fa12faa8427
Code: 00 00 90 48 8b 05 69 aa 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff =
ff
c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 &lt;48&gt; 3d 01 f0 f=
f ff 73 01
c3 48 8b 0d 39 aa 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffc737ffda8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00005561b8c625b0 RCX: 00007fa12faa8427
RDX: 00007ffc737ffdf0 RSI: 0000000040206445 RDI: 0000000000000003
RBP: 00007ffc737ffdf0 R08: 0000000000000000 R09: 00005561b8c6a950
R10: fffffffffffffd06 R11: 0000000000000246 R12: 0000000040206445
R13: 0000000000000003 R14: 00007ffc7380002b R15: 0000000000000000
---[ end trace e7c99a8c5897d841 ]---

libdrm's amdgpu_read_mm_registers() calls drmCommandWrite(DRM_AMDGPU_INFO) =
with
AMDGPU_INFO_READ_MMR_REG query, that calls kernel's amdgpu_kms.c
amdgpu_info_ioctl()

it is not always reproducible, but it seems I can crash it once for each bo=
ot

the system is Debian 10 buster amd64 Linux 4.19.37 libdrm 2.4.97 chipset KA=
VERI

tell me if you need more info
thanks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15646003190.715CC1.24803--

--===============1520467343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1520467343==--
