Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14134131F7
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 18:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343DD6E815;
	Fri,  3 May 2019 16:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D5EB6E815
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 16:17:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5708D7215A; Fri,  3 May 2019 16:17:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108893] Slow redrawing of menu in Gothic 2 under wine
Date: Fri, 03 May 2019 16:17:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: supercoolemail@seznam.cz
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108893-502-BdnPmNdJk7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108893-502@http.bugs.freedesktop.org/>
References: <bug-108893-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1626652053=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1626652053==
Content-Type: multipart/alternative; boundary="15569002471.3f9cD.2191"
Content-Transfer-Encoding: 7bit


--15569002471.3f9cD.2191
Date: Fri, 3 May 2019 16:17:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108893

--- Comment #9 from supercoolemail@seznam.cz ---
I am on 19.0.3.
The game used to run quite well from what I remeber and I could navigate the
menu. Now it's horrible and when I want to change something in menu, I need
LIBGL_ALWAYS_SOFTWARE=3D1, otherwise I might not even live long enough to c=
hange
it :-)

Output of perf (if you want anything more, e.g. full perf.data or something,
I'll deliver):

perf report --stdio
    32.26%  Gothic2.exe      wined3d.dll.so            [.] wined3d_resource=
_map
    20.34%  Gothic2.exe      radeonsi_dri.so           [.] 0x000000000053c2=
22
     4.05%  Gothic2.exe      wined3d.dll.so            [.] 0x000000000008c8=
09
     3.95%  Gothic2.exe      radeonsi_dri.so           [.] 0x000000000053c2=
27
     3.67%  Gothic2.exe      ntdll.dll.so              [.] RtlAllocateHeap
     2.41%  Gothic2.exe      perf-24471.map            [.] 0x0000000001426f=
aa
     2.02%  Gothic2.exe      radeonsi_dri.so           [.] 0x000000000053c2=
24
     1.20%  Gothic2.exe      ntdll.dll.so              [.] 0x00000000000882=
07
     1.19%  Gothic2.exe      radeonsi_dri.so           [.] 0x000000000053bf=
2a
     1.17%  Gothic2.exe      ntdll.dll.so              [.] 0x00000000000883=
73
     0.92%  Gothic2.exe      wined3d.dll.so            [.] 0x000000000008b2=
82


perf report --stdio --sort comm,dso
    40.56%  Gothic2.exe      wined3d.dll.so=20=20=20=20=20=20=20=20=20=20
    30.73%  Gothic2.exe      radeonsi_dri.so=20=20=20=20=20=20=20=20=20
    11.74%  Gothic2.exe      ntdll.dll.so=20=20=20=20=20=20=20=20=20=20=20=
=20
     8.61%  Gothic2.exe      perf-24471.map=20=20=20=20=20=20=20=20=20=20
     3.65%  Gothic2.exe      Gothic2.exe=20=20=20=20=20=20=20=20=20=20=20=
=20=20
     1.59%  Gothic2.exe      dsound.dll.so=20=20=20=20=20=20=20=20=20=20=20
     0.71%  Gothic2.exe      libGLX_mesa.so.0.0.0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569002471.3f9cD.2191
Date: Fri, 3 May 2019 16:17:27 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893">bug 10889=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
supercoolemail&#64;seznam.cz" title=3D"supercoolemail&#64;seznam.cz">superc=
oolemail&#64;seznam.cz</a>
</span></b>
        <pre>I am on 19.0.3.
The game used to run quite well from what I remeber and I could navigate the
menu. Now it's horrible and when I want to change something in menu, I need
LIBGL_ALWAYS_SOFTWARE=3D1, otherwise I might not even live long enough to c=
hange
it :-)

Output of perf (if you want anything more, e.g. full perf.data or something,
I'll deliver):

perf report --stdio
    32.26%  Gothic2.exe      wined3d.dll.so            [.] wined3d_resource=
_map
    20.34%  Gothic2.exe      radeonsi_dri.so           [.] 0x000000000053c2=
22
     4.05%  Gothic2.exe      wined3d.dll.so            [.] 0x000000000008c8=
09
     3.95%  Gothic2.exe      radeonsi_dri.so           [.] 0x000000000053c2=
27
     3.67%  Gothic2.exe      ntdll.dll.so              [.] RtlAllocateHeap
     2.41%  Gothic2.exe      perf-24471.map            [.] 0x0000000001426f=
aa
     2.02%  Gothic2.exe      radeonsi_dri.so           [.] 0x000000000053c2=
24
     1.20%  Gothic2.exe      ntdll.dll.so              [.] 0x00000000000882=
07
     1.19%  Gothic2.exe      radeonsi_dri.so           [.] 0x000000000053bf=
2a
     1.17%  Gothic2.exe      ntdll.dll.so              [.] 0x00000000000883=
73
     0.92%  Gothic2.exe      wined3d.dll.so            [.] 0x000000000008b2=
82


perf report --stdio --sort comm,dso
    40.56%  Gothic2.exe      wined3d.dll.so=20=20=20=20=20=20=20=20=20=20
    30.73%  Gothic2.exe      radeonsi_dri.so=20=20=20=20=20=20=20=20=20
    11.74%  Gothic2.exe      ntdll.dll.so=20=20=20=20=20=20=20=20=20=20=20=
=20
     8.61%  Gothic2.exe      perf-24471.map=20=20=20=20=20=20=20=20=20=20
     3.65%  Gothic2.exe      Gothic2.exe=20=20=20=20=20=20=20=20=20=20=20=
=20=20
     1.59%  Gothic2.exe      dsound.dll.so=20=20=20=20=20=20=20=20=20=20=20
     0.71%  Gothic2.exe      libGLX_mesa.so.0.0.0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569002471.3f9cD.2191--

--===============1626652053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1626652053==--
