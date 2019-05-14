Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4621E1D115
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 23:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21ED189319;
	Tue, 14 May 2019 21:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C018D89301
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 21:12:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BC55F721CD; Tue, 14 May 2019 21:12:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110117] Waking from Suspend causes screen to appear with grey
 static (like a TV with no signal)
Date: Tue, 14 May 2019 21:12:34 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stein12c@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110117-502-B5S4EnQGqr@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110117-502@http.bugs.freedesktop.org/>
References: <bug-110117-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1628470035=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1628470035==
Content-Type: multipart/alternative; boundary="15578683541.dFa0E.1303"
Content-Transfer-Encoding: 7bit


--15578683541.dFa0E.1303
Date: Tue, 14 May 2019 21:12:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110117

--- Comment #9 from Craig <stein12c@gmail.com> ---
I would like to add to this some additional troubleshooting I have performe=
d,
in case it is of use.



just a short history: I am unable to suspend with any Linux distribution an=
d be
able to resume again. Currently running Ubuntu 19.04.

I am attempting to follow the steps here to trace the problem:
https://wiki.ubuntu.com/DebuggingKernelSuspend

This is what I have done so far:

$ sudo apt install pm-utils
$ sudo sh -c "sync && echo 1 > /sys/power/pm_trace && pm-suspend"

I resumed but got my usual screen garbage (looks like static on the screen)=
. I
ssh'd in and did a sudo reboot

Right away I ran this:

$ dmesg > dmesg_post_boot.txt

I looked for Magic number in the dmesg per the ubuntu wiki above and found
these lines:

[    0.950964]   Magic number: 0:66:1001
[    0.950965]   hash matches drivers/base/power/main.c:1012

Now the instructions are to exclude this module from the next boot and see =
if I
can replicate the problem. How do I exclude main.c or do I even want to? Is=
 it
even possible that the bug is here?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15578683541.dFa0E.1303
Date: Tue, 14 May 2019 21:12:34 +0000
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
   title=3D"NEW - Waking from Suspend causes screen to appear with grey sta=
tic (like a TV with no signal)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110117#c9">Commen=
t # 9</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Waking from Suspend causes screen to appear with grey sta=
tic (like a TV with no signal)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110117">bug 11011=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stein12c&#64;gmail.com" title=3D"Craig &lt;stein12c&#64;gmail.com&gt;"> <sp=
an class=3D"fn">Craig</span></a>
</span></b>
        <pre>I would like to add to this some additional troubleshooting I =
have performed,
in case it is of use.



just a short history: I am unable to suspend with any Linux distribution an=
d be
able to resume again. Currently running Ubuntu 19.04.

I am attempting to follow the steps here to trace the problem:
<a href=3D"https://wiki.ubuntu.com/DebuggingKernelSuspend">https://wiki.ubu=
ntu.com/DebuggingKernelSuspend</a>

This is what I have done so far:

$ sudo apt install pm-utils
$ sudo sh -c &quot;sync &amp;&amp; echo 1 &gt; /sys/power/pm_trace &amp;&am=
p; pm-suspend&quot;

I resumed but got my usual screen garbage (looks like static on the screen)=
. I
ssh'd in and did a sudo reboot

Right away I ran this:

$ dmesg &gt; dmesg_post_boot.txt

I looked for Magic number in the dmesg per the ubuntu wiki above and found
these lines:

[    0.950964]   Magic number: 0:66:1001
[    0.950965]   hash matches drivers/base/power/main.c:1012

Now the instructions are to exclude this module from the next boot and see =
if I
can replicate the problem. How do I exclude main.c or do I even want to? Is=
 it
even possible that the bug is here?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15578683541.dFa0E.1303--

--===============1628470035==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1628470035==--
