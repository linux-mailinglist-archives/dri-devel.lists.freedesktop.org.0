Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ED2FF769
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 04:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552746E0D2;
	Sun, 17 Nov 2019 03:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E75476E0D2
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 03:21:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DDC78720E2; Sun, 17 Nov 2019 03:21:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112303] [LENOVO E595] Black screen on resume!
Date: Sun, 17 Nov 2019 03:21:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dracaphallus@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112303-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1553948887=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1553948887==
Content-Type: multipart/alternative; boundary="15739608620.8CF62.4694"
Content-Transfer-Encoding: 7bit


--15739608620.8CF62.4694
Date: Sun, 17 Nov 2019 03:21:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112303

            Bug ID: 112303
           Summary: [LENOVO E595] Black screen on resume!
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: dracaphallus@gmail.com

Suspending the laptop is not the issue I am experiencing but waking the lap=
top
after suspension is what breaks. The laptop wakes up to a black screen with=
out
a functioning system, not even CTRL+ALT+BACKSPACE works. The issue is simil=
ar
to https://bbs.archlinux.org/viewtopic.php?id=3D249510 and therefore I have=
 tried
all the solutions mentioned in that thread (before knowing of its existence=
). I
also tried the Early KMS solution suggested by the owner of that thread, wh=
ich
I did not think of and the result remained the same. Solutions mentioned in
https://wiki.archlinux.org/index.php/Laptop/Lenovo#E_series has also been t=
ried
but the problem remains unsolved.

Something worth mentioning is that the laptop has to go through suspension =
and
waking up twice for the system to return to normal, but this solution works=
 20%
of the times and has unfortunately caused me loss of important data.

Logs:
1. https://git.io/Jer5J (lshw -short)
2. https://git.io/Jer7H (Journalctl --since=3D"1 hour ago", note that this
journalctl includes several boots because I was trying to include the
functional two suspends for the system to work again)
3. https://git.io/Jer7S (dmesg)
4. https://git.io/Jer79 (Xorg.0.log)

From the above log files, V1del
(https://bbs.archlinux.org/viewtopic.php?pid=3D1873276#p1873276), was able =
to
identify crashes in my AMDGPU driver thus leading me to create this bug hop=
ing
for a fix!

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739608620.8CF62.4694
Date: Sun, 17 Nov 2019 03:21:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [LENOVO E595] Black screen on resume!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112303">112303</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[LENOVO E595] Black screen on resume!
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>dracaphallus&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Suspending the laptop is not the issue I am experiencing but w=
aking the laptop
after suspension is what breaks. The laptop wakes up to a black screen with=
out
a functioning system, not even CTRL+ALT+BACKSPACE works. The issue is simil=
ar
to <a href=3D"https://bbs.archlinux.org/viewtopic.php?id=3D249510">https://=
bbs.archlinux.org/viewtopic.php?id=3D249510</a> and therefore I have tried
all the solutions mentioned in that thread (before knowing of its existence=
). I
also tried the Early KMS solution suggested by the owner of that thread, wh=
ich
I did not think of and the result remained the same. Solutions mentioned in
<a href=3D"https://wiki.archlinux.org/index.php/Laptop/Lenovo#E_series">htt=
ps://wiki.archlinux.org/index.php/Laptop/Lenovo#E_series</a> has also been =
tried
but the problem remains unsolved.

Something worth mentioning is that the laptop has to go through suspension =
and
waking up twice for the system to return to normal, but this solution works=
 20%
of the times and has unfortunately caused me loss of important data.

Logs:
1. <a href=3D"https://git.io/Jer5J">https://git.io/Jer5J</a> (lshw -short)
2. <a href=3D"https://git.io/Jer7H">https://git.io/Jer7H</a> (Journalctl --=
since=3D&quot;1 hour ago&quot;, note that this
journalctl includes several boots because I was trying to include the
functional two suspends for the system to work again)
3. <a href=3D"https://git.io/Jer7S">https://git.io/Jer7S</a> (dmesg)
4. <a href=3D"https://git.io/Jer79">https://git.io/Jer79</a> (Xorg.0.log)

From the above log files, V1del
(<a href=3D"https://bbs.archlinux.org/viewtopic.php?pid=3D1873276#p1873276"=
>https://bbs.archlinux.org/viewtopic.php?pid=3D1873276#p1873276</a>), was a=
ble to
identify crashes in my AMDGPU driver thus leading me to create this bug hop=
ing
for a fix!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739608620.8CF62.4694--

--===============1553948887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1553948887==--
