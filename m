Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BCFA4F0A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 08:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B63289BBD;
	Mon,  2 Sep 2019 06:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 82EF989B57
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 06:05:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 76EF972161; Mon,  2 Sep 2019 06:05:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Mon, 02 Sep 2019 06:05:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: b747xx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-vfInANKmXE@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0819014215=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0819014215==
Content-Type: multipart/alternative; boundary="15674043200.BC6dd.31841"
Content-Transfer-Encoding: 7bit


--15674043200.BC6dd.31841
Date: Mon, 2 Sep 2019 06:05:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #13 from Mathieu Belanger <b747xx@gmail.com> ---
(In reply to Marko Popovic from comment #10)
> (In reply to Matthias M=C3=BCller from comment #9)
> > On my side i can report that the issue does not occur if i don't use a =
tool
> > to modify the FANs - does anyone of you use something of the like or are
> > this seperate issues?
>=20
> I don't use any tools, all is stock.
>=20
> (In reply to Mathieu Belanger from comment #7)
> > Created attachment 145225 [details] [review] [review]
> > Merge last adg5f code
> >=20
> > Ok, I did look at the recent kernel patch and commit and they seam to h=
ave
> > fixed a couple bugs. I do not know it it include these but I did not cr=
ash
> > one time since I merged that into the kernel 5.3-rc6. (that code is sta=
ged
> > for 5.4 merge window).
> >=20
> > I did attach the patch so you can merge that if you wish to try. It add=
 all
> > the latest bits for AMDGPU into 5.3-rc6, including Renoir support.
>=20
> After applying the patch, same type of error occurs, luckily very easy to
> reproduce with Citra emulator, apparently it does something that AMD's
> driver really doesn't like and makes chances higher for error to occur. A=
lso
> when CPU is under heavy I/O load error seems more likely to occur as well=
 on
> my end.
>=20
> Last log after applying the latest patch from the merge posted in the
> attachment:
> sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgp=
u]]
> *ERROR* Waiting for fences timed out!
> sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R*
> ring gfx_0.0.0 timeout, signaled seq=3D16312, emitted seq=3D16314
> sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERRO=
R*
> Process information: process citra-qt pid 2928 thread citra-qt:cs0 pid 29=
38
> sep 01 02:29:10 Marko-PC kernel: [drm] GPU recovery disabled.
>=20
> If we could get any official AMD responses to at least make sure that we'=
re
> at least being listened to would be very nice.

I was able to reproduce that Citra crash.
Followed the instruction, it did crash instantly after choosing continue (o=
r a
fraction of a second after, the music lagged a lil and complete system crash
(was able so sync/umount/reboot with the magics key)).

Is your crash exactly at the same place? If so then it's very reproducible =
and=20
it might be a good idea to run a opengl trace to see what commands was sent
last to provoke the crash.

I am not familiar with the Ubuntu stuff, is these got compiled on your syst=
em?
if no do you know the build date of your Mesa, libdrm and xf86-video-amdgpu
(x11 ddx).

Also can you tell what microcode files dates you do have?

Libdrm : 07:49:10 PM 08/27/2019
Mesa : 05:37:07 PM 08/30/2019
Xorg amdgpu DDX : 07:55:17 PM 08/27/2019

The microcode files where not available on my distribution when I installed
them. I did download/install them on August 6 but they where from July 15 i=
sh I
think, I remember that the latest microcode at that time where crashing wit=
h a
black screen on module load and that's why I did install an older version.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15674043200.BC6dd.31841
Date: Mon, 2 Sep 2019 06:05:20 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
b747xx&#64;gmail.com" title=3D"Mathieu Belanger &lt;b747xx&#64;gmail.com&gt=
;"> <span class=3D"fn">Mathieu Belanger</span></a>
</span></b>
        <pre>(In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=3D1=
11481#c10">comment #10</a>)
<span class=3D"quote">&gt; (In reply to Matthias M=C3=BCller from <a href=
=3D"show_bug.cgi?id=3D111481#c9">comment #9</a>)
&gt; &gt; On my side i can report that the issue does not occur if i don't =
use a tool
&gt; &gt; to modify the FANs - does anyone of you use something of the like=
 or are
&gt; &gt; this seperate issues?
&gt;=20
&gt; I don't use any tools, all is stock.
&gt;=20
&gt; (In reply to Mathieu Belanger from <a href=3D"show_bug.cgi?id=3D111481=
#c7">comment #7</a>)
&gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D145225" n=
ame=3D"attach_145225" title=3D"Merge last adg5f code">attachment 145225</a>=
 <a href=3D"attachment.cgi?id=3D145225&amp;action=3Dedit" title=3D"Merge la=
st adg5f code">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&=
amp;bug=3D111481&amp;attachment=3D145225'>[review]</a> [review] [review]
&gt; &gt; Merge last adg5f code
&gt; &gt;=20
&gt; &gt; Ok, I did look at the recent kernel patch and commit and they sea=
m to have
&gt; &gt; fixed a couple bugs. I do not know it it include these but I did =
not crash
&gt; &gt; one time since I merged that into the kernel 5.3-rc6. (that code =
is staged
&gt; &gt; for 5.4 merge window).
&gt; &gt;=20
&gt; &gt; I did attach the patch so you can merge that if you wish to try. =
It add all
&gt; &gt; the latest bits for AMDGPU into 5.3-rc6, including Renoir support.
&gt;=20
&gt; After applying the patch, same type of error occurs, luckily very easy=
 to
&gt; reproduce with Citra emulator, apparently it does something that AMD's
&gt; driver really doesn't like and makes chances higher for error to occur=
. Also
&gt; when CPU is under heavy I/O load error seems more likely to occur as w=
ell on
&gt; my end.
&gt;=20
&gt; Last log after applying the latest patch from the merge posted in the
&gt; attachment:
&gt; sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_dm_atomic_commit_tail [am=
dgpu]]
&gt; *ERROR* Waiting for fences timed out!
&gt; sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *E=
RROR*
&gt; ring gfx_0.0.0 timeout, signaled seq=3D16312, emitted seq=3D16314
&gt; sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *E=
RROR*
&gt; Process information: process citra-qt pid 2928 thread citra-qt:cs0 pid=
 2938
&gt; sep 01 02:29:10 Marko-PC kernel: [drm] GPU recovery disabled.
&gt;=20
&gt; If we could get any official AMD responses to at least make sure that =
we're
&gt; at least being listened to would be very nice.</span >

I was able to reproduce that Citra crash.
Followed the instruction, it did crash instantly after choosing continue (o=
r a
fraction of a second after, the music lagged a lil and complete system crash
(was able so sync/umount/reboot with the magics key)).

Is your crash exactly at the same place? If so then it's very reproducible =
and=20
it might be a good idea to run a opengl trace to see what commands was sent
last to provoke the crash.

I am not familiar with the Ubuntu stuff, is these got compiled on your syst=
em?
if no do you know the build date of your Mesa, libdrm and xf86-video-amdgpu
(x11 ddx).

Also can you tell what microcode files dates you do have?

Libdrm : 07:49:10 PM 08/27/2019
Mesa : 05:37:07 PM 08/30/2019
Xorg amdgpu DDX : 07:55:17 PM 08/27/2019

The microcode files where not available on my distribution when I installed
them. I did download/install them on August 6 but they where from July 15 i=
sh I
think, I remember that the latest microcode at that time where crashing wit=
h a
black screen on module load and that's why I did install an older version.<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15674043200.BC6dd.31841--

--===============0819014215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0819014215==--
