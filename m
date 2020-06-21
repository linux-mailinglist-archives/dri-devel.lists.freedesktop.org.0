Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC82A202BB9
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 19:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083446E2E3;
	Sun, 21 Jun 2020 17:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAA96E2E3
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 17:21:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208269] New: Polaris HDMI passthrough for TrueHD and DTS-HD
 does not work without snoop enabled, which leads to clipping
Date: Sun, 21 Jun 2020 17:21:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brady.w.clark@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208269-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208269

            Bug ID: 208269
           Summary: Polaris HDMI passthrough for TrueHD and DTS-HD does
                    not work without snoop enabled, which leads to
                    clipping
           Product: Drivers
           Version: 2.5
    Kernel Version: Tested on 5.1.16 and 5.6.18
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: brady.w.clark@gmail.com
        Regression: No

Motherboard: Asus P8H61-M LX3 R2.0
CPU: Celeron G1610
RAM: 4GB
GPU: Yeston RX550-4G D5 LP (POLARIS11)
Receiver: Denon x6500h

Tested in Kodi on 5.1.16 (LibreELEC 9.2.3) and on 5.6.18 (Fedora 32 with
Pulseaudio disabled)

Out of the box sound is crystal clear but passthrough does not work for TrueHD
and DTS-HD, receiver does not show the codec and there is no audio at all with
TrueHD and DTS-HD passthrough enabled.  Other codecs (AC3, DTS) passthrough
fine.

Capabilities seem to be detected correctly (contents of
\proc\asound\card0\eld#0.3 attached).

If I set "options snd_hda_intel snoop=1", passthrough for all codecs works as
expected, but I get horrible clipping with passthrough audio, and Kodi UI
clicks repeat.

alsa-test.sh results with and without snoop enabled are attached.

To note: This hardware combination works as expected in Windows, and with an
nVidia GT 1030 this setup does all HDMI passthrough correctly in LibreElec as
well, although it does not, of course, allow HEVC hardware decoding in
LibreELEC.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
