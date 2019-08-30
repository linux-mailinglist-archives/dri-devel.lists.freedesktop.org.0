Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 732CDA3A15
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 17:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB00C6E36B;
	Fri, 30 Aug 2019 15:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04DA66E366
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2019 15:13:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 00A7372161; Fri, 30 Aug 2019 15:13:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109628] WARNING at dcn10_hw_sequencer.c:868
 dcn10_verify_allow_pstate_change_high()
Date: Fri, 30 Aug 2019 15:13:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109628-502-dk4N3YejyP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109628-502@http.bugs.freedesktop.org/>
References: <bug-109628-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1600105666=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1600105666==
Content-Type: multipart/alternative; boundary="15671779902.efFFEE6.22353"
Content-Transfer-Encoding: 7bit


--15671779902.efFFEE6.22353
Date: Fri, 30 Aug 2019 15:13:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109628

--- Comment #10 from Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> ---
(In reply to Johannes Hirte from comment #9)
> git bisect points me to=20
>=20
> commit df8368be1382b442384507a5147c89978cd60702 (refs/bisect/bad)
> Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Date:   Wed Feb 27 12:56:36 2019 -0500
>=20
>     drm/amdgpu: Bump amdgpu version for per-flip plane tiling updates
>=20=20=20=20=20
>     To help xf86-video-amdgpu and mesa know DC supports updating the
>     tiling attributes for a framebuffer per-flip.
>=20=20=20=20=20
>     Cc: Michel D=C3=A4nzer <michel@daenzer.net>
>     Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>     Acked-by: Alex Deucher <alexander.deucher@amd.com>
>     Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
>     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>=20
>=20
> Does this make any sense?

Yes, this is the commit that enabled mesa and xf86-video-amdgpu to use DCC =
for
scanout.

I recently fixed a bug where these warnings could be generated in some use
sequences (notably immediate flipping).

Please try amd-staging-drm-next or apply the following series to your kerne=
l:

https://patchwork.freedesktop.org/series/64614/

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15671779902.efFFEE6.22353
Date: Fri, 30 Aug 2019 15:13:10 +0000
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
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING at dcn10_hw_sequencer.c:868 dcn10_verify_allow_ps=
tate_change_high()"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109628">bug 10962=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicholas.kazlauskas&#64;amd.com" title=3D"Nicholas Kazlauskas &lt;nicholas.=
kazlauskas&#64;amd.com&gt;"> <span class=3D"fn">Nicholas Kazlauskas</span><=
/a>
</span></b>
        <pre>(In reply to Johannes Hirte from <a href=3D"show_bug.cgi?id=3D=
109628#c9">comment #9</a>)
<span class=3D"quote">&gt; git bisect points me to=20
&gt;=20
&gt; commit df8368be1382b442384507a5147c89978cd60702 (refs/bisect/bad)
&gt; Author: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.kazlauskas&=
#64;amd.com">nicholas.kazlauskas&#64;amd.com</a>&gt;
&gt; Date:   Wed Feb 27 12:56:36 2019 -0500
&gt;=20
&gt;     drm/amdgpu: Bump amdgpu version for per-flip plane tiling updates
&gt;=20=20=20=20=20
&gt;     To help xf86-video-amdgpu and mesa know DC supports updating the
&gt;     tiling attributes for a framebuffer per-flip.
&gt;=20=20=20=20=20
&gt;     Cc: Michel D=C3=A4nzer &lt;<a href=3D"mailto:michel&#64;daenzer.ne=
t">michel&#64;daenzer.net</a>&gt;
&gt;     Signed-off-by: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.=
kazlauskas&#64;amd.com">nicholas.kazlauskas&#64;amd.com</a>&gt;
&gt;     Acked-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;
&gt;     Reviewed-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.ols=
ak&#64;amd.com">marek.olsak&#64;amd.com</a>&gt;
&gt;     Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deuche=
r&#64;amd.com">alexander.deucher&#64;amd.com</a>&gt;
&gt;=20
&gt;=20
&gt; Does this make any sense?</span >

Yes, this is the commit that enabled mesa and xf86-video-amdgpu to use DCC =
for
scanout.

I recently fixed a bug where these warnings could be generated in some use
sequences (notably immediate flipping).

Please try amd-staging-drm-next or apply the following series to your kerne=
l:

<a href=3D"https://patchwork.freedesktop.org/series/64614/">https://patchwo=
rk.freedesktop.org/series/64614/</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15671779902.efFFEE6.22353--

--===============1600105666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1600105666==--
