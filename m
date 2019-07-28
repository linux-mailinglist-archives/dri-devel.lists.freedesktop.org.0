Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F277F42
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jul 2019 13:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F436E02A;
	Sun, 28 Jul 2019 11:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 520076E02A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 11:35:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4B9E872168; Sun, 28 Jul 2019 11:35:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111229] Unable to unbind GPU from amdgpu
Date: Sun, 28 Jul 2019 11:35:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wedens13@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111229-502-F5mZ5YCkp9@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1611737291=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1611737291==
Content-Type: multipart/alternative; boundary="15643137351.bc4Dc1.16285"
Content-Transfer-Encoding: 7bit


--15643137351.bc4Dc1.16285
Date: Sun, 28 Jul 2019 11:35:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111229

--- Comment #5 from wedens13@yandex.ru ---
Created attachment 144896
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144896&action=3Dedit
unbinding without X running

I've attached a log of attempt to unbind without X running:

systemctl stop sddm
echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind ||
true

echo "0000:03:00.0" > /sys/bus/pci/devices/0000:03:00.0/driver/unbind

Result is the same but backtrace seems a bit different. This was done with
kernel 5.2.1.

I've tried suspend to ram and another reset bug mitigation (which helps in
other cases), but gpu is still unusable after this failed attempt to unbind=
. I
still can't re-bind it to amdgpu or vfio-pci and clean shutdown is not
happening.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15643137351.bc4Dc1.16285
Date: Sun, 28 Jul 2019 11:35:35 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111229#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to unbind GPU from amdgpu"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111229">bug 11122=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wedens13&#64;yandex.ru" title=3D"wedens13&#64;yandex.ru">wedens13&#64;yande=
x.ru</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144896=
" name=3D"attach_144896" title=3D"unbinding without X running">attachment 1=
44896</a> <a href=3D"attachment.cgi?id=3D144896&amp;action=3Dedit" title=3D=
"unbinding without X running">[details]</a></span>
unbinding without X running

I've attached a log of attempt to unbind without X running:

systemctl stop sddm
echo 0 &gt; /sys/class/vtconsole/vtcon0/bind
echo 0 &gt; /sys/class/vtconsole/vtcon1/bind
echo efi-framebuffer.0 &gt; /sys/bus/platform/drivers/efi-framebuffer/unbin=
d ||
true

echo &quot;0000:03:00.0&quot; &gt; /sys/bus/pci/devices/0000:03:00.0/driver=
/unbind

Result is the same but backtrace seems a bit different. This was done with
kernel 5.2.1.

I've tried suspend to ram and another reset bug mitigation (which helps in
other cases), but gpu is still unusable after this failed attempt to unbind=
. I
still can't re-bind it to amdgpu or vfio-pci and clean shutdown is not
happening.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15643137351.bc4Dc1.16285--

--===============1611737291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1611737291==--
