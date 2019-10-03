Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7BFCA07E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 16:40:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B983D6EA05;
	Thu,  3 Oct 2019 14:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 474746EA01
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 14:40:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3A3D172162; Thu,  3 Oct 2019 14:40:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111848] AMDGPU and display fails after resume from suspend
Date: Thu, 03 Oct 2019 14:40:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111848-502-5O6lRbBQ6H@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111848-502@http.bugs.freedesktop.org/>
References: <bug-111848-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0332767340=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0332767340==
Content-Type: multipart/alternative; boundary="15701136170.cFCb8a1.13497"
Content-Transfer-Encoding: 7bit


--15701136170.cFCb8a1.13497
Date: Thu, 3 Oct 2019 14:40:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111848

--- Comment #16 from Alex Deucher <alexdeucher@gmail.com> ---
(In reply to me from comment #15)
> Is there a Fedora workflow for bisecting?
> Also, do I need to take care of any GPU firmware or is it just the kernel?

Don't worry about the firmware, just the kernel is fine.  Here's a bisect h=
owto
tailored to fedora:
https://fedoraproject.org/wiki/User:Ignatenkobrain/Kernel/Bisection

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15701136170.cFCb8a1.13497
Date: Thu, 3 Oct 2019 14:40:17 +0000
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
   title=3D"NEW - AMDGPU and display fails after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111848#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMDGPU and display fails after resume from suspend"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111848">bug 11184=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>(In reply to me from <a href=3D"show_bug.cgi?id=3D111848#c15">=
comment #15</a>)
<span class=3D"quote">&gt; Is there a Fedora workflow for bisecting?
&gt; Also, do I need to take care of any GPU firmware or is it just the ker=
nel?</span >

Don't worry about the firmware, just the kernel is fine.  Here's a bisect h=
owto
tailored to fedora:
<a href=3D"https://fedoraproject.org/wiki/User:Ignatenkobrain/Kernel/Bisect=
ion">https://fedoraproject.org/wiki/User:Ignatenkobrain/Kernel/Bisection</a=
></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15701136170.cFCb8a1.13497--

--===============0332767340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0332767340==--
