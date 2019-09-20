Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73FB9589
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 18:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8B06FD5A;
	Fri, 20 Sep 2019 16:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2DE06FD5A
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 16:24:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B9FB172167; Fri, 20 Sep 2019 16:24:06 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111759] [navi10] computer hang ring sdma1 timeout
Date: Fri, 20 Sep 2019 16:24:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kingoipo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111759-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0235489973=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0235489973==
Content-Type: multipart/alternative; boundary="15689966460.1eA23f.19471"
Content-Transfer-Encoding: 7bit


--15689966460.1eA23f.19471
Date: Fri, 20 Sep 2019 16:24:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111759

            Bug ID: 111759
           Summary: [navi10] computer hang ring sdma1 timeout
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: kingoipo@gmail.com

Using the soon-to-be linux 5.4.0-rc1 (574cc4539762561d96b456dbc0544d8898bd4=
c6e)
with oibaf's ppa for DRI, I get the following messages in my kernel.log:

Sep 20 18:12:19 oipo-X570-AORUS-ELITE kernel: [23162.876229]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeout, signaled
seq=3D140067, emitted seq=3D140070
Sep 20 18:12:19 oipo-X570-AORUS-ELITE kernel: [23162.876310]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process GPU
Process pid 16418 thread firefox:cs0 pid 16498
Sep 20 18:12:19 oipo-X570-AORUS-ELITE kernel: [23162.876312] [drm] GPU reco=
very
disabled.


Music stops playing, desktop becomes completely unresponsive except for mou=
se.
Mouse can be moved normally.

Hardware: Radeon RX 5700

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689966460.1eA23f.19471
Date: Fri, 20 Sep 2019 16:24:06 +0000
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
   title=3D"NEW - [navi10] computer hang ring sdma1 timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111759">111759</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[navi10] computer hang ring sdma1 timeout
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
          <td>kingoipo&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Using the soon-to-be linux 5.4.0-rc1 (574cc4539762561d96b456db=
c0544d8898bd4c6e)
with oibaf's ppa for DRI, I get the following messages in my kernel.log:

Sep 20 18:12:19 oipo-X570-AORUS-ELITE kernel: [23162.876229]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 timeout, signaled
seq=3D140067, emitted seq=3D140070
Sep 20 18:12:19 oipo-X570-AORUS-ELITE kernel: [23162.876310]
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process GPU
Process pid 16418 thread firefox:cs0 pid 16498
Sep 20 18:12:19 oipo-X570-AORUS-ELITE kernel: [23162.876312] [drm] GPU reco=
very
disabled.


Music stops playing, desktop becomes completely unresponsive except for mou=
se.
Mouse can be moved normally.

Hardware: Radeon RX 5700</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689966460.1eA23f.19471--

--===============0235489973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0235489973==--
