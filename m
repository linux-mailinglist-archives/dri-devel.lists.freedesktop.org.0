Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A561BACA58
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 04:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCA889D8E;
	Sun,  8 Sep 2019 02:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0FE6989D8E
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 02:22:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0A84372161; Sun,  8 Sep 2019 02:22:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111555] [amdgpu/Navi] [powerplay] Failed to send message errors
Date: Sun, 08 Sep 2019 02:22:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111555-502-kENx2IBbja@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111555-502@http.bugs.freedesktop.org/>
References: <bug-111555-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1392256900=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1392256900==
Content-Type: multipart/alternative; boundary="15679093301.da0Fa5fc.30064"
Content-Transfer-Encoding: 7bit


--15679093301.da0Fa5fc.30064
Date: Sun, 8 Sep 2019 02:22:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111555

--- Comment #3 from Andrew Sheldon <asheldon55@gmail.com> ---
Are you running a monitor at 75hz?

I can only trigger the bug when setting 74-76hz with amd-staging-drm-next, =
and
although I haven't tested in a while, I suspect the same applies with 5.3-r=
cX
(and drm-next-5.4).

Here's the output after setting 75hz, on amd-staging-drm-next:
[ 7937.682003] amdgpu: [powerplay] failed send message: TransferTableSmu2Dr=
am
(18)      param: 0x00000006 response 0xffffffc2
[ 7937.682004] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 7938.087356] amdgpu: [powerplay] failed send message: NumOfDisplays (64)=
=20=20=20=20=20
param: 0x00000001 response 0xffffffc2
[ 7940.224391] amdgpu: [powerplay] failed send message: TransferTableSmu2Dr=
am
(18)      param: 0x00000006 response 0xffffffc2
[ 7940.224392] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 7942.362952] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7944.510060] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7944.510061] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 7945.269921] amdgpu: [powerplay] failed send message: NumOfDisplays (64)=
=20=20=20=20=20
param: 0x00000001 response 0xffffffc2
[ 7946.652777] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7947.411808] amdgpu: [powerplay] failed send message: NumOfDisplays (64)=
=20=20=20=20=20
param: 0x00000001 response 0xffffffc2
[ 7948.786413] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7948.786414] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 7950.918131] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7953.076247] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7953.076250] amdgpu: [powerplay] Failed to export SMU metrics table!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15679093301.da0Fa5fc.30064
Date: Sun, 8 Sep 2019 02:22:10 +0000
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
   title=3D"NEW - [amdgpu/Navi] [powerplay] Failed to send message errors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111555#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [amdgpu/Navi] [powerplay] Failed to send message errors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111555">bug 11155=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>Are you running a monitor at 75hz?

I can only trigger the bug when setting 74-76hz with amd-staging-drm-next, =
and
although I haven't tested in a while, I suspect the same applies with 5.3-r=
cX
(and drm-next-5.4).

Here's the output after setting 75hz, on amd-staging-drm-next:
[ 7937.682003] amdgpu: [powerplay] failed send message: TransferTableSmu2Dr=
am
(18)      param: 0x00000006 response 0xffffffc2
[ 7937.682004] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 7938.087356] amdgpu: [powerplay] failed send message: NumOfDisplays (64)=
=20=20=20=20=20
param: 0x00000001 response 0xffffffc2
[ 7940.224391] amdgpu: [powerplay] failed send message: TransferTableSmu2Dr=
am
(18)      param: 0x00000006 response 0xffffffc2
[ 7940.224392] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 7942.362952] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7944.510060] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7944.510061] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 7945.269921] amdgpu: [powerplay] failed send message: NumOfDisplays (64)=
=20=20=20=20=20
param: 0x00000001 response 0xffffffc2
[ 7946.652777] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7947.411808] amdgpu: [powerplay] failed send message: NumOfDisplays (64)=
=20=20=20=20=20
param: 0x00000001 response 0xffffffc2
[ 7948.786413] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7948.786414] amdgpu: [powerplay] Failed to export SMU metrics table!
[ 7950.918131] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7953.076247] amdgpu: [powerplay] failed send message: SetDriverDramAddrHi=
gh
(14)      param: 0x00000080 response 0xffffffc2
[ 7953.076250] amdgpu: [powerplay] Failed to export SMU metrics table!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15679093301.da0Fa5fc.30064--

--===============1392256900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1392256900==--
