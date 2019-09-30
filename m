Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 962A9C1BFF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 09:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE946E388;
	Mon, 30 Sep 2019 07:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 11B9E6E388
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 07:21:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 45302729C8; Mon, 30 Sep 2019 01:55:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111858] [ICL] IGT tests kms_ccs and kms_frontbuffer_tracking
 fail on latest drm-tip kernel
Date: Mon, 30 Sep 2019 01:55:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: yue.he@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111858-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1996321427=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1996321427==
Content-Type: multipart/alternative; boundary="15698085551.7fE819d7.3139"
Content-Transfer-Encoding: 7bit


--15698085551.7fE819d7.3139
Date: Mon, 30 Sep 2019 01:55:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111858

            Bug ID: 111858
           Summary: [ICL] IGT tests kms_ccs and kms_frontbuffer_tracking
                    fail on latest drm-tip kernel
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: IGT
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: yue.he@intel.com

Created attachment 145585
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145585&action=3Dedit
kms_frontbuffer_tracking

On Ubuntu 16.04 on ICL-U D0 board, replace kernel to 5.3.0-rc8: git clone
https://github.com/freedesktop/drm-tip
Then
git clone https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
Build igt test tool.
Then run the igt test on console terminal as root
./kms_ccs
IGT-Version: 1.24-g924e5c5 (x86_64) (Linux: 5.3.0-rc8 x86_64)
Subtest pipe-A-crc-primary-basic: CRASH (0.004s)
Starting subtest: pipe-A-crc-primary-rotation-180
Subtest pipe-A-crc-primary-rotation-180: CRASH (0.004s)
Starting subtest: pipe-A-crc-sprite-planes-basic
Starting subtest: pipe-B-crc-primary-basic
Subtest pipe-B-crc-primary-basic: CRASH (0.001s)
Starting subtest: pipe-B-crc-primary-rotation-180
Subtest pipe-B-crc-primary-rotation-180: CRASH (0.001s)
The 4 tests are crash.

Run the gem_basic, the subtests of gem_basic are all pass.

Run the ./ kms_frontbuffer_tracking, there are error:
Stack trace:
  #0 /home/hdr/igt-gpu-tools/lib/igt_core.c:1696 __igt_fail_assert()
  #1 /home/hdr/igt-gpu-tools/tests/kms_frontbuffer_tracking.c:1274
__real_main3273()
  #2 /home/hdr/igt-gpu-tools/tests/kms_frontbuffer_tracking.c:3273 main()
  #3 ../csu/libc-start.c:325 __libc_start_main()
  #4 [_start+0x29]
  #5 [<unknown>+0x0]
And all subtest fail.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15698085551.7fE819d7.3139
Date: Mon, 30 Sep 2019 01:55:55 +0000
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
   title=3D"NEW - [ICL] IGT tests kms_ccs and kms_frontbuffer_tracking fail=
 on latest drm-tip kernel"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111858">111858</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[ICL] IGT tests kms_ccs and kms_frontbuffer_tracking fail on =
latest drm-tip kernel
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
          <td>IGT
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>yue.he&#64;intel.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145585=
" name=3D"attach_145585" title=3D"kms_frontbuffer_tracking">attachment 1455=
85</a> <a href=3D"attachment.cgi?id=3D145585&amp;action=3Dedit" title=3D"km=
s_frontbuffer_tracking">[details]</a></span>
kms_frontbuffer_tracking

On Ubuntu 16.04 on ICL-U D0 board, replace kernel to 5.3.0-rc8: git clone
<a href=3D"https://github.com/freedesktop/drm-tip">https://github.com/freed=
esktop/drm-tip</a>
Then
git clone <a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">=
https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a>
Build igt test tool.
Then run the igt test on console terminal as root
./kms_ccs
IGT-Version: 1.24-g924e5c5 (x86_64) (Linux: 5.3.0-rc8 x86_64)
Subtest pipe-A-crc-primary-basic: CRASH (0.004s)
Starting subtest: pipe-A-crc-primary-rotation-180
Subtest pipe-A-crc-primary-rotation-180: CRASH (0.004s)
Starting subtest: pipe-A-crc-sprite-planes-basic
Starting subtest: pipe-B-crc-primary-basic
Subtest pipe-B-crc-primary-basic: CRASH (0.001s)
Starting subtest: pipe-B-crc-primary-rotation-180
Subtest pipe-B-crc-primary-rotation-180: CRASH (0.001s)
The 4 tests are crash.

Run the gem_basic, the subtests of gem_basic are all pass.

Run the ./ kms_frontbuffer_tracking, there are error:
Stack trace:
  #0 /home/hdr/igt-gpu-tools/lib/igt_core.c:1696 __igt_fail_assert()
  #1 /home/hdr/igt-gpu-tools/tests/kms_frontbuffer_tracking.c:1274
__real_main3273()
  #2 /home/hdr/igt-gpu-tools/tests/kms_frontbuffer_tracking.c:3273 main()
  #3 ../csu/libc-start.c:325 __libc_start_main()
  #4 [_start+0x29]
  #5 [&lt;unknown&gt;+0x0]
And all subtest fail.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15698085551.7fE819d7.3139--

--===============1996321427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1996321427==--
