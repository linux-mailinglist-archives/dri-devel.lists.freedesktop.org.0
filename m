Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE4D58113
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 13:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF156E0CF;
	Thu, 27 Jun 2019 11:02:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A73676E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 11:02:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A399772167; Thu, 27 Jun 2019 11:02:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108917] gamma adjustments cause stuttering with amdgpu.dc=1,
 especially problematic with RedShift etc.
Date: Thu, 27 Jun 2019 11:02:26 +0000
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
Message-ID: <bug-108917-502-THgmWyW1za@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0162261170=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0162261170==
Content-Type: multipart/alternative; boundary="15616333461.C453c45C.5794"
Content-Transfer-Encoding: 7bit


--15616333461.C453c45C.5794
Date: Thu, 27 Jun 2019 11:02:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108917

--- Comment #12 from tempel.julian@gmail.com ---
It seems some recent (kernel?) updates have mitigated the issue a lot when
running "redshift -t 4500:4500 -l 1:1", the transition phase is now free of
stutter. After that, there is still regular stutter though for subsequent g=
amma
adjustments by RedShift when Compton with vsync is active.

What is really interesting: There is kwin-lowlatency as a kwin fork with vs=
ync
adjustments:
https://github.com/tildearrow/kwin-lowlatency
With its compositing, the performance issues of atomic modesetting seem to =
be
entirely missing. There is zero stutter when opening windows etc., and also
continuous RedShift adjustments don't stutter. At the same time, there is z=
ero
tearing.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15616333461.C453c45C.5794
Date: Thu, 27 Jun 2019 11:02:26 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108917#c12">Comme=
nt # 12</a>
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
        <pre>It seems some recent (kernel?) updates have mitigated the issu=
e a lot when
running &quot;redshift -t 4500:4500 -l 1:1&quot;, the transition phase is n=
ow free of
stutter. After that, there is still regular stutter though for subsequent g=
amma
adjustments by RedShift when Compton with vsync is active.

What is really interesting: There is kwin-lowlatency as a kwin fork with vs=
ync
adjustments:
<a href=3D"https://github.com/tildearrow/kwin-lowlatency">https://github.co=
m/tildearrow/kwin-lowlatency</a>
With its compositing, the performance issues of atomic modesetting seem to =
be
entirely missing. There is zero stutter when opening windows etc., and also
continuous RedShift adjustments don't stutter. At the same time, there is z=
ero
tearing.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15616333461.C453c45C.5794--

--===============0162261170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0162261170==--
