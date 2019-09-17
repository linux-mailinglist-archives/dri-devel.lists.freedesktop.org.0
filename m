Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0709B4571
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 04:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1836E6EAE1;
	Tue, 17 Sep 2019 02:09:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 435A26EAE3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 02:09:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3DCD072167; Tue, 17 Sep 2019 02:09:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 100239] Incorrect rendering in CS:GO
Date: Tue, 17 Sep 2019 02:09:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100239-502-BSc1emPHxo@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1607480539=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1607480539==
Content-Type: multipart/alternative; boundary="15686861612.aed3e5A.29407"
Content-Transfer-Encoding: 7bit


--15686861612.aed3e5A.29407
Date: Tue, 17 Sep 2019 02:09:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100239

--- Comment #27 from Timothy Arceri <t_arceri@yahoo.com.au> ---
(In reply to Bruno Jacquet (Xaapyks) from comment #26)
> (In reply to Michel D=C3=A4nzer from comment #25)
> > (In reply to Bruno Jacquet (Xaapyks) from comment #23)
> > > So I'd say the issue is still there.
> >=20
> > Maybe you have a ~/.drirc or other drirc file which gets picked up and
> > disables radeonsi_zerovram? (E.g. due to ever starting the old "driconf"
> > application with a driver which supported the option)
>=20
> ~/.drirc and /etc/drirc do not exist on my fs.
> /usr/share/drirc.d only contains 00-mesa-defaults.conf which is not modif=
ied
> from what the mesa build provides and is packaged in Arch.
>=20
> strace seems to confirm it is not loading any other "drirc" file any and I
> don't have any "*MESA*" or "*GL*" env var.

I just tested the trace from comment 16 on my Vega 64 and using the environ=
ment
variable fixed the issue for me. Do you have an old kernel?
radeonsi_zeroram=3Dtrue will do nothing on pre 4.9 kernels.

If you have at least 4.9 can you try closing steam then running it from the
command line with:

radeonsi_zeroram=3Dtrue steam

And then run CS:GO. This should force the setting even if your system is not
picking up the right config file.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15686861612.aed3e5A.29407
Date: Tue, 17 Sep 2019 02:09:21 +0000
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
   title=3D"REOPENED - Incorrect rendering in CS:GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100239#c27">Comme=
nt # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Incorrect rendering in CS:GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100239">bug 10023=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>(In reply to Bruno Jacquet (Xaapyks) from <a href=3D"show_bug.=
cgi?id=3D100239#c26">comment #26</a>)
<span class=3D"quote">&gt; (In reply to Michel D=C3=A4nzer from <a href=3D"=
show_bug.cgi?id=3D100239#c25">comment #25</a>)
&gt; &gt; (In reply to Bruno Jacquet (Xaapyks) from <a href=3D"show_bug.cgi=
?id=3D100239#c23">comment #23</a>)
&gt; &gt; &gt; So I'd say the issue is still there.
&gt; &gt;=20
&gt; &gt; Maybe you have a ~/.drirc or other drirc file which gets picked u=
p and
&gt; &gt; disables radeonsi_zerovram? (E.g. due to ever starting the old &q=
uot;driconf&quot;
&gt; &gt; application with a driver which supported the option)
&gt;=20
&gt; ~/.drirc and /etc/drirc do not exist on my fs.
&gt; /usr/share/drirc.d only contains 00-mesa-defaults.conf which is not mo=
dified
&gt; from what the mesa build provides and is packaged in Arch.
&gt;=20
&gt; strace seems to confirm it is not loading any other &quot;drirc&quot; =
file any and I
&gt; don't have any &quot;*MESA*&quot; or &quot;*GL*&quot; env var.</span >

I just tested the trace from <a href=3D"show_bug.cgi?id=3D100239#c16">comme=
nt 16</a> on my Vega 64 and using the environment
variable fixed the issue for me. Do you have an old kernel?
radeonsi_zeroram=3Dtrue will do nothing on pre 4.9 kernels.

If you have at least 4.9 can you try closing steam then running it from the
command line with:

radeonsi_zeroram=3Dtrue steam

And then run CS:GO. This should force the setting even if your system is not
picking up the right config file.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15686861612.aed3e5A.29407--

--===============1607480539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1607480539==--
