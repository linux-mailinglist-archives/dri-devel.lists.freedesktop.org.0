Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A84911F2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 23:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03765112247;
	Mon, 17 Jan 2022 22:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED164112247
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 22:52:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82FC561200
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 22:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0D13C36AF2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 22:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642459936;
 bh=9NL5/aeNG7iiwZ2vfAjwL4e9UfrLlS9EssYY4m1I538=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=F7r9GRDfvLHiyUPe2H1HwWp2gRRV9eO8PvP3Il5QSQ73cMwMQYc6VN9ZYIibPMxmG
 h9Duz0q8xHISDHxiVS07AiHwpwgbQTX9K+Atave9JLGfOI4qk6CVWJjDofDLbEB3Ky
 dqkjx9fd4e01h1bTzqQX8Ps/hn4WmhbednkCDWfntmm9aWmHNNo4LD9KZ8Mw6Q/S1E
 OI+niCLe7+NAqIrR1PzXDw0SH70UofpyYWOIdIgxYhEexPvgZHpX7nPZXybIRmKmOs
 ErYuXjg3BdN1LZ951IGKQ0425KRII93qS+d0O/Gt8NAxQxZ7DCwGZBEySR0dr0rOgz
 lkoMHM0AeX2uQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C12C1CC13AC; Mon, 17 Jan 2022 22:52:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204559] amdgpu: kernel oops with constant gpu resets while
 using mpv
Date: Mon, 17 Jan 2022 22:52:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shoegaze@tutanota.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204559-2300-xHyacaonVN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204559-2300@https.bugzilla.kernel.org/>
References: <bug-204559-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204559

Maxim Sheviakov (shoegaze@tutanota.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
