Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ADA3140D5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 21:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6895F6E9F7;
	Mon,  8 Feb 2021 20:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF8A6E9F7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 20:47:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1765464EAC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612817265;
 bh=oTMI9tknAdg5Py9ufBtK+Y74H6Z4mNRrdr/6CiwOI54=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SRaUiRU7GDCFmnOedXkZhS7/6QoxX31D+uhXFOXpnOTxuMs4Ir5ZNTEpE5w3zneQN
 9y8OYrzDcWzpUhNVy3/XRXYa+z8PCy12Xr37iob7iowbT0Aka66yPhVFcNvdyKSfJi
 NOFIoEWVnbvw9nlNqLYfO+Wx3qLeq9RjuUhaTrR53dETKQ0KhNpIJoQDqrtEUZeQCp
 JdcUDrC8G6XkECTgLIUhUtOxpsm5M5WqeB10NoO1KcZuLBXnUIqElHOBtp8WFp1mE2
 Xt1da9HZcSsSWIIwwyr10KoI0BEZ8Po1y8nhpCkWFAZtqEvwhQEXIkl+rDScLVUjVI
 KjwqakFslw1zQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 132C76532A; Mon,  8 Feb 2021 20:47:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Mon, 08 Feb 2021 20:47:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: antonyjr000@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203905-2300-EP89VAh4rc@https.bugzilla.kernel.org/>
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

--- Comment #22 from Antony J.R (antonyjr000@gmail.com) ---
A workaround for this is done by the OpenSUSE folks, Please see
https://bugzilla.opensuse.org/show_bug.cgi?id=1180749

The only distro which fixes this is OpenSUSE. This is because there is a
bug in the mainline kernel and kernel devs are not responding to us for
some reason(maybe file a new issue???).

The problem is that the kernel uses aux for backlight control but our
systems don't support backlight control via aux. So disabling aux
completely from amdgpu kernel module can give us backlight control for the
iGPU. I've tested it and it works just find.

Regards,
Antony J.R

On Mon, Feb 8, 2021 at 3:47 AM <bugzilla-daemon@bugzilla.kernel.org> wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=203905
>
> Paulo Nascimento (paulo.ulusu@googlemail.com) changed:
>
>            What    |Removed                     |Added
>
> ----------------------------------------------------------------------------
>                  CC|                            |
> paulo.ulusu@googlemail.com
>
> --- Comment #21 from Paulo Nascimento (paulo.ulusu@googlemail.com) ---
> I confirm that the bug is not fixed in kenel 5.11-rc3
>
> max brightness:
> [pn@pn-legion backlight]$ cat
> /sys/class/backlight/amdgpu_bl1/actual_brightness
> 311
> [pn@pn-legion backlight]$ cat /sys/class/backlight/amdgpu_bl1/brightness
> 255
> [pn@pn-legion backlight]$ cat
> /sys/class/backlight/amdgpu_bl1/max_brightness
> 255
>
> min brightness:
> [pn@pn-legion backlight]$ cat
> /sys/class/backlight/amdgpu_bl1/actual_brightness
> 311
> [pn@pn-legion backlight]$ cat /sys/class/backlight/amdgpu_bl1/brightness
> 0
> [pn@pn-legion backlight]$ cat
> /sys/class/backlight/amdgpu_bl1/max_brightness
> 255
>
> My laptop has an amd ryzen 5 4600h with renoir igpu and nvidia dgpu.
> Tests are done with renoir igpu:
>
> [pn@pn-legion backlight]$ inxi -G
> Graphics:  Device-1: NVIDIA TU116M [GeForce GTX 1660 Ti Mobile] driver:
> nouveau
> v: kernel
>            Device-2: Advanced Micro Devices [AMD/ATI] Renoir driver:
> amdgpu v:
> kernel
>            Device-3: Chicony Integrated Camera type: USB driver: uvcvideo
>            Display: x11 server: X.Org 1.20.10 driver: loaded:
> amdgpu,ati,modesetting,nouveau resolution: 1920x1080~120Hz
>            OpenGL: renderer: AMD RENOIR (DRM 3.40.0 5.11.0-1-MANJARO LLVM
> 11.0.1) v: 4.6 Mesa 20.3.3
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are on the CC list for the bug.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
