Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A634833FB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 16:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C74F896A3;
	Mon,  3 Jan 2022 15:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD39896A3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:10:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D6B56B80EF2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94DEAC36AEF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641222637;
 bh=ietJo6HKMNfchkxkwU6x9y0GZsIa4wJZnY2v3dUeaJc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HSRzTU3q5rsBsINM5CHFbfqrl+5LAhZ8rhQvnf7WbnLuxGOZQC8ETqHu7YUv/bDOF
 u5kzIB6FQgNkzmeLwJcIQI+SPN/QTJ5PV5n1pQmeYtlisjdd95wJeT+P2SeuSZeoiw
 kBPOQVYv8y2hKTyyRb+QnsHh4MFGWJkBsmpXjS3rtax1SYvwCPFDq72NhJf5e+687d
 9tBwN/kHEn09/kpJy7azVKczHB+MQezearKhhPstu7vFPahBKE3+Q+WlGMLHW5RPT8
 TcVbqTg6g0mLgulYBVU11j0xRO9kMP8M9EKy4VC8CxT4rFnugzNHPBN4IavuzaVQKq
 nGcj2NJYkS0Ug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7B426C05FDD; Mon,  3 Jan 2022 15:10:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215443] [radeon] BUG: Unable to handle kernel data access on
 read at 0xc007ffffffff9130, Oops: Kernel access of bad area, sig: 11 [#1]
Date: Mon, 03 Jan 2022 15:10:37 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: PPC-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform_ppc-64@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215443-2300-jD7bxmiglc@https.bugzilla.kernel.org/>
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

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
does appending amdgpu.runpm=3D0 on the kernel command line help?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
