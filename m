Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DE0A4688
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 01:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07406E156;
	Sat, 31 Aug 2019 23:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 604EE6E156
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 23:21:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5D5EA72161; Sat, 31 Aug 2019 23:21:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111273] crash calling AMDGPU_INFO_READ_MMR_REG with count set
 to -1
Date: Sat, 31 Aug 2019 23:21:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: trek00@inbox.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111273-502-wz05f9xYA8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111273-502@http.bugs.freedesktop.org/>
References: <bug-111273-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1921165893=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1921165893==
Content-Type: multipart/alternative; boundary="15672937141.099AE.7588"
Content-Transfer-Encoding: 7bit


--15672937141.099AE.7588
Date: Sat, 31 Aug 2019 23:21:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111273

--- Comment #1 from Trek <trek00@inbox.ru> ---
Created attachment 145226
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145226&action=3Dedit
possible fix

The proposed fix is tested on latest git.

I'm unsure if 65536 is a good limit: it could be small as 64, but even if t=
he
longest consecutive registers are 48, may be in the future they are increas=
ed
and no one remember to higher that limit. Anyway it should not be larger th=
an
the PCI BAR area for memory mapped registers, that on my KAVERI is 256K, th=
us
65536 registers.

ciao!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15672937141.099AE.7588
Date: Sat, 31 Aug 2019 23:21:54 +0000
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
   title=3D"NEW - crash calling AMDGPU_INFO_READ_MMR_REG with count set to =
-1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111273#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - crash calling AMDGPU_INFO_READ_MMR_REG with count set to =
-1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111273">bug 11127=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
trek00&#64;inbox.ru" title=3D"Trek &lt;trek00&#64;inbox.ru&gt;"> <span clas=
s=3D"fn">Trek</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145226=
" name=3D"attach_145226" title=3D"possible fix">attachment 145226</a> <a hr=
ef=3D"attachment.cgi?id=3D145226&amp;action=3Dedit" title=3D"possible fix">=
[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D11127=
3&amp;attachment=3D145226'>[review]</a>
possible fix

The proposed fix is tested on latest git.

I'm unsure if 65536 is a good limit: it could be small as 64, but even if t=
he
longest consecutive registers are 48, may be in the future they are increas=
ed
and no one remember to higher that limit. Anyway it should not be larger th=
an
the PCI BAR area for memory mapped registers, that on my KAVERI is 256K, th=
us
65536 registers.

ciao!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15672937141.099AE.7588--

--===============1921165893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1921165893==--
