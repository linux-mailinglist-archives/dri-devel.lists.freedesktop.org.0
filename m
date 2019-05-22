Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED7E26353
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 13:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9418994A;
	Wed, 22 May 2019 11:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2F2A88994A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 11:59:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2A7AD72167; Wed, 22 May 2019 11:59:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 106302] [radeonsi] Garbage content when accessing a texture in
 multiple shared EGL contexts
Date: Wed, 22 May 2019 11:59:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 17.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-eric@damsy.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-106302-502-11klPjSC8Y@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0895182287=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0895182287==
Content-Type: multipart/alternative; boundary="15585263421.fFbBb8.5958"
Content-Transfer-Encoding: 7bit


--15585263421.fFbBb8.5958
Date: Wed, 22 May 2019 11:59:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106302

--- Comment #1 from Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net> ---
I can reproduce but I don't think it's a bug in Mesa: your createTexture()
function doesn't use any synchronization mechanisms so you can't expect the
other thread/context to pick up the changes mades to the texture.

Adding a call to glFlush or glFinish at the end of createTexture() is enoug=
h in
this case to fix the issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15585263421.fFbBb8.5958
Date: Wed, 22 May 2019 11:59:02 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106302#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [radeonsi] Garbage content when accessing a texture in mu=
ltiple shared EGL contexts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106302">bug 10630=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric&#64;damsy.net" title=3D"Pierre-Eric Pelloux-Prayer &lt;pierre-e=
ric&#64;damsy.net&gt;"> <span class=3D"fn">Pierre-Eric Pelloux-Prayer</span=
></a>
</span></b>
        <pre>I can reproduce but I don't think it's a bug in Mesa: your cre=
ateTexture()
function doesn't use any synchronization mechanisms so you can't expect the
other thread/context to pick up the changes mades to the texture.

Adding a call to glFlush or glFinish at the end of createTexture() is enoug=
h in
this case to fix the issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15585263421.fFbBb8.5958--

--===============0895182287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0895182287==--
