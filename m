Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE19D1E709
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 05:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1169489346;
	Wed, 15 May 2019 03:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F2E9289346
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 03:05:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EF18B721CD; Wed, 15 May 2019 03:05:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Wed, 15 May 2019 03:05:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: chris@hodapp.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-Pe2t960elK@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1855787626=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1855787626==
Content-Type: multipart/alternative; boundary="15578895491.10E19.19883"
Content-Transfer-Encoding: 7bit


--15578895491.10E19.19883
Date: Wed, 15 May 2019 03:05:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #8 from Chris Hodapp <chris@hodapp.email> ---
I've actually found another crash which triggers pretty promptly whenever I
play (presumably-accelerated) YouTube videos. I'll attach dmesg and
display-manager.service logs for that crash here but I'm happy to file them=
 as
a separate bug upon request.

I'm also going to go ahead and upload *another* set of logs from an event w=
hich
happens from time to time where I get blocks of vaporwave-looking colored
blocks mixed with garbled past-images (presumably hanging around in freed
memory). I didn't include this before because I mistakenly thought that the
dmesg output was the same as for the original less-visually-striking lock-u=
ps
that I described up front. However, it's not clear that I was wrong about t=
hat.
Anyway, like I said, I'm going to post these logs too and, once again, I'm
happy to move them to a separate bug upon request.


I'll also describe my technique for capturing these logs, in case it matter=
s:
When these crashes happen, my first response is to try and shift to a diffe=
rent
(text-mode) virtual console to capture the logs. When that works, I save off
the logs and then reboot. However, sometimes the crash is so bad that I'm n=
ot
able to switch to a text-mode virtual console, in which case I have to hard=
-cut
the power and capture the logs retroactively with `journalctl` and a negati=
ve
boot-number arg. I was able to capture the original log by switching virtual
consoles but both of these new ones were captured after a reboot with
`journalctl`.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15578895491.10E19.19883
Date: Wed, 15 May 2019 03:05:49 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;hodapp.email" title=3D"Chris Hodapp &lt;chris&#64;hodapp.email&gt=
;"> <span class=3D"fn">Chris Hodapp</span></a>
</span></b>
        <pre>I've actually found another crash which triggers pretty prompt=
ly whenever I
play (presumably-accelerated) YouTube videos. I'll attach dmesg and
display-manager.service logs for that crash here but I'm happy to file them=
 as
a separate bug upon request.

I'm also going to go ahead and upload *another* set of logs from an event w=
hich
happens from time to time where I get blocks of vaporwave-looking colored
blocks mixed with garbled past-images (presumably hanging around in freed
memory). I didn't include this before because I mistakenly thought that the
dmesg output was the same as for the original less-visually-striking lock-u=
ps
that I described up front. However, it's not clear that I was wrong about t=
hat.
Anyway, like I said, I'm going to post these logs too and, once again, I'm
happy to move them to a separate bug upon request.


I'll also describe my technique for capturing these logs, in case it matter=
s:
When these crashes happen, my first response is to try and shift to a diffe=
rent
(text-mode) virtual console to capture the logs. When that works, I save off
the logs and then reboot. However, sometimes the crash is so bad that I'm n=
ot
able to switch to a text-mode virtual console, in which case I have to hard=
-cut
the power and capture the logs retroactively with `journalctl` and a negati=
ve
boot-number arg. I was able to capture the original log by switching virtual
consoles but both of these new ones were captured after a reboot with
`journalctl`.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15578895491.10E19.19883--

--===============1855787626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1855787626==--
