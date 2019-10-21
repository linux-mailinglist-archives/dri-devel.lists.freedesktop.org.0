Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E25ADE534
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 09:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40FE899D4;
	Mon, 21 Oct 2019 07:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B2E2899D4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 07:22:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 07FFB720E4; Mon, 21 Oct 2019 07:22:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111229] Unable to unbind GPU from amdgpu
Date: Mon, 21 Oct 2019 07:22:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eugene@shatsky.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111229-502-cs4zEs66ep@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111229-502@http.bugs.freedesktop.org/>
References: <bug-111229-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0987042163=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0987042163==
Content-Type: multipart/alternative; boundary="15716425660.B3CBC0.9711"
Content-Transfer-Encoding: 7bit


--15716425660.B3CBC0.9711
Date: Mon, 21 Oct 2019 07:22:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111229

--- Comment #11 from Eugene Shatsky <eugene@shatsky.net> ---
Since last comment I've used this for a dozen times for switching between L=
inux
desktop and Windows VM, one time amdgpu crashed after resume from suspend b=
ut
I'm not sure if it was related to this bug and I was still able to reboot a=
fter
it.
However I still get this warning sometimes on unbind:

WARNING: CPU: 0 PID: 1109 at drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:929
amdgpu_bo_unpin+0xc8/0xf0 [amdgpu]
Modules linked in: vfio_pci vfio_virqfd vfio_iommu_type1 vfio fuse amdgpu
amd_iommu_v2 gpu_sched ttm xt_CHECKSUM xt_MASQUERADE ipt_REJECT nf_rejec>
 nf_conntrack nf_defrag_ipv4 libcrc32c zsmalloc ip6t_rpfilter ipt_rpfilter
ip6table_raw iptable_raw xt_pkttype nf_log_ipv6 nf_log_ipv4 nf_log_comm>
CPU: 0 PID: 1109 Comm: .libvirtd-wrapp Tainted: G           O      5.3.0-rc7
#1-NixOS
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./H61M-DGS R2.0,
BIOS P1.10 10/01/2013
RIP: 0010:amdgpu_bo_unpin+0xc8/0xf0 [amdgpu]
Code: ff 48 83 c0 0c 48 39 d0 75 ea 48 8d 73 30 48 8d 7b 50 48 8d 54 24 08 =
e8
46 1f d8 ff 85 c0 74 a1 e9 30 6c 21 00 e8 28 f9 6b f5 <0f> 0b 48 8b >
RSP: 0018:ffffa4df00a4bd28 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8c60449a4800 RCX: 0000000000000002
RDX: ffff8c60423c9b00 RSI: 0000000000000000 RDI: ffff8c60449a4800
RBP: ffff8c6008fa4058 R08: 0000000000000000 R09: ffffffffc0b3c000
R10: ffff8c60449a2800 R11: 0000000000000001 R12: ffff8c6008fa6378
R13: ffff8c6008fa6370 R14: ffff8c6008fa4058 R15: ffff8c6008d7f260
FS:  00007fac9a81f700(0000) GS:ffff8c605f400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffea51ccff8 CR3: 00000004048c4003 CR4: 00000000001606f0
Call Trace:
 amdgpu_bo_free_kernel+0x6b/0x120 [amdgpu]
 amdgpu_gfx_rlc_fini+0x47/0x70 [amdgpu]
 gfx_v8_0_sw_fini+0xa1/0x1a0 [amdgpu]
 amdgpu_device_fini+0x257/0x479 [amdgpu]
 amdgpu_driver_unload_kms+0x4a/0x90 [amdgpu]
 drm_dev_unregister+0x4b/0xb0 [drm]
 amdgpu_pci_remove+0x25/0x50 [amdgpu]
 pci_device_remove+0x3b/0xc0
 device_release_driver_internal+0xd8/0x1b0
 unbind_store+0x94/0x120
 kernfs_fop_write+0x108/0x190
 vfs_write+0xa5/0x1a0
 ksys_write+0x59/0xd0
 do_syscall_64+0x4e/0x120
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7faca4a7b36f
Code: 1f 40 00 41 54 55 49 89 d4 53 48 89 f5 89 fb 48 83 ec 10 e8 53 fd ff =
ff
4c 89 e2 41 89 c0 48 89 ee 89 df b8 01 00 00 00 0f 05 <48> 3d 00 f0 >
RSP: 002b:00007fac9a81e4d0 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000012 RCX: 00007faca4a7b36f
RDX: 000000000000000c RSI: 00007fac84019a20 RDI: 0000000000000012
RBP: 00007fac84019a20 R08: 0000000000000000 R09: 000000000000002f
R10: 0000000000000000 R11: 0000000000000293 R12: 000000000000000c
R13: 0000000000000000 R14: 0000000000000012 R15: 00007fac9a81e568
---[ end trace ffd153eee3d00ec4 ]---
amdgpu 0000:01:00.0: 00000000001146cc unpin not necessary

It's produced by
https://github.com/torvalds/linux/blob/574cc4539762561d96b456dbc0544d8898bd=
4c6e/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c#L937
, I wonder if buffer object pin count is something like reference count

Also it looks like the message

*ERROR* Device removal is currently not supported outside of fbcon

