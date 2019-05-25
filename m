Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4802A354
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 09:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE5C6E14D;
	Sat, 25 May 2019 07:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5908D6E14D
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 07:52:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5090672167; Sat, 25 May 2019 07:52:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110759] Blender 2.8 crash when selecting geometry with 19.0.5
Date: Sat, 25 May 2019 07:52:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 19.0
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: git@dougty.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110759-502-KnpwsMCNdi@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110759-502@http.bugs.freedesktop.org/>
References: <bug-110759-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1010319754=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1010319754==
Content-Type: multipart/alternative; boundary="15587707620.f48bA89.26613"
Content-Transfer-Encoding: 7bit


--15587707620.f48bA89.26613
Date: Sat, 25 May 2019 07:52:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110759

--- Comment #1 from Doug Ty <git@dougty.com> ---
Update:

This also happens with the latest development build of mesa
(19.2.0_devel.111215.1dc593e9b93 as compiled via mesa-git package on AUR)


I believe this is related to Bug 110721:
https://bugs.freedesktop.org/show_bug.cgi?id=3D110721

...As reverting "mesa: unreference current winsys buffers when unbinding wi=
nsys
buffers" fixes the crashing in Blender (in addition to the issues presented=
 in
the other bug report.)

Using master + reverting that commit seems to resolve the issue for me.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15587707620.f48bA89.26613
Date: Sat, 25 May 2019 07:52:42 +0000
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
   title=3D"NEW - Blender 2.8 crash when selecting geometry with 19.0.5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110759#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Blender 2.8 crash when selecting geometry with 19.0.5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110759">bug 11075=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
git&#64;dougty.com" title=3D"Doug Ty &lt;git&#64;dougty.com&gt;"> <span cla=
ss=3D"fn">Doug Ty</span></a>
</span></b>
        <pre>Update:

This also happens with the latest development build of mesa
(19.2.0_devel.111215.1dc593e9b93 as compiled via mesa-git package on AUR)


I believe this is related to <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - graphics corruption on steam client with mesa 19.1.0=
 rc3 on polaris"
   href=3D"show_bug.cgi?id=3D110721">Bug 110721</a>:
<a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - graphics corruption on steam client with mesa 19.1.0=
 rc3 on polaris"
   href=3D"show_bug.cgi?id=3D110721">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110721</a>

...As reverting &quot;mesa: unreference current winsys buffers when unbindi=
ng winsys
buffers&quot; fixes the crashing in Blender (in addition to the issues pres=
ented in
the other bug report.)

Using master + reverting that commit seems to resolve the issue for me.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15587707620.f48bA89.26613--

--===============1010319754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1010319754==--
