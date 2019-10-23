Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9D9E0FCB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 03:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1517D6E946;
	Wed, 23 Oct 2019 01:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9555D6E94B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 01:52:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 924D5720E2; Wed, 23 Oct 2019 01:52:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Wed, 23 Oct 2019 01:52:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodamorris@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-EJaw5kt0FX@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0012655307=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0012655307==
Content-Type: multipart/alternative; boundary="15717955797.9D5Ce13E.32387"
Content-Transfer-Encoding: 7bit


--15717955797.9D5Ce13E.32387
Date: Wed, 23 Oct 2019 01:52:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #118 from Rodney A Morris <rodamorris@gmail.com> ---
(In reply to haro41 from comment #117)
> ...are this craches more frequently with VSYNC enabled?
>=20
> If yes, it could be the same thing like this bug:
>=20
> https://bugs.freedesktop.org/show_bug.cgi?id=3D110777

vsync is defintely on for both Stellaris and Hearts of Iron.

I looked over the bug report you linked to.  It is very interesting and I w=
ill
follow with interest.  The next time I play Stellaris or Hearts of Iron IV,=
 I
will have to see if I can record my memory frequency values to see if they =
are
indeed not moving off the base frequency under low load with v-sync enabled=
.=20
The problem manifesting under low load would explain why I cannot replicate=
 the
problem while running Unigine Superposition.

I began to wonder if powerplay and the frequency at which the chip and memo=
ry
were operating were not the problem after reading the following bug report =
for
Vega 20:

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

Last Friday, I attempted to capture the operating frequency and temps, but =
my
attempt utterly failed.

I will disable v-sync and see if that improves and report back here.  If I
manage to capture frequency data, I will report back here and may be your
thread.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15717955797.9D5Ce13E.32387
Date: Wed, 23 Oct 2019 01:52:59 +0000
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
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c118">Comm=
ent # 118</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rodamorris&#64;gmail.com" title=3D"Rodney A Morris &lt;rodamorris&#64;gmail=
.com&gt;"> <span class=3D"fn">Rodney A Morris</span></a>
</span></b>
        <pre>(In reply to haro41 from <a href=3D"show_bug.cgi?id=3D109955#c=
117">comment #117</a>)
<span class=3D"quote">&gt; ...are this craches more frequently with VSYNC e=
nabled?
&gt;=20
&gt; If yes, it could be the same thing like this bug:
&gt;=20
&gt; <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 5.1-5.3 MCLK stuck at 167MHz Vega 10 (56/64)"
   href=3D"show_bug.cgi?id=3D110777">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110777</a></span >

vsync is defintely on for both Stellaris and Hearts of Iron.

I looked over the bug report you linked to.  It is very interesting and I w=
ill
follow with interest.  The next time I play Stellaris or Hearts of Iron IV,=
 I
will have to see if I can record my memory frequency values to see if they =
are
indeed not moving off the base frequency under low load with v-sync enabled=
.=20
The problem manifesting under low load would explain why I cannot replicate=
 the
problem while running Unigine Superposition.

I began to wonder if powerplay and the frequency at which the chip and memo=
ry
were operating were not the problem after reading the following bug report =
for
Vega 20:

<a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"show_bug.cgi?id=3D110674">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110674</a>

Last Friday, I attempted to capture the operating frequency and temps, but =
my
attempt utterly failed.

I will disable v-sync and see if that improves and report back here.  If I
manage to capture frequency data, I will report back here and may be your
thread.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15717955797.9D5Ce13E.32387--

--===============0012655307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0012655307==--
