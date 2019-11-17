Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE82FF809
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 07:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49616E255;
	Sun, 17 Nov 2019 06:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 131926E255
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 06:12:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0FDF9720E2; Sun, 17 Nov 2019 06:12:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112304] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout causes system freeze
Date: Sun, 17 Nov 2019 06:12:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: saadnaji89@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-112304-502-YIIJrLRphY@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112304-502@http.bugs.freedesktop.org/>
References: <bug-112304-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0128978080=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0128978080==
Content-Type: multipart/alternative; boundary="15739711680.7Bf7ae63.2987"
Content-Transfer-Encoding: 7bit


--15739711680.7Bf7ae63.2987
Date: Sun, 17 Nov 2019 06:12:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112304

--- Comment #7 from saadnaji89@gmail.com ---
Created attachment 145981
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145981&action=3Dedit
additional-journalctl-logs-during-game-play

I have enabled GPU reset with the following options
mdgpu.gpu_recovery=3D1 amdgpu.lockup_timeout=3D3000.

Then I have launch Counter Strike Source in attempts to capture logs as muc=
h as
I can before system freeze. I have added the new logs,
additional-journalctl-logs-during-game-play. Here is the snippet when error
begins from logs

Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: GPU fault detected: =
146
0x066e480c
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:=20=20
VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x00100DB3
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0E04800C
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: VM fault (0x0c, vmid=
 7)
at page 1052083, read from '' (0x00000000) (72)
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: GPU fault detected: =
146
0x06ae880c
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:=20=20
VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x00000000
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0F008010
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: VM fault (0x10, vmid=
 7)
at page 0, write from '' (0x00000000) (8)

...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739711680.7Bf7ae63.2987
Date: Sun, 17 Nov 2019 06:12:48 +0000
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
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut causes system freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112304#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut causes system freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112304">bug 11230=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
saadnaji89&#64;gmail.com" title=3D"saadnaji89&#64;gmail.com">saadnaji89&#64=
;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145981=
" name=3D"attach_145981" title=3D"additional-journalctl-logs-during-game-pl=
ay">attachment 145981</a> <a href=3D"attachment.cgi?id=3D145981&amp;action=
=3Dedit" title=3D"additional-journalctl-logs-during-game-play">[details]</a=
></span>
additional-journalctl-logs-during-game-play

I have enabled GPU reset with the following options
mdgpu.gpu_recovery=3D1 amdgpu.lockup_timeout=3D3000.

Then I have launch Counter Strike Source in attempts to capture logs as muc=
h as
I can before system freeze. I have added the new logs,
additional-journalctl-logs-during-game-play. Here is the snippet when error
begins from logs

Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: GPU fault detected: =
146
0x066e480c
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:=20=20
VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x00100DB3
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0E04800C
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: VM fault (0x0c, vmid=
 7)
at page 1052083, read from '' (0x00000000) (72)
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: GPU fault detected: =
146
0x06ae880c
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:=20=20
VM_CONTEXT1_PROTECTION_FAULT_ADDR   0x00000000
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0:=20=20
VM_CONTEXT1_PROTECTION_FAULT_STATUS 0x0F008010
Nov 17 01:02:36 archlinux kernel: amdgpu 0000:01:00.0: VM fault (0x10, vmid=
 7)
at page 0, write from '' (0x00000000) (8)

...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739711680.7Bf7ae63.2987--

--===============0128978080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0128978080==--
