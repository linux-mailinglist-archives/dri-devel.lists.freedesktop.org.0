Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B920E2BC762
	for <lists+dri-devel@lfdr.de>; Sun, 22 Nov 2020 18:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB3989CF7;
	Sun, 22 Nov 2020 17:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FE289CF7
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Nov 2020 17:11:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210303] New: Ryzen 3 PRO 4350G GPU Failed to updateMST
 allocation table
Date: Sun, 22 Nov 2020 17:11:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marcin2006@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210303-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210303

            Bug ID: 210303
           Summary: Ryzen 3 PRO 4350G GPU Failed to updateMST allocation
                    table
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.9
          Hardware: IA-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: marcin2006@gmail.com
        Regression: No

Created attachment 293765
  --> https://bugzilla.kernel.org/attachment.cgi?id=293765&action=edit
two stack traces

Hello,
I own:
- AMD Ryzen 3 PRO 4350G with Radeon Graphics (I'm using integrated GPU)
- TV connected via HDMI
- monitor connected via DisplayPort

No daisy chaining is used.

I'm using amdgpu module with Xorg modesetting driver (but issue happens on ati
and amdgpu too).

During the evening I tend to disable my displayport monitor output and enable
HDMI output to TV to watch some movie. After watching the movie I want to
re-enable monitor output and this is where the trouble begins.

Usually I'm using xfce4-display-settings but
`xrandr --output DP-2 --auto --primary`
causes the same issue.

The issue is that the monitor (often, not always) stays black. And picture on
TV freezes (often, not always). Sometimes I'm able to restore system
functionality via SysRq and switching to different TTY, sometimes I need a hard
reset.

I was able to get some stack traces when this happens (from journactl). In the
attachment you will find two. During the second one I used xrandr command to
switch. Music that was playing started to loop every 0.5 second, screen got
bright blue and it lasted for few seconds. Then everything got back to normal
except of the fact that there were small green squares following my cursor.

The interesting fact is that when I run xrandr, my displayport outputs get
often (not always) changed. So if the monitor was DP-2, it becomes DP-3.

xorg-server: 1.20.9.r21.g5c400cae1-2
kernel: 5.9.9-arch1-1 64 bit
distro: Archlinux
mesa: 20.2.2-2
xrandr 1.5.1

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
