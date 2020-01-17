Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C1E1407B4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 11:14:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFAE6F4D2;
	Fri, 17 Jan 2020 10:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860846F4D2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:14:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206231] New: R9 280X low performance with all games
Date: Fri, 17 Jan 2020 10:14:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kentosama@whiteninjastudio.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206231-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206231

            Bug ID: 206231
           Summary: R9 280X low performance with all games
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.0-2-amd64
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: kentosama@whiteninjastudio.com
        Regression: No

Created attachment 286855
  --> https://bugzilla.kernel.org/attachment.cgi?id=286855&action=edit
Low performance and low GPU usage with Tomb Raider (Linux native)

Hello, I have been experiencing performance issues with my AMD R9 280X graphics
card for several months.

On all games (Linux native and Proton), my performance is very low, well below
the capabilities of the graphics card.

The problem occurred when I migrated my system from Windows to Debian 10. I
updated Debian stable to sid in order to have the latest version of the kernel
and mesa.

When I launch a game, the performances are low and during very complex scenes,
the framerate goes down to 10/15 fps with a very low GPU use ~ 18%. The only
time I've seen GPU usage hit 98% is in the main menu in Dawn of War II.

Changing the graphics settings or the screen resolution changes absolutely
nothing.

The only game that seems to work well is Shadow Warrior, whose GPU usage rarely
exceeds 70%.

I have never heard the fans work since my transition to Debian so I used the
radeon-profile tool to make sure the fans work manually.

I forced the use of the hight profile in order to increase the memory and
processor frequency as much as possible, but no difference

kentosama@teradrive:~$ uname -a
Linux teradrive 5.4.0-2-amd64 #1 SMP Debian 5.4.8-1 (2020-01-05) x86_64
GNU/Linux

kentosama@teradrive:~$ glxinfo | grep OpenGL
OpenGL vendor string: X.Org
OpenGL renderer string: AMD Radeon HD 7900 Series (TAHITI, DRM 3.35.0,
5.4.0-2-amd64, LLVM 9.0.1)
OpenGL core profile version string: 4.5 (Core Profile) Mesa 19.3.2
OpenGL core profile shading language version string: 4.50
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile
OpenGL core profile extensions:
OpenGL version string: 4.5 (Compatibility Profile) Mesa 19.3.2
OpenGL shading language version string: 4.50
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile
OpenGL extensions:
OpenGL ES profile version string: OpenGL ES 3.2 Mesa 19.3.2
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20
OpenGL ES profile extensions:

