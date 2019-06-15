Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E54713D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 18:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31492892C9;
	Sat, 15 Jun 2019 16:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58F11892C9
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 16:21:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 55FAB72167; Sat, 15 Jun 2019 16:21:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 104437] RX480 + SME  = amdgpu init failed + null dereference
Date: Sat, 15 Jun 2019 16:21:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sarnex@gentoo.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-104437-502-4qkaNWJzCl@http.bugs.freedesktop.org/>
In-Reply-To: <bug-104437-502@http.bugs.freedesktop.org/>
References: <bug-104437-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1864444748=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1864444748==
Content-Type: multipart/alternative; boundary="15606156812.B0Fd1Efca.25722"
Content-Transfer-Encoding: 7bit


--15606156812.B0Fd1Efca.25722
Date: Sat, 15 Jun 2019 16:21:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104437

--- Comment #1 from Nick Sarnie <sarnex@gentoo.org> ---
Created attachment 144553
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144553&action=3Dedit
dmesg_sme.txt

Same issue using 5.1.9, RX Vega 64 and Ryzen 2700x.

[   19.998488] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* sw_init of IP
block <vega10_ih> failed -12
[   19.998490] amdgpu 0000:0c:00.0: amdgpu_device_ip_init failed
[   19.998492] amdgpu 0000:0c:00.0: Fatal error during GPU init
[   19.998493] [drm] amdgpu: finishing device.
[   19.998601] [drm] amdgpu: ttm finalized


I've attached my dmesg as well.

Thanks,
Sarnex

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15606156812.B0Fd1Efca.25722
Date: Sat, 15 Jun 2019 16:21:21 +0000
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
   title=3D"NEW - RX480 + SME =3D amdgpu init failed + null dereference"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104437#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX480 + SME =3D amdgpu init failed + null dereference"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104437">bug 10443=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sarnex&#64;gentoo.org" title=3D"Nick Sarnie &lt;sarnex&#64;gentoo.org&gt;">=
 <span class=3D"fn">Nick Sarnie</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144553=
" name=3D"attach_144553" title=3D"dmesg_sme.txt">attachment 144553</a> <a h=
ref=3D"attachment.cgi?id=3D144553&amp;action=3Dedit" title=3D"dmesg_sme.txt=
">[details]</a></span>
dmesg_sme.txt

Same issue using 5.1.9, RX Vega 64 and Ryzen 2700x.

[   19.998488] [drm:amdgpu_device_init.cold [amdgpu]] *ERROR* sw_init of IP
block &lt;vega10_ih&gt; failed -12
[   19.998490] amdgpu 0000:0c:00.0: amdgpu_device_ip_init failed
[   19.998492] amdgpu 0000:0c:00.0: Fatal error during GPU init
[   19.998493] [drm] amdgpu: finishing device.
[   19.998601] [drm] amdgpu: ttm finalized


I've attached my dmesg as well.

Thanks,
Sarnex</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15606156812.B0Fd1Efca.25722--

--===============1864444748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1864444748==--
