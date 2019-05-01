Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0306910EF3
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 00:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A7C89178;
	Wed,  1 May 2019 22:24:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9B85189178
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 22:24:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 91EB07215A; Wed,  1 May 2019 22:24:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110443] vaapi/vpp: wrong output for non 64-bytes align width
 (ex: 1200)
Date: Wed, 01 May 2019 22:24:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: viktor_jaegerskuepper@freenet.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-110443-502-N8wx9k5M99@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110443-502@http.bugs.freedesktop.org/>
References: <bug-110443-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1607430586=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1607430586==
Content-Type: multipart/alternative; boundary="15567494410.4B8ee2136.3161"
Content-Transfer-Encoding: 7bit


--15567494410.4B8ee2136.3161
Date: Wed, 1 May 2019 22:24:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110443

Viktor J=C3=A4gersk=C3=BCpper <viktor_jaegerskuepper@freenet.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |viktor_jaegerskuepper@freen
                   |                            |et.de

--- Comment #7 from Viktor J=C3=A4gersk=C3=BCpper <viktor_jaegerskuepper@fr=
eenet.de> ---
After commit 0e3a348bec436b9d949e85574e363a1fe0e7683c VLC crashes when I wa=
nt
to play a video encoded in H.264 using VA-API. I have an AMD RV770, OS is A=
rch
Linux. From the merge request I see that there is an additional commit for
radeonsi to fix this bug, but not for r600. Since this bug is not closed ye=
t,
is another commit for r600 necessary to not break that driver? Or should I =
open
another bug report for the crash?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15567494410.4B8ee2136.3161
Date: Wed, 1 May 2019 22:24:01 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:viktor_ja=
egerskuepper&#64;freenet.de" title=3D"Viktor J=C3=A4gersk=C3=BCpper &lt;vik=
tor_jaegerskuepper&#64;freenet.de&gt;"> <span class=3D"fn">Viktor J=C3=A4ge=
rsk=C3=BCpper</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vaapi/vpp: wrong output for non 64-bytes align width (ex:=
 1200)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110443">bug 11044=
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
           <td>viktor_jaegerskuepper&#64;freenet.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vaapi/vpp: wrong output for non 64-bytes align width (ex:=
 1200)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110443#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - vaapi/vpp: wrong output for non 64-bytes align width (ex:=
 1200)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110443">bug 11044=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
viktor_jaegerskuepper&#64;freenet.de" title=3D"Viktor J=C3=A4gersk=C3=BCppe=
r &lt;viktor_jaegerskuepper&#64;freenet.de&gt;"> <span class=3D"fn">Viktor =
J=C3=A4gersk=C3=BCpper</span></a>
</span></b>
        <pre>After commit 0e3a348bec436b9d949e85574e363a1fe0e7683c VLC cras=
hes when I want
to play a video encoded in H.264 using VA-API. I have an AMD RV770, OS is A=
rch
Linux. From the merge request I see that there is an additional commit for
radeonsi to fix this bug, but not for r600. Since this bug is not closed ye=
t,
is another commit for r600 necessary to not break that driver? Or should I =
open
another bug report for the crash?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15567494410.4B8ee2136.3161--

--===============1607430586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1607430586==--
