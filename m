Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67886F7BA7
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 05:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B2F10E550;
	Fri,  5 May 2023 03:51:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF8010E550
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 03:51:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8C6663900
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 03:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2ABE9C433EF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 03:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683258663;
 bh=K088nUvJclAa/n7pKftuEscczOuopngWWbhkXhmz3qY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DGlSj5Yf7YqIRyDtST08tgvGn3u7XqPo1gjuSkpoR6bQlntLoHmAH4dsijUsERwTo
 vwrtuvWp+9EBw9rjcgVbbNQKb79bMqqrfvLrCGKWIPwa+nEUom1kyiQ3euHFZ5zEDK
 Q6ZdpsJ6/QFX+6FI9HtcCMYfT4ZILVDPAEbAbm3Ai9n4SIwEWV0WEDWo9iMxSzKE8Z
 GPawrS4EimlUvK+mQUTs4y+QlEKhWtPzT4vWHozlulXEwqpVtloNX4VHoQm27z79Gk
 CV73IEWl4ZlIx/kL43ZBEkJJoGko/XyxLLMUTU/QvkUzf+hnikTINcF7FB5gmM1t8F
 wROGyglr07xzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1C7E3C43144; Fri,  5 May 2023 03:51:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217397] amdgpu module loading breaks display output - no signal
Date: Fri, 05 May 2023 03:51:02 +0000
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
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217397-2300-fpJWp6iT0H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217397-2300@https.bugzilla.kernel.org/>
References: <bug-217397-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217397

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---


*** This bug has been marked as a duplicate of bug 217398 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
