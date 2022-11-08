Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2C8621A64
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579CB10E489;
	Tue,  8 Nov 2022 17:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE1510E489
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:24:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87C89B81BAC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:24:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40B88C433C1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667928263;
 bh=BuvEht3CnEWZnPdLFTIqqWDxdmsSt5ay6uK2CCYGSlg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=E4lqDULDKZmsJaR7pa6DjdoqlSozYrJ1YqVoJVMmGZdJOyXpxH05YD8QwEaTENiD4
 0rwsv0Cf6lyzzNwf46xpBN4juaertCeUkwRwgf3EzdKfG1A37hh0Yjf9gwAxKu5PSH
 OUFRDpDHP0F/bJJ7meFJzPFC6KyGjRYTZ13+pF+qF/LLqhp+C3Ec4oIruNwEACfRM6
 KQUDUUqu3lcU7z8qGKhBs6offZFxiYJWU6zo+5/A16u7RrjW3x6gK58L4adP/IPRsv
 gqy+CPJMrG3cgzTqQ7E0tSRqceeJy+HRQEg1g0IkAApL0OiGMzhc0X7zify0LYgzoD
 BUX/nzd36sOZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2F311C433E7; Tue,  8 Nov 2022 17:24:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216673] Recurring amdgpu freeze on kernel 6.0.6 only
Date: Tue, 08 Nov 2022 17:24:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stanislav.modrak@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216673-2300-Ei0yTEwhGu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216673-2300@https.bugzilla.kernel.org/>
References: <bug-216673-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216673

--- Comment #1 from Stanislav Modrak (stanislav.modrak@gmail.com) ---
Seems similar to
[https://gitlab.freedesktop.org/drm/amd/-/issues/2113](https://gitlab.freed=
esktop.org/drm/amd/-/issues/2113)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
