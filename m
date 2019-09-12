Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAC4B0DAA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 13:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5EB6ECC7;
	Thu, 12 Sep 2019 11:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6612A6ECC7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2019 11:20:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 57BC572167; Thu, 12 Sep 2019 11:20:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111667] gem_render_copy failing on CCS subtests
Date: Thu, 12 Sep 2019 11:20:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: chris@chris-wilson.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111667-502-MOOtg7tN1A@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0814695852=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0814695852==
Content-Type: multipart/alternative; boundary="15682872050.1cc3Caf.32446"
Content-Transfer-Encoding: 7bit


--15682872050.1cc3Caf.32446
Date: Thu, 12 Sep 2019 11:20:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111667

--- Comment #2 from Chris Wilson <chris@chris-wilson.co.uk> ---
There is no render copyfunc for gen12. This should have bailed out at

                data.render_copy =3D igt_get_render_copyfunc(data.devid);
                igt_require_f(data.render_copy,
                              "no render-copy function\n");

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682872050.1cc3Caf.32446
Date: Thu, 12 Sep 2019 11:20:05 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111667#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gem_render_copy failing on CCS subtests"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111667">bug 11166=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wil=
son.co.uk&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span></b>
        <pre>There is no render copyfunc for gen12. This should have bailed=
 out at

                data.render_copy =3D igt_get_render_copyfunc(data.devid);
                igt_require_f(data.render_copy,
                              &quot;no render-copy function\n&quot;);</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682872050.1cc3Caf.32446--

--===============0814695852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0814695852==--
