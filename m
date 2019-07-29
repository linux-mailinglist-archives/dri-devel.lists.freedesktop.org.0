Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9389B78818
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 11:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6539E8987A;
	Mon, 29 Jul 2019 09:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F3D48987A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 09:15:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9C0EE72167; Mon, 29 Jul 2019 09:15:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111228] PRIME output screen satys black on 1002:15d8 with 128MB
 VRAM
Date: Mon, 29 Jul 2019 09:15:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111228-502-hbJCKWqIE4@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111228-502@http.bugs.freedesktop.org/>
References: <bug-111228-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0507627508=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0507627508==
Content-Type: multipart/alternative; boundary="15643917222.0dc56c4d.24095"
Content-Transfer-Encoding: 7bit


--15643917222.0dc56c4d.24095
Date: Mon, 29 Jul 2019 09:15:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111228

--- Comment #3 from Michel D=C3=A4nzer <michel@daenzer.net> ---
From the attached bug report log:

*** /usr/share/X11/xorg.conf.d/10-amdgpu.conf
*** ls: -rw-r--r-- 1 root root 98 2019-07-12 20:45:36.635624123 +1000
/usr/share/X11/xorg.conf.d/10-amdgpu.conf
Section "OutputClass"
        Identifier "AMDgpu"
        MatchDriver "amdgpu"
        Driver "modesetting"
EndSection

This file originally says

        Driver "amdgpu"

not "modesetting". Who/what modified this file? Does the problem also occur
with the unmodified file, so that the Xorg amdgpu driver is used?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15643917222.0dc56c4d.24095
Date: Mon, 29 Jul 2019 09:15:22 +0000
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
   title=3D"NEW - PRIME output screen satys black on 1002:15d8 with 128MB V=
RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111228#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - PRIME output screen satys black on 1002:15d8 with 128MB V=
RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111228">bug 11122=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>From the attached bug report log:

*** /usr/share/X11/xorg.conf.d/10-amdgpu.conf
*** ls: -rw-r--r-- 1 root root 98 2019-07-12 20:45:36.635624123 +1000
/usr/share/X11/xorg.conf.d/10-amdgpu.conf
Section &quot;OutputClass&quot;
        Identifier &quot;AMDgpu&quot;
        MatchDriver &quot;amdgpu&quot;
        Driver &quot;modesetting&quot;
EndSection

This file originally says

        Driver &quot;amdgpu&quot;

not &quot;modesetting&quot;. Who/what modified this file? Does the problem =
also occur
with the unmodified file, so that the Xorg amdgpu driver is used?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15643917222.0dc56c4d.24095--

--===============0507627508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0507627508==--
