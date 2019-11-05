Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A5EF891
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 10:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE856E95A;
	Tue,  5 Nov 2019 09:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E32B6E96B
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 09:23:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0B21D720E2; Tue,  5 Nov 2019 09:23:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Tue, 05 Nov 2019 09:23:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: ousleyaric@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-oihotnKA7E@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0961542812=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0961542812==
Content-Type: multipart/alternative; boundary="15729457910.16cE.15853"
Content-Transfer-Encoding: 7bit


--15729457910.16cE.15853
Date: Tue, 5 Nov 2019 09:23:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #208 from ousleyaric@gmail.com ---
Just making this note at the recommendation of another, I'm reproducing sim=
ilar
behavior across both Linux distributions, and Windows 10. The behavior is as
follows:

Linux-Manjaro Linux kernel 5.4.0-1-MANJARO, Mesa 20.0.0-devel (git-dd77bdb3=
4b),
and LLVM 10.0.0 (compiled from Git master as I recall):
Boot, launch Overwatch, or SteamVR. Usually after a period of 1-2 hours,
displays will stutter a few times, before a full hang, leaving the last
rendered frame on each display.

Windows 10: latest insider build as of 11/5/2019:
Similar behavior in the end, aside from the duration of stability being 3-4
hours it seems. Launching SteamVR, I can run for 3-4 hours, and then it
stutters, hangs for a few seconds, then recovers. Then it'll do the same a =
few
moments later with a longer duration before the recovery. After this repeat=
s a
few times, the display either hangs on the last frame, or all displays go
black. After this, I have to hard-shutdown the same way as I do for Manjaro=
.=20

This may not be the exact same behavior, but I don't know of a way to log t=
his
particular behavior in Windows.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15729457910.16cE.15853
Date: Tue, 5 Nov 2019 09:23:11 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c208">Comm=
ent # 208</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ousleyaric&#64;gmail.com" title=3D"ousleyaric&#64;gmail.com">ousleyaric&#64=
;gmail.com</a>
</span></b>
        <pre>Just making this note at the recommendation of another, I'm re=
producing similar
behavior across both Linux distributions, and Windows 10. The behavior is as
follows:

Linux-Manjaro Linux kernel 5.4.0-1-MANJARO, Mesa 20.0.0-devel (git-dd77bdb3=
4b),
and LLVM 10.0.0 (compiled from Git master as I recall):
Boot, launch Overwatch, or SteamVR. Usually after a period of 1-2 hours,
displays will stutter a few times, before a full hang, leaving the last
rendered frame on each display.

Windows 10: latest insider build as of 11/5/2019:
Similar behavior in the end, aside from the duration of stability being 3-4
hours it seems. Launching SteamVR, I can run for 3-4 hours, and then it
stutters, hangs for a few seconds, then recovers. Then it'll do the same a =
few
moments later with a longer duration before the recovery. After this repeat=
s a
few times, the display either hangs on the last frame, or all displays go
black. After this, I have to hard-shutdown the same way as I do for Manjaro=
.=20

This may not be the exact same behavior, but I don't know of a way to log t=
his
particular behavior in Windows.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15729457910.16cE.15853--

--===============0961542812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0961542812==--
