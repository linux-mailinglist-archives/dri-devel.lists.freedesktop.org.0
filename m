Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 226ABA0996
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 20:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4FC89D02;
	Wed, 28 Aug 2019 18:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E83B9894DD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 18:35:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D945A72161; Wed, 28 Aug 2019 18:35:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111077] link_shader and deserialize_glsl_program suddenly
 consume huge amount of RAM
Date: Wed, 28 Aug 2019 18:35:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: bisected
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: mattst88@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc keywords
Message-ID: <bug-111077-502-JYyuClDL0E@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111077-502@http.bugs.freedesktop.org/>
References: <bug-111077-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1996719225=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1996719225==
Content-Type: multipart/alternative; boundary="15670173020.D5192Af85.26438"
Content-Transfer-Encoding: 7bit


--15670173020.D5192Af85.26438
Date: Wed, 28 Aug 2019 18:35:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111077

Matt Turner <mattst88@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |maraeo@gmail.com
           Keywords|                            |bisected

--- Comment #20 from Matt Turner <mattst88@gmail.com> ---
Great. We've got a bisect, and reverting the commit from 19.0.8 fixes the
issue.

commit 9176703788c66de8287c6224650b1ff8d4238126
Author: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
Date:   Wed Aug 8 15:37:21 2018 -0400

    radeonsi: increase the maximum UBO size to 2 GB

    Same as the closed driver.

    This causes a failure in GL45-CTS.compute_shader.max, which has a trivi=
al
    bug.

    Tested-by: Dieter N=C3=BCtzel <Dieter@nuetzel-hh.de>

(see https://bugs.gentoo.org/690066#c33)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15670173020.D5192Af85.26438
Date: Wed, 28 Aug 2019 18:35:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:mattst88&=
#64;gmail.com" title=3D"Matt Turner &lt;mattst88&#64;gmail.com&gt;"> <span =
class=3D"fn">Matt Turner</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>maraeo&#64;gmail.com
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Keywords</td>
           <td>
               &nbsp;
           </td>
           <td>bisected
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - link_shader and deserialize_glsl_program suddenly consume=
 huge amount of RAM"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111077">bug 11107=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mattst88&#64;gmail.com" title=3D"Matt Turner &lt;mattst88&#64;gmail.com&gt;=
"> <span class=3D"fn">Matt Turner</span></a>
</span></b>
        <pre>Great. We've got a bisect, and reverting the commit from 19.0.=
8 fixes the
issue.

commit 9176703788c66de8287c6224650b1ff8d4238126
Author: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak&#64;amd.com=
">marek.olsak&#64;amd.com</a>&gt;
Date:   Wed Aug 8 15:37:21 2018 -0400

    radeonsi: increase the maximum UBO size to 2 GB

    Same as the closed driver.

    This causes a failure in GL45-CTS.compute_shader.max, which has a trivi=
al
    bug.

    Tested-by: Dieter N=C3=BCtzel &lt;<a href=3D"mailto:Dieter&#64;nuetzel-=
hh.de">Dieter&#64;nuetzel-hh.de</a>&gt;

(see <a href=3D"https://bugs.gentoo.org/690066#c33">https://bugs.gentoo.org=
/690066#c33</a>)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15670173020.D5192Af85.26438--

--===============1996719225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1996719225==--
