Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F2642EB8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 20:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B278966C;
	Wed, 12 Jun 2019 18:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CB66F8967F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 18:30:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C0C6172168; Wed, 12 Jun 2019 18:30:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] [Bisected]Booting with kernel version 5.1.0 or higher
 on RX 580 hangs
Date: Wed, 12 Jun 2019 18:30:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110822-502-LxChcib8U9@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110822-502@http.bugs.freedesktop.org/>
References: <bug-110822-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0460116562=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0460116562==
Content-Type: multipart/alternative; boundary="15603642441.96dDaE.10252"
Content-Transfer-Encoding: 7bit


--15603642441.96dDaE.10252
Date: Wed, 12 Jun 2019 18:30:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #19 from Alex Deucher <alexdeucher@gmail.com> ---
(In reply to Gobinda Joy from comment #18)
>=20
> What I don't get is why they are using 2 calls to get the bandwidth readi=
ng.
> Since both function walking the PCIe tree what's the point. Also it seems
> like the call to pcie_bandwidth_available() function is casing the
> freeze/hangs in my system. So that's counts for something.
>=20

Can you try a drm-next kernel?  This code was ultimately cleaned in this pa=
tch:
https://cgit.freedesktop.org/drm/drm/commit/?id=3Ddbaa922b5706b1aff4572c280=
e15bbea2d04afe6
I don't know why pcie_bandwidth_available() is causing problems for you, it=
's
just standard PCIE stuff.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603642441.96dDaE.10252
Date: Wed, 12 Jun 2019 18:30:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c19">Comme=
nt # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>(In reply to Gobinda Joy from <a href=3D"show_bug.cgi?id=3D110=
822#c18">comment #18</a>)
<span class=3D"quote">&gt;=20
&gt; What I don't get is why they are using 2 calls to get the bandwidth re=
ading.
&gt; Since both function walking the PCIe tree what's the point. Also it se=
ems
&gt; like the call to pcie_bandwidth_available() function is casing the
&gt; freeze/hangs in my system. So that's counts for something.
&gt; </span >

Can you try a drm-next kernel?  This code was ultimately cleaned in this pa=
tch:
<a href=3D"https://cgit.freedesktop.org/drm/drm/commit/?id=3Ddbaa922b5706b1=
aff4572c280e15bbea2d04afe6">https://cgit.freedesktop.org/drm/drm/commit/?id=
=3Ddbaa922b5706b1aff4572c280e15bbea2d04afe6</a>
I don't know why pcie_bandwidth_available() is causing problems for you, it=
's
just standard PCIE stuff.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603642441.96dDaE.10252--

--===============0460116562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0460116562==--
