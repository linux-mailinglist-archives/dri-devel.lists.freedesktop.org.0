Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39872BF2FB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 14:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24BC6ED0B;
	Thu, 26 Sep 2019 12:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0405F6ED04
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 12:29:04 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 010BA72162; Thu, 26 Sep 2019 12:29:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102322] System crashes after "[drm] IP block:gmc_v8_0 is hung!"
 / [drm] IP block:sdma_v3_0 is hung!
Date: Thu, 26 Sep 2019 12:29:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: freedesktop@jeroenimo.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102322-502-vhyc9WfKr8@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1935622349=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1935622349==
Content-Type: multipart/alternative; boundary="15695009431.2fde.9640"
Content-Transfer-Encoding: 7bit


--15695009431.2fde.9640
Date: Thu, 26 Sep 2019 12:29:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102322

--- Comment #90 from jeroenimo <freedesktop@jeroenimo.nl> ---
I managed to run glmark2 without crashing the system with=20

By running the card manual at lowest frequency

from root shell:
echo manual > /sys/class/drm/card0/device/power_dpm_force_performance_level
echo 0 > /sys/class/drm/card0/device/pp_dpm_sclk

root@jeroenimo-amd:/home/jeroen# cat /sys/class/drm/card0/device/pp_dpm_scl=
k=20
0: 214Mhz *
1: 387Mhz=20
2: 843Mhz=20
3: 995Mhz=20
4: 1062Mhz=20
5: 1108Mhz=20
6: 1149Mhz=20
7: 1176Mhz=20
root@jeroenimo-amd:/home/jeroen#=20

If I go to higher e.g. 2: 843Mhz I manage to crash it.. although it takes a
while before it crashes.=20

when I force the card to anything above 4 I get an immediate crash without =
even
starting glmark2

I hope this helps!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695009431.2fde.9640
Date: Thu, 26 Sep 2019 12:29:03 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322#c90">Comme=
nt # 90</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322">bug 10232=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;jeroenimo.nl" title=3D"jeroenimo &lt;freedesktop&#64;jeroen=
imo.nl&gt;"> <span class=3D"fn">jeroenimo</span></a>
</span></b>
        <pre>I managed to run glmark2 without crashing the system with=20

By running the card manual at lowest frequency

from root shell:
echo manual &gt; /sys/class/drm/card0/device/power_dpm_force_performance_le=
vel
echo 0 &gt; /sys/class/drm/card0/device/pp_dpm_sclk

root&#64;jeroenimo-amd:/home/jeroen# cat /sys/class/drm/card0/device/pp_dpm=
_sclk=20
0: 214Mhz *
1: 387Mhz=20
2: 843Mhz=20
3: 995Mhz=20
4: 1062Mhz=20
5: 1108Mhz=20
6: 1149Mhz=20
7: 1176Mhz=20
root&#64;jeroenimo-amd:/home/jeroen#=20

If I go to higher e.g. 2: 843Mhz I manage to crash it.. although it takes a
while before it crashes.=20

when I force the card to anything above 4 I get an immediate crash without =
even
starting glmark2

I hope this helps!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695009431.2fde.9640--

--===============1935622349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1935622349==--
