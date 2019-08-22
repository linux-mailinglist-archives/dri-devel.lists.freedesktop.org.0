Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55D99E81
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 20:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397B16E9F5;
	Thu, 22 Aug 2019 18:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2ED546E9F5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 18:15:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2BDFC72161; Thu, 22 Aug 2019 18:15:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110659] pageflipping seems to cause jittering on mouse input
 when running Hitman 2 in Wine/DXVK with amdgpu.dc=1
Date: Thu, 22 Aug 2019 18:15:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110659-502-06ZA3JfqhE@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110659-502@http.bugs.freedesktop.org/>
References: <bug-110659-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1426940249=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1426940249==
Content-Type: multipart/alternative; boundary="15664977351.6B0BbC3Ae.30863"
Content-Transfer-Encoding: 7bit


--15664977351.6B0BbC3Ae.30863
Date: Thu, 22 Aug 2019 18:15:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110659

--- Comment #45 from tempel.julian@gmail.com ---
Created attachment 145140
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145140&action=3Dedit
new dmesg log with debug patch applied after starting Hitman 2

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15664977351.6B0BbC3Ae.30863
Date: Thu, 22 Aug 2019 18:15:35 +0000
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
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659#c45">Comme=
nt # 45</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - pageflipping seems to cause jittering on mouse input when=
 running Hitman 2 in Wine/DXVK with amdgpu.dc=3D1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110659">bug 11065=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145140=
" name=3D"attach_145140" title=3D"new dmesg log with debug patch applied af=
ter starting Hitman 2">attachment 145140</a> <a href=3D"attachment.cgi?id=
=3D145140&amp;action=3Dedit" title=3D"new dmesg log with debug patch applie=
d after starting Hitman 2">[details]</a></span>
new dmesg log with debug patch applied after starting Hitman 2</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15664977351.6B0BbC3Ae.30863--

--===============1426940249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1426940249==--
