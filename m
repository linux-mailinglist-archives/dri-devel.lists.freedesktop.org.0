Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AD68A25E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 17:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AE0897E8;
	Mon, 12 Aug 2019 15:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4FB4D897D7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 15:34:46 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4C2E872167; Mon, 12 Aug 2019 15:34:46 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 12 Aug 2019 15:34:46 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110674-502-Pbj0eXPpdh@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2063410874=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2063410874==
Content-Type: multipart/alternative; boundary="15656240861.A761b4.11818"
Content-Transfer-Encoding: 7bit


--15656240861.A761b4.11818
Date: Mon, 12 Aug 2019 15:34:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #82 from Tom B <tom@r.je> ---
In addition, I will note that the file vega20_baco.c has been added in 5.1=
=20

details: https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DAMD-Vega-1=
2-BACO


commit:
https://github.com/torvalds/linux/commit/0c5ccf14f50431d0196b96025c878ae9f4=
5676a9#diff-c2d82e6f1326b5b4e0a09c9cb42cbcc2=20


This seems like quite a large change, and requires a special "workaround" f=
or
Vega 20. Unfortunately, this seems like quite a large code restructure in t=
he
driver as I cannot just revert that single commit.=20

I mention this because part of the problem I am seeing is with the wrong
wattage. I wonder whether BACO wrongly tries to turn off a part of the card
that is required for a secondary monitor and as such puts the card in an
invalid state.

I'm going to see if I can disable/revert BACO entirely to at least rule it =
out.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656240861.A761b4.11818
Date: Mon, 12 Aug 2019 15:34:46 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c82">Comme=
nt # 82</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>In addition, I will note that the file vega20_baco.c has been =
added in 5.1=20

details: <a href=3D"https://www.phoronix.com/scan.php?page=3Dnews_item&amp;=
px=3DAMD-Vega-12-BACO">https://www.phoronix.com/scan.php?page=3Dnews_item&a=
mp;px=3DAMD-Vega-12-BACO</a>


commit:
<a href=3D"https://github.com/torvalds/linux/commit/0c5ccf14f50431d0196b960=
25c878ae9f45676a9#diff-c2d82e6f1326b5b4e0a09c9cb42cbcc2">https://github.com=
/torvalds/linux/commit/0c5ccf14f50431d0196b96025c878ae9f45676a9#diff-c2d82e=
6f1326b5b4e0a09c9cb42cbcc2</a>=20


This seems like quite a large change, and requires a special &quot;workarou=
nd&quot; for
Vega 20. Unfortunately, this seems like quite a large code restructure in t=
he
driver as I cannot just revert that single commit.=20

I mention this because part of the problem I am seeing is with the wrong
wattage. I wonder whether BACO wrongly tries to turn off a part of the card
that is required for a secondary monitor and as such puts the card in an
invalid state.

I'm going to see if I can disable/revert BACO entirely to at least rule it =
out.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656240861.A761b4.11818--

--===============2063410874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2063410874==--
