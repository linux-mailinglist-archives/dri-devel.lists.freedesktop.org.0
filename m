Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633ED8D316
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 14:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080A889E08;
	Wed, 14 Aug 2019 12:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF62189E63
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 12:29:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DB9877215A; Wed, 14 Aug 2019 12:29:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111244] amdgpu kernel 5.2 blank display after resume from suspend
Date: Wed, 14 Aug 2019 12:29:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miba_c@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111244-502-4Y1HRbQ0Rg@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111244-502@http.bugs.freedesktop.org/>
References: <bug-111244-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1986891012=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1986891012==
Content-Type: multipart/alternative; boundary="15657857847.ce7485EAE.29767"
Content-Transfer-Encoding: 7bit


--15657857847.ce7485EAE.29767
Date: Wed, 14 Aug 2019 12:29:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111244

--- Comment #24 from miba_c@gmx.at ---
Having the same issue on a ThinkPad T495s (BIOS 1.06) with a Ryzen 7 PRO 37=
00U,
Kernel 5.2.8-arch1-1-ARCH, Mesa 19.1.4-1 and running sway (wayland) as a wi=
ndow
manager.

dmesg shows me:
[drm] Fence fallback timer expired on ring sdma0
amdgpu 0000:05:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR* IB test fa=
iled
on gfx (-110).
[drm:amdgpu_device_ip_late_init_func_handler [amdgpu]] *ERROR* ib ring test
failed (-110).

One thing to note is that setting amd_iommu=3Doff as a kernel parameter mak=
es
this issue really rare but it'll still sometimes happen, maybe it's also ju=
st
luck.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657857847.ce7485EAE.29767
Date: Wed, 14 Aug 2019 12:29:44 +0000
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
   title=3D"NEW - amdgpu kernel 5.2 blank display after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu kernel 5.2 blank display after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244">bug 11124=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
miba_c&#64;gmx.at" title=3D"miba_c&#64;gmx.at">miba_c&#64;gmx.at</a>
</span></b>
        <pre>Having the same issue on a ThinkPad T495s (BIOS 1.06) with a R=
yzen 7 PRO 3700U,
Kernel 5.2.8-arch1-1-ARCH, Mesa 19.1.4-1 and running sway (wayland) as a wi=
ndow
manager.

dmesg shows me:
[drm] Fence fallback timer expired on ring sdma0
amdgpu 0000:05:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR* IB test fa=
iled
on gfx (-110).
[drm:amdgpu_device_ip_late_init_func_handler [amdgpu]] *ERROR* ib ring test
failed (-110).

One thing to note is that setting amd_iommu=3Doff as a kernel parameter mak=
es
this issue really rare but it'll still sometimes happen, maybe it's also ju=
st
luck.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657857847.ce7485EAE.29767--

--===============1986891012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1986891012==--
