Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D27A5B81
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 18:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 677D9899DE;
	Mon,  2 Sep 2019 16:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 595F1899D5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 16:45:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4F1D972161; Mon,  2 Sep 2019 16:45:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Mon, 02 Sep 2019 16:45:09 +0000
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
Message-ID: <bug-111481-502-wDn6dwkV6i@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0229752225=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0229752225==
Content-Type: multipart/alternative; boundary="15674427090.0F6cEa69.13010"
Content-Transfer-Encoding: 7bit


--15674427090.0F6cEa69.13010
Date: Mon, 2 Sep 2019 16:45:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #21 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #19)
> (In reply to Marko Popovic from comment #17)
> > (In reply to Pierre-Eric Pelloux-Prayer from comment #15)
> > > (In reply to Marko Popovic from comment #14)
> > > >=20
> > > > Yes, always happens at the same place with Citra emulator
> > >=20
> > > Could you capture a trace of the problem (using Apitrace or Renderdoc=
)?
> > >=20
> > > This would be very helpful to fix it.
> >=20
> > I added reproduced Citra crash recorded by using command:
> > apitrace trace ./citra-qt
> >=20
> > I hope this is correct, if you need anything else or done differently p=
lease
> > just let me know!
>=20
> Thanks for the trace!
>=20
> Replaying the trace a few times is enough to reliably to reproduce the ha=
ng.
>=20
> Using AMD_DEBUG=3Dnongg seems to prevent it so it could be a temporary
> workaround until a proper fix is found.
> Could you confirm this on your system?
>=20
>=20
> >=20
> > I am adding Rocket League crash output from apitrace.
>=20
> This trace file is very small (only one frame) and doesn't hang here.

Okay I just got another random hang on the desktop. even with the environme=
nt
variable turned on the whole time. Unfortunately it seems to be very hardly
tracable seems to be very random :( Seems that Citra hang is unrelated to t=
his
bug after all, it's a completely different bug. It's good that we discovered
another (citra-related) bug on the way but probably we can't mark that
workaround to solve anything because hangs still randomly occur on the desk=
top.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15674427090.0F6cEa69.13010
Date: Mon, 2 Sep 2019 16:45:09 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c21">Comme=
nt # 21</a>
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
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D111481#c19">comment #19</a>)
<span class=3D"quote">&gt; (In reply to Marko Popovic from <a href=3D"show_=
bug.cgi?id=3D111481#c17">comment #17</a>)
&gt; &gt; (In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_bug.=
cgi?id=3D111481#c15">comment #15</a>)
&gt; &gt; &gt; (In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=
=3D111481#c14">comment #14</a>)
&gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; Yes, always happens at the same place with Citra emulat=
or
&gt; &gt; &gt;=20
&gt; &gt; &gt; Could you capture a trace of the problem (using Apitrace or =
Renderdoc)?
&gt; &gt; &gt;=20
&gt; &gt; &gt; This would be very helpful to fix it.
&gt; &gt;=20
&gt; &gt; I added reproduced Citra crash recorded by using command:
&gt; &gt; apitrace trace ./citra-qt
&gt; &gt;=20
&gt; &gt; I hope this is correct, if you need anything else or done differe=
ntly please
&gt; &gt; just let me know!
&gt;=20
&gt; Thanks for the trace!
&gt;=20
&gt; Replaying the trace a few times is enough to reliably to reproduce the=
 hang.
&gt;=20
&gt; Using AMD_DEBUG=3Dnongg seems to prevent it so it could be a temporary
&gt; workaround until a proper fix is found.
&gt; Could you confirm this on your system?
&gt;=20
&gt;=20
&gt; &gt;=20
&gt; &gt; I am adding Rocket League crash output from apitrace.
&gt;=20
&gt; This trace file is very small (only one frame) and doesn't hang here.<=
/span >

Okay I just got another random hang on the desktop. even with the environme=
nt
variable turned on the whole time. Unfortunately it seems to be very hardly
tracable seems to be very random :( Seems that Citra hang is unrelated to t=
his
bug after all, it's a completely different bug. It's good that we discovered
another (citra-related) bug on the way but probably we can't mark that
workaround to solve anything because hangs still randomly occur on the desk=
top.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15674427090.0F6cEa69.13010--

--===============0229752225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0229752225==--
