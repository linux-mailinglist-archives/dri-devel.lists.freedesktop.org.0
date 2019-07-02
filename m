Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E265D0E9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 15:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E9589E06;
	Tue,  2 Jul 2019 13:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 31BC989E0D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 13:41:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2D12172167; Tue,  2 Jul 2019 13:41:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Tue, 02 Jul 2019 13:41:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: evo8800@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109206-502-RUONGmfNbW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109206-502@http.bugs.freedesktop.org/>
References: <bug-109206-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0339042511=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0339042511==
Content-Type: multipart/alternative; boundary="15620749122.8c1ff7e.29016"
Content-Transfer-Encoding: 7bit


--15620749122.8c1ff7e.29016
Date: Tue, 2 Jul 2019 13:41:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #52 from Talha Khan <evo8800@gmail.com> ---
(In reply to Ondrej Lang from comment #50)
> I tested this yesterday with kernel 5.1.8 and if the file raven_dmcu.bin =
is
> present in the /lib/firmware/amdgpu/ folder when you are updating the ker=
nel
> (or manually rebuilding the initramfs), the computer will boot with a bla=
nk
> screen next time.
>=20
> There are 2 pieces to this. The linux-firmware package provides the binary
> files (i.e. the raven_dmcu.bin) so every time this package gets updated, =
you
> should rename/move the file and rebuild the initramfs. The linux-firmware
> updates are not as frequent as the kernel updates so if you do the
> workaround, you might go through several kernel updates without issues, b=
ut
> once linux-firmware updates, you have to repeat the workaround...
>=20
> All the patch in the kernel will do is to ignore the raven_dmcu.bin file
> automatically (for raven 1 cpus) when building the initramfs so you don't
> have to rename/move it every time linux-firmware updates.

You're right, I had updated to 5.1.15 and it seemed the firmware files were
updated as well. I then had to perform the workaround in order to boot into=
 the
system.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15620749122.8c1ff7e.29016
Date: Tue, 2 Jul 2019 13:41:52 +0000
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
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c52">Comme=
nt # 52</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
evo8800&#64;gmail.com" title=3D"Talha Khan &lt;evo8800&#64;gmail.com&gt;"> =
<span class=3D"fn">Talha Khan</span></a>
</span></b>
        <pre>(In reply to Ondrej Lang from <a href=3D"show_bug.cgi?id=3D109=
206#c50">comment #50</a>)
<span class=3D"quote">&gt; I tested this yesterday with kernel 5.1.8 and if=
 the file raven_dmcu.bin is
&gt; present in the /lib/firmware/amdgpu/ folder when you are updating the =
kernel
&gt; (or manually rebuilding the initramfs), the computer will boot with a =
blank
&gt; screen next time.
&gt;=20
&gt; There are 2 pieces to this. The linux-firmware package provides the bi=
nary
&gt; files (i.e. the raven_dmcu.bin) so every time this package gets update=
d, you
&gt; should rename/move the file and rebuild the initramfs. The linux-firmw=
are
&gt; updates are not as frequent as the kernel updates so if you do the
&gt; workaround, you might go through several kernel updates without issues=
, but
&gt; once linux-firmware updates, you have to repeat the workaround...
&gt;=20
&gt; All the patch in the kernel will do is to ignore the raven_dmcu.bin fi=
le
&gt; automatically (for raven 1 cpus) when building the initramfs so you do=
n't
&gt; have to rename/move it every time linux-firmware updates.</span >

You're right, I had updated to 5.1.15 and it seemed the firmware files were
updated as well. I then had to perform the workaround in order to boot into=
 the
system.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15620749122.8c1ff7e.29016--

--===============0339042511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0339042511==--
