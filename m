Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A89E5E84
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 19:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45CF10E3B9;
	Thu,  5 Dec 2024 18:55:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XU8dH5d4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342E010E3B9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 18:55:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 585C7A43EC3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 18:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08410C4CEDE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 18:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733424914;
 bh=e50UOxm3lGB7O3+eWENwtqIkBDmKjh768y6KRFVfMmM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XU8dH5d4vzu7CSoIfAOjlLHMvOAm0dvXJONGjOMTSTzqjI5OqzkOzPWShz93BxiyY
 wYb8dhTHTDiSrn9WmKtXefyDvX4qXulwCZTZT+WtXZTD1xP2jNWUru0L/UotBjirUw
 2lHjRP4O4BwZfNWGHtTc6MEr1r7qyzx7FE+jC3C15AqWkpiUjX3hV1AZHzfAESJG7y
 vtCB1zZpvQY1V9ZzbQjJGMbRqqfdtHSePkrW2W5mpSEQ8nJFNZHKdg+KuhqEKSUqWA
 USxdlI82w7uZP1jtb51sTuxKFGVirGBjmoF8hwcm8MPDI4/DEO/2qlOYtBLUS5/XCo
 bUVW9zR0Ok/0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 03073C41612; Thu,  5 Dec 2024 18:55:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219563] amdgpu graphical glitches on Thinkpad E14 G6 with panel
 self-refresh enabled
Date: Thu, 05 Dec 2024 18:55:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219563-2300-zyZhPivF0J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219563-2300@https.bugzilla.kernel.org/>
References: <bug-219563-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219563

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
AFAIK, this could be solved in 6.12.2.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
