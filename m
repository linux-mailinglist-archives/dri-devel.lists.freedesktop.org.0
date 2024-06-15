Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5424F909889
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 15:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7954B10E075;
	Sat, 15 Jun 2024 13:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aOwTt7Jp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED3B10E00D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 13:31:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 287F86010F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 13:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3192C116B1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718458316;
 bh=lZ59l0yloJzyD3h8EKrZ3jSgx/kNrY9i+pePg/h14XY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aOwTt7JpXXMH/g8pqbag2gq9Fh9Mg9sXcOWJADhzm3o6IUDwwjAdXIu+kgP2V2NSI
 mp8VmP5BgZdD0JrHLzs1hRHrIDCzDjTjZDkkqlQui9oyKnMlQ+W8sV/rOmAEDuCP0S
 UFGbtImDWq/RDRs705U+IXRerYtHavRuMk4xhzyOlzo9F9HZzvedzCZw00TGzjPT9z
 fP+6hoRqQpo0HbbBYYXjzfN0cn7HqByXL9jGQEkAqIg/ivE01x2KBT2zyWVDiF1BYz
 TvhwROW0pASRaE5poPUfaTBRCJp/lvbf0AGPJSJXcS7LBIoLoHyQkAS2ZXQibOdRYw
 ea3nQl0m1aCeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B36A3C53BB7; Sat, 15 Jun 2024 13:31:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206309] Experimental amdgpu w/ Dell E6540 with HD 8790M (MARS
 XTX), massive performance improvement after ACPI suspend
Date: Sat, 15 Jun 2024 13:31:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jerbear3.14159@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-206309-2300-1kFCpYPBRI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206309-2300@https.bugzilla.kernel.org/>
References: <bug-206309-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D206309

jerbear3.14159@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jerbear3.14159@gmail.com

--- Comment #2 from jerbear3.14159@gmail.com ---
Hi, did you ever figure anything else out with this bug? I have the same
problem on a Dell Precision M2800 which has pretty much identical specs:

~$ DRI_PRIME=3D1 glxinfo -B
name of display: :0.0
display: :0  screen: 0
direct rendering: Yes
Extended renderer info (GLX_MESA_query_renderer):
    Vendor: AMD (0x1002)
    Device: AMD Radeon HD 8790M (oland, LLVM 15.0.7, DRM 3.54,
6.5.0-41-generic) (0x6606)
    Version: 23.2.1
    Accelerated: yes
    Video memory: 2048MB
    Unified memory: no
    Preferred profile: core (0x1)
    Max core profile version: 4.6
    Max compat profile version: 4.6
    Max GLES1 profile version: 1.1
    Max GLES[23] profile version: 3.2
Memory info (GL_ATI_meminfo):
    VBO free memory - total: 1667 MB, largest block: 1667 MB
    VBO free aux. memory - total: 3882 MB, largest block: 3882 MB
    Texture free memory - total: 1667 MB, largest block: 1667 MB
    Texture free aux. memory - total: 3882 MB, largest block: 3882 MB
    Renderbuffer free memory - total: 1667 MB, largest block: 1667 MB
    Renderbuffer free aux. memory - total: 3882 MB, largest block: 3882 MB
Memory info (GL_NVX_gpu_memory_info):
    Dedicated video memory: 2048 MB
    Total available memory: 5966 MB
    Currently available dedicated video memory: 1667 MB
OpenGL vendor string: AMD
OpenGL renderer string: AMD Radeon HD 8790M (oland, LLVM 15.0.7, DRM 3.54,
6.5.0-41-generic)
OpenGL core profile version string: 4.6 (Core Profile) Mesa 23.2.1-1ubuntu3=
.1
OpenGL core profile shading language version string: 4.60
OpenGL core profile context flags: (none)
OpenGL core profile profile mask: core profile

OpenGL version string: 4.6 (Compatibility Profile) Mesa 23.2.1-1ubuntu3.1
OpenGL shading language version string: 4.60
OpenGL context flags: (none)
OpenGL profile mask: compatibility profile

OpenGL ES profile version string: OpenGL ES 3.2 Mesa 23.2.1-1ubuntu3.1
OpenGL ES profile shading language version string: OpenGL ES GLSL ES 3.20

I also set `radeon.si_support=3D0 amdgpu.si_support=3D1` in order to force =
the
amdgpu driver.

The interesting thing is that the bug happens specifically when I boot up w=
ith
the charger plugged in (AC power brick; not a docking station), and when I
unplug it, the GPU clock speeds tank to 300MHz memory/300MHz shader. I've t=
ried
forcing the performance level back up to "high" which gives me this error:

echo -n high > /sys/class/drm/card1/device/power_dpm_force_performance_level
bash: echo: write error: Invalid argument

up until I reboot again, and the cycle restarts. It's pretty annoying how
careful I have to be about staying plugged in. Any help is appreciated!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
