Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6742BACC1
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 04:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FD56E0D8;
	Mon, 23 Sep 2019 02:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CA3D26E0EC
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 02:49:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C736C72162; Mon, 23 Sep 2019 02:49:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Mon, 23 Sep 2019 02:49:08 +0000
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
Message-ID: <bug-109955-502-WURo1enrqJ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1422372743=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1422372743==
Content-Type: multipart/alternative; boundary="15692069487.FfEAE27.19365"
Content-Transfer-Encoding: 7bit


--15692069487.FfEAE27.19365
Date: Mon, 23 Sep 2019 02:49:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #104 from Rodney A Morris <rodamorris@gmail.com> ---
(In reply to Mauro Gaspari from comment #103)
> (In reply to Rodney A Morris from comment #101)
> > (In reply to Rodney A Morris from comment #99)
> > > Created attachment 145366 [details]
> > > apitrace of Hearts of Iron IV hard lock
> > >=20
> > > Apitrace from hard lock playing Hearts of Iron IV without Steam.  The=
 replay
> > > from this trace will hard lock the computer, though inconsistently.  =
I've
> > > replayed the trace three times. The replay hard locked computer one t=
ime.
> >=20
> > neofetch from hardlock:
> >=20
> >           /:-------------:\=20=20=20=20=20=20=20=20=20=20
> >        :-------------------::        --------------------------------=20
> >      :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86=
_64=20
> >    /-----------omMMMNNNMMD  ---:     Kernel: 5.2.13-200.fc30.x86_64=20
> >   :-----------sMMMMNMNMP.    ---:    Uptime: 25 mins=20
> >  :-----------:MMMdP-------    ---\   Packages: 2202 (rpm), 27 (flatpak)=
=20
> > ,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
> > :------------:MMMd-------    .---:   Resolution: 2560x1440=20
> > :----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
> > :--     .+shhhMMMmhhy++   .------/   WM: GNOME Shell=20
> > :-    -------:MMMd--------------:    WM Theme: Adwaita=20
> > :-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK2/3]=20
> > :-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
> > :-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
> > :---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) @ 4.000GH=
z=20
> > :------:://:-------------::          GPU: AMD ATI Radeon RX Vega 56/64=
=20
> > :---------------------://            Memory: 2478MiB / 32084MiB=20
> >=20
> > OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6
> >=20
> > Note:  hard lock replayed occurred when the Discord flatpak is also run=
ning.
>=20
> I also noticed some errors that pointed to discord in my logs. In my case
> discord was installed via .deb package.=20
> Could you please try and disable hardware acceleration in discord setting=
s -
> appearance menu? Please let me know if it helps or changes anything.=20
> Thanks!

I have disabled hardware acceleration in discord settings to see if that
improves my experience and report back my results.  I am doubtful that it w=
ill
help much.  At least on the 5.2.11 kernel, I had lockups with or without
discord running.  Discord running just seemed to make the problem appear mo=
re
consistently.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15692069487.FfEAE27.19365
Date: Mon, 23 Sep 2019 02:49:08 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c104">Comm=
ent # 104</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rodamorris&#64;gmail.com" title=3D"Rodney A Morris &lt;rodamorris&#64;gmail=
.com&gt;"> <span class=3D"fn">Rodney A Morris</span></a>
</span></b>
        <pre>(In reply to Mauro Gaspari from <a href=3D"show_bug.cgi?id=3D1=
09955#c103">comment #103</a>)
<span class=3D"quote">&gt; (In reply to Rodney A Morris from <a href=3D"sho=
w_bug.cgi?id=3D109955#c101">comment #101</a>)
&gt; &gt; (In reply to Rodney A Morris from <a href=3D"show_bug.cgi?id=3D10=
9955#c99">comment #99</a>)
&gt; &gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D1453=
66" name=3D"attach_145366" title=3D"apitrace of Hearts of Iron IV hard lock=
">attachment 145366</a> <a href=3D"attachment.cgi?id=3D145366&amp;action=3D=
edit" title=3D"apitrace of Hearts of Iron IV hard lock">[details]</a></span>
&gt; &gt; &gt; apitrace of Hearts of Iron IV hard lock
&gt; &gt; &gt;=20
&gt; &gt; &gt; Apitrace from hard lock playing Hearts of Iron IV without St=
eam.  The replay
&gt; &gt; &gt; from this trace will hard lock the computer, though inconsis=
tently.  I've
&gt; &gt; &gt; replayed the trace three times. The replay hard locked compu=
ter one time.
&gt; &gt;=20
&gt; &gt; neofetch from hardlock:
&gt; &gt;=20
&gt; &gt;           /:-------------:\=20=20=20=20=20=20=20=20=20=20
&gt; &gt;        :-------------------::        ----------------------------=
----=20
&gt; &gt;      :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirt=
y) x86_64=20
&gt; &gt;    /-----------omMMMNNNMMD  ---:     Kernel: 5.2.13-200.fc30.x86_=
64=20
&gt; &gt;   :-----------sMMMMNMNMP.    ---:    Uptime: 25 mins=20
&gt; &gt;  :-----------:MMMdP-------    ---\   Packages: 2202 (rpm), 27 (fl=
atpak)=20
&gt; &gt; ,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
&gt; &gt; :------------:MMMd-------    .---:   Resolution: 2560x1440=20
&gt; &gt; :----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
&gt; &gt; :--     .+shhhMMMmhhy++   .------/   WM: GNOME Shell=20
&gt; &gt; :-    -------:MMMd--------------:    WM Theme: Adwaita=20
&gt; &gt; :-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK=
2/3]=20
&gt; &gt; :-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
&gt; &gt; :-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
&gt; &gt; :---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) &#6=
4; 4.000GHz=20
&gt; &gt; :------:://:-------------::          GPU: AMD ATI Radeon RX Vega =
56/64=20
&gt; &gt; :---------------------://            Memory: 2478MiB / 32084MiB=20
&gt; &gt;=20
&gt; &gt; OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6
&gt; &gt;=20
&gt; &gt; Note:  hard lock replayed occurred when the Discord flatpak is al=
so running.
&gt;=20
&gt; I also noticed some errors that pointed to discord in my logs. In my c=
ase
&gt; discord was installed via .deb package.=20
&gt; Could you please try and disable hardware acceleration in discord sett=
ings -
&gt; appearance menu? Please let me know if it helps or changes anything.=20
&gt; Thanks!</span >

I have disabled hardware acceleration in discord settings to see if that
improves my experience and report back my results.  I am doubtful that it w=
ill
help much.  At least on the 5.2.11 kernel, I had lockups with or without
discord running.  Discord running just seemed to make the problem appear mo=
re
consistently.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15692069487.FfEAE27.19365--

--===============1422372743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1422372743==--
