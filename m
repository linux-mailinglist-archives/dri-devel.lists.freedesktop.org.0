Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D770B01
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 23:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD31890A6;
	Mon, 22 Jul 2019 21:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B926A89F3C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 21:06:45 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B304A72167; Mon, 22 Jul 2019 21:06:45 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105251] [Vega10]  GPU lockup on boot: VMC page fault
Date: Mon, 22 Jul 2019 21:06:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: ds2.bugs.freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-105251-502-E01Zpj2Y8a@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105251-502@http.bugs.freedesktop.org/>
References: <bug-105251-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1184294881=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1184294881==
Content-Type: multipart/alternative; boundary="15638296057.0E98cd77.3285"
Content-Transfer-Encoding: 7bit


--15638296057.0E98cd77.3285
Date: Mon, 22 Jul 2019 21:06:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105251

--- Comment #78 from deltasquared <ds2.bugs.freedesktop@gmail.com> ---
Created attachment 144846
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144846&action=3Dedit
vega_crasher after patch, colour shaded central output, on ryzen 2200G with
vega 8 graphics

Screenshot 2/2 of vega_crasher after patch. It seems to indeterministically
switch between shaded and black central regions - I can only assume this is
down to whether or not the offending index ends up out of bounds?

If it helps I can attempt more tests with an asserts-enabled build, though =
that
will take some more time, a resource I am out of for today. (Will have to l=
ook
at how to do that also - just a question of a debug build or another flag t=
hat
needs passing?)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15638296057.0E98cd77.3285
Date: Mon, 22 Jul 2019 21:06:45 +0000
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
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251#c78">Comme=
nt # 78</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251">bug 10525=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ds2.bugs.freedesktop&#64;gmail.com" title=3D"deltasquared &lt;ds2.bugs.free=
desktop&#64;gmail.com&gt;"> <span class=3D"fn">deltasquared</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144846=
" name=3D"attach_144846" title=3D"vega_crasher after patch, colour shaded c=
entral output, on ryzen 2200G with vega 8 graphics">attachment 144846</a> <=
a href=3D"attachment.cgi?id=3D144846&amp;action=3Dedit" title=3D"vega_crash=
er after patch, colour shaded central output, on ryzen 2200G with vega 8 gr=
aphics">[details]</a></span>
vega_crasher after patch, colour shaded central output, on ryzen 2200G with
vega 8 graphics

Screenshot 2/2 of vega_crasher after patch. It seems to indeterministically
switch between shaded and black central regions - I can only assume this is
down to whether or not the offending index ends up out of bounds?

If it helps I can attempt more tests with an asserts-enabled build, though =
that
will take some more time, a resource I am out of for today. (Will have to l=
ook
at how to do that also - just a question of a debug build or another flag t=
hat
needs passing?)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15638296057.0E98cd77.3285--

--===============1184294881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1184294881==--
