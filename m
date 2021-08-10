Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B633E2737
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 11:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43156EB04;
	Fri,  6 Aug 2021 09:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FED6EB04
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 09:28:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 446F461154
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628242109;
 bh=p5M3qmlSHuaQlGXPG9S6mB5GrkgYpG97yXyf0pN5NI8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ldLJDBh/dfKGXax+2ckPgorRwR8ec1oBqORt3HoCfHTKG/hc4wP+XeHnJvyK51t3U
 V3vscH5XHfjSHF35XLPjVyDWh8dsnBuoNWabxSmZelVl29NY0+GIvVwwFir0REgwud
 BYXEy9jRyPvFTeqJWLu1cGkrI70v557KfMpZKf7oRj/jVztTj9ALB2a7J8iz4v7iGP
 UP0QlWd/vhVJOhvzQE7GJNTPDQjVz47niCUGaD0VjVvTi2lYQsUVKhDR/rVUFvUpsT
 LM3/5+lfwkLyIuUttUAewxa982C/+YiLE3FryMbcCjYQ4krlFDH1ZMU3mbhaIdnpCT
 ptvdJ3u5DTaxw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 420E360F70; Fri,  6 Aug 2021 09:28:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213983] WARNING: CPU: 3 PID: 520 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x7a/0x803 [ttm]
Date: Fri, 06 Aug 2021 09:28:29 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213983-2300-9SiaEVcgtq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213983-2300@https.bugzilla.kernel.org/>
References: <bug-213983-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213983

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298223
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298223&action=3Dedit
kernel .config (5.14-rc4, AMD A10-7860K)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
