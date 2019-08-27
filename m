Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD649E239
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 10:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2ED899B7;
	Tue, 27 Aug 2019 08:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 852A5899B7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 08:20:35 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7B89372161; Tue, 27 Aug 2019 08:20:35 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111498] [amdgpu, Ryzen 7 Pro 3700U] freeze when suspending
 shortly after wakeup
Date: Tue, 27 Aug 2019 08:20:35 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: rohan@rohanlean.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111498-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0820342655=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0820342655==
Content-Type: multipart/alternative; boundary="15668940350.EDE00cA.22102"
Content-Transfer-Encoding: 7bit


--15668940350.EDE00cA.22102
Date: Tue, 27 Aug 2019 08:20:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111498

            Bug ID: 111498
           Summary: [amdgpu, Ryzen 7 Pro 3700U] freeze when suspending
                    shortly after wakeup
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: rohan@rohanlean.de

Linux version: 5.2.9
Hardware: Ryzen 7 Pro 3700U

When I try to suspend the system while it is waking up from s3, the system =
does
not properly suspend again, but instead freezes with a blank screen, and the
fans ramp up after a while.

I have chosen severity "major", because this can cause overheating when a
laptop  that is thought to be suspended is put into a bag.

Possibly relevant kernel messages before the hard reset:

Aug 27 09:11:39 kernel: PM: suspend entry (s2idle)
Aug 27 09:11:39 kernel: PM: suspend exit
Aug 27 09:11:39 kernel: Restarting tasks ... done.
Aug 27 09:11:39 kernel: OOM killer enabled.
Aug 27 09:11:39 kernel: acpi LNXPOWER:00: Turning OFF
Aug 27 09:11:39 kernel: PM: resume devices took 1.529 seconds
Aug 27 09:11:39 kernel: [drm:amdgpu_device_ip_late_init_func_handler [amdgp=
u]]
*ERROR* ib ring test failed (-110).
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: [drm:amdgpu_ib_ring_tests
[amdgpu]] *ERROR* IB test failed on gfx (-110).
Aug 27 09:11:39 kernel: [drm] Fence fallback timer expired on ring sdma0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring vcn_jpeg uses VM inv eng =
6 on
hub 1
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring vcn_enc1 uses VM inv eng =
5 on
hub 1
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring vcn_enc0 uses VM inv eng =
4 on
hub 1
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring vcn_dec uses VM inv eng 1=
 on
hub 1
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring sdma0 uses VM inv eng 0 on
hub 1
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring kiq_2.1.0 uses VM inv eng=
 11
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.3.1 uses VM inv en=
g 10
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.2.1 uses VM inv en=
g 9
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.1.1 uses VM inv en=
g 8
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.0.1 uses VM inv en=
g 7
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.3.0 uses VM inv en=
g 6
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.2.0 uses VM inv en=
g 5
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.1.0 uses VM inv en=
g 4
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.0.0 uses VM inv en=
g 1
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring gfx uses VM inv eng 0 on =
hub
0
Aug 27 09:11:39 kernel: [drm] VCN decode and encode initialized
successfully(under DPG Mode).
Aug 27 09:11:39 kernel: amdgpu: [powerplay] dpm has been enabled

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668940350.EDE00cA.22102
Date: Tue, 27 Aug 2019 08:20:35 +0000
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
   title=3D"NEW - [amdgpu, Ryzen 7 Pro 3700U] freeze when suspending shortl=
y after wakeup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111498">111498</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[amdgpu, Ryzen 7 Pro 3700U] freeze when suspending shortly af=
ter wakeup
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
          <td>rohan&#64;rohanlean.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Linux version: 5.2.9
Hardware: Ryzen 7 Pro 3700U

When I try to suspend the system while it is waking up from s3, the system =
does
not properly suspend again, but instead freezes with a blank screen, and the
fans ramp up after a while.

I have chosen severity &quot;major&quot;, because this can cause overheatin=
g when a
laptop  that is thought to be suspended is put into a bag.

Possibly relevant kernel messages before the hard reset:

Aug 27 09:11:39 kernel: PM: suspend entry (s2idle)
Aug 27 09:11:39 kernel: PM: suspend exit
Aug 27 09:11:39 kernel: Restarting tasks ... done.
Aug 27 09:11:39 kernel: OOM killer enabled.
Aug 27 09:11:39 kernel: acpi LNXPOWER:00: Turning OFF
Aug 27 09:11:39 kernel: PM: resume devices took 1.529 seconds
Aug 27 09:11:39 kernel: [drm:amdgpu_device_ip_late_init_func_handler [amdgp=
u]]
*ERROR* ib ring test failed (-110).
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: [drm:amdgpu_ib_ring_tests
[amdgpu]] *ERROR* IB test failed on gfx (-110).
Aug 27 09:11:39 kernel: [drm] Fence fallback timer expired on ring sdma0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring vcn_jpeg uses VM inv eng =
6 on
hub 1
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring vcn_enc1 uses VM inv eng =
5 on
hub 1
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring vcn_enc0 uses VM inv eng =
4 on
hub 1
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring vcn_dec uses VM inv eng 1=
 on
hub 1
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring sdma0 uses VM inv eng 0 on
hub 1
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring kiq_2.1.0 uses VM inv eng=
 11
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.3.1 uses VM inv en=
g 10
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.2.1 uses VM inv en=
g 9
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.1.1 uses VM inv en=
g 8
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.0.1 uses VM inv en=
g 7
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.3.0 uses VM inv en=
g 6
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.2.0 uses VM inv en=
g 5
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.1.0 uses VM inv en=
g 4
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring comp_1.0.0 uses VM inv en=
g 1
on hub 0
Aug 27 09:11:39 kernel: amdgpu 0000:05:00.0: ring gfx uses VM inv eng 0 on =
hub
0
Aug 27 09:11:39 kernel: [drm] VCN decode and encode initialized
successfully(under DPG Mode).
Aug 27 09:11:39 kernel: amdgpu: [powerplay] dpm has been enabled</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668940350.EDE00cA.22102--

--===============0820342655==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0820342655==--
