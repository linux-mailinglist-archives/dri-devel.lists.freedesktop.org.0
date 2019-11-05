Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22373EF20C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 01:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197986E8D1;
	Tue,  5 Nov 2019 00:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D08D56E8CD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 00:37:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C9E42720E2; Tue,  5 Nov 2019 00:37:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Tue, 05 Nov 2019 00:37:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-j9ttArAo7l@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1954843449=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1954843449==
Content-Type: multipart/alternative; boundary="15729142520.FA2CF9c.10103"
Content-Transfer-Encoding: 7bit


--15729142520.FA2CF9c.10103
Date: Tue, 5 Nov 2019 00:37:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #35 from Andrew Sheldon <asheldon55@gmail.com> ---
(In reply to Dieter N=C3=BCtzel from comment #34)

> Which I couldn't verify on my Polaris system (with 2 identical HDMI
> monitors) currently.
> With 'low' and 2 identical HDMI displays I get the below under
> 'amd-staging-drm-next':
>=20
> GFX Clocks and Power:
>         300 MHz (MCLK)
>         300 MHz (SCLK)
>         600 MHz (PSTATE_SCLK)
>         1000 MHz (PSTATE_MCLK)
>         750 mV (VDDGFX)
>         32.174 W (average GPU)
>=20
> PSTATE_SCLK and PSTATE_MCLK do NOT drop and much to high W.
> NO flickering due to 'low'.
>=20
> I'll point Alex to this thread.

You need to revert f6505e375fe8 , which "fixed" the flickering bug (but
prevents the lower power consumption behaviour).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15729142520.FA2CF9c.10103
Date: Tue, 5 Nov 2019 00:37:32 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c35">Comme=
nt # 35</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>(In reply to Dieter N=C3=BCtzel from <a href=3D"show_bug.cgi?i=
d=3D111482#c34">comment #34</a>)

<span class=3D"quote">&gt; Which I couldn't verify on my Polaris system (wi=
th 2 identical HDMI
&gt; monitors) currently.
&gt; With 'low' and 2 identical HDMI displays I get the below under
&gt; 'amd-staging-drm-next':
&gt;=20
&gt; GFX Clocks and Power:
&gt;         300 MHz (MCLK)
&gt;         300 MHz (SCLK)
&gt;         600 MHz (PSTATE_SCLK)
&gt;         1000 MHz (PSTATE_MCLK)
&gt;         750 mV (VDDGFX)
&gt;         32.174 W (average GPU)
&gt;=20
&gt; PSTATE_SCLK and PSTATE_MCLK do NOT drop and much to high W.
&gt; NO flickering due to 'low'.
&gt;=20
&gt; I'll point Alex to this thread.</span >

You need to revert f6505e375fe8 , which &quot;fixed&quot; the flickering bu=
g (but
prevents the lower power consumption behaviour).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15729142520.FA2CF9c.10103--

--===============1954843449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1954843449==--
