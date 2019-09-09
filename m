Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F3EADCDF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 18:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FDE8928B;
	Mon,  9 Sep 2019 16:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0A3FB8929D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 16:14:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0739572167; Mon,  9 Sep 2019 16:14:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111588] Framebuffer corruption when a fb which is not being
 scanned out gets removed
Date: Mon, 09 Sep 2019 16:14:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111588-502-pxbdUkrasd@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111588-502@http.bugs.freedesktop.org/>
References: <bug-111588-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2049130590=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2049130590==
Content-Type: multipart/alternative; boundary="15680456971.90fA54d.23794"
Content-Transfer-Encoding: 7bit


--15680456971.90fA54d.23794
Date: Mon, 9 Sep 2019 16:14:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111588

--- Comment #2 from Michel D=C3=A4nzer <michel@daenzer.net> ---
(In reply to Hans de Goede from comment #0)
> 5) Plymouth internally calls src/plugins/renderers/drm/plugin.c:
>    ply_renderer_buffer_free() this does:
>     drmModeRmFB(...);
>     munmap (buffer->map_address, buffer->map_size);
>     destroy_dumb_buffer_request.handle =3D buffer->handle;
>     drmIoctl (fd, DRM_IOCTL_MODE_DESTROY_DUMB, &destroy_dumb_buffer_reque=
st);
>    Followed by calling close() on the fd.
> 6) Plymouth exits
> 7) 5 and/or 6 cause the gdm framebuffer being all messed up, it looks lik=
e a
>    wrong pitch or tiling setting

Would be interesting if you could further narrow down which step (or even
sub-step of 5) exactly triggers the problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15680456971.90fA54d.23794
Date: Mon, 9 Sep 2019 16:14:57 +0000
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
   title=3D"NEW - Framebuffer corruption when a fb which is not being scann=
ed out gets removed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111588#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Framebuffer corruption when a fb which is not being scann=
ed out gets removed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111588">bug 11158=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>(In reply to Hans de Goede from <a href=3D"show_bug.cgi?id=3D1=
11588#c0">comment #0</a>)
<span class=3D"quote">&gt; 5) Plymouth internally calls src/plugins/rendere=
rs/drm/plugin.c:
&gt;    ply_renderer_buffer_free() this does:
&gt;     drmModeRmFB(...);
&gt;     munmap (buffer-&gt;map_address, buffer-&gt;map_size);
&gt;     destroy_dumb_buffer_request.handle =3D buffer-&gt;handle;
&gt;     drmIoctl (fd, DRM_IOCTL_MODE_DESTROY_DUMB, &amp;destroy_dumb_buffe=
r_request);
&gt;    Followed by calling close() on the fd.
&gt; 6) Plymouth exits
&gt; 7) 5 and/or 6 cause the gdm framebuffer being all messed up, it looks =
like a
&gt;    wrong pitch or tiling setting</span >

Would be interesting if you could further narrow down which step (or even
sub-step of 5) exactly triggers the problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15680456971.90fA54d.23794--

--===============2049130590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2049130590==--
