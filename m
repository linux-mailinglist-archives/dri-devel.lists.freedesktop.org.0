Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC29584DD7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 15:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D966E6DA;
	Wed,  7 Aug 2019 13:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 55E5A6E6EC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 13:48:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5244572167; Wed,  7 Aug 2019 13:48:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111244] amdgpu kernel 5.2 blank display after resume from suspend
Date: Wed, 07 Aug 2019 13:48:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cspack@verizon.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111244-502-vHWOj3SIL4@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111244-502@http.bugs.freedesktop.org/>
References: <bug-111244-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0002732556=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0002732556==
Content-Type: multipart/alternative; boundary="15651857083.766d5.25999"
Content-Transfer-Encoding: 7bit


--15651857083.766d5.25999
Date: Wed, 7 Aug 2019 13:48:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111244

--- Comment #21 from cspack@verizon.net ---
The default is -1 according to the docs and /sys/module/amdgpu/parameters/d=
c. I
assume it should effectively be the same but it seems to result in different
behavior vs. setting it to 1. DC is enabled in both cases (the log shows
"Display Core initialized"), but setting it to default results in a
suspend/resume failure 100% of the time. Whereas setting it to 1 results in
success most of time, although it did fail eventually after several reboots.
Very strange.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15651857083.766d5.25999
Date: Wed, 7 Aug 2019 13:48:28 +0000
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
   title=3D"NEW - amdgpu kernel 5.2 blank display after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244#c21">Comme=
nt # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu kernel 5.2 blank display after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244">bug 11124=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cspack&#64;verizon.net" title=3D"cspack&#64;verizon.net">cspack&#64;verizon=
.net</a>
</span></b>
        <pre>The default is -1 according to the docs and /sys/module/amdgpu=
/parameters/dc. I
assume it should effectively be the same but it seems to result in different
behavior vs. setting it to 1. DC is enabled in both cases (the log shows
&quot;Display Core initialized&quot;), but setting it to default results in=
 a
suspend/resume failure 100% of the time. Whereas setting it to 1 results in
success most of time, although it did fail eventually after several reboots.
Very strange.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15651857083.766d5.25999--

--===============0002732556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0002732556==--
