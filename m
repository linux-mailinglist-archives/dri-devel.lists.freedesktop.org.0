Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B9EBA22D
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2019 14:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A1A6E061;
	Sun, 22 Sep 2019 12:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF6FC6E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2019 06:55:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8BF8E721A2; Sat, 21 Sep 2019 02:05:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 21 Sep 2019 02:05:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilvipero@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-cbsa9o0eey@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1779601911=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1779601911==
Content-Type: multipart/alternative; boundary="15690315520.cc4C3.4223"
Content-Transfer-Encoding: 7bit


--15690315520.cc4C3.4223
Date: Sat, 21 Sep 2019 02:05:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #103 from Mauro Gaspari <ilvipero@gmx.com> ---
(In reply to Rodney A Morris from comment #101)
> (In reply to Rodney A Morris from comment #99)
> > Created attachment 145366 [details]
> > apitrace of Hearts of Iron IV hard lock
> >=20
> > Apitrace from hard lock playing Hearts of Iron IV without Steam.  The r=
eplay
> > from this trace will hard lock the computer, though inconsistently.  I'=
ve
> > replayed the trace three times. The replay hard locked computer one tim=
e.
>=20
> neofetch from hardlock:
>=20
>           /:-------------:\=20=20=20=20=20=20=20=20=20=20
>        :-------------------::        --------------------------------=20
>      :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x86_6=
4=20
>    /-----------omMMMNNNMMD  ---:     Kernel: 5.2.13-200.fc30.x86_64=20
>   :-----------sMMMMNMNMP.    ---:    Uptime: 25 mins=20
>  :-----------:MMMdP-------    ---\   Packages: 2202 (rpm), 27 (flatpak)=20
> ,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
> :------------:MMMd-------    .---:   Resolution: 2560x1440=20
> :----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
> :--     .+shhhMMMmhhy++   .------/   WM: GNOME Shell=20
> :-    -------:MMMd--------------:    WM Theme: Adwaita=20
> :-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK2/3]=20
> :-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
> :-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
> :---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) @ 4.000GHz=
=20
> :------:://:-------------::          GPU: AMD ATI Radeon RX Vega 56/64=20
> :---------------------://            Memory: 2478MiB / 32084MiB=20
>=20
> OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6
>=20
> Note:  hard lock replayed occurred when the Discord flatpak is also runni=
ng.

I also noticed some errors that pointed to discord in my logs. In my case
discord was installed via .deb package.=20
Could you please try and disable hardware acceleration in discord settings -
appearance menu? Please let me know if it helps or changes anything.=20
Thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15690315520.cc4C3.4223
Date: Sat, 21 Sep 2019 02:05:52 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c103">Comm=
ent # 103</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>(In reply to Rodney A Morris from <a href=3D"show_bug.cgi?id=
=3D109955#c101">comment #101</a>)
<span class=3D"quote">&gt; (In reply to Rodney A Morris from <a href=3D"sho=
w_bug.cgi?id=3D109955#c99">comment #99</a>)
&gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D145366" n=
ame=3D"attach_145366" title=3D"apitrace of Hearts of Iron IV hard lock">att=
achment 145366</a> <a href=3D"attachment.cgi?id=3D145366&amp;action=3Dedit"=
 title=3D"apitrace of Hearts of Iron IV hard lock">[details]</a></span>
&gt; &gt; apitrace of Hearts of Iron IV hard lock
&gt; &gt;=20
&gt; &gt; Apitrace from hard lock playing Hearts of Iron IV without Steam. =
 The replay
&gt; &gt; from this trace will hard lock the computer, though inconsistentl=
y.  I've
&gt; &gt; replayed the trace three times. The replay hard locked computer o=
ne time.
&gt;=20
&gt; neofetch from hardlock:
&gt;=20
&gt;           /:-------------:\=20=20=20=20=20=20=20=20=20=20
&gt;        :-------------------::        --------------------------------=
=20
&gt;      :-----------/shhOHbmp---:\      OS: Fedora release 30 (Thirty) x8=
6_64=20
&gt;    /-----------omMMMNNNMMD  ---:     Kernel: 5.2.13-200.fc30.x86_64=20
&gt;   :-----------sMMMMNMNMP.    ---:    Uptime: 25 mins=20
&gt;  :-----------:MMMdP-------    ---\   Packages: 2202 (rpm), 27 (flatpak=
)=20
&gt; ,------------:MMMd--------    ---:   Shell: bash 5.0.7=20
&gt; :------------:MMMd-------    .---:   Resolution: 2560x1440=20
&gt; :----    oNMMMMMMMMMNho     .----:   DE: GNOME 3.32.2=20
&gt; :--     .+shhhMMMmhhy++   .------/   WM: GNOME Shell=20
&gt; :-    -------:MMMd--------------:    WM Theme: Adwaita=20
&gt; :-   --------/MMMd-------------;     Theme: Adapta-Nokto-Eta [GTK2/3]=
=20
&gt; :-    ------/hMMMy------------:      Icons: Adwaita [GTK2/3]=20
&gt; :-- :dMNdhhdNMMNo------------;       Terminal: tilix=20
&gt; :---:sdNMMMMNds:------------:        CPU: Intel i7-6850K (12) &#64; 4.=
000GHz=20
&gt; :------:://:-------------::          GPU: AMD ATI Radeon RX Vega 56/64=
=20
&gt; :---------------------://            Memory: 2478MiB / 32084MiB=20
&gt;=20
&gt; OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.6
&gt;=20
&gt; Note:  hard lock replayed occurred when the Discord flatpak is also ru=
nning.</span >

I also noticed some errors that pointed to discord in my logs. In my case
discord was installed via .deb package.=20
Could you please try and disable hardware acceleration in discord settings -
appearance menu? Please let me know if it helps or changes anything.=20
Thanks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15690315520.cc4C3.4223--

--===============1779601911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1779601911==--
