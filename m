Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF1A788DF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 11:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BAF89CBC;
	Mon, 29 Jul 2019 09:50:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E2A6789CBC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 09:50:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DF4F272167; Mon, 29 Jul 2019 09:50:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111244] amdgpu kernel 5.2 blank display after resume from suspend
Date: Mon, 29 Jul 2019 09:50:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111244-502-OAV3tAAPPg@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111244-502@http.bugs.freedesktop.org/>
References: <bug-111244-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1855220098=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1855220098==
Content-Type: multipart/alternative; boundary="15643938481.7983C4C.29336"
Content-Transfer-Encoding: 7bit


--15643938481.7983C4C.29336
Date: Mon, 29 Jul 2019 09:50:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111244

--- Comment #5 from Michel D=C3=A4nzer <michel@daenzer.net> ---
(In reply to cspack from comment #4)
> The first bisect pointed to a merge commit so the second was done to bise=
ct
> within the merged commits.

That doesn't invalidate my previous comment. :) git bisect identifying a me=
rge
commit already indicates the same thing by itself. In particular, the fact =
that
it identified a merge commit means that you declared all of its parent comm=
its
good.

(There *are* rare cases where a problem is actually introduced by a merge
commit itself, but then the second bisection should have either identified =
the
same merge commit again (if you tested it again), or failed, because all the
other commits you tested should have been good again.)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15643938481.7983C4C.29336
Date: Mon, 29 Jul 2019 09:50:48 +0000
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
   title=3D"NEW - amdgpu kernel 5.2 blank display after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu kernel 5.2 blank display after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244">bug 11124=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>(In reply to cspack from <a href=3D"show_bug.cgi?id=3D111244#c=
4">comment #4</a>)
<span class=3D"quote">&gt; The first bisect pointed to a merge commit so th=
e second was done to bisect
&gt; within the merged commits.</span >

That doesn't invalidate my previous comment. :) git bisect identifying a me=
rge
commit already indicates the same thing by itself. In particular, the fact =
that
it identified a merge commit means that you declared all of its parent comm=
its
good.

(There *are* rare cases where a problem is actually introduced by a merge
commit itself, but then the second bisection should have either identified =
the
same merge commit again (if you tested it again), or failed, because all the
other commits you tested should have been good again.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15643938481.7983C4C.29336--

--===============1855220098==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1855220098==--
