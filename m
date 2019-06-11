Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6937B3CF59
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 16:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 013248916F;
	Tue, 11 Jun 2019 14:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D22708916F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 14:44:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CF41D72167; Tue, 11 Jun 2019 14:44:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] [Bisected]Booting with kernel version 5.1.0 or higher
 on RX 580 hangs
Date: Tue, 11 Jun 2019 14:44:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: b6khqjqov4@ugsbm.anonbox.net
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110822-502-KpyptGil2i@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110822-502@http.bugs.freedesktop.org/>
References: <bug-110822-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1954515061=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1954515061==
Content-Type: multipart/alternative; boundary="15602642531.0dFeAeb3F.15011"
Content-Transfer-Encoding: 7bit


--15602642531.0dFeAeb3F.15011
Date: Tue, 11 Jun 2019 14:44:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #17 from b6khqjqov4@ugsbm.anonbox.net ---
(In reply to Gobinda Joy from comment #16)
> This doesn't seems like the same bug. For instance, in my case the whole
> boot process hangs check the attached log files. In your case you can boot
> the system but problem arise when you load the GPU maybe. Not the same bu=
g.

You could still try disabling the integrated graphics in the BIOS. AFAICR I
could always log in into the Cinnamon desktop and only then I would get a h=
ard
freeze within minutes up to several hours, not within the boot process itse=
lf,
so maybe indeed not the same bug. The RX 590 needed additional commits to be
supported in Linux, so maybe similar but different issues.
(I assume you can you boot without the RX 590 using your CPU's integrated
graphics without any issues with the problematic commit/it really is a RX590
issue, well it must be I guess since it's in AMDgpu and you tested it.)

Because of the Athlon 200GE my 3000 MHz RAM is also running at slower 2133M=
Hz,
but even at the, in fact, safe 2133, that should not be the reason for the
hangs/freezes, as the proof is that you fixed it by bisecting and I fixed my
freezes with my mentioned method.=20

I don't know anything about the calls of those functions and I hope your bug
report is on the devs' radar, especially that you found out the problematic
commit ad51c46e, now.

PS: Fortunately I still have had no freezes/any issues since my fixes
(5.1.8-arch1-1-ARCH now).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602642531.0dFeAeb3F.15011
Date: Tue, 11 Jun 2019 14:44:13 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c17">Comme=
nt # 17</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
b6khqjqov4&#64;ugsbm.anonbox.net" title=3D"b6khqjqov4&#64;ugsbm.anonbox.net=
">b6khqjqov4&#64;ugsbm.anonbox.net</a>
</span></b>
        <pre>(In reply to Gobinda Joy from <a href=3D"show_bug.cgi?id=3D110=
822#c16">comment #16</a>)
<span class=3D"quote">&gt; This doesn't seems like the same bug. For instan=
ce, in my case the whole
&gt; boot process hangs check the attached log files. In your case you can =
boot
&gt; the system but problem arise when you load the GPU maybe. Not the same=
 bug.</span >

You could still try disabling the integrated graphics in the BIOS. AFAICR I
could always log in into the Cinnamon desktop and only then I would get a h=
ard
freeze within minutes up to several hours, not within the boot process itse=
lf,
so maybe indeed not the same bug. The RX 590 needed additional commits to be
supported in Linux, so maybe similar but different issues.
(I assume you can you boot without the RX 590 using your CPU's integrated
graphics without any issues with the problematic commit/it really is a RX590
issue, well it must be I guess since it's in AMDgpu and you tested it.)

Because of the Athlon 200GE my 3000 MHz RAM is also running at slower 2133M=
Hz,
but even at the, in fact, safe 2133, that should not be the reason for the
hangs/freezes, as the proof is that you fixed it by bisecting and I fixed my
freezes with my mentioned method.=20

I don't know anything about the calls of those functions and I hope your bug
report is on the devs' radar, especially that you found out the problematic
commit ad51c46e, now.

PS: Fortunately I still have had no freezes/any issues since my fixes
(5.1.8-arch1-1-ARCH now).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602642531.0dFeAeb3F.15011--

--===============1954515061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1954515061==--
