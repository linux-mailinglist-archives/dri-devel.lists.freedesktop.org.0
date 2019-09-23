Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B066FBACBF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 04:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692486E0E5;
	Mon, 23 Sep 2019 02:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id ECB386E0E0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 02:46:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E9A8572162; Mon, 23 Sep 2019 02:46:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Mon, 23 Sep 2019 02:46:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: jeremy.attali@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-CYVfTL1AWt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111763-502@http.bugs.freedesktop.org/>
References: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1452980508=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1452980508==
Content-Type: multipart/alternative; boundary="15692067811.6C0c2bD.19370"
Content-Transfer-Encoding: 7bit


--15692067811.6C0c2bD.19370
Date: Mon, 23 Sep 2019 02:46:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #1 from Jeremy Attali <jeremy.attali@gmail.com> ---
Not sure if that might help someone else, but I found a workaround in my ca=
se
with DOOM. I was having the same crashes as Marko described with Starcraft =
II,
I tried the following:

- In Steam, I disabled the In Game Steam Overlay
- I switched the Graphics API from OpenGL to Vulkan

I did not have any crash so far. But I haven't tried to isolate one or the
other.

Packages:
linux 5.3.arch1-1
linux-firmware-agd5f-radeon-navi10 2019.09.13.18.36-1
mesa-git 1:19.3.0_devel.115574.40087ffc5b9-1
vulkan-radeon-git 1:19.3.0_devel.115574.40087ffc5b9-1
libdrm 2.4.99-1
lib32-mesa-git 1:19.3.0_devel.115574.40087ffc5b9-1
lib32-vulkan-radeon-git 1:19.3.0_devel.115574.40087ffc5b9-1
lib32-libdrm 2.4.99-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15692067811.6C0c2bD.19370
Date: Mon, 23 Sep 2019 02:46:21 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jeremy.attali&#64;gmail.com" title=3D"Jeremy Attali &lt;jeremy.attali&#64;g=
mail.com&gt;"> <span class=3D"fn">Jeremy Attali</span></a>
</span></b>
        <pre>Not sure if that might help someone else, but I found a workar=
ound in my case
with DOOM. I was having the same crashes as Marko described with Starcraft =
II,
I tried the following:

- In Steam, I disabled the In Game Steam Overlay
- I switched the Graphics API from OpenGL to Vulkan

I did not have any crash so far. But I haven't tried to isolate one or the
other.

Packages:
linux 5.3.arch1-1
linux-firmware-agd5f-radeon-navi10 2019.09.13.18.36-1
mesa-git 1:19.3.0_devel.115574.40087ffc5b9-1
vulkan-radeon-git 1:19.3.0_devel.115574.40087ffc5b9-1
libdrm 2.4.99-1
lib32-mesa-git 1:19.3.0_devel.115574.40087ffc5b9-1
lib32-vulkan-radeon-git 1:19.3.0_devel.115574.40087ffc5b9-1
lib32-libdrm 2.4.99-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15692067811.6C0c2bD.19370--

--===============1452980508==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1452980508==--
