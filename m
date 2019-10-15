Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB7DD8097
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 21:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A9D6E3C1;
	Tue, 15 Oct 2019 19:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 009176E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 19:56:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EA1437296E; Tue, 15 Oct 2019 19:56:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112008] eDP -> Dual Channel LVDS bridge unable to accept any
 modelines: Corrupt display!
Date: Tue, 15 Oct 2019 19:56:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: Babblebones@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112008-502-UpMAfWOVar@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112008-502@http.bugs.freedesktop.org/>
References: <bug-112008-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0908858654=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0908858654==
Content-Type: multipart/alternative; boundary="15711694180.6efF4ae.11969"
Content-Transfer-Encoding: 7bit


--15711694180.6efF4ae.11969
Date: Tue, 15 Oct 2019 19:56:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112008

--- Comment #5 from Babblebones@gmail.com ---
(In reply to Alex Deucher from comment #4)
> Can you use git bisect the issue and find the exact commit that broke it =
or
> narrow down when the regression happened?  E.g., working in 4.17-rc3 and
> broken in 4.17-rc4?

I have two commits that break my EDID reading and cause the exact same issu=
e so
far.

bisected the mainline to try and find the issue, trailed into your drm-next
git...

The first commit I found that broke my EDID read:
https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Damd-staging-drm-next&=
id=3D8a61bc085ffab3071c59efcbeff4044c034e7490
Was later reverted.

Followed more commits after this one down a branch and into here...
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dx86=
-urgent-for-linus&id=3Dbd4caed47a19f25fe8674344ea06d469c27ac314

Surprisingly, swapping out the memory allocs actually breaks the EDID read =
in
this commit/ branch too. I know for a fact Ubuntu's old kernel 4.18 reverted
this specific and the treewide memory allocation change, which worked!? I
stopped about here, my head was starting to spin as to why THAT would do
anything.

I am ready and able to fork over any binary/parameter/debug dumps to help s=
olve
this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15711694180.6efF4ae.11969
Date: Tue, 15 Oct 2019 19:56:58 +0000
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
   title=3D"NEW - eDP -&gt; Dual Channel LVDS bridge unable to accept any m=
odelines: Corrupt display!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112008#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - eDP -&gt; Dual Channel LVDS bridge unable to accept any m=
odelines: Corrupt display!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112008">bug 11200=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Babblebones&#64;gmail.com" title=3D"Babblebones&#64;gmail.com">Babblebones&=
#64;gmail.com</a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D11=
2008#c4">comment #4</a>)
<span class=3D"quote">&gt; Can you use git bisect the issue and find the ex=
act commit that broke it or
&gt; narrow down when the regression happened?  E.g., working in 4.17-rc3 a=
nd
&gt; broken in 4.17-rc4?</span >

I have two commits that break my EDID reading and cause the exact same issu=
e so
far.

bisected the mainline to try and find the issue, trailed into your drm-next
git...

The first commit I found that broke my EDID read:
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/commit/?h=3Damd-stagin=
g-drm-next&amp;id=3D8a61bc085ffab3071c59efcbeff4044c034e7490">https://cgit.=
freedesktop.org/~agd5f/linux/commit/?h=3Damd-staging-drm-next&amp;id=3D8a61=
bc085ffab3071c59efcbeff4044c034e7490</a>
Was later reverted.

Followed more commits after this one down a branch and into here...
<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/comm=
it/?h=3Dx86-urgent-for-linus&amp;id=3Dbd4caed47a19f25fe8674344ea06d469c27ac=
314">https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=
=3Dx86-urgent-for-linus&amp;id=3Dbd4caed47a19f25fe8674344ea06d469c27ac314</=
a>

Surprisingly, swapping out the memory allocs actually breaks the EDID read =
in
this commit/ branch too. I know for a fact Ubuntu's old kernel 4.18 reverted
this specific and the treewide memory allocation change, which worked!? I
stopped about here, my head was starting to spin as to why THAT would do
anything.

I am ready and able to fork over any binary/parameter/debug dumps to help s=
olve
this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15711694180.6efF4ae.11969--

--===============0908858654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0908858654==--
