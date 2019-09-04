Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BEFA77E0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 02:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE74897FB;
	Wed,  4 Sep 2019 00:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6BBD0897FB
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 00:27:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6875D72161; Wed,  4 Sep 2019 00:27:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108718] Raven Ridge: ring sdma0 timeout on heavy CSS website
 with Firefox WebRender
Date: Wed, 04 Sep 2019 00:27:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dark_sylinc@yahoo.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108718-502-rw2BEp9MG4@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108718-502@http.bugs.freedesktop.org/>
References: <bug-108718-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1178995660=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1178995660==
Content-Type: multipart/alternative; boundary="15675568502.dABAf06c7.8052"
Content-Transfer-Encoding: 7bit


--15675568502.dABAf06c7.8052
Date: Wed, 4 Sep 2019 00:27:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108718

--- Comment #3 from Matias N. Goldberg <dark_sylinc@yahoo.com.ar> ---
I'm on:

OpenGL renderer string: AMD RAVEN (DRM 3.30.0, 5.1.15-050115-generic, LLVM
8.0.1)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.0-devel
(git-8305766 2019-07-11 bionic-oibaf-ppa)

And I can also still repro this issue. Firefox isn't the only way to trigger
it, Chromium can trigger it too.

Is it too old already? How recent the kernel and mesa must be?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15675568502.dABAf06c7.8052
Date: Wed, 4 Sep 2019 00:27:30 +0000
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
   title=3D"NEW - Raven Ridge: ring sdma0 timeout on heavy CSS website with=
 Firefox WebRender"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108718#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Raven Ridge: ring sdma0 timeout on heavy CSS website with=
 Firefox WebRender"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108718">bug 10871=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dark_sylinc&#64;yahoo.com.ar" title=3D"Matias N. Goldberg &lt;dark_sylinc&#=
64;yahoo.com.ar&gt;"> <span class=3D"fn">Matias N. Goldberg</span></a>
</span></b>
        <pre>I'm on:

OpenGL renderer string: AMD RAVEN (DRM 3.30.0, 5.1.15-050115-generic, LLVM
8.0.1)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.2.0-devel
(git-8305766 2019-07-11 bionic-oibaf-ppa)

And I can also still repro this issue. Firefox isn't the only way to trigger
it, Chromium can trigger it too.

Is it too old already? How recent the kernel and mesa must be?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15675568502.dABAf06c7.8052--

--===============1178995660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1178995660==--
