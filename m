Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2BA41ED7
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 10:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 230208940F;
	Wed, 12 Jun 2019 08:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7257E8940F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:16:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6EF8072167; Wed, 12 Jun 2019 08:16:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110888] 5.0.21 kernel crash when many GPU app run concurrently 
 , error msg: amdgpu_vm_validate_pt_bos() failed. ,
 Not enough memory for command submission!
Date: Wed, 12 Jun 2019 08:16:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110888-502-vvB4aJvLZJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110888-502@http.bugs.freedesktop.org/>
References: <bug-110888-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1241875038=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1241875038==
Content-Type: multipart/alternative; boundary="15603274161.2DA2d0.23362"
Content-Transfer-Encoding: 7bit


--15603274161.2DA2d0.23362
Date: Wed, 12 Jun 2019 08:16:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110888

--- Comment #2 from Christian K=C3=B6nig <christian.koenig@amd.com> ---
Looks like a NULL pointer check is missing somewhere in amdgpu_vm_init() to=
 me.

But in general you are running out of system memory, not video memory. So
whatever you try to do here won't work in general unless you either add more
system memory or add a swap file.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603274161.2DA2d0.23362
Date: Wed, 12 Jun 2019 08:16:56 +0000
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
   title=3D"NEW - 5.0.21 kernel crash when many GPU app run concurrently , =
error msg: amdgpu_vm_validate_pt_bos() failed. , Not enough memory for comm=
and submission!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110888#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 5.0.21 kernel crash when many GPU app run concurrently , =
error msg: amdgpu_vm_validate_pt_bos() failed. , Not enough memory for comm=
and submission!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110888">bug 11088=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
christian.koenig&#64;amd.com" title=3D"Christian K=C3=B6nig &lt;christian.k=
oenig&#64;amd.com&gt;"> <span class=3D"fn">Christian K=C3=B6nig</span></a>
</span></b>
        <pre>Looks like a NULL pointer check is missing somewhere in amdgpu=
_vm_init() to me.

But in general you are running out of system memory, not video memory. So
whatever you try to do here won't work in general unless you either add more
system memory or add a swap file.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603274161.2DA2d0.23362--

--===============1241875038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1241875038==--
