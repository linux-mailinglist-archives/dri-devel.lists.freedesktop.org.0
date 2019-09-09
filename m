Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623E9AD36B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:12:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A7D897E7;
	Mon,  9 Sep 2019 07:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1F8B6897E9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 07:12:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1C29772167; Mon,  9 Sep 2019 07:12:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111236] VA-API radeonsi SIGSEGV __memmove_avx_unaligned
Date: Mon, 09 Sep 2019 07:12:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vjaquez@igalia.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111236-502-XjNyVs8oGE@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111236-502@http.bugs.freedesktop.org/>
References: <bug-111236-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0511212420=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0511212420==
Content-Type: multipart/alternative; boundary="15680131461.eBeaFb.25353"
Content-Transfer-Encoding: 7bit


--15680131461.eBeaFb.25353
Date: Mon, 9 Sep 2019 07:12:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111236

--- Comment #12 from V=C3=ADctor J=C3=A1quez <vjaquez@igalia.com> ---
Hi Michel,=20

The patch also worked for me! :) Thanks!

In the case of totem, there's a work in progress
https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/merge_requests/122=
 but
it requires a lot more work.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15680131461.eBeaFb.25353
Date: Mon, 9 Sep 2019 07:12:26 +0000
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
   title=3D"NEW - VA-API radeonsi SIGSEGV __memmove_avx_unaligned"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111236#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API radeonsi SIGSEGV __memmove_avx_unaligned"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111236">bug 11123=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
vjaquez&#64;igalia.com" title=3D"V=C3=ADctor J=C3=A1quez &lt;vjaquez&#64;ig=
alia.com&gt;"> <span class=3D"fn">V=C3=ADctor J=C3=A1quez</span></a>
</span></b>
        <pre>Hi Michel,=20

The patch also worked for me! :) Thanks!

In the case of totem, there's a work in progress
<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/merge_r=
equests/122">https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/merge=
_requests/122</a> but
it requires a lot more work.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15680131461.eBeaFb.25353--

--===============0511212420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0511212420==--
