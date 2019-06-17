Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA8D47F78
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 12:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C74789142;
	Mon, 17 Jun 2019 10:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 472C08919D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 10:18:19 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 44C5372167; Mon, 17 Jun 2019 10:18:19 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110674] Crashes / Resets From AMDGPU / Radeon VII
Date: Mon, 17 Jun 2019 10:18:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: tom@r.je
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110674-502-MCUSILTUCG@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110674-502@http.bugs.freedesktop.org/>
References: <bug-110674-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1502837779=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1502837779==
Content-Type: multipart/alternative; boundary="15607666992.B0C2ddB93.30264"
Content-Transfer-Encoding: 7bit


--15607666992.B0C2ddB93.30264
Date: Mon, 17 Jun 2019 10:18:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110674

--- Comment #41 from Tom B <tom@r.je> ---
Created attachment 144569
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144569&action=3Dedit
5.1.9 full dmesg

Interestingly I just reinstalled 5.1.9 and I'm not seeing the same immediate
crash. It may be another package as I tried three boots and all had the same
issue of immediate crashing on SDDM start. The only way I managed to get dm=
esg
output was switching TTY immediately, switching back to tty1 where SDDM was
running caused the immediate crash

After reinstalling I'm getting the same issue as earlier 5.1 kernels where =
it
freezes the PC under load and is stuck in the same power state. Oddly I'm
seeing 137w constantly in 5.1.9 where I was getting 135w in 5.1.3 though I
didn't test 5.1.3 multiple times, it might reach a wattage on boot and then
stick to it.

I have attached the full dmesg anyway.

> Are you passing any parameters to the driver?

I have nothing related to amdgpu in /etc/modprobe.d and my kernel commend l=
ine
is:

[    0.364597] Kernel command line: BOOT_IMAGE=3D/vmlinuz-linux
root=3DUUID=3Dfc6ad741-d52d-47eb-b6a6-0026f27b29f3 rw quiet

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15607666992.B0C2ddB93.30264
Date: Mon, 17 Jun 2019 10:18:19 +0000
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
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674#c41">Comme=
nt # 41</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crashes / Resets From AMDGPU / Radeon VII"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110674">bug 11067=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tom&#64;r.je" title=3D"Tom B &lt;tom&#64;r.je&gt;"> <span class=3D"fn">Tom =
B</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144569=
" name=3D"attach_144569" title=3D"5.1.9 full dmesg">attachment 144569</a> <=
a href=3D"attachment.cgi?id=3D144569&amp;action=3Dedit" title=3D"5.1.9 full=
 dmesg">[details]</a></span>
5.1.9 full dmesg

Interestingly I just reinstalled 5.1.9 and I'm not seeing the same immediate
crash. It may be another package as I tried three boots and all had the same
issue of immediate crashing on SDDM start. The only way I managed to get dm=
esg
output was switching TTY immediately, switching back to tty1 where SDDM was
running caused the immediate crash

After reinstalling I'm getting the same issue as earlier 5.1 kernels where =
it
freezes the PC under load and is stuck in the same power state. Oddly I'm
seeing 137w constantly in 5.1.9 where I was getting 135w in 5.1.3 though I
didn't test 5.1.3 multiple times, it might reach a wattage on boot and then
stick to it.

I have attached the full dmesg anyway.

<span class=3D"quote">&gt; Are you passing any parameters to the driver?</s=
pan >

I have nothing related to amdgpu in /etc/modprobe.d and my kernel commend l=
ine
is:

[    0.364597] Kernel command line: BOOT_IMAGE=3D/vmlinuz-linux
root=3DUUID=3Dfc6ad741-d52d-47eb-b6a6-0026f27b29f3 rw quiet</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15607666992.B0C2ddB93.30264--

--===============1502837779==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1502837779==--
