Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE43864E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 10:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0658889C51;
	Fri,  7 Jun 2019 08:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5342189C51
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 08:30:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5033572167; Fri,  7 Jun 2019 08:30:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108381] amdgpu_bo_import and amdgpu_bo_free are not paired
 which leaks amdgpu_bo
Date: Fri, 07 Jun 2019 08:30:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-108381-502-JvrXjhRpqP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108381-502@http.bugs.freedesktop.org/>
References: <bug-108381-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1588868113=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1588868113==
Content-Type: multipart/alternative; boundary="15598962002.a80c1fba.19067"
Content-Transfer-Encoding: 7bit


--15598962002.a80c1fba.19067
Date: Fri, 7 Jun 2019 08:30:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108381

Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@=
amd.com> ---
Was fixed by
https://gitlab.freedesktop.org/mesa/mesa/commit/82aa07f81fcc5ed696eea16f48c=
ec7e39c3cd3d1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15598962002.a80c1fba.19067
Date: Fri, 7 Jun 2019 08:30:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pierre-er=
ic.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer &lt;pier=
re-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre-Eric Pel=
loux-Prayer</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - amdgpu_bo_import and amdgpu_bo_free are not pa=
ired which leaks amdgpu_bo"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108381">bug 10838=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - amdgpu_bo_import and amdgpu_bo_free are not pa=
ired which leaks amdgpu_bo"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108381#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - amdgpu_bo_import and amdgpu_bo_free are not pa=
ired which leaks amdgpu_bo"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108381">bug 10838=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>Was fixed by
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/commit/82aa07f81fcc5ed6=
96eea16f48cec7e39c3cd3d1">https://gitlab.freedesktop.org/mesa/mesa/commit/8=
2aa07f81fcc5ed696eea16f48cec7e39c3cd3d1</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15598962002.a80c1fba.19067--

--===============1588868113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1588868113==--
