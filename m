Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 663A36292C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 21:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E146E03D;
	Mon,  8 Jul 2019 19:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4865A6E03D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 19:18:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 450DD72168; Mon,  8 Jul 2019 19:18:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111082] Severe stutter in CS:GO surf servers, despite ~300fps
Date: Mon, 08 Jul 2019 19:18:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111082-502-ppRQgSMqSN@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111082-502@http.bugs.freedesktop.org/>
References: <bug-111082-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0598684795=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0598684795==
Content-Type: multipart/alternative; boundary="15626135121.4b0bBF455.9293"
Content-Transfer-Encoding: 7bit


--15626135121.4b0bBF455.9293
Date: Mon, 8 Jul 2019 19:18:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111082

--- Comment #7 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
> My CPU load is also super low and never above 50 % on a single
> core.

This is the issue: looks like cpu capping in the 3d engine.
But, since csgo 3d engine is direct3d designed, this is why vulkan.

linux csgo devs are the ones who can profile properly their game and figure=
 out
the culprit.
(could be linux networking related too).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15626135121.4b0bBF455.9293
Date: Mon, 8 Jul 2019 19:18:32 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Severe stutter in CS:GO surf servers, despite =
~300fps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111082#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Severe stutter in CS:GO surf servers, despite =
~300fps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111082">bug 11108=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sylvain.bertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertr=
and&#64;gmail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; My CPU load is also super low and n=
ever above 50 % on a single
&gt; core.</span >

This is the issue: looks like cpu capping in the 3d engine.
But, since csgo 3d engine is direct3d designed, this is why vulkan.

linux csgo devs are the ones who can profile properly their game and figure=
 out
the culprit.
(could be linux networking related too).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15626135121.4b0bBF455.9293--

--===============0598684795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0598684795==--
