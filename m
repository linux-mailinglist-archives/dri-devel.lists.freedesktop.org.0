Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45193E48A7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 12:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F866E96D;
	Fri, 25 Oct 2019 10:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE0426E96D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:37:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B44D0720E2; Fri, 25 Oct 2019 10:37:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112133] AMD Radeon 5700 / Navi: VAAPI encoding generates
 garbled output
Date: Fri, 25 Oct 2019 10:37:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: toscar@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112133-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0515748347=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0515748347==
Content-Type: multipart/alternative; boundary="15719998780.BB76bC.21593"
Content-Transfer-Encoding: 7bit


--15719998780.BB76bC.21593
Date: Fri, 25 Oct 2019 10:37:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112133

            Bug ID: 112133
           Summary: AMD Radeon 5700 / Navi: VAAPI encoding generates
                    garbled output
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: toscar@gmx.net

Using ffmpeg to encode video to h264/hevc with constant or variable bitrate
results in completely garbled output video on navi/radeon 5700 gpu.

ffmpeg command used:
ffmpeg -init_hw_device vaapi=3Dfoo:/dev/dri/renderD128 -hwaccel vaapi
-hwaccel_output_format vaapi -hwaccel_device foo \
-i <input file> -filter_hw_device foo -vf 'format=3Dnv12|vaapi,hwupload' -c=
:v
hevc_vaapi -b:v 5000k -maxrate 5000k -f matroska <output file>
-This issue also applies to h264 encoding (replace "hevc_vaapi" with
"h264_vaapi" above).

HW used:
AMD Radeon 5700 XT

SW used:
linux-amd-staging-drm-next-git-5.4.858569.1c2677f991d3-1-x86_64
mesa-git 1:19.3.0_devel.116641.f11ea226664
libva-utils 2.5.0
ffmpeg 1:4.2.1

This issue sounds a bit like BUG 109538, however #109538 speaks of "garbled
line at the bottom" where I get completely garbled output, not just at the
bottom.

In additon, ffmpeg stalls/crashes sometimes as described in #109538 with:
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring vcn_enc0 timeout, signaled
seq=3D150025, emitted seq=3D150027
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process ffm=
peg
pid 228611 thread ffmpeg:cs0 pid 228612

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15719998780.BB76bC.21593
Date: Fri, 25 Oct 2019 10:37:58 +0000
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
   title=3D"NEW - AMD Radeon 5700 / Navi: VAAPI encoding generates garbled =
output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112133">112133</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>AMD Radeon 5700 / Navi: VAAPI encoding generates garbled outp=
ut
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
          <td>toscar&#64;gmx.net
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Using ffmpeg to encode video to h264/hevc with constant or var=
iable bitrate
results in completely garbled output video on navi/radeon 5700 gpu.

ffmpeg command used:
ffmpeg -init_hw_device vaapi=3Dfoo:/dev/dri/renderD128 -hwaccel vaapi
-hwaccel_output_format vaapi -hwaccel_device foo \
-i &lt;input file&gt; -filter_hw_device foo -vf 'format=3Dnv12|vaapi,hwuplo=
ad' -c:v
hevc_vaapi -b:v 5000k -maxrate 5000k -f matroska &lt;output file&gt;
-This issue also applies to h264 encoding (replace &quot;hevc_vaapi&quot; w=
ith
&quot;h264_vaapi&quot; above).

HW used:
AMD Radeon 5700 XT

SW used:
linux-amd-staging-drm-next-git-5.4.858569.1c2677f991d3-1-x86_64
mesa-git 1:19.3.0_devel.116641.f11ea226664
libva-utils 2.5.0
ffmpeg 1:4.2.1

This issue sounds a bit like <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VAAPI HEVC encoding is unstable and produces garbled outp=
ut"
   href=3D"show_bug.cgi?id=3D109538">BUG 109538</a>, however #109538 speaks=
 of &quot;garbled
line at the bottom&quot; where I get completely garbled output, not just at=
 the
bottom.

In additon, ffmpeg stalls/crashes sometimes as described in #109538 with:
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring vcn_enc0 timeout, signaled
seq=3D150025, emitted seq=3D150027
[drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information: process ffm=
peg
pid 228611 thread ffmpeg:cs0 pid 228612</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15719998780.BB76bC.21593--

--===============0515748347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0515748347==--
