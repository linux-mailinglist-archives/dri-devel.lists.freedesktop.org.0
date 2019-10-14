Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50417D5FEC
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 12:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF3489FD7;
	Mon, 14 Oct 2019 10:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 21F566E248
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 10:20:34 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1EC557296E; Mon, 14 Oct 2019 10:20:34 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Mon, 14 Oct 2019 10:20:33 +0000
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
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-2bBMhaVc82@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0814452968=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0814452968==
Content-Type: multipart/alternative; boundary="15710484341.5c59faFca.24925"
Content-Transfer-Encoding: 7bit


--15710484341.5c59faFca.24925
Date: Mon, 14 Oct 2019 10:20:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #94 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #93)
> Created attachment 145734 [details] [review]
> sdma read delay
>=20
> Hi all,
>=20
> Here's a new patch that should help with sdma issues.
>=20
> This is not a replacement for
> https://patchwork.freedesktop.org/patch/335077/ nor
> https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c33 so ideally you
> should have the 3 patches applied and the "AMD_DEBUG=3Dnodma" workaround
> disabled.
>=20
> Let me know if it helps getting rid of the sdma timeout errors. Thanks!

Excellent! I will test it further when I come home, I only have the recent =
SDMA
patch applied in the kernel and "random" hangs were already gone, hopefully
this will help fix the game-specific provoked SDMA type hangs! Will report =
back
in the following days.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15710484341.5c59faFca.24925
Date: Mon, 14 Oct 2019 10:20:34 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c94">Comme=
nt # 94</a>
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
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D111481#c93">comment #93</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145734" name=3D"attach_145734" title=3D"sdma read delay">attachment=
 145734</a> <a href=3D"attachment.cgi?id=3D145734&amp;action=3Dedit" title=
=3D"sdma read delay">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter=
.html&amp;bug=3D111481&amp;attachment=3D145734'>[review]</a> [review]
&gt; sdma read delay
&gt;=20
&gt; Hi all,
&gt;=20
&gt; Here's a new patch that should help with sdma issues.
&gt;=20
&gt; This is not a replacement for
&gt; <a href=3D"https://patchwork.freedesktop.org/patch/335077/">https://pa=
tchwork.freedesktop.org/patch/335077/</a> nor
&gt; <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"show_bug.cgi?id=3D111481#c33">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D111481#c33</a> so ideally you
&gt; should have the 3 patches applied and the &quot;AMD_DEBUG=3Dnodma&quot=
; workaround
&gt; disabled.
&gt;=20
&gt; Let me know if it helps getting rid of the sdma timeout errors. Thanks=
!</span >

Excellent! I will test it further when I come home, I only have the recent =
SDMA
patch applied in the kernel and &quot;random&quot; hangs were already gone,=
 hopefully
this will help fix the game-specific provoked SDMA type hangs! Will report =
back
in the following days.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15710484341.5c59faFca.24925--

--===============0814452968==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0814452968==--
