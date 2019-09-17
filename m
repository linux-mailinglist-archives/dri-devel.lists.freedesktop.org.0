Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9222B44F0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 02:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1434D6EABD;
	Tue, 17 Sep 2019 00:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BBC386EABD
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 00:46:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B124272167; Tue, 17 Sep 2019 00:46:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111669] Navi GPU hang in Minecraft
Date: Tue, 17 Sep 2019 00:46:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: git@dougty.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111669-502-lItQU4XvKT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111669-502@http.bugs.freedesktop.org/>
References: <bug-111669-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0369377385=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0369377385==
Content-Type: multipart/alternative; boundary="15686811610.9b7be.14425"
Content-Transfer-Encoding: 7bit


--15686811610.9b7be.14425
Date: Tue, 17 Sep 2019 00:46:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111669

--- Comment #6 from Doug Ty <git@dougty.com> ---
Unfortunately I'm still getting the hang with the kernel patch +
AMD_DEBUG=3Dnongg, both ingame as well as replaying the apitraces. Same mes=
sages
in journalctl

Not sure how useful it'll be but I've made another apitrace with patch + no=
ngg
https://drive.google.com/open?id=3D1NSMBW-GKHMAMOjrHS_cD-CvvUkvviqx5

Is there anything more I can do to help debug this? A specific firmware I
should be using?

Currently using:
Linux 5.3 (both rc8 and now stable release, compiled with the patch)
llvm-git 10.0.0_r326744.bfb5b0cb86c-1
mesa-git 1:19.3.0_devel.115313.f812cbfd884-1
Latest firmware (9/13) from
https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/ (was previously
using 7/14 from Fedora's linux-firmware)

Only AMD_DEBUG=3Dnodma stops the hang for me
No luck with amdgpu.vm_update_mode=3D3

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15686811610.9b7be.14425
Date: Tue, 17 Sep 2019 00:46:01 +0000
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
   title=3D"NEW - Navi GPU hang in Minecraft"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111669#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Navi GPU hang in Minecraft"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111669">bug 11166=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
git&#64;dougty.com" title=3D"Doug Ty &lt;git&#64;dougty.com&gt;"> <span cla=
ss=3D"fn">Doug Ty</span></a>
</span></b>
        <pre>Unfortunately I'm still getting the hang with the kernel patch=
 +
AMD_DEBUG=3Dnongg, both ingame as well as replaying the apitraces. Same mes=
sages
in journalctl

Not sure how useful it'll be but I've made another apitrace with patch + no=
ngg
<a href=3D"https://drive.google.com/open?id=3D1NSMBW-GKHMAMOjrHS_cD-CvvUkvv=
iqx5">https://drive.google.com/open?id=3D1NSMBW-GKHMAMOjrHS_cD-CvvUkvviqx5<=
/a>

Is there anything more I can do to help debug this? A specific firmware I
should be using?

Currently using:
Linux 5.3 (both rc8 and now stable release, compiled with the patch)
llvm-git 10.0.0_r326744.bfb5b0cb86c-1
mesa-git 1:19.3.0_devel.115313.f812cbfd884-1
Latest firmware (9/13) from
<a href=3D"https://people.freedesktop.org/~agd5f/radeon_ucode/navi10/">http=
s://people.freedesktop.org/~agd5f/radeon_ucode/navi10/</a> (was previously
using 7/14 from Fedora's linux-firmware)

Only AMD_DEBUG=3Dnodma stops the hang for me
No luck with amdgpu.vm_update_mode=3D3</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15686811610.9b7be.14425--

--===============0369377385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0369377385==--
