Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 168B9F67C0
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 07:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815CD6E584;
	Sun, 10 Nov 2019 06:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0661D6E580
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 06:20:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EB72C720E2; Sun, 10 Nov 2019 06:20:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109628] WARNING at dcn10_hw_sequencer.c:868
 dcn10_verify_allow_pstate_change_high()
Date: Sun, 10 Nov 2019 06:20:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chris.snook@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109628-502-t9gY7Ehj9i@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109628-502@http.bugs.freedesktop.org/>
References: <bug-109628-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1588477163=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1588477163==
Content-Type: multipart/alternative; boundary="15733668250.2a95ac.8823"
Content-Transfer-Encoding: 7bit


--15733668250.2a95ac.8823
Date: Sun, 10 Nov 2019 06:20:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109628

--- Comment #34 from Chris Snook <chris.snook@gmail.com> ---
(In reply to Chris Snook from comment #33)
> (In reply to Johannes Hirte from comment #28)
> > From the reports, it seems to be compositor related. For me, kwin with
> > OpenGL 3.1 backend works fine. xfwm4 seems to trigger the bug, maybe ot=
her
> > compositors too.
>=20
> Confirmed that the workaround of switching to the kwin OpenGL 3.1 composi=
tor
> works for me.
>=20
> kernel: 5.3.0-19-generic (Ubuntu 19.10)
> window manager: kwin-x11 4:5.16.5-0ubuntu1
> CPU: Ryzen Pro 2500U
> machine: Lenovo Thinkpad A485
> X server: xserver-xorg 1:7.7+19ubuntu12
> userspace driver: xserver-xorg-video-amdgpu 19.0.1-1ubuntu1
>=20
> I'm happy to test patches or reproduce.

I may have spoken too soon. I'm non-deterministically experiencing the basic
symptom of hang on resume with a blank screen, sometimes with the backlight=
 on
and sometimes without, but I no longer get the traceback in logs, so I can't
tell if it's mostly the same bug but without tripping the failure mode that
causes it to log, or if there's an unrelated suspend/resume bug. Switching =
to
the OpenGL 3.1 compositor has definitely made that error message stop appea=
ring
in my logs though.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15733668250.2a95ac.8823
Date: Sun, 10 Nov 2019 06:20:25 +0000
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
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628#c34">Comme=
nt # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628">bug 10962=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris.snook&#64;gmail.com" title=3D"Chris Snook &lt;chris.snook&#64;gmail.c=
om&gt;"> <span class=3D"fn">Chris Snook</span></a>
</span></b>
        <pre>(In reply to Chris Snook from <a href=3D"show_bug.cgi?id=3D109=
628#c33">comment #33</a>)
<span class=3D"quote">&gt; (In reply to Johannes Hirte from <a href=3D"show=
_bug.cgi?id=3D109628#c28">comment #28</a>)
&gt; &gt; From the reports, it seems to be compositor related. For me, kwin=
 with
&gt; &gt; OpenGL 3.1 backend works fine. xfwm4 seems to trigger the bug, ma=
ybe other
&gt; &gt; compositors too.
&gt;=20
&gt; Confirmed that the workaround of switching to the kwin OpenGL 3.1 comp=
ositor
&gt; works for me.
&gt;=20
&gt; kernel: 5.3.0-19-generic (Ubuntu 19.10)
&gt; window manager: kwin-x11 4:5.16.5-0ubuntu1
&gt; CPU: Ryzen Pro 2500U
&gt; machine: Lenovo Thinkpad A485
&gt; X server: xserver-xorg 1:7.7+19ubuntu12
&gt; userspace driver: xserver-xorg-video-amdgpu 19.0.1-1ubuntu1
&gt;=20
&gt; I'm happy to test patches or reproduce.</span >

I may have spoken too soon. I'm non-deterministically experiencing the basic
symptom of hang on resume with a blank screen, sometimes with the backlight=
 on
and sometimes without, but I no longer get the traceback in logs, so I can't
tell if it's mostly the same bug but without tripping the failure mode that
causes it to log, or if there's an unrelated suspend/resume bug. Switching =
to
the OpenGL 3.1 compositor has definitely made that error message stop appea=
ring
in my logs though.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15733668250.2a95ac.8823--

--===============1588477163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1588477163==--
