Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 071369D5C9
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 20:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E916E29A;
	Mon, 26 Aug 2019 18:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 831546E29D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 18:27:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 803AE72161; Mon, 26 Aug 2019 18:27:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111122] 2500U: Graphics corruption on kernel 5.2
Date: Mon, 26 Aug 2019 18:27:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: codespunk+bugzilla.freedesktop@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111122-502-AgIUvIauV2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111122-502@http.bugs.freedesktop.org/>
References: <bug-111122-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0990735195=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0990735195==
Content-Type: multipart/alternative; boundary="15668440224.95cFd.6110"
Content-Transfer-Encoding: 7bit


--15668440224.95cFd.6110
Date: Mon, 26 Aug 2019 18:27:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111122

--- Comment #26 from Matt D. <codespunk+bugzilla.freedesktop@gmail.com> ---
Created attachment 145172
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145172&action=3Dedit
amd_fix.sh

I've been having a problem with display corruption on Fedora using recent
updates. Here is my report on their bug tracker:

https://bugzilla.redhat.com/show_bug.cgi?id=3D1745380

I can confirm that when compiz is enabled, the system will lock up when it's
started. Adding "iommu=3Dpt" to the kernel flags in grub2 will allow the sy=
stem
to boot without freezing but the display is still corrupt.

Adding "AMD_DEBUG=3Dnodcc" to the environment provides a complete workaround
(without the need for the kernel flag).

I've attached a file "amd_fix.sh" which if placed in /etc/profile.d/ will
provide a workaround until this can be fixed in the kernel or wherever the
problem is.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668440224.95cFd.6110
Date: Mon, 26 Aug 2019 18:27:02 +0000
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
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122#c26">Comme=
nt # 26</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 2500U: Graphics corruption on kernel 5.2"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111122">bug 11112=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
codespunk+bugzilla.freedesktop&#64;gmail.com" title=3D"Matt D. &lt;codespun=
k+bugzilla.freedesktop&#64;gmail.com&gt;"> <span class=3D"fn">Matt D.</span=
></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145172=
" name=3D"attach_145172" title=3D"amd_fix.sh">attachment 145172</a> <a href=
=3D"attachment.cgi?id=3D145172&amp;action=3Dedit" title=3D"amd_fix.sh">[det=
ails]</a></span>
amd_fix.sh

I've been having a problem with display corruption on Fedora using recent
updates. Here is my report on their bug tracker:

<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1745380">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1745380</a>

I can confirm that when compiz is enabled, the system will lock up when it's
started. Adding &quot;iommu=3Dpt&quot; to the kernel flags in grub2 will al=
low the system
to boot without freezing but the display is still corrupt.

Adding &quot;AMD_DEBUG=3Dnodcc&quot; to the environment provides a complete=
 workaround
(without the need for the kernel flag).

I've attached a file &quot;amd_fix.sh&quot; which if placed in /etc/profile=
.d/ will
provide a workaround until this can be fixed in the kernel or wherever the
problem is.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668440224.95cFd.6110--

--===============0990735195==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0990735195==--
