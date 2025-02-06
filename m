Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8697EA2AFCF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852DF10E309;
	Thu,  6 Feb 2025 18:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HwzzPJ6m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937E510E309
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:07:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 50B1C5C6AFB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0DD6C4CEE3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738865226;
 bh=4nm6yNGKIGJWHIrLqnYTtX/yanCPM1W/LjynjHtmkKQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HwzzPJ6mEN/JkHcL42nouj3Iep3kmFFfQbwzj8CMFOa6X1kKbr/iL0QSHJFW8Tep3
 yKspqUe745g1O7X/bOf56g/hRHtsT2RVzfvtFw7ES7oWrXeas8e6571rXKZoycGKnp
 q+cxhbqPbRr7OpWdIGseLwdjkB/KQUe8FgL8lZ0ftIupQFAllxQa+Ajto2kMhKhujz
 XyipcRQDS9i7wiPywkumlN/PwL1iUIiOr9dRtkU4QrJfr7DbkX/lSuZYZS19V3AWSL
 syp5ag+GVVQTMKgENpOlo9ZfPCDk/DS5AIHezFRCqiT1dwfIaoZdXp8W37hJxtelJ1
 XG0YY8+Aoh6IA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B2713C41615; Thu,  6 Feb 2025 18:07:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219754] When screen blanks and resumes there will be an error:
 kernel: amdgpu 0000:0b:00.0: [drm] REG_WAIT timeout 1us * 100 tries -
 dcn32_program_compbuf_size line:138
Date: Thu, 06 Feb 2025 18:07:06 +0000
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
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219754-2300-ySNuRe6yRl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219754-2300@https.bugzilla.kernel.org/>
References: <bug-219754-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219754

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please repost here: https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
