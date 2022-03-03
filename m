Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511A74CC2E1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 17:33:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FB910E2CE;
	Thu,  3 Mar 2022 16:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6B510E2CE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:33:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A27D761548
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17DFBC340F3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646325220;
 bh=OnrXReliarI0k8VvwGjW1l7a8E1JDQUQnouK8jobpSg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rGxN/yAoJClkorngicQbg3Qxwcq4TCGURCnuv5HYf4I0I9BJa6dudj9Mess/7nPNv
 CFHQmh0FjJXOjHAniGXfNdAuLxZLIS++2e6Blbv8tMFUGeyoMVvz0BufD9Spkzkuhz
 n2BBrsQURevXpQ7okaIPrH/+3N1xmTCtxts9juuVseQ3BDVEb+dNsVhpAqVzCW9Ca4
 WNx1fG/yBICVs3LmMgNsJ1tvMFXQCsJJ7sMuZ8nV4VPq/sA7La4aG+cqH4Gv+i5L0c
 vkNepxJC6CZQGPMofC4ZbJNqc+X+BdnuLpwbgXqENyJnY09/GQSZ6dCGHBNpJGqykd
 H/31hZyC3XFag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 06916C05FCE; Thu,  3 Mar 2022 16:33:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 03 Mar 2022 16:33:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215652-2300-VhE0WckDtD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215652-2300@https.bugzilla.kernel.org/>
References: <bug-215652-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215652

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
Ok, changed my config to include the firmware via
CONFIG_EXTRA_FIRMWARE=3D"radeon/R520_cp.bin"
CONFIG_EXTRA_FIRMWARE_DIR=3D"/lib/firmware"

With CONFIG_DRM_RADEON=3Dy the machine boots now as expected with no radeon=
 error
messages.

With CONFIG_DRM_RADEON=3Dm radeon does not load and I still get "modprobe: =
ERROR:
could not insert 'radeon': Unknown symbol in module, or unknown parameter (=
see
dmesg)" trying to load it manually via modprobe -v radeon.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
