Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B8B7461
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 09:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF066F4D1;
	Thu, 19 Sep 2019 07:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6E19E6F4D1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 07:46:39 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6545272167; Thu, 19 Sep 2019 07:46:39 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111667] gem_render_copy failing on CCS subtests
Date: Thu, 19 Sep 2019 07:46:39 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111667-502-oGliA9iAEp@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1314723861=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1314723861==
Content-Type: multipart/alternative; boundary="15688791990.Beb8F1.24228"
Content-Transfer-Encoding: 7bit


--15688791990.Beb8F1.24228
Date: Thu, 19 Sep 2019 07:46:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111667

--- Comment #5 from Mika Kahola <mika.kahola@intel.com> ---
Created attachment 145430
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145430&action=3Dedit
gem_render_copy --run-subtest  y-tiled-ccs-to-linear

Unfortunately, the rendercopy patches didn't help in case of CCS. The attat=
ched
dmesg is an example of the outcome of IGT test
gem_render_copy@y-tiled-ccs-to-linear.

I ran the test with my IGT tree=20

https://github.com/mkahola/igt.git e2e_compression

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15688791990.Beb8F1.24228
Date: Thu, 19 Sep 2019 07:46:39 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111667#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gem_render_copy failing on CCS subtests"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111667">bug 11166=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mika.kahola&#64;intel.com" title=3D"Mika Kahola &lt;mika.kahola&#64;intel.c=
om&gt;"> <span class=3D"fn">Mika Kahola</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145430=
" name=3D"attach_145430" title=3D"gem_render_copy --run-subtest  y-tiled-cc=
s-to-linear">attachment 145430</a> <a href=3D"attachment.cgi?id=3D145430&am=
p;action=3Dedit" title=3D"gem_render_copy --run-subtest  y-tiled-ccs-to-lin=
ear">[details]</a></span>
gem_render_copy --run-subtest  y-tiled-ccs-to-linear

Unfortunately, the rendercopy patches didn't help in case of CCS. The attat=
ched
dmesg is an example of the outcome of IGT test
gem_render_copy&#64;y-tiled-ccs-to-linear.

I ran the test with my IGT tree=20

<a href=3D"https://github.com/mkahola/igt.git">https://github.com/mkahola/i=
gt.git</a> e2e_compression</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15688791990.Beb8F1.24228--

--===============1314723861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1314723861==--
