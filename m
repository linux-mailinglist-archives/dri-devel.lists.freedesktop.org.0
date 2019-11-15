Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72BEFD313
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 03:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE166F3DC;
	Fri, 15 Nov 2019 02:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF4C26F3DF
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 02:54:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DBD7A720E2; Fri, 15 Nov 2019 02:54:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112288] Blank display on Ubuntu 19.10 on Ryzen 3 2200G and
 Ryzen 5 2400G APUs
Date: Fri, 15 Nov 2019 02:54:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: peter_s_d@fastmail.com.au
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112288-502-B9D6wfzzCq@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112288-502@http.bugs.freedesktop.org/>
References: <bug-112288-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1673992315=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1673992315==
Content-Type: multipart/alternative; boundary="15737864592.a56D3.7936"
Content-Transfer-Encoding: 7bit


--15737864592.a56D3.7936
Date: Fri, 15 Nov 2019 02:54:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112288

--- Comment #8 from Peter D. <peter_s_d@fastmail.com.au> ---
Hi,=20

I'm the Peter D. who raised the Ubuntu bug report - writing from a different
email address.  I can probably bisect the kernel with a little gentle
instruction.=20

Initial results are;
Raven ridge APU, VGA port, slow monitor (75Hz max refresh rate),
booting with nomodeset gives a stable display, but a very odd result from
xrandr.=20

psd@EE:~$ xrandr
xrandr: Failed to get size of gamma for output default
Screen 0: minimum 1920 x 1080, current 1920 x 1080, maximum 1920 x 1080
default connected 1920x1080+0+0 0mm x 0mm
   1920x1080     77.00*=20
psd@EE:~$=20

Booting new kernels (5.3 onwards?) and no "nomodeset" gives either a blank
screen or a very unstable screen with lots of pixelation and a high risk of
going black.  Here is something that I captured earlier:=20

psd@EE:~$ xrandr
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
DisplayPort-0 disconnected primary (normal left inverted right x axis y axi=
s)
HDMI-A-0 disconnected (normal left inverted right x axis y axis)
DisplayPort-1 connected 1920x1080+0+0 (normal left inverted right x axis y
axis) 531mm x 298mm
   1920x1080     60.00*+
   1680x1050     60.00
   1280x1024     60.02
   1440x900      59.89
   1280x800      59.81
   1152x864      75.00
   1280x720      60.00
   1024x768      70.07    60.00
   800x600       60.32    56.25
   640x480       66.67    59.94
   720x400       70.08
psd@EE:~$=20

"DisplayPort-1" is actually a VGA port.  I believe that there is a conversi=
on
chop on the motherboard, an ASROCK B450 Pro4.=20

Give me some time to swap hardware again.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15737864592.a56D3.7936
Date: Fri, 15 Nov 2019 02:54:19 +0000
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
   title=3D"NEW - Blank display on Ubuntu 19.10 on Ryzen 3 2200G and Ryzen =
5 2400G APUs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112288#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Blank display on Ubuntu 19.10 on Ryzen 3 2200G and Ryzen =
5 2400G APUs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112288">bug 11228=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
peter_s_d&#64;fastmail.com.au" title=3D"Peter D. &lt;peter_s_d&#64;fastmail=
.com.au&gt;"> <span class=3D"fn">Peter D.</span></a>
</span></b>
        <pre>Hi,=20

I'm the Peter D. who raised the Ubuntu bug report - writing from a different
email address.  I can probably bisect the kernel with a little gentle
instruction.=20

Initial results are;
Raven ridge APU, VGA port, slow monitor (75Hz max refresh rate),
booting with nomodeset gives a stable display, but a very odd result from
xrandr.=20

psd&#64;EE:~$ xrandr
xrandr: Failed to get size of gamma for output default
Screen 0: minimum 1920 x 1080, current 1920 x 1080, maximum 1920 x 1080
default connected 1920x1080+0+0 0mm x 0mm
   1920x1080     77.00*=20
psd&#64;EE:~$=20

Booting new kernels (5.3 onwards?) and no &quot;nomodeset&quot; gives eithe=
r a blank
screen or a very unstable screen with lots of pixelation and a high risk of
going black.  Here is something that I captured earlier:=20

psd&#64;EE:~$ xrandr
Screen 0: minimum 320 x 200, current 1920 x 1080, maximum 16384 x 16384
DisplayPort-0 disconnected primary (normal left inverted right x axis y axi=
s)
HDMI-A-0 disconnected (normal left inverted right x axis y axis)
DisplayPort-1 connected 1920x1080+0+0 (normal left inverted right x axis y
axis) 531mm x 298mm
   1920x1080     60.00*+
   1680x1050     60.00
   1280x1024     60.02
   1440x900      59.89
   1280x800      59.81
   1152x864      75.00
   1280x720      60.00
   1024x768      70.07    60.00
   800x600       60.32    56.25
   640x480       66.67    59.94
   720x400       70.08
psd&#64;EE:~$=20

&quot;DisplayPort-1&quot; is actually a VGA port.  I believe that there is =
a conversion
chop on the motherboard, an ASROCK B450 Pro4.=20

Give me some time to swap hardware again.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15737864592.a56D3.7936--

--===============1673992315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1673992315==--
