Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F02AE411E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 03:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E506E87D;
	Fri, 25 Oct 2019 01:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F2CB6E87D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 01:39:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 86BF8720E2; Fri, 25 Oct 2019 01:39:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112124] Kingdom Come: Deliverance (DXVK) - kernel performance
 regression [Navi] [RADV/ACO]
Date: Fri, 25 Oct 2019 01:39:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: asheldon55@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112124-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1704574329=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1704574329==
Content-Type: multipart/alternative; boundary="15719675780.0CfF9A7c.30544"
Content-Transfer-Encoding: 7bit


--15719675780.0CfF9A7c.30544
Date: Fri, 25 Oct 2019 01:39:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112124

            Bug ID: 112124
           Summary: Kingdom Come: Deliverance (DXVK) - kernel performance
                    regression [Navi] [RADV/ACO]
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: asheldon55@gmail.com

Kingdom Come: Deliverance (DXVK) has regressed in performance due to the
following kernel commit, with aco-navi:

commit 828d6fde7f574d74b0a6a591345d3c42b62d5e21
Author: Tianci.Yin <tianci.yin@amd.com>
Date:   Mon Aug 19 15:30:22 2019 +0800

    drm/amdgpu/psp: move TMR to cpu invisible vram region

    so that more visible vram can be available for umd.

    Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>.
    Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

With 828d6fde7f57 (62 fps/79% GPU usage):

https://camo.githubusercontent.com/4608d45738a5174f64daee0604d9f5d7146aee68=
/68747470733a2f2f692e696d6775722e636f6d2f757356306d33412e6a7067

With 828d6fde7f57 reverted (79 fps, 100% GPU usage):
https://camo.githubusercontent.com/77a505f85b75db0d2062aa4d8319b6007ba524fe=
/68747470733a2f2f692e696d6775722e636f6d2f394366695270452e6a7067

Tests were with aco-navi branch:
https://gitlab.freedesktop.org/Venemo/mesa/tree/aco-navi

Performance with LLVM is comparable with the commit reverted or not, howeve=
r.
Slightly better with the commit since GPU usage is lower for the same
performance:

With 828d6fde7f57 (61.4 fps/88% GPU usage):
https://i.imgur.com/kJgvRbq.jpg

Without 8d6fde7f57 (61.2 fps/100% GPU usage):
https://i.imgur.com/AemAss1.jpg

System:

linux-5.4-rc4 (also tested amd-staging-drm-next)
Mesa aco-navi (e641024) and Mesa git (8dadef2ec54)
MSI Evoke 5700 XT

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719675780.0CfF9A7c.30544
Date: Fri, 25 Oct 2019 01:39:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kingdom Come: Deliverance (DXVK) - kernel performance reg=
ression [Navi] [RADV/ACO]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112124">112124</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kingdom Come: Deliverance (DXVK) - kernel performance regress=
ion [Navi] [RADV/ACO]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>asheldon55&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Kingdom Come: Deliverance (DXVK) has regressed in performance =
due to the
following kernel commit, with aco-navi:

commit 828d6fde7f574d74b0a6a591345d3c42b62d5e21
Author: Tianci.Yin &lt;<a href=3D"mailto:tianci.yin&#64;amd.com">tianci.yin=
&#64;amd.com</a>&gt;
Date:   Mon Aug 19 15:30:22 2019 +0800

    drm/amdgpu/psp: move TMR to cpu invisible vram region

    so that more visible vram can be available for umd.

    Reviewed-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koeni=
g&#64;amd.com">christian.koenig&#64;amd.com</a>&gt;.
    Signed-off-by: Tianci.Yin &lt;<a href=3D"mailto:tianci.yin&#64;amd.com"=
>tianci.yin&#64;amd.com</a>&gt;
    Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher&#64=
;amd.com">alexander.deucher&#64;amd.com</a>&gt;

With 828d6fde7f57 (62 fps/79% GPU usage):

<a href=3D"https://camo.githubusercontent.com/4608d45738a5174f64daee0604d9f=
5d7146aee68/68747470733a2f2f692e696d6775722e636f6d2f757356306d33412e6a7067"=
>https://camo.githubusercontent.com/4608d45738a5174f64daee0604d9f5d7146aee6=
8/68747470733a2f2f692e696d6775722e636f6d2f757356306d33412e6a7067</a>

With 828d6fde7f57 reverted (79 fps, 100% GPU usage):
<a href=3D"https://camo.githubusercontent.com/77a505f85b75db0d2062aa4d8319b=
6007ba524fe/68747470733a2f2f692e696d6775722e636f6d2f394366695270452e6a7067"=
>https://camo.githubusercontent.com/77a505f85b75db0d2062aa4d8319b6007ba524f=
e/68747470733a2f2f692e696d6775722e636f6d2f394366695270452e6a7067</a>

Tests were with aco-navi branch:
<a href=3D"https://gitlab.freedesktop.org/Venemo/mesa/tree/aco-navi">https:=
//gitlab.freedesktop.org/Venemo/mesa/tree/aco-navi</a>

Performance with LLVM is comparable with the commit reverted or not, howeve=
r.
Slightly better with the commit since GPU usage is lower for the same
performance:

With 828d6fde7f57 (61.4 fps/88% GPU usage):
<a href=3D"https://i.imgur.com/kJgvRbq.jpg">https://i.imgur.com/kJgvRbq.jpg=
</a>

Without 8d6fde7f57 (61.2 fps/100% GPU usage):
<a href=3D"https://i.imgur.com/AemAss1.jpg">https://i.imgur.com/AemAss1.jpg=
</a>

System:

linux-5.4-rc4 (also tested amd-staging-drm-next)
Mesa aco-navi (e641024) and Mesa git (8dadef2ec54)
MSI Evoke 5700 XT</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719675780.0CfF9A7c.30544--

--===============1704574329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1704574329==--
