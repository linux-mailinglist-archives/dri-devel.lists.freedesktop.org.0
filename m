Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA731B801
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 16:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B538389E14;
	Mon, 13 May 2019 14:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 300FE89E3B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 14:20:00 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2CED8721CD; Mon, 13 May 2019 14:20:00 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Mon, 13 May 2019 14:20:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-109345-502-Eg4ssVjDGL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109345-502@http.bugs.freedesktop.org/>
References: <bug-109345-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0619240778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0619240778==
Content-Type: multipart/alternative; boundary="15577572001.3FBd8d648.23846"
Content-Transfer-Encoding: 7bit


--15577572001.3FBd8d648.23846
Date: Mon, 13 May 2019 14:20:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

Christian Zigotzky <chzigotzky@xenosoft.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|NOTABUG                     |---

--- Comment #46 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
(In reply to Michel D=C3=A4nzer from comment #45)
> Reviewing the information, I'm afraid it's not clear that there's a bug h=
ere.
>=20
> The description says the FirePro is the secondary card in a PCIe 1x slot,
> whereas the R7 is in the PCIe 16x slot. Thus it seems pretty clear that
> without explicit configuration, Xorg should be expected to come up on the
> R7. Arguably it was actually the previous behaviour that was buggy.
>=20
> Something like this in /etc/X11/xorg.conf should be enough to make Xorg u=
se
> the FirePro card:
>=20
> Section "Device"
>         Identifier "whatever"
>         BusID   "PCI:5@4096:0:0"
> EndSection

Hi Michel,

Why did you close this bug report? Allan hasn't tested your solution yet.

My first question in this thread was, if you modified the behaviour of the
initialisation of two graphics cards in the DRM updates 'drm-next-2018-12-1=
4'.
The answer was: "No, the only changes were changes in comments, removing so=
me
unused code and changes in the shared ttm module that touched all drivers t=
hat
use ttm."

This wasn't correct. I had to compile a lot of kernels and after that we kn=
owed
that you modified the behaviour of the initialisation of two graphics cards=
 in
the DRM updates 'drm-next-2018-12-14'. And now you just closed this bug rep=
ort.

Please give Allan the chance to test your solution.

PLEASE check your code more carefully before you release it. There are a lo=
t of
endusers who uses this code in they daily work later.

Cheers,
Christian

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15577572001.3FBd8d648.23846
Date: Mon, 13 May 2019 14:20:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:chzigotzk=
y&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;xenosoft.=
de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
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
           <td>NOTABUG
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c46">Comme=
nt # 46</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>(In reply to Michel D=C3=A4nzer from <a href=3D"show_bug.cgi?i=
d=3D109345#c45">comment #45</a>)
<span class=3D"quote">&gt; Reviewing the information, I'm afraid it's not c=
lear that there's a bug here.
&gt;=20
&gt; The description says the FirePro is the secondary card in a PCIe 1x sl=
ot,
&gt; whereas the R7 is in the PCIe 16x slot. Thus it seems pretty clear that
&gt; without explicit configuration, Xorg should be expected to come up on =
the
&gt; R7. Arguably it was actually the previous behaviour that was buggy.
&gt;=20
&gt; Something like this in /etc/X11/xorg.conf should be enough to make Xor=
g use
&gt; the FirePro card:
&gt;=20
&gt; Section &quot;Device&quot;
&gt;         Identifier &quot;whatever&quot;
&gt;         BusID   &quot;PCI:5&#64;4096:0:0&quot;
&gt; EndSection</span >

Hi Michel,

Why did you close this bug report? Allan hasn't tested your solution yet.

My first question in this thread was, if you modified the behaviour of the
initialisation of two graphics cards in the DRM updates 'drm-next-2018-12-1=
4'.
The answer was: &quot;No, the only changes were changes in comments, removi=
ng some
unused code and changes in the shared ttm module that touched all drivers t=
hat
use ttm.&quot;

This wasn't correct. I had to compile a lot of kernels and after that we kn=
owed
that you modified the behaviour of the initialisation of two graphics cards=
 in
the DRM updates 'drm-next-2018-12-14'. And now you just closed this bug rep=
ort.

Please give Allan the chance to test your solution.

PLEASE check your code more carefully before you release it. There are a lo=
t of
endusers who uses this code in they daily work later.

Cheers,
Christian</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15577572001.3FBd8d648.23846--

--===============0619240778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0619240778==--
