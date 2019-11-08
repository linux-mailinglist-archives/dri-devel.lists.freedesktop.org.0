Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9381F4D89
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 14:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98B76F999;
	Fri,  8 Nov 2019 13:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7546A6F999
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 13:49:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 720D7720E2; Fri,  8 Nov 2019 13:49:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111922] amdgpu fails to resume on 5.2 kernel [regression]
Date: Fri, 08 Nov 2019 13:49:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111922-502-7cZuIlo3lR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111922-502@http.bugs.freedesktop.org/>
References: <bug-111922-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1528290900=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1528290900==
Content-Type: multipart/alternative; boundary="15732209551.3C1467.31285"
Content-Transfer-Encoding: 7bit


--15732209551.3C1467.31285
Date: Fri, 8 Nov 2019 13:49:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111922

--- Comment #5 from Pierre Ossman <pierre-bugzilla@ossman.eu> ---
That's a shame.

I did find bug 111811, which looks very similar. Through that I found this
patch:

https://www.mail-archive.com/amd-gfx@lists.freedesktop.org/msg40304.html

Unfortunately it does not solve the issue here. :/


Have you checked if you can reproduce this in a 2200G in your end? Or other
Raven Ridge APUs?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15732209551.3C1467.31285
Date: Fri, 8 Nov 2019 13:49:15 +0000
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
   title=3D"NEW - amdgpu fails to resume on 5.2 kernel [regression]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111922#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu fails to resume on 5.2 kernel [regression]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111922">bug 11192=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-bugzilla&#64;ossman.eu" title=3D"Pierre Ossman &lt;pierre-bugzilla&#=
64;ossman.eu&gt;"> <span class=3D"fn">Pierre Ossman</span></a>
</span></b>
        <pre>That's a shame.

I did find <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Ryzen7 3700U display hang on resume from suspend"
   href=3D"show_bug.cgi?id=3D111811">bug 111811</a>, which looks very simil=
ar. Through that I found this
patch:

<a href=3D"https://www.mail-archive.com/amd-gfx&#64;lists.freedesktop.org/m=
sg40304.html">https://www.mail-archive.com/amd-gfx&#64;lists.freedesktop.or=
g/msg40304.html</a>

Unfortunately it does not solve the issue here. :/


Have you checked if you can reproduce this in a 2200G in your end? Or other
Raven Ridge APUs?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15732209551.3C1467.31285--

--===============1528290900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1528290900==--
