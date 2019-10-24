Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBBDE37AF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD526E4AB;
	Thu, 24 Oct 2019 16:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAEE389D9B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:18:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B80DE720E2; Thu, 24 Oct 2019 16:18:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Thu, 24 Oct 2019 16:18:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-HLInEDDeFS@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0256183498=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0256183498==
Content-Type: multipart/alternative; boundary="15719338940.84e3.31188"
Content-Transfer-Encoding: 7bit


--15719338940.84e3.31188
Date: Thu, 24 Oct 2019 16:18:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #153 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to L.S.S. from comment #152)
> UPDATE: I just got another freeze on 5.3.6 kernel. The same
> GCVM_L2_PROTECTION_FAULT error followed by a ring sdma0 timeout.
>=20
> So it seems AMD_DEBUG=3D"nodma nongg" doesn't really work for me.

Can you at least provide the dmesg log so we can determine what type of hang
you're having and directing you to the right bugtracker, since there are
multiple types. This also varies greatly from one desktop environment to ot=
her,
wayland or not etc. This topic is mostly concerning the SDMA type hangs that
happen at random, and AMD_DEBUG=3Dnodma seems to take care of it for almost
anyone, I don't think using nongg is neccessary since until now it's only b=
een
proven to take care of 1 specific hang happening in Citra emulator, which is
also ring-gfx type so it's a driver bug, probably not kernel driver related.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719338940.84e3.31188
Date: Thu, 24 Oct 2019 16:18:14 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c153">Comm=
ent # 153</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to L.S.S. from <a href=3D"show_bug.cgi?id=3D111481#c=
152">comment #152</a>)
<span class=3D"quote">&gt; UPDATE: I just got another freeze on 5.3.6 kerne=
l. The same
&gt; GCVM_L2_PROTECTION_FAULT error followed by a ring sdma0 timeout.
&gt;=20
&gt; So it seems AMD_DEBUG=3D&quot;nodma nongg&quot; doesn't really work fo=
r me.</span >

Can you at least provide the dmesg log so we can determine what type of hang
you're having and directing you to the right bugtracker, since there are
multiple types. This also varies greatly from one desktop environment to ot=
her,
wayland or not etc. This topic is mostly concerning the SDMA type hangs that
happen at random, and AMD_DEBUG=3Dnodma seems to take care of it for almost
anyone, I don't think using nongg is neccessary since until now it's only b=
een
proven to take care of 1 specific hang happening in Citra emulator, which is
also ring-gfx type so it's a driver bug, probably not kernel driver related=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719338940.84e3.31188--

--===============0256183498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0256183498==--
