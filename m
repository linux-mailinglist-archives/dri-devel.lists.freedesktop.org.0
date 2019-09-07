Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC99AC4CA
	for <lists+dri-devel@lfdr.de>; Sat,  7 Sep 2019 07:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F07D89FE8;
	Sat,  7 Sep 2019 05:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 73FC489FE8
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Sep 2019 05:42:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 706E872161; Sat,  7 Sep 2019 05:42:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102322] System crashes after "[drm] IP block:gmc_v8_0 is hung!"
 / [drm] IP block:sdma_v3_0 is hung!
Date: Sat, 07 Sep 2019 05:42:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: paul@ezvan.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102322-502-ZjocAtFHwQ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102322-502@http.bugs.freedesktop.org/>
References: <bug-102322-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0765490935=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0765490935==
Content-Type: multipart/alternative; boundary="15678349425.AFF0.15036"
Content-Transfer-Encoding: 7bit


--15678349425.AFF0.15036
Date: Sat, 7 Sep 2019 05:42:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102322

--- Comment #86 from Paul Ezvan <paul@ezvan.fr> ---
I was also impacted by this bug (amdgpu hangs on random conditions with sim=
ilar
messages as the one exposed) with any kernel/mesa version combination other
than the ones on Debian Stretch (any other distro or using Mesa from backpo=
rts
would trigger those crashes).
This was on a Ryzen 1700 platform with chipset B450. I had this issue with a
RX480 and a RX560 (as I tried to replace the GPU in case it was faulty, I a=
lso
replace the motherboard).

I was still impacted with Fedora 30 with recurring GPU hangs. Then I replac=
ed
the CPU/motherboard with a Core i7-9700k/Z390 platform. Since then I did not
have a single GPU hang on Fedora 30.

My hypothesis on this problem not being easily reproducible is that it would
happen only on specific GPU/CPU combinations.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15678349425.AFF0.15036
Date: Sat, 7 Sep 2019 05:42:22 +0000
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
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322#c86">Comme=
nt # 86</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322">bug 10232=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
paul&#64;ezvan.fr" title=3D"Paul Ezvan &lt;paul&#64;ezvan.fr&gt;"> <span cl=
ass=3D"fn">Paul Ezvan</span></a>
</span></b>
        <pre>I was also impacted by this bug (amdgpu hangs on random condit=
ions with similar
messages as the one exposed) with any kernel/mesa version combination other
than the ones on Debian Stretch (any other distro or using Mesa from backpo=
rts
would trigger those crashes).
This was on a Ryzen 1700 platform with chipset B450. I had this issue with a
RX480 and a RX560 (as I tried to replace the GPU in case it was faulty, I a=
lso
replace the motherboard).

I was still impacted with Fedora 30 with recurring GPU hangs. Then I replac=
ed
the CPU/motherboard with a Core i7-9700k/Z390 platform. Since then I did not
have a single GPU hang on Fedora 30.

My hypothesis on this problem not being easily reproducible is that it would
happen only on specific GPU/CPU combinations.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15678349425.AFF0.15036--

--===============0765490935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0765490935==--
