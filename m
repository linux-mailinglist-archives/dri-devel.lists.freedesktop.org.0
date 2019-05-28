Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 461002C429
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 12:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A0F89EBD;
	Tue, 28 May 2019 10:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7226889F19
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 10:21:12 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6F0A172167; Tue, 28 May 2019 10:21:12 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110635] briefly flashing corruption when playing various OGL
 games
Date: Tue, 28 May 2019 10:21:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110635-502-dUQlKi6UuJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110635-502@http.bugs.freedesktop.org/>
References: <bug-110635-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0585445518=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0585445518==
Content-Type: multipart/alternative; boundary="15590388722.dA628562.22235"
Content-Transfer-Encoding: 7bit


--15590388722.dA628562.22235
Date: Tue, 28 May 2019 10:21:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110635

--- Comment #7 from tempel.julian@gmail.com ---
The OGL issue occurs with both LLVM 8 and 9-git, so there might not be a
connection to your radv issue here. I suppose LLVM 9 would also be fine with
AMD_DEBUG=3Dnodma & radeonsi, which indicates that the bug really is in the=
 async
DMA code of radeonsi (or at least triggers it).

I also would suppose that RADV_PERFTEST=3D doesn't have to know the same va=
lues
like AMD_DEBUG=3D, which afaik applies only to radeonsi.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590388722.dA628562.22235
Date: Tue, 28 May 2019 10:21:12 +0000
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
   title=3D"NEW - briefly flashing corruption when playing various OGL game=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110635#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - briefly flashing corruption when playing various OGL game=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110635">bug 11063=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>The OGL issue occurs with both LLVM 8 and 9-git, so there migh=
t not be a
connection to your radv issue here. I suppose LLVM 9 would also be fine with
AMD_DEBUG=3Dnodma &amp; radeonsi, which indicates that the bug really is in=
 the async
DMA code of radeonsi (or at least triggers it).

I also would suppose that RADV_PERFTEST=3D doesn't have to know the same va=
lues
like AMD_DEBUG=3D, which afaik applies only to radeonsi.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590388722.dA628562.22235--

--===============0585445518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0585445518==--
