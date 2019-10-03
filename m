Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8958CA59B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 18:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6696EA2D;
	Thu,  3 Oct 2019 16:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B69966EA25
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 16:40:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ADDE372167; Thu,  3 Oct 2019 16:40:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107731] radeon (amdgpu) DisplayPort loss of max-resolution on
 DP monitor (after monitor power saving / idle)
Date: Thu, 03 Oct 2019 16:40:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Chryseus8080@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107731-502-Nmd6nZsoTd@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107731-502@http.bugs.freedesktop.org/>
References: <bug-107731-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0654616662=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0654616662==
Content-Type: multipart/alternative; boundary="15701208141.AAdc6.8087"
Content-Transfer-Encoding: 7bit


--15701208141.AAdc6.8087
Date: Thu, 3 Oct 2019 16:40:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107731

--- Comment #14 from James Wood <Chryseus8080@gmail.com> ---
I was about to report having the same bug but it seems the today's Mesa
19.2.0-2 update has solved the problem, I will include what I was originally
going to post in case it's of use to anyone.

---

I've began to have this bug in the last week or two, I have two monitors on=
e an
Asus PA238 connected via DVI has no issues, the other a AOC 2270W connected=
 via
DP changes to a lower resolution after wakeup, typically 800x600 which cann=
ot
be changed back to normal.

I can reproduce this consistently by using 'xset -display :0 dpms force
standby' and waiting about one minute.
Running 'xrandr --output DisplayPort-2 --auto' restores the display to its
normal native resolution.

The system log shows the following error:
[drm] enabling link 2 failed: 15
[drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring old state
failed with -22
Stack trace: https://pastebin.com/yguN5NUk

System specification:
OS: Arch linux 5.3.1-arch1-1-ARCH
GPU: AMD Radeon RX 590 using AMDGPU-Pro
DE: KDE Plasma 5.16.5

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15701208141.AAdc6.8087
Date: Thu, 3 Oct 2019 16:40:14 +0000
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
   title=3D"NEW - radeon (amdgpu) DisplayPort loss of max-resolution on DP =
monitor (after monitor power saving / idle)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107731#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - radeon (amdgpu) DisplayPort loss of max-resolution on DP =
monitor (after monitor power saving / idle)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107731">bug 10773=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Chryseus8080&#64;gmail.com" title=3D"James Wood &lt;Chryseus8080&#64;gmail.=
com&gt;"> <span class=3D"fn">James Wood</span></a>
</span></b>
        <pre>I was about to report having the same bug but it seems the tod=
ay's Mesa
19.2.0-2 update has solved the problem, I will include what I was originally
going to post in case it's of use to anyone.

---

I've began to have this bug in the last week or two, I have two monitors on=
e an
Asus PA238 connected via DVI has no issues, the other a AOC 2270W connected=
 via
DP changes to a lower resolution after wakeup, typically 800x600 which cann=
ot
be changed back to normal.

I can reproduce this consistently by using 'xset -display :0 dpms force
standby' and waiting about one minute.
Running 'xrandr --output DisplayPort-2 --auto' restores the display to its
normal native resolution.

The system log shows the following error:
[drm] enabling link 2 failed: 15
[drm:dm_restore_drm_connector_state [amdgpu]] *ERROR* Restoring old state
failed with -22
Stack trace: <a href=3D"https://pastebin.com/yguN5NUk">https://pastebin.com=
/yguN5NUk</a>

System specification:
OS: Arch linux 5.3.1-arch1-1-ARCH
GPU: AMD Radeon RX 590 using AMDGPU-Pro
DE: KDE Plasma 5.16.5</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15701208141.AAdc6.8087--

--===============0654616662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0654616662==--
