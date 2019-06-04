Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B32935210
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 23:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75F089C93;
	Tue,  4 Jun 2019 21:43:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BFDA689C9B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 21:43:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BC95572167; Tue,  4 Jun 2019 21:43:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109955] amdgpu [RX Vega 64] system freeze while gaming
Date: Tue, 04 Jun 2019 21:43:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.3
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samueldgv@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-109955-502-26F5DqCvQb@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0680219239=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0680219239==
Content-Type: multipart/alternative; boundary="15596846184.27Dc.4914"
Content-Transfer-Encoding: 7bit


--15596846184.27Dc.4914
Date: Tue, 4 Jun 2019 21:43:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109955

Sam <samueldgv@mailbox.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |samueldgv@mailbox.org

--- Comment #27 from Sam <samueldgv@mailbox.org> ---
Hello! I can confirm that I have the same issues. I am using a Vega 56 and
openSUSE Tumbleweed (X11 and KDE) with:

Kernel Version:  5.1.5-1-default
X Server Release:  12004000
Driver:  X.Org Radeon RX Vega (VEGA10, DRM 3.30.0, 5.1.5-1-default, LLVM 7.=
0.1)


I have been having the same freezes exactly as described here since, as far=
 as
I can remember, mesa 19.0.4 and 5.0.13 (based on the Tumbleweed snapshots f=
rom
when this started happening)

This was definitely not happening before on mesa 18.x/LLVM 6 and 7 and kern=
el
4.20. I niehter run overclocks, never messed with firmware/BIOS...etc.
Everything has been running as-is since Oct. 2018 so firmware or BIOS issues
should be discarded, I guess.

In my case, I have also experienced this issue when running non-demanding
OpenGL games and even desktop applications (I had a crash happen on the des=
ktop
with just WxMaxima, a computer algebra system GUI, opened doing nothing)

The easiest way for me to reproduce it is by simply leaving Pillars of Eter=
nity
(an OpenGL unity game) open and idle for an hour or so. I have tried settin=
g up
Kdump and trying to catch some error messages in the logs with no luck. I'm
definitely open for directions on how to get more info if this can help.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15596846184.27Dc.4914
Date: Tue, 4 Jun 2019 21:43:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:samueldgv=
&#64;mailbox.org" title=3D"Sam &lt;samueldgv&#64;mailbox.org&gt;"> <span cl=
ass=3D"fn">Sam</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>samueldgv&#64;mailbox.org
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955#c27">Comme=
nt # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu [RX Vega 64] system freeze while gaming"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109955">bug 10995=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
samueldgv&#64;mailbox.org" title=3D"Sam &lt;samueldgv&#64;mailbox.org&gt;">=
 <span class=3D"fn">Sam</span></a>
</span></b>
        <pre>Hello! I can confirm that I have the same issues. I am using a=
 Vega 56 and
openSUSE Tumbleweed (X11 and KDE) with:

Kernel Version:  5.1.5-1-default
X Server Release:  12004000
Driver:  X.Org Radeon RX Vega (VEGA10, DRM 3.30.0, 5.1.5-1-default, LLVM 7.=
0.1)


I have been having the same freezes exactly as described here since, as far=
 as
I can remember, mesa 19.0.4 and 5.0.13 (based on the Tumbleweed snapshots f=
rom
when this started happening)

This was definitely not happening before on mesa 18.x/LLVM 6 and 7 and kern=
el
4.20. I niehter run overclocks, never messed with firmware/BIOS...etc.
Everything has been running as-is since Oct. 2018 so firmware or BIOS issues
should be discarded, I guess.

In my case, I have also experienced this issue when running non-demanding
OpenGL games and even desktop applications (I had a crash happen on the des=
ktop
with just WxMaxima, a computer algebra system GUI, opened doing nothing)

The easiest way for me to reproduce it is by simply leaving Pillars of Eter=
nity
(an OpenGL unity game) open and idle for an hour or so. I have tried settin=
g up
Kdump and trying to catch some error messages in the logs with no luck. I'm
definitely open for directions on how to get more info if this can help.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15596846184.27Dc.4914--

--===============0680219239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0680219239==--
