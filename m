Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A32221BD
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2019 07:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02310897C8;
	Sat, 18 May 2019 05:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 26370897C8
 for <dri-devel@lists.freedesktop.org>; Sat, 18 May 2019 05:47:53 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1DC3372168; Sat, 18 May 2019 05:47:53 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110702] segfault in radeonsi HEVC hardware decoding
Date: Sat, 18 May 2019 05:47:53 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110702-502-T0Qa2u1Iei@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110702-502@http.bugs.freedesktop.org/>
References: <bug-110702-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0083578605=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0083578605==
Content-Type: multipart/alternative; boundary="15581584731.2de0.12406"
Content-Transfer-Encoding: 7bit


--15581584731.2de0.12406
Date: Sat, 18 May 2019 05:47:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110702

--- Comment #1 from Pierre Ossman <pierre-bugzilla@ossman.eu> ---
Created attachment 144290
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144290&action=3Dedit
gdb bt full

A backtrace of the crash from gdb.

It looks like the allocation filed, but then either kodi or the driver went
ahead and tried to clear the buffer anyway.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15581584731.2de0.12406
Date: Sat, 18 May 2019 05:47:53 +0000
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
   title=3D"NEW - segfault in radeonsi HEVC hardware decoding"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110702#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - segfault in radeonsi HEVC hardware decoding"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110702">bug 11070=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre-bugzilla&#64;ossman.eu" title=3D"Pierre Ossman &lt;pierre-bugzilla&#=
64;ossman.eu&gt;"> <span class=3D"fn">Pierre Ossman</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144290=
" name=3D"attach_144290" title=3D"gdb bt full">attachment 144290</a> <a hre=
f=3D"attachment.cgi?id=3D144290&amp;action=3Dedit" title=3D"gdb bt full">[d=
etails]</a></span>
gdb bt full

A backtrace of the crash from gdb.

It looks like the allocation filed, but then either kodi or the driver went
ahead and tried to clear the buffer anyway.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15581584731.2de0.12406--

--===============0083578605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0083578605==--
