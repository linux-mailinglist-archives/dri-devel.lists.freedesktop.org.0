Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D035B2CF0C
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 20:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D726E053;
	Tue, 28 May 2019 18:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2175D6E053
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 18:59:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1990F72167; Tue, 28 May 2019 18:59:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 106302] [radeonsi] Garbage content when accessing a texture in
 multiple shared EGL contexts
Date: Tue, 28 May 2019 18:59:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 17.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: seb@vestigecounty.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-106302-502-9vfQUDhrDA@http.bugs.freedesktop.org/>
In-Reply-To: <bug-106302-502@http.bugs.freedesktop.org/>
References: <bug-106302-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1724117783=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1724117783==
Content-Type: multipart/alternative; boundary="15590699500.62D36.14410"
Content-Transfer-Encoding: 7bit


--15590699500.62D36.14410
Date: Tue, 28 May 2019 18:59:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106302

--- Comment #4 from seb@vestigecounty.com ---
Thank you for being exactly on point, it turns out I was using a frivolous
interpretation of "change" rather than the one specified in OpenGL ES.  The=
 bug
can safely be closed as invalid, as fence is necessary in this case.

One thing that is curious to me still, is whether sampling the texture in t=
he
second thread should yield (0,0,0), since the texture change has not comple=
ted
yet, and associated texture object is thus incomplete.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590699500.62D36.14410
Date: Tue, 28 May 2019 18:59:10 +0000
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
   title=3D"NEW - [radeonsi] Garbage content when accessing a texture in mu=
ltiple shared EGL contexts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106302#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [radeonsi] Garbage content when accessing a texture in mu=
ltiple shared EGL contexts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106302">bug 10630=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
seb&#64;vestigecounty.com" title=3D"seb&#64;vestigecounty.com">seb&#64;vest=
igecounty.com</a>
</span></b>
        <pre>Thank you for being exactly on point, it turns out I was using=
 a frivolous
interpretation of &quot;change&quot; rather than the one specified in OpenG=
L ES.  The bug
can safely be closed as invalid, as fence is necessary in this case.

One thing that is curious to me still, is whether sampling the texture in t=
he
second thread should yield (0,0,0), since the texture change has not comple=
ted
yet, and associated texture object is thus incomplete.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590699500.62D36.14410--

--===============1724117783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1724117783==--
