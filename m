Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6581F113A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 09:38:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC286EC64;
	Wed,  6 Nov 2019 08:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 84E3B6EC59
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 08:38:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 82453720E2; Wed,  6 Nov 2019 08:38:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Wed, 06 Nov 2019 08:38:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: ousleyaric@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-fYAIwyzASx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1288055685=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1288055685==
Content-Type: multipart/alternative; boundary="15730295004.5f6F4Ea.21330"
Content-Transfer-Encoding: 7bit


--15730295004.5f6F4Ea.21330
Date: Wed, 6 Nov 2019 08:38:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #210 from Lazy <ousleyaric@gmail.com> ---
To clarify, first: it's an Asus reference (blower-style) 5700XT
I can't use the overclock utilities without a crash coming within the hour =
on
Windows 10 or any of my Linux installs, no fan profiles, no manual control =
of
fans, no setting it to "high performance" on the dynamic clock or it crashes
within the hour. No exceptions, no setting then resetting the setting to
default to get around it.

Generally speaking, it maxes around 75C, but that's mostly due to the defau=
lt
fan profile only ramping up enough to negate further gains at that point (I=
'm
guessing that's to do with trying to keep the card quiet). If I supply cool
air, it'll slow the fan, and the heat still comes eventually.

Some things that may or may not be relevant:

This card crashes mostly around times that the clock rate adjusts more ofte=
n;
If the card goes from, say, max freq to a step below and back, there's a ch=
ance
of a crash. (maybe coincidence, maybe not, I don't know to be bluntly hones=
t)
This is a constant I've noticed on both OSes. Windows 10 tends to keep thin=
gs
relatively stable in that regard, while Manjaro tends to see a lot of spiki=
ng
and sudden drops. SteamVR definitely instigates that kind of behavior in my
experience on my old Vega 56 as well (Which with nodma set on Navi, is actu=
ally
not much different tbh). Probably explains why ever since the latest set of
patches, the majority of the time it crashes is after an hour or two of
gameplay in Manjaro. (also no idea why Manjaro switches more often..)

To be blunt, though, in both OSes, seemingly random hangs are also a common
occurrence for me. I had Win10 just yesterday, hang completely, no recovery,
simply animating a minimizing window as SteamVR first opened. Granted, this
also coincided with a rapid up-tick in clock speed most likely, as I've
observed this massive spike on launching SteamVR via GPU adjusting utilities
before I realized they instigate the issue as well.

Setting nodma does get rid of some of the more random crashes, but these on=
es
stick around in my experience so far. Maybe 75C is a bit high, but in neith=
er
OS can I manage to adjust the fans without the same issue, so.. No idea wha=
t to
do, here.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15730295004.5f6F4Ea.21330
Date: Wed, 6 Nov 2019 08:38:20 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c210">Comm=
ent # 210</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ousleyaric&#64;gmail.com" title=3D"Lazy &lt;ousleyaric&#64;gmail.com&gt;"> =
<span class=3D"fn">Lazy</span></a>
</span></b>
        <pre>To clarify, first: it's an Asus reference (blower-style) 5700XT
I can't use the overclock utilities without a crash coming within the hour =
on
Windows 10 or any of my Linux installs, no fan profiles, no manual control =
of
fans, no setting it to &quot;high performance&quot; on the dynamic clock or=
 it crashes
within the hour. No exceptions, no setting then resetting the setting to
default to get around it.

Generally speaking, it maxes around 75C, but that's mostly due to the defau=
lt
fan profile only ramping up enough to negate further gains at that point (I=
'm
guessing that's to do with trying to keep the card quiet). If I supply cool
air, it'll slow the fan, and the heat still comes eventually.

Some things that may or may not be relevant:

This card crashes mostly around times that the clock rate adjusts more ofte=
n;
If the card goes from, say, max freq to a step below and back, there's a ch=
ance
of a crash. (maybe coincidence, maybe not, I don't know to be bluntly hones=
t)
This is a constant I've noticed on both OSes. Windows 10 tends to keep thin=
gs
relatively stable in that regard, while Manjaro tends to see a lot of spiki=
ng
and sudden drops. SteamVR definitely instigates that kind of behavior in my
experience on my old Vega 56 as well (Which with nodma set on Navi, is actu=
ally
not much different tbh). Probably explains why ever since the latest set of
patches, the majority of the time it crashes is after an hour or two of
gameplay in Manjaro. (also no idea why Manjaro switches more often..)

To be blunt, though, in both OSes, seemingly random hangs are also a common
occurrence for me. I had Win10 just yesterday, hang completely, no recovery,
simply animating a minimizing window as SteamVR first opened. Granted, this
also coincided with a rapid up-tick in clock speed most likely, as I've
observed this massive spike on launching SteamVR via GPU adjusting utilities
before I realized they instigate the issue as well.

Setting nodma does get rid of some of the more random crashes, but these on=
es
stick around in my experience so far. Maybe 75C is a bit high, but in neith=
er
OS can I manage to adjust the fans without the same issue, so.. No idea wha=
t to
do, here.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15730295004.5f6F4Ea.21330--

--===============1288055685==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1288055685==--
