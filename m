Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1B3A49BA
	for <lists+dri-devel@lfdr.de>; Sun,  1 Sep 2019 16:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231C589C7F;
	Sun,  1 Sep 2019 14:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88A4389DA9
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Sep 2019 14:06:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 856FF72161; Sun,  1 Sep 2019 14:06:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111240] RX 560x is very slow
Date: Sun, 01 Sep 2019 14:06:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: cmdrrdo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111240-502-orIFMwqEUk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111240-502@http.bugs.freedesktop.org/>
References: <bug-111240-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0793693170=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0793693170==
Content-Type: multipart/alternative; boundary="15673467814.5F9B2E.6501"
Content-Transfer-Encoding: 7bit


--15673467814.5F9B2E.6501
Date: Sun, 1 Sep 2019 14:06:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111240

--- Comment #4 from cmdrrdo@gmail.com ---
The performance drop may be related to an incorrect boost frequency (400MHz=
),
compare here: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1830522

Workaround is to set
echo 0 > /sys/devices/system/cpu/cpufreq/boost

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15673467814.5F9B2E.6501
Date: Sun, 1 Sep 2019 14:06:21 +0000
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
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - RX 560x is very slow"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111240">bug 11124=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cmdrrdo&#64;gmail.com" title=3D"cmdrrdo&#64;gmail.com">cmdrrdo&#64;gmail.co=
m</a>
</span></b>
        <pre>The performance drop may be related to an incorrect boost freq=
uency (400MHz),
compare here: <a href=3D"https://bugs.launchpad.net/ubuntu/+source/linux/+b=
ug/1830522">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1830522</a>

Workaround is to set
echo 0 &gt; /sys/devices/system/cpu/cpufreq/boost</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15673467814.5F9B2E.6501--

--===============0793693170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0793693170==--
