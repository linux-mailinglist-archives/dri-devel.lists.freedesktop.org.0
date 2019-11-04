Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F700EF161
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 00:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2586E8BA;
	Mon,  4 Nov 2019 23:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C94AE6E8BA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 23:48:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C64BC720E2; Mon,  4 Nov 2019 23:48:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Mon, 04 Nov 2019 23:48:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-pCUtsEgi7r@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1522581026=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1522581026==
Content-Type: multipart/alternative; boundary="15729112991.91D1.858"
Content-Transfer-Encoding: 7bit


--15729112991.91D1.858
Date: Mon, 4 Nov 2019 23:48:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #34 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
(In reply to Shmerl from comment #33)
> (In reply to Dieter N=C3=BCtzel from comment #32)
> >=20
> > Hello 'Shmerl',
> >=20
> > can you (and the other) please recheck with 'auto', too?
> > I think we have the 'same' problem with Polaris, too.
>=20
> Can you clarify please, what scenario exactly do you want me to test? When
> computer boots (or resumes), the value is "auto" by default.

Expected.

> On "auto" after
> boot, idle power consumption is high (30+W).

To high.
With 1 or more identical monitors?
Compare Alex's latest >=3D2 identical monitor patches.
I get the same even on Polaris (Alex?).

> After resume, with that "auto"
> value, the screen starts flickering,

That is currently the expected 'auto' clk transition bug.
If someone set the clks to low/high flickering can't happen.

> I'll check what power consumption it
> has at that point a bit later.

That's the 'new' interesting part that Andrew, Robert and you find with Nav=
i.
The suspend / resume (with later high/low) 'cycle' which led to much lower
power consumption.

Which I couldn't verify on my Polaris system (with 2 identical HDMI monitor=
s)
currently.
With 'low' and 2 identical HDMI displays I get the below under
'amd-staging-drm-next':

GFX Clocks and Power:
        300 MHz (MCLK)
        300 MHz (SCLK)
        600 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        32.174 W (average GPU)

PSTATE_SCLK and PSTATE_MCLK do NOT drop and much to high W.
NO flickering due to 'low'.

I'll point Alex to this thread.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15729112991.91D1.858
Date: Mon, 4 Nov 2019 23:48:19 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c34">Comme=
nt # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>(In reply to Shmerl from <a href=3D"show_bug.cgi?id=3D111482#c=
33">comment #33</a>)
<span class=3D"quote">&gt; (In reply to Dieter N=C3=BCtzel from <a href=3D"=
show_bug.cgi?id=3D111482#c32">comment #32</a>)
&gt; &gt;=20
&gt; &gt; Hello 'Shmerl',
&gt; &gt;=20
&gt; &gt; can you (and the other) please recheck with 'auto', too?
&gt; &gt; I think we have the 'same' problem with Polaris, too.
&gt;=20
&gt; Can you clarify please, what scenario exactly do you want me to test? =
When
&gt; computer boots (or resumes), the value is &quot;auto&quot; by default.=
</span >

Expected.

<span class=3D"quote">&gt; On &quot;auto&quot; after
&gt; boot, idle power consumption is high (30+W).</span >

To high.
With 1 or more identical monitors?
Compare Alex's latest &gt;=3D2 identical monitor patches.
I get the same even on Polaris (Alex?).

<span class=3D"quote">&gt; After resume, with that &quot;auto&quot;
&gt; value, the screen starts flickering,</span >

That is currently the expected 'auto' clk transition bug.
If someone set the clks to low/high flickering can't happen.

<span class=3D"quote">&gt; I'll check what power consumption it
&gt; has at that point a bit later.</span >

That's the 'new' interesting part that Andrew, Robert and you find with Nav=
i.
The suspend / resume (with later high/low) 'cycle' which led to much lower
power consumption.

Which I couldn't verify on my Polaris system (with 2 identical HDMI monitor=
s)
currently.
With 'low' and 2 identical HDMI displays I get the below under
'amd-staging-drm-next':

GFX Clocks and Power:
        300 MHz (MCLK)
        300 MHz (SCLK)
        600 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)
        32.174 W (average GPU)

PSTATE_SCLK and PSTATE_MCLK do NOT drop and much to high W.
NO flickering due to 'low'.

I'll point Alex to this thread.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15729112991.91D1.858--

--===============1522581026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1522581026==--
