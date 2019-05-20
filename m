Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1FE238AA
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 15:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EB989295;
	Mon, 20 May 2019 13:47:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A8FF0892A9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 13:47:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A5AA872167; Mon, 20 May 2019 13:47:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108824] Invalid handling when GL buffer is bound on one context
 and invalidated on another
Date: Mon, 20 May 2019 13:47:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lonewolf@xs4all.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108824-502-FcTIwpXnvB@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108824-502@http.bugs.freedesktop.org/>
References: <bug-108824-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1297676252=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1297676252==
Content-Type: multipart/alternative; boundary="15583600523.8fCe52c.15650"
Content-Transfer-Encoding: 7bit


--15583600523.8fCe52c.15650
Date: Mon, 20 May 2019 13:47:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108824

--- Comment #9 from LoneVVolf <lonewolf@xs4all.nl> ---
reverting commit
https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D78e35df52aa2f7d770f929a=
0866a0faa89c261a9
solves the visual corruption and gets rid of the gpu fault messages in dmes=
g.

As that commit is 2/2 of the patchset referenced in commit #4 , it does look
like this introduces new errors.
see https://bugs.freedesktop.org/show_bug.cgi?id=3D110701

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15583600523.8fCe52c.15650
Date: Mon, 20 May 2019 13:47:32 +0000
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
   title=3D"NEW - Invalid handling when GL buffer is bound on one context a=
nd invalidated on another"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108824#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Invalid handling when GL buffer is bound on one context a=
nd invalidated on another"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108824">bug 10882=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lonewolf&#64;xs4all.nl" title=3D"LoneVVolf &lt;lonewolf&#64;xs4all.nl&gt;">=
 <span class=3D"fn">LoneVVolf</span></a>
</span></b>
        <pre>reverting commit
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D78e35df52aa2=
f7d770f929a0866a0faa89c261a9">https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3D78e35df52aa2f7d770f929a0866a0faa89c261a9</a>
solves the visual corruption and gets rid of the gpu fault messages in dmes=
g.

As that commit is 2/2 of the patchset referenced in commit #4 , it does look
like this introduces new errors.
see <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU faults in in Unigine Valley 1.0"
   href=3D"show_bug.cgi?id=3D110701">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110701</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15583600523.8fCe52c.15650--

--===============1297676252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1297676252==--
