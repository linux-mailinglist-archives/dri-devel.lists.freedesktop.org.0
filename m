Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAC9132DC
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 19:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B086E82D;
	Fri,  3 May 2019 17:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 882236E82D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 17:06:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 84F987215A; Fri,  3 May 2019 17:06:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108893] Slow redrawing of menu in Gothic 2 under wine
Date: Fri, 03 May 2019 17:06:34 +0000
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
Message-ID: <bug-108893-502-bPsaHQ37Dl@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1960910848=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1960910848==
Content-Type: multipart/alternative; boundary="15569031941.659658a.10100"
Content-Transfer-Encoding: 7bit


--15569031941.659658a.10100
Date: Fri, 3 May 2019 17:06:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108893

--- Comment #11 from supercoolemail@seznam.cz ---
Ok, so I started the game and attached perf to it by PID, waited a minute a=
nd
stopped perf with CTRL+C. Here it is:

perf report --stdio
    45.80%  Gothic2.exe     wined3d.dll.so          [.] wined3d_resource_map
    42.80%  Gothic2.exe     radeonsi_dri.so         [.] _mesa_unpack_depth_=
span
     4.82%  Gothic2.exe     wined3d.dll.so          [.] 0x000000000008c809
     0.94%  Gothic2.exe     wined3d.dll.so          [.] 0x00000000000f4a93

perf report --stdio --sort comm,dso
    55.15%  Gothic2.exe     wined3d.dll.so=20=20=20=20=20=20=20=20
    42.91%  Gothic2.exe     radeonsi_dri.so=20=20=20=20=20=20=20
     0.93%  Gothic2.exe     dsound.dll.so

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15569031941.659658a.10100
Date: Fri, 3 May 2019 17:06:34 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Slow redrawing of menu in Gothic 2 under wine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108893">bug 10889=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
supercoolemail&#64;seznam.cz" title=3D"supercoolemail&#64;seznam.cz">superc=
oolemail&#64;seznam.cz</a>
</span></b>
        <pre>Ok, so I started the game and attached perf to it by PID, wait=
ed a minute and
stopped perf with CTRL+C. Here it is:

perf report --stdio
    45.80%  Gothic2.exe     wined3d.dll.so          [.] wined3d_resource_map
    42.80%  Gothic2.exe     radeonsi_dri.so         [.] _mesa_unpack_depth_=
span
     4.82%  Gothic2.exe     wined3d.dll.so          [.] 0x000000000008c809
     0.94%  Gothic2.exe     wined3d.dll.so          [.] 0x00000000000f4a93

perf report --stdio --sort comm,dso
    55.15%  Gothic2.exe     wined3d.dll.so=20=20=20=20=20=20=20=20
    42.91%  Gothic2.exe     radeonsi_dri.so=20=20=20=20=20=20=20
     0.93%  Gothic2.exe     dsound.dll.so</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15569031941.659658a.10100--

--===============1960910848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1960910848==--
