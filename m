Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A22DA7517
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77438898AA;
	Tue,  3 Sep 2019 20:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71D0B898AA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 20:41:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6EF1072161; Tue,  3 Sep 2019 20:41:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109389] memory leak in `amdgpu_bo_create()`
Date: Tue, 03 Sep 2019 20:41:32 +0000
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
Message-ID: <bug-109389-502-nwdSZV6b9w@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0993846965=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0993846965==
Content-Type: multipart/alternative; boundary="15675432921.DcAA30fa.30117"
Content-Transfer-Encoding: 7bit


--15675432921.DcAA30fa.30117
Date: Tue, 3 Sep 2019 20:41:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109389

--- Comment #4 from Czcibor Bohusz-Dobosz <czbd@o2.pl> ---
Created attachment 145255
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145255&action=3Dedit
Galactic Civilizations III memleak log without DXVK

As far as I'm understanding the logs that I've gotten, this memory leak does
still occur with Linux 5.2.11-arch1-1-ARCH and Mesa 1.9.15.

In my case, it is most prevalent when a Direct3D game is launched with the =
use
of Wine accompanied by the DXVK translation layer that converts the D3D cal=
ls
to Vulkan - just going to a game's main menu can eat up large amounts of
memory, which are then never freed, not even as the game is closed, until
caches are manually dropped with a command.

However, this seems to also occur to a much smaller extent with DXVK turned
off; I attach a bcc memleak log that showcases the issue with the use of
Galactic Civilizations III v3.9, as the smaller amounts of memory leaked wh=
en
DXVK is not in use make tracing the exact call that permanently leaked memo=
ry
easier - if I'm not anyhow mistaken, that would make it the one that leaked
68550656 bytes in this log.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15675432921.DcAA30fa.30117
Date: Tue, 3 Sep 2019 20:41:32 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109389#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - memory leak in `amdgpu_bo_create()`"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109389">bug 10938=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
czbd&#64;o2.pl" title=3D"Czcibor Bohusz-Dobosz &lt;czbd&#64;o2.pl&gt;"> <sp=
an class=3D"fn">Czcibor Bohusz-Dobosz</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145255=
" name=3D"attach_145255" title=3D"Galactic Civilizations III memleak log wi=
thout DXVK">attachment 145255</a> <a href=3D"attachment.cgi?id=3D145255&amp=
;action=3Dedit" title=3D"Galactic Civilizations III memleak log without DXV=
K">[details]</a></span>
Galactic Civilizations III memleak log without DXVK

As far as I'm understanding the logs that I've gotten, this memory leak does
still occur with Linux 5.2.11-arch1-1-ARCH and Mesa 1.9.15.

In my case, it is most prevalent when a Direct3D game is launched with the =
use
of Wine accompanied by the DXVK translation layer that converts the D3D cal=
ls
to Vulkan - just going to a game's main menu can eat up large amounts of
memory, which are then never freed, not even as the game is closed, until
caches are manually dropped with a command.

However, this seems to also occur to a much smaller extent with DXVK turned
off; I attach a bcc memleak log that showcases the issue with the use of
Galactic Civilizations III v3.9, as the smaller amounts of memory leaked wh=
en
DXVK is not in use make tracing the exact call that permanently leaked memo=
ry
easier - if I'm not anyhow mistaken, that would make it the one that leaked
68550656 bytes in this log.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15675432921.DcAA30fa.30117--

--===============0993846965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0993846965==--
