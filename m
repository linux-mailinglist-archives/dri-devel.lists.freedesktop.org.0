Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712E9F217
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 20:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8258589C03;
	Tue, 27 Aug 2019 18:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5CCF789BFC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 18:11:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 59ADC72161; Tue, 27 Aug 2019 18:11:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110865] Rx480 consumes 20w more power in idle than under Windows
Date: Tue, 27 Aug 2019 18:11:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: Dieter@nuetzel-hh.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110865-502-Lm01ujMLaE@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110865-502@http.bugs.freedesktop.org/>
References: <bug-110865-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1739934471=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1739934471==
Content-Type: multipart/alternative; boundary="15669294742.7fA1Ccf.28626"
Content-Transfer-Encoding: 7bit


--15669294742.7fA1Ccf.28626
Date: Tue, 27 Aug 2019 18:11:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110865

--- Comment #27 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
This is going nuts...

Martins has

2 different displays (both 59.95Hz@1920x1200),
RX 480 and _very nice_ numbers (only 12.222 W), now

GFX Clocks and Power:
        300 MHz (MCLK)                     <=3D !!!
        308 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        300 MHz (PSTATE_MCLK)
        800 mV (VDDGFX)                    <=3D !!!
        12.222 W (average GPU)

=3D> working (?!) but flicker

I have

2 identical displays BenQ GL2440H  (both 60.00 Hz @ 1920x1080),
RX580 and 'normal' numbers (~32 W - but to high?!), now

GFX Clocks and Power:
        300 MHz (MCLK)                     <=3D !!!
        300 MHz (SCLK)
        600 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)                    <=3D !!! mine is better, but...
        32.76 W (average GPU)

=3D> working (?!) but flicker, too.


This
        600 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)

must be a different problem (compare with Martin's RX 480).
I open another ticket for it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15669294742.7fA1Ccf.28626
Date: Tue, 27 Aug 2019 18:11:14 +0000
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
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865#c27">Comme=
nt # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Rx480 consumes 20w more power in idle than under Windows"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110865">bug 11086=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Dieter&#64;nuetzel-hh.de" title=3D"Dieter N=C3=BCtzel &lt;Dieter&#64;nuetze=
l-hh.de&gt;"> <span class=3D"fn">Dieter N=C3=BCtzel</span></a>
</span></b>
        <pre>This is going nuts...

Martins has

2 different displays (both 59.95Hz&#64;1920x1200),
RX 480 and _very nice_ numbers (only 12.222 W), now

GFX Clocks and Power:
        300 MHz (MCLK)                     &lt;=3D !!!
        308 MHz (SCLK)
        300 MHz (PSTATE_SCLK)
        300 MHz (PSTATE_MCLK)
        800 mV (VDDGFX)                    &lt;=3D !!!
        12.222 W (average GPU)

=3D&gt; working (?!) but flicker

I have

2 identical displays BenQ GL2440H  (both 60.00 Hz &#64; 1920x1080),
RX580 and 'normal' numbers (~32 W - but to high?!), now

GFX Clocks and Power:
        300 MHz (MCLK)                     &lt;=3D !!!
        300 MHz (SCLK)
        600 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)
        750 mV (VDDGFX)                    &lt;=3D !!! mine is better, but.=
..
        32.76 W (average GPU)

=3D&gt; working (?!) but flicker, too.


This
        600 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)

must be a different problem (compare with Martin's RX 480).
I open another ticket for it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15669294742.7fA1Ccf.28626--

--===============1739934471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1739934471==--
