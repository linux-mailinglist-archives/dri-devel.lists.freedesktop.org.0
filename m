Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1440AC1E1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 23:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF57F892B0;
	Fri,  6 Sep 2019 21:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B4484892B0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 21:14:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B0D8A72161; Fri,  6 Sep 2019 21:14:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109389] memory leak in `amdgpu_bo_create()`
Date: Fri, 06 Sep 2019 21:14:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: czbd@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-109389-502-OfDpqNoB0Y@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109389-502@http.bugs.freedesktop.org/>
References: <bug-109389-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1695214361=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1695214361==
Content-Type: multipart/alternative; boundary="15678044822.08B0.18787"
Content-Transfer-Encoding: 7bit


--15678044822.08B0.18787
Date: Fri, 6 Sep 2019 21:14:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109389

--- Comment #7 from Czcibor Bohusz-Dobosz <czbd@o2.pl> ---
Created attachment 145288
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145288&action=3Dedit
DRM/Radeon glxgears memleak log

Took a while to perform some more tests, and it turns out that running glxg=
ears
with amdgpu also leaks memory - launching a hundred of glxgears instances l=
eaks
about 400 megabytes, only freed after they are killed and the caches are
manually dropped with the command `echo 3 > /proc/sys/vm/drop_caches`.

Because glxgears does not need Vulkan support, it had also been possible fo=
r me
to confirm that the massive persisting leak is definitely caused by the amd=
gpu
driver - attached is a bcc memleak log of glxgears taken with the radeon
driver.

On a side note, launching vkcube seems to leak memory with the described ca=
ll
at a very similar rate as well.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15678044822.08B0.18787
Date: Fri, 6 Sep 2019 21:14:42 +0000
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
   title=3D"NEW - memory leak in `amdgpu_bo_create()`"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109389#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - memory leak in `amdgpu_bo_create()`"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109389">bug 10938=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
czbd&#64;o2.pl" title=3D"Czcibor Bohusz-Dobosz &lt;czbd&#64;o2.pl&gt;"> <sp=
an class=3D"fn">Czcibor Bohusz-Dobosz</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145288=
" name=3D"attach_145288" title=3D"DRM/Radeon glxgears memleak log">attachme=
nt 145288</a> <a href=3D"attachment.cgi?id=3D145288&amp;action=3Dedit" titl=
e=3D"DRM/Radeon glxgears memleak log">[details]</a></span>
DRM/Radeon glxgears memleak log

Took a while to perform some more tests, and it turns out that running glxg=
ears
with amdgpu also leaks memory - launching a hundred of glxgears instances l=
eaks
about 400 megabytes, only freed after they are killed and the caches are
manually dropped with the command `echo 3 &gt; /proc/sys/vm/drop_caches`.

Because glxgears does not need Vulkan support, it had also been possible fo=
r me
to confirm that the massive persisting leak is definitely caused by the amd=
gpu
driver - attached is a bcc memleak log of glxgears taken with the radeon
driver.

On a side note, launching vkcube seems to leak memory with the described ca=
ll
at a very similar rate as well.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15678044822.08B0.18787--

--===============1695214361==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1695214361==--
