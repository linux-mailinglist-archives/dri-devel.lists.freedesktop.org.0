Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33772140CF2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 15:45:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B036F5BE;
	Fri, 17 Jan 2020 14:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2441F6F5BE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 14:45:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206231] R9 280X low performance with all games
Date: Fri, 17 Jan 2020 14:37:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206231-2300-tJvZaSGABs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206231-2300@https.bugzilla.kernel.org/>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
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

--- Comment #2 from kentosama (kentosama@whiteninjastudio.com) ---
Hello, with the radeonsi driver, the performance is lower than the amdgpu
driver. On the same scene in Tomb Raider, the graphics card displays ~ 10fps.

I have a lower score with glmark2:

kentosama@teradrive:~$ glmark2 -b "terrain"
=======================================================
    glmark2 2017.07
=======================================================
    OpenGL Information
    GL_VENDOR:     X.Org
    GL_RENDERER:   AMD TAHITI (DRM 2.50.0, 5.4.0-2-amd64, LLVM 9.0.1)
    GL_VERSION:    4.5 (Compatibility Profile) Mesa 19.3.2
=======================================================
[terrain] <default>: FPS: 1280 FrameTime: 0.781 ms
=======================================================
                                  glmark2 Score: 1280 
=======================================================

But glxgears shows a better result
kentosama@teradrive:~$ vblank_mode=0 glxgears
ATTENTION: default value of option vblank_mode overridden by environment.
28092 frames in 5.0 seconds = 5618.325 FPS
29931 frames in 5.0 seconds = 5985.997 FPS
28614 frames in 5.0 seconds = 5722.756 FPS
29221 frames in 5.0 seconds = 5844.179 FPS
28387 frames in 5.0 seconds = 5677.356 FPS
29344 frames in 5.0 seconds = 5868.745 FPS
29921 frames in 5.0 seconds = 5984.118 FPS
28185 frames in 5.0 seconds = 5636.796 FPS
29347 frames in 5.0 seconds = 5869.202 FPS
29644 frames in 5.0 seconds = 5928.789 FPS
29234 frames in 5.0 seconds = 5846.652 FPS
28770 frames in 5.0 seconds = 5753.883 FPS
29134 frames in 5.0 seconds = 5826.747 FPS
29706 frames in 5.0 seconds = 5941.031 FPS
29344 frames in 5.0 seconds = 5868.780 FPS
29803 frames in 5.0 seconds = 5960.432 FPS
29425 frames in 5.0 seconds = 5884.889 FPS

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
