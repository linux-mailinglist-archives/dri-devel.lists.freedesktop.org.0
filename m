Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471B6B105C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 15:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440696ED77;
	Thu, 12 Sep 2019 13:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 899246ED77
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 13:50:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8677272167; Thu, 12 Sep 2019 13:50:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111669] Navi GPU hang in Minecraft
Date: Thu, 12 Sep 2019 13:50:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111669-502-COFf0h9jiq@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111669-502@http.bugs.freedesktop.org/>
References: <bug-111669-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2115895701=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2115895701==
Content-Type: multipart/alternative; boundary="15682962421.EAacAB.24994"
Content-Transfer-Encoding: 7bit


--15682962421.EAacAB.24994
Date: Thu, 12 Sep 2019 13:50:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111669

--- Comment #1 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@=
amd.com> ---
Thanks for the bug report and the trace.

I can reproduce the hang. There's always a page fault before, e.g:

amdgpu 0000:0b:00.0: [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:327=
72,
for process glretrace pid 8616 thread glretrace:cs0 pid 8617)
amdgpu 0000:0b:00.0:   in page starting at address 0x0000000000f03000 from
client 27
amdgpu 0000:0b:00.0: GCVM_L2_PROTECTION_FAULT_STATUS:0x00301031
amdgpu 0000:0b:00.0:     MORE_FAULTS: 0x1
amdgpu 0000:0b:00.0:     WALKER_ERROR: 0x0
amdgpu 0000:0b:00.0:     PERMISSION_FAULTS: 0x3
amdgpu 0000:0b:00.0:     MAPPING_ERROR: 0x0
amdgpu 0000:0b:00.0:     RW: 0x0

I couldn't find the root cause yet.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682962421.EAacAB.24994
Date: Thu, 12 Sep 2019 13:50:42 +0000
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
   title=3D"NEW - Navi GPU hang in Minecraft"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111669#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Navi GPU hang in Minecraft"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111669">bug 11166=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>Thanks for the bug report and the trace.

I can reproduce the hang. There's always a page fault before, e.g:

amdgpu 0000:0b:00.0: [gfxhub] page fault (src_id:0 ring:24 vmid:3 pasid:327=
72,
for process glretrace pid 8616 thread glretrace:cs0 pid 8617)
amdgpu 0000:0b:00.0:   in page starting at address 0x0000000000f03000 from
client 27
amdgpu 0000:0b:00.0: GCVM_L2_PROTECTION_FAULT_STATUS:0x00301031
amdgpu 0000:0b:00.0:     MORE_FAULTS: 0x1
amdgpu 0000:0b:00.0:     WALKER_ERROR: 0x0
amdgpu 0000:0b:00.0:     PERMISSION_FAULTS: 0x3
amdgpu 0000:0b:00.0:     MAPPING_ERROR: 0x0
amdgpu 0000:0b:00.0:     RW: 0x0

I couldn't find the root cause yet.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682962421.EAacAB.24994--

--===============2115895701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2115895701==--
