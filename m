Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00CF7BE91
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 12:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB46F89BC2;
	Wed, 31 Jul 2019 10:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D29AA89C84
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 10:43:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CF60E72167; Wed, 31 Jul 2019 10:43:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109887] vega56 undervolting/overclocking voltage issues
Date: Wed, 31 Jul 2019 10:43:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109887-502-hYalCKk04U@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109887-502@http.bugs.freedesktop.org/>
References: <bug-109887-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1597321162=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1597321162==
Content-Type: multipart/alternative; boundary="15645698172.85E5.32407"
Content-Transfer-Encoding: 7bit


--15645698172.85E5.32407
Date: Wed, 31 Jul 2019 10:43:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109887

--- Comment #10 from Andrew Sheldon <asheldon55@gmail.com> ---
(In reply to Andrew Sheldon from comment #9)
> I will note that you might still see raised voltages if you do a too
> aggressive overclock/undervolt with modded PP tables, but it seems to only
> overvolt as much as is needed (say 975mv -> 1.05V) if you set a too high
> clock, rather than jumping to the maximum possible voltage that you see by
> editing pp_od_clk_voltage.

Replying to myself here. I've found that the raised voltage occurs when for=
cing
GPU state to "high". If I then re-write the PP table again, it settles on t=
he
correct voltage, and successfully switches to "high" after. I'm not sure if
this is related to some of the other voltage issues, but there you go. This
occurs on both 5.2.3 and 5.3-rc2, for the record.

I have to do this every time I force to "high", BTW.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645698172.85E5.32407
Date: Wed, 31 Jul 2019 10:43:37 +0000
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
   title=3D"NEW - vega56 undervolting/overclocking voltage issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109887#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vega56 undervolting/overclocking voltage issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109887">bug 10988=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>(In reply to Andrew Sheldon from <a href=3D"show_bug.cgi?id=3D=
109887#c9">comment #9</a>)
<span class=3D"quote">&gt; I will note that you might still see raised volt=
ages if you do a too
&gt; aggressive overclock/undervolt with modded PP tables, but it seems to =
only
&gt; overvolt as much as is needed (say 975mv -&gt; 1.05V) if you set a too=
 high
&gt; clock, rather than jumping to the maximum possible voltage that you se=
e by
&gt; editing pp_od_clk_voltage.</span >

Replying to myself here. I've found that the raised voltage occurs when for=
cing
GPU state to &quot;high&quot;. If I then re-write the PP table again, it se=
ttles on the
correct voltage, and successfully switches to &quot;high&quot; after. I'm n=
ot sure if
this is related to some of the other voltage issues, but there you go. This
occurs on both 5.2.3 and 5.3-rc2, for the record.

I have to do this every time I force to &quot;high&quot;, BTW.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645698172.85E5.32407--

--===============1597321162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1597321162==--
