Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14972111C9
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 05:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0681A8922A;
	Thu,  2 May 2019 03:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 72731891FB
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 03:09:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6F35A7215A; Thu,  2 May 2019 03:09:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110371] HP Dreamcolor display *Error* No EDID read
Date: Thu, 02 May 2019 03:09:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Babblebones@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110371-502-lXMqfw87t2@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110371-502@http.bugs.freedesktop.org/>
References: <bug-110371-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1947652932=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1947652932==
Content-Type: multipart/alternative; boundary="15567665501.1002a.11467"
Content-Transfer-Encoding: 7bit


--15567665501.1002a.11467
Date: Thu, 2 May 2019 03:09:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110371

--- Comment #7 from Babblebones@gmail.com ---
Created attachment 144124
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144124&action=3Dedit
Dmesg drm.debug=3D4

Funny enough it complains about missing EDID in this one too. May not even =
be
the issue now that I'm coming in on it.
But I seem to have found the commit where my panel breaks down.

It's a big drm-next merge. It has to be one of the core changes listed on t=
he
changelog.
I'm not a git wizard, is there any way to get more granular about this comm=
it?
Anyone have an idea what's broken in here?

54c88a029a0a86fe00a0ee7d2a15ee08e6d04db9

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15567665501.1002a.11467
Date: Thu, 2 May 2019 03:09:10 +0000
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
   title=3D"NEW - HP Dreamcolor display *Error* No EDID read"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110371#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP Dreamcolor display *Error* No EDID read"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110371">bug 11037=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Babblebones&#64;gmail.com" title=3D"Babblebones&#64;gmail.com">Babblebones&=
#64;gmail.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144124=
" name=3D"attach_144124" title=3D"Dmesg drm.debug=3D4">attachment 144124</a=
> <a href=3D"attachment.cgi?id=3D144124&amp;action=3Dedit" title=3D"Dmesg d=
rm.debug=3D4">[details]</a></span>
Dmesg drm.debug=3D4

Funny enough it complains about missing EDID in this one too. May not even =
be
the issue now that I'm coming in on it.
But I seem to have found the commit where my panel breaks down.

It's a big drm-next merge. It has to be one of the core changes listed on t=
he
changelog.
I'm not a git wizard, is there any way to get more granular about this comm=
it?
Anyone have an idea what's broken in here?

54c88a029a0a86fe00a0ee7d2a15ee08e6d04db9</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15567665501.1002a.11467--

--===============1947652932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1947652932==--
