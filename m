Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F208E3DDE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 22:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E836E5E7;
	Thu, 24 Oct 2019 20:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id F31DD6E5E7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 20:58:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EB2F6720E2; Thu, 24 Oct 2019 20:58:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107139] [CI] KBL-G Hades Canyon doesn't survive
 igt@gem_exec_suspend@basic-s4-devices
Date: Thu, 24 Oct 2019 20:58:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ashutosh.dixit@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107139-502-BlqRoqqDz7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107139-502@http.bugs.freedesktop.org/>
References: <bug-107139-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1108964869=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1108964869==
Content-Type: multipart/alternative; boundary="15719506840.CA22c98c.1435"
Content-Transfer-Encoding: 7bit


--15719506840.CA22c98c.1435
Date: Thu, 24 Oct 2019 20:58:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107139

--- Comment #3 from ashutosh.dixit@intel.com ---
Bug assessment: The IGT submits batch buffers both before and after hiberna=
ting
the system and ensures they complete successfully. This bug has not been
updated in over a year. The system is a KBL NUC with a AMD GPU. Earlier, fr=
om
the comments, it seems there was a panic in amdgpu side and component was
assigned as DRM/AMDgpu.

At this point, from what I can tell, the test itself is passing except for =
the
following trace in dmesg:

<3> [76.484258] [drm:intel_dp_aux_xfer [i915]] *ERROR* dp aux hw did not si=
gnal
timeout!

https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5237/fi-kbl-7500u/igt@gem_exec=
_suspend@basic-s4-devices.html

This trace is coming from the i915 display port. The above trace is already
been tracked as part of bug 105128. As a result of these findings I am:

a. Setting the component of this bug to DRM/Intel
b. Marking this bug as a duplicate of bug 105128

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719506840.CA22c98c.1435
Date: Thu, 24 Oct 2019 20:58:04 +0000
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
   title=3D"NEW - [CI] KBL-G Hades Canyon doesn't survive igt&#64;gem_exec_=
suspend&#64;basic-s4-devices"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107139#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI] KBL-G Hades Canyon doesn't survive igt&#64;gem_exec_=
suspend&#64;basic-s4-devices"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107139">bug 10713=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ashutosh.dixit&#64;intel.com" title=3D"ashutosh.dixit&#64;intel.com">ashuto=
sh.dixit&#64;intel.com</a>
</span></b>
        <pre>Bug assessment: The IGT submits batch buffers both before and =
after hibernating
the system and ensures they complete successfully. This bug has not been
updated in over a year. The system is a KBL NUC with a AMD GPU. Earlier, fr=
om
the comments, it seems there was a panic in amdgpu side and component was
assigned as DRM/AMDgpu.

At this point, from what I can tell, the test itself is passing except for =
the
following trace in dmesg:

&lt;3&gt; [76.484258] [drm:intel_dp_aux_xfer [i915]] *ERROR* dp aux hw did =
not signal
timeout!

<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5237/fi-kbl-7500u/i=
gt&#64;gem_exec_suspend&#64;basic-s4-devices.html">https://intel-gfx-ci.01.=
org/tree/drm-tip/IGT_5237/fi-kbl-7500u/igt&#64;gem_exec_suspend&#64;basic-s=
4-devices.html</a>

This trace is coming from the i915 display port. The above trace is already
been tracked as part of <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI] igt&#64;* - dmesg-warn - *ERROR* dp aux hw did not s=
ignal timeout!"
   href=3D"show_bug.cgi?id=3D105128">bug 105128</a>. As a result of these f=
indings I am:

a. Setting the component of this bug to DRM/Intel
b. Marking this bug as a duplicate of <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI] igt&#64;* - dmesg-warn - *ERROR* dp aux hw did not s=
ignal timeout!"
   href=3D"show_bug.cgi?id=3D105128">bug 105128</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719506840.CA22c98c.1435--

--===============1108964869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1108964869==--
