Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B922D58AE9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 21:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56166E4A2;
	Thu, 27 Jun 2019 19:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 72CBB6E440
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 19:22:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 64A6A72167; Thu, 27 Jun 2019 19:22:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108917] gamma adjustments cause stuttering with amdgpu.dc=1,
 especially problematic with RedShift etc.
Date: Thu, 27 Jun 2019 19:22:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108917-502-a3jlowOZ6i@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108917-502@http.bugs.freedesktop.org/>
References: <bug-108917-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0550717385=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0550717385==
Content-Type: multipart/alternative; boundary="15616633750.bCD2Ef.2454"
Content-Transfer-Encoding: 7bit


--15616633750.bCD2Ef.2454
Date: Thu, 27 Jun 2019 19:22:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108917

--- Comment #14 from tempel.julian@gmail.com ---
Well, it's always atomic modesetting that breaks downstream.

Some fixes for 5.1 definitely seem to have improved the situation, as curre=
nt
drm-next 440e80ce02cde7b810e4eb555768c2d77e7a27c8 shows the severe RedShift
phase stutter again which 5.1.15 does not. Going to retest with 5.3-rc1 or =
5.2.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15616633750.bCD2Ef.2454
Date: Thu, 27 Jun 2019 19:22:55 +0000
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
   title=3D"NEW - gamma adjustments cause stuttering with amdgpu.dc=3D1, es=
pecially problematic with RedShift etc."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108917#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gamma adjustments cause stuttering with amdgpu.dc=3D1, es=
pecially problematic with RedShift etc."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108917">bug 10891=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>Well, it's always atomic modesetting that breaks downstream.

Some fixes for 5.1 definitely seem to have improved the situation, as curre=
nt
drm-next 440e80ce02cde7b810e4eb555768c2d77e7a27c8 shows the severe RedShift
phase stutter again which 5.1.15 does not. Going to retest with 5.3-rc1 or =
5.2.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15616633750.bCD2Ef.2454--

--===============0550717385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0550717385==--
