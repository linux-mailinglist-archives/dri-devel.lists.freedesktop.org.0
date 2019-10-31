Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14236EAFD0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 13:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D256EC18;
	Thu, 31 Oct 2019 12:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 89F2F6EE67
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 12:09:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 87586720E2; Thu, 31 Oct 2019 12:09:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Thu, 31 Oct 2019 12:09:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: wychuchol7777@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-P7qQANiE5Z@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1147334752=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1147334752==
Content-Type: multipart/alternative; boundary="15725237519.Bd45.15530"
Content-Transfer-Encoding: 7bit


--15725237519.Bd45.15530
Date: Thu, 31 Oct 2019 12:09:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #14 from wychuchol <wychuchol7777@gmail.com> ---
RX 5700 XT Pop OS 19.10 latest Oibaf mesa not sure what llvm
Anomaly 1.5.0 update 3 standalone 64 bit mod for S.T.A.L.K.E.R. Call of Pri=
pyat
running under wine d3dx11_43->dxvk (winetricks dxvk d3dcompiler_43 d3dx11_4=
3)

Oct 30 02:49:30 pop-os kernel: [ 4864.627343]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fenc=
es
timed out!
Oct 30 02:49:30 pop-os kernel: [ 4869.231450] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D2626284, emitted
seq=3D2626286
Oct 30 02:49:30 pop-os kernel: [ 4869.231486] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process AnomalyDX11.exe pid 5791 thr=
ead
AnomalyDX11.exe pid 5791
Oct 30 02:49:30 pop-os kernel: [ 4869.231487] [drm] GPU recovery disabled.

Happens at random. Sometimes hangs straight away, sometimes can go over an =
hour
without crash. Complete crash, no option available besides hard reset. Not =
even
mouse pointer would move (as with sdma0 hang).

I'm sorry if it's not the right place to report this, I'm somewhat new to a=
ll
of this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15725237519.Bd45.15530
Date: Thu, 31 Oct 2019 12:09:11 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wychuchol7777&#64;gmail.com" title=3D"wychuchol &lt;wychuchol7777&#64;gmail=
.com&gt;"> <span class=3D"fn">wychuchol</span></a>
</span></b>
        <pre>RX 5700 XT Pop OS 19.10 latest Oibaf mesa not sure what llvm
Anomaly 1.5.0 update 3 standalone 64 bit mod for S.T.A.L.K.E.R. Call of Pri=
pyat
running under wine d3dx11_43-&gt;dxvk (winetricks dxvk d3dcompiler_43 d3dx1=
1_43)

Oct 30 02:49:30 pop-os kernel: [ 4864.627343]
[drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for fenc=
es
timed out!
Oct 30 02:49:30 pop-os kernel: [ 4869.231450] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D2626284, emitted
seq=3D2626286
Oct 30 02:49:30 pop-os kernel: [ 4869.231486] [drm:amdgpu_job_timedout
[amdgpu]] *ERROR* Process information: process AnomalyDX11.exe pid 5791 thr=
ead
AnomalyDX11.exe pid 5791
Oct 30 02:49:30 pop-os kernel: [ 4869.231487] [drm] GPU recovery disabled.

Happens at random. Sometimes hangs straight away, sometimes can go over an =
hour
without crash. Complete crash, no option available besides hard reset. Not =
even
mouse pointer would move (as with sdma0 hang).

I'm sorry if it's not the right place to report this, I'm somewhat new to a=
ll
of this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15725237519.Bd45.15530--

--===============1147334752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1147334752==--
