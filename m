Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5FDD873
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2019 13:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CDD89CF5;
	Sat, 19 Oct 2019 11:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CC8D89CF5
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 11:24:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 852CF720E2; Sat, 19 Oct 2019 11:24:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111913] AMD Navi10 GPU powerplay issues when using two
 DisplayPort connectors
Date: Sat, 19 Oct 2019 11:24:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan@rehm.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111913-502-1oevewCbWW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111913-502@http.bugs.freedesktop.org/>
References: <bug-111913-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0607620366=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0607620366==
Content-Type: multipart/alternative; boundary="15714842500.cc79D.4135"
Content-Transfer-Encoding: 7bit


--15714842500.cc79D.4135
Date: Sat, 19 Oct 2019 11:24:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111913

--- Comment #12 from Stefan Rehm <stefan@rehm.email> ---
If I change

dcn2_0_soc.dram_clock_change_latency_us

in "rivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c" from 404.0 to 10.0
(the value used in kernel 5.3) the messages disappear and the system behaves
normal again. However, as long as

/sys/class/drm/card0/device/power_dpm_force_performance_level

is set to "auto", I am now seeing massive flickering. Forcing it to low or =
high
fixes that.

According to the sources for kernel 5.3 the value of 10.0 for
dram_clock_change_latency is a hack. Can anyone elaborate on this?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15714842500.cc79D.4135
Date: Sat, 19 Oct 2019 11:24:10 +0000
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
   title=3D"NEW - AMD Navi10 GPU powerplay issues when using two DisplayPor=
t connectors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111913#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi10 GPU powerplay issues when using two DisplayPor=
t connectors"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111913">bug 11191=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stefan&#64;rehm.email" title=3D"Stefan Rehm &lt;stefan&#64;rehm.email&gt;">=
 <span class=3D"fn">Stefan Rehm</span></a>
</span></b>
        <pre>If I change

dcn2_0_soc.dram_clock_change_latency_us

in &quot;rivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c&quot; from 40=
4.0 to 10.0
(the value used in kernel 5.3) the messages disappear and the system behaves
normal again. However, as long as

/sys/class/drm/card0/device/power_dpm_force_performance_level

is set to &quot;auto&quot;, I am now seeing massive flickering. Forcing it =
to low or high
fixes that.

According to the sources for kernel 5.3 the value of 10.0 for
dram_clock_change_latency is a hack. Can anyone elaborate on this?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15714842500.cc79D.4135--

--===============0607620366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0607620366==--
