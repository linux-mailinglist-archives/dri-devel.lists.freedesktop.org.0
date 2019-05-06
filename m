Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7BC15370
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 20:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DE789BEC;
	Mon,  6 May 2019 18:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C2A989BD5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 18:12:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 58FD97215A; Mon,  6 May 2019 18:12:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110629] Intel i915 graphics driver issues with external monitor
 when laptop in docking station (opensuse bug 1132926)
Date: Mon, 06 May 2019 18:12:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/DRI/i915
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: regression
X-Bugzilla-Severity: normal
X-Bugzilla-Who: otrebor@swissonline.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 bug_file_loc op_sys bug_status keywords bug_severity priority component
 assigned_to reporter qa_contact cc
Message-ID: <bug-110629-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0704938891=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0704938891==
Content-Type: multipart/alternative; boundary="15571663401.960926Ab.8800"
Content-Transfer-Encoding: 7bit


--15571663401.960926Ab.8800
Date: Mon, 6 May 2019 18:12:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110629

            Bug ID: 110629
           Summary: Intel i915 graphics driver issues with external
                    monitor when laptop in docking station (opensuse bug
                    1132926)
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
               URL: https://bugzilla.opensuse.org/show_bug.cgi?id=3D1132926
                OS: Linux (All)
            Status: NEW
          Keywords: regression
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/i915
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: otrebor@swissonline.ch
        QA Contact: dri-devel@lists.freedesktop.org
                CC: tiwai@suse.de

I have a HP EliteBook 840 G2 running openSUSE Leap 15.0 with all patches
applied.
The laptop runs fine when it is in normal portable mode (off dock), also wi=
th
an external monitor. When I dock it into its docking station at home, I
experience weird graphic device behaviour. It is a matter of luck if it is =
able
to initialize and configure the attached external monitor the way it is
expected. Sometimes it hangs in an endless config loop when trying to
initialize the monitor.
The external monitor is a SAMSUNG U28D590D connected via display port to po=
rt
#1 to the docking station.
However, if I undock the laptop and plug the very same display cable to the
onboard display port then the display and the laptop run as expected. It re=
ally
is an issue I can only experience when putting the device into the docking
station.
For comparison: I had the chance to try another device, a HP EliteBook 840 =
G3
with the very same docking station and monitor. It was running Windows 7 an=
d I
did not see any strange behaviour. Additionally, I was earlier running open=
SUSE
42.3 on the very same device configuration and did not have any issues. The=
 odd
behaviour only started after upgrading to Leap 15.0 and got worse with each
patch cycle, to reach total unusability as of today. Hence, thats why I am
writing this bug report.
One thing I occasionally see is this error message in the logs:
kernel: [drm:intel_cpu_fifo_underrun_irq_handler [i915]] *ERROR* CPU pipe C
FIFO underrun

I attaching output from dmesg, journalctl, and xrandr in different
configurations. Let me know if you need more.
Thanks for the support.

Please also refer to opensuse bug #1132926 here for more details:
https://bugzilla.opensuse.org/show_bug.cgi?id=3D1132926

Somehow might relate to this bug here:
https://bugs.freedesktop.org/show_bug.cgi?id=3D95298
However, my enviroenment refers to the Intel i915 graphics driver as I have=
 no
Radeon hardware.

Please also see the opensuse bug first.
Let me know If you need more info.
Thanks for the support.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571663401.960926Ab.8800
Date: Mon, 6 May 2019 18:12:20 +0000
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
   title=3D"NEW - Intel i915 graphics driver issues with external monitor w=
hen laptop in docking station (opensuse bug 1132926)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110629">110629</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Intel i915 graphics driver issues with external monitor when =
laptop in docking station (opensuse bug 1132926)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
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
          <th>URL</th>
          <td>https://bugzilla.opensuse.org/show_bug.cgi?id=3D1132926
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
          <th>Keywords</th>
          <td>regression
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
          <td>Drivers/DRI/i915
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>otrebor&#64;swissonline.ch
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>CC</th>
          <td>tiwai&#64;suse.de
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have a HP EliteBook 840 G2 running openSUSE Leap 15.0 with a=
ll patches
applied.
The laptop runs fine when it is in normal portable mode (off dock), also wi=
th
an external monitor. When I dock it into its docking station at home, I
experience weird graphic device behaviour. It is a matter of luck if it is =
able
to initialize and configure the attached external monitor the way it is
expected. Sometimes it hangs in an endless config loop when trying to
initialize the monitor.
The external monitor is a SAMSUNG U28D590D connected via display port to po=
rt
#1 to the docking station.
However, if I undock the laptop and plug the very same display cable to the
onboard display port then the display and the laptop run as expected. It re=
ally
is an issue I can only experience when putting the device into the docking
station.
For comparison: I had the chance to try another device, a HP EliteBook 840 =
G3
with the very same docking station and monitor. It was running Windows 7 an=
d I
did not see any strange behaviour. Additionally, I was earlier running open=
SUSE
42.3 on the very same device configuration and did not have any issues. The=
 odd
behaviour only started after upgrading to Leap 15.0 and got worse with each
patch cycle, to reach total unusability as of today. Hence, thats why I am
writing this bug report.
One thing I occasionally see is this error message in the logs:
kernel: [drm:intel_cpu_fifo_underrun_irq_handler [i915]] *ERROR* CPU pipe C
FIFO underrun

I attaching output from dmesg, journalctl, and xrandr in different
configurations. Let me know if you need more.
Thanks for the support.

Please also refer to opensuse bug #1132926 here for more details:
<a href=3D"https://bugzilla.opensuse.org/show_bug.cgi?id=3D1132926">https:/=
/bugzilla.opensuse.org/show_bug.cgi?id=3D1132926</a>

Somehow might relate to this bug here:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Can't &quot;connect&quot; to external display attached to=
 docking station via DP on laptop with Intel/AMD dual"
   href=3D"show_bug.cgi?id=3D95298">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D95298</a>
However, my enviroenment refers to the Intel i915 graphics driver as I have=
 no
Radeon hardware.

Please also see the opensuse bug first.
Let me know If you need more info.
Thanks for the support.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571663401.960926Ab.8800--

--===============0704938891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0704938891==--
