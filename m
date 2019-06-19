Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAD34B9BD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 15:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7DC46E3CE;
	Wed, 19 Jun 2019 13:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83E6E6E3CE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:22:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7B9E772167; Wed, 19 Jun 2019 13:22:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110949] Continuious warnings from agd5f 5.3-wip branch
Date: Wed, 19 Jun 2019 13:22:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mike@fireburn.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110949-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1252147577=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1252147577==
Content-Type: multipart/alternative; boundary="15609505730.c3cFfF.15923"
Content-Transfer-Encoding: 7bit


--15609505730.c3cFfF.15923
Date: Wed, 19 Jun 2019 13:22:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110949

            Bug ID: 110949
           Summary: Continuious warnings from agd5f 5.3-wip branch
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mike@fireburn.co.uk

Created attachment 144594
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144594&action=3Dedit
Compressed log

Jun 19 14:20:01 quark kernel: [drm] pstate TEST_DEBUG_DATA: 0x36F6F00F
Jun 19 14:20:01 quark kernel: WARNING: CPU: 6 PID: 229 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:872
dcn10_verify_allow_pstate_change_high+0x20/0x240
Jun 19 14:20:01 quark kernel: Modules linked in:
Jun 19 14:20:01 quark kernel: CPU: 6 PID: 229 Comm: kworker/u32:8 Tainted: =
G=20=20=20
    W         5.2.0-rc2-agd5f+ #380
