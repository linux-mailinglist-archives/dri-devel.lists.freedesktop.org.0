Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060FFD9113
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 14:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96D66E0BB;
	Wed, 16 Oct 2019 12:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B02A96E0BB
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 12:36:32 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id ACB217296E; Wed, 16 Oct 2019 12:36:32 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111599] [CI][RESUME] igt@gem_ctx_isolation@* - skip - Test
 requirement: !(gen > LAST_KNOWN_GEN), SKIP
Date: Wed, 16 Oct 2019 12:36:33 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: martin.peres@free.fr
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111599-502-yVUsum16fW@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111599-502@http.bugs.freedesktop.org/>
References: <bug-111599-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0967090778=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0967090778==
Content-Type: multipart/alternative; boundary="15712293920.C0a3Ea.4406"
Content-Transfer-Encoding: 7bit


--15712293920.C0a3Ea.4406
Date: Wed, 16 Oct 2019 12:36:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111599

--- Comment #4 from Martin Peres <martin.peres@free.fr> ---
(In reply to Chris Wilson from comment #3)
> commit d17a484b3c22706b2b004ef1577f367d79235e43 (upstream/master,
> origin/master, origin/HEAD)
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Wed Oct 2 12:22:29 2019 +0100
>=20
>     i915/gem_ctx_isolation: Bump support for Tigerlake
>=20=20=20=20=20
>     There's very little variation in non-privileged registers for Tigerla=
ke,
>     so we can mostly inherit the set from gen11. There is no whitelist at
>     present, so we do not need to add any special registers.
>=20=20=20=20=20
>     v2: Add COMMON_SLICE_CHICKEN2, GEN9_SLICE_COMMON_ECO_CHICKEN1 and a
>     variety of huc readonly status registers.
>=20=20=20=20=20
>     Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D111599
>     Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>     Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>     Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Looks good, thanks!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15712293920.C0a3Ea.4406
Date: Wed, 16 Oct 2019 12:36:32 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][RESUME] igt&#64;gem_ctx_isolation&#64;* -=
 skip - Test requirement: !(gen &gt; LAST_KNOWN_GEN), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111599#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][RESUME] igt&#64;gem_ctx_isolation&#64;* -=
 skip - Test requirement: !(gen &gt; LAST_KNOWN_GEN), SKIP"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111599">bug 11159=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;free.fr" title=3D"Martin Peres &lt;martin.peres&#64;free.f=
r&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to Chris Wilson from <a href=3D"show_bug.cgi?id=3D11=
1599#c3">comment #3</a>)
<span class=3D"quote">&gt; commit d17a484b3c22706b2b004ef1577f367d79235e43 =
(upstream/master,
&gt; origin/master, origin/HEAD)
&gt; Author: Chris Wilson &lt;<a href=3D"mailto:chris&#64;chris-wilson.co.u=
k">chris&#64;chris-wilson.co.uk</a>&gt;
&gt; Date:   Wed Oct 2 12:22:29 2019 +0100
&gt;=20
&gt;     i915/gem_ctx_isolation: Bump support for Tigerlake
&gt;=20=20=20=20=20
&gt;     There's very little variation in non-privileged registers for Tige=
rlake,
&gt;     so we can mostly inherit the set from gen11. There is no whitelist=
 at
&gt;     present, so we do not need to add any special registers.
&gt;=20=20=20=20=20
&gt;     v2: Add COMMON_SLICE_CHICKEN2, GEN9_SLICE_COMMON_ECO_CHICKEN1 and a
&gt;     variety of huc readonly status registers.
&gt;=20=20=20=20=20
&gt;     Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][RESUME] igt&#64;gem_ctx_isolation&#64;* -=
 skip - Test requirement: !(gen &gt; LAST_KNOWN_GEN), SKIP"
   href=3D"show_bug.cgi?id=3D111599">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111599</a>
&gt;     Signed-off-by: Chris Wilson &lt;<a href=3D"mailto:chris&#64;chris-=
wilson.co.uk">chris&#64;chris-wilson.co.uk</a>&gt;
&gt;     Cc: Mika Kuoppala &lt;<a href=3D"mailto:mika.kuoppala&#64;linux.in=
tel.com">mika.kuoppala&#64;linux.intel.com</a>&gt;
&gt;     Reviewed-by: Mika Kuoppala &lt;<a href=3D"mailto:mika.kuoppala&#64=
;linux.intel.com">mika.kuoppala&#64;linux.intel.com</a>&gt;</span >

Looks good, thanks!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15712293920.C0a3Ea.4406--

--===============0967090778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0967090778==--
