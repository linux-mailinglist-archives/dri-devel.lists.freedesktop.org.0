Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2F686BED
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 22:53:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1729D6ECC2;
	Thu,  8 Aug 2019 20:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E48CD6E8C1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 20:53:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E15B472167; Thu,  8 Aug 2019 20:53:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 100239] Incorrect rendering in CS:GO
Date: Thu, 08 Aug 2019 20:53:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maxijac@free.fr
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-100239-502-UjEPrdsrgx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100239-502@http.bugs.freedesktop.org/>
References: <bug-100239-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1252346675=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1252346675==
Content-Type: multipart/alternative; boundary="15652976231.5A8aD.6330"
Content-Transfer-Encoding: 7bit


--15652976231.5A8aD.6330
Date: Thu, 8 Aug 2019 20:53:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100239

Bruno Jacquet (Xaapyks) <maxijac@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |---

--- Comment #23 from Bruno Jacquet (Xaapyks) <maxijac@free.fr> ---
Since my last message I upgraded my GPU, I now have a Vega 64, and in mesa
19.1.3 I still have the issue, the AUG scope is being all garbled with black
patches.

mesa 19.1.3 appears to have a cherry-pick of the commit
(825ca9e42eacd305a63f63c61fbbe6348b0266aa) and I checked, I do have the con=
f in
my filesystem:

$ grep -A2 "Counter-Strike Global Offensive"=20
/usr/share/drirc.d/00-mesa-defaults.conf
        <application name=3D"Counter-Strike Global Offensive"
executable=3D"csgo_linux64">
            <option name=3D"radeonsi_zerovram" value=3D"true" />
        </application>

So I'd say the issue is still there.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15652976231.5A8aD.6330
Date: Thu, 8 Aug 2019 20:53:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:maxijac&#=
64;free.fr" title=3D"Bruno Jacquet (Xaapyks) &lt;maxijac&#64;free.fr&gt;"> =
<span class=3D"fn">Bruno Jacquet (Xaapyks)</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Incorrect rendering in CS:GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100239">bug 10023=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>FIXED
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Incorrect rendering in CS:GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100239#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Incorrect rendering in CS:GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100239">bug 10023=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
maxijac&#64;free.fr" title=3D"Bruno Jacquet (Xaapyks) &lt;maxijac&#64;free.=
fr&gt;"> <span class=3D"fn">Bruno Jacquet (Xaapyks)</span></a>
</span></b>
        <pre>Since my last message I upgraded my GPU, I now have a Vega 64,=
 and in mesa
19.1.3 I still have the issue, the AUG scope is being all garbled with black
patches.

mesa 19.1.3 appears to have a cherry-pick of the commit
(825ca9e42eacd305a63f63c61fbbe6348b0266aa) and I checked, I do have the con=
f in
my filesystem:

$ grep -A2 &quot;Counter-Strike Global Offensive&quot;=20
/usr/share/drirc.d/00-mesa-defaults.conf
        &lt;application name=3D&quot;Counter-Strike Global Offensive&quot;
executable=3D&quot;csgo_linux64&quot;&gt;
            &lt;option name=3D&quot;radeonsi_zerovram&quot; value=3D&quot;t=
rue&quot; /&gt;
        &lt;/application&gt;

So I'd say the issue is still there.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15652976231.5A8aD.6330--

--===============1252346675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1252346675==--
