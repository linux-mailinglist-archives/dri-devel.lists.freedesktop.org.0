Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 943E6921F5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 13:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC5C6E10A;
	Mon, 19 Aug 2019 11:17:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78C8D6E109
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 11:17:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7572772161; Mon, 19 Aug 2019 11:17:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102646] Screen flickering under amdgpu-experimental [buggy auto
 power profile]
Date: Mon, 19 Aug 2019 11:17:32 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: magist3r@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102646-502-S2w6gDEja0@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102646-502@http.bugs.freedesktop.org/>
References: <bug-102646-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0048229346=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0048229346==
Content-Type: multipart/alternative; boundary="15662134525.c1256.24972"
Content-Transfer-Encoding: 7bit


--15662134525.c1256.24972
Date: Mon, 19 Aug 2019 11:17:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102646

--- Comment #109 from magist3r <magist3r@gmail.com> ---
(In reply to tempel.julian from comment #108)
> I suppose also the Windows driver enforces maximum VRAM clock in your case
> all the time? If that is true, it would definitely be a cool thing if we
> could get a patch into upstream to cover that as well (Ahzo's patch landed
> in amd-staging-drm-next branch).

I don't have Windows installed on my machine so I don't know.
Anyway the linux driver enforces VRAM clock because of my two monitors are =
out
of sync, and memory reclockimg causes flickering (if I understand correctly
what driver's code do).=20
My patch fixes a bug that breaks this behavior when OverDrive mask is enabl=
ed,
nothing more.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15662134525.c1256.24972
Date: Mon, 19 Aug 2019 11:17:32 +0000
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
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646#c109">Comm=
ent # 109</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
magist3r&#64;gmail.com" title=3D"magist3r &lt;magist3r&#64;gmail.com&gt;"> =
<span class=3D"fn">magist3r</span></a>
</span></b>
        <pre>(In reply to tempel.julian from <a href=3D"show_bug.cgi?id=3D1=
02646#c108">comment #108</a>)
<span class=3D"quote">&gt; I suppose also the Windows driver enforces maxim=
um VRAM clock in your case
&gt; all the time? If that is true, it would definitely be a cool thing if =
we
&gt; could get a patch into upstream to cover that as well (Ahzo's patch la=
nded
&gt; in amd-staging-drm-next branch).</span >

I don't have Windows installed on my machine so I don't know.
Anyway the linux driver enforces VRAM clock because of my two monitors are =
out
of sync, and memory reclockimg causes flickering (if I understand correctly
what driver's code do).=20
My patch fixes a bug that breaks this behavior when OverDrive mask is enabl=
ed,
nothing more.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15662134525.c1256.24972--

--===============0048229346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0048229346==--
