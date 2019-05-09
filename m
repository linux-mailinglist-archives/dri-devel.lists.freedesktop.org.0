Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A44DE192F9
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 21:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F290289C6E;
	Thu,  9 May 2019 19:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9F0C989C9A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2019 19:34:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9B8517215A; Thu,  9 May 2019 19:34:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110457] System resumes failed and hits [drm:amdgpu_job_timedout
 [amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G
Date: Thu, 09 May 2019 19:34:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: freedesktop@cameron.bz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110457-502-fJQtBA4s3H@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110457-502@http.bugs.freedesktop.org/>
References: <bug-110457-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0139733680=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0139733680==
Content-Type: multipart/alternative; boundary="15574304661.64c13.6226"
Content-Transfer-Encoding: 7bit


--15574304661.64c13.6226
Date: Thu, 9 May 2019 19:34:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110457

--- Comment #7 from Cameron Banfield <freedesktop@cameron.bz> ---
I am having very similar issues and see similar errors in logs. The most re=
cent
error was:

kernel: amdgpu 0000:06:00.0: [gfxhub] no-retry page fault (src_id:0 ring:24
vmid:1 pasid:32768, for process Xorg pid 1301 thread Xorg:cs0 pid 1362)
kernel: amdgpu 0000:06:00.0:   in page starting at address 0x0000800108a180=
00
from 27
kernel: amdgpu 0000:06:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101031

The laptop is then unusable and requires a hard reboot.

Linux Mint 19.1
Kernel 5.1.0
AMD Ryzen PRO 2700U with Vega 10 graphics

Trying to load cities skylines is a guaranteed crash.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15574304661.64c13.6226
Date: Thu, 9 May 2019 19:34:26 +0000
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
   title=3D"NEW - System resumes failed and hits [drm:amdgpu_job_timedout [=
amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110457#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System resumes failed and hits [drm:amdgpu_job_timedout [=
amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110457">bug 11045=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;cameron.bz" title=3D"Cameron Banfield &lt;freedesktop&#64;c=
ameron.bz&gt;"> <span class=3D"fn">Cameron Banfield</span></a>
</span></b>
        <pre>I am having very similar issues and see similar errors in logs=
. The most recent
error was:

kernel: amdgpu 0000:06:00.0: [gfxhub] no-retry page fault (src_id:0 ring:24
vmid:1 pasid:32768, for process Xorg pid 1301 thread Xorg:cs0 pid 1362)
kernel: amdgpu 0000:06:00.0:   in page starting at address 0x0000800108a180=
00
from 27
kernel: amdgpu 0000:06:00.0: VM_L2_PROTECTION_FAULT_STATUS:0x00101031

The laptop is then unusable and requires a hard reboot.

Linux Mint 19.1
Kernel 5.1.0
AMD Ryzen PRO 2700U with Vega 10 graphics

Trying to load cities skylines is a guaranteed crash.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15574304661.64c13.6226--

--===============0139733680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0139733680==--
