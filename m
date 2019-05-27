Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE472B9D1
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 20:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623AC898E8;
	Mon, 27 May 2019 18:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8736E898E8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 18:07:37 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 8306D72167; Mon, 27 May 2019 18:07:37 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Mon, 27 May 2019 18:07:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110659-502-G4mi0nUJVh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0944921619=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0944921619==
Content-Type: multipart/alternative; boundary="15589804571.DAd2F01EE.28453"
Content-Transfer-Encoding: 7bit


--15589804571.DAd2F01EE.28453
Date: Mon, 27 May 2019 18:07:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #16 from Nicholas Kazlauskas <nicholas.kazlauskas@amd.com> ---
Created attachment 144354
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144354&action=3Dedit
0001-drm-amd-display-Allow-fast-updates-again-for-swappin.patch

Sure, you can try the patch I've attached on applied after series fixing the
problem in DRM:

https://patchwork.kernel.org/cover/10837847/

Not sure if that applies cleanly, however. The important patches from should
be:

https://patchwork.kernel.org/patch/10837849/
https://patchwork.kernel.org/patch/10837853/

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15589804571.DAd2F01EE.28453
Date: Mon, 27 May 2019 18:07:37 +0000
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
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nicholas.kazlauskas&#64;amd.com" title=3D"Nicholas Kazlauskas &lt;nicholas.=
kazlauskas&#64;amd.com&gt;"> <span class=3D"fn">Nicholas Kazlauskas</span><=
/a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144354=
" name=3D"attach_144354" title=3D"0001-drm-amd-display-Allow-fast-updates-a=
gain-for-swappin.patch">attachment 144354</a> <a href=3D"attachment.cgi?id=
=3D144354&amp;action=3Dedit" title=3D"0001-drm-amd-display-Allow-fast-updat=
es-again-for-swappin.patch">[details]</a></span> <a href=3D'page.cgi?id=3Ds=
plinter.html&amp;bug=3D110659&amp;attachment=3D144354'>[review]</a>
0001-drm-amd-display-Allow-fast-updates-again-for-swappin.patch

Sure, you can try the patch I've attached on applied after series fixing the
problem in DRM:

<a href=3D"https://patchwork.kernel.org/cover/10837847/">https://patchwork.=
kernel.org/cover/10837847/</a>

Not sure if that applies cleanly, however. The important patches from should
be:

<a href=3D"https://patchwork.kernel.org/patch/10837849/">https://patchwork.=
kernel.org/patch/10837849/</a>
<a href=3D"https://patchwork.kernel.org/patch/10837853/">https://patchwork.=
kernel.org/patch/10837853/</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15589804571.DAd2F01EE.28453--

--===============0944921619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0944921619==--
