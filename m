Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE84D41B3F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 06:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53E28922A;
	Wed, 12 Jun 2019 04:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 427608922A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 04:35:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3ED2872167; Wed, 12 Jun 2019 04:35:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] [Bisected]Booting with kernel version 5.1.0 or higher
 on RX 580 hangs
Date: Wed, 12 Jun 2019 04:35:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: gobinda.joy@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110822-502-jSVusQC26X@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1821774607=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1821774607==
Content-Type: multipart/alternative; boundary="15603141191.7A3E4dF0.7317"
Content-Transfer-Encoding: 7bit


--15603141191.7A3E4dF0.7317
Date: Wed, 12 Jun 2019 04:35:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

--- Comment #18 from Gobinda Joy <gobinda.joy@gmail.com> ---
(In reply to b6khqjqov4 from comment #17)
> (In reply to Gobinda Joy from comment #16)
> > This doesn't seems like the same bug. For instance, in my case the whole
> > boot process hangs check the attached log files. In your case you can b=
oot
> > the system but problem arise when you load the GPU maybe. Not the same =
bug.
>=20
> You could still try disabling the integrated graphics in the BIOS. AFAICR=
 I
> could always log in into the Cinnamon desktop and only then I would get a
> hard freeze within minutes up to several hours, not within the boot proce=
ss
> itself, so maybe indeed not the same bug. The RX 590 needed additional
> commits to be supported in Linux, so maybe similar but different issues.
> (I assume you can you boot without the RX 590 using your CPU's integrated
> graphics without any issues with the problematic commit/it really is a RX=
590
> issue, well it must be I guess since it's in AMDgpu and you tested it.)
>=20
> Because of the Athlon 200GE my 3000 MHz RAM is also running at slower
> 2133MHz, but even at the, in fact, safe 2133, that should not be the reas=
on
> for the hangs/freezes, as the proof is that you fixed it by bisecting and=
 I
> fixed my freezes with my mentioned method.=20
>=20
> I don't know anything about the calls of those functions and I hope your =
bug
> report is on the devs' radar, especially that you found out the problemat=
ic
> commit ad51c46e, now.
>=20
> PS: Fortunately I still have had no freezes/any issues since my fixes
> (5.1.8-arch1-1-ARCH now).

I'm using a discrete GPU so obviously the integrated GPU is disabled. Also =
I'm
using Vt-D to passthrough a LAN card and a sound card to my windows VM. I d=
on't
use that for gaming though. Only use fedora/wine for gaming. Need the windo=
ws
VM for some work related stuff and sometimes music as the sound card driver=
 is
superior in windows.

My 24GB DDR3 Ram is running at 1600 (10-10-10-26 maybe haven't checked in a
while). And you are right slow ram shouldn't be the reason for freezes or
hangs. Apart from that previous kernel was perfect for me. Since your card =
is
RX590 you do need the new commits/kernel to support that. I was happy with
kernel 5.0.17 until fedora decided to push 5.1+ kernel through update.

I am not sure about those function calls myself. But as I read through the
source they are traversing the PCIe tree for the min bandwidth bottleneck or
limiter. and using that to set the max bandwidth for the device in context.

What I don't get is why they are using 2 calls to get the bandwidth reading.
Since both function walking the PCIe tree what's the point. Also it seems l=
ike
the call to pcie_bandwidth_available() function is casing the freeze/hangs =
in
my system. So that's counts for something.

I hope devs noticed this too. As they asked me to bisect this. If they don'=
t I
did all this for nothing. Sorry, not for nothing as I can now run the latest
kernel with that commit reverted.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15603141191.7A3E4dF0.7317
Date: Wed, 12 Jun 2019 04:35:19 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [Bisected]Booting with kernel version 5.1.0 or highe=
r on RX 580 hangs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">bug 11082=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gobinda.joy&#64;gmail.com" title=3D"Gobinda Joy &lt;gobinda.joy&#64;gmail.c=
om&gt;"> <span class=3D"fn">Gobinda Joy</span></a>
</span></b>
        <pre>(In reply to b6khqjqov4 from <a href=3D"show_bug.cgi?id=3D1108=
22#c17">comment #17</a>)
<span class=3D"quote">&gt; (In reply to Gobinda Joy from <a href=3D"show_bu=
g.cgi?id=3D110822#c16">comment #16</a>)
&gt; &gt; This doesn't seems like the same bug. For instance, in my case th=
e whole
&gt; &gt; boot process hangs check the attached log files. In your case you=
 can boot
&gt; &gt; the system but problem arise when you load the GPU maybe. Not the=
 same bug.
&gt;=20
&gt; You could still try disabling the integrated graphics in the BIOS. AFA=
ICR I
&gt; could always log in into the Cinnamon desktop and only then I would ge=
t a
&gt; hard freeze within minutes up to several hours, not within the boot pr=
ocess
&gt; itself, so maybe indeed not the same bug. The RX 590 needed additional
&gt; commits to be supported in Linux, so maybe similar but different issue=
s.
&gt; (I assume you can you boot without the RX 590 using your CPU's integra=
ted
&gt; graphics without any issues with the problematic commit/it really is a=
 RX590
&gt; issue, well it must be I guess since it's in AMDgpu and you tested it.)
&gt;=20
&gt; Because of the Athlon 200GE my 3000 MHz RAM is also running at slower
&gt; 2133MHz, but even at the, in fact, safe 2133, that should not be the r=
eason
&gt; for the hangs/freezes, as the proof is that you fixed it by bisecting =
and I
&gt; fixed my freezes with my mentioned method.=20
&gt;=20
&gt; I don't know anything about the calls of those functions and I hope yo=
ur bug
&gt; report is on the devs' radar, especially that you found out the proble=
matic
&gt; commit ad51c46e, now.
&gt;=20
&gt; PS: Fortunately I still have had no freezes/any issues since my fixes
&gt; (5.1.8-arch1-1-ARCH now).</span >

I'm using a discrete GPU so obviously the integrated GPU is disabled. Also =
I'm
using Vt-D to passthrough a LAN card and a sound card to my windows VM. I d=
on't
use that for gaming though. Only use fedora/wine for gaming. Need the windo=
ws
VM for some work related stuff and sometimes music as the sound card driver=
 is
superior in windows.

My 24GB DDR3 Ram is running at 1600 (10-10-10-26 maybe haven't checked in a
while). And you are right slow ram shouldn't be the reason for freezes or
hangs. Apart from that previous kernel was perfect for me. Since your card =
is
RX590 you do need the new commits/kernel to support that. I was happy with
kernel 5.0.17 until fedora decided to push 5.1+ kernel through update.

I am not sure about those function calls myself. But as I read through the
source they are traversing the PCIe tree for the min bandwidth bottleneck or
limiter. and using that to set the max bandwidth for the device in context.

What I don't get is why they are using 2 calls to get the bandwidth reading.
Since both function walking the PCIe tree what's the point. Also it seems l=
ike
the call to pcie_bandwidth_available() function is casing the freeze/hangs =
in
my system. So that's counts for something.

I hope devs noticed this too. As they asked me to bisect this. If they don'=
t I
did all this for nothing. Sorry, not for nothing as I can now run the latest
kernel with that commit reverted.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15603141191.7A3E4dF0.7317--

--===============1821774607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1821774607==--
