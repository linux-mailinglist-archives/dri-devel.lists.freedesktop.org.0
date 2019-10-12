Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2948D5354
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 01:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C330E6E0E1;
	Sat, 12 Oct 2019 23:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A601B6E0E2
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2019 23:42:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A2AF57296E; Sat, 12 Oct 2019 23:42:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111804] Annoying GPU stucks are continued on Vega 20 with
 Kernel 5.4 + mesa 9.2.0 RC4 + llvm 9.0.0
 [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
 [CRTC:47:crtc-0] flip_done timed out
Date: Sat, 12 Oct 2019 23:42:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: jamespharvey20@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111804-502-uFUzS4Li9W@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111804-502@http.bugs.freedesktop.org/>
References: <bug-111804-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2033182334=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2033182334==
Content-Type: multipart/alternative; boundary="15709237322.EF0fcC64.31967"
Content-Transfer-Encoding: 7bit


--15709237322.EF0fcC64.31967
Date: Sat, 12 Oct 2019 23:42:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111804

--- Comment #8 from jamespharvey20@gmail.com ---
Just ran into this with the Vega 64.  No games open.  Only KDE, suckless
terminal, firefox, and remote-viewer.

Thankfully, I'm not sure of any negative effects.  I'm not even sure I need=
 to
reboot, and only saw this while looking at journalctl for another reason.

Currently running 5.3.0, mesa 19.2.0, and llvm 8.0.1.  Going to be upgradin=
g to
5.3.5, 19.2.1, and 9.0.0 soon, but haven't done so yet.



Oct 11 00:13:53 newKvm kernel: [drm] amdgpu_dm_irq_schedule_work FAILED src=
 11
(yeah, nothing else with this message almost 2 days before this problem)

Oct 12 19:34:58 newKvm kernel: kworker/u65:4   D    0 2652517      2 0x8000=
4080
Oct 12 19:34:58 newKvm kernel: Workqueue: events_unbound commit_work
[drm_kms_helper]
Oct 12 19:34:58 newKvm kernel: Call Trace:
Oct 12 19:34:58 newKvm kernel:  ? __schedule+0x27f/0x6d0
Oct 12 19:34:58 newKvm kernel:  schedule+0x43/0xd0
Oct 12 19:34:58 newKvm kernel:  schedule_timeout+0x1cf/0x3d0
Oct 12 19:34:58 newKvm kernel:  ? collect_expired_timers+0xb0/0xb0
Oct 12 19:34:58 newKvm kernel:  wait_for_common+0xeb/0x190
Oct 12 19:34:58 newKvm kernel:  ? wake_up_q+0x60/0x60
Oct 12 19:34:58 newKvm kernel:  drm_atomic_helper_wait_for_flip_done+0x5f/0=
xb0
[drm_kms_helper]
Oct 12 19:34:58 newKvm kernel:  amdgpu_dm_atomic_commit_tail+0x1898/0x1d00
[amdgpu]
Oct 12 19:34:58 newKvm kernel:  ? commit_tail+0x3c/0x70 [drm_kms_helper]
Oct 12 19:34:58 newKvm kernel:  commit_tail+0x3c/0x70 [drm_kms_helper]
Oct 12 19:34:58 newKvm kernel:  process_one_work+0x1d1/0x3a0
Oct 12 19:34:58 newKvm kernel:  worker_thread+0x4a/0x3d0
Oct 12 19:34:58 newKvm kernel:  kthread+0xfb/0x130
Oct 12 19:34:58 newKvm kernel:  ? process_one_work+0x3a0/0x3a0
Oct 12 19:34:58 newKvm kernel:  ? kthread_park+0x80/0x80
Oct 12 19:34:58 newKvm kernel:  ret_from_fork+0x35/0x40

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15709237322.EF0fcC64.31967
Date: Sat, 12 Oct 2019 23:42:12 +0000
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
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.2.0 RC4 + llvm 9.0.0 [drm:drm_atomic_helper_wait_for_flip_done=
 [drm_kms_helper]] *ERROR* [CRTC:47:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111804#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.2.0 RC4 + llvm 9.0.0 [drm:drm_atomic_helper_wait_for_flip_done=
 [drm_kms_helper]] *ERROR* [CRTC:47:crtc-0] flip_done timed out"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111804">bug 11180=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jamespharvey20&#64;gmail.com" title=3D"jamespharvey20&#64;gmail.com">jamesp=
harvey20&#64;gmail.com</a>
</span></b>
        <pre>Just ran into this with the Vega 64.  No games open.  Only KDE=
, suckless
terminal, firefox, and remote-viewer.

Thankfully, I'm not sure of any negative effects.  I'm not even sure I need=
 to
reboot, and only saw this while looking at journalctl for another reason.

Currently running 5.3.0, mesa 19.2.0, and llvm 8.0.1.  Going to be upgradin=
g to
5.3.5, 19.2.1, and 9.0.0 soon, but haven't done so yet.



Oct 11 00:13:53 newKvm kernel: [drm] amdgpu_dm_irq_schedule_work FAILED src=
 11
(yeah, nothing else with this message almost 2 days before this problem)

Oct 12 19:34:58 newKvm kernel: kworker/u65:4   D    0 2652517      2 0x8000=
4080
Oct 12 19:34:58 newKvm kernel: Workqueue: events_unbound commit_work
[drm_kms_helper]
Oct 12 19:34:58 newKvm kernel: Call Trace:
Oct 12 19:34:58 newKvm kernel:  ? __schedule+0x27f/0x6d0
Oct 12 19:34:58 newKvm kernel:  schedule+0x43/0xd0
Oct 12 19:34:58 newKvm kernel:  schedule_timeout+0x1cf/0x3d0
Oct 12 19:34:58 newKvm kernel:  ? collect_expired_timers+0xb0/0xb0
Oct 12 19:34:58 newKvm kernel:  wait_for_common+0xeb/0x190
Oct 12 19:34:58 newKvm kernel:  ? wake_up_q+0x60/0x60
Oct 12 19:34:58 newKvm kernel:  drm_atomic_helper_wait_for_flip_done+0x5f/0=
xb0
[drm_kms_helper]
Oct 12 19:34:58 newKvm kernel:  amdgpu_dm_atomic_commit_tail+0x1898/0x1d00
[amdgpu]
Oct 12 19:34:58 newKvm kernel:  ? commit_tail+0x3c/0x70 [drm_kms_helper]
Oct 12 19:34:58 newKvm kernel:  commit_tail+0x3c/0x70 [drm_kms_helper]
Oct 12 19:34:58 newKvm kernel:  process_one_work+0x1d1/0x3a0
Oct 12 19:34:58 newKvm kernel:  worker_thread+0x4a/0x3d0
Oct 12 19:34:58 newKvm kernel:  kthread+0xfb/0x130
Oct 12 19:34:58 newKvm kernel:  ? process_one_work+0x3a0/0x3a0
Oct 12 19:34:58 newKvm kernel:  ? kthread_park+0x80/0x80
Oct 12 19:34:58 newKvm kernel:  ret_from_fork+0x35/0x40</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15709237322.EF0fcC64.31967--

--===============2033182334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2033182334==--
