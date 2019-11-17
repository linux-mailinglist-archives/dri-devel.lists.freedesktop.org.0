Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 372BCFF783
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 05:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1756A6E16B;
	Sun, 17 Nov 2019 04:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5AB086E16B
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 04:07:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4E989720E2; Sun, 17 Nov 2019 04:07:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112304] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout Causes System Freeze
Date: Sun, 17 Nov 2019 04:07:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: saadnaji89@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-112304-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1014166410=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1014166410==
Content-Type: multipart/alternative; boundary="15739636260.8Ba0cA5D.11762"
Content-Transfer-Encoding: 7bit


--15739636260.8Ba0cA5D.11762
Date: Sun, 17 Nov 2019 04:07:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112304

            Bug ID: 112304
           Summary: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
                    timeout Causes System Freeze
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: saadnaji89@gmail.com

Created attachment 145975
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145975&action=3Dedit
Xorg.log

Description:

System go to freeze completely whenever during game play e.g Counter Strike
global offensive ( Max setting). The hardware power reset is required. usua=
lly
the system will freeze after 15~20 minutes of play.

I noticed the frequency of my system freezing when playing games increases
after my laptop goes to suspend mode and play after waking up. Also I notic=
ed
that the  fan will keep spinning even after hardware power off cycling unti=
l I
have unplug the  laptop and remove the battery.

Here my laptop configuration when running games:

1. DRI_PRIME =3D1 is set to all steam games
2. echo high >  /sys/class/drm/card1/device/power_dpm_force_performance_lev=
el
3. echo performance > /sys/class/drm/card1/device/power_dpm_state
4. Performance governor is set=20










Steps to reproduce

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15739636260.8Ba0cA5D.11762
Date: Sun, 17 Nov 2019 04:07:06 +0000
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
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeo=
ut Causes System Freeze"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112304">112304</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout C=
auses System Freeze
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
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
          <td>major
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
          <td>saadnaji89&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145975=
" name=3D"attach_145975" title=3D"Xorg.log">attachment 145975</a> <a href=
=3D"attachment.cgi?id=3D145975&amp;action=3Dedit" title=3D"Xorg.log">[detai=
ls]</a></span>
Xorg.log

Description:

System go to freeze completely whenever during game play e.g Counter Strike
global offensive ( Max setting). The hardware power reset is required. usua=
lly
the system will freeze after 15~20 minutes of play.

I noticed the frequency of my system freezing when playing games increases
after my laptop goes to suspend mode and play after waking up. Also I notic=
ed
that the  fan will keep spinning even after hardware power off cycling unti=
l I
have unplug the  laptop and remove the battery.

Here my laptop configuration when running games:

1. DRI_PRIME =3D1 is set to all steam games
2. echo high &gt;  /sys/class/drm/card1/device/power_dpm_force_performance_=
level
3. echo performance &gt; /sys/class/drm/card1/device/power_dpm_state
4. Performance governor is set=20










Steps to reproduce</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15739636260.8Ba0cA5D.11762--

--===============1014166410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1014166410==--
