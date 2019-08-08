Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5250865B7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4D16E872;
	Thu,  8 Aug 2019 15:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A97066E86D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:27:48 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A5F3472167; Thu,  8 Aug 2019 15:27:48 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111332] Long running application causes assert in amdgpu_bo.c 
 'bo->cpu_map_count > 0' failed
Date: Thu, 08 Aug 2019 15:27:48 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: freedesktop@harrisonconsoles.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111332-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0280998743=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0280998743==
Content-Type: multipart/alternative; boundary="15652780681.c8E3DE5e.26165"
Content-Transfer-Encoding: 7bit


--15652780681.c8E3DE5e.26165
Date: Thu, 8 Aug 2019 15:27:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111332

            Bug ID: 111332
           Summary: Long running application causes assert in amdgpu_bo.c
                    'bo->cpu_map_count > 0' failed
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: freedesktop@harrisonconsoles.com

We have an OpenGL application that runs 24/7. After 4-5 days the application
quits with this error in the syslog.

../amdgpu/amdgpu_bo.c:443: amdgpu_bo_cpu_map: Assertion `bo->cpu_map_count =
> 0'
failed.

The system is running
Debian 10 buster (kernel 4.19.0)
libdrm 2.4.99 built from source (gitlab.freedesktop.org)

There seems to be a patch to fix this problem here
https://patchwork.freedesktop.org/patch/258005/

But there has been no activity on this patch in a while and it has not been
merged.

I will start a test of this patch and will verify if it works for me, but it
will take 5 days to confirm.

Any chance of getting this patch merged?

Thanks,
Todd

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15652780681.c8E3DE5e.26165
Date: Thu, 8 Aug 2019 15:27:48 +0000
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
   title=3D"NEW - Long running application causes assert in amdgpu_bo.c 'bo=
-&gt;cpu_map_count &gt; 0' failed"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111332">111332</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Long running application causes assert in amdgpu_bo.c  'bo-&g=
t;cpu_map_count &gt; 0' failed
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
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
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
          <td>freedesktop&#64;harrisonconsoles.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>We have an OpenGL application that runs 24/7. After 4-5 days t=
he application
quits with this error in the syslog.

../amdgpu/amdgpu_bo.c:443: amdgpu_bo_cpu_map: Assertion `bo-&gt;cpu_map_cou=
nt &gt; 0'
failed.

The system is running
Debian 10 buster (kernel 4.19.0)
libdrm 2.4.99 built from source (gitlab.freedesktop.org)

There seems to be a patch to fix this problem here
<a href=3D"https://patchwork.freedesktop.org/patch/258005/">https://patchwo=
rk.freedesktop.org/patch/258005/</a>

But there has been no activity on this patch in a while and it has not been
merged.

I will start a test of this patch and will verify if it works for me, but it
will take 5 days to confirm.

Any chance of getting this patch merged?

Thanks,
Todd</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15652780681.c8E3DE5e.26165--

--===============0280998743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0280998743==--
