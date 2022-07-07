Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E356ACEC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 22:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781C514AAF8;
	Thu,  7 Jul 2022 20:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC5E14AAF5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 20:48:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D12D62438
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 20:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76DE2C3411E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 20:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657226878;
 bh=Si9lXhUHKLyk7l0+yjZArTIolPcbJUHCvrC+vnGectM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CUsmXIf3Epkj3b0ZYPSksJhJ5oM38JBb3fo0IxtyKWDZEODjIY322ZbwutUEOo/2V
 E8Rrm13ckM6HiAGr51uoxMg4f4ftMc4lBtJSoF4MmLAHVhZgjQXRGyo7WCqmEdFVg9
 bUouj4WA/frfLlMNgIuoiTEZgHU/iaIPAdLyg+db9S7+zf70Ya7uyzWCKIylxg6w6x
 txwqrHQjpkqf02zYfhhHj63Ir0P6tDbW0v0jf4b3+FvhHzrW4nfqWrUzUk0l5pOuh4
 f5ed6P0RnZfDMB3oxNeflvdOkJxWjVCmzO+5npPbNVbWIuRH6k6P1RNw9Bzd0Jw8G3
 +K88N7hpfp3ag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 63567CC13B0; Thu,  7 Jul 2022 20:47:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210369] amdgpu fails to resume from suspend
Date: Thu, 07 Jul 2022 20:47:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-210369-2300-23zShHssHP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210369-2300@https.bugzilla.kernel.org/>
References: <bug-210369-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210369

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |mario.limonciello@amd.com

--- Comment #2 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Can you please re-check this on a recent 5.18.y kernel and latest
linux-firmware?  I don't believe it should still be an issue.  If it is, I
would like to see a new log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
