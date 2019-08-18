Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0229141B
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 04:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69736E568;
	Sun, 18 Aug 2019 02:18:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 802FB6E574
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 02:18:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7D06E72161; Sun, 18 Aug 2019 02:18:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Sun, 18 Aug 2019 02:18:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: briancschott@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111122-502-TMHzibEB5X@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111122-502@http.bugs.freedesktop.org/>
References: <bug-111122-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0670214610=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0670214610==
Content-Type: multipart/alternative; boundary="15660947035.4E995ac20.32461"
Content-Transfer-Encoding: 7bit


--15660947035.4E995ac20.32461
Date: Sun, 18 Aug 2019 02:18:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--- Comment #20 from Brian Schott <briancschott@gmail.com> ---
The following applies to the graphics corruption seen in Dolphin:

ea5b7de138bb7e9a4e7e4f0c39c4ceb16acae923 is the first bad commit
commit ea5b7de138bb7e9a4e7e4f0c39c4ceb16acae923
Author: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Date:   Wed Jul 3 19:27:12 2019 +0200

    radeonsi: make gl_SampleMaskIn =3D 0x1 when MSAA is disabled

    gl_SampleMaskIn is 1 when R_028BE0_PA_SC_AA_CONFIG is 0, so this commit
rework the conditions
    controlling this register.

    Before it was set if the sctx->framebuffer had a sample count > 1.

    Now we still require this condition, but we also need either:
      - GL_MULTISAMPLE to be enabled
      - to be executing an operation that doesn't depends on GL state using
u_blitter.

    This fixes the arb_sample_shading/sample_mask piglit tests on radeonsi.

    Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>

 src/gallium/drivers/radeonsi/si_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15660947035.4E995ac20.32461
Date: Sun, 18 Aug 2019 02:18:23 +0000
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
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
briancschott&#64;gmail.com" title=3D"Brian Schott &lt;briancschott&#64;gmai=
l.com&gt;"> <span class=3D"fn">Brian Schott</span></a>
</span></b>
        <pre>The following applies to the graphics corruption seen in Dolph=
in:

ea5b7de138bb7e9a4e7e4f0c39c4ceb16acae923 is the first bad commit
commit ea5b7de138bb7e9a4e7e4f0c39c4ceb16acae923
Author: Pierre-Eric Pelloux-Prayer &lt;<a href=3D"mailto:pierre-eric.pellou=
x-prayer&#64;amd.com">pierre-eric.pelloux-prayer&#64;amd.com</a>&gt;
Date:   Wed Jul 3 19:27:12 2019 +0200

    radeonsi: make gl_SampleMaskIn =3D 0x1 when MSAA is disabled

    gl_SampleMaskIn is 1 when R_028BE0_PA_SC_AA_CONFIG is 0, so this commit
rework the conditions
    controlling this register.

    Before it was set if the sctx-&gt;framebuffer had a sample count &gt; 1.

    Now we still require this condition, but we also need either:
      - GL_MULTISAMPLE to be enabled
      - to be executing an operation that doesn't depends on GL state using
u_blitter.

    This fixes the arb_sample_shading/sample_mask piglit tests on radeonsi.

    Signed-off-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak&=
#64;amd.com">marek.olsak&#64;amd.com</a>&gt;

 src/gallium/drivers/radeonsi/si_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15660947035.4E995ac20.32461--

--===============0670214610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0670214610==--
