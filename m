Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F219752C8A2
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 02:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9277410EF90;
	Thu, 19 May 2022 00:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9302110EF90
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 00:34:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D06C0617AE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 00:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF7BFC3411D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 00:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652920440;
 bh=pIliSdB10tA5fTLzPg/puQPX/KL+53aTQsWzAlMkGPo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hYd+acpHCGcGGhjsAAW5KWR+Wi7muupp8wQLSJkaLRx5oXh5EZOqdUZNA95xhLqE1
 awe3ZvY8gq2L4ZawT1yI5rQFre5XswVj4hdz7Ygjq3UGyLagqAQXePsuAUwzF+NJKZ
 w3iwF7zoS2HJhPWpCMkkICjYSka6oNSc4Ytm/yE3Lo5GqRGlGVXTdv/eSMkTo7ZL30
 Fg4RO5lyYFXwp7CbSMvlJniAkhg5rm9o74xg/MDNxkHZgqwoAtO5TEc0r5ZbKe+QRY
 A9bJ/gQICsgpIOgDa9qHHd9b+vLHCTqpKDEwlD2MieefHJAE4pj6qCJxX7WXhZYMn4
 dpHgrIP3i5m/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C2385CC13B5; Thu, 19 May 2022 00:34:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201497] [amdgpu]: '*ERROR* No EDID read' is back in 4.19
Date: Thu, 19 May 2022 00:34:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rev@pop.ms
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201497-2300-KepDjjlVF0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201497-2300@https.bugzilla.kernel.org/>
References: <bug-201497-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201497

Rev (rev@pop.ms) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rev@pop.ms

--- Comment #24 from Rev (rev@pop.ms) ---
Issue is back in 5.17.9 (and 8), AMD 5600G, Mesa
22.2~git2205170600.fffafa~oibaf~f, so its 4 years now?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
