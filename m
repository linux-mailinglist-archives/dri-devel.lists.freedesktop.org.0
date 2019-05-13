Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F161AED9
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 04:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1933689385;
	Mon, 13 May 2019 02:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D59DA893B8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2019 02:23:27 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D25B4721CD; Mon, 13 May 2019 02:23:27 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108487] Wayland compositors are unable to use hardware
 acceleration on i915
Date: Mon, 13 May 2019 02:23:27 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/i915
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexvillacislasso@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-108487-502-jQzVjWZPqG@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108487-502@http.bugs.freedesktop.org/>
References: <bug-108487-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0869118896=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0869118896==
Content-Type: multipart/alternative; boundary="15577142071.C1eA6d.15543"
Content-Transfer-Encoding: 7bit


--15577142071.C1eA6d.15543
Date: Mon, 13 May 2019 02:23:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108487

--- Comment #18 from Alex Villac=C3=ADs Lasso <alexvillacislasso@hotmail.co=
m> ---
Created attachment 144243
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144243&action=3Dedit
gbm: gbm_bo_get_handle_for_plane fallback to nonplanar handle

Here is a patch for Mesa 19.0.3 that fixes the issue for me on Fedora 30
x86_64. Essentially the patch returns the nonplanar handle if the API check
fails, making the gbm_bo_get_handle_for_plane() call equivalent to
gbm_bo_get_handle() if requesting plane 0. With this patch, weston starts up
and works correctly for me. Gnome Shell remains unaffected.

Merge request (against master) here:
https://gitlab.freedesktop.org/mesa/mesa/merge_requests/871

This should eventually be backported to 19.0.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15577142071.C1eA6d.15543
Date: Mon, 13 May 2019 02:23:27 +0000
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
   title=3D"NEW - Wayland compositors are unable to use hardware accelerati=
on on i915"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108487#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Wayland compositors are unable to use hardware accelerati=
on on i915"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108487">bug 10848=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexvillacislasso&#64;hotmail.com" title=3D"Alex Villac=C3=ADs Lasso &lt;al=
exvillacislasso&#64;hotmail.com&gt;"> <span class=3D"fn">Alex Villac=C3=ADs=
 Lasso</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144243=
" name=3D"attach_144243" title=3D"gbm: gbm_bo_get_handle_for_plane fallback=
 to nonplanar handle">attachment 144243</a> <a href=3D"attachment.cgi?id=3D=
144243&amp;action=3Dedit" title=3D"gbm: gbm_bo_get_handle_for_plane fallbac=
k to nonplanar handle">[details]</a></span> <a href=3D'page.cgi?id=3Dsplint=
er.html&amp;bug=3D108487&amp;attachment=3D144243'>[review]</a>
gbm: gbm_bo_get_handle_for_plane fallback to nonplanar handle

Here is a patch for Mesa 19.0.3 that fixes the issue for me on Fedora 30
x86_64. Essentially the patch returns the nonplanar handle if the API check
fails, making the gbm_bo_get_handle_for_plane() call equivalent to
gbm_bo_get_handle() if requesting plane 0. With this patch, weston starts up
and works correctly for me. Gnome Shell remains unaffected.

Merge request (against master) here:
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/merge_requests/871">htt=
ps://gitlab.freedesktop.org/mesa/mesa/merge_requests/871</a>

This should eventually be backported to 19.0.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15577142071.C1eA6d.15543--

--===============0869118896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0869118896==--
