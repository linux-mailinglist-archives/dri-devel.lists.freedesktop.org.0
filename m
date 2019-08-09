Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3BB87D9D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 17:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB896EE2B;
	Fri,  9 Aug 2019 15:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DC706EE2B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 15:03:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3527D72167; Fri,  9 Aug 2019 15:03:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111305] `ttm_bo_handle_move_mem` sometimes takes more than 50 ms
Date: Fri, 09 Aug 2019 15:03:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111305-502-Kly6VYSNC1@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111305-502@http.bugs.freedesktop.org/>
References: <bug-111305-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0038792488=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0038792488==
Content-Type: multipart/alternative; boundary="15653630150.6FaEb.7250"
Content-Transfer-Encoding: 7bit


--15653630150.6FaEb.7250
Date: Fri, 9 Aug 2019 15:03:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111305

--- Comment #3 from Alex Deucher <alexdeucher@gmail.com> ---
(In reply to Paul Menzel from comment #2)
>=20
> Just to clarify, the VRAM on the external graphics device is powered off,
> correct?

Correct.

>=20
> Are there any tools to analyze these delays?

I guess profiling the relevant functions in ttm.  See if we are waiting on
pages, etc.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15653630150.6FaEb.7250
Date: Fri, 9 Aug 2019 15:03:35 +0000
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
   title=3D"NEW - `ttm_bo_handle_move_mem` sometimes takes more than 50 ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111305#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - `ttm_bo_handle_move_mem` sometimes takes more than 50 ms"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111305">bug 11130=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>(In reply to Paul Menzel from <a href=3D"show_bug.cgi?id=3D111=
305#c2">comment #2</a>)
<span class=3D"quote">&gt;=20
&gt; Just to clarify, the VRAM on the external graphics device is powered o=
ff,
&gt; correct?</span >

Correct.

<span class=3D"quote">&gt;=20
&gt; Are there any tools to analyze these delays?</span >

I guess profiling the relevant functions in ttm.  See if we are waiting on
pages, etc.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15653630150.6FaEb.7250--

--===============0038792488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0038792488==--
