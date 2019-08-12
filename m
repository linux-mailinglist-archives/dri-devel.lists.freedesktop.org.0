Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B19178A1AF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 16:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9909A89E8C;
	Mon, 12 Aug 2019 14:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2A53189E8C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2019 14:54:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 26E3572167; Mon, 12 Aug 2019 14:54:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111386] Mesa 19.1.1 introduced Tearing
Date: Mon, 12 Aug 2019 14:54:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/i915
X-Bugzilla-Version: 19.1
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dave.diamond00@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact
Message-ID: <bug-111386-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2093287286=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2093287286==
Content-Type: multipart/alternative; boundary="15656216761.ffF7226e4.5933"
Content-Transfer-Encoding: 7bit


--15656216761.ffF7226e4.5933
Date: Mon, 12 Aug 2019 14:54:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111386

            Bug ID: 111386
           Summary: Mesa 19.1.1 introduced Tearing
           Product: Mesa
           Version: 19.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/i915
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: dave.diamond00@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Hi, I landed here by suggestion of another user of the OS which I'm using:=
=20
Manjaro Linux [1]

Let's start with my system specs:
https://pastebin.com/5MuBGinn

Since the upgrade of Mesa package to 19.1.1, my graphics (Intel i915) begun=
 to
suffer of video tearing: before of such update I never experienced video
Tearing, thanks to the compositor (the one shipped by default on XFCE and a=
lso
if using Compton instead).
To get rid of video tearing I had to enable the <Option "TearFree" "true"> =
in
the /etc/X11/xorg.conf.d/20-intel.conf file.
Furthermore seems that another user of Manjaro, encountered the same issue =
of
Mesa:
https://forum.manjaro.org/t/stable-update-2019-07-03-kernels-systemd-pamac-=
8-0-kde-xfce-browser-qt/93362/143


[1] https://forum.manjaro.org/t/i915-graphics-and-tearing/98500

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15656216761.ffF7226e4.5933
Date: Mon, 12 Aug 2019 14:54:36 +0000
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
   title=3D"NEW - Mesa 19.1.1 introduced Tearing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111386">111386</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Mesa 19.1.1 introduced Tearing
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>19.1
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
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/i915
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>dave.diamond00&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hi, I landed here by suggestion of another user of the OS whic=
h I'm using:=20
Manjaro Linux [1]

Let's start with my system specs:
<a href=3D"https://pastebin.com/5MuBGinn">https://pastebin.com/5MuBGinn</a>

Since the upgrade of Mesa package to 19.1.1, my graphics (Intel i915) begun=
 to
suffer of video tearing: before of such update I never experienced video
Tearing, thanks to the compositor (the one shipped by default on XFCE and a=
lso
if using Compton instead).
To get rid of video tearing I had to enable the &lt;Option &quot;TearFree&q=
uot; &quot;true&quot;&gt; in
the /etc/X11/xorg.conf.d/20-intel.conf file.
Furthermore seems that another user of Manjaro, encountered the same issue =
of
Mesa:
<a href=3D"https://forum.manjaro.org/t/stable-update-2019-07-03-kernels-sys=
temd-pamac-8-0-kde-xfce-browser-qt/93362/143">https://forum.manjaro.org/t/s=
table-update-2019-07-03-kernels-systemd-pamac-8-0-kde-xfce-browser-qt/93362=
/143</a>


[1] <a href=3D"https://forum.manjaro.org/t/i915-graphics-and-tearing/98500"=
>https://forum.manjaro.org/t/i915-graphics-and-tearing/98500</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15656216761.ffF7226e4.5933--

--===============2093287286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2093287286==--
