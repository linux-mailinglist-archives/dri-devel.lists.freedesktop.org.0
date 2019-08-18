Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3154891999
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 22:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9876E05D;
	Sun, 18 Aug 2019 20:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 622F66E05D
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 20:53:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5489172161; Sun, 18 Aug 2019 20:53:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111415] BUG: kernel NULL pointer dereference - supervisor read
 access in kernel mode
Date: Sun, 18 Aug 2019 20:53:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tseewald@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111415-502-PiXfed4eXz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111415-502@http.bugs.freedesktop.org/>
References: <bug-111415-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1545918875=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1545918875==
Content-Type: multipart/alternative; boundary="15661616300.b6a368.16048"
Content-Transfer-Encoding: 7bit


--15661616300.b6a368.16048
Date: Sun, 18 Aug 2019 20:53:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111415

--- Comment #1 from Tom Seewald <tseewald@gmail.com> ---
This bug report on the kernel bugtracker appears to be the same or at least=
 a
very similar problem:
https://bugzilla.kernel.org/show_bug.cgi?id=3D204181

In that report, Nicholas Kazlauskas posted a possible fix:
https://patchwork.freedesktop.org/series/64505/

I have yet to test to see if this patch resolves the crashes I am experienc=
ing,
but I don't see this as being in the 5.3-rc series, and certainly not in the
5.2 stable releases. Was this fix perhaps overlooked/missed?

So far I just see that it is in amd-staging-drm-next as of August 1st:
https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Damd-staging-drm-next&=
id=3Da4f6a4c7de97335f3452229e67521eae338af10e

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15661616300.b6a368.16048
Date: Sun, 18 Aug 2019 20:53:50 +0000
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
   title=3D"NEW - BUG: kernel NULL pointer dereference - supervisor read ac=
cess in kernel mode"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111415#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - BUG: kernel NULL pointer dereference - supervisor read ac=
cess in kernel mode"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111415">bug 11141=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tseewald&#64;gmail.com" title=3D"Tom Seewald &lt;tseewald&#64;gmail.com&gt;=
"> <span class=3D"fn">Tom Seewald</span></a>
</span></b>
        <pre>This bug report on the kernel bugtracker appears to be the sam=
e or at least a
very similar problem:
<a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D204181">https://bu=
gzilla.kernel.org/show_bug.cgi?id=3D204181</a>

In that report, Nicholas Kazlauskas posted a possible fix:
<a href=3D"https://patchwork.freedesktop.org/series/64505/">https://patchwo=
rk.freedesktop.org/series/64505/</a>

I have yet to test to see if this patch resolves the crashes I am experienc=
ing,
but I don't see this as being in the 5.3-rc series, and certainly not in the
5.2 stable releases. Was this fix perhaps overlooked/missed?

So far I just see that it is in amd-staging-drm-next as of August 1st:
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Damd-stagin=
g-drm-next&amp;id=3Da4f6a4c7de97335f3452229e67521eae338af10e">https://cgit.=
freedesktop.org/~agd5f/linux/commit/?h=3Damd-staging-drm-next&amp;id=3Da4f6=
a4c7de97335f3452229e67521eae338af10e</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15661616300.b6a368.16048--

--===============1545918875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1545918875==--
