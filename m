Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B46A8256
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 14:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB4B89483;
	Wed,  4 Sep 2019 12:26:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8EA6A89483
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 12:26:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8A9E672161; Wed,  4 Sep 2019 12:26:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111551] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1
 timeout
Date: Wed, 04 Sep 2019 12:26:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: 78666679@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111551-502-1j46VC8vvD@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111551-502@http.bugs.freedesktop.org/>
References: <bug-111551-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1592578243=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1592578243==
Content-Type: multipart/alternative; boundary="15676000091.99bfc20a.7378"
Content-Transfer-Encoding: 7bit


--15676000091.99bfc20a.7378
Date: Wed, 4 Sep 2019 12:26:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111551

--- Comment #4 from yanhua <78666679@qq.com> ---
I have asked hardware team, they have tested, and can be sure there are no
power supply problem.


The system is arm64 with 64 cores. and there are three amdgpu card in the
board.


there are rarely gfx timeout, sdma timeout, and vce timeout. When the ring
timeout occur, we can use amd supplied tools umr to read chip registers. ca=
n we
know the real cause from the register value?

with the coherency problem you said, I think if that was true. the problem
should occur more frequently. I'm not sure.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676000091.99bfc20a.7378
Date: Wed, 4 Sep 2019 12:26:49 +0000
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
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 tim=
eout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111551#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 tim=
eout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111551">bug 11155=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
78666679&#64;qq.com" title=3D"yanhua &lt;78666679&#64;qq.com&gt;"> <span cl=
ass=3D"fn">yanhua</span></a>
</span></b>
        <pre>I have asked hardware team, they have tested, and can be sure =
there are no
power supply problem.


The system is arm64 with 64 cores. and there are three amdgpu card in the
board.


there are rarely gfx timeout, sdma timeout, and vce timeout. When the ring
timeout occur, we can use amd supplied tools umr to read chip registers. ca=
n we
know the real cause from the register value?

with the coherency problem you said, I think if that was true. the problem
should occur more frequently. I'm not sure.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676000091.99bfc20a.7378--

--===============1592578243==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1592578243==--
