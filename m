Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFA2A46A4
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 02:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625626E156;
	Sun,  1 Sep 2019 00:36:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC5936E162
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 00:36:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A04B3721AA; Sun,  1 Sep 2019 00:36:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Sun, 01 Sep 2019 00:36:02 +0000
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
Message-ID: <bug-111481-502-dgFK0ZpsEk@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0052882344=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0052882344==
Content-Type: multipart/alternative; boundary="15672981630.6bF4aB.21039"
Content-Transfer-Encoding: 7bit


--15672981630.6bF4aB.21039
Date: Sun, 1 Sep 2019 00:36:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #10 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Matthias M=C3=BCller from comment #9)
> On my side i can report that the issue does not occur if i don't use a to=
ol
> to modify the FANs - does anyone of you use something of the like or are
> this seperate issues?

I don't use any tools, all is stock.

(In reply to Mathieu Belanger from comment #7)
> Created attachment 145225 [details] [review]
> Merge last adg5f code
>=20
> Ok, I did look at the recent kernel patch and commit and they seam to have
> fixed a couple bugs. I do not know it it include these but I did not crash
> one time since I merged that into the kernel 5.3-rc6. (that code is staged
> for 5.4 merge window).
>=20
> I did attach the patch so you can merge that if you wish to try. It add a=
ll
> the latest bits for AMDGPU into 5.3-rc6, including Renoir support.

After applying the patch, same type of error occurs, luckily very easy to
reproduce with Citra emulator, apparently it does something that AMD's driv=
er
really doesn't like and makes chances higher for error to occur. Also when =
CPU
is under heavy I/O load error seems more likely to occur as well on my end.

Last log after applying the latest patch from the merge posted in the
attachment:
sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring gfx_0.0.0 timeout, signaled seq=3D16312, emitted seq=3D16314
sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process citra-qt pid 2928 thread citra-qt:cs0 pid 2938
sep 01 02:29:10 Marko-PC kernel: [drm] GPU recovery disabled.

If we could get any official AMD responses to at least make sure that we're=
 at
least being listened to would be very nice.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15672981630.6bF4aB.21039
Date: Sun, 1 Sep 2019 00:36:03 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c10">Comme=
nt # 10</a>
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
        <pre>(In reply to Matthias M=C3=BCller from <a href=3D"show_bug.cgi=
?id=3D111481#c9">comment #9</a>)
<span class=3D"quote">&gt; On my side i can report that the issue does not =
occur if i don't use a tool
&gt; to modify the FANs - does anyone of you use something of the like or a=
re
&gt; this seperate issues?</span >

I don't use any tools, all is stock.

(In reply to Mathieu Belanger from <a href=3D"show_bug.cgi?id=3D111481#c7">=
comment #7</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145225" name=3D"attach_145225" title=3D"Merge last adg5f code">atta=
chment 145225</a> <a href=3D"attachment.cgi?id=3D145225&amp;action=3Dedit" =
title=3D"Merge last adg5f code">[details]</a></span> <a href=3D'page.cgi?id=
=3Dsplinter.html&amp;bug=3D111481&amp;attachment=3D145225'>[review]</a> [re=
view]
&gt; Merge last adg5f code
&gt;=20
&gt; Ok, I did look at the recent kernel patch and commit and they seam to =
have
&gt; fixed a couple bugs. I do not know it it include these but I did not c=
rash
&gt; one time since I merged that into the kernel 5.3-rc6. (that code is st=
aged
&gt; for 5.4 merge window).
&gt;=20
&gt; I did attach the patch so you can merge that if you wish to try. It ad=
d all
&gt; the latest bits for AMDGPU into 5.3-rc6, including Renoir support.</sp=
an >

After applying the patch, same type of error occurs, luckily very easy to
reproduce with Citra emulator, apparently it does something that AMD's driv=
er
really doesn't like and makes chances higher for error to occur. Also when =
CPU
is under heavy I/O load error seems more likely to occur as well on my end.

Last log after applying the latest patch from the merge posted in the
attachment:
sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
*ERROR* Waiting for fences timed out!
sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
ring gfx_0.0.0 timeout, signaled seq=3D16312, emitted seq=3D16314
sep 01 02:29:10 Marko-PC kernel: [drm:amdgpu_job_timedout [amdgpu]] *ERROR*
Process information: process citra-qt pid 2928 thread citra-qt:cs0 pid 2938
sep 01 02:29:10 Marko-PC kernel: [drm] GPU recovery disabled.

If we could get any official AMD responses to at least make sure that we're=
 at
least being listened to would be very nice.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15672981630.6bF4aB.21039--

--===============0052882344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0052882344==--
