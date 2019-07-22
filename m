Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EC270AE8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73E589F08;
	Mon, 22 Jul 2019 20:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0927189F2A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:56:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0582372167; Mon, 22 Jul 2019 20:56:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105251] [Vega10]  GPU lockup on boot: VMC page fault
Date: Mon, 22 Jul 2019 20:56:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: ds2.bugs.freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105251-502-CzdYt2Kpc7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105251-502@http.bugs.freedesktop.org/>
References: <bug-105251-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0962569624=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0962569624==
Content-Type: multipart/alternative; boundary="15638290065.5236356.1098"
Content-Transfer-Encoding: 7bit


--15638290065.5236356.1098
Date: Mon, 22 Jul 2019 20:56:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105251

--- Comment #75 from deltasquared <ds2.bugs.freedesktop@gmail.com> ---
After compiling mesa-git on commit 0661c357c60 from the AUR pkgbuild, I can=
 now
confirm my system seems to have become impervious to the above "vega_crashe=
r"
program.

Output from said program after resizing and moving vega_crasher's window a =
bit,
in case it was important:

L CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagnos=
tic
(remark): <unknown>:0:0: 9 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 24 Code Size: 52 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagno=
stic
(remark): <unknown>:0:0: 12 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 8 Code Size: 92 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 24 Code Size: 44 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 8 Code Size: 80 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagno=
stic
(remark): <unknown>:0:0: 2 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagno=
stic
(remark): <unknown>:0:0: 3 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagno=
stic
(remark): <unknown>:0:0: 4 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 24 Code Size: 44 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 8 Code Size: 136 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagno=
stic
(remark): <unknown>:0:0: 16 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
24 VGPRS: 24 Code Size: 92 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
24 VGPRS: 24 Code Size: 88 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0

Minetest will take longer to test as the pkgbuild doesn't enable asserts, a=
nd
also because of adformentioned $dayjob. I guess in that case I'd only know =
if I
saw garbled output; it was never very consistent when it occured but would
always be during the loading bar screen (but when it did happen some very
colourful blocky corruption would result).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15638290065.5236356.1098
Date: Mon, 22 Jul 2019 20:56:46 +0000
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
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251#c75">Comme=
nt # 75</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251">bug 10525=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ds2.bugs.freedesktop&#64;gmail.com" title=3D"deltasquared &lt;ds2.bugs.free=
desktop&#64;gmail.com&gt;"> <span class=3D"fn">deltasquared</span></a>
</span></b>
        <pre>After compiling mesa-git on commit 0661c357c60 from the AUR pk=
gbuild, I can now
confirm my system seems to have become impervious to the above &quot;vega_c=
rasher&quot;
program.

Output from said program after resizing and moving vega_crasher's window a =
bit,
in case it was important:

L CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagnos=
tic
(remark): &lt;unknown&gt;:0:0: 9 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 24 Code Size: 52 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagno=
stic
(remark): &lt;unknown&gt;:0:0: 12 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 8 Code Size: 92 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 24 Code Size: 44 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 8 Code Size: 80 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagno=
stic
(remark): &lt;unknown&gt;:0:0: 2 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagno=
stic
(remark): &lt;unknown&gt;:0:0: 3 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagno=
stic
(remark): &lt;unknown&gt;:0:0: 4 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 24 Code Size: 44 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
16 VGPRS: 8 Code Size: 136 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D LLVM diagno=
stic
(remark): &lt;unknown&gt;:0:0: 16 instructions in function
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
24 VGPRS: 24 Code Size: 92 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0
GL CALLBACK:  type =3D 0x8251, severity =3D 0x826b, message =3D Shader Stat=
s: SGPRS:
24 VGPRS: 24 Code Size: 88 LDS: 0 Scratch: 0 Max Waves: 10 Spilled SGPRs: 0
Spilled VGPRs: 0 PrivMem VGPRs: 0

Minetest will take longer to test as the pkgbuild doesn't enable asserts, a=
nd
also because of adformentioned $dayjob. I guess in that case I'd only know =
if I
saw garbled output; it was never very consistent when it occured but would
always be during the loading bar screen (but when it did happen some very
colourful blocky corruption would result).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15638290065.5236356.1098--

--===============0962569624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0962569624==--
