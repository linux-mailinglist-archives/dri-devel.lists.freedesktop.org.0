Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6EF257A2
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 20:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843A1892C9;
	Tue, 21 May 2019 18:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81B73890B6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 18:35:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7B83E72167; Tue, 21 May 2019 18:35:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108824] Invalid handling when GL buffer is bound on one context
 and invalidated on another
Date: Tue, 21 May 2019 18:35:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maraeo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-108824-502-Dssi1cGAPV@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0199058724=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0199058724==
Content-Type: multipart/alternative; boundary="15584637302.59c56Ab2.11817"
Content-Transfer-Encoding: 7bit


--15584637302.59c56Ab2.11817
Date: Tue, 21 May 2019 18:35:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108824

--- Comment #12 from Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> ---
Created attachment 144312
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144312&action=3Dedit
likely fix

This patch should fix it. Thanks to Pierre-Eric for inspiring it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15584637302.59c56Ab2.11817
Date: Tue, 21 May 2019 18:35:30 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108824#c12">Comme=
nt # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Invalid handling when GL buffer is bound on one context a=
nd invalidated on another"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108824">bug 10882=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
maraeo&#64;gmail.com" title=3D"Marek Ol=C5=A1=C3=A1k &lt;maraeo&#64;gmail.c=
om&gt;"> <span class=3D"fn">Marek Ol=C5=A1=C3=A1k</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144312=
" name=3D"attach_144312" title=3D"likely fix">attachment 144312</a> <a href=
=3D"attachment.cgi?id=3D144312&amp;action=3Dedit" title=3D"likely fix">[det=
ails]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D108824&am=
p;attachment=3D144312'>[review]</a>
likely fix

This patch should fix it. Thanks to Pierre-Eric for inspiring it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15584637302.59c56Ab2.11817--

--===============0199058724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0199058724==--
