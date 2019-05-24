Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F085628EBD
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 03:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49246E02C;
	Fri, 24 May 2019 01:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 93A506E02C
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:20:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 907A872167; Fri, 24 May 2019 01:20:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110749] [Vega 11] [amdgpu retry page fault
 VM_L2_PROTECTION_FAULT_STATUS] System lock up during playing Steam version of
 Saints Row 3
Date: Fri, 24 May 2019 01:20:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: evvke@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110749-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0195683898=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0195683898==
Content-Type: multipart/alternative; boundary="15586608091.bAc3.31721"
Content-Transfer-Encoding: 7bit


--15586608091.bAc3.31721
Date: Fri, 24 May 2019 01:20:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110749

            Bug ID: 110749
           Summary: [Vega 11] [amdgpu retry page fault
                    VM_L2_PROTECTION_FAULT_STATUS] System lock up during
                    playing Steam version of Saints Row 3
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: evvke@hotmail.com

Created attachment 144337
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144337&action=3Dedit
contains files generated from output of dmesg, umr and "cat
/sys/kernel/debug/tracing/trace"

System hangs shortly (approximately few minutes) after starting playing Sai=
nts
Row 3. Sound keeps playing but mouse et al doesn't work. Monitor turns itse=
lf
off after few seconds.

Logging in the system via SSH fails. Only magickal SysRq + REISUB command
helps.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586608091.bAc3.31721
Date: Fri, 24 May 2019 01:20:09 +0000
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
   title=3D"NEW - [Vega 11] [amdgpu retry page fault VM_L2_PROTECTION_FAULT=
_STATUS] System lock up during playing Steam version of Saints Row 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110749">110749</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[Vega 11] [amdgpu retry page fault VM_L2_PROTECTION_FAULT_STA=
TUS] System lock up during playing Steam version of Saints Row 3
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
          <td>blocker
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
          <td>evvke&#64;hotmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144337=
" name=3D"attach_144337" title=3D"contains files generated from output of d=
mesg, umr and &quot;cat /sys/kernel/debug/tracing/trace&quot;">attachment 1=
44337</a> <a href=3D"attachment.cgi?id=3D144337&amp;action=3Dedit" title=3D=
"contains files generated from output of dmesg, umr and &quot;cat /sys/kern=
el/debug/tracing/trace&quot;">[details]</a></span>
contains files generated from output of dmesg, umr and &quot;cat
/sys/kernel/debug/tracing/trace&quot;

System hangs shortly (approximately few minutes) after starting playing Sai=
nts
Row 3. Sound keeps playing but mouse et al doesn't work. Monitor turns itse=
lf
off after few seconds.

Logging in the system via SSH fails. Only magickal SysRq + REISUB command
helps.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586608091.bAc3.31721--

--===============0195683898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0195683898==--
