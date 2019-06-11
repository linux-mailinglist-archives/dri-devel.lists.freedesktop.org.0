Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7793D572
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 20:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625188924B;
	Tue, 11 Jun 2019 18:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0493F89265
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 18:24:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EFB7872167; Tue, 11 Jun 2019 18:24:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110781] Radeon: heavy r300 performance drop regression between
 11.x and 19.x
Date: Tue, 11 Jun 2019 18:24:37 +0000
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
Message-ID: <bug-110781-502-y0NljvaSe9@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0982733766=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0982733766==
Content-Type: multipart/alternative; boundary="15602774760.955Fd8.14512"
Content-Transfer-Encoding: 7bit


--15602774760.955Fd8.14512
Date: Tue, 11 Jun 2019 18:24:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110781

--- Comment #66 from Richard Thier <u9vata@gmail.com> ---
> Yes, I think it's a good idea to open a new bug.

Added seperate bug for working on HyperZ glitches:

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

> By the way, I have a vague memory of HiZ on the R4xx being exclusive (i.e=
.,
> only the first app to use the Z-buffer gets HiZ), but I could be complete=
ly wrong.

It is exclusive, but not to the first app it seems. The code to get hyperZ
ownership is in the buffer clearing function and I see it with my bare eyes
right now so I think not only the first app can get it, but if you exit that
automatically some of the next one (that gets clear called first).

> It worked fine here, too.

Is there any indicator to look for? Like shader files on disk at some place=
s or
near the runned binary or current dir or whatever with this or that name?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15602774760.955Fd8.14512
Date: Tue, 11 Jun 2019 18:24:36 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110781#c66">Comme=
nt # 66</a>
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
        <pre><span class=3D"quote">&gt; Yes, I think it's a good idea to op=
en a new bug.</span >

Added seperate bug for working on HyperZ glitches:

<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"show_bug.cgi?id=3D110897">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110897</a>

<span class=3D"quote">&gt; By the way, I have a vague memory of HiZ on the =
R4xx being exclusive (i.e.,
&gt; only the first app to use the Z-buffer gets HiZ), but I could be compl=
etely wrong.</span >

It is exclusive, but not to the first app it seems. The code to get hyperZ
ownership is in the buffer clearing function and I see it with my bare eyes
right now so I think not only the first app can get it, but if you exit that
automatically some of the next one (that gets clear called first).

<span class=3D"quote">&gt; It worked fine here, too.</span >

Is there any indicator to look for? Like shader files on disk at some place=
s or
near the runned binary or current dir or whatever with this or that name?</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15602774760.955Fd8.14512--

--===============0982733766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0982733766==--
