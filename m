Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FE7F377F
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 19:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCE56E517;
	Thu,  7 Nov 2019 18:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C5F06E517
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 18:47:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8F72D720E2; Thu,  7 Nov 2019 18:47:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111762] RX 5700 XT Navi - amdgpu.ppfeaturemask=0xffffffff
 causes stuttering and does not unlock clock/voltage/power controls
Date: Thu, 07 Nov 2019 18:47:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mcoffin13@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111762-502-wKytKLO5Ob@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111762-502@http.bugs.freedesktop.org/>
References: <bug-111762-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0776220528=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0776220528==
Content-Type: multipart/alternative; boundary="15731524230.c60B.16305"
Content-Transfer-Encoding: 7bit


--15731524230.c60B.16305
Date: Thu, 7 Nov 2019 18:47:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111762

--- Comment #7 from Matt Coffin <mcoffin13@gmail.com> ---
This patch should take care of the problem by treating navi10's TDPODLimit =
the
same as vega20 does: https://patchwork.freedesktop.org/series/69090/

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15731524230.c60B.16305
Date: Thu, 7 Nov 2019 18:47:03 +0000
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
   title=3D"NEW - RX 5700 XT Navi - amdgpu.ppfeaturemask=3D0xffffffff cause=
s stuttering and does not unlock clock/voltage/power controls"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111762#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 5700 XT Navi - amdgpu.ppfeaturemask=3D0xffffffff cause=
s stuttering and does not unlock clock/voltage/power controls"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111762">bug 11176=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mcoffin13&#64;gmail.com" title=3D"Matt Coffin &lt;mcoffin13&#64;gmail.com&g=
t;"> <span class=3D"fn">Matt Coffin</span></a>
</span></b>
        <pre>This patch should take care of the problem by treating navi10'=
s TDPODLimit the
same as vega20 does: <a href=3D"https://patchwork.freedesktop.org/series/69=
090/">https://patchwork.freedesktop.org/series/69090/</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15731524230.c60B.16305--

--===============0776220528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0776220528==--
