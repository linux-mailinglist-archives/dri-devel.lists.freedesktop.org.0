Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE7912308
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 22:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D60289854;
	Thu,  2 May 2019 20:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6949489854
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 20:15:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 65D787215A; Thu,  2 May 2019 20:15:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110443] vaapi/vpp: wrong output for non 64-bytes align width
 (ex: 1200)
Date: Thu, 02 May 2019 20:15:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: viktor_jaegerskuepper@freenet.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110443-502-Q8b85fB4xH@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110443-502@http.bugs.freedesktop.org/>
References: <bug-110443-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1770143277=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1770143277==
Content-Type: multipart/alternative; boundary="15568281191.b390B.16405"
Content-Transfer-Encoding: 7bit


--15568281191.b390B.16405
Date: Thu, 2 May 2019 20:15:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110443

--- Comment #10 from Viktor J=C3=A4gersk=C3=BCpper <viktor_jaegerskuepper@f=
reenet.de> ---
I tried to investigate a bit further, and I think video acceleration does n=
ot
really work on my RV770, neither with VA-API nor with VDPAU. However, even =
if I
deactivate hardware video decoding in VLC, it crashes when I want to play a
video.

So I think you're right, it should just fall back to whatever "worked" befo=
re
the change.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15568281191.b390B.16405
Date: Thu, 2 May 2019 20:15:19 +0000
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
   title=3D"NEW - vaapi/vpp: wrong output for non 64-bytes align width (ex:=
 1200)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110443#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vaapi/vpp: wrong output for non 64-bytes align width (ex:=
 1200)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110443">bug 11044=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
viktor_jaegerskuepper&#64;freenet.de" title=3D"Viktor J=C3=A4gersk=C3=BCppe=
r &lt;viktor_jaegerskuepper&#64;freenet.de&gt;"> <span class=3D"fn">Viktor =
J=C3=A4gersk=C3=BCpper</span></a>
</span></b>
        <pre>I tried to investigate a bit further, and I think video accele=
ration does not
really work on my RV770, neither with VA-API nor with VDPAU. However, even =
if I
deactivate hardware video decoding in VLC, it crashes when I want to play a
video.

So I think you're right, it should just fall back to whatever &quot;worked&=
quot; before
the change.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15568281191.b390B.16405--

--===============1770143277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1770143277==--
