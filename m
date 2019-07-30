Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B67D79EC9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 04:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E0D6E2E6;
	Tue, 30 Jul 2019 02:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DC0CB6E2E6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 02:36:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D0ED472167; Tue, 30 Jul 2019 02:36:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111234] amdgpu bug: kernel NULL pointer dereference during
 video playback
Date: Tue, 30 Jul 2019 02:36:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mjevans1983@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111234-502-mwQIbyKnFI@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111234-502@http.bugs.freedesktop.org/>
References: <bug-111234-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1721096134=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1721096134==
Content-Type: multipart/alternative; boundary="15644541630.F2dBE9616.4201"
Content-Transfer-Encoding: 7bit


--15644541630.F2dBE9616.4201
Date: Tue, 30 Jul 2019 02:36:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111234

--- Comment #3 from Michael J Evans <mjevans1983@gmail.com> ---
After looking at the linked bug and your description of my environment (dual
screen and yes KDE / Plasma as a compositor potentially exposing whatever
corner case this is in the kernel driver):

I agree this is likely a duplicate of that issue.

The above dmesg contained the only relevant data post-boot, though if you'd
like sections of specific drivers initializing other other memory data I can
provide a more hand-picked selection of data for the next crash.

After this evening's crash I've updated to the latest arch-linux kernel and
packages.

The kernel is now booting with a 'cmdline' including: amdgpu.gpu_recovery=
=3D1
log_buf_len=3D64M drm.debug=3D84 debug

I've kept my desktop environment the same in the hope that I might collect a
useful crash context with the added data.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15644541630.F2dBE9616.4201
Date: Tue, 30 Jul 2019 02:36:03 +0000
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
   title=3D"NEW - amdgpu bug: kernel NULL pointer dereference during video =
playback"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111234#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu bug: kernel NULL pointer dereference during video =
playback"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111234">bug 11123=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mjevans1983&#64;gmail.com" title=3D"Michael J Evans &lt;mjevans1983&#64;gma=
il.com&gt;"> <span class=3D"fn">Michael J Evans</span></a>
</span></b>
        <pre>After looking at the linked bug and your description of my env=
ironment (dual
screen and yes KDE / Plasma as a compositor potentially exposing whatever
corner case this is in the kernel driver):

I agree this is likely a duplicate of that issue.

The above dmesg contained the only relevant data post-boot, though if you'd
like sections of specific drivers initializing other other memory data I can
provide a more hand-picked selection of data for the next crash.

After this evening's crash I've updated to the latest arch-linux kernel and
packages.

The kernel is now booting with a 'cmdline' including: amdgpu.gpu_recovery=
=3D1
log_buf_len=3D64M drm.debug=3D84 debug

I've kept my desktop environment the same in the hope that I might collect a
useful crash context with the added data.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15644541630.F2dBE9616.4201--

--===============1721096134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1721096134==--
