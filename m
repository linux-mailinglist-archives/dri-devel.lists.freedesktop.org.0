Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE05D0CFA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 12:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A396E970;
	Wed,  9 Oct 2019 10:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D6086E96E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 10:43:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3876272162; Wed,  9 Oct 2019 10:43:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111921] GPU crash on VegaM (amdgpu: The CS has been rejected)
Date: Wed, 09 Oct 2019 10:43:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: rverschelde@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111921-502-JNvyqayfQl@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111921-502@http.bugs.freedesktop.org/>
References: <bug-111921-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1315247594=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1315247594==
Content-Type: multipart/alternative; boundary="15706177831.8D950Be.26665"
Content-Transfer-Encoding: 7bit


--15706177831.8D950Be.26665
Date: Wed, 9 Oct 2019 10:43:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111921

--- Comment #5 from R=C3=A9mi Verschelde <rverschelde@gmail.com> ---
(In reply to Andrey Grodzovsky from comment #4)
> What happens if you disable GPU reset by loading the kernel with
> amdgpu.gpu_recovery=3D0 ?

Good point, I forgot to mention that I added `amdgpu.dc=3D0
amdgpu.gpu_recovery=3D1` in an attempt to work around this issue just before
reproducing it again. So I can confirm that I could reproduce this issue bo=
th
without any amdgpu kernel parameters and with the above two.

I now did some more testing with kernel 5.3.2 and `amdgpu.gpu_recovery=3D0`
(removing the `amdgpu.dc=3D0` too). Initially I could not trigger the bug, =
but I
got it when letting the desktop environment (KDE) trigger its screensaver w=
hile
Godot was running on the AMD GPU. Once I resumed from the screensaver, the =
GPU
crashed (note: I did trigger suspend-to-RAM, the laptop was still powered).

The dmesg output is attached.

To compare, I did another test with kernel 5.1.20 (using `amdgpu.dc=3D0
amdgpu.gpu_recovery=3D1`), letting it go to sleep with Godot running on the=
 AMD
GPU, and it resumed without crashing. I also attach the dmesg output for
comparison.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15706177831.8D950Be.26665
Date: Wed, 9 Oct 2019 10:43:03 +0000
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
   title=3D"NEW - GPU crash on VegaM (amdgpu: The CS has been rejected)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU crash on VegaM (amdgpu: The CS has been rejected)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111921">bug 11192=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rverschelde&#64;gmail.com" title=3D"R=C3=A9mi Verschelde &lt;rverschelde&#6=
4;gmail.com&gt;"> <span class=3D"fn">R=C3=A9mi Verschelde</span></a>
</span></b>
        <pre>(In reply to Andrey Grodzovsky from <a href=3D"show_bug.cgi?id=
=3D111921#c4">comment #4</a>)
<span class=3D"quote">&gt; What happens if you disable GPU reset by loading=
 the kernel with
&gt; amdgpu.gpu_recovery=3D0 ?</span >

Good point, I forgot to mention that I added `amdgpu.dc=3D0
amdgpu.gpu_recovery=3D1` in an attempt to work around this issue just before
reproducing it again. So I can confirm that I could reproduce this issue bo=
th
without any amdgpu kernel parameters and with the above two.

I now did some more testing with kernel 5.3.2 and `amdgpu.gpu_recovery=3D0`
(removing the `amdgpu.dc=3D0` too). Initially I could not trigger the bug, =
but I
got it when letting the desktop environment (KDE) trigger its screensaver w=
hile
Godot was running on the AMD GPU. Once I resumed from the screensaver, the =
GPU
crashed (note: I did trigger suspend-to-RAM, the laptop was still powered).

The dmesg output is attached.

To compare, I did another test with kernel 5.1.20 (using `amdgpu.dc=3D0
amdgpu.gpu_recovery=3D1`), letting it go to sleep with Godot running on the=
 AMD
GPU, and it resumed without crashing. I also attach the dmesg output for
comparison.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15706177831.8D950Be.26665--

--===============1315247594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1315247594==--