is printed non-conditionally, without checking if DRM nodes are being used =
by
userspace clients. I wonder if it's possible to implement such a check and
prevent the unbind if they are

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15716425660.B3CBC0.9711
Date: Mon, 21 Oct 2019 07:22:45 +0000
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
   title=3D"NEW - Unable to unbind GPU from amdgpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111229#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to unbind GPU from amdgpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111229">bug 11122=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eugene&#64;shatsky.net" title=3D"Eugene Shatsky &lt;eugene&#64;shatsky.net&=
gt;"> <span class=3D"fn">Eugene Shatsky</span></a>
</span></b>
        <pre>Since last comment I've used this for a dozen times for switch=
ing between Linux
desktop and Windows VM, one time amdgpu crashed after resume from suspend b=
ut
I'm not sure if it was related to this bug and I was still able to reboot a=
fter
it.
However I still get this warning sometimes on unbind:

WARNING: CPU: 0 PID: 1109 at drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:929
amdgpu_bo_unpin+0xc8/0xf0 [amdgpu]
Modules linked in: vfio_pci vfio_virqfd vfio_iommu_type1 vfio fuse amdgpu
amd_iommu_v2 gpu_sched ttm xt_CHECKSUM xt_MASQUERADE ipt_REJECT nf_rejec&gt;
 nf_conntrack nf_defrag_ipv4 libcrc32c zsmalloc ip6t_rpfilter ipt_rpfilter
ip6table_raw iptable_raw xt_pkttype nf_log_ipv6 nf_log_ipv4 nf_log_comm&gt;
CPU: 0 PID: 1109 Comm: .libvirtd-wrapp Tainted: G           O      5.3.0-rc7
#1-NixOS
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./H61M-DGS R2.0,
BIOS P1.10 10/01/2013
RIP: 0010:amdgpu_bo_unpin+0xc8/0xf0 [amdgpu]
Code: ff 48 83 c0 0c 48 39 d0 75 ea 48 8d 73 30 48 8d 7b 50 48 8d 54 24 08 =
e8
46 1f d8 ff 85 c0 74 a1 e9 30 6c 21 00 e8 28 f9 6b f5 &lt;0f&gt; 0b 48 8b &=
gt;
RSP: 0018:ffffa4df00a4bd28 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff8c60449a4800 RCX: 0000000000000002
RDX: ffff8c60423c9b00 RSI: 0000000000000000 RDI: ffff8c60449a4800
RBP: ffff8c6008fa4058 R08: 0000000000000000 R09: ffffffffc0b3c000
R10: ffff8c60449a2800 R11: 0000000000000001 R12: ffff8c6008fa6378
R13: ffff8c6008fa6370 R14: ffff8c6008fa4058 R15: ffff8c6008d7f260
FS:  00007fac9a81f700(0000) GS:ffff8c605f400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffea51ccff8 CR3: 00000004048c4003 CR4: 00000000001606f0
Call Trace:
 amdgpu_bo_free_kernel+0x6b/0x120 [amdgpu]
 amdgpu_gfx_rlc_fini+0x47/0x70 [amdgpu]
 gfx_v8_0_sw_fini+0xa1/0x1a0 [amdgpu]
 amdgpu_device_fini+0x257/0x479 [amdgpu]
 amdgpu_driver_unload_kms+0x4a/0x90 [amdgpu]
 drm_dev_unregister+0x4b/0xb0 [drm]
 amdgpu_pci_remove+0x25/0x50 [amdgpu]
 pci_device_remove+0x3b/0xc0
 device_release_driver_internal+0xd8/0x1b0
 unbind_store+0x94/0x120
 kernfs_fop_write+0x108/0x190
 vfs_write+0xa5/0x1a0
 ksys_write+0x59/0xd0
 do_syscall_64+0x4e/0x120
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7faca4a7b36f
Code: 1f 40 00 41 54 55 49 89 d4 53 48 89 f5 89 fb 48 83 ec 10 e8 53 fd ff =
ff
4c 89 e2 41 89 c0 48 89 ee 89 df b8 01 00 00 00 0f 05 &lt;48&gt; 3d 00 f0 &=
gt;
RSP: 002b:00007fac9a81e4d0 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000012 RCX: 00007faca4a7b36f
RDX: 000000000000000c RSI: 00007fac84019a20 RDI: 0000000000000012
RBP: 00007fac84019a20 R08: 0000000000000000 R09: 000000000000002f
R10: 0000000000000000 R11: 0000000000000293 R12: 000000000000000c
R13: 0000000000000000 R14: 0000000000000012 R15: 00007fac9a81e568
---[ end trace ffd153eee3d00ec4 ]---
amdgpu 0000:01:00.0: 00000000001146cc unpin not necessary

It's produced by
<a href=3D"https://github.com/torvalds/linux/blob/574cc4539762561d96b456dbc=
0544d8898bd4c6e/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c#L937">https://gi=
thub.com/torvalds/linux/blob/574cc4539762561d96b456dbc0544d8898bd4c6e/drive=
rs/gpu/drm/amd/amdgpu/amdgpu_object.c#L937</a>
, I wonder if buffer object pin count is something like reference count

Also it looks like the message

*ERROR* Device removal is currently not supported outside of fbcon

is printed non-conditionally, without checking if DRM nodes are being used =
by
userspace clients. I wonder if it's possible to implement such a check and
prevent the unbind if they are</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15716425660.B3CBC0.9711--

--===============0987042163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0987042163==--
