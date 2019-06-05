Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A7535A70
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 12:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085218980C;
	Wed,  5 Jun 2019 10:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C86189819
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 10:29:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 5961872167; Wed,  5 Jun 2019 10:29:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110730] [CI][RESUME] igt@kms_chamelium@hdmi-crc-single - crash
 - Received signal SIGSEGV.
Date: Wed, 05 Jun 2019 10:29:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugs@mblankhorst.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110730-502-0maMMPdTG1@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0413430155=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0413430155==
Content-Type: multipart/alternative; boundary="15597305963.E8bEfDe77.28804"
Content-Transfer-Encoding: 7bit


--15597305963.E8bEfDe77.28804
Date: Wed, 5 Jun 2019 10:29:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110730

--- Comment #5 from Maarten Lankhorst <bugs@mblankhorst.nl> ---
Hmm seems like an error in the chamelium wrappers. Specifically the call to
pthread_cancel seems to be crashing. Need to figure out why, but shouldn't
affect real users as this happens in the chamelium code.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597305963.E8bEfDe77.28804
Date: Wed, 5 Jun 2019 10:29:56 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110730#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME] igt&#64;kms_chamelium&#64;hdmi-crc-single - =
crash - Received signal SIGSEGV."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110730">bug 11073=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bugs&#64;mblankhorst.nl" title=3D"Maarten Lankhorst &lt;bugs&#64;mblankhors=
t.nl&gt;"> <span class=3D"fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>Hmm seems like an error in the chamelium wrappers. Specificall=
y the call to
pthread_cancel seems to be crashing. Need to figure out why, but shouldn't
affect real users as this happens in the chamelium code.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597305963.E8bEfDe77.28804--

--===============0413430155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0413430155==--
