Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4797731F60E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 09:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995226EAC3;
	Fri, 19 Feb 2021 08:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8F46EAC3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 08:50:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1CED064D92
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613724636;
 bh=qMXolbqapy4JUzlP4xNQmg7wDuViu3k753eSxZJMXcs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=izIgnSZmgZAGteUAjV0D1DgmJzvX0fv+V3zc/Gn+YuvmKtl7+Voh4sPw+nKdnWGHI
 VkgQh9aptIGWf7ektSw+kw0nNVPg93oej+nvSEsK7Wd1ABp121XcwV5bDRN2heZ98s
 KZ/cN4Lhm5bHbNnICeBHjbwXie68RPk08eDZTalkGUrDNLpfV/S5Z6oBk/8qV8JrZV
 kv+kYg+ExjcdTnH93t3+ls4lXKHQnVHPjqjzTnXAqjmd1UCRefYdz55L/T8SCVA6Q9
 uMxSFZ2qVceyFyBVGZKDcZ9skL8JQNIXLa9Rk0+0hPPvO28Lx56FE1/M/8cPbDix23
 UFVIR8UwfW69g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0BE0065339; Fri, 19 Feb 2021 08:50:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Fri, 19 Feb 2021 08:50:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-211425-2300-16Bvsepytu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211425

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.10.16                     |5.10.17 and 5.11.0

--- Comment #10 from Andreas (icedragon.aw@web.de) ---
FYI - also the last versions 5.10.17 and 5.11.0 are affected:

Do Feb 18 18:05:34 2021] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
more than 20secs aborting
[Do Feb 18 18:05:34 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B200 (len 3615, WS 8, PS 0) @ 0xB34E
[Do Feb 18 18:05:34 2021] [drm:amdgpu_atom_execute_table_locked] *ERROR*
atombios stuck executing B0F4 (len 268, WS 4, PS 0) @ 0xB147
[Do Feb 18 18:05:34 2021] [drm:dcn10_link_encoder_enable_dp_output] *ERROR*
dcn10_link_encoder_enable_dp_output: Failed to execute VBIOS command table!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
