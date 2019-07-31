Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A797BCC0
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 11:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC10B898C8;
	Wed, 31 Jul 2019 09:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4B141898E8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 09:16:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 47E5B72167; Wed, 31 Jul 2019 09:16:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109887] vega56 undervolting/overclocking voltage issues
Date: Wed, 31 Jul 2019 09:16:05 +0000
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
Message-ID: <bug-109887-502-ndXaty1YkM@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1720963225=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1720963225==
Content-Type: multipart/alternative; boundary="15645645652.07f0Da1.16729"
Content-Transfer-Encoding: 7bit


--15645645652.07f0Da1.16729
Date: Wed, 31 Jul 2019 09:16:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109887

--- Comment #9 from Andrew Sheldon <asheldon55@gmail.com> ---
Here's a linux pp table editor that also seems to support more options (suc=
h as
raising the power cap) than OverDriveNTool:
https://github.com/amezin/powerplay-table-editor

I will note that you might still see raised voltages if you do a too aggres=
sive
overclock/undervolt with modded PP tables, but it seems to only overvolt as
much as is needed (say 975mv -> 1.05V) if you set a too high clock, rather =
than
jumping to the maximum possible voltage that you see by editing
pp_od_clk_voltage.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645645652.07f0Da1.16729
Date: Wed, 31 Jul 2019 09:16:05 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109887#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vega56 undervolting/overclocking voltage issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109887">bug 10988=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>Here's a linux pp table editor that also seems to support more=
 options (such as
raising the power cap) than OverDriveNTool:
<a href=3D"https://github.com/amezin/powerplay-table-editor">https://github=
.com/amezin/powerplay-table-editor</a>

I will note that you might still see raised voltages if you do a too aggres=
sive
overclock/undervolt with modded PP tables, but it seems to only overvolt as
much as is needed (say 975mv -&gt; 1.05V) if you set a too high clock, rath=
er than
jumping to the maximum possible voltage that you see by editing
pp_od_clk_voltage.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645645652.07f0Da1.16729--

--===============1720963225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1720963225==--
