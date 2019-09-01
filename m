Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEE5A4C7F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 00:50:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D44892B2;
	Sun,  1 Sep 2019 22:49:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A37D289151
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 22:49:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9FF3A72161; Sun,  1 Sep 2019 22:49:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sun, 01 Sep 2019 22:49:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaapbuurman@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109955-502-l0Q3XU7TzZ@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2048614528=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2048614528==
Content-Type: multipart/alternative; boundary="15673781974.d99aDDaf.16765"
Content-Transfer-Encoding: 7bit


--15673781974.d99aDDaf.16765
Date: Sun, 1 Sep 2019 22:49:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #92 from Jaap Buurman <jaapbuurman@gmail.com> ---
(In reply to Mauro Gaspari from comment #90)
> @Sam and @Jaap Buurman
>=20
> Can you please help and post system info regarding your crash? I hope that
> with more detailed reports, we can get better help.

OS: Arch Linux x86_64=20
                `+oooo:                  Host: AB350-Gaming 3=20
               `+oooooo:                 Kernel: 5.2.11-arch1-1-ARCH=20
               -+oooooo+:                Uptime: 1 min=20
             `/:-:++oooo+:               Packages: 1229 (pacman)=20
            `/++++/+++++++:              Shell: bash 5.0.9=20
           `/++++++++++++++:             Terminal: /dev/pts/0=20
          `/+++ooooooooooooo/`           CPU: AMD Ryzen 7 1800X (16) @ 3.60=
0GHz=20
         ./ooosssso++osssssso+`          GPU: AMD ATI Radeon RX Vega 56/64=
=20
        .oossssso-````/ossssss+`         Memory: 1178MiB / 48304MiB=20



> Mesa info can be taken from this command:
> glxinfo | grep "OpenGL version"=20

[jaap@Jaap-Desktop ~]$ glxinfo | grep "OpenGL version"
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.3.0-devel
(git-db73bde35c)

I am running this version because I was trying out the mesa-aco from the AU=
R. I
experienced the same crashes with the regular mesa drivers from Arch's offi=
cial
repositories.

> Game being played:=20

World of Warcraft: Classic Wine/DXVK 1.3.2

> Crash type: Game crash? Full System freeze? System freeze but still can d=
rop
> to tty?

GPU doesn't successfully reset. Cannot drop to a different tty. However, I =
am
able to access logs via SSH. Full dmesg log: https://pastebin.com/E2071wHF

> DMESG output after the crash:
> sudo dmesg | grep amdgpu

https://pastebin.com/2kWpeP1y

> systemd logs output after the crash (If your system did not freeze and you
> can get it before reboot):
> sudo journalctl -b | grep amdgpu

https://pastebin.com/4e1PkJ39

> systemd logs output after the crash (If your system froze and you get logs
> after reboot):
> sudo journalctl -b -1 | grep amdgpu

https://pastebin.com/4mqXNsNQ



Hopefully this information is detailed enough to assist in tracking down the
root cause of the issue!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15673781974.d99aDDaf.16765
Date: Sun, 1 Sep 2019 22:49:57 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c92">Comme=
nt # 92</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jaapbuurman&#64;gmail.com" title=3D"Jaap Buurman &lt;jaapbuurman&#64;gmail.=
com&gt;"> <span class=3D"fn">Jaap Buurman</span></a>
</span></b>
        <pre>(In reply to Mauro Gaspari from <a href=3D"show_bug.cgi?id=3D1=
09955#c90">comment #90</a>)
<span class=3D"quote">&gt; &#64;Sam and &#64;Jaap Buurman
&gt;=20
&gt; Can you please help and post system info regarding your crash? I hope =
that
&gt; with more detailed reports, we can get better help.</span >

OS: Arch Linux x86_64=20
                `+oooo:                  Host: AB350-Gaming 3=20
               `+oooooo:                 Kernel: 5.2.11-arch1-1-ARCH=20
               -+oooooo+:                Uptime: 1 min=20
             `/:-:++oooo+:               Packages: 1229 (pacman)=20
            `/++++/+++++++:              Shell: bash 5.0.9=20
           `/++++++++++++++:             Terminal: /dev/pts/0=20
          `/+++ooooooooooooo/`           CPU: AMD Ryzen 7 1800X (16) &#64; =
3.600GHz=20
         ./ooosssso++osssssso+`          GPU: AMD ATI Radeon RX Vega 56/64=
=20
        .oossssso-````/ossssss+`         Memory: 1178MiB / 48304MiB=20



<span class=3D"quote">&gt; Mesa info can be taken from this command:
&gt; glxinfo | grep &quot;OpenGL version&quot; </span >

[jaap&#64;Jaap-Desktop ~]$ glxinfo | grep &quot;OpenGL version&quot;
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.3.0-devel
(git-db73bde35c)

I am running this version because I was trying out the mesa-aco from the AU=
R. I
experienced the same crashes with the regular mesa drivers from Arch's offi=
cial
repositories.

<span class=3D"quote">&gt; Game being played: </span >

World of Warcraft: Classic Wine/DXVK 1.3.2

<span class=3D"quote">&gt; Crash type: Game crash? Full System freeze? Syst=
em freeze but still can drop
&gt; to tty?</span >

GPU doesn't successfully reset. Cannot drop to a different tty. However, I =
am
able to access logs via SSH. Full dmesg log: <a href=3D"https://pastebin.co=
m/E2071wHF">https://pastebin.com/E2071wHF</a>

<span class=3D"quote">&gt; DMESG output after the crash:
&gt; sudo dmesg | grep amdgpu</span >

<a href=3D"https://pastebin.com/2kWpeP1y">https://pastebin.com/2kWpeP1y</a>

<span class=3D"quote">&gt; systemd logs output after the crash (If your sys=
tem did not freeze and you
&gt; can get it before reboot):
&gt; sudo journalctl -b | grep amdgpu</span >

<a href=3D"https://pastebin.com/4e1PkJ39">https://pastebin.com/4e1PkJ39</a>

<span class=3D"quote">&gt; systemd logs output after the crash (If your sys=
tem froze and you get logs
&gt; after reboot):
&gt; sudo journalctl -b -1 | grep amdgpu</span >

<a href=3D"https://pastebin.com/4mqXNsNQ">https://pastebin.com/4mqXNsNQ</a>



Hopefully this information is detailed enough to assist in tracking down the
root cause of the issue!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15673781974.d99aDDaf.16765--

--===============2048614528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2048614528==--
