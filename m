Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC3054E993
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 20:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E9F10F1E8;
	Thu, 16 Jun 2022 18:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A8E10F056
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 18:40:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B6F061CEA
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 18:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F13BAC3411B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 18:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655404802;
 bh=0w79LvCyFMCvZoSbWfFIm8nq4SEMF56P8Z78jt2R/wY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Rb1yzMHmBjfU1f3Tx6x63xDpik0clhZsju7nMLWxK96bHD4eA+hN4WdkAfqHHXQ01
 LYfPe17nvnuzXMBDRuTqVzgF9OKAIRvDfTaTZt1q9JntQ3nZJw7BPQJ7SNV0HM1dIA
 jcnw9vFSMP6q+oZ4eFZ3g7kMZ+CaEyYG/n2PShZ0Ros90ZNMdG5Ju9F8cQBRdw5Vxv
 dIUNxp8XgPsixAYOleonwQ8GURwXVx2PtIti3YcGvk01sKnzKvmHrALDTomhV1APeN
 UCO8z3Z//41COOtZ5SFnE0kLlAouhhhR261iu+pXj7NvXE+zNuurZ+EiH8N8y+5zhR
 Dc3HAne3mXglQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DAC62CC13B3; Thu, 16 Jun 2022 18:40:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 16 Jun 2022 18:40:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216119-2300-YmARpVqFMH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

Harald Judt (h.judt@gmx.at) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|ANSWERED                    |---

--- Comment #4 from Harald Judt (h.judt@gmx.at) ---
I have tried 5.18.4 which includes this patch, and I also think 5.18.3 came
with this patch. Unfortunately, this does not fix hibernation for me, though
the symptoms are a bit different: No longer can I see any kernel messages l=
ike
before (see comment #1), but the screen stays black. I can reboot my kernel
with keyboard sysrq keys, though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
