Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942C258EC5
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 01:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494966E858;
	Thu, 27 Jun 2019 23:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id F22266E858
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 23:50:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EF50772167; Thu, 27 Jun 2019 23:50:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110929] sw_init of IP block <vega10_ih> failed -12 when using
 Secure Memory Encryption (SME) with Vega 64
Date: Thu, 27 Jun 2019 23:50:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: john.bridgman@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110929-502-vWJPuiiXYo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110929-502@http.bugs.freedesktop.org/>
References: <bug-110929-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2050891388=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2050891388==
Content-Type: multipart/alternative; boundary="15616794082.1DC87762.15114"
Content-Transfer-Encoding: 7bit


--15616794082.1DC87762.15114
Date: Thu, 27 Jun 2019 23:50:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110929

--- Comment #1 from John Bridgman <john.bridgman@amd.com> ---
How are you enabling SME - transparent mode (via SBIOS I think) where all p=
ages
are encrypted, or <whatever you call the other mode> via OS where only pages
with PA bit 47 set are encrypted ?=20

I would not expect the first option to work since anything written from CPU=
 to
GPU will get garbled by the encryption, but the second should work as long =
as
no buffers passed to or allocated by GPU driver are encrypted.=20

I haven't used SME so not sure about options - wasn't aware we even enabled=
 it
on Ryzen parts, thought it was Epyc only.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15616794082.1DC87762.15114
Date: Thu, 27 Jun 2019 23:50:08 +0000
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
   title=3D"NEW - sw_init of IP block &lt;vega10_ih&gt; failed -12 when usi=
ng Secure Memory Encryption (SME) with Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110929#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - sw_init of IP block &lt;vega10_ih&gt; failed -12 when usi=
ng Secure Memory Encryption (SME) with Vega 64"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110929">bug 11092=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
john.bridgman&#64;amd.com" title=3D"John Bridgman &lt;john.bridgman&#64;amd=
.com&gt;"> <span class=3D"fn">John Bridgman</span></a>
</span></b>
        <pre>How are you enabling SME - transparent mode (via SBIOS I think=
) where all pages
are encrypted, or &lt;whatever you call the other mode&gt; via OS where onl=
y pages
with PA bit 47 set are encrypted ?=20

I would not expect the first option to work since anything written from CPU=
 to
GPU will get garbled by the encryption, but the second should work as long =
as
no buffers passed to or allocated by GPU driver are encrypted.=20

I haven't used SME so not sure about options - wasn't aware we even enabled=
 it
on Ryzen parts, thought it was Epyc only.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15616794082.1DC87762.15114--

--===============2050891388==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2050891388==--
