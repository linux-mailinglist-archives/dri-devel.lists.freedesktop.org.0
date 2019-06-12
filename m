Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCC74214F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 11:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE266894A7;
	Wed, 12 Jun 2019 09:47:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AED1A89491
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 09:47:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AB2DB72167; Wed, 12 Jun 2019 09:47:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Wed, 12 Jun 2019 09:47:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ondrej@lang.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109206-502-4Jnyp9gyzf@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0078915064=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0078915064==
Content-Type: multipart/alternative; boundary="15603328443.B8460Cf1.31724"
Content-Transfer-Encoding: 7bit


--15603328443.B8460Cf1.31724
Date: Wed, 12 Jun 2019 09:47:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #50 from Ondrej Lang <ondrej@lang.sk> ---
I tested this yesterday with kernel 5.1.8 and if the file raven_dmcu.bin is
present in the /lib/firmware/amdgpu/ folder when you are updating the kernel
(or manually rebuilding the initramfs), the computer will boot with a blank
screen next time.

There are 2 pieces to this. The linux-firmware package provides the binary
files (i.e. the raven_dmcu.bin) so every time this package gets updated, you
should rename/move the file and rebuild the initramfs. The linux-firmware
updates are not as frequent as the kernel updates so if you do the workarou=
nd,
you might go through several kernel updates without issues, but once
linux-firmware updates, you have to repeat the workaround...

All the patch in the kernel will do is to ignore the raven_dmcu.bin file
automatically (for raven 1 cpus) when building the initramfs so you don't h=
ave
to rename/move it every time linux-firmware updates.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603328443.B8460Cf1.31724
Date: Wed, 12 Jun 2019 09:47:24 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c50">Comme=
nt # 50</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ondrej&#64;lang.sk" title=3D"Ondrej Lang &lt;ondrej&#64;lang.sk&gt;"> <span=
 class=3D"fn">Ondrej Lang</span></a>
</span></b>
        <pre>I tested this yesterday with kernel 5.1.8 and if the file rave=
n_dmcu.bin is
present in the /lib/firmware/amdgpu/ folder when you are updating the kernel
(or manually rebuilding the initramfs), the computer will boot with a blank
screen next time.

There are 2 pieces to this. The linux-firmware package provides the binary
files (i.e. the raven_dmcu.bin) so every time this package gets updated, you
should rename/move the file and rebuild the initramfs. The linux-firmware
updates are not as frequent as the kernel updates so if you do the workarou=
nd,
you might go through several kernel updates without issues, but once
linux-firmware updates, you have to repeat the workaround...

All the patch in the kernel will do is to ignore the raven_dmcu.bin file
automatically (for raven 1 cpus) when building the initramfs so you don't h=
ave
to rename/move it every time linux-firmware updates.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603328443.B8460Cf1.31724--

--===============0078915064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0078915064==--
