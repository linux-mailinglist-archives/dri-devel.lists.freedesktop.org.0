Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 243CA7F850
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6006EE22;
	Fri,  2 Aug 2019 13:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F1DFF6EE27
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 13:19:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EE71072167; Fri,  2 Aug 2019 13:19:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111244] amdgpu kernel 5.2 blank display after resume from suspend
Date: Fri, 02 Aug 2019 13:19:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samuele.decarli@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111244-502-PWBHBY2ud5@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111244-502@http.bugs.freedesktop.org/>
References: <bug-111244-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0922499614=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0922499614==
Content-Type: multipart/alternative; boundary="15647519513.AefFae.21255"
Content-Transfer-Encoding: 7bit


--15647519513.AefFae.21255
Date: Fri, 2 Aug 2019 13:19:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111244

--- Comment #8 from Samuele Decarli <samuele.decarli@gmail.com> ---
Created attachment 144928
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144928&action=3Dedit
Result of git bisect

Model: HP EliteBook 745 G5
CPU/GPU: AMD Ryzen 7 PRO 2700U

I completed my bisection and this is the log.
The first bad commit seems to be this one. It's actually a fairly innocent
commit, so it's probably causing a bug somewhere else.

df8368be1382b442384507a5147c89978cd60702 is the first bad commit
commit df8368be1382b442384507a5147c89978cd60702
Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Date:   Wed Feb 27 12:56:36 2019 -0500

    drm/amdgpu: Bump amdgpu version for per-flip plane tiling updates

    To help xf86-video-amdgpu and mesa know DC supports updating the
    tiling attributes for a framebuffer per-flip.

    Cc: Michel D=C3=A4nzer <michel@daenzer.net>
    Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
    Acked-by: Alex Deucher <alexander.deucher@amd.com>
    Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15647519513.AefFae.21255
Date: Fri, 2 Aug 2019 13:19:11 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - amdgpu kernel 5.2 blank display after resume from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - amdgpu kernel 5.2 blank display after resume from su=
spend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111244">bug 11124=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
samuele.decarli&#64;gmail.com" title=3D"Samuele Decarli &lt;samuele.decarli=
&#64;gmail.com&gt;"> <span class=3D"fn">Samuele Decarli</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144928=
" name=3D"attach_144928" title=3D"Result of git bisect">attachment 144928</=
a> <a href=3D"attachment.cgi?id=3D144928&amp;action=3Dedit" title=3D"Result=
 of git bisect">[details]</a></span>
Result of git bisect

Model: HP EliteBook 745 G5
CPU/GPU: AMD Ryzen 7 PRO 2700U

I completed my bisection and this is the log.
The first bad commit seems to be this one. It's actually a fairly innocent
commit, so it's probably causing a bug somewhere else.

df8368be1382b442384507a5147c89978cd60702 is the first bad commit
commit df8368be1382b442384507a5147c89978cd60702
Author: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.kazlauskas&#64;a=
md.com">nicholas.kazlauskas&#64;amd.com</a>&gt;
Date:   Wed Feb 27 12:56:36 2019 -0500

    drm/amdgpu: Bump amdgpu version for per-flip plane tiling updates

    To help xf86-video-amdgpu and mesa know DC supports updating the
    tiling attributes for a framebuffer per-flip.

    Cc: Michel D=C3=A4nzer &lt;<a href=3D"mailto:michel&#64;daenzer.net">mi=
chel&#64;daenzer.net</a>&gt;
    Signed-off-by: Nicholas Kazlauskas &lt;<a href=3D"mailto:nicholas.kazla=
uskas&#64;amd.com">nicholas.kazlauskas&#64;amd.com</a>&gt;
    Acked-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64;amd.=
com">alexander.deucher&#64;amd.com</a>&gt;
    Reviewed-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak&#6=
4;amd.com">marek.olsak&#64;amd.com</a>&gt;
    Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
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

--15647519513.AefFae.21255--

--===============0922499614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0922499614==--
