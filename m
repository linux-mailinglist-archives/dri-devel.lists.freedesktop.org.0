Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89BB0F8F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 15:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC556ED3B;
	Thu, 12 Sep 2019 13:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E65956ED3B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 13:07:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DF16872167; Thu, 12 Sep 2019 13:07:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111667] gem_render_copy failing on CCS subtests
Date: Thu, 12 Sep 2019 13:07:29 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: mika.kahola@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111667-502-pQZiakQGZO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111667-502@http.bugs.freedesktop.org/>
References: <bug-111667-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1560914612=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1560914612==
Content-Type: multipart/alternative; boundary="15682936480.dea5dD88.16854"
Content-Transfer-Encoding: 7bit


--15682936480.dea5dD88.16854
Date: Thu, 12 Sep 2019 13:07:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111667

--- Comment #3 from Mika Kahola <mika.kahola@intel.com> ---
You're right. I had a patch in my tree which, for some reason, hasn't been
upstreamed yet. But the bug is real, we are missing rendercopy function for
GEN12.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682936480.dea5dD88.16854
Date: Thu, 12 Sep 2019 13:07:28 +0000
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
   title=3D"NEW - gem_render_copy failing on CCS subtests"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111667#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gem_render_copy failing on CCS subtests"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111667">bug 11166=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mika.kahola&#64;intel.com" title=3D"Mika Kahola &lt;mika.kahola&#64;intel.c=
om&gt;"> <span class=3D"fn">Mika Kahola</span></a>
</span></b>
        <pre>You're right. I had a patch in my tree which, for some reason,=
 hasn't been
upstreamed yet. But the bug is real, we are missing rendercopy function for
GEN12.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682936480.dea5dD88.16854--

--===============1560914612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1560914612==--
