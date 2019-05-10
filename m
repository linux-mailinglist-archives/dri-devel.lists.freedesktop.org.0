Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC41988F
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 08:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FF689B99;
	Fri, 10 May 2019 06:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 39DD6898BF
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 06:43:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 367587215A; Fri, 10 May 2019 06:43:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 101473] (SI) latest stable & cant boot
Date: Fri, 10 May 2019 06:43:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: qmastery16@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-101473-502-ivKNbbsxeu@http.bugs.freedesktop.org/>
In-Reply-To: <bug-101473-502@http.bugs.freedesktop.org/>
References: <bug-101473-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2112108951=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2112108951==
Content-Type: multipart/alternative; boundary="15574706211.FABfdE.15692"
Content-Transfer-Encoding: 7bit


--15574706211.FABfdE.15692
Date: Fri, 10 May 2019 06:43:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101473

qmastery16@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|REOPENED                    |RESOLVED

--- Comment #8 from qmastery16@gmail.com ---
Our problem was caused by the opensource coreboot BIOS incorrectly initiali=
zing
the discrete GPU. These unofficial patches are solving our problem -
https://review.coreboot.org/c/coreboot/+/31929/ . And here is our latest
board-status report, containing a new kernel log and other useful info -
https://coreboot.org/status/board-status.html#lenovo/g505s . So this issue
could be closed - and if someone has a similar problem he could reopen,
although maybe it's better to do a fresh start by creating a new issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574706211.FABfdE.15692
Date: Fri, 10 May 2019 06:43:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:qmastery1=
6&#64;gmail.com" title=3D"qmastery16&#64;gmail.com">qmastery16&#64;gmail.co=
m</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - (SI) latest stable &amp; cant boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101473">bug 10147=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>REOPENED
           </td>
           <td>RESOLVED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - (SI) latest stable &amp; cant boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101473#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - (SI) latest stable &amp; cant boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101473">bug 10147=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
qmastery16&#64;gmail.com" title=3D"qmastery16&#64;gmail.com">qmastery16&#64=
;gmail.com</a>
</span></b>
        <pre>Our problem was caused by the opensource coreboot BIOS incorre=
ctly initializing
the discrete GPU. These unofficial patches are solving our problem -
<a href=3D"https://review.coreboot.org/c/coreboot/+/31929/">https://review.=
coreboot.org/c/coreboot/+/31929/</a> . And here is our latest
board-status report, containing a new kernel log and other useful info -
<a href=3D"https://coreboot.org/status/board-status.html#lenovo/g505s">http=
s://coreboot.org/status/board-status.html#lenovo/g505s</a> . So this issue
could be closed - and if someone has a similar problem he could reopen,
although maybe it's better to do a fresh start by creating a new issue.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574706211.FABfdE.15692--

--===============2112108951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2112108951==--
