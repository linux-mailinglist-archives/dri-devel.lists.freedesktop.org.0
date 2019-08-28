Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 021E29FD72
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304908930A;
	Wed, 28 Aug 2019 08:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E940B8995F
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:42:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E628A72161; Wed, 28 Aug 2019 08:42:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111506] [amdgpu] VRR/Freesync below the range (LFC) flickering
 (5700 XT)
Date: Wed, 28 Aug 2019 08:42:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111506-502-aR50cfIRZg@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111506-502@http.bugs.freedesktop.org/>
References: <bug-111506-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1175010455=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1175010455==
Content-Type: multipart/alternative; boundary="15669817541.aCDe27c4f.16919"
Content-Transfer-Encoding: 7bit


--15669817541.aCDe27c4f.16919
Date: Wed, 28 Aug 2019 08:42:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111506

--- Comment #1 from Andrew Sheldon <asheldon55@gmail.com> ---
I should note that it doesn't flicker at all with the modification I sugges=
ted.
Presumably, LFC is in fact kicking in at 30fps and below, so assuming that's
the case, it's not really LFC in general that is the problem, just LFC when
just below the minimum.=20

One possibility is that LFC is somehow generating frames at a rate above the
maximum refresh rate for framerates above 30 and below the minimum (35), si=
nce
the range is fairly narrow. Maybe it's tripling rather than doubling the
framerate?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669817541.aCDe27c4f.16919
Date: Wed, 28 Aug 2019 08:42:34 +0000
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
   title=3D"NEW - [amdgpu] VRR/Freesync below the range (LFC) flickering (5=
700 XT)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111506#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu] VRR/Freesync below the range (LFC) flickering (5=
700 XT)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111506">bug 11150=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>I should note that it doesn't flicker at all with the modifica=
tion I suggested.
Presumably, LFC is in fact kicking in at 30fps and below, so assuming that's
the case, it's not really LFC in general that is the problem, just LFC when
just below the minimum.=20

One possibility is that LFC is somehow generating frames at a rate above the
maximum refresh rate for framerates above 30 and below the minimum (35), si=
nce
the range is fairly narrow. Maybe it's tripling rather than doubling the
framerate?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669817541.aCDe27c4f.16919--

--===============1175010455==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1175010455==--
