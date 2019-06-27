Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D1A5797F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 04:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8F36E589;
	Thu, 27 Jun 2019 02:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 77C8E6E583
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 02:32:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4ABFC72167; Thu, 27 Jun 2019 02:32:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111010] Cemu Shader Cache Corruption Displaying Solid Color
 After commit 11e16ca7ce0
Date: Thu, 27 Jun 2019 02:32:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: felix.adrianto@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 qa_contact attachments.created
Message-ID: <bug-111010-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1729596522=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1729596522==
Content-Type: multipart/alternative; boundary="15616027430.4ee1Ed6E.18397"
Content-Transfer-Encoding: 7bit


--15616027430.4ee1Ed6E.18397
Date: Thu, 27 Jun 2019 02:32:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111010

            Bug ID: 111010
           Summary: Cemu Shader Cache Corruption Displaying Solid Color
                    After commit 11e16ca7ce0
           Product: Mesa
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/Gallium/radeonsi
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: felix.adrianto@gmail.com
        QA Contact: dri-devel@lists.freedesktop.org

Created attachment 144651
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144651&action=3Dedit
shader cache corruption

Background:
Using Cemu emulator with shader cache functionality breaks after commit
11e16ca7ce0. Screen display only solid colors with very low fps.

System:
AMD Ryzen 2600
RX580
Linux 5.0.9, amdgpu, mesa master

How to reproduce the issue:
1. Run Cemu, enable shader cache functionality
2. Play a game then let shader cahce be generated. Game can be played norma=
lly
and shader can be built normally. No graphical issue is found at this stage.
3. Quit Cemu
4. Play the same game again utilizing the generated shader cache
5. Game display shows flickering solid colors as shown in this ticket
attachment.=20

Expected result:
Playing the same game with previously generated shader cache should display=
 the
correct graphic instead of flickering solid colors.

Can you address this issue?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15616027430.4ee1Ed6E.18397
Date: Thu, 27 Jun 2019 02:32:23 +0000
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
   title=3D"NEW - Cemu Shader Cache Corruption Displaying Solid Color After=
 commit 11e16ca7ce0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111010">111010</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Cemu Shader Cache Corruption Displaying Solid Color After com=
mit 11e16ca7ce0
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>Drivers/Gallium/radeonsi
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>felix.adrianto&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144651=
" name=3D"attach_144651" title=3D"shader cache corruption">attachment 14465=
1</a> <a href=3D"attachment.cgi?id=3D144651&amp;action=3Dedit" title=3D"sha=
der cache corruption">[details]</a></span>
shader cache corruption

Background:
Using Cemu emulator with shader cache functionality breaks after commit
11e16ca7ce0. Screen display only solid colors with very low fps.

System:
AMD Ryzen 2600
RX580
Linux 5.0.9, amdgpu, mesa master

How to reproduce the issue:
1. Run Cemu, enable shader cache functionality
2. Play a game then let shader cahce be generated. Game can be played norma=
lly
and shader can be built normally. No graphical issue is found at this stage.
3. Quit Cemu
4. Play the same game again utilizing the generated shader cache
5. Game display shows flickering solid colors as shown in this ticket
attachment.=20

Expected result:
Playing the same game with previously generated shader cache should display=
 the
correct graphic instead of flickering solid colors.

Can you address this issue?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15616027430.4ee1Ed6E.18397--

--===============1729596522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1729596522==--
