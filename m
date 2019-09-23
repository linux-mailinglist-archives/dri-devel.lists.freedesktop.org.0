Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 152CEBBD65
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 22:56:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24E888052;
	Mon, 23 Sep 2019 20:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3741988052
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 20:56:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3011772162; Mon, 23 Sep 2019 20:56:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110457] System resumes failed and hits [drm:amdgpu_job_timedout
 [amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G
Date: Mon, 23 Sep 2019 20:56:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: darkshvein@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110457-502-9V41kcFnGU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110457-502@http.bugs.freedesktop.org/>
References: <bug-110457-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1701903461=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1701903461==
Content-Type: multipart/alternative; boundary="15692722100.298D85A2.1407"
Content-Transfer-Encoding: 7bit


--15692722100.298D85A2.1407
Date: Mon, 23 Sep 2019 20:56:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110457

--- Comment #13 from darkshvein <darkshvein@gmail.com> ---
Hello.
please, explain.=20
Why I work fine with FX-8320 CPU,
but after Ryzen r5 1600 upgrade, I see this OS freezes and bug?

is pcie generation any cause? planned obsolescence?
or coincidence with amdgpu driver update?


part of my log:
[49266.138534] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D5660155, emitted seq=3D5660157
[49266.138578] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Civ6Sub pid 1778 thread Civ6Sub:cs0 pid 1781
[49266.138580] [drm] GPU recovery disabled.
[49275.866518] INFO: task Xorg:sh1:1789 blocked for more than 122 seconds.
[49275.866521]       Tainted: G  R        O      5.2.10 #2

radeon 7970.=20
mesa utils(8.4.0-1)
linux 5.2.10
amdgpu Version: 18.1.99+git20190207-1

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15692722100.298D85A2.1407
Date: Mon, 23 Sep 2019 20:56:50 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - System resumes failed and hits [drm:amdgpu=
_job_timedout [amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110457#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - System resumes failed and hits [drm:amdgpu=
_job_timedout [amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110457">bug 11045=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
darkshvein&#64;gmail.com" title=3D"darkshvein &lt;darkshvein&#64;gmail.com&=
gt;"> <span class=3D"fn">darkshvein</span></a>
</span></b>
        <pre>Hello.
please, explain.=20
Why I work fine with FX-8320 CPU,
but after Ryzen r5 1600 upgrade, I see this OS freezes and bug?

is pcie generation any cause? planned obsolescence?
or coincidence with amdgpu driver update?


part of my log:
[49266.138534] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout,
signaled seq=3D5660155, emitted seq=3D5660157
[49266.138578] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process informati=
on:
process Civ6Sub pid 1778 thread Civ6Sub:cs0 pid 1781
[49266.138580] [drm] GPU recovery disabled.
[49275.866518] INFO: task Xorg:sh1:1789 blocked for more than 122 seconds.
[49275.866521]       Tainted: G  R        O      5.2.10 #2

radeon 7970.=20
mesa utils(8.4.0-1)
linux 5.2.10
amdgpu Version: 18.1.99+git20190207-1</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15692722100.298D85A2.1407--

--===============1701903461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1701903461==--
