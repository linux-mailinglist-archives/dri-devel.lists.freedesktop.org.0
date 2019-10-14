Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F9D67F4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 19:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1BD6E0E4;
	Mon, 14 Oct 2019 17:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 15B7989B66
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 17:05:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 081887296E; Mon, 14 Oct 2019 17:05:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 14 Oct 2019 17:05:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-wUbMVsOabH@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0445151542=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0445151542==
Content-Type: multipart/alternative; boundary="15710727360.A65fB.13265"
Content-Transfer-Encoding: 7bit


--15710727360.A65fB.13265
Date: Mon, 14 Oct 2019 17:05:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #165 from Tom B <tom@r.je> ---
I just tried 5.3.5 (which is the latest in the arch repo) and it's working =
fine
for me.

I do have an issue on Wayland. If the screen turns off, Wayland crashes and=
 I
have to hard reset. The log shows=20

Oct 14 17:48:56 desktop kernel: amdgpu: [powerplay] [SetHardMinFreq] Set ha=
rd
min uclk failed!
Oct 14 17:49:02 desktop kernel: amdgpu: [powerplay] Failed to send message
0x26, response 0x0
Oct 14 17:49:02 desktop kernel: amdgpu: [powerplay] Failed to set soft min
gfxclk !
Oct 14 17:49:02 desktop kernel: amdgpu: [powerplay] Failed to upload DPM Bo=
otup
Levels!


But, this also shows on boot so I'm not sure it's a problem and it seems to=
 be
wayland that segfaults, not an issue with amdgpu.=20

I do still get `kernel: [drm] schedsdma0 is not ready, skipping` repeating
forever in my journal.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15710727360.A65fB.13265
Date: Mon, 14 Oct 2019 17:05:36 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c165">Comm=
ent # 165</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>I just tried 5.3.5 (which is the latest in the arch repo) and =
it's working fine
for me.

I do have an issue on Wayland. If the screen turns off, Wayland crashes and=
 I
have to hard reset. The log shows=20

Oct 14 17:48:56 desktop kernel: amdgpu: [powerplay] [SetHardMinFreq] Set ha=
rd
min uclk failed!
Oct 14 17:49:02 desktop kernel: amdgpu: [powerplay] Failed to send message
0x26, response 0x0
Oct 14 17:49:02 desktop kernel: amdgpu: [powerplay] Failed to set soft min
gfxclk !
Oct 14 17:49:02 desktop kernel: amdgpu: [powerplay] Failed to upload DPM Bo=
otup
Levels!


But, this also shows on boot so I'm not sure it's a problem and it seems to=
 be
wayland that segfaults, not an issue with amdgpu.=20

I do still get `kernel: [drm] schedsdma0 is not ready, skipping` repeating
forever in my journal.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15710727360.A65fB.13265--

--===============0445151542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0445151542==--
