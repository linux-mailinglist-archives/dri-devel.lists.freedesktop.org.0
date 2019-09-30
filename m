Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF65C23FD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 17:10:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D356E46E;
	Mon, 30 Sep 2019 15:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A6E3C6E471
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 15:10:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A416472162; Mon, 30 Sep 2019 15:10:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111763] ring_gfx hangs/freezes on Navi gpus
Date: Mon, 30 Sep 2019 15:10:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111763-502-iRMFHbmZ9p@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111763-502@http.bugs.freedesktop.org/>
References: <bug-111763-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1182637513=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1182637513==
Content-Type: multipart/alternative; boundary="15698562383.FeE056bFc.14037"
Content-Transfer-Encoding: 7bit


--15698562383.FeE056bFc.14037
Date: Mon, 30 Sep 2019 15:10:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111763

--- Comment #6 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Doug Ty from comment #5)
> I've been getting this too with Minecraft:=20=20
> https://bugs.freedesktop.org/show_bug.cgi?id=3D111669
>=20
> For my particular case at least, AMD_DEBUG=3Dnodma seems to fix it

(In reply to Marko Popovic from comment #0)
> There is another type of freeze/hang happening when playing Starcraft II =
via
> D9VK. This one doesn't seem to be related to either ngg or dma because I
> have them both disabled by AMD_DEBUG=3Dnodma and AMD_DEBUG=3Dnongg and th=
e hangs
> occur anyway, on exactly the same place every time.

You are refering to sdma0 / sdma1 type hang which is tracked
here:https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

For ring_gfx hangs they're quite more reproducible and are not affected by
AMD_DEBUG=3Dnodma or AMD_DEBUG=3Dnongg which I already mentioned above in t=
he bug
description.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698562383.FeE056bFc.14037
Date: Mon, 30 Sep 2019 15:10:38 +0000
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
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - ring_gfx hangs/freezes on Navi gpus"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111763">bug 11176=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to Doug Ty from <a href=3D"show_bug.cgi?id=3D111763#=
c5">comment #5</a>)
<span class=3D"quote">&gt; I've been getting this too with Minecraft:=20=20
&gt; <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED MOVED - Navi GPU hang in Minecraft"
   href=3D"show_bug.cgi?id=3D111669">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111669</a>
&gt;=20
&gt; For my particular case at least, AMD_DEBUG=3Dnodma seems to fix it</sp=
an >

(In reply to Marko Popovic from <a href=3D"show_bug.cgi?id=3D111763#c0">com=
ment #0</a>)
<span class=3D"quote">&gt; There is another type of freeze/hang happening w=
hen playing Starcraft II via
&gt; D9VK. This one doesn't seem to be related to either ngg or dma because=
 I
&gt; have them both disabled by AMD_DEBUG=3Dnodma and AMD_DEBUG=3Dnongg and=
 the hangs
&gt; occur anyway, on exactly the same place every time.</span >

You are refering to sdma0 / sdma1 type hang which is tracked
here:<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"show_bug.cgi?id=3D111481">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111481</a>

For ring_gfx hangs they're quite more reproducible and are not affected by
AMD_DEBUG=3Dnodma or AMD_DEBUG=3Dnongg which I already mentioned above in t=
he bug
description.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698562383.FeE056bFc.14037--

--===============1182637513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1182637513==--
