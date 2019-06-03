Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EA932CFF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 11:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC16891FF;
	Mon,  3 Jun 2019 09:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E9486891FF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 09:37:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E583772167; Mon,  3 Jun 2019 09:37:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110822] booting with kernel version 5.1.0 or higher on RX 580
 hangs
Date: Mon, 03 Jun 2019 09:37:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: gobinda.joy@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110822-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1782619295=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1782619295==
Content-Type: multipart/alternative; boundary="15595546421.BEfBc.24762"
Content-Transfer-Encoding: 7bit


--15595546421.BEfBc.24762
Date: Mon, 3 Jun 2019 09:37:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110822

            Bug ID: 110822
           Summary: booting with kernel version 5.1.0 or higher on RX 580
                    hangs
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: gobinda.joy@gmail.com

Created attachment 144420
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144420&action=3Dedit
Linux version 5.1.6-350.vanilla.knurd.1.fc30.x86_64

My hardware is as follows:
CPU: i7 3770 at stock clock
Motherboard: Gigabyte G1.Sniper 3 latest BIOS available
RAM: 24 GB DDR3 at 1600 mhz
GPU: RX 580 8GB (Sapphire) latest VBIOS

The problem is with kernel 5.1.0 or higher (currently 5.1.6) Display hangs =
when
amdgpu driver loads. I'm unable to determine if the booting is continued or
hangs as well. Disk activity stops after couple seconds and not possible to
switch TTY.
Ctrl+Alt+Del is unresponsive as well.

This problem goes away when amdgpu.dpm=3D0 is used but in that case dynamic=
 power
scaling is not available and gpu stuck at low clock, graphics performance is
abysmal. Also GPU temp/fan speed utilities doesn't work.

Here is the excerpt of the problematic log lines:

Jun 02 09:54:05 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:06 kernel: amdgpu: [powerplay]=20
                         failed to send message 15b ret is 65535=20
Jun 02 09:54:06 kernel: hrtimer: interrupt took 287743313 ns
Jun 02 09:54:06 kernel: clocksource: timekeeping watchdog on CPU3: Marking
clocksource 'tsc' as unstable because the skew is too large:
Jun 02 09:54:06 kernel: clocksource:                       'hpet' wd_now:
628dd7b wd_last: 5fef431 mask: ffffffff
Jun 02 09:54:06 kernel: clocksource:                       'tsc' cs_now:
254aa24747 cs_last: 25104a5bfd mask: ffffffffffffffff
Jun 02 09:54:06 kernel: tsc: Marking TSC unstable due to clocksource watchd=
og
Jun 02 09:54:07 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:07 kernel: amdgpu: [powerplay]=20
                         failed to send message 148 ret is 65535=20
Jun 02 09:54:07 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:07 kernel: amdgpu: [powerplay]=20
                         failed to send message 145 ret is 65535=20
Jun 02 09:54:08 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:08 kernel: TSC found unstable after boot, most likely due to
broken BIOS. Use 'tsc=3Dunstable'.
Jun 02 09:54:08 kernel: sched_clock: Marking unstable (8791691311,
362291)<-(8817904668, -25851212)
Jun 02 09:54:08 kernel: amdgpu: [powerplay]=20
                         failed to send message 146 ret is 65535=20
Jun 02 09:54:08 kernel: hid-generic 0003:09DA:FC7C.0003: input,hidraw2: USB=
 HID
v1.11 Mouse [COMPANY USB Device] on usb-0000:00:1a.0-1.5.3/input0
Jun 02 09:54:09 kernel: hid-generic 0003:09DA:FC7C.0004: hiddev97,hidraw3: =
USB
HID v1.11 Device [COMPANY USB Device] on usb-0000:00:1a.0-1.5.3/input1
Jun 02 09:54:11 kernel: clocksource: Switched to clocksource hpet
Jun 02 09:54:13 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:13 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:15 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:15 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:15 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:15 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:17 kernel: [drm] Initialized amdgpu 3.30.0 20150101 for
0000:04:00.0 on minor 0
Jun 02 09:54:17 kernel: EXT4-fs (sda3): mounted filesystem with ordered data
mode. Opts: (null)
Jun 02 09:54:20 kernel: amdgpu 0000:04:00.0: [drm:amdgpu_ib_ring_tests
[amdgpu]] *ERROR* IB test failed on gfx (-110).
Jun 02 09:54:21 kernel: [drm:amdgpu_device_ip_late_init_func_handler [amdgp=
u]]
*ERROR* ib ring test failed (-110).

