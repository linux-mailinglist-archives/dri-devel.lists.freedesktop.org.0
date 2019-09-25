Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF3EBD66F
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 04:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFDB6EB18;
	Wed, 25 Sep 2019 02:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90A8D6EB18
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 02:38:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 85D4C72162; Wed, 25 Sep 2019 02:38:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111807] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
 timeout  cause process into Disk sleep state
Date: Wed, 25 Sep 2019 02:38:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: liansz@fzcyjh.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111807-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1814224872=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1814224872==
Content-Type: multipart/alternative; boundary="15693791390.F5EEFd4e.22011"
Content-Transfer-Encoding: 7bit


--15693791390.F5EEFd4e.22011
Date: Wed, 25 Sep 2019 02:38:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111807

            Bug ID: 111807
           Summary: [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx
                    timeout  cause process into Disk sleep state
           Product: DRI
           Version: DRI git
          Hardware: ARM
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: liansz@fzcyjh.com

Created attachment 145506
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145506&action=3Dedit
timeoutlog

We ran into some gfx timeout problems.
Currently, we use the kernel of 4.19.36. We merged some patches regarding G=
PU
from the community. There are multiple GPUs on each server, and each GPU is
running some rendering programs. Now, there are 2 different cases of failur=
es.
The first one is that one graphics card of a server fails, rendering program
does not have a D state, and it shows error code 110 tested by
/sys/kernel/debug/dri/1/amdgpu_test_ib, then shows pass after a second test.
See tmp-618-2.zip for details.
The second one is that one graphics card of a server fails, the whole rende=
ring
program running on the server fails and has D state. It fails at drm_releas=
e.
See tmp-619.zip for details.
Could you please help us out?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15693791390.F5EEFd4e.22011
Date: Wed, 25 Sep 2019 02:38:59 +0000
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
ut cause process into Disk sleep state"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111807">111807</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring gfx timeout  =
cause process into Disk sleep state
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
          <td>ARM
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
          <td>liansz&#64;fzcyjh.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145506=
" name=3D"attach_145506" title=3D"timeoutlog">attachment 145506</a> <a href=
=3D"attachment.cgi?id=3D145506&amp;action=3Dedit" title=3D"timeoutlog">[det=
ails]</a></span>
timeoutlog

We ran into some gfx timeout problems.
Currently, we use the kernel of 4.19.36. We merged some patches regarding G=
PU
from the community. There are multiple GPUs on each server, and each GPU is
running some rendering programs. Now, there are 2 different cases of failur=
es.
The first one is that one graphics card of a server fails, rendering program
does not have a D state, and it shows error code 110 tested by
/sys/kernel/debug/dri/1/amdgpu_test_ib, then shows pass after a second test.
See tmp-618-2.zip for details.
The second one is that one graphics card of a server fails, the whole rende=
ring
program running on the server fails and has D state. It fails at drm_releas=
e.
See tmp-619.zip for details.
Could you please help us out?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15693791390.F5EEFd4e.22011--

--===============1814224872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1814224872==--
