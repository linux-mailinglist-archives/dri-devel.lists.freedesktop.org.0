Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1915105EC
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 09:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFAD892A7;
	Wed,  1 May 2019 07:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4A08D892A7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 07:45:44 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 46F5E7215A; Wed,  1 May 2019 07:45:44 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110571] GPU Passthrough of Vega 56 GPU hangs on KVM start.
Date: Wed, 01 May 2019 07:45:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110571-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0643993332=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0643993332==
Content-Type: multipart/alternative; boundary="15566967441.b8edFA.3200"
Content-Transfer-Encoding: 7bit


--15566967441.b8edFA.3200
Date: Wed, 1 May 2019 07:45:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110571

            Bug ID: 110571
           Summary: GPU Passthrough of Vega 56 GPU hangs on KVM start.
           Product: DRI
           Version: DRI git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: James.Dutton@gmail.com

When trying to use IOMMU and passthrough a Vega GPU to the guest VM.  KVM f=
ails
to start, and SERR errors are shown with lspci on the GPU device.

Hardware is a Threadripper 1950X, Gigabyte X399 Pro motherboard.
Vega 56.

The same problem also happens with an old Radeon CAICOS GPU.

So, my theory is that this is a AMD Threadripper and X399 motherboard probl=
em.
Maybe related to the IOMMU programming on the X399 chipset not happening
correctly.

Can anyone help give me some pointers as to where to look to help diagnose =
the
problem.
For example, how do I view iommu settings/mappings?
How do I find out what all the config params for the X399 Bridge GPP do?
What does GPP mean?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15566967441.b8edFA.3200
Date: Wed, 1 May 2019 07:45:44 +0000
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
   title=3D"NEW - GPU Passthrough of Vega 56 GPU hangs on KVM start."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110571">110571</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GPU Passthrough of Vega 56 GPU hangs on KVM start.
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>James.Dutton&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When trying to use IOMMU and passthrough a Vega GPU to the gue=
st VM.  KVM fails
to start, and SERR errors are shown with lspci on the GPU device.

Hardware is a Threadripper 1950X, Gigabyte X399 Pro motherboard.
Vega 56.

The same problem also happens with an old Radeon CAICOS GPU.

So, my theory is that this is a AMD Threadripper and X399 motherboard probl=
em.
Maybe related to the IOMMU programming on the X399 chipset not happening
correctly.

Can anyone help give me some pointers as to where to look to help diagnose =
the
problem.
For example, how do I view iommu settings/mappings?
How do I find out what all the config params for the X399 Bridge GPP do?
What does GPP mean?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15566967441.b8edFA.3200--

--===============0643993332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0643993332==--
