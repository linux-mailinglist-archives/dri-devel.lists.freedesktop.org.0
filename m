Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EF39D63B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 21:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877096E2A3;
	Mon, 26 Aug 2019 19:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33B096E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 19:03:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 30C9072161; Mon, 26 Aug 2019 19:03:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107835] DisplayPort audio stopped working in a kernel upgrade
Date: Mon, 26 Aug 2019 19:03:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marti@juffo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107835-502-thMP5Ytveo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107835-502@http.bugs.freedesktop.org/>
References: <bug-107835-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1984291825=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1984291825==
Content-Type: multipart/alternative; boundary="15668462231.FfeCB8a.12069"
Content-Transfer-Encoding: 7bit


--15668462231.FfeCB8a.12069
Date: Mon, 26 Aug 2019 19:03:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107835

--- Comment #1 from Marti Raudsepp <marti@juffo.org> ---
Graphics card: ASUS Radeon R9 270
Kernel: 5.2.9-arch1-1-ARCH

I recently had some issues with the "radeon" driver and discovered that the
"amdgpu" driver now has support for Southern Islands (SI) GPUs using the
amdgpu.si_support=3D1 boot flag.

Graphics stuff works great with "amdgpu" so far, however, all HDMI audio
outputs are marked as "(unplugged) (unavailable)". This seems to be a simil=
ar
problem, based on IRC logs by BCMM at
https://dri.freedesktop.org/~cbrill/dri-log/?channel=3Dradeon&highlight_nam=
es=3D&date=3D2018-09-05
which lead me to this bug report.
His screenshot from pavuctl: https://i.imgur.com/67HYPG3.png

Ben, are you still having this issue too?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668462231.FfeCB8a.12069
Date: Mon, 26 Aug 2019 19:03:43 +0000
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
   title=3D"NEW - DisplayPort audio stopped working in a kernel upgrade"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107835#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DisplayPort audio stopped working in a kernel upgrade"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107835">bug 10783=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
marti&#64;juffo.org" title=3D"Marti Raudsepp &lt;marti&#64;juffo.org&gt;"> =
<span class=3D"fn">Marti Raudsepp</span></a>
</span></b>
        <pre>Graphics card: ASUS Radeon R9 270
Kernel: 5.2.9-arch1-1-ARCH

I recently had some issues with the &quot;radeon&quot; driver and discovere=
d that the
&quot;amdgpu&quot; driver now has support for Southern Islands (SI) GPUs us=
ing the
amdgpu.si_support=3D1 boot flag.

Graphics stuff works great with &quot;amdgpu&quot; so far, however, all HDM=
I audio
outputs are marked as &quot;(unplugged) (unavailable)&quot;. This seems to =
be a similar
problem, based on IRC logs by BCMM at
<a href=3D"https://dri.freedesktop.org/~cbrill/dri-log/?channel=3Dradeon&am=
p;highlight_names=3D&amp;date=3D2018-09-05">https://dri.freedesktop.org/~cb=
rill/dri-log/?channel=3Dradeon&amp;highlight_names=3D&amp;date=3D2018-09-05=
</a>
which lead me to this bug report.
His screenshot from pavuctl: <a href=3D"https://i.imgur.com/67HYPG3.png">ht=
tps://i.imgur.com/67HYPG3.png</a>

Ben, are you still having this issue too?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668462231.FfeCB8a.12069--

--===============1984291825==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1984291825==--
