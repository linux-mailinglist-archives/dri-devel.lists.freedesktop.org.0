Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04499A4265
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2019 07:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2A16E2C4;
	Sat, 31 Aug 2019 05:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E5B206E175
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 05:21:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CCE7C72161; Sat, 31 Aug 2019 05:21:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Sat, 31 Aug 2019 05:21:20 +0000
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
Message-ID: <bug-109955-502-b8fchNvF7C@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0069115281=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0069115281==
Content-Type: multipart/alternative; boundary="15672288800.17E689f.12221"
Content-Transfer-Encoding: 7bit


--15672288800.17E689f.12221
Date: Sat, 31 Aug 2019 05:21:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

--- Comment #90 from Mauro Gaspari <ilvipero@gmx.com> ---
@Sam and @Jaap Buurman

Can you please help and post system info regarding your crash? I hope that =
with
more detailed reports, we can get better help.

Example:

OS Info can be taken from neofetch:
System info:
OS: openSUSE Tumbleweed
Kernel: 5.2.10-1-default
Resolution: 3440x1440
CPU: AMD Ryzen 7 2700X (16) @ 3.700GHz
GPU: AMD ATI Radeon VII=20
Memory: 6308MiB / 64387MiB=20


Mesa info can be taken from this command:
glxinfo | grep "OpenGL version"=20
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.5


Game being played: Eve Online
Native or Wine or Wine+DXVK: Wine+DXVK Directx11


Crash type: Game crash? Full System freeze? System freeze but still can dro=
p to
tty?



DMESG output after the crash:
sudo dmesg | grep amdgpu



systemd logs output after the crash (If your system did not freeze and you =
can
get it before reboot):
sudo journalctl -b | grep amdgpu


systemd logs output after the crash (If your system froze and you get logs
after reboot):
sudo journalctl -b -1 | grep amdgpu

If your distribution does not use persistent systemd logs you can change it
according to your distribution. Example for openSUSE:
https://www.suse.com/documentation/sles-12/book_sle_admin/data/journalctl_p=
ersistent.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15672288800.17E689f.12221
Date: Sat, 31 Aug 2019 05:21:20 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c90">Comme=
nt # 90</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ilvipero&#64;gmx.com" title=3D"Mauro Gaspari &lt;ilvipero&#64;gmx.com&gt;">=
 <span class=3D"fn">Mauro Gaspari</span></a>
</span></b>
        <pre>&#64;Sam and &#64;Jaap Buurman

Can you please help and post system info regarding your crash? I hope that =
with
more detailed reports, we can get better help.

Example:

OS Info can be taken from neofetch:
System info:
OS: openSUSE Tumbleweed
Kernel: 5.2.10-1-default
Resolution: 3440x1440
CPU: AMD Ryzen 7 2700X (16) &#64; 3.700GHz
GPU: AMD ATI Radeon VII=20
Memory: 6308MiB / 64387MiB=20


Mesa info can be taken from this command:
glxinfo | grep &quot;OpenGL version&quot;=20
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.1.5


Game being played: Eve Online
Native or Wine or Wine+DXVK: Wine+DXVK Directx11


Crash type: Game crash? Full System freeze? System freeze but still can dro=
p to
tty?



DMESG output after the crash:
sudo dmesg | grep amdgpu



systemd logs output after the crash (If your system did not freeze and you =
can
get it before reboot):
sudo journalctl -b | grep amdgpu


systemd logs output after the crash (If your system froze and you get logs
after reboot):
sudo journalctl -b -1 | grep amdgpu

If your distribution does not use persistent systemd logs you can change it
according to your distribution. Example for openSUSE:
<a href=3D"https://www.suse.com/documentation/sles-12/book_sle_admin/data/j=
ournalctl_persistent.html">https://www.suse.com/documentation/sles-12/book_=
sle_admin/data/journalctl_persistent.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15672288800.17E689f.12221--

--===============0069115281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0069115281==--
