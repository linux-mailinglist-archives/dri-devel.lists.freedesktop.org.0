Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B674B2D8A
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2019 03:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBCC6F56E;
	Sun, 15 Sep 2019 01:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F8066F56F
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2019 01:20:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AE02C72167; Sun, 15 Sep 2019 01:20:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 15 Sep 2019 01:20:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodamorris@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-kke78Jv5Xp@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0211457309=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0211457309==
Content-Type: multipart/alternative; boundary="15685104500.CE977.9634"
Content-Transfer-Encoding: 7bit


--15685104500.CE977.9634
Date: Sun, 15 Sep 2019 01:20:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #100 from Rodney A Morris <rodamorris@gmail.com> ---
(In reply to Rodney A Morris from comment #99)
> Created attachment 145366 [details]
> apitrace of Hearts of Iron IV hard lock
>=20
> Apitrace from hard lock playing Hearts of Iron IV without Steam.  The rep=
lay
> from this trace will hard lock the computer, though inconsistently.  I've
> replayed the trace three times. The replay hard locked computer one time.

neofetch from hardlock:

          /:-------------:\=20=20=20=20=20=20=20=20=20=20
       :-------------------::        --------------------------------=20
     :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_64=
=20
   /-----------omMMMNNNMMD  ---:     Kernel: 5.2.13-200.fc30.x86_64=20
  :-----------sMMMMNMNMP.    ---:    Uptime: 25 mins=20
 :-----------:MMMdP-------    ---\   Packages: 2202 (rpm), 27 (flatpak)=20
,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
:------------:MMMd-------    .---:   Resolution: 2560x1440=20
:----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
:--     .+shhhMMMmhhy++   .------/   WM: GNOME Shell=20
:-    -------:MMMd--------------:    WM Theme: Adwaita=20
:-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK2/3]=20
:-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
:-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
:---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) @ 4.000GHz=20
:------:://:-------------::          GPU: AMD ATI Radeon RX Vega 56/64=20
:---------------------://            Memory: 2478MiB / 32084MiB=20

OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6

Note:  hard lock replayed occurred when the Discord flatpak is also running.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15685104500.CE977.9634
Date: Sun, 15 Sep 2019 01:20:50 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c100">Comm=
ent # 100</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rodamorris&#64;gmail.com" title=3D"Rodney A Morris &lt;rodamorris&#64;gmail=
.com&gt;"> <span class=3D"fn">Rodney A Morris</span></a>
</span></b>
        <pre>(In reply to Rodney A Morris from <a href=3D"show_bug.cgi?id=
=3D109955#c99">comment #99</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145366" name=3D"attach_145366" title=3D"apitrace of Hearts of Iron =
IV hard lock">attachment 145366</a> <a href=3D"attachment.cgi?id=3D145366&a=
mp;action=3Dedit" title=3D"apitrace of Hearts of Iron IV hard lock">[detail=
s]</a></span>
&gt; apitrace of Hearts of Iron IV hard lock
&gt;=20
&gt; Apitrace from hard lock playing Hearts of Iron IV without Steam.  The =
replay
&gt; from this trace will hard lock the computer, though inconsistently.  I=
've
&gt; replayed the trace three times. The replay hard locked computer one ti=
me.</span >

neofetch from hardlock:

          /:-------------:\=20=20=20=20=20=20=20=20=20=20
       :-------------------::        --------------------------------=20
     :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_64=
=20
   /-----------omMMMNNNMMD  ---:     Kernel: 5.2.13-200.fc30.x86_64=20
  :-----------sMMMMNMNMP.    ---:    Uptime: 25 mins=20
 :-----------:MMMdP-------    ---\   Packages: 2202 (rpm), 27 (flatpak)=20
,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
:------------:MMMd-------    .---:   Resolution: 2560x1440=20
:----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
:--     .+shhhMMMmhhy++   .------/   WM: GNOME Shell=20
:-    -------:MMMd--------------:    WM Theme: Adwaita=20
:-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK2/3]=20
:-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
:-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
:---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) &#64; 4.000GH=
z=20
:------:://:-------------::          GPU: AMD ATI Radeon RX Vega 56/64=20
:---------------------://            Memory: 2478MiB / 32084MiB=20

OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6

Note:  hard lock replayed occurred when the Discord flatpak is also running=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15685104500.CE977.9634--

--===============0211457309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0211457309==--
