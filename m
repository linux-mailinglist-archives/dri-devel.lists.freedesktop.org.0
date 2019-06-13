Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C69B443478
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 11:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B628938F;
	Thu, 13 Jun 2019 09:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B3AF894B7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 09:00:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8852472167; Thu, 13 Jun 2019 09:00:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Thu, 13 Jun 2019 09:00:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-qrjEQ6lN2w@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0718215768=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0718215768==
Content-Type: multipart/alternative; boundary="15604164572.AC9A634b.22843"
Content-Transfer-Encoding: 7bit


--15604164572.AC9A634b.22843
Date: Thu, 13 Jun 2019 09:00:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #16 from Richard Thier <u9vata@gmail.com> ---
Btw I now have no problems at all... This is weird... all I did was to remo=
ve
my printfs so that code is actually stock mesa and I both see the speed gain
and there is no problems whatsoever...

But I rebooted and started glxgears right away with HYPERZ enabled and no o=
ther
programs ever. I could then start anything: browser, tuxracer, ...

I have tried a shutdown of my machine, then start glxgears without HYPERZ a=
nd
then start with and it still worked...

But now I am compiling with "-O0" as I thought it is a good idea if I plan =
to
use gdb.

I am still not sure what fixes it: is it just the "-O0" or me not starting =
the
browser first but glxgears...

TL;DR: If you see this, there might ba a quick hack to completely turn off =
the
machine and turn it on maybe and not start anything that uses the GPU just =
the
3D app that you want to have HYPERZ should maybe start first - or the
workaround is to compile without any optimization maybe... These are the two
things I did and now magically "it just works"... I have no idea...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604164572.AC9A634b.22843
Date: Thu, 13 Jun 2019 09:00:57 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>Btw I now have no problems at all... This is weird... all I di=
d was to remove
my printfs so that code is actually stock mesa and I both see the speed gain
and there is no problems whatsoever...

But I rebooted and started glxgears right away with HYPERZ enabled and no o=
ther
programs ever. I could then start anything: browser, tuxracer, ...

I have tried a shutdown of my machine, then start glxgears without HYPERZ a=
nd
then start with and it still worked...

But now I am compiling with &quot;-O0&quot; as I thought it is a good idea =
if I plan to
use gdb.

I am still not sure what fixes it: is it just the &quot;-O0&quot; or me not=
 starting the
browser first but glxgears...

TL;DR: If you see this, there might ba a quick hack to completely turn off =
the
machine and turn it on maybe and not start anything that uses the GPU just =
the
3D app that you want to have HYPERZ should maybe start first - or the
workaround is to compile without any optimization maybe... These are the two
things I did and now magically &quot;it just works&quot;... I have no idea.=
..</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604164572.AC9A634b.22843--

--===============0718215768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0718215768==--
