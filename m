Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBAF9B40A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 17:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358DC6ECD6;
	Fri, 23 Aug 2019 15:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 933646ECD6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 15:55:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9057A72161; Fri, 23 Aug 2019 15:55:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111236] VA-API radeonsi SIGSEGV __memmove_avx_unaligned
Date: Fri, 23 Aug 2019 15:55:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: julien.isorce@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111236-502-bUsxChRp0K@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0634528606=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0634528606==
Content-Type: multipart/alternative; boundary="15665757232.8a962aA3.28083"
Content-Transfer-Encoding: 7bit


--15665757232.8a962aA3.28083
Date: Fri, 23 Aug 2019 15:55:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111236

--- Comment #6 from Julien Isorce <julien.isorce@gmail.com> ---
Looks similar to
https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/merge_requests/142

It is working fine with mesa 18.3.6 and st/va has not changed in 19.1:
https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/state_trackers/va?h=
=3D19.1=20

So the issues could be due to the recent changes in drivers/radeon,
drivers/radeonsi or winsys/amdgpu, i.e. :

https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/drivers/radeon?h=3D1=
9.1

https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/drivers/radeonsi?h=
=3D19.1

https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/winsys/amdgpu?h=3D19=
.1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15665757232.8a962aA3.28083
Date: Fri, 23 Aug 2019 15:55:23 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111236#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API radeonsi SIGSEGV __memmove_avx_unaligned"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111236">bug 11123=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
julien.isorce&#64;gmail.com" title=3D"Julien Isorce &lt;julien.isorce&#64;g=
mail.com&gt;"> <span class=3D"fn">Julien Isorce</span></a>
</span></b>
        <pre>Looks similar to
<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/merge_r=
equests/142">https://gitlab.freedesktop.org/gstreamer/gstreamer-vaapi/merge=
_requests/142</a>

It is working fine with mesa 18.3.6 and st/va has not changed in 19.1:
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/state_tra=
ckers/va?h=3D19.1">https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/s=
tate_trackers/va?h=3D19.1</a>=20

So the issues could be due to the recent changes in drivers/radeon,
drivers/radeonsi or winsys/amdgpu, i.e. :

<a href=3D"https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/drivers/r=
adeon?h=3D19.1">https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/driv=
ers/radeon?h=3D19.1</a>

<a href=3D"https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/drivers/r=
adeonsi?h=3D19.1">https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/dr=
ivers/radeonsi?h=3D19.1</a>

<a href=3D"https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/winsys/am=
dgpu?h=3D19.1">https://cgit.freedesktop.org/mesa/mesa/log/src/gallium/winsy=
s/amdgpu?h=3D19.1</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15665757232.8a962aA3.28083--

--===============0634528606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0634528606==--
