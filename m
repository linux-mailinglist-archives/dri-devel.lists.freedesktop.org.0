Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6775AA690
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 16:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149886E113;
	Thu,  5 Sep 2019 14:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E5866E113
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 14:53:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 67AB1721EE; Thu,  5 Sep 2019 14:53:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111482] Sapphire Pulse RX 5700 XT power consumption
Date: Thu, 05 Sep 2019 14:53:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: imirkin@alum.mit.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111482-502-84lYh1G9oV@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1456038771=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1456038771==
Content-Type: multipart/alternative; boundary="15676952301.5B5F499.14537"
Content-Transfer-Encoding: 7bit


--15676952301.5B5F499.14537
Date: Thu, 5 Sep 2019 14:53:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111482

--- Comment #14 from Ilia Mirkin <imirkin@alum.mit.edu> ---
(In reply to Robert from comment #12)
> At least I now know that I can't do anything further. It just would be co=
ol
> if one of the AMD engineers could confirm my assumption that with a
> resolution of 5144x1440 the card always runs at highest memory clock speed
> as it does with a multi monitor setup (from what I've read so far).

[Note, I'm not an AMD engineer.]

In some monitors, such high modes are actually exposed by presenting multip=
le
"tiles" as separate screens. As far as the GPU is concerned, it's 2 actual
monitors (this can only work with DisplayPort, of course).

Can you check if this is the case? I believe "xrandr" should report 2 separ=
ate
monitors in this situation. You mention you have a 49WL95C-W, which the
internet suggests is indeed just 2 panels placed next to each other in a ni=
ce
plastic case.

And in such cases, I believe the AMD drivers clock to the highest rate, sin=
ce
reclocks will cause flickering (since the vsync's of the 2 monitors aren't
sync'd to one another).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15676952301.5B5F499.14537
Date: Thu, 5 Sep 2019 14:53:50 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Sapphire Pulse RX 5700 XT power consumption"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111482">bug 11148=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Robert from <a href=3D"show_bug.cgi?id=3D111482#c=
12">comment #12</a>)
<span class=3D"quote">&gt; At least I now know that I can't do anything fur=
ther. It just would be cool
&gt; if one of the AMD engineers could confirm my assumption that with a
&gt; resolution of 5144x1440 the card always runs at highest memory clock s=
peed
&gt; as it does with a multi monitor setup (from what I've read so far).</s=
pan >

[Note, I'm not an AMD engineer.]

In some monitors, such high modes are actually exposed by presenting multip=
le
&quot;tiles&quot; as separate screens. As far as the GPU is concerned, it's=
 2 actual
monitors (this can only work with DisplayPort, of course).

Can you check if this is the case? I believe &quot;xrandr&quot; should repo=
rt 2 separate
monitors in this situation. You mention you have a 49WL95C-W, which the
internet suggests is indeed just 2 panels placed next to each other in a ni=
ce
plastic case.

And in such cases, I believe the AMD drivers clock to the highest rate, sin=
ce
reclocks will cause flickering (since the vsync's of the 2 monitors aren't
sync'd to one another).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15676952301.5B5F499.14537--

--===============1456038771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1456038771==--
