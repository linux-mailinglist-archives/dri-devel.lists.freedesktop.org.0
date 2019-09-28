Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE56C10D5
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2019 14:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50BDA6E133;
	Sat, 28 Sep 2019 12:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC04E6E141
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2019 12:25:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E932272162; Sat, 28 Sep 2019 12:25:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 28 Sep 2019 12:25:32 +0000
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
Message-ID: <bug-109955-502-jnruKHnrTY@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1849236026=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1849236026==
Content-Type: multipart/alternative; boundary="156967353210.5BDD7F3Eb.4259"
Content-Transfer-Encoding: 7bit


--156967353210.5BDD7F3Eb.4259
Date: Sat, 28 Sep 2019 12:25:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #110 from Rodney A Morris <rodamorris@gmail.com> ---
(In reply to Rodney A Morris from comment #104)
> (In reply to Mauro Gaspari from comment #103)
> > (In reply to Rodney A Morris from comment #101)
> > > (In reply to Rodney A Morris from comment #99)
> > > > Created attachment 145366 [details]
> > > > apitrace of Hearts of Iron IV hard lock
> > > >=20
> > > > Apitrace from hard lock playing Hearts of Iron IV without Steam.  T=
he replay
> > > > from this trace will hard lock the computer, though inconsistently.=
  I've
> > > > replayed the trace three times. The replay hard locked computer one=
 time.
> > >=20
> > > neofetch from hardlock:
> > >=20
> > >           /:-------------:\=20=20=20=20=20=20=20=20=20=20
> > >        :-------------------::        --------------------------------=
=20
> > >      :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x=
86_64=20
> > >    /-----------omMMMNNNMMD  ---:     Kernel: 5.2.13-200.fc30.x86_64=20
> > >   :-----------sMMMMNMNMP.    ---:    Uptime: 25 mins=20
> > >  :-----------:MMMdP-------    ---\   Packages: 2202 (rpm), 27 (flatpa=
k)=20
> > > ,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
> > > :------------:MMMd-------    .---:   Resolution: 2560x1440=20
> > > :----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
> > > :--     .+shhhMMMmhhy++   .------/   WM: GNOME Shell=20
> > > :-    -------:MMMd--------------:    WM Theme: Adwaita=20
> > > :-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK2/3]=
=20
> > > :-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
> > > :-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
> > > :---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) @ 4.000=
GHz=20
> > > :------:://:-------------::          GPU: AMD ATI Radeon RX Vega 56/6=
4=20
> > > :---------------------://            Memory: 2478MiB / 32084MiB=20
> > >=20
> > > OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6
> > >=20
> > > Note:  hard lock replayed occurred when the Discord flatpak is also r=
unning.
> >=20
> > I also noticed some errors that pointed to discord in my logs. In my ca=
se
> > discord was installed via .deb package.=20
> > Could you please try and disable hardware acceleration in discord setti=
ngs -
> > appearance menu? Please let me know if it helps or changes anything.=20
> > Thanks!
>=20
> I have disabled hardware acceleration in discord settings to see if that
> improves my experience and report back my results.  I am doubtful that it
> will help much.  At least on the 5.2.11 kernel, I had lockups with or
> without discord running.  Discord running just seemed to make the problem
> appear more consistently.

Another lockup and crash last night of Stellaris with identical dmesg kernel
information as comment 105.

Kernel for this crash: 5.2.17.

  Unlike previous attempts, I also had cpupower configured to run the cpu in
performance mode and was running feral gamemode.  Although I still wonder i=
f my
hardware has an issue, I am able to run Stellaris without issue under Windo=
ws.

Final Note: Getting an apitrace of my crash under Stellaris is not feasible=
 for
two reasons.  First, the crash typically happens between 30 minutes and 40
minutes of game play, resulting in a monster trace file.  Second, i cannot =
get
apitrace to run correctly with Steam and a 64-bit game, which is necessary
since the crashes happen most frequently in multiplayer.

I am happy to provide more data if someone can point me in the direction to
capture it.  Aside from trying the amdgpu-pro drivers, is there anything el=
se I
can try?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--156967353210.5BDD7F3Eb.4259
Date: Sat, 28 Sep 2019 12:25:32 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c110">Comm=
ent # 110</a>
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
=3D109955#c104">comment #104</a>)
<span class=3D"quote">&gt; (In reply to Mauro Gaspari from <a href=3D"show_=
bug.cgi?id=3D109955#c103">comment #103</a>)
&gt; &gt; (In reply to Rodney A Morris from <a href=3D"show_bug.cgi?id=3D10=
9955#c101">comment #101</a>)
&gt; &gt; &gt; (In reply to Rodney A Morris from <a href=3D"show_bug.cgi?id=
=3D109955#c99">comment #99</a>)
&gt; &gt; &gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=
=3D145366" name=3D"attach_145366" title=3D"apitrace of Hearts of Iron IV ha=
rd lock">attachment 145366</a> <a href=3D"attachment.cgi?id=3D145366&amp;ac=
tion=3Dedit" title=3D"apitrace of Hearts of Iron IV hard lock">[details]</a=
></span>
&gt; &gt; &gt; &gt; apitrace of Hearts of Iron IV hard lock
&gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; Apitrace from hard lock playing Hearts of Iron IV witho=
ut Steam.  The replay
&gt; &gt; &gt; &gt; from this trace will hard lock the computer, though inc=
onsistently.  I've
&gt; &gt; &gt; &gt; replayed the trace three times. The replay hard locked =
computer one time.
&gt; &gt; &gt;=20
&gt; &gt; &gt; neofetch from hardlock:
&gt; &gt; &gt;=20
&gt; &gt; &gt;           /:-------------:\=20=20=20=20=20=20=20=20=20=20
&gt; &gt; &gt;        :-------------------::        -----------------------=
---------=20
&gt; &gt; &gt;      :-----------/shhOHbmp---:\      OS: Fedora release 30 (=
Thirty) x86_64=20
&gt; &gt; &gt;    /-----------omMMMNNNMMD  ---:     Kernel: 5.2.13-200.fc30=
.x86_64=20
&gt; &gt; &gt;   :-----------sMMMMNMNMP.    ---:    Uptime: 25 mins=20
&gt; &gt; &gt;  :-----------:MMMdP-------    ---\   Packages: 2202 (rpm), 2=
7 (flatpak)=20
&gt; &gt; &gt; ,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
&gt; &gt; &gt; :------------:MMMd-------    .---:   Resolution: 2560x1440=20
&gt; &gt; &gt; :----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
&gt; &gt; &gt; :--     .+shhhMMMmhhy++   .------/   WM: GNOME Shell=20
&gt; &gt; &gt; :-    -------:MMMd--------------:    WM Theme: Adwaita=20
&gt; &gt; &gt; :-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta=
 [GTK2/3]=20
&gt; &gt; &gt; :-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=
=20
&gt; &gt; &gt; :-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
&gt; &gt; &gt; :---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12=
) &#64; 4.000GHz=20
&gt; &gt; &gt; :------:://:-------------::          GPU: AMD ATI Radeon RX =
Vega 56/64=20
&gt; &gt; &gt; :---------------------://            Memory: 2478MiB / 32084=
MiB=20
&gt; &gt; &gt;=20
&gt; &gt; &gt; OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1=
.6
&gt; &gt; &gt;=20
&gt; &gt; &gt; Note:  hard lock replayed occurred when the Discord flatpak =
is also running.
&gt; &gt;=20
&gt; &gt; I also noticed some errors that pointed to discord in my logs. In=
 my case
&gt; &gt; discord was installed via .deb package.=20
&gt; &gt; Could you please try and disable hardware acceleration in discord=
 settings -
&gt; &gt; appearance menu? Please let me know if it helps or changes anythi=
ng.=20
&gt; &gt; Thanks!
&gt;=20
&gt; I have disabled hardware acceleration in discord settings to see if th=
at
&gt; improves my experience and report back my results.  I am doubtful that=
 it
&gt; will help much.  At least on the 5.2.11 kernel, I had lockups with or
&gt; without discord running.  Discord running just seemed to make the prob=
lem
&gt; appear more consistently.</span >

Another lockup and crash last night of Stellaris with identical dmesg kernel
information as <a href=3D"show_bug.cgi?id=3D109955#c105">comment 105</a>.

Kernel for this crash: 5.2.17.

  Unlike previous attempts, I also had cpupower configured to run the cpu in
performance mode and was running feral gamemode.  Although I still wonder i=
f my
hardware has an issue, I am able to run Stellaris without issue under Windo=
ws.

Final Note: Getting an apitrace of my crash under Stellaris is not feasible=
 for
two reasons.  First, the crash typically happens between 30 minutes and 40
minutes of game play, resulting in a monster trace file.  Second, i cannot =
get
apitrace to run correctly with Steam and a 64-bit game, which is necessary
since the crashes happen most frequently in multiplayer.

I am happy to provide more data if someone can point me in the direction to
capture it.  Aside from trying the amdgpu-pro drivers, is there anything el=
se I
can try?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--156967353210.5BDD7F3Eb.4259--

--===============1849236026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1849236026==--
