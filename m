Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F42355FF20
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 13:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F28014A3DF;
	Wed, 29 Jun 2022 11:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7195014A3DF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:58:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B31C761B45
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21C2AC341CC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 11:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656503890;
 bh=kEKG83Jc8GqaR5Habt3t5H7k/NkCL/+XTp0QMwqIcz8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SQUcwv8mpxlB0GFUKK9P3WUOHWXHcZ9UsxLkM19llLehIr+TCf+F7+skM9ejFQrVN
 wfR98lFKZgUd8Z3jObR2zLEbpDow208AJTGoE3cIfVJk5I1AxI0jvepnXJp6RfOBn9
 xRcJTJcOxDm8AZQsSVY/hNI68VBn0Ef9iMWgtkEtbQxCHhmx6XToyyQm6orjJa5y85
 RTuwFlU/dRJILazurw/+i5Q8NfRSjU+VN+Tuh9uGIZ65DOFqGs1gSZ8VZQplNtzPZU
 d0BmyVu1rar7UlDXM9LHDag3ZtKxFwuIroEg7qlvfT0PQB+ryjs0nbZzwhjPKjLzJ8
 ux/emyzyJa9NQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0CD0FCC13B1; Wed, 29 Jun 2022 11:58:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216188] nvidiafb: unknown NV_ARCH
Date: Wed, 29 Jun 2022 11:58:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-216188-2300-1fIsHYsJDN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216188-2300@https.bugzilla.kernel.org/>
References: <bug-216188-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216188

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |aros@gmx.com
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
nvidiafb shouldn't be used nowadays, specially with your unsupported hardwa=
re.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
