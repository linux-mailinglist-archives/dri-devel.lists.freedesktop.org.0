Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56338F6152
	for <lists+dri-devel@lfdr.de>; Sat,  9 Nov 2019 21:12:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623DE6E418;
	Sat,  9 Nov 2019 20:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CD106E40A
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 20:12:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 94A4D720E2; Sat,  9 Nov 2019 20:12:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Sat, 09 Nov 2019 20:12:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: Chryseus8080@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-111763-502-L6zAGwXmob@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111763-502@http.bugs.freedesktop.org/>
References: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2064659542=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2064659542==
Content-Type: multipart/alternative; boundary="15733303370.F14e9c.15899"
Content-Transfer-Encoding: 7bit


--15733303370.F14e9c.15899
Date: Sat, 9 Nov 2019 20:12:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

James Wood <Chryseus8080@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |Chryseus8080@gmail.com

--- Comment #27 from James Wood <Chryseus8080@gmail.com> ---
This doesn't seem to be exclusive to Navi GPUs, I've been having instances =
of
ring gfx timeouts freezing up the system in numerous games such as Project
Zomboid (was recently fixed by the developer) and ArmA 3 with the all too
familiar dmesg:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, but soft recove=
red

I'm using:
Radeon RX 590 Series (POLARIS10, DRM 3.33.0, 5.3.8-arch1-1, LLVM 9.0.0)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733303370.F14e9c.15899
Date: Sat, 9 Nov 2019 20:12:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:Chryseus8=
080&#64;gmail.com" title=3D"James Wood &lt;Chryseus8080&#64;gmail.com&gt;">=
 <span class=3D"fn">James Wood</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
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
           <td>Chryseus8080&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c27">Comme=
nt # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Chryseus8080&#64;gmail.com" title=3D"James Wood &lt;Chryseus8080&#64;gmail.=
com&gt;"> <span class=3D"fn">James Wood</span></a>
</span></b>
        <pre>This doesn't seem to be exclusive to Navi GPUs, I've been havi=
ng instances of
ring gfx timeouts freezing up the system in numerous games such as Project
Zomboid (was recently fixed by the developer) and ArmA 3 with the all too
familiar dmesg:
[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting for fences timed
out or interrupted!
drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout, but soft recove=
red

I'm using:
Radeon RX 590 Series (POLARIS10, DRM 3.33.0, 5.3.8-arch1-1, LLVM 9.0.0)</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733303370.F14e9c.15899--

--===============2064659542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2064659542==--
