Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8394CE2BD3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 10:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23996E15A;
	Thu, 24 Oct 2019 08:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 845B06E17F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 08:14:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 81B63720E2; Thu, 24 Oct 2019 08:14:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 24 Oct 2019 08:14:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: stijn+bugs@linux-ipv6.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-j9tuxluK4C@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1162224521=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1162224521==
Content-Type: multipart/alternative; boundary="15719048638.f49F1b.10364"
Content-Transfer-Encoding: 7bit


--15719048638.f49F1b.10364
Date: Thu, 24 Oct 2019 08:14:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #150 from Stijn Tintel <stijn+bugs@linux-ipv6.be> ---
(In reply to Jaap Buurman from comment #142)
> How can I set both AMD_DEBUG=3Dnongg and AMD_DEBUG=3Dnodma in the
> /etc/environment file? Do they need to be on two separate lines, or will =
the
> second line simply overwrite the first one by setting the same environment
> variable? Do they need to be comma separated maybe?

AMD_DEBUG=3D"nodma nongg"

I've been running like this since I found this bug report. Current uptime:
11:08:41 up 4 days,  4:12, 11 users,  load average: 8,56, 8,33, 8,15

Haven't experienced a single hang, not even a kernel oops. Before that, the
system was frustratingly unstable. If you need stability, put this in
/etc/environment (or /etc/env.d/99amdgpu or so if your distro supports
/etc/env.d).

Running on Gentoo, kernel 5.3.4, mesa 19.2.1, llvm 9.0.0, libdrm 2.4.99,
xf86-video-amdgpu git e6fce59a071220967fcd4e2c9e4a262c72870761.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719048638.f49F1b.10364
Date: Thu, 24 Oct 2019 08:14:23 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c150">Comm=
ent # 150</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stijn+bugs&#64;linux-ipv6.be" title=3D"Stijn Tintel &lt;stijn+bugs&#64;linu=
x-ipv6.be&gt;"> <span class=3D"fn">Stijn Tintel</span></a>
</span></b>
        <pre>(In reply to Jaap Buurman from <a href=3D"show_bug.cgi?id=3D11=
1481#c142">comment #142</a>)
<span class=3D"quote">&gt; How can I set both AMD_DEBUG=3Dnongg and AMD_DEB=
UG=3Dnodma in the
&gt; /etc/environment file? Do they need to be on two separate lines, or wi=
ll the
&gt; second line simply overwrite the first one by setting the same environ=
ment
&gt; variable? Do they need to be comma separated maybe?</span >

AMD_DEBUG=3D&quot;nodma nongg&quot;

I've been running like this since I found this bug report. Current uptime:
11:08:41 up 4 days,  4:12, 11 users,  load average: 8,56, 8,33, 8,15

Haven't experienced a single hang, not even a kernel oops. Before that, the
system was frustratingly unstable. If you need stability, put this in
/etc/environment (or /etc/env.d/99amdgpu or so if your distro supports
/etc/env.d).

Running on Gentoo, kernel 5.3.4, mesa 19.2.1, llvm 9.0.0, libdrm 2.4.99,
xf86-video-amdgpu git e6fce59a071220967fcd4e2c9e4a262c72870761.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719048638.f49F1b.10364--

--===============1162224521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1162224521==--
