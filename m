Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E4C2BF0B
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 08:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8676989B67;
	Tue, 28 May 2019 06:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8D0089B67
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 06:07:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C15AE72167; Tue, 28 May 2019 06:07:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110749] [Vega 11] [amdgpu retry page fault
 VM_L2_PROTECTION_FAULT_STATUS] System lock up during playing Steam version of
 Saints Row 3
Date: Tue, 28 May 2019 06:07:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: evvke@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110749-502-rpFd48GsP7@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110749-502@http.bugs.freedesktop.org/>
References: <bug-110749-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1518526117=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1518526117==
Content-Type: multipart/alternative; boundary="15590236330.A8C4EdC.19894"
Content-Transfer-Encoding: 7bit


--15590236330.A8C4EdC.19894
Date: Tue, 28 May 2019 06:07:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110749

--- Comment #3 from Cyrax <evvke@hotmail.com> ---
Created attachment 144359
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144359&action=3Dedit
dmesg dump via journalctl -b -1 command

It seems that the error message is different now when forcing Saints Row The
Third to run only on two cores via command taskset --cpu-list 0,2

I'm wondering if VirtualBox or LXC containers is cause for this.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15590236330.A8C4EdC.19894
Date: Tue, 28 May 2019 06:07:13 +0000
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
   title=3D"NEW - [Vega 11] [amdgpu retry page fault VM_L2_PROTECTION_FAULT=
_STATUS] System lock up during playing Steam version of Saints Row 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110749#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Vega 11] [amdgpu retry page fault VM_L2_PROTECTION_FAULT=
_STATUS] System lock up during playing Steam version of Saints Row 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110749">bug 11074=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
evvke&#64;hotmail.com" title=3D"Cyrax &lt;evvke&#64;hotmail.com&gt;"> <span=
 class=3D"fn">Cyrax</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144359=
" name=3D"attach_144359" title=3D"dmesg dump via journalctl -b -1 command">=
attachment 144359</a> <a href=3D"attachment.cgi?id=3D144359&amp;action=3Ded=
it" title=3D"dmesg dump via journalctl -b -1 command">[details]</a></span>
dmesg dump via journalctl -b -1 command

It seems that the error message is different now when forcing Saints Row The
Third to run only on two cores via command taskset --cpu-list 0,2

I'm wondering if VirtualBox or LXC containers is cause for this.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15590236330.A8C4EdC.19894--

--===============1518526117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1518526117==--
