Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4760A47459
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 13:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AFD8914C;
	Sun, 16 Jun 2019 11:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A07C38922A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 11:23:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9DAA372167; Sun, 16 Jun 2019 11:23:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Sun, 16 Jun 2019 11:23:11 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/r300
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: u9vata@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110897-502-W2v2YOyDMp@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110897-502@http.bugs.freedesktop.org/>
References: <bug-110897-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2061011736=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2061011736==
Content-Type: multipart/alternative; boundary="15606841913.D85a.3764"
Content-Transfer-Encoding: 7bit


--15606841913.D85a.3764
Date: Sun, 16 Jun 2019 11:23:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #56 from Richard Thier <u9vata@gmail.com> ---
(In reply to cosiekvfj from comment #54)
> Created attachment 144558 [details]
> dmesg log
>=20
> [   14.303343] [drm] radeon: 1 quad pipes, 1 z pipes initialized.

This is really interesting! It tells us why it works in your case (the 1 qu=
ad
pipe is reported "properly"), but I have no idea why it is reported properl=
y.

I see you are using 4.x kernel so there might be changes - or for some reas=
on
your card returns proper values from the registers the driver read from and
mine does not. Thank you for the information!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15606841913.D85a.3764
Date: Sun, 16 Jun 2019 11:23:11 +0000
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
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c56">Comme=
nt # 56</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HyperZ is broken for r300 (bad z for some micro and macro=
tiles?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897">bug 11089=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
u9vata&#64;gmail.com" title=3D"Richard Thier &lt;u9vata&#64;gmail.com&gt;">=
 <span class=3D"fn">Richard Thier</span></a>
</span></b>
        <pre>(In reply to cosiekvfj from <a href=3D"show_bug.cgi?id=3D11089=
7#c54">comment #54</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D144558" name=3D"attach_144558" title=3D"dmesg log">attachment 14455=
8</a> <a href=3D"attachment.cgi?id=3D144558&amp;action=3Dedit" title=3D"dme=
sg log">[details]</a></span>
&gt; dmesg log
&gt;=20
&gt; [   14.303343] [drm] radeon: 1 quad pipes, 1 z pipes initialized.</spa=
n >

This is really interesting! It tells us why it works in your case (the 1 qu=
ad
pipe is reported &quot;properly&quot;), but I have no idea why it is report=
ed properly.

I see you are using 4.x kernel so there might be changes - or for some reas=
on
your card returns proper values from the registers the driver read from and
mine does not. Thank you for the information!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15606841913.D85a.3764--

--===============2061011736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2061011736==--
