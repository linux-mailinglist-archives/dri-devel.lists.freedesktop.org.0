Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEDD3127D1
	for <lists+dri-devel@lfdr.de>; Sun,  7 Feb 2021 23:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115DC6E231;
	Sun,  7 Feb 2021 22:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B09E6E231
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Feb 2021 22:17:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3649964E4E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Feb 2021 22:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612736270;
 bh=BEgCiNTyFRif43n5eKU77yTa58jxrXoWK1U5W6Lihw4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=azo2sCC5/xkim7CGVEiFUQp3nPv9lgr/06oMqwMLTrdH5Fa5fVmCb7nyHvPxZeIvv
 TFtQGYMRpbwVnVSeYj153OoilgsjQ1ItY0mvAA08MzZjEOvftkdyH+zV1nFbhqfX7e
 gXrNQBlXMDf16YbxzyaC7yNTwkCHiCibW2A1jT0SxMNyIZa7Tdana7uPK5oarSroK/
 7OKcKwJJMjUmGbo/sdrdvuRj0FFvt46IfN7J5yCFw5e7rsXuxsLEYAyNQueQYJNe8l
 Oxr8boQ+G2Y07OWP88maMPxmU9UDbGitokZAutyRFV2HwRx075D+wuO6yCcWWcAV1V
 aDCYD+G3JSYLA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3273165355; Sun,  7 Feb 2021 22:17:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Sun, 07 Feb 2021 22:17:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paulo.ulusu@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203905-2300-4wX20BZifc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=203905

Paulo Nascimento (paulo.ulusu@googlemail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |paulo.ulusu@googlemail.com

--- Comment #21 from Paulo Nascimento (paulo.ulusu@googlemail.com) ---
I confirm that the bug is not fixed in kenel 5.11-rc3

max brightness:
[pn@pn-legion backlight]$ cat /sys/class/backlight/amdgpu_bl1/actual_brightness
311
[pn@pn-legion backlight]$ cat /sys/class/backlight/amdgpu_bl1/brightness
255
[pn@pn-legion backlight]$ cat /sys/class/backlight/amdgpu_bl1/max_brightness
255

min brightness:
[pn@pn-legion backlight]$ cat /sys/class/backlight/amdgpu_bl1/actual_brightness
311
[pn@pn-legion backlight]$ cat /sys/class/backlight/amdgpu_bl1/brightness
0
[pn@pn-legion backlight]$ cat /sys/class/backlight/amdgpu_bl1/max_brightness
255

My laptop has an amd ryzen 5 4600h with renoir igpu and nvidia dgpu. 
Tests are done with renoir igpu:

[pn@pn-legion backlight]$ inxi -G
Graphics:  Device-1: NVIDIA TU116M [GeForce GTX 1660 Ti Mobile] driver: nouveau
v: kernel 
           Device-2: Advanced Micro Devices [AMD/ATI] Renoir driver: amdgpu v:
kernel 
           Device-3: Chicony Integrated Camera type: USB driver: uvcvideo 
           Display: x11 server: X.Org 1.20.10 driver: loaded:
amdgpu,ati,modesetting,nouveau resolution: 1920x1080~120Hz 
           OpenGL: renderer: AMD RENOIR (DRM 3.40.0 5.11.0-1-MANJARO LLVM
11.0.1) v: 4.6 Mesa 20.3.3

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
