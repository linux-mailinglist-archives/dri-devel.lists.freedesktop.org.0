Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F686FC89
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 11:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3752A89BAE;
	Mon, 22 Jul 2019 09:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B407489BAE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 09:46:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A998272167; Mon, 22 Jul 2019 09:46:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110258] Lenovo V110-15AST AMD A9-9410  AMD R5 Stoney hangs
 after waking after suspend. 5.0-5.1rc2
Date: Mon, 22 Jul 2019 09:46:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: pmw.gover@yahoo.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: rep_platform
Message-ID: <bug-110258-502-p28kRGfBca@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110258-502@http.bugs.freedesktop.org/>
References: <bug-110258-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1970160918=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1970160918==
Content-Type: multipart/alternative; boundary="15637888010.F7465B65.16887"
Content-Transfer-Encoding: 7bit


--15637888010.F7465B65.16887
Date: Mon, 22 Jul 2019 09:46:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110258

Paul Gover <pmw.gover@yahoo.co.uk> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Hardware|Other                       |x86-64 (AMD64)

--- Comment #9 from Paul Gover <pmw.gover@yahoo.co.uk> ---
I've changed the "Hardware" from Other to AMD64 in the hope someone might
actually look at this bug.  It's been open for almost 4 months, and so far
nothing's happened.

For anyone wanting a bypass, the only one that works for me is to use the l=
ast
kernel release (4.20.17) before 5.0 came out.  The latest LTS (long term
stable) kernel before 5.0 is 4.19.60, but that exhibited strange lockups and
performance issues when I tried it.

This leaves a choice of (a) running kernel 4.20.17, which is out of support,
and therefore missing security fixes or (b) going without suspend, which is=
 a
severe limitation on a laptop; hibernate doesn't work on any kernel I've tr=
ied,
so the only alternative to a flat battery is shutdown/reboot.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15637888010.F7465B65.16887
Date: Mon, 22 Jul 2019 09:46:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pmw.gover=
&#64;yahoo.co.uk" title=3D"Paul Gover &lt;pmw.gover&#64;yahoo.co.uk&gt;"> <=
span class=3D"fn">Paul Gover</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Lenovo V110-15AST AMD A9-9410 AMD R5 Stoney hangs after w=
aking after suspend. 5.0-5.1rc2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110258">bug 11025=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Hardware</td>
           <td>Other
           </td>
           <td>x86-64 (AMD64)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Lenovo V110-15AST AMD A9-9410 AMD R5 Stoney hangs after w=
aking after suspend. 5.0-5.1rc2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110258#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Lenovo V110-15AST AMD A9-9410 AMD R5 Stoney hangs after w=
aking after suspend. 5.0-5.1rc2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110258">bug 11025=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pmw.gover&#64;yahoo.co.uk" title=3D"Paul Gover &lt;pmw.gover&#64;yahoo.co.u=
k&gt;"> <span class=3D"fn">Paul Gover</span></a>
</span></b>
        <pre>I've changed the &quot;Hardware&quot; from Other to AMD64 in t=
he hope someone might
actually look at this bug.  It's been open for almost 4 months, and so far
nothing's happened.

For anyone wanting a bypass, the only one that works for me is to use the l=
ast
kernel release (4.20.17) before 5.0 came out.  The latest LTS (long term
stable) kernel before 5.0 is 4.19.60, but that exhibited strange lockups and
performance issues when I tried it.

This leaves a choice of (a) running kernel 4.20.17, which is out of support,
and therefore missing security fixes or (b) going without suspend, which is=
 a
severe limitation on a laptop; hibernate doesn't work on any kernel I've tr=
ied,
so the only alternative to a flat battery is shutdown/reboot.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15637888010.F7465B65.16887--

--===============1970160918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1970160918==--
