Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A41B6A8BCB
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 23:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D60110E589;
	Thu,  2 Mar 2023 22:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B13410E592
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 22:27:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4C0B615EA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 22:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15160C433EF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 22:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677796046;
 bh=cLLWNdfsR7Ac2QHwYJ+kkIHSWy2MrixaUEC0dZCVJtE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XFVnPLOso8S92ehrhkuksIq4GcFWOwPwRswTgt6yl8EmHbcJk5w2/E4FTVn03vRL5
 a61jnJZw77hhbpXIi2JjGqAuyR84dWJ7JOxu90fuhfLVc/A9LenAffizmAwyp0dBze
 9OU8hTMBVQTfwfVKY+DGqYuGG8QqlA7fJt4caCNUmvKbQLyaMw5oBK86ixqlr0VW1w
 obPcnojRmoAr/9NrdDmoQhjxjJLRBx4z4PVT8UnYNtbAJNaL9k0ELB4Z73/Gy8CN/j
 LDHQ/7S4vfsGg9Kvih1UpiC75XA77rpQRqkanQ6o8qleZT/k6e9HTeYcMvXvYRV+8c
 QxX5h0gX9AY1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EE69CC43143; Thu,  2 Mar 2023 22:27:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217110] GPU Lockup on Radeon Pitcairn - VAAPI related
Date: Thu, 02 Mar 2023 22:27:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edman007@edman007.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217110-2300-ylnPlJ804s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217110-2300@https.bugzilla.kernel.org/>
References: <bug-217110-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217110

--- Comment #3 from Ed Martin (edman007@edman007.com) ---
Thanks, reported here https://gitlab.freedesktop.org/drm/amd/-/issues/2440

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
