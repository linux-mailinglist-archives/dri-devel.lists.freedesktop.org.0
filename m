Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0A44B02
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69F08982E;
	Thu, 13 Jun 2019 18:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9BFC89811
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 18:45:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A788C72167; Thu, 13 Jun 2019 18:45:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105113] [hawaii, radeonsi, clover] Running Piglit
 cl/program/execute/{, tail-}calls{, -struct,
 -workitem-id}.cl cause GPU VM error and ring stalled GPU lockup
Date: Thu, 13 Jun 2019 18:45:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jv356@scarletmail.rutgers.edu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-105113-502-9yY23pfy5d@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105113-502@http.bugs.freedesktop.org/>
References: <bug-105113-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0299837644=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0299837644==
Content-Type: multipart/alternative; boundary="15604515545.E5cEc.3629"
Content-Transfer-Encoding: 7bit


--15604515545.E5cEc.3629
Date: Thu, 13 Jun 2019 18:45:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105113

Jan Vesely <jv356@scarletmail.rutgers.edu> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #13 from Jan Vesely <jv356@scarletmail.rutgers.edu> ---
Relocations are now handled in the new radeonsi linker (merged in
77b05cc42df29472a7852b90575a19e8991815cd and co.)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604515545.E5cEc.3629
Date: Thu, 13 Jun 2019 18:45:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:jv356&#64=
;scarletmail.rutgers.edu" title=3D"Jan Vesely &lt;jv356&#64;scarletmail.rut=
gers.edu&gt;"> <span class=3D"fn">Jan Vesely</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [hawaii, radeonsi, clover] Running Piglit cl/p=
rogram/execute/{,tail-}calls{,-struct,-workitem-id}.cl cause GPU VM error a=
nd ring stalled GPU lockup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105113">bug 10511=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [hawaii, radeonsi, clover] Running Piglit cl/p=
rogram/execute/{,tail-}calls{,-struct,-workitem-id}.cl cause GPU VM error a=
nd ring stalled GPU lockup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105113#c13">Comme=
nt # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [hawaii, radeonsi, clover] Running Piglit cl/p=
rogram/execute/{,tail-}calls{,-struct,-workitem-id}.cl cause GPU VM error a=
nd ring stalled GPU lockup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105113">bug 10511=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jv356&#64;scarletmail.rutgers.edu" title=3D"Jan Vesely &lt;jv356&#64;scarle=
tmail.rutgers.edu&gt;"> <span class=3D"fn">Jan Vesely</span></a>
</span></b>
        <pre>Relocations are now handled in the new radeonsi linker (merged=
 in
77b05cc42df29472a7852b90575a19e8991815cd and co.)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604515545.E5cEc.3629--

--===============0299837644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0299837644==--