Jun 19 14:20:01 quark kernel: Hardware name: System manufacturer System Pro=
duct
Name/ROG STRIX X470-I GAMING, BIOS 2202 04/11/2019
Jun 19 14:20:01 quark kernel: Workqueue: events_unbound commit_work
Jun 19 14:20:01 quark kernel: RIP:
0010:dcn10_verify_allow_pstate_change_high+0x20/0x240
Jun 19 14:20:01 quark kernel: Code: 66 2e 0f 1f 84 00 00 00 00 00 55 53 48 =
89
fb 48 8b 87 80 02 00 00 48 8b b8 b0 01 00 00 e8 28 02 01 00 84 c0 0f 85 1b =
02
00 00 <0f> 0b 80 bb 97 01 00 00 00 0f 84 0c 02 00 00 48 8b 83 80 02 00 00
Jun 19 14:20:01 quark kernel: RSP: 0018:ffffc9000049fb00 EFLAGS: 00010246
Jun 19 14:20:01 quark kernel: RAX: 0000000000000000 RBX: ffff8887fbc38000 R=
CX:
0000000000000000
Jun 19 14:20:01 quark kernel: RDX: 0000000000000000 RSI: ffff888800b96148 R=
DI:
00000000ffffffff
Jun 19 14:20:01 quark kernel: RBP: ffffc9000049fb78 R08: 0000000000000400 R=
09:
00000000000140f9
Jun 19 14:20:01 quark kernel: R10: 0000000000000007 R11: 0000000000000000 R=
12:
ffff8887fbc38000
Jun 19 14:20:01 quark kernel: R13: ffff8887fb404800 R14: 0000000000000001 R=
15:
0000000000000004
Jun 19 14:20:01 quark kernel: FS:  0000000000000000(0000)
GS:ffff888800b80000(0000) knlGS:0000000000000000
Jun 19 14:20:01 quark kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Jun 19 14:20:01 quark kernel: CR2: 00007fcaaf660368 CR3: 00000007efd26000 C=
R4:
00000000003406a0
Jun 19 14:20:01 quark kernel: Call Trace:
Jun 19 14:20:01 quark kernel:  ? dc_commit_updates_for_stream+0xa7e/0xec0
Jun 19 14:20:01 quark kernel:  ?
amdgpu_dm_commit_planes.constprop.0+0x70c/0x910
Jun 19 14:20:01 quark kernel:  ? amdgpu_dm_atomic_commit_tail+0x359/0xde0
Jun 19 14:20:01 quark kernel:  ? load_balance+0x177/0x9e0
Jun 19 14:20:01 quark kernel:  ? sched_clock_cpu+0x10/0xd0
Jun 19 14:20:01 quark kernel:  ? preempt_count_add+0x74/0xa0
Jun 19 14:20:01 quark kernel:  ? _raw_spin_lock_irq+0xf/0x30
Jun 19 14:20:01 quark kernel:  ? _raw_spin_unlock_irq+0xe/0x20
Jun 19 14:20:01 quark kernel:  ? wait_for_completion_timeout+0xe3/0x110
Jun 19 14:20:01 quark kernel:  ? _raw_spin_unlock_irq+0xe/0x20
Jun 19 14:20:01 quark kernel:  ? finish_task_switch+0x7a/0x240
Jun 19 14:20:01 quark kernel:  ? __update_idle_core+0x1b/0xa0
Jun 19 14:20:01 quark kernel:  ? commit_tail+0x34/0x60
Jun 19 14:20:01 quark kernel:  ? commit_tail+0x34/0x60
Jun 19 14:20:01 quark kernel:  ? process_one_work+0x199/0x310
Jun 19 14:20:01 quark kernel:  ? worker_thread+0x45/0x3c0
Jun 19 14:20:01 quark kernel:  ? kthread+0xf8/0x130
Jun 19 14:20:01 quark kernel:  ? wq_update_unbound_numa+0x10/0x10
Jun 19 14:20:01 quark kernel:  ? kthread_park+0x80/0x80
Jun 19 14:20:01 quark kernel:  ? ret_from_fork+0x1f/0x30
Jun 19 14:20:01 quark kernel: ---[ end trace 25db1648dbe2f9f1 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15609505730.c3cFfF.15923
Date: Wed, 19 Jun 2019 13:22:53 +0000
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
   title=3D"NEW - Continuious warnings from agd5f 5.3-wip branch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110949">110949</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Continuious warnings from agd5f 5.3-wip branch
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
          <td>mike&#64;fireburn.co.uk
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144594=
" name=3D"attach_144594" title=3D"Compressed log">attachment 144594</a> <a =
href=3D"attachment.cgi?id=3D144594&amp;action=3Dedit" title=3D"Compressed l=
og">[details]</a></span>
Compressed log

Jun 19 14:20:01 quark kernel: [drm] pstate TEST_DEBUG_DATA: 0x36F6F00F
Jun 19 14:20:01 quark kernel: WARNING: CPU: 6 PID: 229 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_hw_sequencer.c:872
dcn10_verify_allow_pstate_change_high+0x20/0x240
Jun 19 14:20:01 quark kernel: Modules linked in:
Jun 19 14:20:01 quark kernel: CPU: 6 PID: 229 Comm: kworker/u32:8 Tainted: =
G=20=20=20
    W         5.2.0-rc2-agd5f+ #380
Jun 19 14:20:01 quark kernel: Hardware name: System manufacturer System Pro=
duct
Name/ROG STRIX X470-I GAMING, BIOS 2202 04/11/2019
Jun 19 14:20:01 quark kernel: Workqueue: events_unbound commit_work
Jun 19 14:20:01 quark kernel: RIP:
0010:dcn10_verify_allow_pstate_change_high+0x20/0x240
Jun 19 14:20:01 quark kernel: Code: 66 2e 0f 1f 84 00 00 00 00 00 55 53 48 =
89
fb 48 8b 87 80 02 00 00 48 8b b8 b0 01 00 00 e8 28 02 01 00 84 c0 0f 85 1b =
02
00 00 &lt;0f&gt; 0b 80 bb 97 01 00 00 00 0f 84 0c 02 00 00 48 8b 83 80 02 0=
0 00
Jun 19 14:20:01 quark kernel: RSP: 0018:ffffc9000049fb00 EFLAGS: 00010246
Jun 19 14:20:01 quark kernel: RAX: 0000000000000000 RBX: ffff8887fbc38000 R=
CX:
0000000000000000
Jun 19 14:20:01 quark kernel: RDX: 0000000000000000 RSI: ffff888800b96148 R=
DI:
00000000ffffffff
Jun 19 14:20:01 quark kernel: RBP: ffffc9000049fb78 R08: 0000000000000400 R=
09:
00000000000140f9
Jun 19 14:20:01 quark kernel: R10: 0000000000000007 R11: 0000000000000000 R=
12:
ffff8887fbc38000
Jun 19 14:20:01 quark kernel: R13: ffff8887fb404800 R14: 0000000000000001 R=
15:
0000000000000004
Jun 19 14:20:01 quark kernel: FS:  0000000000000000(0000)
GS:ffff888800b80000(0000) knlGS:0000000000000000
Jun 19 14:20:01 quark kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005=
0033
Jun 19 14:20:01 quark kernel: CR2: 00007fcaaf660368 CR3: 00000007efd26000 C=
R4:
00000000003406a0
Jun 19 14:20:01 quark kernel: Call Trace:
Jun 19 14:20:01 quark kernel:  ? dc_commit_updates_for_stream+0xa7e/0xec0
Jun 19 14:20:01 quark kernel:  ?
amdgpu_dm_commit_planes.constprop.0+0x70c/0x910
Jun 19 14:20:01 quark kernel:  ? amdgpu_dm_atomic_commit_tail+0x359/0xde0
Jun 19 14:20:01 quark kernel:  ? load_balance+0x177/0x9e0
Jun 19 14:20:01 quark kernel:  ? sched_clock_cpu+0x10/0xd0
Jun 19 14:20:01 quark kernel:  ? preempt_count_add+0x74/0xa0
Jun 19 14:20:01 quark kernel:  ? _raw_spin_lock_irq+0xf/0x30
Jun 19 14:20:01 quark kernel:  ? _raw_spin_unlock_irq+0xe/0x20
Jun 19 14:20:01 quark kernel:  ? wait_for_completion_timeout+0xe3/0x110
Jun 19 14:20:01 quark kernel:  ? _raw_spin_unlock_irq+0xe/0x20
Jun 19 14:20:01 quark kernel:  ? finish_task_switch+0x7a/0x240
Jun 19 14:20:01 quark kernel:  ? __update_idle_core+0x1b/0xa0
Jun 19 14:20:01 quark kernel:  ? commit_tail+0x34/0x60
Jun 19 14:20:01 quark kernel:  ? commit_tail+0x34/0x60
Jun 19 14:20:01 quark kernel:  ? process_one_work+0x199/0x310
Jun 19 14:20:01 quark kernel:  ? worker_thread+0x45/0x3c0
Jun 19 14:20:01 quark kernel:  ? kthread+0xf8/0x130
Jun 19 14:20:01 quark kernel:  ? wq_update_unbound_numa+0x10/0x10
Jun 19 14:20:01 quark kernel:  ? kthread_park+0x80/0x80
Jun 19 14:20:01 quark kernel:  ? ret_from_fork+0x1f/0x30
Jun 19 14:20:01 quark kernel: ---[ end trace 25db1648dbe2f9f1 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15609505730.c3cFfF.15923--

--===============1252147577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1252147577==--
