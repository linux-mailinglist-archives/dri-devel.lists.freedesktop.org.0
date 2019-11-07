Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2FDF31BD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 15:46:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4EB6F6BC;
	Thu,  7 Nov 2019 14:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B1AA6F6C0
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 14:46:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 051CE720E2; Thu,  7 Nov 2019 14:46:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112226] [HadesCanyon/regression] GPU hang causes also X server
 to die
Date: Thu, 07 Nov 2019 14:46:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: eero.t.tamminen@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-112226-502-w4VYfEtlXi@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112226-502@http.bugs.freedesktop.org/>
References: <bug-112226-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1739585126=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1739585126==
Content-Type: multipart/alternative; boundary="15731380142.65cD.11223"
Content-Transfer-Encoding: 7bit


--15731380142.65cD.11223
Date: Thu, 7 Nov 2019 14:46:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112226

--- Comment #4 from Eero Tamminen <eero.t.tamminen@intel.com> ---
Created attachment 145909
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145909&action=3Dedit
Xorg log

X dies to ConfigureWindow() -> miResizeWindow() -> miCopyRegion() ->
glamor_create_pixmap() -> radeonsi_dri.so -> abort().

Lightdm log show abort to be:
X: src/gallium/winsys/amdgpu/drm/amdgpu_cs.c:1061: amdgpu_cs_check_space:
Assertion `rcs->current.cdw <=3D rcs->current.max_dw' failed.

This is the same abort that causes X server to fail at boot with git Mesa a=
nd a
bit older X server & drm-tip kernel.

Is above abort due to something on the kernel side, or Mesa issue?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15731380142.65cD.11223
Date: Thu, 7 Nov 2019 14:46:54 +0000
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
   title=3D"NEW - [HadesCanyon/regression] GPU hang causes also X server to=
 die"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112226#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [HadesCanyon/regression] GPU hang causes also X server to=
 die"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112226">bug 11222=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eero.t.tamminen&#64;intel.com" title=3D"Eero Tamminen &lt;eero.t.tamminen&#=
64;intel.com&gt;"> <span class=3D"fn">Eero Tamminen</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145909=
" name=3D"attach_145909" title=3D"Xorg log">attachment 145909</a> <a href=
=3D"attachment.cgi?id=3D145909&amp;action=3Dedit" title=3D"Xorg log">[detai=
ls]</a></span>
Xorg log

X dies to ConfigureWindow() -&gt; miResizeWindow() -&gt; miCopyRegion() -&g=
t;
glamor_create_pixmap() -&gt; radeonsi_dri.so -&gt; abort().

Lightdm log show abort to be:
X: src/gallium/winsys/amdgpu/drm/amdgpu_cs.c:1061: amdgpu_cs_check_space:
Assertion `rcs-&gt;current.cdw &lt;=3D rcs-&gt;current.max_dw' failed.

This is the same abort that causes X server to fail at boot with git Mesa a=
nd a
bit older X server &amp; drm-tip kernel.

Is above abort due to something on the kernel side, or Mesa issue?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15731380142.65cD.11223--

--===============1739585126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1739585126==--
