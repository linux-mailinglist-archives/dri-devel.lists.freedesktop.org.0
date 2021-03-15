Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2621233AE9A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 10:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E5389D64;
	Mon, 15 Mar 2021 09:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0455B89D64
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 09:24:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F285D64E33
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615800282;
 bh=v3jUI9CtqaB2bqW+8s8K6HhUuM0jxhUGsdSyCzicdUU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fgNY6Vn4Q8S45ET/FakE0hNACrGyPW6w28+2DKM/565DtEWmB5OJ9Az5xfjJqdB7V
 6byODB0OToZUfxaIGHkR0uHylSxpulQcS1DAsSPA4bx09yxAJVX0rTVL2OUB6SMisy
 7YEIU1lu4u8KPQtp906B7Ee2p+cQqIDPCM59QtwzHnVUysmp4juVbIr3dA53+AdRQA
 OI/27uFRIlRXthUcs+UzhhC9aBazNRpQkAgS9Ra4K9AmqbXtLhK/PKcsaaaPJdv+qZ
 7IGGrE2L26D+yuIQg0hyRq7QH9fK5PI4lkHz4ZR6hc9Y7eM+4Kk5HpyCkgCxTNwO0s
 IkNdSbJKc2FfQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E49F06534C; Mon, 15 Mar 2021 09:24:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212255] WARNING: at arch/x86/kernel/fpu/core.c:129
 kernel_fpu_begin_mask
Date: Mon, 15 Mar 2021 09:24:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: info@felicetufo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212255-2300-CYqJa23dPi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212255-2300@https.bugzilla.kernel.org/>
References: <bug-212255-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212255

--- Comment #4 from Felice Tufo (info@felicetufo.com) ---
I confirm that the fix solves the bug on kernel 5.12.0-rc3 (at least on my test
system).

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
