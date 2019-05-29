Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1130D2E31C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 19:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68816E0D6;
	Wed, 29 May 2019 17:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2C8B86E0BF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 17:23:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 252FE72167; Wed, 29 May 2019 17:23:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 21509] libdrm's drmOpenOnce() fd cache stale on X server restart
Date: Wed, 29 May 2019 17:23:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: libdrm
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ajax@nwnk.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WONTFIX
X-Bugzilla-Priority: low
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-21509-502-HA9I2iR0kF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-21509-502@http.bugs.freedesktop.org/>
References: <bug-21509-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0886060985=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0886060985==
Content-Type: multipart/alternative; boundary="15591506340.0f8E.26304"
Content-Transfer-Encoding: 7bit


--15591506340.0f8E.26304
Date: Wed, 29 May 2019 17:23:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D21509

Adam Jackson <ajax@nwnk.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #2 from Adam Jackson <ajax@nwnk.net> ---
drmOpenOnce is now only ever called from the DRI1 loader in Mesa's libGL, w=
hich
is essentially unsupported since there haven't been DRI1 drivers in 7+ year=
s.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15591506340.0f8E.26304
Date: Wed, 29 May 2019 17:23:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:ajax&#64;=
nwnk.net" title=3D"Adam Jackson &lt;ajax&#64;nwnk.net&gt;"> <span class=3D"=
fn">Adam Jackson</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WONTFIX - libdrm's drmOpenOnce() fd cache stale on X s=
erver restart"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D21509">bug 21509<=
/a>
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
           <td>WONTFIX
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WONTFIX - libdrm's drmOpenOnce() fd cache stale on X s=
erver restart"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D21509#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WONTFIX - libdrm's drmOpenOnce() fd cache stale on X s=
erver restart"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D21509">bug 21509<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ajax&#64;nwnk.net" title=3D"Adam Jackson &lt;ajax&#64;nwnk.net&gt;"> <span =
class=3D"fn">Adam Jackson</span></a>
</span></b>
        <pre>drmOpenOnce is now only ever called from the DRI1 loader in Me=
sa's libGL, which
is essentially unsupported since there haven't been DRI1 drivers in 7+ year=
s.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15591506340.0f8E.26304--

--===============0886060985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0886060985==--
