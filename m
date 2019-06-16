Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6AF476D4
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 22:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BA6890B8;
	Sun, 16 Jun 2019 20:49:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D23CC89187
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 20:49:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CF20972167; Sun, 16 Jun 2019 20:49:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Sun, 16 Jun 2019 20:49:25 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cosiekvfj@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-24IOHPmpKm@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0156472913=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0156472913==
Content-Type: multipart/alternative; boundary="15607181653.47968.7601"
Content-Transfer-Encoding: 7bit


--15607181653.47968.7601
Date: Sun, 16 Jun 2019 20:49:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #63 from cosiekvfj@o2.pl ---
(In reply to Richard Thier from comment #58)
> Also there was one time where things were working for me before changes b=
ut
> I do not know what the pipe value was back then. So yes, there is SOME
> chance that this register can also return 1 in my case too, but it seems
> most of the time (99% at least if not 100%) it returns 3.

It would be lovely if you could replicate that=E2=80=A6

Also this is consistent with your mesa testing earlier. That sometimes when=
 you
compiled mesa with your patches and stock mesa they were both working/not
working. But that means that this weird behaviour:
17.1.2-1 crash(different)
17.1.1-1 crash(different)
17.1.0-1 crash(different)
17.0.5-1 working
17.0.4-2 working
17.0.4-1 crash
17.0.3-2 working
17.0.3-1 crash
17.0.2-2 working
17.0.2-1 crash
17.0.1-2 crash
17.0.1-1 crash
17.0.0-3 crash
17.0.0-2 crash
17.0.0-1 crash
13.0.4-2 crash
is something different than this bug. But I don't believe that there were a=
ny
changes between for example 17.0.3-1 and 17.0.3-2=E2=80=A6

Sooo, reboot, cold start, suspend don't change anything with pipe numbers?

Also if you take a look at my old piglit tests, there were definitely more =
bugs
with HyperZ on.

Also great work so far!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15607181653.47968.7601
Date: Sun, 16 Jun 2019 20:49:25 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c63">Comme=
nt # 63</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cosiekvfj&#64;o2.pl" title=3D"cosiekvfj&#64;o2.pl">cosiekvfj&#64;o2.pl</a>
</span></b>
        <pre>(In reply to Richard Thier from <a href=3D"show_bug.cgi?id=3D1=
10897#c58">comment #58</a>)
<span class=3D"quote">&gt; Also there was one time where things were workin=
g for me before changes but
&gt; I do not know what the pipe value was back then. So yes, there is SOME
&gt; chance that this register can also return 1 in my case too, but it see=
ms
&gt; most of the time (99% at least if not 100%) it returns 3.</span >

It would be lovely if you could replicate that=E2=80=A6

Also this is consistent with your mesa testing earlier. That sometimes when=
 you
compiled mesa with your patches and stock mesa they were both working/not
working. But that means that this weird behaviour:
17.1.2-1 crash(different)
17.1.1-1 crash(different)
17.1.0-1 crash(different)
17.0.5-1 working
17.0.4-2 working
17.0.4-1 crash
17.0.3-2 working
17.0.3-1 crash
17.0.2-2 working
17.0.2-1 crash
17.0.1-2 crash
17.0.1-1 crash
17.0.0-3 crash
17.0.0-2 crash
17.0.0-1 crash
13.0.4-2 crash
is something different than this bug. But I don't believe that there were a=
ny
changes between for example 17.0.3-1 and 17.0.3-2=E2=80=A6

Sooo, reboot, cold start, suspend don't change anything with pipe numbers?

Also if you take a look at my old piglit tests, there were definitely more =
bugs
with HyperZ on.

Also great work so far!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15607181653.47968.7601--

--===============0156472913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0156472913==--