kentosama@teradrive:~$ vblank_mode=0 glxgears
ATTENTION: default value of option vblank_mode overridden by environment.
25934 frames in 5.0 seconds = 5186.741 FPS
25239 frames in 5.0 seconds = 5047.634 FPS
25109 frames in 5.0 seconds = 5021.724 FPS
26234 frames in 5.0 seconds = 5246.724 FPS
27341 frames in 5.0 seconds = 5468.155 FPS
26836 frames in 5.0 seconds = 5367.148 FPS
27233 frames in 5.0 seconds = 5446.563 FPS
26164 frames in 5.0 seconds = 5232.749 FPS
26568 frames in 5.0 seconds = 5313.582 FPS
25854 frames in 5.0 seconds = 5170.670 FPS
26857 frames in 5.0 seconds = 5371.198 FPS
25896 frames in 5.0 seconds = 5179.152 FPS
26129 frames in 5.0 seconds = 5225.626 FPS
26181 frames in 5.0 seconds = 5236.104 FPS
25873 frames in 5.0 seconds = 5174.487 FPS
26584 frames in 5.0 seconds = 5316.643 FPS
26448 frames in 5.0 seconds = 5289.565 FPS
27543 frames in 5.0 seconds = 5508.535 FPS
26074 frames in 5.0 seconds = 5214.784 FPS
26551 frames in 5.0 seconds = 5310.126 FPS
27081 frames in 5.0 seconds = 5416.005 FPS
26073 frames in 5.0 seconds = 5214.450 FPS
25781 frames in 5.0 seconds = 5156.146 FPS
26895 frames in 5.0 seconds = 5378.962 FPS
26933 frames in 5.0 seconds = 5386.433 FPS
26197 frames in 5.0 seconds = 5239.087 FPS
26348 frames in 5.0 seconds = 5269.402 FPS
27020 frames in 5.0 seconds = 5403.997 FPS
26684 frames in 5.0 seconds = 5336.700 FPS
26798 frames in 5.0 seconds = 5359.434 FPS
27071 frames in 5.0 seconds = 5414.150 FPS
26068 frames in 5.0 seconds = 5213.525 FPS
25425 frames in 5.0 seconds = 5084.933 FPS
25963 frames in 5.0 seconds = 5192.526 FPS
26528 frames in 5.0 seconds = 5305.459 FPS
29053 frames in 5.0 seconds = 5810.492 FPS
25807 frames in 5.0 seconds = 5161.248 FPS
25978 frames in 5.0 seconds = 5195.598 FPS
25677 frames in 5.0 seconds = 5135.263 FPS
26250 frames in 5.0 seconds = 5249.852 FPS
26988 frames in 5.0 seconds = 5397.509 FPS
26183 frames in 5.0 seconds = 5236.487 FPS
25639 frames in 5.0 seconds = 5127.785 FPS
26207 frames in 5.0 seconds = 5241.383 FPS
25885 frames in 5.0 seconds = 5176.901 FPS
25660 frames in 5.0 seconds = 5131.782 FPS
25256 frames in 5.0 seconds = 5051.157 FPS
26747 frames in 5.0 seconds = 5349.287 FPS
27643 frames in 5.0 seconds = 5528.397 FPS
26030 frames in 5.0 seconds = 5205.866 FPS
26480 frames in 5.0 seconds = 5295.797 FPS
26451 frames in 5.0 seconds = 5290.124 FPS
26050 frames in 5.0 seconds = 5209.895 FPS
26075 frames in 5.0 seconds = 5214.940 FPS
26031 frames in 5.0 seconds = 5206.046 FPS
26157 frames in 5.0 seconds = 5231.230 FPS
26081 frames in 5.0 seconds = 5216.084 FPS
27675 frames in 5.0 seconds = 5534.894 FPS
26755 frames in 5.0 seconds = 5350.956 FPS
25175 frames in 5.0 seconds = 5034.920 FPS

kentosama@teradrive:~$ glmark2 -b "terrain"
=======================================================
    glmark2 2017.07
=======================================================
    OpenGL Information
    GL_VENDOR:     X.Org
    GL_RENDERER:   AMD Radeon HD 7900 Series (TAHITI, DRM 3.35.0,
5.4.0-2-amd64, LLVM 9.0.1)
    GL_VERSION:    4.5 (Compatibility Profile) Mesa 19.3.2
=======================================================
[terrain] <default>: FPS: 1367 FrameTime: 0.732 ms
=======================================================
                                  glmark2 Score: 1367 
=======================================================

kentosama@teradrive:~$ sudo cat /sys/kernel/debug/dri/0/amdgpu_pm_info
Clock Gating Flags Mask: 0x0
        Graphics Medium Grain Clock Gating: Off
        Graphics Medium Grain memory Light Sleep: Off
        Graphics Coarse Grain Clock Gating: Off
        Graphics Coarse Grain memory Light Sleep: Off
        Graphics Coarse Grain Tree Shader Clock Gating: Off
        Graphics Coarse Grain Tree Shader Light Sleep: Off
        Graphics Command Processor Light Sleep: Off
        Graphics Run List Controller Light Sleep: Off
        Graphics 3D Coarse Grain Clock Gating: Off
        Graphics 3D Coarse Grain memory Light Sleep: Off
        Memory Controller Light Sleep: Off
        Memory Controller Medium Grain Clock Gating: Off
        System Direct Memory Access Light Sleep: Off
        System Direct Memory Access Medium Grain Clock Gating: Off
        Bus Interface Medium Grain Clock Gating: Off
        Bus Interface Light Sleep: Off
        Unified Video Decoder Medium Grain Clock Gating: Off
        Video Compression Engine Medium Grain Clock Gating: Off
        Host Data Path Light Sleep: Off
        Host Data Path Medium Grain Clock Gating: Off
        Digital Right Management Medium Grain Clock Gating: Off
        Digital Right Management Light Sleep: Off
        Rom Medium Grain Clock Gating: Off
        Data Fabric Medium Grain Clock Gating: Off
        Address Translation Hub Medium Grain Clock Gating: Off
        Address Translation Hub Light Sleep: Off

uvd    vclk: 0 dclk: 0
power level 3    sclk: 105000 mclk: 150000 vddc: 1200 vddci: 875 pcie gen: 2

Is there anything I can do to regain "normal" performance?

thank you so much

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
