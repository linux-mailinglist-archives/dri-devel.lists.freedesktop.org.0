Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BC26E1AE2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 05:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B7410E10E;
	Fri, 14 Apr 2023 03:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA9210E10E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 03:43:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2A63616D4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 03:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 394C4C433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 03:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681443834;
 bh=GiwDbQqiOIviADowh/vaPYsWk/BiD63IdWw3gy2J4Bg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tVXtAX7oZdxp/HH1mwVgJ7IV38wSNIHm7HN7gP9BaxJTvuVDEV8nRk34rMUy9Fklv
 vVkty83Fcnv/WtQAioyptE7SRUCogJculbOI/sCsKBerIsvS5SyZo8mmUykD8clcRB
 w/vW3aQbGHZEasvKvcOaINx/WZ4Yc0vTlQJMPZ7JkUqxFr8iKvsa8JkwKBrXaTTqAU
 Twt82LOwQ+sxe4+Zf7yoAwPZkWrQK0BDO6zOSTAMRt2z+DlctxW4mms74Wr40u3klU
 pmKe1p9vpQbTI4TFQerZOZInSNa+tFWQYuo9fOWjX3UsWm5eUhUlCefzZlqwzdtXNW
 Dwbx43aunkYzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2AAB2C43143; Fri, 14 Apr 2023 03:43:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217278] ast 0000:03:00.0: PM: **** DPM device timeout ****
 during S4 resuming
Date: Fri, 14 Apr 2023 03:43:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: wendy.wang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217278-2300-81W4jraw5J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217278-2300@https.bugzilla.kernel.org/>
References: <bug-217278-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217278

--- Comment #8 from wendy.wang@intel.com ---
Created attachment 304133
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304133&action=3Dedit
0001-drm-ast-Fix-long-timeout-which-could-lead-to-panic.patch_v6.3-rc5

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
