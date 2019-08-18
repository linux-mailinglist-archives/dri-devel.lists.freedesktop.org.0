Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E93799161C
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2019 12:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB32A6E065;
	Sun, 18 Aug 2019 10:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 075DD6E06E
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2019 10:22:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 03C2372161; Sun, 18 Aug 2019 10:22:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Sun, 18 Aug 2019 10:22:58 +0000
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
Message-ID: <bug-111122-502-EihcRmNgmP@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0865999896=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0865999896==
Content-Type: multipart/alternative; boundary="15661237785.669Aa526.10463"
Content-Transfer-Encoding: 7bit


--15661237785.669Aa526.10463
Date: Sun, 18 Aug 2019 10:22:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--- Comment #21 from Brian Schott <briancschott@gmail.com> ---
As far as the issue about desktop corruption and lockup on login requiring =
the
AMD_DEBUG=3Dnodcc workaround:

b563460b494e9228cf5bb1aa4a70ac2499ad81fe is the first bad commit
commit b563460b494e9228cf5bb1aa4a70ac2499ad81fe
Author: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
Date:   Tue Jan 8 20:08:08 2019 -0500

    radeonsi: enable displayable DCC on Ravens

 src/amd/common/ac_gpu_info.c                      | 8 ++++++++
 src/amd/vulkan/winsys/amdgpu/radv_amdgpu_winsys.c | 4 ++++
 2 files changed, 12 insertions(+)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15661237785.669Aa526.10463
Date: Sun, 18 Aug 2019 10:22:58 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c21">Comme=
nt # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
briancschott&#64;gmail.com" title=3D"Brian Schott &lt;briancschott&#64;gmai=
l.com&gt;"> <span class=3D"fn">Brian Schott</span></a>
</span></b>
        <pre>As far as the issue about desktop corruption and lockup on log=
in requiring the
AMD_DEBUG=3Dnodcc workaround:

b563460b494e9228cf5bb1aa4a70ac2499ad81fe is the first bad commit
commit b563460b494e9228cf5bb1aa4a70ac2499ad81fe
Author: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak&#64;amd.com=
">marek.olsak&#64;amd.com</a>&gt;
Date:   Tue Jan 8 20:08:08 2019 -0500

    radeonsi: enable displayable DCC on Ravens

 src/amd/common/ac_gpu_info.c                      | 8 ++++++++
 src/amd/vulkan/winsys/amdgpu/radv_amdgpu_winsys.c | 4 ++++
 2 files changed, 12 insertions(+)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15661237785.669Aa526.10463--

--===============0865999896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0865999896==--
