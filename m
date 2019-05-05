Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0460A141DA
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2019 20:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FC2892B0;
	Sun,  5 May 2019 18:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0195892B0
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 18:31:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CC16B7215A; Sun,  5 May 2019 18:31:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110371] HP Dreamcolor display *Error* No EDID read
Date: Sun, 05 May 2019 18:31:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Babblebones@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110371-502-SHafxNcnZW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110371-502@http.bugs.freedesktop.org/>
References: <bug-110371-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0407872490=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0407872490==
Content-Type: multipart/alternative; boundary="15570811041.A6Af626.18750"
Content-Transfer-Encoding: 7bit


--15570811041.A6Af626.18750
Date: Sun, 5 May 2019 18:31:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110371

--- Comment #9 from Babblebones@gmail.com ---
I've found the exact commit!

https://lists.freedesktop.org/archives/amd-gfx/2018-July/023920.html

Fixes the issue against a few kernels affected but my issue is that the code
base has been modified so heavily while retaining the same behavior that I
can't apply this to kernel 5.2 linux-stable git.

I can't even discern where to manually edit the related files to change the
behavior.

It may be necessary to include another fix that that list of related patche=
s to
fix the behavior for my connector/ panel. Not a programmer myself so I'm not
sure what's supposed to happen here.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15570811041.A6Af626.18750
Date: Sun, 5 May 2019 18:31:44 +0000
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
   title=3D"NEW - HP Dreamcolor display *Error* No EDID read"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110371#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP Dreamcolor display *Error* No EDID read"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110371">bug 11037=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Babblebones&#64;gmail.com" title=3D"Babblebones&#64;gmail.com">Babblebones&=
#64;gmail.com</a>
</span></b>
        <pre>I've found the exact commit!

<a href=3D"https://lists.freedesktop.org/archives/amd-gfx/2018-July/023920.=
html">https://lists.freedesktop.org/archives/amd-gfx/2018-July/023920.html<=
/a>

Fixes the issue against a few kernels affected but my issue is that the code
base has been modified so heavily while retaining the same behavior that I
can't apply this to kernel 5.2 linux-stable git.

I can't even discern where to manually edit the related files to change the
behavior.

It may be necessary to include another fix that that list of related patche=
s to
fix the behavior for my connector/ panel. Not a programmer myself so I'm not
sure what's supposed to happen here.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15570811041.A6Af626.18750--

--===============0407872490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0407872490==--
