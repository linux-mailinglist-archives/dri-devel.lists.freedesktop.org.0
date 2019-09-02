Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045F1A4FBB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C83189BF3;
	Mon,  2 Sep 2019 07:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D238F89BFB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 07:24:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CE3C772161; Mon,  2 Sep 2019 07:24:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Mon, 02 Sep 2019 07:24:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-I9XNulsnZh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1336107004=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1336107004==
Content-Type: multipart/alternative; boundary="15674090552.Ed43C.9994"
Content-Transfer-Encoding: 7bit


--15674090552.Ed43C.9994
Date: Mon, 2 Sep 2019 07:24:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #14 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Mathieu Belanger from comment #13)=20
> I was able to reproduce that Citra crash.
> Followed the instruction, it did crash instantly after choosing continue =
(or
> a fraction of a second after, the music lagged a lil and complete system
> crash (was able so sync/umount/reboot with the magics key)).
>=20
> Is your crash exactly at the same place? If so then it's very reproducible
> and  it might be a good idea to run a opengl trace to see what commands w=
as
> sent last to provoke the crash.
>=20
> I am not familiar with the Ubuntu stuff, is these got compiled on your
> system? if no do you know the build date of your Mesa, libdrm and
> xf86-video-amdgpu (x11 ddx).
>=20
> Also can you tell what microcode files dates you do have?
>=20
> Libdrm : 07:49:10 PM 08/27/2019
> Mesa : 05:37:07 PM 08/30/2019
> Xorg amdgpu DDX : 07:55:17 PM 08/27/2019
>=20
> The microcode files where not available on my distribution when I install=
ed
> them. I did download/install them on August 6 but they where from July 15
> ish I think, I remember that the latest microcode at that time where
> crashing with a black screen on module load and that's why I did install =
an
> older version.

Yes, always happens at the same place with Citra emulator, however what bot=
hers
me more about the bug is that sometimes it happens completely randomly on my
system without any really obvious triggers while just browsing and using my
desktop, so it's not Citra exclusive, but luckily I've found the Citra meth=
od
to provode the bug so we can do more detailed logging.

Further observations:
- Bug is the same-type as other crashes and is not Citra emulator exclusive,
happens on Rocket League on launch as well and sometimes randomly while usi=
ng
the desktop
- Same type of crash IS NOT reproducable on Windows on the same GPU
- Same type of bug IS NOT reproducable on my IntelHD laptop with same versi=
ons
of MESA/LLVM which probably means either faulty AMD kernel driver or faulty
Firmware binaries.

My versions are:
MESA: Mesa 19.3.0-devel (git-6775a52 2019-09-02 eoan-oibaf-ppa)
Kernel: Ubuntu mainline 5.3 daily build (I ALSO tried amd-drm-next-5.4, same
bug is reproducable)
Firmware binaries: 2019-08-26 from /~agd5f/radeon_ucode/navi10

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15674090552.Ed43C.9994
Date: Mon, 2 Sep 2019 07:24:15 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to Mathieu Belanger from <a href=3D"show_bug.cgi?id=
=3D111481#c13">comment #13</a>)=20
<span class=3D"quote">&gt; I was able to reproduce that Citra crash.
&gt; Followed the instruction, it did crash instantly after choosing contin=
ue (or
&gt; a fraction of a second after, the music lagged a lil and complete syst=
em
&gt; crash (was able so sync/umount/reboot with the magics key)).
&gt;=20
&gt; Is your crash exactly at the same place? If so then it's very reproduc=
ible
&gt; and  it might be a good idea to run a opengl trace to see what command=
s was
&gt; sent last to provoke the crash.
&gt;=20
&gt; I am not familiar with the Ubuntu stuff, is these got compiled on your
&gt; system? if no do you know the build date of your Mesa, libdrm and
&gt; xf86-video-amdgpu (x11 ddx).
&gt;=20
&gt; Also can you tell what microcode files dates you do have?
&gt;=20
&gt; Libdrm : 07:49:10 PM 08/27/2019
&gt; Mesa : 05:37:07 PM 08/30/2019
&gt; Xorg amdgpu DDX : 07:55:17 PM 08/27/2019
&gt;=20
&gt; The microcode files where not available on my distribution when I inst=
alled
&gt; them. I did download/install them on August 6 but they where from July=
 15
&gt; ish I think, I remember that the latest microcode at that time where
&gt; crashing with a black screen on module load and that's why I did insta=
ll an
&gt; older version.</span >

Yes, always happens at the same place with Citra emulator, however what bot=
hers
me more about the bug is that sometimes it happens completely randomly on my
system without any really obvious triggers while just browsing and using my
desktop, so it's not Citra exclusive, but luckily I've found the Citra meth=
od
to provode the bug so we can do more detailed logging.

Further observations:
- Bug is the same-type as other crashes and is not Citra emulator exclusive,
happens on Rocket League on launch as well and sometimes randomly while usi=
ng
the desktop
- Same type of crash IS NOT reproducable on Windows on the same GPU
- Same type of bug IS NOT reproducable on my IntelHD laptop with same versi=
ons
of MESA/LLVM which probably means either faulty AMD kernel driver or faulty
Firmware binaries.

My versions are:
MESA: Mesa 19.3.0-devel (git-6775a52 2019-09-02 eoan-oibaf-ppa)
Kernel: Ubuntu mainline 5.3 daily build (I ALSO tried amd-drm-next-5.4, same
bug is reproducable)
Firmware binaries: 2019-08-26 from /~agd5f/radeon_ucode/navi10</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15674090552.Ed43C.9994--

--===============1336107004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1336107004==--
