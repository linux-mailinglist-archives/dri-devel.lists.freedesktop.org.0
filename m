Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC520D1B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 18:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568FB89483;
	Thu, 16 May 2019 16:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D6E1189483
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:34:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D387B72167; Thu, 16 May 2019 16:34:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108824] Invalid handling when GL buffer is bound on one context
 and invalidated on another
Date: Thu, 16 May 2019 16:34:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: baldurk@baldurk.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108824-502-4UKKEXgYsM@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108824-502@http.bugs.freedesktop.org/>
References: <bug-108824-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1835762662=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1835762662==
Content-Type: multipart/alternative; boundary="15580244821.B59a.6370"
Content-Transfer-Encoding: 7bit


--15580244821.B59a.6370
Date: Thu, 16 May 2019 16:34:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108824

--- Comment #7 from Baldur Karlsson <baldurk@baldurk.org> ---
I applied the patchset on top of latest mesa
(aa040d3b3c7d068e1ece61c71770c16a54745f89) and I seem to get some rendered
corruption that I don't get with the parent commit before applying the patc=
hes.

It seems to only appear in RenderDoc, or at least it doesn't happen when
running tiny demo programs. I can't isolate a simpler test case just now bu=
t it
seems reliably reproducible and only shows up when I build with the patches
applied.

To repro with RenderDoc:

* Download or build RenderDoc 1.4
* Build gears3d from https://github.com/gears3d/gears3d
* Launch gears3d through RenderDoc, capture, open the frame
* Step back and forth through the drawcalls and the texture viewer will sho=
w up
with some corruption.

Screenshot here: https://i.imgur.com/1Dk7diS.png

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15580244821.B59a.6370
Date: Thu, 16 May 2019 16:34:42 +0000
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
   title=3D"NEW - Invalid handling when GL buffer is bound on one context a=
nd invalidated on another"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108824#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Invalid handling when GL buffer is bound on one context a=
nd invalidated on another"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108824">bug 10882=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
baldurk&#64;baldurk.org" title=3D"Baldur Karlsson &lt;baldurk&#64;baldurk.o=
rg&gt;"> <span class=3D"fn">Baldur Karlsson</span></a>
</span></b>
        <pre>I applied the patchset on top of latest mesa
(aa040d3b3c7d068e1ece61c71770c16a54745f89) and I seem to get some rendered
corruption that I don't get with the parent commit before applying the patc=
hes.

It seems to only appear in RenderDoc, or at least it doesn't happen when
running tiny demo programs. I can't isolate a simpler test case just now bu=
t it
seems reliably reproducible and only shows up when I build with the patches
applied.

To repro with RenderDoc:

* Download or build RenderDoc 1.4
* Build gears3d from <a href=3D"https://github.com/gears3d/gears3d">https:/=
/github.com/gears3d/gears3d</a>
* Launch gears3d through RenderDoc, capture, open the frame
* Step back and forth through the drawcalls and the texture viewer will sho=
w up
with some corruption.

Screenshot here: <a href=3D"https://i.imgur.com/1Dk7diS.png">https://i.imgu=
r.com/1Dk7diS.png</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15580244821.B59a.6370--

--===============1835762662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1835762662==--
