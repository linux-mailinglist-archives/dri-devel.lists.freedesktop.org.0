Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE76BD67E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 04:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA226EB1C;
	Wed, 25 Sep 2019 02:52:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7EA4F6EB1C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 02:52:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7484472162; Wed, 25 Sep 2019 02:52:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111792] [AMD tahiti xt] amd-staging-drm-next broken since linux
 5.3.0-rc3 rebase
Date: Wed, 25 Sep 2019 02:52:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111792-502-HGtwo476zL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111792-502@http.bugs.freedesktop.org/>
References: <bug-111792-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2019132493=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2019132493==
Content-Type: multipart/alternative; boundary="15693799650.07a76e2.24953"
Content-Transfer-Encoding: 7bit


--15693799650.07a76e2.24953
Date: Wed, 25 Sep 2019 02:52:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111792

--- Comment #4 from Alex Deucher <alexdeucher@gmail.com> ---
The commit was fixed by:

commit 0079f82e710caf3e821267917af9517ac0fca83d
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Tue Jun 11 09:45:51 2019 -0500

    drm/amdgpu: return 0 by default in amdgpu_pm_load_smu_firmware

    Fixes SI cards running on amdgpu.

    Fixes: 1929059893022 ("drm/amd/amdgpu: add RLC firmware to support rave=
n1
refresh")
    Bug: https://bugs.freedesktop.org/show_bug.cgi?id=3D110883
    Reviewed-by: Evan Quan <evan.quan@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15693799650.07a76e2.24953
Date: Wed, 25 Sep 2019 02:52:45 +0000
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
   title=3D"NEW - [AMD tahiti xt] amd-staging-drm-next broken since linux 5=
.3.0-rc3 rebase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111792#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [AMD tahiti xt] amd-staging-drm-next broken since linux 5=
.3.0-rc3 rebase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111792">bug 11179=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>The commit was fixed by:

commit 0079f82e710caf3e821267917af9517ac0fca83d
Author: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64;amd.com">a=
lexander.deucher&#64;amd.com</a>&gt;
Date:   Tue Jun 11 09:45:51 2019 -0500

    drm/amdgpu: return 0 by default in amdgpu_pm_load_smu_firmware

    Fixes SI cards running on amdgpu.

    Fixes: 1929059893022 (&quot;drm/amd/amdgpu: add RLC firmware to support=
 raven1
refresh&quot;)
    Bug: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [Regression linux 5.2-rc4][bisected] hang on b=
oot"
   href=3D"show_bug.cgi?id=3D110883">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110883</a>
    Reviewed-by: Evan Quan &lt;<a href=3D"mailto:evan.quan&#64;amd.com">eva=
n.quan&#64;amd.com</a>&gt;
    Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15693799650.07a76e2.24953--

--===============2019132493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2019132493==--
