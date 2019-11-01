Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1CCEC6A8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 17:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9336F84D;
	Fri,  1 Nov 2019 16:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 607596F84B
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 16:26:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5910E720E2; Fri,  1 Nov 2019 16:26:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Fri, 01 Nov 2019 16:26:54 +0000
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
Message-ID: <bug-111763-502-JjED2kyJ9D@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0269951754=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0269951754==
Content-Type: multipart/alternative; boundary="15726256140.B19CF2B30.14725"
Content-Transfer-Encoding: 7bit


--15726256140.B19CF2B30.14725
Date: Fri, 1 Nov 2019 16:26:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #17 from wychuchol <wychuchol7777@gmail.com> ---
(In reply to Andrew Sheldon from comment #16)
> (In reply to wychuchol from comment #14)
> > RX 5700 XT Pop OS 19.10 latest Oibaf mesa not sure what llvm
> > Anomaly 1.5.0 update 3 standalone 64 bit mod for S.T.A.L.K.E.R. Call of
> > Pripyat running under wine d3dx11_43->dxvk (winetricks dxvk d3dcompiler=
_43
> > d3dx11_43)
> >=20
> > Oct 30 02:49:30 pop-os kernel: [ 4864.627343]
> > [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for
> > fences timed out!
> > Oct 30 02:49:30 pop-os kernel: [ 4869.231450] [drm:amdgpu_job_timedout
> > [amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D2626284, emitt=
ed
> > seq=3D2626286
> > Oct 30 02:49:30 pop-os kernel: [ 4869.231486] [drm:amdgpu_job_timedout
> > [amdgpu]] *ERROR* Process information: process AnomalyDX11.exe pid 5791
> > thread AnomalyDX11.exe pid 5791
> > Oct 30 02:49:30 pop-os kernel: [ 4869.231487] [drm] GPU recovery disabl=
ed.
> >=20
> > Happens at random. Sometimes hangs straight away, sometimes can go over=
 an
> > hour without crash. Complete crash, no option available besides hard re=
set.
> > Not even mouse pointer would move (as with sdma0 hang).
> >=20
> > I'm sorry if it's not the right place to report this, I'm somewhat new =
to
> > all of this.
>=20
> Ring gfx type hangs tend to be in Mesa. Report here:
> https://gitlab.freedesktop.org/mesa/mesa/issues
>=20
> Also I'm not sure how up to date the Oibaf repo is, but Mesa git landed A=
CO
> recently for Navi cards. You can try with RADV_PERFTEST=3Daco environment
> variable set if your Mesa is new enough, and you might have better luck w=
ith
> hangs.

Thank you so very much, no way to be sure since they seemed to happen at ra=
ndom
but I think I'd experience at least 2 or 3 hangs in the time I've tested it=
 but
smooth ride so far. No performance impact either but running this game as I=
 do
I'm supposedly laying most of the calculations on CPU not GPU.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15726256140.B19CF2B30.14725
Date: Fri, 1 Nov 2019 16:26:54 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wychuchol7777&#64;gmail.com" title=3D"wychuchol &lt;wychuchol7777&#64;gmail=
.com&gt;"> <span class=3D"fn">wychuchol</span></a>
</span></b>
        <pre>(In reply to Andrew Sheldon from <a href=3D"show_bug.cgi?id=3D=
111763#c16">comment #16</a>)
<span class=3D"quote">&gt; (In reply to wychuchol from <a href=3D"show_bug.=
cgi?id=3D111763#c14">comment #14</a>)
&gt; &gt; RX 5700 XT Pop OS 19.10 latest Oibaf mesa not sure what llvm
&gt; &gt; Anomaly 1.5.0 update 3 standalone 64 bit mod for S.T.A.L.K.E.R. C=
all of
&gt; &gt; Pripyat running under wine d3dx11_43-&gt;dxvk (winetricks dxvk d3=
dcompiler_43
&gt; &gt; d3dx11_43)
&gt; &gt;=20
&gt; &gt; Oct 30 02:49:30 pop-os kernel: [ 4864.627343]
&gt; &gt; [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waitin=
g for
&gt; &gt; fences timed out!
&gt; &gt; Oct 30 02:49:30 pop-os kernel: [ 4869.231450] [drm:amdgpu_job_tim=
edout
&gt; &gt; [amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D2626284,=
 emitted
&gt; &gt; seq=3D2626286
&gt; &gt; Oct 30 02:49:30 pop-os kernel: [ 4869.231486] [drm:amdgpu_job_tim=
edout
&gt; &gt; [amdgpu]] *ERROR* Process information: process AnomalyDX11.exe pi=
d 5791
&gt; &gt; thread AnomalyDX11.exe pid 5791
&gt; &gt; Oct 30 02:49:30 pop-os kernel: [ 4869.231487] [drm] GPU recovery =
disabled.
&gt; &gt;=20
&gt; &gt; Happens at random. Sometimes hangs straight away, sometimes can g=
o over an
&gt; &gt; hour without crash. Complete crash, no option available besides h=
ard reset.
&gt; &gt; Not even mouse pointer would move (as with sdma0 hang).
&gt; &gt;=20
&gt; &gt; I'm sorry if it's not the right place to report this, I'm somewha=
t new to
&gt; &gt; all of this.
&gt;=20
&gt; Ring gfx type hangs tend to be in Mesa. Report here:
&gt; <a href=3D"https://gitlab.freedesktop.org/mesa/mesa/issues">https://gi=
tlab.freedesktop.org/mesa/mesa/issues</a>
&gt;=20
&gt; Also I'm not sure how up to date the Oibaf repo is, but Mesa git lande=
d ACO
&gt; recently for Navi cards. You can try with RADV_PERFTEST=3Daco environm=
ent
&gt; variable set if your Mesa is new enough, and you might have better luc=
k with
&gt; hangs.</span >

Thank you so very much, no way to be sure since they seemed to happen at ra=
ndom
but I think I'd experience at least 2 or 3 hangs in the time I've tested it=
 but
smooth ride so far. No performance impact either but running this game as I=
 do
I'm supposedly laying most of the calculations on CPU not GPU.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15726256140.B19CF2B30.14725--

--===============0269951754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0269951754==--
