Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552E6226FF
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 16:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA4F891F4;
	Sun, 19 May 2019 14:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6069A8916D
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 14:27:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 583E472167; Sun, 19 May 2019 14:27:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Sun, 19 May 2019 14:27:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-bQyxvhCTBU@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1721746025=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1721746025==
Content-Type: multipart/alternative; boundary="15582760500.Af4Eb1.18423"
Content-Transfer-Encoding: 7bit


--15582760500.Af4Eb1.18423
Date: Sun, 19 May 2019 14:27:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #15 from Tom B <tom@r.je> ---
Have been running 5.0 since release without issue but upgraded this morning=
 and
got crashes as described here within a few seconds of boot.=20

5.1.3 also fixed it for me, however I am still seeing powerplay errors in
dmesg:

[    6.198409] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    6.198411] amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min
uclk failed!
[    7.396661] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    7.396662] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    8.587385] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    8.587386] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!
[    9.779135] amdgpu: [powerplay] Failed to send message 0x26, response 0x0
[    9.779136] amdgpu: [powerplay] Failed to set soft min gfxclk !
[    9.779136] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!


The GPU seems to be boosting as expected so I don't think there is any major
issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15582760500.Af4Eb1.18423
Date: Sun, 19 May 2019 14:27:30 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Have been running 5.0 since release without issue but upgraded=
 this morning and
got crashes as described here within a few seconds of boot.=20

5.1.3 also fixed it for me, however I am still seeing powerplay errors in
dmesg:

[    6.198409] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    6.198411] amdgpu: [powerplay] [SetUclkToHightestDpmLevel] Set hard min
uclk failed!
[    7.396661] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    7.396662] amdgpu: [powerplay] Attempt to set Hard Min for DCEFCLK Fail=
ed!
[    8.587385] amdgpu: [powerplay] Failed to send message 0x28, response 0x0
[    8.587386] amdgpu: [powerplay] [SetHardMinFreq] Set hard min uclk faile=
d!
[    9.779135] amdgpu: [powerplay] Failed to send message 0x26, response 0x0
[    9.779136] amdgpu: [powerplay] Failed to set soft min gfxclk !
[    9.779136] amdgpu: [powerplay] Failed to upload DPM Bootup Levels!


The GPU seems to be boosting as expected so I don't think there is any major
issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15582760500.Af4Eb1.18423--

--===============1721746025==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1721746025==--
