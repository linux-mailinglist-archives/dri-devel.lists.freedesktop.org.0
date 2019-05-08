Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347FF1724B
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 09:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EC7891D5;
	Wed,  8 May 2019 07:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D4D2892C1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 07:08:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3610B7215A; Wed,  8 May 2019 07:08:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Wed, 08 May 2019 07:08:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109345-502-MCEAKcVtkn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109345-502@http.bugs.freedesktop.org/>
References: <bug-109345-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1749476357=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1749476357==
Content-Type: multipart/alternative; boundary="15572993352.11fC.2134"
Content-Transfer-Encoding: 7bit


--15572993352.11fC.2134
Date: Wed, 8 May 2019 07:08:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #36 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
(In reply to Ilia Mirkin from comment #35)
> If I had to put money on one of the left-over commits, I'd go with
>=20
> commit 3d42f1ddc47a69c0ce155f9f30d764c4d689a5fa
> Author: Aaron Ma <aaron.ma@canonical.com>
> Date:   Sat Sep 1 02:20:00 2018 +0800
>=20
>     vgaarb: Keep adding VGA device in queue
>=20=20=20=20=20
>     If failed to find the deivice owning the boot framebuffer,
>     try to use the first VGA device instead of the last one.
>=20=20=20=20=20
>     Usually the 1st device is integrated GPU who owns the boot framebuffe=
r.
>=20=20=20=20=20
>     Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
>     Acked-by: Alex Deucher <alexander.deucher@amd.com>
>     Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>     Link:
> https://patchwork.freedesktop.org/patch/msgid/1535739600-8842-2-git-send-
> email-aaron.ma@canonical.com
>=20
> Which seems to change the vgaarb logic wrt which device is the primary.

Thanks a lot for the hint. I am looking forward to the git bisect result.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15572993352.11fC.2134
Date: Wed, 8 May 2019 07:08:55 +0000
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
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c36">Comme=
nt # 36</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D109=
345#c35">comment #35</a>)
<span class=3D"quote">&gt; If I had to put money on one of the left-over co=
mmits, I'd go with
&gt;=20
&gt; commit 3d42f1ddc47a69c0ce155f9f30d764c4d689a5fa
&gt; Author: Aaron Ma &lt;<a href=3D"mailto:aaron.ma&#64;canonical.com">aar=
on.ma&#64;canonical.com</a>&gt;
&gt; Date:   Sat Sep 1 02:20:00 2018 +0800
&gt;=20
&gt;     vgaarb: Keep adding VGA device in queue
&gt;=20=20=20=20=20
&gt;     If failed to find the deivice owning the boot framebuffer,
&gt;     try to use the first VGA device instead of the last one.
&gt;=20=20=20=20=20
&gt;     Usually the 1st device is integrated GPU who owns the boot framebu=
ffer.
&gt;=20=20=20=20=20
&gt;     Signed-off-by: Aaron Ma &lt;<a href=3D"mailto:aaron.ma&#64;canonic=
al.com">aaron.ma&#64;canonical.com</a>&gt;
&gt;     Acked-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;
&gt;     Signed-off-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter&#=
64;ffwll.ch">daniel.vetter&#64;ffwll.ch</a>&gt;
&gt;     Link:
&gt; <a href=3D"https://patchwork.freedesktop.org/patch/msgid/1535739600-88=
42-2-git-send">https://patchwork.freedesktop.org/patch/msgid/1535739600-884=
2-2-git-send</a>-
&gt; <a href=3D"mailto:email-aaron.ma&#64;canonical.com">email-aaron.ma&#64=
;canonical.com</a>
&gt;=20
&gt; Which seems to change the vgaarb logic wrt which device is the primary=
.</span >

Thanks a lot for the hint. I am looking forward to the git bisect result.</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15572993352.11fC.2134--

--===============1749476357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1749476357==--
