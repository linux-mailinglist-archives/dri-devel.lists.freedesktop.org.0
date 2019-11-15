Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6321CFD3A6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 05:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264966E171;
	Fri, 15 Nov 2019 04:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 47E766E19A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 04:29:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 44941720E2; Fri, 15 Nov 2019 04:29:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112288] Blank display on Ubuntu 19.10 on Ryzen 3 2200G and
 Ryzen 5 2400G APUs
Date: Fri, 15 Nov 2019 04:29:08 +0000
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
Message-ID: <bug-112288-502-VKUK0KxDSG@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1764752127=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1764752127==
Content-Type: multipart/alternative; boundary="15737921482.ddf9F4.24414"
Content-Transfer-Encoding: 7bit


--15737921482.ddf9F4.24414
Date: Fri, 15 Nov 2019 04:29:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112288

--- Comment #9 from Peter D. <peter_s_d@fastmail.com.au> ---
All three ports work.=20=20

If my computer boots to a blank screen, plugging in a second monitor "reset=
s"
the video and both screens display the desktop as clones.=20=20

There are two monitors; a slow one with a maximum vertical refresh rate of =
75
Hz, and a fast one with a maximum vertical refresh rate of 144 Hz.  The fast
monitor has DP, HDMI and VGA ports.  The slow monitor has VGA and DVI ports=
.=20
The motherboard has DP, HDMI, and VGA ports.  Currently there are cables th=
at
can reach ...=20
MoBo DP fast monitor
Mobo HDMI (passive adapter) DVI slow monitor
Mobo VGA slow monitor
This can be rearranged if need be.

The reset trick has happened with;=20
the slow monitor plugged into the VGA port and being revived when the fast
monitor was plugged into the DP, and with=20
the fast monitor plugged into the DP and being revived when the slow monitor
was plugged into the HDMI port.

Currently using a mainline kernel downloaded from Ubuntu.=20

psd@EE:~$ uname -a
Linux EE 5.4.0-050400rc7-generic #201911102031 SMP Mon Nov 11 01:34:23 UTC =
2019
x86_64 x86_64 x86_64 GNU/Linux
psd@EE:~$

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15737921482.ddf9F4.24414
Date: Fri, 15 Nov 2019 04:29:08 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112288#c9">Commen=
t # 9</a>
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
        <pre>All three ports work.=20=20

If my computer boots to a blank screen, plugging in a second monitor &quot;=
resets&quot;
the video and both screens display the desktop as clones.=20=20

There are two monitors; a slow one with a maximum vertical refresh rate of =
75
Hz, and a fast one with a maximum vertical refresh rate of 144 Hz.  The fast
monitor has DP, HDMI and VGA ports.  The slow monitor has VGA and DVI ports=
.=20
The motherboard has DP, HDMI, and VGA ports.  Currently there are cables th=
at
can reach ...=20
MoBo DP fast monitor
Mobo HDMI (passive adapter) DVI slow monitor
Mobo VGA slow monitor
This can be rearranged if need be.

The reset trick has happened with;=20
the slow monitor plugged into the VGA port and being revived when the fast
monitor was plugged into the DP, and with=20
the fast monitor plugged into the DP and being revived when the slow monitor
was plugged into the HDMI port.

Currently using a mainline kernel downloaded from Ubuntu.=20

psd&#64;EE:~$ uname -a
Linux EE 5.4.0-050400rc7-generic #201911102031 SMP Mon Nov 11 01:34:23 UTC =
2019
x86_64 x86_64 x86_64 GNU/Linux
psd&#64;EE:~$</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15737921482.ddf9F4.24414--

--===============1764752127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1764752127==--