Any help is appreciated. Also let me know if I can help in any way.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15595546421.BEfBc.24762
Date: Mon, 3 Jun 2019 09:37:22 +0000
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
   title=3D"NEW - booting with kernel version 5.1.0 or higher on RX 580 han=
gs"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110822">110822</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>booting with kernel version 5.1.0 or higher on RX 580 hangs
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
          <td>gobinda.joy&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144420=
" name=3D"attach_144420" title=3D"Linux version 5.1.6-350.vanilla.knurd.1.f=
c30.x86_64">attachment 144420</a> <a href=3D"attachment.cgi?id=3D144420&amp=
;action=3Dedit" title=3D"Linux version 5.1.6-350.vanilla.knurd.1.fc30.x86_6=
4">[details]</a></span>
Linux version 5.1.6-350.vanilla.knurd.1.fc30.x86_64

My hardware is as follows:
CPU: i7 3770 at stock clock
Motherboard: Gigabyte G1.Sniper 3 latest BIOS available
RAM: 24 GB DDR3 at 1600 mhz
GPU: RX 580 8GB (Sapphire) latest VBIOS

The problem is with kernel 5.1.0 or higher (currently 5.1.6) Display hangs =
when
amdgpu driver loads. I'm unable to determine if the booting is continued or
hangs as well. Disk activity stops after couple seconds and not possible to
switch TTY.
Ctrl+Alt+Del is unresponsive as well.

This problem goes away when amdgpu.dpm=3D0 is used but in that case dynamic=
 power
scaling is not available and gpu stuck at low clock, graphics performance is
abysmal. Also GPU temp/fan speed utilities doesn't work.

Here is the excerpt of the problematic log lines:

Jun 02 09:54:05 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:06 kernel: amdgpu: [powerplay]=20
                         failed to send message 15b ret is 65535=20
Jun 02 09:54:06 kernel: hrtimer: interrupt took 287743313 ns
Jun 02 09:54:06 kernel: clocksource: timekeeping watchdog on CPU3: Marking
clocksource 'tsc' as unstable because the skew is too large:
Jun 02 09:54:06 kernel: clocksource:                       'hpet' wd_now:
628dd7b wd_last: 5fef431 mask: ffffffff
Jun 02 09:54:06 kernel: clocksource:                       'tsc' cs_now:
254aa24747 cs_last: 25104a5bfd mask: ffffffffffffffff
Jun 02 09:54:06 kernel: tsc: Marking TSC unstable due to clocksource watchd=
og
Jun 02 09:54:07 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:07 kernel: amdgpu: [powerplay]=20
                         failed to send message 148 ret is 65535=20
Jun 02 09:54:07 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:07 kernel: amdgpu: [powerplay]=20
                         failed to send message 145 ret is 65535=20
Jun 02 09:54:08 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:08 kernel: TSC found unstable after boot, most likely due to
broken BIOS. Use 'tsc=3Dunstable'.
Jun 02 09:54:08 kernel: sched_clock: Marking unstable (8791691311,
362291)&lt;-(8817904668, -25851212)
Jun 02 09:54:08 kernel: amdgpu: [powerplay]=20
                         failed to send message 146 ret is 65535=20
Jun 02 09:54:08 kernel: hid-generic 0003:09DA:FC7C.0003: input,hidraw2: USB=
 HID
v1.11 Mouse [COMPANY USB Device] on usb-0000:00:1a.0-1.5.3/input0
Jun 02 09:54:09 kernel: hid-generic 0003:09DA:FC7C.0004: hiddev97,hidraw3: =
USB
HID v1.11 Device [COMPANY USB Device] on usb-0000:00:1a.0-1.5.3/input1
Jun 02 09:54:11 kernel: clocksource: Switched to clocksource hpet
Jun 02 09:54:13 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:13 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:14 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:15 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:15 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:15 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:15 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         last message was failed ret is 65535
Jun 02 09:54:16 kernel: amdgpu: [powerplay]=20
                         failed to send message 260 ret is 65535=20
Jun 02 09:54:17 kernel: [drm] Initialized amdgpu 3.30.0 20150101 for
0000:04:00.0 on minor 0
Jun 02 09:54:17 kernel: EXT4-fs (sda3): mounted filesystem with ordered data
mode. Opts: (null)
Jun 02 09:54:20 kernel: amdgpu 0000:04:00.0: [drm:amdgpu_ib_ring_tests
[amdgpu]] *ERROR* IB test failed on gfx (-110).
Jun 02 09:54:21 kernel: [drm:amdgpu_device_ip_late_init_func_handler [amdgp=
u]]
*ERROR* ib ring test failed (-110).

Any help is appreciated. Also let me know if I can help in any way.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15595546421.BEfBc.24762--

--===============1782619295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1782619295==--
