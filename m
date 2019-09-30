Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E61C1BAA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 08:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5586E2CD;
	Mon, 30 Sep 2019 06:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 615796E364
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 06:43:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5E33372167; Mon, 30 Sep 2019 06:43:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111803] Annoying GPU stucks are continued on Vega 20 with
 Kernel 5.4 + mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail
 [amdgpu]] *ERROR* Waiting for fences timed out!
Date: Mon, 30 Sep 2019 06:43:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: vicluo96@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-111803-502-OyJ19yv0zM@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111803-502@http.bugs.freedesktop.org/>
References: <bug-111803-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2045351095=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2045351095==
Content-Type: multipart/alternative; boundary="15698257862.5DdFAE3.19720"
Content-Transfer-Encoding: 7bit


--15698257862.5DdFAE3.19720
Date: Mon, 30 Sep 2019 06:43:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111803

Zheng Luo <vicluo96@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vicluo96@gmail.com

--- Comment #24 from Zheng Luo <vicluo96@gmail.com> ---
Also happens on Lenovo E585 with the latest firmware (R0UET74W (1.54 )), AMD
2500U w/ Vega 8, Kernel 5.3.1-arch1-1-ARCH, mesa 19.1.7-1, llvm 8.0.1. It
happens after I launched LibreOffice Sheet.

Sep 29 23:29:36 lzThinkpad gnome-shell[1676]:
meta_window_set_stack_position_no_sync: assertion 'window->stack_position >=
=3D 0'
failed
Sep 29 23:29:41 lzThinkpad kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgp=
u]]
*ERROR* Waiting for fences timed out or interrupted!
Sep 29 23:29:45 lzThinkpad tracker-store[1810]: OK
Sep 29 23:29:45 lzThinkpad systemd[1613]: tracker-store.service: Succeeded.
Sep 29 23:29:46 lzThinkpad kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgp=
u]]
*ERROR* Waiting for fences timed out or interrupted!
Sep 29 23:29:46 lzThinkpad kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R*
ring gfx timeout, signaled seq=3D757, emitted seq=3D759
Sep 29 23:29:46 lzThinkpad kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R*
Process information: process gnome-shell pid 1676 thread gnome-shel:cs0 pid
1683
Sep 29 23:29:46 lzThinkpad kernel: [drm] GPU recovery disabled.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698257862.5DdFAE3.19720
Date: Mon, 30 Sep 2019 06:43:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:vicluo96&=
#64;gmail.com" title=3D"Zheng Luo &lt;vicluo96&#64;gmail.com&gt;"> <span cl=
ass=3D"fn">Zheng Luo</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *=
ERROR* Waiting for fences timed out!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111803">bug 11180=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>vicluo96&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *=
ERROR* Waiting for fences timed out!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111803#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Annoying GPU stucks are continued on Vega 20 with Kernel =
5.4 + mesa 9.3.0 + llvm 9.0.0 [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *=
ERROR* Waiting for fences timed out!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111803">bug 11180=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vicluo96&#64;gmail.com" title=3D"Zheng Luo &lt;vicluo96&#64;gmail.com&gt;">=
 <span class=3D"fn">Zheng Luo</span></a>
</span></b>
        <pre>Also happens on Lenovo E585 with the latest firmware (R0UET74W=
 (1.54 )), AMD
2500U w/ Vega 8, Kernel 5.3.1-arch1-1-ARCH, mesa 19.1.7-1, llvm 8.0.1. It
happens after I launched LibreOffice Sheet.

Sep 29 23:29:36 lzThinkpad gnome-shell[1676]:
meta_window_set_stack_position_no_sync: assertion 'window-&gt;stack_positio=
n &gt;=3D 0'
failed
Sep 29 23:29:41 lzThinkpad kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgp=
u]]
*ERROR* Waiting for fences timed out or interrupted!
Sep 29 23:29:45 lzThinkpad tracker-store[1810]: OK
Sep 29 23:29:45 lzThinkpad systemd[1613]: tracker-store.service: Succeeded.
Sep 29 23:29:46 lzThinkpad kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgp=
u]]
*ERROR* Waiting for fences timed out or interrupted!
Sep 29 23:29:46 lzThinkpad kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R*
ring gfx timeout, signaled seq=3D757, emitted seq=3D759
Sep 29 23:29:46 lzThinkpad kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R*
Process information: process gnome-shell pid 1676 thread gnome-shel:cs0 pid
1683
Sep 29 23:29:46 lzThinkpad kernel: [drm] GPU recovery disabled.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698257862.5DdFAE3.19720--

--===============2045351095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2045351095==--
