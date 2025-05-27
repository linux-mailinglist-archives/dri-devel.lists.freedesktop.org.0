Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE732AC5C4F
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 23:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D2E10E0FE;
	Tue, 27 May 2025 21:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MaJMjBHw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4394810E0FE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 21:39:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CB23649EE4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 21:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93B65C4CEF3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 21:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748381990;
 bh=wy638L9z3NqQkPpU7UrdvSMc35OsktdpTZjWmrWGOhI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MaJMjBHw7mxP3rzdcQFs/zxGmgoVEqkpZVqZ1DW5gD4FE3dB+w7gKAbzJMiCrm+YK
 A2261u7anKN2zkS4AVV/Xy2XifUeszUi6vEurRPZ6MnGh3xJnyOZNJ0pcexaJRrx/W
 MwW+BWmKMtTrT4gLwq2XQsR6i/NSloYzrOR7uhpDh452q4vvMiSN08Gp/evM0ZH9T0
 TDU3CA2eMRpovQk9RPc/EjxwJVhVkd0JODL1MPcGXXYjJiGA5iEopvijr1NP/A3CkL
 tzGzu2xeyVZhA5mYrdX/vEb4Z7EIzn9xU8uJODHtdziQKhQMGdPb7b1orfQMcCIYxI
 fpe7wbQArxVCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8BD7EC433E1; Tue, 27 May 2025 21:39:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 200531] amdgpu: *ERROR* REG_WAIT timeout when a display is put
 to sleep
Date: Tue, 27 May 2025 21:39:50 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-200531-2300-QjXDuj244P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-200531-2300@https.bugzilla.kernel.org/>
References: <bug-200531-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D200531

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
