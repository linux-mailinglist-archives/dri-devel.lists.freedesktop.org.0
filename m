Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DD524A92
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 10:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C7D8925A;
	Tue, 21 May 2019 08:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20428891EB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 08:40:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 17B9A72167; Tue, 21 May 2019 08:40:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108824] Invalid handling when GL buffer is bound on one context
 and invalidated on another
Date: Tue, 21 May 2019 08:40:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pelloux@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108824-502-fssatLmCLj@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0820009523=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0820009523==
Content-Type: multipart/alternative; boundary="15584280170.dcBa9A2a.7058"
Content-Transfer-Encoding: 7bit


--15584280170.dcBa9A2a.7058
Date: Tue, 21 May 2019 08:40:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108824

--- Comment #10 from Pierre-Eric Pelloux-Prayer <pelloux@gmail.com> ---
(In reply to Baldur Karlsson from comment #7)
> To repro with RenderDoc:
>=20
> * Download or build RenderDoc 1.4
> * Build gears3d from https://github.com/gears3d/gears3d
> * Launch gears3d through RenderDoc, capture, open the frame
> * Step back and forth through the drawcalls and the texture viewer will s=
how
> up with some corruption.
>=20
> Screenshot here: https://i.imgur.com/1Dk7diS.png

I tried to reproduce the issue and actually had 2 different issues:
- before 12bf7cfecf52083c484602f971738475edfe497e: the rendering is corrupt=
ed
as described above. Reverting 78e35df52aa2f7d770f929a0866a0faa89c261a9 fixes
the rendering.

- starting from 12bf7cfecf52083c484602f971738475edfe497e: the rendering is
corrupted and wrong: I only see the red gear, the green/blue ones are never
drawn

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15584280170.dcBa9A2a.7058
Date: Tue, 21 May 2019 08:40:17 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108824#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Invalid handling when GL buffer is bound on one context a=
nd invalidated on another"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108824">bug 10882=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pelloux&#64;gmail.com" title=3D"Pierre-Eric Pelloux-Prayer &lt;pelloux&#64;=
gmail.com&gt;"> <span class=3D"fn">Pierre-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>(In reply to Baldur Karlsson from <a href=3D"show_bug.cgi?id=
=3D108824#c7">comment #7</a>)
<span class=3D"quote">&gt; To repro with RenderDoc:
&gt;=20
&gt; * Download or build RenderDoc 1.4
&gt; * Build gears3d from <a href=3D"https://github.com/gears3d/gears3d">ht=
tps://github.com/gears3d/gears3d</a>
&gt; * Launch gears3d through RenderDoc, capture, open the frame
&gt; * Step back and forth through the drawcalls and the texture viewer wil=
l show
&gt; up with some corruption.
&gt;=20
&gt; Screenshot here: <a href=3D"https://i.imgur.com/1Dk7diS.png">https://i=
.imgur.com/1Dk7diS.png</a></span >

I tried to reproduce the issue and actually had 2 different issues:
- before 12bf7cfecf52083c484602f971738475edfe497e: the rendering is corrupt=
ed
as described above. Reverting 78e35df52aa2f7d770f929a0866a0faa89c261a9 fixes
the rendering.

- starting from 12bf7cfecf52083c484602f971738475edfe497e: the rendering is
corrupted and wrong: I only see the red gear, the green/blue ones are never
drawn</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15584280170.dcBa9A2a.7058--

--===============0820009523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0820009523==--
