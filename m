Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30987564BE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79646E330;
	Wed, 26 Jun 2019 08:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09E7C6E330
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 08:39:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 06F2D72167; Wed, 26 Jun 2019 08:39:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110984] Vulkan shows stuttering issues on Vega 10 w/
 gnome-shell on Wayland
Date: Wed, 26 Jun 2019 08:39:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: NOTOURBUG
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110984-502-RbVjPzZjyo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110984-502@http.bugs.freedesktop.org/>
References: <bug-110984-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1580409563=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1580409563==
Content-Type: multipart/alternative; boundary="15615383650.A9A4a8.20204"
Content-Transfer-Encoding: 7bit


--15615383650.A9A4a8.20204
Date: Wed, 26 Jun 2019 08:39:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110984

--- Comment #4 from Michel D=C3=A4nzer <michel@daenzer.net> ---
(In reply to Olivier Fourdan from comment #2)
> Last thing, with single buffer, I would expect tearing more than stutteri=
ng,

It's a race between the Wayland server reading from the buffer and Xwayland
drawing to it. This can result in tearing if those two operations can actua=
lly
run concurrently, which is the case with amdgpu, but not yet with most other
drivers AFAIK.

Either way, it can result in the Wayland server already displaying a client
frame too early sometimes, hence the stuttering.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15615383650.A9A4a8.20204
Date: Wed, 26 Jun 2019 08:39:25 +0000
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
   title=3D"RESOLVED NOTOURBUG - Vulkan shows stuttering issues on Vega 10 =
w/ gnome-shell on Wayland"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110984#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - Vulkan shows stuttering issues on Vega 10 =
w/ gnome-shell on Wayland"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110984">bug 11098=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>(In reply to Olivier Fourdan from <a href=3D"show_bug.cgi?id=
=3D110984#c2">comment #2</a>)
<span class=3D"quote">&gt; Last thing, with single buffer, I would expect t=
earing more than stuttering,</span >

It's a race between the Wayland server reading from the buffer and Xwayland
drawing to it. This can result in tearing if those two operations can actua=
lly
run concurrently, which is the case with amdgpu, but not yet with most other
drivers AFAIK.

Either way, it can result in the Wayland server already displaying a client
frame too early sometimes, hence the stuttering.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15615383650.A9A4a8.20204--

--===============1580409563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1580409563==--
