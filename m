Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8082A800
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 06:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C383E6E1B1;
	Sun, 26 May 2019 04:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C22276E1B1
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 04:28:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BC5B572167; Sun, 26 May 2019 04:28:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110637] Any OpenCL application causes "*ERROR* ring gfx
 timeout" on Vega 64
Date: Sun, 26 May 2019 04:28:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mezin.alexander@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110637-502-rBLgpSD9lF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110637-502@http.bugs.freedesktop.org/>
References: <bug-110637-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1721146051=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1721146051==
Content-Type: multipart/alternative; boundary="15588449161.f04E7b982.1803"
Content-Transfer-Encoding: 7bit


--15588449161.f04E7b982.1803
Date: Sun, 26 May 2019 04:28:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110637

--- Comment #9 from Alexander Mezin <mezin.alexander@gmail.com> ---
Tried Mesa 19.1.0-rc3
Geekbench hangs, but there are no immediate errors in dmesg. It looks like =
gpu
is doing something based on 'sensors' output (~130 W power consumption, at =
idle
it is <20W). And power consumption doesn't go down even when I kill geekben=
ch.
When I try to reboot, the system hangs.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15588449161.f04E7b982.1803
Date: Sun, 26 May 2019 04:28:36 +0000
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
   title=3D"NEW - Any OpenCL application causes &quot;*ERROR* ring gfx time=
out&quot; on Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110637#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Any OpenCL application causes &quot;*ERROR* ring gfx time=
out&quot; on Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110637">bug 11063=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mezin.alexander&#64;gmail.com" title=3D"Alexander Mezin &lt;mezin.alexander=
&#64;gmail.com&gt;"> <span class=3D"fn">Alexander Mezin</span></a>
</span></b>
        <pre>Tried Mesa 19.1.0-rc3
Geekbench hangs, but there are no immediate errors in dmesg. It looks like =
gpu
is doing something based on 'sensors' output (~130 W power consumption, at =
idle
it is &lt;20W). And power consumption doesn't go down even when I kill geek=
bench.
When I try to reboot, the system hangs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15588449161.f04E7b982.1803--

--===============1721146051==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1721146051==--
