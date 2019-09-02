Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC3CA5555
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8E689A1F;
	Mon,  2 Sep 2019 11:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61508899E8
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:53:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5679072161; Mon,  2 Sep 2019 11:53:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Mon, 02 Sep 2019 11:53:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-kNUi0VEU2L@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0818700598=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0818700598==
Content-Type: multipart/alternative; boundary="15674252210.7F146.24609"
Content-Transfer-Encoding: 7bit


--15674252210.7F146.24609
Date: Mon, 2 Sep 2019 11:53:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #19 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer=
@amd.com> ---
(In reply to Marko Popovic from comment #17)
> (In reply to Pierre-Eric Pelloux-Prayer from comment #15)
> > (In reply to Marko Popovic from comment #14)
> > >=20
> > > Yes, always happens at the same place with Citra emulator
> >=20
> > Could you capture a trace of the problem (using Apitrace or Renderdoc)?
> >=20
> > This would be very helpful to fix it.
>=20
> I added reproduced Citra crash recorded by using command:
> apitrace trace ./citra-qt
>=20
> I hope this is correct, if you need anything else or done differently ple=
ase
> just let me know!

Thanks for the trace!

Replaying the trace a few times is enough to reliably to reproduce the hang.

Using AMD_DEBUG=3Dnongg seems to prevent it so it could be a temporary work=
around
until a proper fix is found.
Could you confirm this on your system?


>=20
> I am adding Rocket League crash output from apitrace.

This trace file is very small (only one frame) and doesn't hang here.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15674252210.7F146.24609
Date: Mon, 2 Sep 2019 11:53:41 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c19">Comme=
nt # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>(In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=3D1=
11481#c17">comment #17</a>)
<span class=3D"quote">&gt; (In reply to Pierre-Eric Pelloux-Prayer from <a =
href=3D"show_bug.cgi?id=3D111481#c15">comment #15</a>)
&gt; &gt; (In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=3D1114=
81#c14">comment #14</a>)
&gt; &gt; &gt;=20
&gt; &gt; &gt; Yes, always happens at the same place with Citra emulator
&gt; &gt;=20
&gt; &gt; Could you capture a trace of the problem (using Apitrace or Rende=
rdoc)?
&gt; &gt;=20
&gt; &gt; This would be very helpful to fix it.
&gt;=20
&gt; I added reproduced Citra crash recorded by using command:
&gt; apitrace trace ./citra-qt
&gt;=20
&gt; I hope this is correct, if you need anything else or done differently =
please
&gt; just let me know!</span >

Thanks for the trace!

Replaying the trace a few times is enough to reliably to reproduce the hang.

Using AMD_DEBUG=3Dnongg seems to prevent it so it could be a temporary work=
around
until a proper fix is found.
Could you confirm this on your system?


<span class=3D"quote">&gt;=20
&gt; I am adding Rocket League crash output from apitrace.</span >

This trace file is very small (only one frame) and doesn't hang here.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15674252210.7F146.24609--

--===============0818700598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0818700598==--
