Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C765349379
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511116ED7C;
	Thu, 25 Mar 2021 13:58:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98C06ED7C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:58:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D79B61A2E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616680714;
 bh=ECvhGShsJClsZiW0R/xTP5H21R6QvT2vo8sjfePwNFo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=a7/oex4QO2JFnPs/fK14JNV+GloTpQISa6031AIgay+/K6JSczJffYnrXjx5dulL3
 8P0gtGJW0o9v38dhYke2wLuwDvpb2AsjfkcSSEAmWC8Ystm9R1/6cet91dktyj1DPv
 fzfZANNnl7v9/lui/Sx/nhkOjeLGsgqJLkFw3z5un0XA3VRd64iGTsqkY8X5ZGTlN6
 R2tCUx4Owu4bJ2UBnTHDfaOLmWVIwS9Ont3XRD2bCN/4dB8CTwXqqLkFZ5o7FVOEUV
 rzWli0y1N1hKD85splj3JoFup9Bk2cbeoccXkj2gPKttsLJG+qqH9egh5fqQ6M1JYI
 yyXlZPT8ieCog==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1970B62AC3; Thu, 25 Mar 2021 13:58:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Thu, 25 Mar 2021 13:58:33 +0000
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
Message-ID: <bug-203905-2300-dDqIQz6XRN@https.bugzilla.kernel.org/>
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

--- Comment #26 from Paulo Nascimento (paulo.ulusu@googlemail.com) ---
laptop: Lenovo Legion 5, amd ryzen 5 4600h
Graphics:  Device-1: NVIDIA TU116M [GeForce GTX 1660 Ti Mobile] driver: nouveau
           Device-2: Advanced Micro Devices [AMD/ATI] Renoir driver: amdgpu
Kernel 5.11.6-1
Manjaro 21.1

I have tried all suggested workarounds:
- systemctl start systemd-backlight@backlight:amdgpu_bl0

- mkinitcpio with MODULES=(amdgpu)

- acpi_backlight=vendor

- acpi_backlight=video

- /usr/lib/systemd/systemd-backlight save backlight:amdgpu_bl0
  /usr/lib/systemd/systemd-backlight load backlight:amdgpu_bl0

Even echo 10 >/sys/class/backlight/amdgpu_bl0/brightness doesn't change the
brightness.

Any suggestions?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
