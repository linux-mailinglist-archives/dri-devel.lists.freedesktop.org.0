Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C080BA258
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF5A6E88B;
	Sun, 22 Sep 2019 12:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E6FA6E06E
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 09:11:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9B20D72162; Sat, 21 Sep 2019 09:11:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Sat, 21 Sep 2019 09:11:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: bisected
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: roland@rptd.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111077-502-sNv3d5feVi@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111077-502@http.bugs.freedesktop.org/>
References: <bug-111077-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1665017590=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1665017590==
Content-Type: multipart/alternative; boundary="15690570661.3D3AF50.8377"
Content-Transfer-Encoding: 7bit


--15690570661.3D3AF50.8377
Date: Sat, 21 Sep 2019 09:11:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

--- Comment #46 from roland@rptd.ch <roland@rptd.ch> ---
(In reply to Marek Ol=C5=A1=C3=A1k from comment #21)
> How do I reproduce it?

Looks like the trace file is too large to be attached here. I've put the fi=
le
on my server to access: http://rptd.ch/misc/debug/deigde.trace.7z

Replaying that trace shows the problematic behavior.

With the commit reverted the trace loads very fast and memory consumption g=
oes
up normally. With the commit not reverted loading takes long and memory
consumption jumps by 4G roughly.

Frame 0 is maybe a bit tricky to evaluate. Here the game engine does OpenGL
capability detection and and OpenGL implementation error checks. So you will
find various warnings, errors and such which only serve the purpose to figu=
re
out if what the OpenGL claims to support is actually really supported.

Frame 2279 is where the loading takes place. This is no more detection code=
 so
if anything is wrong in there then it's of interest.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15690570661.3D3AF50.8377
Date: Sat, 21 Sep 2019 09:11:06 +0000
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
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c46">Comme=
nt # 46</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
roland&#64;rptd.ch" title=3D"roland&#64;rptd.ch &lt;roland&#64;rptd.ch&gt;"=
> <span class=3D"fn">roland&#64;rptd.ch</span></a>
</span></b>
        <pre>(In reply to Marek Ol=C5=A1=C3=A1k from <a href=3D"show_bug.cg=
i?id=3D111077#c21">comment #21</a>)
<span class=3D"quote">&gt; How do I reproduce it?</span >

Looks like the trace file is too large to be attached here. I've put the fi=
le
on my server to access: <a href=3D"http://rptd.ch/misc/debug/deigde.trace.7=
z">http://rptd.ch/misc/debug/deigde.trace.7z</a>

Replaying that trace shows the problematic behavior.

With the commit reverted the trace loads very fast and memory consumption g=
oes
up normally. With the commit not reverted loading takes long and memory
consumption jumps by 4G roughly.

Frame 0 is maybe a bit tricky to evaluate. Here the game engine does OpenGL
capability detection and and OpenGL implementation error checks. So you will
find various warnings, errors and such which only serve the purpose to figu=
re
out if what the OpenGL claims to support is actually really supported.

Frame 2279 is where the loading takes place. This is no more detection code=
 so
if anything is wrong in there then it's of interest.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15690570661.3D3AF50.8377--

--===============1665017590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1665017590==--
