Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A3CC9C0
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 13:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EBC56E23F;
	Sat,  5 Oct 2019 11:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71D716E23F
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 11:55:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6ED2172162; Sat,  5 Oct 2019 11:55:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Sat, 05 Oct 2019 11:55:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-44PNHhVgHS@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111482-502@http.bugs.freedesktop.org/>
References: <bug-111482-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0637160411=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0637160411==
Content-Type: multipart/alternative; boundary="15702765290.EBbabbccD.10780"
Content-Transfer-Encoding: 7bit


--15702765290.EBbabbccD.10780
Date: Sat, 5 Oct 2019 11:55:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #23 from Andrew Sheldon <asheldon55@gmail.com> ---
@Leon

I suspect there is more than one bug occurring. The main Navi-specific issue
has been fixed with newer kernels (that affected everyone), but there is
another issue relating to high resolution and high refresh rate monitors, t=
hat
looks to affect at least Navi, Vega (and probably Polaris going by other
reports).

The secondary issue is probably by design to an extent. High res/refresh ra=
te
requires a lot more bandwidth which needs a higher memory clock. However, I
suspect there are two problems within this:

- Once a high bandwidth mode is used and the maximum memory clock is chosen=
, it
never switches down again (even if you switch to a lower bandwidth mode).
Particularly, if you boot at 2560x1440@144hz, you won't be able to switch d=
own
again.
- The choice of memory clock is higher than it needs to be, even for high
bandwidth modes

You can workaround this to some extent on Vega by writing to the powerplay
tables (while in a high bandwidth mode) and, in the case of Vega, the card =
will
stay in the more reasonable memory clock of 700mhz (versus the max of 950mh=
z).
However, if you then switch to any other high bandwidth mode (e.g.
2560x1440@120), the problem will return (card stuck at 950mhz).

I don't recommend trying that on Navi as powerplay table writing is current=
ly
buggy without reverting a commit, I haven't confirmed the behaviour there, =
but
I suspect the same workaround will work.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15702765290.EBbabbccD.10780
Date: Sat, 5 Oct 2019 11:55:29 +0000
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
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
asheldon55&#64;gmail.com" title=3D"Andrew Sheldon &lt;asheldon55&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrew Sheldon</span></a>
</span></b>
        <pre>&#64;Leon

I suspect there is more than one bug occurring. The main Navi-specific issue
has been fixed with newer kernels (that affected everyone), but there is
another issue relating to high resolution and high refresh rate monitors, t=
hat
looks to affect at least Navi, Vega (and probably Polaris going by other
reports).

The secondary issue is probably by design to an extent. High res/refresh ra=
te
requires a lot more bandwidth which needs a higher memory clock. However, I
suspect there are two problems within this:

- Once a high bandwidth mode is used and the maximum memory clock is chosen=
, it
never switches down again (even if you switch to a lower bandwidth mode).
Particularly, if you boot at 2560x1440&#64;144hz, you won't be able to swit=
ch down
again.
- The choice of memory clock is higher than it needs to be, even for high
bandwidth modes

You can workaround this to some extent on Vega by writing to the powerplay
tables (while in a high bandwidth mode) and, in the case of Vega, the card =
will
stay in the more reasonable memory clock of 700mhz (versus the max of 950mh=
z).
However, if you then switch to any other high bandwidth mode (e.g.
2560x1440&#64;120), the problem will return (card stuck at 950mhz).

I don't recommend trying that on Navi as powerplay table writing is current=
ly
buggy without reverting a commit, I haven't confirmed the behaviour there, =
but
I suspect the same workaround will work.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15702765290.EBbabbccD.10780--

--===============0637160411==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0637160411==--
