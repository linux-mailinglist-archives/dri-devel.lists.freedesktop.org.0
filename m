Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A2EEBBAE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 02:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A296F6AF;
	Fri,  1 Nov 2019 01:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7EAF96F6AD
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 01:23:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7C016720E2; Fri,  1 Nov 2019 01:23:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Fri, 01 Nov 2019 01:23:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-xQ18fPVFYc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0790222787=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0790222787==
Content-Type: multipart/alternative; boundary="15725714361.4eAce0.25588"
Content-Transfer-Encoding: 7bit


--15725714361.4eAce0.25588
Date: Fri, 1 Nov 2019 01:23:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #16 from Andrew Sheldon <asheldon55@gmail.com> ---
(In reply to wychuchol from comment #14)
> RX 5700 XT Pop OS 19.10 latest Oibaf mesa not sure what llvm
> Anomaly 1.5.0 update 3 standalone 64 bit mod for S.T.A.L.K.E.R. Call of
> Pripyat running under wine d3dx11_43->dxvk (winetricks dxvk d3dcompiler_43
> d3dx11_43)
>=20
> Oct 30 02:49:30 pop-os kernel: [ 4864.627343]
> [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for
> fences timed out!
> Oct 30 02:49:30 pop-os kernel: [ 4869.231450] [drm:amdgpu_job_timedout
> [amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D2626284, emitted
> seq=3D2626286
> Oct 30 02:49:30 pop-os kernel: [ 4869.231486] [drm:amdgpu_job_timedout
> [amdgpu]] *ERROR* Process information: process AnomalyDX11.exe pid 5791
> thread AnomalyDX11.exe pid 5791
> Oct 30 02:49:30 pop-os kernel: [ 4869.231487] [drm] GPU recovery disabled.
>=20
> Happens at random. Sometimes hangs straight away, sometimes can go over an
> hour without crash. Complete crash, no option available besides hard rese=
t.
> Not even mouse pointer would move (as with sdma0 hang).
>=20
> I'm sorry if it's not the right place to report this, I'm somewhat new to
> all of this.

Ring gfx type hangs tend to be in Mesa. Report here:
https://gitlab.freedesktop.org/mesa/mesa/issues

Also I'm not sure how up to date the Oibaf repo is, but Mesa git landed ACO
recently for Navi cards. You can try with RADV_PERFTEST=3Daco environment
variable set if your Mesa is new enough, and you might have better luck with
hangs.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15725714361.4eAce0.25588
Date: Fri, 1 Nov 2019 01:23:56 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>(In reply to wychuchol from <a href=3D"show_bug.cgi?id=3D11176=
3#c14">comment #14</a>)
<span class=3D"quote">&gt; RX 5700 XT Pop OS 19.10 latest Oibaf mesa not su=
re what llvm
&gt; Anomaly 1.5.0 update 3 standalone 64 bit mod for S.T.A.L.K.E.R. Call of
&gt; Pripyat running under wine d3dx11_43-&gt;dxvk (winetricks dxvk d3dcomp=
iler_43
&gt; d3dx11_43)
&gt;=20
&gt; Oct 30 02:49:30 pop-os kernel: [ 4864.627343]
&gt; [drm:amdgpu_dm_commit_planes.constprop.0 [amdgpu]] *ERROR* Waiting for
&gt; fences timed out!
&gt; Oct 30 02:49:30 pop-os kernel: [ 4869.231450] [drm:amdgpu_job_timedout
&gt; [amdgpu]] *ERROR* ring gfx_0.0.0 timeout, signaled seq=3D2626284, emit=
ted
&gt; seq=3D2626286
&gt; Oct 30 02:49:30 pop-os kernel: [ 4869.231486] [drm:amdgpu_job_timedout
&gt; [amdgpu]] *ERROR* Process information: process AnomalyDX11.exe pid 5791
&gt; thread AnomalyDX11.exe pid 5791
&gt; Oct 30 02:49:30 pop-os kernel: [ 4869.231487] [drm] GPU recovery disab=
led.
&gt;=20
&gt; Happens at random. Sometimes hangs straight away, sometimes can go ove=
r an
&gt; hour without crash. Complete crash, no option available besides hard r=
eset.
&gt; Not even mouse pointer would move (as with sdma0 hang).
&gt;=20
&gt; I'm sorry if it's not the right place to report this, I'm somewhat new=
 to
&gt; all of this.</span >

Ring gfx type hangs tend to be in Mesa. Report here:
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/issues">https://gitlab.=
freedesktop.org/mesa/mesa/issues</a>

Also I'm not sure how up to date the Oibaf repo is, but Mesa git landed ACO
recently for Navi cards. You can try with RADV_PERFTEST=3Daco environment
variable set if your Mesa is new enough, and you might have better luck with
hangs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15725714361.4eAce0.25588--

--===============0790222787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0790222787==--
