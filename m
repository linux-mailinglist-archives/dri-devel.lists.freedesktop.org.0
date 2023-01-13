Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A2E6692BD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 10:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36AE710E9CB;
	Fri, 13 Jan 2023 09:16:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF64810E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 09:16:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 093CD6111B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 09:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FFDBC43392
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 09:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673601406;
 bh=1Z3OnHNPDZuDAhmCar31oY2su2Yc0lnPkRf+MTRVg2Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CdJJ/t3hxASkRPrcOz+EYEIMcW+MHpxK3BB9/bJwqQw4yWqjy5VUovTm3cgN4oQ/D
 aDdMtvBFHKOgEN7OnrsM6zXFfjVhMK2AWvtpiHAwC+59oPxXDTwLIF+Mm8HCeVAG3A
 tCWqcdmY12pOmpAaSvNMiyeNadJdnvOnZ7Bv8/nHZKRDWqs5wl2E0878nxAx5MB8s7
 Lxsz38TuQlTt2enZBOPe/wvYiOX5YjRDNr4Ew5CHeDU0eBlzKeyYQY4BhH0IMX5ds3
 rR5bp6ca7/L+mDeU1/N3qeIj3TYRwjCLreyOiEgLRYf8sZzMvBpLlWe+uhJd95Ca9L
 JRrGwGOdKsinw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5621DC43144; Fri, 13 Jan 2023 09:16:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Fri, 13 Jan 2023 09:16:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-gTyGiJpLP7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #11 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
Just for the record, if someone cares or lands here some time in the future:

There is another report about hibernation problems with ryzen cppus in 6.0.=
18
here:
https://lore.kernel.org/all/2d59ed2b-ba8f-6695-9764-fd3b109acd4c@mailbox.or=
g/

Bisection result included (drm/amdgpu: make display pinning more flexible
(v2)).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
