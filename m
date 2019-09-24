Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA859BD108
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 19:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F5088503;
	Tue, 24 Sep 2019 17:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3927B6EAD0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 17:54:40 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 364B172162; Tue, 24 Sep 2019 17:54:40 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111803] Annoying GPU stucks are continued on Vega 20 with
 Kernel 5.4 + mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail
 [amdgpu]] *ERROR* Waiting for fences timed out!
Date: Tue, 24 Sep 2019 17:54:40 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111803-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0548202682=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0548202682==
Content-Type: multipart/alternative; boundary="15693476801.Bc31cFb.28010"
Content-Transfer-Encoding: 7bit


--15693476801.Bc31cFb.28010
Date: Tue, 24 Sep 2019 17:54:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111803

            Bug ID: 111803
           Summary: Annoying GPU stucks are continued on Vega 20 with
                    Kernel 5.4 + mesa 9.3.0 + llvm 9.0.0
                    [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR*
                    Waiting for fences timed out!
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mikhail.v.gavrilov@gmail.com

Created attachment 145490
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145490&action=3Dedit
dmesg

Annoying GPU stucks are continued on Vega 20 with Kernel 5.4 + mesa 9.3.0 +
llvm 9.0.0

For reproducing is enough on the machine when happened memory pressing laun=
ch
the game Supraland from steam store.

[48662.086736] INFO: task OnlineA-nstance:153979 blocked for more than 122
seconds.
[48662.086740]       Not tainted 5.4.0-0.rc0.git4.1a.fc32.x86_64 #1
[48662.086743] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this
message.
[48662.086746] OnlineA-nstance D12600 153979 153907 0x80004002
[48662.086753] Call Trace:
[48662.086760]  ? __schedule+0x307/0x950
[48662.086770]  schedule+0x40/0xc0
[48662.086775]  schedule_timeout+0x289/0x3c0
[48662.086782]  ? mark_held_locks+0x50/0x80
[48662.086787]  ? _raw_spin_unlock_irqrestore+0x4b/0x60
[48662.086792]  ? lockdep_hardirqs_on+0xf0/0x180
[48662.086803]  dma_fence_wait_any_timeout+0x208/0x275
[48662.086881]  amdgpu_sa_bo_new+0x44b/0x510 [amdgpu]
[48662.086982]  amdgpu_ib_get+0x31/0x80 [amdgpu]
[48662.087075]  amdgpu_job_alloc_with_ib+0x46/0x70 [amdgpu]
[48662.087081]  ? find_held_lock+0x32/0x90
[48662.087154]  amdgpu_vm_sdma_prepare+0x30/0x90 [amdgpu]
[48662.087243]  amdgpu_vm_bo_update_mapping+0x7b/0xe0 [amdgpu]
[48662.087318]  amdgpu_vm_clear_freed+0xd5/0x1d0 [amdgpu]
[48662.087395]  amdgpu_gem_object_close+0x159/0x1b0 [amdgpu]
[48662.087407]  ? lockdep_hardirqs_on+0xf0/0x180
[48662.087432]  drm_gem_object_release_handle+0x30/0x90 [drm]
[48662.087447]  ? drm_gem_object_handle_put_unlocked+0xa0/0xa0 [drm]
[48662.087453]  idr_for_each+0x5e/0xd0
[48662.087459]  ? mark_held_locks+0x50/0x80
[48662.087477]  drm_gem_release+0x1c/0x30 [drm]
[48662.087492]  drm_file_free.part.0+0x22e/0x270 [drm]
[48662.087509]  drm_release+0xab/0xe0 [drm]
[48662.087517]  __fput+0xdd/0x270
[48662.087525]  task_work_run+0x93/0xd0
[48662.087533]  do_exit+0x349/0xcd0
[48662.087539]  ? find_held_lock+0x32/0x90
[48662.087548]  do_group_exit+0x47/0xb0
[48662.087554]  get_signal+0x17e/0xcb0
[48662.087565]  do_signal+0x36/0x680
[48662.087580]  exit_to_usermode_loop+0x8d/0x120
[48662.087588]  syscall_return_slowpath+0x205/0x330
[48662.087594]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[48662.087599] RIP: 0033:0x7f0b10b4ffaa
[48662.087606] Code: Bad RIP value.
[48662.087610] RSP: 002b:00007f0ae77fdc40 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[48662.087615] RAX: fffffffffffffdfc RBX: 00000000000051ac RCX:
00007f0b10b4ffaa
[48662.087619] RDX: 0000000000000000 RSI: 0000000000000189 RDI:
00007f0b0ebf1170
[48662.087622] RBP: 00007f0b0ebf1148 R08: 0000000000000000 R09:
00000000ffffffff
[48662.087626] R10: 00007f0ae77fdd48 R11: 0000000000000246 R12:
0000000000000000
[48662.087629] R13: 00007f0b0ebf1120 R14: 00007f0b0ebf1170 R15:
00007f0ae77fdc80
[48662.087646]=20
               Showing all locks held in the system:
[48662.087662] 1 lock held by khungtaskd/96:
[48662.087665]  #0: ffffffff8d693760 (rcu_read_lock){....}, at:
debug_show_all_locks+0x15/0x174
[48662.087738] 1 lock held by CPU 0/KVM/3098:
[48662.087833] 2 locks held by dnf/104312:
[48662.087836]  #0: ffff8d88dacc80a0 (&tty->ldisc_sem){++++}, at:
tty_ldisc_ref_wait+0x24/0x50
[48662.087844]  #1: ffffa1088052a2f0 (&ldata->atomic_read_lock){+.+.}, at:
n_tty_read+0xe3/0x980
[48662.088002] 3 locks held by kworker/15:0/152888:
[48662.088005]  #0: ffff8d8936c21548 ((wq_completion)events){+.+.}, at:
process_one_work+0x1e9/0x5a0
[48662.088012]  #1: ffffa1088d61fe50
((work_completion)(&(&bdev->wq)->work)){+.+.}, at: process_one_work+0x1e9/0=
x5a0
[48662.088018]  #2: ffff8d892bf5c9f8 (reservation_ww_class_mutex){+.+.}, at:
ttm_bo_delayed_delete+0x8d/0x200 [ttm]
[48662.088032] 3 locks held by OnlineA-nstance/153979:
[48662.088035]  #0: ffffffffc0303070 (drm_global_mutex){+.+.}, at:
drm_release+0x2c/0xe0 [drm]
[48662.088054]  #1: ffffa1088d457b30 (reservation_ww_class_acquire){+.+.}, =
at:
amdgpu_gem_object_close+0xce/0x1b0 [amdgpu]
[48662.088126]  #2: ffff8d892bf5c9f8 (reservation_ww_class_mutex){+.+.}, at:
ttm_eu_reserve_buffers+0x349/0x620 [ttm]

[48662.088146] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15693476801.Bc31cFb.28010
Date: Tue, 24 Sep 2019 17:54:40 +0000
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
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *=
ERROR* Waiting for fences timed out!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111803">111803</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Annoying GPU stucks are continued on Vega 20 with Kernel 5.4 =
+ mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERRO=
R* Waiting for fences timed out!
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
          <td>not set
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
          <td>mikhail.v.gavrilov&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145490=
" name=3D"attach_145490" title=3D"dmesg">attachment 145490</a> <a href=3D"a=
ttachment.cgi?id=3D145490&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

Annoying GPU stucks are continued on Vega 20 with Kernel 5.4 + mesa 9.3.0 +
llvm 9.0.0

For reproducing is enough on the machine when happened memory pressing laun=
ch
the game Supraland from steam store.

[48662.086736] INFO: task OnlineA-nstance:153979 blocked for more than 122
seconds.
[48662.086740]       Not tainted 5.4.0-0.rc0.git4.1a.fc32.x86_64 #1
[48662.086743] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&qu=
ot; disables this
message.
[48662.086746] OnlineA-nstance D12600 153979 153907 0x80004002
[48662.086753] Call Trace:
[48662.086760]  ? __schedule+0x307/0x950
[48662.086770]  schedule+0x40/0xc0
[48662.086775]  schedule_timeout+0x289/0x3c0
[48662.086782]  ? mark_held_locks+0x50/0x80
[48662.086787]  ? _raw_spin_unlock_irqrestore+0x4b/0x60
[48662.086792]  ? lockdep_hardirqs_on+0xf0/0x180
[48662.086803]  dma_fence_wait_any_timeout+0x208/0x275
[48662.086881]  amdgpu_sa_bo_new+0x44b/0x510 [amdgpu]
[48662.086982]  amdgpu_ib_get+0x31/0x80 [amdgpu]
[48662.087075]  amdgpu_job_alloc_with_ib+0x46/0x70 [amdgpu]
[48662.087081]  ? find_held_lock+0x32/0x90
[48662.087154]  amdgpu_vm_sdma_prepare+0x30/0x90 [amdgpu]
[48662.087243]  amdgpu_vm_bo_update_mapping+0x7b/0xe0 [amdgpu]
[48662.087318]  amdgpu_vm_clear_freed+0xd5/0x1d0 [amdgpu]
[48662.087395]  amdgpu_gem_object_close+0x159/0x1b0 [amdgpu]
[48662.087407]  ? lockdep_hardirqs_on+0xf0/0x180
[48662.087432]  drm_gem_object_release_handle+0x30/0x90 [drm]
[48662.087447]  ? drm_gem_object_handle_put_unlocked+0xa0/0xa0 [drm]
[48662.087453]  idr_for_each+0x5e/0xd0
[48662.087459]  ? mark_held_locks+0x50/0x80
[48662.087477]  drm_gem_release+0x1c/0x30 [drm]
[48662.087492]  drm_file_free.part.0+0x22e/0x270 [drm]
[48662.087509]  drm_release+0xab/0xe0 [drm]
[48662.087517]  __fput+0xdd/0x270
[48662.087525]  task_work_run+0x93/0xd0
[48662.087533]  do_exit+0x349/0xcd0
[48662.087539]  ? find_held_lock+0x32/0x90
[48662.087548]  do_group_exit+0x47/0xb0
[48662.087554]  get_signal+0x17e/0xcb0
[48662.087565]  do_signal+0x36/0x680
[48662.087580]  exit_to_usermode_loop+0x8d/0x120
[48662.087588]  syscall_return_slowpath+0x205/0x330
[48662.087594]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[48662.087599] RIP: 0033:0x7f0b10b4ffaa
[48662.087606] Code: Bad RIP value.
[48662.087610] RSP: 002b:00007f0ae77fdc40 EFLAGS: 00000246 ORIG_RAX:
00000000000000ca
[48662.087615] RAX: fffffffffffffdfc RBX: 00000000000051ac RCX:
00007f0b10b4ffaa
[48662.087619] RDX: 0000000000000000 RSI: 0000000000000189 RDI:
00007f0b0ebf1170
[48662.087622] RBP: 00007f0b0ebf1148 R08: 0000000000000000 R09:
00000000ffffffff
[48662.087626] R10: 00007f0ae77fdd48 R11: 0000000000000246 R12:
0000000000000000
[48662.087629] R13: 00007f0b0ebf1120 R14: 00007f0b0ebf1170 R15:
00007f0ae77fdc80
[48662.087646]=20
               Showing all locks held in the system:
[48662.087662] 1 lock held by khungtaskd/96:
[48662.087665]  #0: ffffffff8d693760 (rcu_read_lock){....}, at:
debug_show_all_locks+0x15/0x174
[48662.087738] 1 lock held by CPU 0/KVM/3098:
[48662.087833] 2 locks held by dnf/104312:
[48662.087836]  #0: ffff8d88dacc80a0 (&amp;tty-&gt;ldisc_sem){++++}, at:
tty_ldisc_ref_wait+0x24/0x50
[48662.087844]  #1: ffffa1088052a2f0 (&amp;ldata-&gt;atomic_read_lock){+.+.=
}, at:
n_tty_read+0xe3/0x980
[48662.088002] 3 locks held by kworker/15:0/152888:
[48662.088005]  #0: ffff8d8936c21548 ((wq_completion)events){+.+.}, at:
process_one_work+0x1e9/0x5a0
[48662.088012]  #1: ffffa1088d61fe50
((work_completion)(&amp;(&amp;bdev-&gt;wq)-&gt;work)){+.+.}, at: process_on=
e_work+0x1e9/0x5a0
[48662.088018]  #2: ffff8d892bf5c9f8 (reservation_ww_class_mutex){+.+.}, at:
ttm_bo_delayed_delete+0x8d/0x200 [ttm]
[48662.088032] 3 locks held by OnlineA-nstance/153979:
[48662.088035]  #0: ffffffffc0303070 (drm_global_mutex){+.+.}, at:
drm_release+0x2c/0xe0 [drm]
[48662.088054]  #1: ffffa1088d457b30 (reservation_ww_class_acquire){+.+.}, =
at:
amdgpu_gem_object_close+0xce/0x1b0 [amdgpu]
[48662.088126]  #2: ffff8d892bf5c9f8 (reservation_ww_class_mutex){+.+.}, at:
ttm_eu_reserve_buffers+0x349/0x620 [ttm]

[48662.088146] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15693476801.Bc31cFb.28010--

--===============0548202682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0548202682==--
