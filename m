Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2696E207
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 09:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F676E5C0;
	Fri, 19 Jul 2019 07:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1C146E5C0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 07:54:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AE59A72167; Fri, 19 Jul 2019 07:54:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 106856] amdgpu kernel warning playing vdpau videos
Date: Fri, 19 Jul 2019 07:54:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-106856-502-aIgl2kPrwT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-106856-502@http.bugs.freedesktop.org/>
References: <bug-106856-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0989850879=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0989850879==
Content-Type: multipart/alternative; boundary="15635228871.b61fC6.12003"
Content-Transfer-Encoding: 7bit


--15635228871.b61fC6.12003
Date: Fri, 19 Jul 2019 07:54:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106856

--- Comment #4 from Michel D=C3=A4nzer <michel@daenzer.net> ---
(In reply to devbazilio from comment #3)
> [...] only 4.14 kernels don't have DC enabled

FWIW, you can always disable DC with amdgpu.dc=3D0 on the kernel command li=
ne.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15635228871.b61fC6.12003
Date: Fri, 19 Jul 2019 07:54:47 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - amdgpu kernel warning playing vdpau videos"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106856#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - amdgpu kernel warning playing vdpau videos"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106856">bug 10685=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>(In reply to devbazilio from <a href=3D"show_bug.cgi?id=3D1068=
56#c3">comment #3</a>)
<span class=3D"quote">&gt; [...] only 4.14 kernels don't have DC enabled</s=
pan >

FWIW, you can always disable DC with amdgpu.dc=3D0 on the kernel command li=
ne.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15635228871.b61fC6.12003--

--===============0989850879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0989850879==--
