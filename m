Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA18AB236
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 08:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8983C89F2D;
	Fri,  6 Sep 2019 06:03:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB0EB6E145
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 06:03:16 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E78A472161; Fri,  6 Sep 2019 06:03:16 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105718] amdgpu reported fan speed looks too high (dual fan
 Sapphire Pulse Vega 56 and Sapphire RX 5700 XT)
Date: Fri, 06 Sep 2019 06:03:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105718-502-EIS9K3wqtb@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105718-502@http.bugs.freedesktop.org/>
References: <bug-105718-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2146856386=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2146856386==
Content-Type: multipart/alternative; boundary="15677497961.72e1.30719"
Content-Transfer-Encoding: 7bit


--15677497961.72e1.30719
Date: Fri, 6 Sep 2019 06:03:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105718

--- Comment #6 from Shmerl <shtetldik@gmail.com> ---
Hm, it could be radeon-profile mis-reporting fan load percentage, using the=
 max
value of 3200 reported by sensors. That's where I got those 50% I mentioned
above.

I just run The Witcher without vsync (Wine+dxvk) which loads GPU almost to =
100%
consistently.

Here is what I see:

From sensors:

amdgpu-pci-0f00
Adapter: PCI adapter
vddgfx:       +1.12 V
fan1:        1892 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +76.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                       (emerg =3D +80000.0=C2=B0C)
junction:     +94.0=C2=B0C  (crit =3D +80000.0=C2=B0C, hyst =3D  +0.0=C2=B0=
C)
                       (emerg =3D +80000.0=C2=B0C)
mem:          +88.0=C2=B0C  (crit =3D +80000.0=C2=B0C, hyst =3D  +0.0=C2=B0=
C)
                       (emerg =3D +80000.0=C2=B0C)
power1:      182.00 W  (cap =3D 195.00 W)

From: /sys/kernel/debug/dri/0/amdgpu_pm_info

GPU Temperature: 76 C
GPU Load: 99 %
MEM Load: 50 %

So the fan shows around 1900 rpm for full load and 76=C2=B0C. That is close=
r to 1570
rpm described in the Gamersnexus review. So may be it's correct?

It would be good to get some input from AMD, from those who know something
about VBIOS and Navi firmware.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15677497961.72e1.30719
Date: Fri, 6 Sep 2019 06:03:16 +0000
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
   title=3D"NEW - amdgpu reported fan speed looks too high (dual fan Sapphi=
re Pulse Vega 56 and Sapphire RX 5700 XT)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105718#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu reported fan speed looks too high (dual fan Sapphi=
re Pulse Vega 56 and Sapphire RX 5700 XT)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105718">bug 10571=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shtetldik&#64;gmail.com" title=3D"Shmerl &lt;shtetldik&#64;gmail.com&gt;"> =
<span class=3D"fn">Shmerl</span></a>
</span></b>
        <pre>Hm, it could be radeon-profile mis-reporting fan load percenta=
ge, using the max
value of 3200 reported by sensors. That's where I got those 50% I mentioned
above.

I just run The Witcher without vsync (Wine+dxvk) which loads GPU almost to =
100%
consistently.

Here is what I see:

From sensors:

amdgpu-pci-0f00
Adapter: PCI adapter
vddgfx:       +1.12 V
fan1:        1892 RPM  (min =3D    0 RPM, max =3D 3200 RPM)
edge:         +76.0=C2=B0C  (crit =3D +118.0=C2=B0C, hyst =3D  +0.0=C2=B0C)
                       (emerg =3D +80000.0=C2=B0C)
junction:     +94.0=C2=B0C  (crit =3D +80000.0=C2=B0C, hyst =3D  +0.0=C2=B0=
C)
                       (emerg =3D +80000.0=C2=B0C)
mem:          +88.0=C2=B0C  (crit =3D +80000.0=C2=B0C, hyst =3D  +0.0=C2=B0=
C)
                       (emerg =3D +80000.0=C2=B0C)
power1:      182.00 W  (cap =3D 195.00 W)

From: /sys/kernel/debug/dri/0/amdgpu_pm_info

GPU Temperature: 76 C
GPU Load: 99 %
MEM Load: 50 %

So the fan shows around 1900 rpm for full load and 76=C2=B0C. That is close=
r to 1570
rpm described in the Gamersnexus review. So may be it's correct?

It would be good to get some input from AMD, from those who know something
about VBIOS and Navi firmware.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15677497961.72e1.30719--

--===============2146856386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2146856386==--
