Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B816C667F4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 09:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FA46E2E9;
	Fri, 12 Jul 2019 07:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B6956E2E6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 07:49:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0343C72167; Fri, 12 Jul 2019 07:49:04 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Fri, 12 Jul 2019 07:49:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: ondrej@lang.sk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109206-502-0g7ztJrhmU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109206-502@http.bugs.freedesktop.org/>
References: <bug-109206-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0096110561=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0096110561==
Content-Type: multipart/alternative; boundary="15629177440.fA6E6f.13893"
Content-Transfer-Encoding: 7bit


--15629177440.fA6E6f.13893
Date: Fri, 12 Jul 2019 07:49:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #55 from Ondrej Lang <ondrej@lang.sk> ---
(In reply to Joe Coutcher from comment #54)
> Ondrej - I'm on a fresh install of Ubuntu 19.04 with no workarounds appli=
ed,
> using a similar setup to yours (HP Envy x360 15m-bq121dx.)  I installed
> kernel 5.2 RC7 (since the AMD64 build of 5.2 final on kernel.ubuntu.com is
> broken), and updated to the latest linux-firmware package available on the
> disco feed (1.178.2).  I should also note I'm on HP BIOS firmware version
> 21.  While the system boots to the desktop environment, there's tons of
> garbage, and when using Firefox, screen writes are occuring on random par=
ts
> of the screen.  Also, I attempted running Basemark Web 3.0 in Firefox, and
> can consistently lock up the machine.  For reference, the kernel version =
is
> 5.2.0-050200rc7-lowlatency.

Hi Joe,

I'm quite sure your issue is not related to this ticket. The problem in this
bug report is quite specific and is related to the raven_dmcu.bin firmware.=
 It
has a specific symptom where the screen is not initialized during boot (sta=
ys
blank / black) so I think you need to report your problem somewhere else. A=
lso,
it would be good if you can check the kernel log after crash and see what e=
rror
messages you have and then google for that specific message to find if some=
one
else already created a bug report for it.

I have been running kernel 5.2 since yesterday and had no issues whatsoever=
. I
also just run the Basemark Web 3.0 benchmark and had no issues.

As for your lockups, I know that the AMD APU had problems with random locku=
ps
in earlier kernels (if I remember correctly it was related to the C-state
changes of the CPU), I myself had the problem and for me the fix was to add
"idle=3Dnomwait" to my kernel parameters. That fixed the random lockups for=
 me.
Now I don't know if this issue has already been addressed, last time I tried
without the parameter was kernel 5.0 I think and still had lockups, so this
might not be related to your specific problem, but as I said, best course of
action for you is to inspect the kernel log after a crash, check the error
message and then search for a bug report with that error and report your
findings there.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15629177440.fA6E6f.13893
Date: Fri, 12 Jul 2019 07:49:04 +0000
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
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c55">Comme=
nt # 55</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ondrej&#64;lang.sk" title=3D"Ondrej Lang &lt;ondrej&#64;lang.sk&gt;"> <span=
 class=3D"fn">Ondrej Lang</span></a>
</span></b>
        <pre>(In reply to Joe Coutcher from <a href=3D"show_bug.cgi?id=3D10=
9206#c54">comment #54</a>)
<span class=3D"quote">&gt; Ondrej - I'm on a fresh install of Ubuntu 19.04 =
with no workarounds applied,
&gt; using a similar setup to yours (HP Envy x360 15m-bq121dx.)  I installed
&gt; kernel 5.2 RC7 (since the AMD64 build of 5.2 final on kernel.ubuntu.co=
m is
&gt; broken), and updated to the latest linux-firmware package available on=
 the
&gt; disco feed (1.178.2).  I should also note I'm on HP BIOS firmware vers=
ion
&gt; 21.  While the system boots to the desktop environment, there's tons of
&gt; garbage, and when using Firefox, screen writes are occuring on random =
parts
&gt; of the screen.  Also, I attempted running Basemark Web 3.0 in Firefox,=
 and
&gt; can consistently lock up the machine.  For reference, the kernel versi=
on is
&gt; 5.2.0-050200rc7-lowlatency.</span >

Hi Joe,

I'm quite sure your issue is not related to this ticket. The problem in this
bug report is quite specific and is related to the raven_dmcu.bin firmware.=
 It
has a specific symptom where the screen is not initialized during boot (sta=
ys
blank / black) so I think you need to report your problem somewhere else. A=
lso,
it would be good if you can check the kernel log after crash and see what e=
rror
messages you have and then google for that specific message to find if some=
one
else already created a bug report for it.

I have been running kernel 5.2 since yesterday and had no issues whatsoever=
. I
also just run the Basemark Web 3.0 benchmark and had no issues.

As for your lockups, I know that the AMD APU had problems with random locku=
ps
in earlier kernels (if I remember correctly it was related to the C-state
changes of the CPU), I myself had the problem and for me the fix was to add
&quot;idle=3Dnomwait&quot; to my kernel parameters. That fixed the random l=
ockups for me.
Now I don't know if this issue has already been addressed, last time I tried
without the parameter was kernel 5.0 I think and still had lockups, so this
might not be related to your specific problem, but as I said, best course of
action for you is to inspect the kernel log after a crash, check the error
message and then search for a bug report with that error and report your
findings there.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15629177440.fA6E6f.13893--

--===============0096110561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0096110561==--
