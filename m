Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21EFEE157
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 14:35:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459236E44E;
	Mon,  4 Nov 2019 13:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 44C726E446
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 13:35:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 411FE72A23; Mon,  4 Nov 2019 04:08:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111229] Unable to unbind GPU from amdgpu
Date: Mon, 04 Nov 2019 04:08:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: abingham@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111229-502-hQy3soQ3ky@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111229-502@http.bugs.freedesktop.org/>
References: <bug-111229-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0841232820=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0841232820==
Content-Type: multipart/alternative; boundary="15728405322.4ca2C8.29021"
Content-Transfer-Encoding: 7bit


--15728405322.4ca2C8.29021
Date: Mon, 4 Nov 2019 04:08:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111229

--- Comment #12 from Andrew B <abingham@gmail.com> ---
Fedora 31, 5.3.1 kernel, 5700XT - still seeing problems with unbinding from=
 the
AMDGPU driver.=20=20

I have video=3Defifb:off in my kernel parameters to keep the efifb from ever
using the card.

After stopping X and unbinding from vtcon0 and vtcon1, attempting to unbind=
 the
driver from yields the following error, I cannot bind a new driver to the c=
ard,
and I can't shutdown cleanly.

[  140.760872] fbcon: Taking over console
[  140.773454] Console: switching to colour frame buffer device 320x90
[  577.562635] Console: switching to colour dummy device 80x25
[  679.403956] VFIO - User Level meta-driver version: 0.3
[  679.410718] [drm:amdgpu_pci_remove [amdgpu]] *ERROR* Device removal is
currently not supported outsid
e of fbcon
[  679.410938] [drm] amdgpu: finishing device.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15728405322.4ca2C8.29021
Date: Mon, 4 Nov 2019 04:08:52 +0000
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
   title=3D"NEW - Unable to unbind GPU from amdgpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111229#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to unbind GPU from amdgpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111229">bug 11122=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
abingham&#64;gmail.com" title=3D"Andrew B &lt;abingham&#64;gmail.com&gt;"> =
<span class=3D"fn">Andrew B</span></a>
</span></b>
        <pre>Fedora 31, 5.3.1 kernel, 5700XT - still seeing problems with u=
nbinding from the
AMDGPU driver.=20=20

I have video=3Defifb:off in my kernel parameters to keep the efifb from ever
using the card.

After stopping X and unbinding from vtcon0 and vtcon1, attempting to unbind=
 the
driver from yields the following error, I cannot bind a new driver to the c=
ard,
and I can't shutdown cleanly.

[  140.760872] fbcon: Taking over console
[  140.773454] Console: switching to colour frame buffer device 320x90
[  577.562635] Console: switching to colour dummy device 80x25
[  679.403956] VFIO - User Level meta-driver version: 0.3
[  679.410718] [drm:amdgpu_pci_remove [amdgpu]] *ERROR* Device removal is
currently not supported outsid
e of fbcon
[  679.410938] [drm] amdgpu: finishing device.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15728405322.4ca2C8.29021--

--===============0841232820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0841232820==--
