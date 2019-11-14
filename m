Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F79FCBCC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 18:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49456EE3F;
	Thu, 14 Nov 2019 17:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3C5E6EE42
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 17:28:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B0C12720E2; Thu, 14 Nov 2019 17:28:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112266] [Navi] Pathfinder: Kingmaker is causing a GPU hang:
 flip_done timed out error
Date: Thu, 14 Nov 2019 17:28:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rly@hotmail.hu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112266-502-VsR4ND5vLI@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112266-502@http.bugs.freedesktop.org/>
References: <bug-112266-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1015657015=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1015657015==
Content-Type: multipart/alternative; boundary="15737524832.Fc6Df7b.27803"
Content-Transfer-Encoding: 7bit


--15737524832.Fc6Df7b.27803
Date: Thu, 14 Nov 2019 17:28:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112266

--- Comment #1 from rLy <rly@hotmail.hu> ---
I experience the same in CS:GO and Shadow of the tomb raider. What I notice=
d is
that the crash only happens when I move the mouse. Also it's somewhat relat=
ed
to the mouse pointer. For example starting a CS:GO game using console comma=
nds
thus getting rid of the system pointer doesn't result in a crash, but as so=
on
as I open the buy menu or bringing up steam overlay which shows the system
pointer it crashes. Neither CS:GO or SOTTR has ingame pointers. Not sure how
relevant mouse pointer type part is because there's some exception to this =
with
other games that I tested based on this.

GTA5 - ingame pointer - no crash
Europa Universalis 4 - ingame pointer - no crash
Train Simulator 2020 - no ingame pointer - crash
exceptions:
Kerbal Space Program - ingame pointer - crash
Oxygen Not Included -no ingame pointer - no crash

Workaround that worked for me is setting Option "SWCursor" "True" for xorg.

Specs:
GPU Sapphire Pulse RX 5700 XT
Archlinux with mesa-git repo
DE: KDE
kernel 5.4-rc7
mesa-git 1:20.0.0_devel.117467.9e440b8d0b9-1
llvm-git 10.0.0_r331530.6ef63638cb8-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15737524832.Fc6Df7b.27803
Date: Thu, 14 Nov 2019 17:28:03 +0000
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
   title=3D"NEW - [Navi] Pathfinder: Kingmaker is causing a GPU hang: flip_=
done timed out error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112266#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Navi] Pathfinder: Kingmaker is causing a GPU hang: flip_=
done timed out error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112266">bug 11226=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rly&#64;hotmail.hu" title=3D"rLy &lt;rly&#64;hotmail.hu&gt;"> <span class=
=3D"fn">rLy</span></a>
</span></b>
        <pre>I experience the same in CS:GO and Shadow of the tomb raider. =
What I noticed is
that the crash only happens when I move the mouse. Also it's somewhat relat=
ed
to the mouse pointer. For example starting a CS:GO game using console comma=
nds
thus getting rid of the system pointer doesn't result in a crash, but as so=
on
as I open the buy menu or bringing up steam overlay which shows the system
pointer it crashes. Neither CS:GO or SOTTR has ingame pointers. Not sure how
relevant mouse pointer type part is because there's some exception to this =
with
other games that I tested based on this.

GTA5 - ingame pointer - no crash
Europa Universalis 4 - ingame pointer - no crash
Train Simulator 2020 - no ingame pointer - crash
exceptions:
Kerbal Space Program - ingame pointer - crash
Oxygen Not Included -no ingame pointer - no crash

Workaround that worked for me is setting Option &quot;SWCursor&quot; &quot;=
True&quot; for xorg.

Specs:
GPU Sapphire Pulse RX 5700 XT
Archlinux with mesa-git repo
DE: KDE
kernel 5.4-rc7
mesa-git 1:20.0.0_devel.117467.9e440b8d0b9-1
llvm-git 10.0.0_r331530.6ef63638cb8-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15737524832.Fc6Df7b.27803--

--===============1015657015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1015657015==--
