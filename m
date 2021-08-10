Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05873E8313
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 20:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1233D89ACD;
	Tue, 10 Aug 2021 18:36:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA4E89ACD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 18:36:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D638A60E78
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 18:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628620585;
 bh=98orzASxgL3MPrpdzMgR698T2m/yRV9rvTjivZTEuv8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ETMPULYPSlj2OFX8jGr6wzcGApxRNOxqEQSQ7Dokknfql01uBN7IsqOqXhZnsbiGD
 DEVCh/uXC9CCJDC4oOVuanDCq1g2d0zyudqUWdUREpOLSuHucPOhr4H55TmJ3BKbi+
 RM7M1SBfRTQA4OyVOZPGlUmibx8ZOOFJ9T0sqOEz+HoI51whhToZqfeGuvn3hQCMzo
 f19gBqREnDIHViKDjEQzwUoenLN8aQQBCiXZbfOVLUW2s3hE2WhbCeiee5Ki67nU+8
 fVtAY5PeoS9bxFVjAAdGJblgucsUB9fIGc5qExhq/nQbR0WPTXotEWwluYdXzyTq+s
 F88T/wB02qleA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D35B260E9A; Tue, 10 Aug 2021 18:36:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [NAVI] Several memory leaks in amdgpu and ttm
Date: Tue, 10 Aug 2021 18:36:25 +0000
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
Message-ID: <bug-214029-2300-PlT1sZ7Dvo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298269
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298269&action=3Dedit
kernel .config (kernel 5.14-rc5, AMD FX-8370)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
