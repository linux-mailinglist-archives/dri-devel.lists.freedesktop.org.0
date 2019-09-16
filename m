Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAEAB3FCB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 19:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B074F6EA1A;
	Mon, 16 Sep 2019 17:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90CBD6EA1A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 17:56:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 895AD72167; Mon, 16 Sep 2019 17:56:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111682] use-after-free in amdgpu_vm_update_directories
Date: Mon, 16 Sep 2019 17:56:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: andrey.grodzovsky@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111682-502-bclM9FikHy@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111682-502@http.bugs.freedesktop.org/>
References: <bug-111682-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2031041126=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2031041126==
Content-Type: multipart/alternative; boundary="15686565660.a3a37a1d9.28349"
Content-Transfer-Encoding: 7bit


--15686565660.a3a37a1d9.28349
Date: Mon, 16 Sep 2019 17:56:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111682

--- Comment #1 from Andrey Grodzovsky <andrey.grodzovsky@amd.com> ---
Which kernel branch are you using ? I couldn't find=20
amdgpu_vm_update_directories in latest code in amd-staging-drm-next and tur=
ns
out it was renamed to amdgpu_vm_update_pdes in
78b20c2ee6788ba0df8b36b1369bc7e264262d3b back in March so seems like this is
very outdated code.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15686565660.a3a37a1d9.28349
Date: Mon, 16 Sep 2019 17:56:06 +0000
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
   title=3D"NEW - use-after-free in amdgpu_vm_update_directories"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111682#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - use-after-free in amdgpu_vm_update_directories"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111682">bug 11168=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrey.grodzovsky&#64;amd.com" title=3D"Andrey Grodzovsky &lt;andrey.grodzo=
vsky&#64;amd.com&gt;"> <span class=3D"fn">Andrey Grodzovsky</span></a>
</span></b>
        <pre>Which kernel branch are you using ? I couldn't find=20
amdgpu_vm_update_directories in latest code in amd-staging-drm-next and tur=
ns
out it was renamed to amdgpu_vm_update_pdes in
78b20c2ee6788ba0df8b36b1369bc7e264262d3b back in March so seems like this is
very outdated code.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15686565660.a3a37a1d9.28349--

--===============2031041126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2031041126==--
