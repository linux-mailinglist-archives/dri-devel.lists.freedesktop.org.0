Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DBE483423
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 16:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2B0894B7;
	Mon,  3 Jan 2022 15:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7210C894B7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:26:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EDD9761155
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55D90C36AF4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641223616;
 bh=aStJUhKMXMAqkltNeHtsKnCEQpLEYUwXW1xgzGsGDAI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mAYkD3YEpPg6QrOxGQXIAGeEm7kXg2HOda+3GtG0+zZ+04U9KWUgPLVf/X2yEs7Qw
 poMlNvZlE8r5JoFdOiTSCPT63bKriZ798mJXkaIqZTiyfnMNVqRNoCKv4jxlbnAhqr
 XRhl47UwFVTQlOIAMR3HXF+yqjrExzr5q2lzQP9L3BNRog8G/NaV7NUdyYqdfTngr8
 bHCOjZkShVkv5tPmlHXIzxb2gLT5i4y6DV6nCaRarm+gBN4k403ydGPs5gm0nOPLMx
 xk9atZFv9ObUxCX/TNyfiIywoR/9JYF51rRU1SkcymzpZ+bZkr7UW/ZtiQF61XZLQo
 VTOon5ijzT5Yg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3F10FC05FDB; Mon,  3 Jan 2022 15:26:56 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215443] [radeon] BUG: Unable to handle kernel data access on
 read at 0xc007ffffffff9130, Oops: Kernel access of bad area, sig: 11 [#1]
Date: Mon, 03 Jan 2022 15:26:56 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215443-2300-io0HKHjRW1@https.bugzilla.kernel.org/>
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

--- Comment #3 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Alex Deucher from comment #2)
> does appending amdgpu.runpm=3D0 on the kernel command line help?
I doubt it as amdgpu is not even built (# CONFIG_DRM_AMDGPU is not set, see
attached .config).

The card in question is a Radeon HD 6670 using the radeon drm module. Sorry=
 I
forgot to mention that!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
