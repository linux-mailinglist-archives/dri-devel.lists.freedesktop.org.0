Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE05E15F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 13:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AE889010;
	Mon, 29 Apr 2019 11:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F388788EFF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 11:35:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E50CA72155; Mon, 29 Apr 2019 11:35:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Mon, 29 Apr 2019 11:35:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-IH5IrTadIx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109955-502@http.bugs.freedesktop.org/>
References: <bug-109955-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0792850944=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0792850944==
Content-Type: multipart/alternative; boundary="15565377260.3698cFE.30568"
Content-Transfer-Encoding: 7bit


--15565377260.3698cFE.30568
Date: Mon, 29 Apr 2019 11:35:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #19 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Jaap Buurman from comment #15)
> That's bad to hear :( Worth a try though. How often do you experience
> freezes by the way? And is this for all games, or are some games complete=
ly
> stable? For me, I am getting crashes in Kerbal Space Program, but not in
> Final Fantasy XII or World of Warcraft, even after hundreds of hours in b=
oth
> of these stable games.
>=20
> Also, have you ever figured out which kernel parameter in particular makes
> your setup stable? It might help identify where the problem exists. Or do
> you need that exact combination of all those parameters to get your system
> stable?

Hi, regarding the parameters I am using.
Unfortunately for me the issue is not easy to reproduce. Without the parame=
ters
enabled, it still takes hours for a crash to happen. On top of that, mesa a=
nd
kernel updates are really frequent on Tumbleweed, that is another variable =
that
makes it a bit harder to troubleshoot. Unless I can find a really fast way =
to
reproduce the issue.

Regarding which game crash, with those kernel parameters applied, the only
crashes I noticed were when I tried to run games through Wine in DX11 mode =
with
DXVK. Which i believe to be stable on Vega GPUs, would need at least LLVM8.
Currently on my Tumbleweed I have LLVM7 so I just stick to NON-DXVK games, =
or
even better native ones, until LLVM8 is available for tumbleweed.

If you want to give it a try and you run on ubuntu, you can check this arti=
cle:
https://github.com/lutris/lutris/wiki/Installing-drivers

If you do so, I recommend you run a full system backup using clonezilla or
similar software, those ppas are marked as unstable.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15565377260.3698cFE.30568
Date: Mon, 29 Apr 2019 11:35:26 +0000
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
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c19">Comme=
nt # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to Jaap Buurman from <a href=3D"show_bug.cgi?id=3D10=
9955#c15">comment #15</a>)
<span class=3D"quote">&gt; That's bad to hear :( Worth a try though. How of=
ten do you experience
&gt; freezes by the way? And is this for all games, or are some games compl=
etely
&gt; stable? For me, I am getting crashes in Kerbal Space Program, but not =
in
&gt; Final Fantasy XII or World of Warcraft, even after hundreds of hours i=
n both
&gt; of these stable games.
&gt;=20
&gt; Also, have you ever figured out which kernel parameter in particular m=
akes
&gt; your setup stable? It might help identify where the problem exists. Or=
 do
&gt; you need that exact combination of all those parameters to get your sy=
stem
&gt; stable?</span >

Hi, regarding the parameters I am using.
Unfortunately for me the issue is not easy to reproduce. Without the parame=
ters
enabled, it still takes hours for a crash to happen. On top of that, mesa a=
nd
kernel updates are really frequent on Tumbleweed, that is another variable =
that
makes it a bit harder to troubleshoot. Unless I can find a really fast way =
to
reproduce the issue.

Regarding which game crash, with those kernel parameters applied, the only
crashes I noticed were when I tried to run games through Wine in DX11 mode =
with
DXVK. Which i believe to be stable on Vega GPUs, would need at least LLVM8.
Currently on my Tumbleweed I have LLVM7 so I just stick to NON-DXVK games, =
or
even better native ones, until LLVM8 is available for tumbleweed.

If you want to give it a try and you run on ubuntu, you can check this arti=
cle:
<a href=3D"https://github.com/lutris/lutris/wiki/Installing-drivers">https:=
//github.com/lutris/lutris/wiki/Installing-drivers</a>

If you do so, I recommend you run a full system backup using clonezilla or
similar software, those ppas are marked as unstable.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15565377260.3698cFE.30568--

--===============0792850944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0792850944==--
