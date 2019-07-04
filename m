Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AADC5FAC5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 17:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5479A6E36B;
	Thu,  4 Jul 2019 15:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 200306E379
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 15:19:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1CB8272167; Thu,  4 Jul 2019 15:19:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105251] [Vega10]  GPU lockup on boot: VMC page fault
Date: Thu, 04 Jul 2019 15:19:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: pierre-eric.pelloux-prayer@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105251-502-YXjnmFQWad@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1894080775=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1894080775==
Content-Type: multipart/alternative; boundary="15622535511.BA75ffbe7.31076"
Content-Transfer-Encoding: 7bit


--15622535511.BA75ffbe7.31076
Date: Thu, 4 Jul 2019 15:19:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105251

--- Comment #70 from Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer=
@amd.com> ---
(In reply to zzyxpaw from comment #52)
> Created attachment 141522 [details]
> Logs + trace with patched mesa, plus example code which consistently
> triggers crash.
>=20


The example code is incorrect. Line 99:=20
   glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 5*sizeof(float),
&vertices[3]);
Should be:
   glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 5*sizeof(float), 3 *
sizeof(float));

(cf glVertexAttribPointer documentation: "pointer is treated as a byte offs=
et
into the buffer object's data store")

With this change the program runs correctly.

Note that even if the program is invalid it shouldn't hang the GPU. I'm wor=
king
on a fix for this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15622535511.BA75ffbe7.31076
Date: Thu, 4 Jul 2019 15:19:11 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251#c70">Comme=
nt # 70</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega10] GPU lockup on boot: VMC page fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105251">bug 10525=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-eric.pelloux-prayer&#64;amd.com" title=3D"Pierre-Eric Pelloux-Prayer=
 &lt;pierre-eric.pelloux-prayer&#64;amd.com&gt;"> <span class=3D"fn">Pierre=
-Eric Pelloux-Prayer</span></a>
</span></b>
        <pre>(In reply to zzyxpaw from <a href=3D"show_bug.cgi?id=3D105251#=
c52">comment #52</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D141522" name=3D"attach_141522" title=3D"Logs + trace with patched m=
esa, plus example code which consistently triggers crash.">attachment 14152=
2</a> <a href=3D"attachment.cgi?id=3D141522&amp;action=3Dedit" title=3D"Log=
s + trace with patched mesa, plus example code which consistently triggers =
crash.">[details]</a></span>
&gt; Logs + trace with patched mesa, plus example code which consistently
&gt; triggers crash.
&gt; </span >


The example code is incorrect. Line 99:=20
   glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 5*sizeof(float),
&amp;vertices[3]);
Should be:
   glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 5*sizeof(float), 3 *
sizeof(float));

(cf glVertexAttribPointer documentation: &quot;pointer is treated as a byte=
 offset
into the buffer object's data store&quot;)

With this change the program runs correctly.

Note that even if the program is invalid it shouldn't hang the GPU. I'm wor=
king
on a fix for this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15622535511.BA75ffbe7.31076--

--===============1894080775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1894080775==--
