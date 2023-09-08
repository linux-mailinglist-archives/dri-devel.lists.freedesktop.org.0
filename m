Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 364AA798981
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D66510E90B;
	Fri,  8 Sep 2023 15:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7030E10E90C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 15:03:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B06A4614EA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 15:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21779C433CC
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 15:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694185393;
 bh=XfG/JPzCBD0ItJMIqQJgzKALsgzeQDXvLSszQcspG0E=;
 h=From:To:Subject:Date:From;
 b=o7TY2+2OLb5m52DYhgsUes0kMbhGY+4YRJUhQnnVLik0nifXy8kM9zPKSrBjjTsdN
 IfVbJMrIPW6zcZUWYRxEyfYdLOYM45XfQkVeJQUSEqLNRpi/4OmrMLm1hOIg5B0nl+
 sjKRWmhMJTUUMpXyCi3A8h61TzZn4YaKjDen/UMxTbwcBBnua7w1c6VKC5HTrL1J2L
 fT7dhd6ZYpbzlCEaAOKCBebZxlc1R2zMOTDosi10ivMvt1Fe38r/CkTBA0P6bSwB33
 y2N4uVSB9aD4cqQvQJqtWGGVwtuYaqu9Z1UP+RuMCxgyIEFpGawKBy/fbf6iMAYNzN
 4yviFQTbU8POw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0AFBFC53BD0; Fri,  8 Sep 2023 15:03:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217889] New: WARNING: CPU: 0 PID: 5172 at
 drivers/gpu/drm/ttm/ttm_bo.c:362 ttm_bo_release+0x309/0x330 [ttm]  after
 resolution change
Date: Fri, 08 Sep 2023 15:03:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wojtasjd@notowany.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217889-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D217889

            Bug ID: 217889
           Summary: WARNING: CPU: 0 PID: 5172 at
                    drivers/gpu/drm/ttm/ttm_bo.c:362
                    ttm_bo_release+0x309/0x330 [ttm]  after resolution
                    change
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: wojtasjd@notowany.pl
        Regression: No

Created attachment 305071
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305071&action=3Dedit
Ubuntu 22.04.2 Live session dmesg output

After changing resolution (for example from 1920x1080 -> 1680x1050) from GUI
(Displays section in GNOME Control Center or KDE systemsettings) I'm getting
this ttm WARNING (dmesg).
It occurs in several distributions like:
- Ubuntu 22.04.2 (GNOME, X11) Live session, kernel: 5.19.0-32-generic (64-b=
it)
- openSUSE Leap 15.5 (KDE Plasma 5.27.4, X11), kernel
5.14.21-150500-55.19-default (64-bit)
- Manjaro (KDE Plasma 5.27.7, X11), kernel 6.1.49-1-MANJARO (64-bit)
- Manjaro (KDE Plasma 5.27.7, X11), kernel 6.5.0-1-MANJARO (64-bit)

It seems that changing resolution with xrandr (after reboot) does not cause
this problem.

I'm attaching dmesg output from Ubuntu 22.04.2 (GNOME, X11) Live session.

$ inxi -b

System:
  Host: ubuntu Kernel: 5.19.0-32-generic x86_64 bits: 64 Desktop: GNOME 42.5
    Distro: Ubuntu 22.04.2 LTS (Jammy Jellyfish)
Machine:
  Type: Desktop Mobo: ASUSTeK model: P5QL-CM v: Rev X.0x
    serial: <superuser required> BIOS: American Megatrends v: 0901
    date: 05/11/2010
CPU:
  Info: quad core Intel Xeon L5430 [MCP] speed (MHz): avg: 2003
    min/max: 2003/2670
Graphics:
  Device-1: AMD Turks PRO [Radeon HD 6570/7570/8550 / R5 230] driver: radeon
    v: kernel
  Display: x11 server: X.Org v: 1.21.1.3 driver: X: loaded: ati,radeon
    unloaded: fbdev,modesetting,vesa gpu: radeon resolution: 1920x1080~60Hz
  OpenGL: renderer: AMD TURKS (DRM 2.50.0 / 5.19.0-32-generic LLVM 15.0.6)
    v: 3.3 Mesa 22.2.5
Network:
  Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet
    driver: r8169
Drives:
  Local Storage: total: 163.56 GiB used: 62.6 MiB (0.0%)
Info:
  Processes: 257 Uptime: 24m Memory: 3.83 GiB used: 2.2 GiB (57.5%)
  Shell: Bash inxi: 3.3.13


# cat /sys/kernel/debug/dma_buf/bufinfo

Dma-buf Objects:
size            flags           mode            count           exp_name=20=
=20=20=20=20=20=20
ino=20=20=20=20=20
03784704        00000000        00080005        00000003        drm=20=20=
=20=20
00000110=20=20=20=20=20=20=20=20
        read fence:radeon radeon.gfx seq 6580 signalled
        read fence:radeon radeon.gfx seq 6576 signalled
        Attached Devices:
Total 0 devices attached

08355840        00000000        00080005        00000003        drm=20=20=
=20=20
00000106=20=20=20=20=20=20=20=20
        read fence:radeon radeon.gfx seq 6552 signalled
        Attached Devices:
Total 0 devices attached

08355840        00000000        00080005        00000003        drm=20=20=
=20=20
00000105=20=20=20=20=20=20=20=20
        write fence:radeon radeon.gfx seq 6578 signalled
        Attached Devices:
Total 0 devices attached

08355840        00000000        00080005        00000003        drm=20=20=
=20=20
00000104=20=20=20=20=20=20=20=20
        write fence:radeon radeon.gfx seq 6576 signalled
        read fence:radeon radeon.gfx seq 5897 signalled
        Attached Devices:
Total 0 devices attached

08355840        00000000        00080005        00000003        drm=20=20=
=20=20
00000103=20=20=20=20=20=20=20=20
        write fence:radeon radeon.gfx seq 6580 signalled
        Attached Devices:
Total 0 devices attached

08355840        00000000        00080005        00000002        drm=20=20=
=20=20
00000101=20=20=20=20=20=20=20=20
        read fence:radeon radeon.gfx seq 4414 signalled
        Attached Devices:
Total 0 devices attached

03899392        00000000        00080005        00000003        drm=20=20=
=20=20
00000084=20=20=20=20=20=20=20=20
        read fence:radeon radeon.gfx seq 6445 signalled
        read fence:radeon radeon.gfx seq 4345 signalled
        Attached Devices:
Total 0 devices attached

00004096        00000000        00080005        00000003        drm=20=20=
=20=20
00000083=20=20=20=20=20=20=20=20
        Attached Devices:
Total 0 devices attached

01916928        00000000        00080005        00000003        drm=20=20=
=20=20
00000072=20=20=20=20=20=20=20=20
        read fence:radeon radeon.gfx seq 5932 signalled
        Attached Devices:
Total 0 devices attached

00004096        00000000        00080005        00000003        drm=20=20=
=20=20
00000014=20=20=20=20=20=20=20=20
        Attached Devices:
Total 0 devices attached

08294400        00000000        00080005        00000002        drm=20=20=
=20=20
00000011=20=20=20=20=20=20=20=20
        read fence:radeon radeon.gfx seq 295 signalled
        Attached Devices:
Total 0 devices attached


Total 11 objects, 59682816 bytes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
