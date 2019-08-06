Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4748286F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 02:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC8D6E2B2;
	Tue,  6 Aug 2019 00:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 86E6F6E1E9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 00:14:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7D53472167; Tue,  6 Aug 2019 00:14:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111229] Unable to unbind GPU from amdgpu
Date: Tue, 06 Aug 2019 00:14:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: eugene@shatsky.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111229-502-ROz7RA1zyI@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111229-502@http.bugs.freedesktop.org/>
References: <bug-111229-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0922676646=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0922676646==
Content-Type: multipart/alternative; boundary="15650504570.A38EfBF.15576"
Content-Transfer-Encoding: 7bit


--15650504570.A38EfBF.15576
Date: Tue, 6 Aug 2019 00:14:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111229

--- Comment #8 from Eugene Shatsky <eugene@shatsky.net> ---
Created attachment 144952
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144952&action=3Dedit
another kernel, another disasterous unbind attempt

I couldn't rebind my RX 470 or shutdown the system cleanly after unbinding =
it
on any kernel my NixOS had since I've got it last winter. Reproduced OPs me=
thod
for 4.19.64, got severe warnings and oops, "modprobe -r amdgpu" just hangs.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15650504570.A38EfBF.15576
Date: Tue, 6 Aug 2019 00:14:17 +0000
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
   title=3D"NEW - Unable to unbind GPU from amdgpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111229#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to unbind GPU from amdgpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111229">bug 11122=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eugene&#64;shatsky.net" title=3D"Eugene Shatsky &lt;eugene&#64;shatsky.net&=
gt;"> <span class=3D"fn">Eugene Shatsky</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144952=
" name=3D"attach_144952" title=3D"another kernel, another disasterous unbin=
d attempt">attachment 144952</a> <a href=3D"attachment.cgi?id=3D144952&amp;=
action=3Dedit" title=3D"another kernel, another disasterous unbind attempt"=
>[details]</a></span>
another kernel, another disasterous unbind attempt

I couldn't rebind my RX 470 or shutdown the system cleanly after unbinding =
it
on any kernel my NixOS had since I've got it last winter. Reproduced OPs me=
thod
for 4.19.64, got severe warnings and oops, &quot;modprobe -r amdgpu&quot; j=
ust hangs.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15650504570.A38EfBF.15576--

--===============0922676646==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0922676646==--
