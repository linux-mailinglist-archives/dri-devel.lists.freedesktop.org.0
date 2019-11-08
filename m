Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304A4F58D2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 21:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1FF6FA7B;
	Fri,  8 Nov 2019 20:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 021096FA7B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 20:51:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EE616720E2; Fri,  8 Nov 2019 20:51:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112234] [REGRESSION] navi10: writing to pp_table fails (5.4-rc6
 = working)
Date: Fri, 08 Nov 2019 20:51:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mcoffin13@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112234-502-1hQPfP0sjO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112234-502@http.bugs.freedesktop.org/>
References: <bug-112234-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1495040411=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1495040411==
Content-Type: multipart/alternative; boundary="15732462660.fdE0dFE.32398"
Content-Transfer-Encoding: 7bit


--15732462660.fdE0dFE.32398
Date: Fri, 8 Nov 2019 20:51:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112234

--- Comment #1 from Matt Coffin <mcoffin13@gmail.com> ---
Bisected, and traced back to

faa695c715e5c9203af824315127037499b33921
drm/amd/powerplay: do proper cleanups on hw_fini

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15732462660.fdE0dFE.32398
Date: Fri, 8 Nov 2019 20:51:06 +0000
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
   title=3D"NEW - [REGRESSION] navi10: writing to pp_table fails (5.4-rc6 =
=3D working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112234#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] navi10: writing to pp_table fails (5.4-rc6 =
=3D working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112234">bug 11223=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mcoffin13&#64;gmail.com" title=3D"Matt Coffin &lt;mcoffin13&#64;gmail.com&g=
t;"> <span class=3D"fn">Matt Coffin</span></a>
</span></b>
        <pre>Bisected, and traced back to

faa695c715e5c9203af824315127037499b33921
drm/amd/powerplay: do proper cleanups on hw_fini</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15732462660.fdE0dFE.32398--

--===============1495040411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1495040411==--
