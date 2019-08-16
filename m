Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C88FFBF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 12:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F216E2D6;
	Fri, 16 Aug 2019 10:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5B86C6E2DF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 10:10:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 584F37215A; Fri, 16 Aug 2019 10:10:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Fri, 16 Aug 2019 10:10:26 +0000
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
Message-ID: <bug-110674-502-j9XCdcFV0o@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0260218080=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0260218080==
Content-Type: multipart/alternative; boundary="15659502262.3BeFD971A.18513"
Content-Transfer-Encoding: 7bit


--15659502262.3BeFD971A.18513
Date: Fri, 16 Aug 2019 10:10:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #102 from Tom B <tom@r.je> ---
> Grasping at straws a bit here, but it occurred to me that maybe Linux ker=
nel testing on Radeon VII was done on an early VBIOS that didn't have full =
UEFI support yet. We know that AMD had to issue a VBIOS update for Radeon V=
II to fix UEFI support shortly after the launch. So maybe enabling the CSM/=
Legacy Support in the BIOS, which does impact early GPU initialization, mig=
ht have some effect on the multimonitor problem? Something I plan to test, =
but I wanted to share the idea in case someone else has a chance first.

I had already tried that unfortunately, I tried the following BIOS options:

CSM on/off
IOMMU on/of
PCIE speed 16x/4x (the only options my motherboard allowed for some reason)

Having said that, I didn't try booting using grub in BIOS mode as I  didn't
want to change my partition table, so it's possible that although I had used
CSM, it was only legacy support and still booting in UEFI mode.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15659502262.3BeFD971A.18513
Date: Fri, 16 Aug 2019 10:10:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c102">Comm=
ent # 102</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; Grasping at straws a bit here, but =
it occurred to me that maybe Linux kernel testing on Radeon VII was done on=
 an early VBIOS that didn't have full UEFI support yet. We know that AMD ha=
d to issue a VBIOS update for Radeon VII to fix UEFI support shortly after =
the launch. So maybe enabling the CSM/Legacy Support in the BIOS, which doe=
s impact early GPU initialization, might have some effect on the multimonit=
or problem? Something I plan to test, but I wanted to share the idea in cas=
e someone else has a chance first.</span >

I had already tried that unfortunately, I tried the following BIOS options:

CSM on/off
IOMMU on/of
PCIE speed 16x/4x (the only options my motherboard allowed for some reason)

Having said that, I didn't try booting using grub in BIOS mode as I  didn't
want to change my partition table, so it's possible that although I had used
CSM, it was only legacy support and still booting in UEFI mode.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15659502262.3BeFD971A.18513--

--===============0260218080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0260218080==--
