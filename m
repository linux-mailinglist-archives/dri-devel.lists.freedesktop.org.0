Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E6A309B82
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BEB6E049;
	Sun, 31 Jan 2021 11:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED426E049
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 11:11:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BB44064E13
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 11:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612091501;
 bh=qLL+9C1N1egJ6XMDtfS7Gjptgho1tbnQnvZNwG8IM3Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=doR9BaR/CEyyp+6UDlqZR1T8yg0io2xutse7aDTYrLZkSt/WThYzFjqfkFAeKOubq
 ncnbzxRwkQ+FB1x0rjGTTqvrcP5mWlQNGx3s0/j5bm5ZEXZ9/Z3bQ9m+Zpf/YkA+RB
 UUqDmkojgTgLdse4ekhPw5mApK5Vn3BA7RK+L++BG7UUNABmbJMakhU0kl4oGIuvee
 D5LZGsKj9FaEgxSPgTA81Tx0i+T7sT5cMv/gb7EAXEJYHINJk9riE/jJXjUFofFUvS
 ZZf08IJreUj6n2uLHrBoWpGUxuBhzdvpRasnj+NBCCZSzBHbFh9L++enjzw7U1IDzr
 ybz+4pWtS9Twg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AD1DF6531F; Sun, 31 Jan 2021 11:11:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMDk3MTNdIGFtZGdwdSBkcml2ZXJzL2dwdS9kcm0vYW1k?=
 =?UTF-8?B?L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2xpbmtfZW5jb2Rl?=
 =?UTF-8?B?ci5jOjQ4MyBkY24xMF9nZXRfZGlnX2Zyb250ZW5kKzB4OWUvMHhjMCBbYW1k?=
 =?UTF-8?B?Z3B1XSB3aGVuIHJlc3VtaW5nIGZyb20gUzMgc3RhdGU=?=
Date: Sun, 31 Jan 2021 11:11:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: fkrueger@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209713-2300-IbX6TdWbC0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209713-2300@https.bugzilla.kernel.org/>
References: <bug-209713-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209713

--- Comment #13 from Frank Kruger (fkrueger@mailbox.org) ---
The only change regarding "DCN" from 5.10.9 to 5.10.10 is

commit 99ea120383b19feb1737c787dc1c8b35ce630fc5
Author: Alex Deucher <alexander.deucher@amd.com>
Date:   Mon Jan 4 11:24:20 2021 -0500

    drm/amdgpu/display: drop DCN support for aarch64

    commit c241ed2f0ea549c18cff62a3708b43846b84dae3 upstream.

    From Ard:

    "Simply disabling -mgeneral-regs-only left and right is risky, given that
    the standard AArch64 ABI permits the use of FP/SIMD registers anywhere,
    and GCC is known to use SIMD registers for spilling, and may invent
    other uses of the FP/SIMD register file that have nothing to do with the
    floating point code in question. Note that putting kernel_neon_begin()
    and kernel_neon_end() around the code that does use FP is not sufficient
    here, the problem is in all the other code that may be emitted with
    references to SIMD registers in it.

    So the only way to do this properly is to put all floating point code in
    a separate compilation unit, and only compile that unit with
    -mgeneral-regs-only."

    Disable support until the code can be properly refactored to support this
    properly on aarch64.

    Acked-by: Will Deacon <will@kernel.org>
    Reported-by: Ard Biesheuvel <ardb@kernel.org>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
    [ardb: backport to v5.10 by reverting c38d444e44badc55 instead]
    Acked-by: Alex Deucher <alexander.deucher@amd.com> # v5.10 backport
    Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Any idea?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
