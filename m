Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC7E578E85
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 01:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64906113525;
	Mon, 18 Jul 2022 23:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2C711351C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 23:59:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E9AE9B817CD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 23:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0A71C36AE3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 23:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658188744;
 bh=X5c7euavr1fIXbpZK4KJwHmDfiCsgWX9/E8HOu52gL0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rJh1EUUUARcNSaoh23Qz5CCiWJtSxjiBEHMOdMLc0fGqG+cjxvZgBZOvzV4fc2j6F
 GfuugCiKvBAnkRE/9oDcCjLTXEuNczvf8taMJx08O3M3ZrnaWY8nOxdC8hEGxVIs4s
 u9YtnvLiwEM/m24x+/OticyurGjmskNEn/R3obpjkAwl9TnJ1GoOfMCKD5iyJB87vR
 LxDD9tWuIyVCHvOxhxSLZH9ZM3dL9zSCFjQ0/s96aFkJ+q5GL+zPeUPlWC+Ly7u/Dm
 Am4PWHTAOndHE7+8aWt+tfy2AcUEH7+Impt2LWHogCsUxSNkIP9gi9Btw17Zu7vfhF
 KW3NeJIIAmQAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 95CB8CC13BB; Mon, 18 Jul 2022 23:59:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Mon, 18 Jul 2022 23:59:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216143-2300-mvsepxLu6E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
v5.19-rc7 still affected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
