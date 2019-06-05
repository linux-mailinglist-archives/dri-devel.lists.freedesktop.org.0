Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA415362E7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 19:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C5D895CA;
	Wed,  5 Jun 2019 17:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B6E44895CA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 17:44:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B3E6072167; Wed,  5 Jun 2019 17:44:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110777] Kernel 5.1-5.2 MCLK stuck at 167MHz Vega 10 (56)
Date: Wed, 05 Jun 2019 17:44:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: antonh@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110777-502-2PRzK5Rzcy@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110777-502@http.bugs.freedesktop.org/>
References: <bug-110777-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1263489493=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1263489493==
Content-Type: multipart/alternative; boundary="15597566982.D1FB4843.5129"
Content-Transfer-Encoding: 7bit


--15597566982.D1FB4843.5129
Date: Wed, 5 Jun 2019 17:44:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110777

--- Comment #5 from Anton Herzfeld <antonh@gmx.de> ---
The following patch fixes the issue with boosting again:

https://cgit.freedesktop.org/~agd5f/linux/commit/drivers/gpu/drm/amd/powerp=
lay/hwmgr?h=3Damd-staging-drm-next&id=3D7d59c41b5150d0641203f91cfcaa0f9af59=
99cce

however it also seems to expose the issue in mclk not going down again once=
 it
has boosted.

just to clarify the issue occurs when using manual OD on mclk since kernel =
5.1.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597566982.D1FB4843.5129
Date: Wed, 5 Jun 2019 17:44:58 +0000
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
   title=3D"NEW - Kernel 5.1-5.2 MCLK stuck at 167MHz Vega 10 (56)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110777#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 5.1-5.2 MCLK stuck at 167MHz Vega 10 (56)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110777">bug 11077=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
antonh&#64;gmx.de" title=3D"Anton Herzfeld &lt;antonh&#64;gmx.de&gt;"> <spa=
n class=3D"fn">Anton Herzfeld</span></a>
</span></b>
        <pre>The following patch fixes the issue with boosting again:

<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/commit/drivers/gpu/drm=
/amd/powerplay/hwmgr?h=3Damd-staging-drm-next&amp;id=3D7d59c41b5150d0641203=
f91cfcaa0f9af5999cce">https://cgit.freedesktop.org/~agd5f/linux/commit/driv=
ers/gpu/drm/amd/powerplay/hwmgr?h=3Damd-staging-drm-next&amp;id=3D7d59c41b5=
150d0641203f91cfcaa0f9af5999cce</a>

however it also seems to expose the issue in mclk not going down again once=
 it
has boosted.

just to clarify the issue occurs when using manual OD on mclk since kernel =
5.1.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597566982.D1FB4843.5129--

--===============1263489493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1263489493==--
