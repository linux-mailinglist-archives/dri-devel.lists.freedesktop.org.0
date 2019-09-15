Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5896B2F1C
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 09:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695846E067;
	Sun, 15 Sep 2019 07:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC40E6E81D
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 07:52:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C4A28721A2; Sun, 15 Sep 2019 07:52:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 15 Sep 2019 07:52:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-BYEFqKXXO9@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0157627500=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0157627500==
Content-Type: multipart/alternative; boundary="15685339582.AD2Ff.8000"
Content-Transfer-Encoding: 7bit


--15685339582.AD2Ff.8000
Date: Sun, 15 Sep 2019 07:52:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #40 from Shmerl <shtetldik@gmail.com> ---
With that patch, I get stutters, but not hard freeze when using ksysguard w=
ith
reading amdgpu sensors. I see such errors in dmesg when that happens:

14889.400985] amdgpu: [powerplay] Failed to export SMU metrics table!
[14890.311391] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2, param 0x80
[14891.933714] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2, param 0x80
[14892.785612] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2 param 0x80
[14892.785615] amdgpu: [powerplay] Failed to export SMU metrics table!
[14894.406389] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2 param 0x80
[14894.406393] amdgpu: [powerplay] Failed to export SMU metrics table!
[14895.261140] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2, param 0x80
[14896.937622] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2, param 0x80
[14897.734712] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2 param 0x80
[14897.734714] amdgpu: [powerplay] Failed to export SMU metrics table!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15685339582.AD2Ff.8000
Date: Sun, 15 Sep 2019 07:52:38 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c40">Comme=
nt # 40</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shtetldik&#64;gmail.com" title=3D"Shmerl &lt;shtetldik&#64;gmail.com&gt;"> =
<span class=3D"fn">Shmerl</span></a>
</span></b>
        <pre>With that patch, I get stutters, but not hard freeze when usin=
g ksysguard with
reading amdgpu sensors. I see such errors in dmesg when that happens:

14889.400985] amdgpu: [powerplay] Failed to export SMU metrics table!
[14890.311391] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2, param 0x80
[14891.933714] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2, param 0x80
[14892.785612] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2 param 0x80
[14892.785615] amdgpu: [powerplay] Failed to export SMU metrics table!
[14894.406389] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2 param 0x80
[14894.406393] amdgpu: [powerplay] Failed to export SMU metrics table!
[14895.261140] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2, param 0x80
[14896.937622] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2, param 0x80
[14897.734712] amdgpu: [powerplay] Failed to send message 0xe, response
0xffffffc2 param 0x80
[14897.734714] amdgpu: [powerplay] Failed to export SMU metrics table!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15685339582.AD2Ff.8000--

--===============0157627500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0157627500==--
