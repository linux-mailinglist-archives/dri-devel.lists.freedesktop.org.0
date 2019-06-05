Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 280D535A9D
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 12:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6938982A;
	Wed,  5 Jun 2019 10:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE137895C4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 10:44:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A3F2B72167; Wed,  5 Jun 2019 10:44:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110730] [CI][RESUME] igt@kms_chamelium@hdmi-crc-single - crash
 - Received signal SIGSEGV.
Date: Wed, 05 Jun 2019 10:44:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contact@emersion.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110730-502-0lGZFMuQjz@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110730-502@http.bugs.freedesktop.org/>
References: <bug-110730-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0579058581=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0579058581==
Content-Type: multipart/alternative; boundary="15597314940.006a1.31972"
Content-Transfer-Encoding: 7bit


--15597314940.006a1.31972
Date: Wed, 5 Jun 2019 10:44:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110730

--- Comment #6 from emersion <contact@emersion.fr> ---
Agreed that this is an IGT bug, not a driver bug.

Just sent an IGT patch that attempts to fix the issue.

User impact: the user might experience corrupted frames via HDMI. In other
words: we don't check anymore that HDMI is properly working since this test=
 is
broken.

Other CRC/frame tests aren't run after a crash (this is the first one).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597314940.006a1.31972
Date: Wed, 5 Jun 2019 10:44:54 +0000
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
   title=3D"NEW - [CI][RESUME] igt&#64;kms_chamelium&#64;hdmi-crc-single - =
crash - Received signal SIGSEGV."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110730#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME] igt&#64;kms_chamelium&#64;hdmi-crc-single - =
crash - Received signal SIGSEGV."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110730">bug 11073=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
contact&#64;emersion.fr" title=3D"emersion &lt;contact&#64;emersion.fr&gt;"=
> <span class=3D"fn">emersion</span></a>
</span></b>
        <pre>Agreed that this is an IGT bug, not a driver bug.

Just sent an IGT patch that attempts to fix the issue.

User impact: the user might experience corrupted frames via HDMI. In other
words: we don't check anymore that HDMI is properly working since this test=
 is
broken.

Other CRC/frame tests aren't run after a crash (this is the first one).</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597314940.006a1.31972--

--===============0579058581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0579058581==--
