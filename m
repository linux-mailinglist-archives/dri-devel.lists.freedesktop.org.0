Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4524C23DFA
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 19:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5F889227;
	Mon, 20 May 2019 17:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC90989227
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 17:03:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B438172167; Mon, 20 May 2019 17:03:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110713] A Hat in Time: GPU hang with gallium nine
Date: Mon, 20 May 2019 17:03:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kiwii@lytoria.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-110713-502-7BsQ3sG993@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110713-502@http.bugs.freedesktop.org/>
References: <bug-110713-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0255409996=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0255409996==
Content-Type: multipart/alternative; boundary="15583718010.6E0742f6c.327"
Content-Transfer-Encoding: 7bit


--15583718010.6E0742f6c.327
Date: Mon, 20 May 2019 17:03:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110713

kiwii@lytoria.de changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kiwii@lytoria.de

--- Comment #1 from kiwii@lytoria.de ---
I'd like to add, besides the R9 270X, this also affects Vega (both traces h=
ang
my Vega 64) and Polaris (one user reports the chapter 1, act 4 hang to be 1=
00%
reproducible on his RX 580).

I can also confirm both traces to play fine on my card with AMD_DEBUG=3Dmon=
o on
mesa-git and R600_DEBUG=3Dmono on mesa 19.0.4.

With the NIR backend (R600_DEBUG=3Dnir) it still hangs the same way as with
default TGSI on both 19.0.4 and git.

Note: Both traces are recorded on x64 and may need to be replayed with x64
apitrace to prevent running out of memory during shader compilation.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15583718010.6E0742f6c.327
Date: Mon, 20 May 2019 17:03:21 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:kiwii&#64=
;lytoria.de" title=3D"kiwii&#64;lytoria.de">kiwii&#64;lytoria.de</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - A Hat in Time: GPU hang with gallium nine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110713">bug 11071=
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
           <td>kiwii&#64;lytoria.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - A Hat in Time: GPU hang with gallium nine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110713#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - A Hat in Time: GPU hang with gallium nine"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110713">bug 11071=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kiwii&#64;lytoria.de" title=3D"kiwii&#64;lytoria.de">kiwii&#64;lytoria.de</=
a>
</span></b>
        <pre>I'd like to add, besides the R9 270X, this also affects Vega (=
both traces hang
my Vega 64) and Polaris (one user reports the chapter 1, act 4 hang to be 1=
00%
reproducible on his RX 580).

I can also confirm both traces to play fine on my card with AMD_DEBUG=3Dmon=
o on
mesa-git and R600_DEBUG=3Dmono on mesa 19.0.4.

With the NIR backend (R600_DEBUG=3Dnir) it still hangs the same way as with
default TGSI on both 19.0.4 and git.

Note: Both traces are recorded on x64 and may need to be replayed with x64
apitrace to prevent running out of memory during shader compilation.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15583718010.6E0742f6c.327--

--===============0255409996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0255409996==--
