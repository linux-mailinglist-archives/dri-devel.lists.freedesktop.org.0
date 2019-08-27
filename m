Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 035F59F5AD
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 23:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA9C890B3;
	Tue, 27 Aug 2019 21:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4305B89B18
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 21:56:33 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3F9E472161; Tue, 27 Aug 2019 21:56:33 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Tue, 27 Aug 2019 21:56:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: reddestdream@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-VfVQvaEj8V@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0621579547=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0621579547==
Content-Type: multipart/alternative; boundary="15669429931.3a0DD2a5.26905"
Content-Transfer-Encoding: 7bit


--15669429931.3a0DD2a5.26905
Date: Tue, 27 Aug 2019 21:56:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #122 from ReddestDream <reddestdream@gmail.com> ---
Tested 5.3-rc6. Still has the same issues. Only it's maybe actually worse
because I lose display completely when I use amdgpu.dpm=3D2 w/Radeon VII
multimonitor on 5.3-rc6, whereas on 5.2.9 I just got same/similar errors to
default.

I'm working a kernel fork of 5.3-rc6 where I'm reverting various things and
adding things in from Vega 10/12 and Navi to see if it helps. Haven't compi=
led
and tested it yet but since I know 5.3-rc6 itself boots, compiles, and
demonstrates the issue I guess it's a good base until 5.3 releases.

https://github.com/ReddestDream/linux

Any ideas anyone has are appreciated.

For now I actually find that amdgpu.dpm=3D0 with both 4K monitors on Radeon=
 VII
allows for much snappier generic desktop than my previous setup with AMD+iG=
PU.
It's amazing how well this card runs 4K displays w/o any proper memory clock
management at all. I'm sure the gaming performance would be pretty bad tho,=
 but
I have Windows for that for now . . .

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669429931.3a0DD2a5.26905
Date: Tue, 27 Aug 2019 21:56:33 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c122">Comm=
ent # 122</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
reddestdream&#64;gmail.com" title=3D"ReddestDream &lt;reddestdream&#64;gmai=
l.com&gt;"> <span class=3D"fn">ReddestDream</span></a>
</span></b>
        <pre>Tested 5.3-rc6. Still has the same issues. Only it's maybe act=
ually worse
because I lose display completely when I use amdgpu.dpm=3D2 w/Radeon VII
multimonitor on 5.3-rc6, whereas on 5.2.9 I just got same/similar errors to
default.

I'm working a kernel fork of 5.3-rc6 where I'm reverting various things and
adding things in from Vega 10/12 and Navi to see if it helps. Haven't compi=
led
and tested it yet but since I know 5.3-rc6 itself boots, compiles, and
demonstrates the issue I guess it's a good base until 5.3 releases.

<a href=3D"https://github.com/ReddestDream/linux">https://github.com/Reddes=
tDream/linux</a>

Any ideas anyone has are appreciated.

For now I actually find that amdgpu.dpm=3D0 with both 4K monitors on Radeon=
 VII
allows for much snappier generic desktop than my previous setup with AMD+iG=
PU.
It's amazing how well this card runs 4K displays w/o any proper memory clock
management at all. I'm sure the gaming performance would be pretty bad tho,=
 but
I have Windows for that for now . . .</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669429931.3a0DD2a5.26905--

--===============0621579547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0621579547==--
