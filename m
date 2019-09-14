Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B88B2ACB
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 11:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC59D6F4F8;
	Sat, 14 Sep 2019 09:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7E446F4F8
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2019 09:19:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E4AE272167; Sat, 14 Sep 2019 09:19:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111685] [Polaris 30] [Bisected] Kernel BUG during boot when
 amdgpu.dpm=0
Date: Sat, 14 Sep 2019 09:19:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: omar.squircleart@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111685-502-fCLLC1BoVI@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111685-502@http.bugs.freedesktop.org/>
References: <bug-111685-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1827856856=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1827856856==
Content-Type: multipart/alternative; boundary="15684527811.A69F6b28.28640"
Content-Transfer-Encoding: 7bit


--15684527811.A69F6b28.28640
Date: Sat, 14 Sep 2019 09:19:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111685

--- Comment #1 from Omar Ahmad <omar.squircleart@gmail.com> ---
Created attachment 145360
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145360&action=3Dedit
Full log after the hang

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15684527811.A69F6b28.28640
Date: Sat, 14 Sep 2019 09:19:41 +0000
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
   title=3D"NEW - [Polaris 30] [Bisected] Kernel BUG during boot when amdgp=
u.dpm=3D0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111685#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Polaris 30] [Bisected] Kernel BUG during boot when amdgp=
u.dpm=3D0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111685">bug 11168=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
omar.squircleart&#64;gmail.com" title=3D"Omar Ahmad &lt;omar.squircleart&#6=
4;gmail.com&gt;"> <span class=3D"fn">Omar Ahmad</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145360=
" name=3D"attach_145360" title=3D"Full log after the hang">attachment 14536=
0</a> <a href=3D"attachment.cgi?id=3D145360&amp;action=3Dedit" title=3D"Ful=
l log after the hang">[details]</a></span>
Full log after the hang</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15684527811.A69F6b28.28640--

--===============1827856856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1827856856==--
