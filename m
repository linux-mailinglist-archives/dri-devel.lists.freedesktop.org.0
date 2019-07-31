Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BDD7B865
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 06:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA616E66D;
	Wed, 31 Jul 2019 04:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 508C56E66E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 04:05:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4D30372167; Wed, 31 Jul 2019 04:05:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109887] vega56 undervolting/overclocking voltage issues
Date: Wed, 31 Jul 2019 04:05:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109887-502-WP0imI3iIM@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109887-502@http.bugs.freedesktop.org/>
References: <bug-109887-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0434587714=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0434587714==
Content-Type: multipart/alternative; boundary="15645459502.b873646.26711"
Content-Transfer-Encoding: 7bit


--15645459502.b873646.26711
Date: Wed, 31 Jul 2019 04:05:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109887

--- Comment #8 from Andrew Sheldon <asheldon55@gmail.com> ---
I also can confirm the problem, and it seems to have gotten worse since
5.3.0-rcX.

In past kernels, you could kind of work around it by setting slightly less
conservative undervolts and it would work. If you go past a certain point (a
point that works fine if the pp table is overridden), it would wrap around =
to
1.2V. For reference this around 950mv at state 6/7.

Now with 5.3, even that same relatively conservative undervolt would
immediately jump to 1.2V under load.

As hagar-dunor suggested, manually overriding the entire PP table, works ar=
ound
the problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15645459502.b873646.26711
Date: Wed, 31 Jul 2019 04:05:50 +0000
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
   title=3D"NEW - vega56 undervolting/overclocking voltage issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109887#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vega56 undervolting/overclocking voltage issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109887">bug 10988=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>I also can confirm the problem, and it seems to have gotten wo=
rse since
5.3.0-rcX.

In past kernels, you could kind of work around it by setting slightly less
conservative undervolts and it would work. If you go past a certain point (a
point that works fine if the pp table is overridden), it would wrap around =
to
1.2V. For reference this around 950mv at state 6/7.

Now with 5.3, even that same relatively conservative undervolt would
immediately jump to 1.2V under load.

As hagar-dunor suggested, manually overriding the entire PP table, works ar=
ound
the problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15645459502.b873646.26711--

--===============0434587714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0434587714==--
