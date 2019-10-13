Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 148FBD5598
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 12:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A2F89E4C;
	Sun, 13 Oct 2019 10:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D3D589E4C
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 10:08:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8A2AC7296E; Sun, 13 Oct 2019 10:08:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111987] Unstable performance (periodic and repeating patterns
 of fps change) and changing VDDGFX
Date: Sun, 13 Oct 2019 10:08:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: witold.baryluk+freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111987-502-RbcO7F5ucw@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111987-502@http.bugs.freedesktop.org/>
References: <bug-111987-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0217089554=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0217089554==
Content-Type: multipart/alternative; boundary="15709612931.72bF.25354"
Content-Transfer-Encoding: 7bit


--15709612931.72bF.25354
Date: Sun, 13 Oct 2019 10:08:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111987

--- Comment #9 from Witold Baryluk <witold.baryluk+freedesktop@gmail.com> -=
--
Kernel config, nothing special:

$ grep DRM_AMD /boot/config-5.2.0-3-amd64=20
CONFIG_DRM_AMDGPU=3Dm
CONFIG_DRM_AMDGPU_SI=3Dy
CONFIG_DRM_AMDGPU_CIK=3Dy
CONFIG_DRM_AMDGPU_USERPTR=3Dy
# CONFIG_DRM_AMDGPU_GART_DEBUGFS is not set
CONFIG_DRM_AMD_ACP=3Dy
CONFIG_DRM_AMD_DC=3Dy
CONFIG_DRM_AMD_DC_DCN1_0=3Dy
CONFIG_DRM_AMD_DC_DCN1_01=3Dy
$

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15709612931.72bF.25354
Date: Sun, 13 Oct 2019 10:08:13 +0000
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
   title=3D"NEW - Unstable performance (periodic and repeating patterns of =
fps change) and changing VDDGFX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unstable performance (periodic and repeating patterns of =
fps change) and changing VDDGFX"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111987">bug 11198=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
witold.baryluk+freedesktop&#64;gmail.com" title=3D"Witold Baryluk &lt;witol=
d.baryluk+freedesktop&#64;gmail.com&gt;"> <span class=3D"fn">Witold Baryluk=
</span></a>
</span></b>
        <pre>Kernel config, nothing special:

$ grep DRM_AMD /boot/config-5.2.0-3-amd64=20
CONFIG_DRM_AMDGPU=3Dm
CONFIG_DRM_AMDGPU_SI=3Dy
CONFIG_DRM_AMDGPU_CIK=3Dy
CONFIG_DRM_AMDGPU_USERPTR=3Dy
# CONFIG_DRM_AMDGPU_GART_DEBUGFS is not set
CONFIG_DRM_AMD_ACP=3Dy
CONFIG_DRM_AMD_DC=3Dy
CONFIG_DRM_AMD_DC_DCN1_0=3Dy
CONFIG_DRM_AMD_DC_DCN1_01=3Dy
$</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15709612931.72bF.25354--

--===============0217089554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0217089554==--
