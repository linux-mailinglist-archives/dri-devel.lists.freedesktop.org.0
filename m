Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2130C3D3A8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 19:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32DC89129;
	Tue, 11 Jun 2019 17:12:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC6B189180
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 17:12:18 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B8ED172167; Tue, 11 Jun 2019 17:12:18 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Tue, 11 Jun 2019 17:12:18 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110781-502-eAAaSvfowO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110781-502@http.bugs.freedesktop.org/>
References: <bug-110781-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1193823631=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1193823631==
Content-Type: multipart/alternative; boundary="15602731381.BD81FF.4337"
Content-Transfer-Encoding: 7bit


--15602731381.BD81FF.4337
Date: Tue, 11 Jun 2019 17:12:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #64 from Richard Thier <u9vata@gmail.com> ---
Rui!

Btw I am also running your patch already too and did not see much problems =
so
far, but many of the stuff I am running was DX7 and DX8 level in graphics
settings so I do not know how many times I actually tried your code literal=
ly,
but it is built into my mesa too.

Also Mount&Blade is working well too now! It was misconfigured in the new w=
ine
to have CSMT and that was =C3=BCber-slow on my single core machine leading =
to
starvation and a lot of overhead that was even visible in the perf output.

So far everything works at full speed now!

I am thinking about maybe trying to figure out HyperZ on r300. According to=
 the
feature matrix it is untested and I see bad glitches but elevated performan=
ce.
I already made some changes to try it...

But if I continue with hyperZ stuff likely it will be another bug report, j=
ust
for sake of transparency about knowing this one is pretty much seems solved
completely...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602731381.BD81FF.4337
Date: Tue, 11 Jun 2019 17:12:18 +0000
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
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c64">Comme=
nt # 64</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Radeon: heavy r300 performance drop regression between 11=
.x and 19.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781">bug 11078=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>Rui!

Btw I am also running your patch already too and did not see much problems =
so
far, but many of the stuff I am running was DX7 and DX8 level in graphics
settings so I do not know how many times I actually tried your code literal=
ly,
but it is built into my mesa too.

Also Mount&amp;Blade is working well too now! It was misconfigured in the n=
ew wine
to have CSMT and that was =C3=BCber-slow on my single core machine leading =
to
starvation and a lot of overhead that was even visible in the perf output.

So far everything works at full speed now!

I am thinking about maybe trying to figure out HyperZ on r300. According to=
 the
feature matrix it is untested and I see bad glitches but elevated performan=
ce.
I already made some changes to try it...

But if I continue with hyperZ stuff likely it will be another bug report, j=
ust
for sake of transparency about knowing this one is pretty much seems solved
completely...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602731381.BD81FF.4337--

--===============1193823631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1193823631==--
