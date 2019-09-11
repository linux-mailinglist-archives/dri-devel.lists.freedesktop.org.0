Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4353AF40F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 03:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FAE6E07B;
	Wed, 11 Sep 2019 01:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FB676E11C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 01:38:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0784072168; Wed, 11 Sep 2019 01:38:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111591] [radeonsi/Navi] The Bard's Tale IV causes a GPU hang
Date: Wed, 11 Sep 2019 01:38:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111591-502-nN9h5ZLTtU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111591-502@http.bugs.freedesktop.org/>
References: <bug-111591-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0751638086=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0751638086==
Content-Type: multipart/alternative; boundary="15681658891.0fEd9.20294"
Content-Transfer-Encoding: 7bit


--15681658891.0fEd9.20294
Date: Wed, 11 Sep 2019 01:38:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111591

--- Comment #9 from Timothy Arceri <t_arceri@yahoo.com.au> ---
Thanks! I can reproduce the problem using the new trace.

It's strange the problem is caused by some shaders failing to link but the
error message doesn't match what the shaders actually do. Also dumping out =
the
shaders and compiling them with our shader-db tool also results in them
compiling correctly. There is clearly a bug in here somewhere but will take
some more digging to find it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681658891.0fEd9.20294
Date: Wed, 11 Sep 2019 01:38:09 +0000
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
   title=3D"NEW - [radeonsi/Navi] The Bard's Tale IV causes a GPU hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111591#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [radeonsi/Navi] The Bard's Tale IV causes a GPU hang"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111591">bug 11159=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>Thanks! I can reproduce the problem using the new trace.

It's strange the problem is caused by some shaders failing to link but the
error message doesn't match what the shaders actually do. Also dumping out =
the
shaders and compiling them with our shader-db tool also results in them
compiling correctly. There is clearly a bug in here somewhere but will take
some more digging to find it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681658891.0fEd9.20294--

--===============0751638086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0751638086==--
