Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B451167247
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 17:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F26D6E0F3;
	Fri, 12 Jul 2019 15:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C67BB6E0F7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 15:24:30 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C3C5C72167; Fri, 12 Jul 2019 15:24:30 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Fri, 12 Jul 2019 15:24:30 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: joseph.coutcher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109206-502-GeFSenPpsj@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1020576583=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1020576583==
Content-Type: multipart/alternative; boundary="15629450704.13e9D.24042"
Content-Transfer-Encoding: 7bit


--15629450704.13e9D.24042
Date: Fri, 12 Jul 2019 15:24:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #57 from Joe Coutcher <joseph.coutcher@gmail.com> ---
(In reply to Ondrej Lang from comment #55)
> Hi Joe,
>=20
> I'm quite sure your issue is not related to this ticket. The problem in t=
his
> bug report is quite specific and is related to the raven_dmcu.bin firmwar=
e.
> It has a specific symptom where the screen is not initialized during boot
> (stays blank / black) so I think you need to report your problem somewhere
> else. Also, it would be good if you can check the kernel log after crash =
and
> see what error messages you have and then google for that specific message
> to find if someone else already created a bug report for it.
>=20
> I have been running kernel 5.2 since yesterday and had no issues whatsoev=
er.
> I also just run the Basemark Web 3.0 benchmark and had no issues.
>=20
> As for your lockups, I know that the AMD APU had problems with random
> lockups in earlier kernels (if I remember correctly it was related to the
> C-state changes of the CPU), I myself had the problem and for me the fix =
was
> to add "idle=3Dnomwait" to my kernel parameters. That fixed the random lo=
ckups
> for me. Now I don't know if this issue has already been addressed, last t=
ime
> I tried without the parameter was kernel 5.0 I think and still had lockup=
s,
> so this might not be related to your specific problem, but as I said, best
> course of action for you is to inspect the kernel log after a crash, check
> the error message and then search for a bug report with that error and
> report your findings there.

Sorry...I was using the Lynx browser to type out the reply last night and
didn't include all the details.  :-)

My report was related to this issue.  On every distro I've tried (Ubuntu 19=
.04,
Fedora 30, OpenSuSE Tumbleweed), whenever it tries to initialize the firmwa=
re,
the system goes to a black screen.  The only way for me to get around it is=
 to
boot with nomodeset, remove raven_dmcu.bin, update my initrd, and reboot.

My tests were to provide a baseline: fresh install, no workarounds applied,
with kernel 5.2rc7 and latest linux-firmware package (AFAIK.)  Under those
conditions, raven_dmcu.bin loads, I can get to the GUI, but seeing garbage =
on
the screen.

When I have some time this weekend, I'll do some more testing/sift through =
the
logs/try building 5.2 final and see if anything jumps out at me.  I'll also
retry my tests with idle=3Dnomwait.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15629450704.13e9D.24042
Date: Fri, 12 Jul 2019 15:24:30 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c57">Comme=
nt # 57</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
joseph.coutcher&#64;gmail.com" title=3D"Joe Coutcher &lt;joseph.coutcher&#6=
4;gmail.com&gt;"> <span class=3D"fn">Joe Coutcher</span></a>
</span></b>
        <pre>(In reply to Ondrej Lang from <a href=3D"show_bug.cgi?id=3D109=
206#c55">comment #55</a>)
<span class=3D"quote">&gt; Hi Joe,
&gt;=20
&gt; I'm quite sure your issue is not related to this ticket. The problem i=
n this
&gt; bug report is quite specific and is related to the raven_dmcu.bin firm=
ware.
&gt; It has a specific symptom where the screen is not initialized during b=
oot
&gt; (stays blank / black) so I think you need to report your problem somew=
here
&gt; else. Also, it would be good if you can check the kernel log after cra=
sh and
&gt; see what error messages you have and then google for that specific mes=
sage
&gt; to find if someone else already created a bug report for it.
&gt;=20
&gt; I have been running kernel 5.2 since yesterday and had no issues whats=
oever.
&gt; I also just run the Basemark Web 3.0 benchmark and had no issues.
&gt;=20
&gt; As for your lockups, I know that the AMD APU had problems with random
&gt; lockups in earlier kernels (if I remember correctly it was related to =
the
&gt; C-state changes of the CPU), I myself had the problem and for me the f=
ix was
&gt; to add &quot;idle=3Dnomwait&quot; to my kernel parameters. That fixed =
the random lockups
&gt; for me. Now I don't know if this issue has already been addressed, las=
t time
&gt; I tried without the parameter was kernel 5.0 I think and still had loc=
kups,
&gt; so this might not be related to your specific problem, but as I said, =
best
&gt; course of action for you is to inspect the kernel log after a crash, c=
heck
&gt; the error message and then search for a bug report with that error and
&gt; report your findings there.</span >

Sorry...I was using the Lynx browser to type out the reply last night and
didn't include all the details.  :-)

My report was related to this issue.  On every distro I've tried (Ubuntu 19=
.04,
Fedora 30, OpenSuSE Tumbleweed), whenever it tries to initialize the firmwa=
re,
the system goes to a black screen.  The only way for me to get around it is=
 to
boot with nomodeset, remove raven_dmcu.bin, update my initrd, and reboot.

My tests were to provide a baseline: fresh install, no workarounds applied,
with kernel 5.2rc7 and latest linux-firmware package (AFAIK.)  Under those
conditions, raven_dmcu.bin loads, I can get to the GUI, but seeing garbage =
on
the screen.

When I have some time this weekend, I'll do some more testing/sift through =
the
logs/try building 5.2 final and see if anything jumps out at me.  I'll also
retry my tests with idle=3Dnomwait.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15629450704.13e9D.24042--

--===============1020576583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1020576583==--
