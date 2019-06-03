Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A203C33803
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 20:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9875088E57;
	Mon,  3 Jun 2019 18:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1669688E57
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 18:35:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0D60A72167; Mon,  3 Jun 2019 18:35:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110831] [AMD TAHITI XT][amd-staging-drm-next] broken since
 5.2-rc1 rebase
Date: Mon, 03 Jun 2019 18:35:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110831-502-T90ZFNowmQ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110831-502@http.bugs.freedesktop.org/>
References: <bug-110831-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0965131761=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0965131761==
Content-Type: multipart/alternative; boundary="15595869430.AcDd.25248"
Content-Transfer-Encoding: 7bit


--15595869430.AcDd.25248
Date: Mon, 3 Jun 2019 18:35:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110831

--- Comment #1 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
The guilty commit is following. I reverted this commit on top of the current
amd-staging-drm-next (40cc64619a2580b26f924bcabdefd555e7831a14), my system =
is
then booting ok. It seems to do some specific programming for vega10+ parts
which is not correct for previous families/versions parts.

commit 43ee614432d841184b158af27fda66a0929fe252 (refs/bisect/bad)
Author: Emily Deng <Emily.Deng@amd.com>
Date:   Tue May 28 10:17:04 2019 +0800

    drm/amdgpu: Need to set the baco cap before baco reset

    For passthrough, after rebooted the VM, driver will do
    a baco reset before doing other driver initialization during loading
     driver. For doing the baco reset, it will first
    check the baco reset capability. So first need to set the
    cap from the vbios information or baco reset won't be
    enabled.

    Signed-off-by: Emily Deng <Emily.Deng@amd.com>
    Reviewed-by: Evan Quan <evan.quan@amd.com>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595869430.AcDd.25248
Date: Mon, 3 Jun 2019 18:35:43 +0000
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
   title=3D"NEW - [AMD TAHITI XT][amd-staging-drm-next] broken since 5.2-rc=
1 rebase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110831#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [AMD TAHITI XT][amd-staging-drm-next] broken since 5.2-rc=
1 rebase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110831">bug 11083=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sylvain.bertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertr=
and&#64;gmail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span></b>
        <pre>The guilty commit is following. I reverted this commit on top =
of the current
amd-staging-drm-next (40cc64619a2580b26f924bcabdefd555e7831a14), my system =
is
then booting ok. It seems to do some specific programming for vega10+ parts
which is not correct for previous families/versions parts.

commit 43ee614432d841184b158af27fda66a0929fe252 (refs/bisect/bad)
Author: Emily Deng &lt;<a href=3D"mailto:Emily.Deng&#64;amd.com">Emily.Deng=
&#64;amd.com</a>&gt;
Date:   Tue May 28 10:17:04 2019 +0800

    drm/amdgpu: Need to set the baco cap before baco reset

    For passthrough, after rebooted the VM, driver will do
    a baco reset before doing other driver initialization during loading
     driver. For doing the baco reset, it will first
    check the baco reset capability. So first need to set the
    cap from the vbios information or baco reset won't be
    enabled.

    Signed-off-by: Emily Deng &lt;<a href=3D"mailto:Emily.Deng&#64;amd.com"=
>Emily.Deng&#64;amd.com</a>&gt;
    Reviewed-by: Evan Quan &lt;<a href=3D"mailto:evan.quan&#64;amd.com">eva=
n.quan&#64;amd.com</a>&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595869430.AcDd.25248--

--===============0965131761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0965131761==--
