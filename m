Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC8FA5BA8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 19:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9031489266;
	Mon,  2 Sep 2019 17:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A263C896E5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 17:05:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9F0D172161; Mon,  2 Sep 2019 17:05:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Mon, 02 Sep 2019 17:05:49 +0000
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
Message-ID: <bug-111481-502-rlrRtsc3tp@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1193126530=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1193126530==
Content-Type: multipart/alternative; boundary="15674439492.7cA653d.17795"
Content-Transfer-Encoding: 7bit


--15674439492.7cA653d.17795
Date: Mon, 2 Sep 2019 17:05:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #23 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #22)
> > Okay I just got another random hang on the desktop. even with the
> > environment variable turned on the whole time. Unfortunately it seems t=
o be
> > very hardly tracable seems to be very random :( Seems that Citra hang is
> > unrelated to this bug after all, it's a completely different bug. It's =
good
> > that we discovered another (citra-related) bug on the way but probably =
we
> > can't mark that workaround to solve anything because hangs still random=
ly
> > occur on the desktop.
>=20
> Yes, it's possible that there are different bugs.
>=20
> For the citra bug: I suspect an issue with Geometry Shaders + NGG but this
> will require more debugging to confirm (also: using wavesize=3D64 didn't =
help,
> so it's not a regression caused by a0d330bedb9e).
>=20
> I'm also testing using AMD_DEBUG=3Dnodma system wide to see if it prevent=
s the
> sdma0 kind of hangs.

Yes both Rocket League and Desktop hangs seem to be the sdma0 type. I will =
add
that parameter as well and see if there is any difference with Rocket League
hang and use the desktop with both flags enabled.

Well I mean actually finding multiple bugs while debugging 1 can only be a =
good
thing, after all less bugs in the future and my personal computing seems to
have quite a few corner cases it seems that otherwise go unnoticed :D which
should benefit many new happy Navi users

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15674439492.7cA653d.17795
Date: Mon, 2 Sep 2019 17:05:49 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c23">Comme=
nt # 23</a>
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
ug.cgi?id=3D111481#c22">comment #22</a>)
<span class=3D"quote">&gt; &gt; Okay I just got another random hang on the =
desktop. even with the
&gt; &gt; environment variable turned on the whole time. Unfortunately it s=
eems to be
&gt; &gt; very hardly tracable seems to be very random :( Seems that Citra =
hang is
&gt; &gt; unrelated to this bug after all, it's a completely different bug.=
 It's good
&gt; &gt; that we discovered another (citra-related) bug on the way but pro=
bably we
&gt; &gt; can't mark that workaround to solve anything because hangs still =
randomly
&gt; &gt; occur on the desktop.
&gt;=20
&gt; Yes, it's possible that there are different bugs.
&gt;=20
&gt; For the citra bug: I suspect an issue with Geometry Shaders + NGG but =
this
&gt; will require more debugging to confirm (also: using wavesize=3D64 didn=
't help,
&gt; so it's not a regression caused by a0d330bedb9e).
&gt;=20
&gt; I'm also testing using AMD_DEBUG=3Dnodma system wide to see if it prev=
ents the
&gt; sdma0 kind of hangs.</span >

Yes both Rocket League and Desktop hangs seem to be the sdma0 type. I will =
add
that parameter as well and see if there is any difference with Rocket League
hang and use the desktop with both flags enabled.

Well I mean actually finding multiple bugs while debugging 1 can only be a =
good
thing, after all less bugs in the future and my personal computing seems to
have quite a few corner cases it seems that otherwise go unnoticed :D which
should benefit many new happy Navi users</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15674439492.7cA653d.17795--

--===============1193126530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1193126530==--
