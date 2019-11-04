Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE1EE4AF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 17:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A2F6E5FB;
	Mon,  4 Nov 2019 16:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 756626E600
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:31:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 72043720E2; Mon,  4 Nov 2019 16:31:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Mon, 04 Nov 2019 16:31:26 +0000
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
Message-ID: <bug-111482-502-b558Cz1mIe@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0359559825=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0359559825==
Content-Type: multipart/alternative; boundary="15728850865.Be71D1f.6692"
Content-Transfer-Encoding: 7bit


--15728850865.Be71D1f.6692
Date: Mon, 4 Nov 2019 16:31:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #32 from Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de> ---
(In reply to Shmerl from comment #31)
> I can confirm, that at 2560x1440 / 144 Hz, after suspend / resume, setting
> "high" in /sys/class/drm/card0/device/power_dpm_force_performance_level
> stops flickering that starts after resume, and then setting "low" there
> still keeps it flickering free, while dropping MCLK and power consumption=
 to
> what you expect from a normal idle level!=20
>=20
> You can check that with:
>=20
>     sudo cat /sys/kernel/debug/dri/0/amdgpu_pm_info
>=20
> So it means the card can handle it after all, but somehow doesn't
> dynamically adjust to that state.
>=20
> Can anyone from AMD please comment on this situation?

Hello 'Shmerl',

can you (and the other) please recheck with 'auto', too?
I think we have the 'same' problem with Polaris, too.
If one set low/high it is set @fixed frequency and NOT @ the 'flickering'
'auto' mode.

I can't test the 'suspend / resume' cycle 'cause my server/workstation do N=
OT
work reliable on it.
But power consumption is definitely to high on Polaris, too.

@Alex: What do you think about this?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15728850865.Be71D1f.6692
Date: Mon, 4 Nov 2019 16:31:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c32">Comme=
nt # 32</a>
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
31">comment #31</a>)
<span class=3D"quote">&gt; I can confirm, that at 2560x1440 / 144 Hz, after=
 suspend / resume, setting
&gt; &quot;high&quot; in /sys/class/drm/card0/device/power_dpm_force_perfor=
mance_level
&gt; stops flickering that starts after resume, and then setting &quot;low&=
quot; there
&gt; still keeps it flickering free, while dropping MCLK and power consumpt=
ion to
&gt; what you expect from a normal idle level!=20
&gt;=20
&gt; You can check that with:
&gt;=20
&gt;     sudo cat /sys/kernel/debug/dri/0/amdgpu_pm_info
&gt;=20
&gt; So it means the card can handle it after all, but somehow doesn't
&gt; dynamically adjust to that state.
&gt;=20
&gt; Can anyone from AMD please comment on this situation?</span >

Hello 'Shmerl',

can you (and the other) please recheck with 'auto', too?
I think we have the 'same' problem with Polaris, too.
If one set low/high it is set &#64;fixed frequency and NOT &#64; the 'flick=
ering'
'auto' mode.

I can't test the 'suspend / resume' cycle 'cause my server/workstation do N=
OT
work reliable on it.
But power consumption is definitely to high on Polaris, too.

&#64;Alex: What do you think about this?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15728850865.Be71D1f.6692--

--===============0359559825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0359559825==--
