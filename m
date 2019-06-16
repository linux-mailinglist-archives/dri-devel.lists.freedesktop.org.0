Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6048947620
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 19:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF90E89115;
	Sun, 16 Jun 2019 17:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2875A8911F
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2019 17:41:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 258C372167; Sun, 16 Jun 2019 17:41:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110897] HyperZ is broken for r300 (bad z for some micro and
 macrotiles?)
Date: Sun, 16 Jun 2019 17:41:38 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-110897-502-dMDiVFo0YD@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0085892280=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0085892280==
Content-Type: multipart/alternative; boundary="15607068981.74B2C.5241"
Content-Transfer-Encoding: 7bit


--15607068981.74B2C.5241
Date: Sun, 16 Jun 2019 17:41:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110897

--- Comment #61 from Richard Thier <u9vata@gmail.com> ---
Created attachment 144560
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144560&action=3Dedit
Fix variant 2 (special case pipe number for 0x5a62)

Added the second fix variation I've imagined. I am still compiling this so =
it
is not tested yet, but this should work just as well.

After thinking about it now, actually I tend to favor this latter one as be=
ing
more clean, because I have no idea what the other rs400 cards do if I just
forward to the r300 init code. My card works with that variant, but this is
more sane maybe?

The bad thing is that this literally only fixes those cards that do have 0x=
5a62
as their rdev->pdev->device value.

So "Fix variant 1" might fix more cards if they have a similar issue and "F=
ix
variant 2" should fix only this one and should not break unrelated cards.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15607068981.74B2C.5241
Date: Sun, 16 Jun 2019 17:41:38 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110897#c61">Comme=
nt # 61</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144560=
" name=3D"attach_144560" title=3D"Fix variant 2 (special case pipe number f=
or 0x5a62)">attachment 144560</a> <a href=3D"attachment.cgi?id=3D144560&amp=
;action=3Dedit" title=3D"Fix variant 2 (special case pipe number for 0x5a62=
)">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D11=
0897&amp;attachment=3D144560'>[review]</a>
Fix variant 2 (special case pipe number for 0x5a62)

Added the second fix variation I've imagined. I am still compiling this so =
it
is not tested yet, but this should work just as well.

After thinking about it now, actually I tend to favor this latter one as be=
ing
more clean, because I have no idea what the other rs400 cards do if I just
forward to the r300 init code. My card works with that variant, but this is
more sane maybe?

The bad thing is that this literally only fixes those cards that do have 0x=
5a62
as their rdev-&gt;pdev-&gt;device value.

So &quot;Fix variant 1&quot; might fix more cards if they have a similar is=
sue and &quot;Fix
variant 2&quot; should fix only this one and should not break unrelated car=
ds.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15607068981.74B2C.5241--

--===============0085892280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0085892280==--
