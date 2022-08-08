Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D09158CDA3
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 20:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0555510E61E;
	Mon,  8 Aug 2022 18:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34AA10E5D9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:32:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A1BEB80EF0
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49196C43470
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659983523;
 bh=Co9tl5Hx9biuAmKfJC9ASb9cVG7nFSel9qGE/LmLfZ8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RS29E4jTcOLEPcR00ul1Jrkhyih+GtXGbtwMlV6xVp6gslQhcxwv3BiF2pd9vRNak
 jSXhbKKU5+DDajtgI4SIbUUYdNDHIplb8ZkA/qmFYm72UCqWGJUL1uT37rb4c5a7sS
 cG/KZ0eEomTfdnxAr0bq6A28kzi/bjXkq0JwAPPcpaeVkPqvMAEELI6RILq9VIv0Yw
 7lRdUl5yXXmw7eTr1XF9L3HRuTyZ0rX8B4IvqrqfCC8MPA23GQvAk/68Nm3ar45Yli
 gg3Jp4Bs1NNz/BEJs4FNn3MlLUZbbv8ZOEiUAS4XnNV8DtV4t8Xs3XzvV84RCce4Cj
 efwi4U39/f/+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2E3D7C0422F; Mon,  8 Aug 2022 18:32:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216092] rn_vbios_smu_send_msg_with_param+0xf9/0x100 - amdgpu
Date: Mon, 08 Aug 2022 18:32:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-216092-2300-gzd14khJb2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216092-2300@https.bugzilla.kernel.org/>
References: <bug-216092-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216092

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |mario.limonciello@amd.com
         Resolution|---                         |CODE_FIX

--- Comment #7 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
As pointed out in the linked #2110, it's fixed in Linus' tree by this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D149f6d1a6035a7aa6595ac6eeb9c8f566b2103cd

Which will be part of 6.0-rc1.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
