Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5DD375337
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 13:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D59C6E167;
	Thu,  6 May 2021 11:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17626E167
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 11:50:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 48590613EB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 11:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620301855;
 bh=jO7vOQPagD5bmaXqCtIswIy3Mvmon15rA6NXF31EBNg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=k41dkBbOogVBPXHbpjNRmVeDfmugNsrYNJ04ZKNgUyjKx7r0KwXlkVzdgutKPlWy0
 l3JZHZeEWgIkBm9qIXPyhs5HNm6HSgoMYqMkwiCh4HWBUHxf4q7gS6cD2M6+bIkK0w
 /Sd/07XzxMgiUak4MAvremqAGj6rKcFE6R0iqpXDGNPzYD9OkRSEhyClAcSq4dl3hS
 w0LafJxErR4SCBbVexNuRoyi8j8kn+LGrWOnin6YYNGV8f+d2mbuO7ZgJu84nMOqVz
 kQCh+NS1GnZFGpKyd2YGxHmToIO5ZjEbpyxEfudg5XRI3zhbI6nqVcbZNQhpTgKDwr
 rwS9ySznmaRWA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 446EE6129E; Thu,  6 May 2021 11:50:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Thu, 06 May 2021 11:50:54 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203905-2300-pO4eBcSUD4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203905

--- Comment #30 from Paulo Nascimento (paulo.ulusu@googlemail.com) ---
laptop: Lenovo Legion 5, amd ryzen 5 4600h
Graphics:  Device-1: NVIDIA TU116M [GeForce GTX 1660 Ti Mobile] driver: nou=
veau
           Device-2: Advanced Micro Devices [AMD/ATI] Renoir driver: amdgpu
Kernel: 5.12.0-1-MANJARO x86_64

I have loaded kernel 5.12 and enabled the patch with amdgpu.backlight=3D0. =
The
brightness controls Fn+F5/F6 works as well as the controls in KDE panel.

There are still the error messages at boot and shutdown though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
