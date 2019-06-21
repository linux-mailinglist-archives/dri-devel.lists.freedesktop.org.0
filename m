Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9804EFF4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 22:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12556E922;
	Fri, 21 Jun 2019 20:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5FC256E923
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 20:18:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5CA3A72167; Fri, 21 Jun 2019 20:18:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Fri, 21 Jun 2019 20:18:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mcoffin13@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-kIcvmJDsMV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1297699148=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1297699148==
Content-Type: multipart/alternative; boundary="15611483193.6CFD6.3418"
Content-Transfer-Encoding: 7bit


--15611483193.6CFD6.3418
Date: Fri, 21 Jun 2019 20:18:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #43 from Matt Coffin <mcoffin13@gmail.com> ---
(In reply to Matt Coffin from comment #42)
> For what it's worth, I've experienced a bunch of issues similar to this w=
ith
> OVERDRIVE enabled. You can try disabling it by setting the following in
> modprobe.d or your kernel launch line
>=20
> amdgpu.ppfeaturemask=3D0xfffdbfff

Also worth noting that I've found that using `fancontrol` creates a race
condition if you have the OD fuzzy fan control enabled, so try just maxing =
out
the fans via the sysfs hwmon interface instead just as a test.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15611483193.6CFD6.3418
Date: Fri, 21 Jun 2019 20:18:39 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c43">Comme=
nt # 43</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mcoffin13&#64;gmail.com" title=3D"Matt Coffin &lt;mcoffin13&#64;gmail.com&g=
t;"> <span class=3D"fn">Matt Coffin</span></a>
</span></b>
        <pre>(In reply to Matt Coffin from <a href=3D"show_bug.cgi?id=3D110=
674#c42">comment #42</a>)
<span class=3D"quote">&gt; For what it's worth, I've experienced a bunch of=
 issues similar to this with
&gt; OVERDRIVE enabled. You can try disabling it by setting the following in
&gt; modprobe.d or your kernel launch line
&gt;=20
&gt; amdgpu.ppfeaturemask=3D0xfffdbfff</span >

Also worth noting that I've found that using `fancontrol` creates a race
condition if you have the OD fuzzy fan control enabled, so try just maxing =
out
the fans via the sysfs hwmon interface instead just as a test.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15611483193.6CFD6.3418--

--===============1297699148==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1297699148==--
