Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB5CB4824
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 09:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1212F6EB08;
	Tue, 17 Sep 2019 07:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8318F6EB08
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 07:18:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7E54A72167; Tue, 17 Sep 2019 07:18:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111682] use-after-free in amdgpu_vm_update_directories
Date: Tue, 17 Sep 2019 07:18:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111682-502-WtSiWRyFqW@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1320662594=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1320662594==
Content-Type: multipart/alternative; boundary="15687047321.Bee6.21366"
Content-Transfer-Encoding: 7bit


--15687047321.Bee6.21366
Date: Tue, 17 Sep 2019 07:18:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111682

--- Comment #3 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@=
amd.com> ---
Created attachment 145387
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145387&action=3Dedit
dmesg when using cfdabd064b2d(drm/amdgpu: remove the redundant null checks)

Using the latest commit from amd-staging-drm-next (=3D cfdabd064b2d58f
"drm/amdgpu: remove the redundant null checks"): the use-after-free bug is
still there.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15687047321.Bee6.21366
Date: Tue, 17 Sep 2019 07:18:52 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111682#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - use-after-free in amdgpu_vm_update_directories"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111682">bug 11168=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145387=
" name=3D"attach_145387" title=3D"dmesg when using cfdabd064b2d(drm/amdgpu:=
 remove the redundant null checks)">attachment 145387</a> <a href=3D"attach=
ment.cgi?id=3D145387&amp;action=3Dedit" title=3D"dmesg when using cfdabd064=
b2d(drm/amdgpu: remove the redundant null checks)">[details]</a></span>
dmesg when using cfdabd064b2d(drm/amdgpu: remove the redundant null checks)

Using the latest commit from amd-staging-drm-next (=3D cfdabd064b2d58f
&quot;drm/amdgpu: remove the redundant null checks&quot;): the use-after-fr=
ee bug is
still there.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15687047321.Bee6.21366--

--===============1320662594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1320662594==--
