Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 958E04827C1
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jan 2022 15:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFE089BF0;
	Sat,  1 Jan 2022 14:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3027289A32
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jan 2022 14:37:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7591AB8072F
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jan 2022 14:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A21AC36AEA
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jan 2022 14:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641047824;
 bh=xPdzL48LEmMfU5u6VXfhb/LUCRLjHc22Q6ezgG6bey4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QvmvvrleOSMvNLvTzGN8CHYMAMJ5QipxBZdUy8krTllHBNbrxUB78a0VSoo3nLjdL
 e1UvXDpZNGxQo8g0cEaPCZF5hKLpjdCvW1jUmxMeE6JX3r+LNc97ru0310n+zNnR8N
 CviT44tffYKTqq8gftrJ1Re6Td8lu3hamAoI865R2HU7uKoJodOBKayY0eswzm8xwG
 BJBOkE/1DvH6XupErJdeMaiLuPZABsMqjpbfb4qkBBNi0CksMiEOOS51R8pGKxrbgL
 e/cUFJX+CuRcXLrRTisf9/9GhTBXMCCHYimUewb4urT9GFgXoR/5VSagAITasQ3ObF
 QfDvEJjhYfGNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 350F0C05FD4; Sat,  1 Jan 2022 14:37:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215443] [radeon] BUG: Unable to handle kernel data access on
 read at 0xc007ffffffff9130, Oops: Kernel access of bad area, sig: 11 [#1]
Date: Sat, 01 Jan 2022 14:37:04 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215443-2300-czCAWeQL3v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215443-2300@https.bugzilla.kernel.org/>
References: <bug-215443-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215443

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300197
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300197&action=3Dedit
kernel .config (kernel 5.16-rc7, Talos II)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
