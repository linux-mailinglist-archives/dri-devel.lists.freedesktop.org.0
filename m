Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B957E27F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 20:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB9A6E771;
	Thu,  1 Aug 2019 18:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 227256E772
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 18:44:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1F6DA72167; Thu,  1 Aug 2019 18:44:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110413] GPU crash and failed reset leading to deadlock on
 Polaris 22 XL [Radeon RX Vega M GL]
Date: Thu, 01 Aug 2019 18:44:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: proje.pdf@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-110413-502-WTnv8ZoUAn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110413-502@http.bugs.freedesktop.org/>
References: <bug-110413-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0042155208=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0042155208==
Content-Type: multipart/alternative; boundary="15646850811.bAB14dB2F.26851"
Content-Transfer-Encoding: 7bit


--15646850811.bAB14dB2F.26851
Date: Thu, 1 Aug 2019 18:44:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110413

Utku Helvac=C4=B1 (tuxutku) <proje.pdf@outlook.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |proje.pdf@outlook.com

--- Comment #11 from Utku Helvac=C4=B1 (tuxutku) <proje.pdf@outlook.com> ---
Created attachment 144926
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144926&action=3Dedit
journalctl -b0 output on kernel 5.3.0-rc2 from ubuntu mainline repository, =
with
a system with rx 540 gpu

kernel 5.3.0-rc1 was just fine and was just fixed a long lasted regression =
on
rx 540 gpu, updating to 5.3.0-rc2 causes gpu to be disabled after launching=
 a
single application with it, gpu works fine until application is closed, then
DRI_PRIME=3D1 doesn't work

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15646850811.bAB14dB2F.26851
Date: Thu, 1 Aug 2019 18:44:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:proje.pdf=
&#64;outlook.com" title=3D"Utku Helvac=C4=B1 (tuxutku) &lt;proje.pdf&#64;ou=
tlook.com&gt;"> <span class=3D"fn">Utku Helvac=C4=B1 (tuxutku)</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU crash and failed reset leading to deadlock on Polaris=
 22 XL [Radeon RX Vega M GL]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110413">bug 11041=
3</a>
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
           <td>proje.pdf&#64;outlook.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU crash and failed reset leading to deadlock on Polaris=
 22 XL [Radeon RX Vega M GL]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110413#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU crash and failed reset leading to deadlock on Polaris=
 22 XL [Radeon RX Vega M GL]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110413">bug 11041=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
proje.pdf&#64;outlook.com" title=3D"Utku Helvac=C4=B1 (tuxutku) &lt;proje.p=
df&#64;outlook.com&gt;"> <span class=3D"fn">Utku Helvac=C4=B1 (tuxutku)</sp=
an></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144926=
" name=3D"attach_144926" title=3D"journalctl -b0 output on kernel 5.3.0-rc2=
 from ubuntu mainline repository, with a system with rx 540 gpu">attachment=
 144926</a> <a href=3D"attachment.cgi?id=3D144926&amp;action=3Dedit" title=
=3D"journalctl -b0 output on kernel 5.3.0-rc2 from ubuntu mainline reposito=
ry, with a system with rx 540 gpu">[details]</a></span>
journalctl -b0 output on kernel 5.3.0-rc2 from ubuntu mainline repository, =
with
a system with rx 540 gpu

kernel 5.3.0-rc1 was just fine and was just fixed a long lasted regression =
on
rx 540 gpu, updating to 5.3.0-rc2 causes gpu to be disabled after launching=
 a
single application with it, gpu works fine until application is closed, then
DRI_PRIME=3D1 doesn't work</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15646850811.bAB14dB2F.26851--

--===============0042155208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0042155208==--
