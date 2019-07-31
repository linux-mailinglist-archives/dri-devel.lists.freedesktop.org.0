Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E237C5E0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF8489F2E;
	Wed, 31 Jul 2019 15:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAC2489F2E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 15:15:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 09FA6721A2; Wed, 31 Jul 2019 15:15:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110961] Are provided libdrm packages completely open source?
Date: Wed, 31 Jul 2019 15:15:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: Jeremy.Newton@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110961-502-qxnrdMqdoo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110961-502@http.bugs.freedesktop.org/>
References: <bug-110961-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1020321045=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1020321045==
Content-Type: multipart/alternative; boundary="15645861190.4FC4B6AEB.14414"
Content-Transfer-Encoding: 7bit


--15645861190.4FC4B6AEB.14414
Date: Wed, 31 Jul 2019 15:15:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110961

--- Comment #4 from Jeremy Newton <Jeremy.Newton@amd.com> ---
Just a quick question Andrew, is there a reason you're trying to use our PRO
stack on Arch linux? The open stack is regularly tested by us and should wo=
rk
as-is considering that Arch already provides an up to date version of Mesa.

Do you need the closed source openGL driver specifically?

For our Vulkan, I would recommend porting our open source vulkan driver:
https://github.com/RadeonOpenCompute/ROCm-OpenCL-Driver

For OpenCL, I would advise porting the ROCm stack:
https://github.com/RadeonOpenCompute/ROCm-OpenCL-Driver
https://github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime
https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645861190.4FC4B6AEB.14414
Date: Wed, 31 Jul 2019 15:15:18 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Are provided libdrm packages completely open source?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110961#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Are provided libdrm packages completely open source?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110961">bug 11096=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Jeremy.Newton&#64;amd.com" title=3D"Jeremy Newton &lt;Jeremy.Newton&#64;amd=
.com&gt;"> <span class=3D"fn">Jeremy Newton</span></a>
</span></b>
        <pre>Just a quick question Andrew, is there a reason you're trying =
to use our PRO
stack on Arch linux? The open stack is regularly tested by us and should wo=
rk
as-is considering that Arch already provides an up to date version of Mesa.

Do you need the closed source openGL driver specifically?

For our Vulkan, I would recommend porting our open source vulkan driver:
<a href=3D"https://github.com/RadeonOpenCompute/ROCm-OpenCL-Driver">https:/=
/github.com/RadeonOpenCompute/ROCm-OpenCL-Driver</a>

For OpenCL, I would advise porting the ROCm stack:
<a href=3D"https://github.com/RadeonOpenCompute/ROCm-OpenCL-Driver">https:/=
/github.com/RadeonOpenCompute/ROCm-OpenCL-Driver</a>
<a href=3D"https://github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime">https:=
//github.com/RadeonOpenCompute/ROCm-OpenCL-Runtime</a>
<a href=3D"https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface">https=
://github.com/RadeonOpenCompute/ROCT-Thunk-Interface</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645861190.4FC4B6AEB.14414--

--===============1020321045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1020321045==--
