Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947FF8CFAE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 11:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF746E486;
	Wed, 14 Aug 2019 09:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 74A6F6E486
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 09:33:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6E7957215A; Wed, 14 Aug 2019 09:33:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111399] Freeze after suspend/resume with kernel 5.0
Date: Wed, 14 Aug 2019 09:33:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vl4d1m1r37@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111399-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0306748015=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0306748015==
Content-Type: multipart/alternative; boundary="15657751831.CEeE06CBC.30513"
Content-Transfer-Encoding: 7bit


--15657751831.CEeE06CBC.30513
Date: Wed, 14 Aug 2019 09:33:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111399

            Bug ID: 111399
           Summary: Freeze after suspend/resume with kernel 5.0
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: vl4d1m1r37@gmail.com

Created attachment 145058
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145058&action=3Dedit
blackscreen bug log

System: HP 15-bw660ur
GPU: Radeon 520 (Sun XT)

Screen freezes after resuming from suspend. Here is discussion of this bug -
https://bugs.archlinux.org/task/61950.

I made a bisection in branch linux-5.0.y between the tags v5.0-rc1 and 4.20=
. I
found that there are two bugs with the screen after resuming from suspend. =
The
first bug is the one that is present in the kernel v.5 now and earlier to
version 5.0-rc1. There is a bug with amdgpu_job_timedout in the log. The se=
cond
is the black screen after resuming from suspend and the absence of the
amdgpu_job_timedout error in the log.
The second bug first appears in commit
[262485a50fd4532a8d71165190adc7a0a19bcc9e] drm/amd/display: Expand dc to use
16.16 bit backlight.
The first bug with amdgpu_job_timedout first appears in the commit
[106c7d6148e5aadd394e6701f7e498df49b869d1] drm/amdgpu: abstract the functio=
n of
enter/exit safe mode for RLC.
During the bisect searching for the first error, I went through the followi=
ng
stages sequentially: good (resuming from suspend was successful), error 2,
good, error 2, error 1.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15657751831.CEeE06CBC.30513
Date: Wed, 14 Aug 2019 09:33:03 +0000
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
   title=3D"NEW - Freeze after suspend/resume with kernel 5.0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111399">111399</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Freeze after suspend/resume with kernel 5.0
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>vl4d1m1r37&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145058=
" name=3D"attach_145058" title=3D"blackscreen bug log">attachment 145058</a=
> <a href=3D"attachment.cgi?id=3D145058&amp;action=3Dedit" title=3D"blacksc=
reen bug log">[details]</a></span>
blackscreen bug log

System: HP 15-bw660ur
GPU: Radeon 520 (Sun XT)

Screen freezes after resuming from suspend. Here is discussion of this bug -
<a href=3D"https://bugs.archlinux.org/task/61950">https://bugs.archlinux.or=
g/task/61950</a>.

I made a bisection in branch linux-5.0.y between the tags v5.0-rc1 and 4.20=
. I
found that there are two bugs with the screen after resuming from suspend. =
The
first bug is the one that is present in the kernel v.5 now and earlier to
version 5.0-rc1. There is a bug with amdgpu_job_timedout in the log. The se=
cond
is the black screen after resuming from suspend and the absence of the
amdgpu_job_timedout error in the log.
The second bug first appears in commit
[262485a50fd4532a8d71165190adc7a0a19bcc9e] drm/amd/display: Expand dc to use
16.16 bit backlight.
The first bug with amdgpu_job_timedout first appears in the commit
[106c7d6148e5aadd394e6701f7e498df49b869d1] drm/amdgpu: abstract the functio=
n of
enter/exit safe mode for RLC.
During the bisect searching for the first error, I went through the followi=
ng
stages sequentially: good (resuming from suspend was successful), error 2,
good, error 2, error 1.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15657751831.CEeE06CBC.30513--

--===============0306748015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0306748015==--
