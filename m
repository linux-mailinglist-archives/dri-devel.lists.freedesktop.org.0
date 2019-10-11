Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CBD4804
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 20:55:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86DE6EC8A;
	Fri, 11 Oct 2019 18:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87D2D6EC8A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 18:54:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 84AAE7296E; Fri, 11 Oct 2019 18:54:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111980] Rebbot and shutdown doesn't work on specific hardware
Date: Fri, 11 Oct 2019 18:54:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: lei.pero@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111980-502-f5DEsDMs5d@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111980-502@http.bugs.freedesktop.org/>
References: <bug-111980-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2084323249=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2084323249==
Content-Type: multipart/alternative; boundary="15708200971.e8Ca.29094"
Content-Transfer-Encoding: 7bit


--15708200971.e8Ca.29094
Date: Fri, 11 Oct 2019 18:54:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111980

--- Comment #2 from lei.pero@gmail.com ---
(In reply to Tim Cuthbertson from comment #1)
> My system does this, too, since kernel 5.3.5-arch1-1-ARCH on Arch Linux.

Can you test it without this commit? Same for me 5.3.5-arch1-1-ARCH introdu=
ced
the bug.

I've used
git revert 894c414129a8d9ef1b2de443015e4dde6085f64f
to exclude that commit in stable branch (after bisecting) for 5.4-rc2 and it
worked fine without it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15708200971.e8Ca.29094
Date: Fri, 11 Oct 2019 18:54:57 +0000
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
   title=3D"NEW - Rebbot and shutdown doesn't work on specific hardware"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111980#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rebbot and shutdown doesn't work on specific hardware"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111980">bug 11198=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lei.pero&#64;gmail.com" title=3D"lei.pero&#64;gmail.com">lei.pero&#64;gmail=
.com</a>
</span></b>
        <pre>(In reply to Tim Cuthbertson from <a href=3D"show_bug.cgi?id=
=3D111980#c1">comment #1</a>)
<span class=3D"quote">&gt; My system does this, too, since kernel 5.3.5-arc=
h1-1-ARCH on Arch Linux.</span >

Can you test it without this commit? Same for me 5.3.5-arch1-1-ARCH introdu=
ced
the bug.

I've used
git revert 894c414129a8d9ef1b2de443015e4dde6085f64f
to exclude that commit in stable branch (after bisecting) for 5.4-rc2 and it
worked fine without it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15708200971.e8Ca.29094--

--===============2084323249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2084323249==--
