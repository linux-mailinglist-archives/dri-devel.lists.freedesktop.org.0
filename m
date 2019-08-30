Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B36A3598
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 13:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C93F6E2BE;
	Fri, 30 Aug 2019 11:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7BC656E2BE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 11:22:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 73EBB721EE; Fri, 30 Aug 2019 11:22:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111211] Kernel 5.2.2+ introduced tearing, corruption and
 freezes with Raven Ridge 2500U
Date: Fri, 30 Aug 2019 11:22:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brauliobo@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-111211-502-JBKibasN1L@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111211-502@http.bugs.freedesktop.org/>
References: <bug-111211-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0036206613=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0036206613==
Content-Type: multipart/alternative; boundary="15671641262.8491b0.16952"
Content-Transfer-Encoding: 7bit


--15671641262.8491b0.16952
Date: Fri, 30 Aug 2019 11:22:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111211

Br=C3=A1ulio Barros de Oliveira <brauliobo@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #8 from Br=C3=A1ulio Barros de Oliveira <brauliobo@gmail.com> -=
--
tearing and crashes were a result of low RAM memory available in conjunction
with BTRFS. Switching to EXT4 fixed them, weirdly.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15671641262.8491b0.16952
Date: Fri, 30 Aug 2019 11:22:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:brauliobo=
&#64;gmail.com" title=3D"Br=C3=A1ulio Barros de Oliveira &lt;brauliobo&#64;=
gmail.com&gt;"> <span class=3D"fn">Br=C3=A1ulio Barros de Oliveira</span></=
a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Kernel 5.2.2+ introduced tearing, corruption a=
nd freezes with Raven Ridge 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111211">bug 11121=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>REOPENED
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
   title=3D"RESOLVED FIXED - Kernel 5.2.2+ introduced tearing, corruption a=
nd freezes with Raven Ridge 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111211#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Kernel 5.2.2+ introduced tearing, corruption a=
nd freezes with Raven Ridge 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111211">bug 11121=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
brauliobo&#64;gmail.com" title=3D"Br=C3=A1ulio Barros de Oliveira &lt;braul=
iobo&#64;gmail.com&gt;"> <span class=3D"fn">Br=C3=A1ulio Barros de Oliveira=
</span></a>
</span></b>
        <pre>tearing and crashes were a result of low RAM memory available =
in conjunction
with BTRFS. Switching to EXT4 fixed them, weirdly.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15671641262.8491b0.16952--

--===============0036206613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0036206613==--
