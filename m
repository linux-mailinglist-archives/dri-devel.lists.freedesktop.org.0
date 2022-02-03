Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A714A8743
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BC110EFFB;
	Thu,  3 Feb 2022 15:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC14510EFF9
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:07:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37E0A61A7C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FD5FC340ED
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643900853;
 bh=QgcfUa1yre8KDwU2Owh+iZIS7IonTfSkADbPcZe4PpY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LGsrhm9LLsvFjeCB4WxeC6j18cBRUwZb4V4EmunoJa2S27pjmHzslSh/Q51AVyS3Z
 nQIum0XN0Ly72H80DcueTdIfoCw2KTzdGAdERWHf/rBZKLMZbJEp7yrN1xW3KLW28r
 2exXYm0WaxeRBbf6ZIndpYeHUWN3tRz8SbyfAGSUSUVwAUfTeJukTMfNfSUvx3XnxV
 x5jbZotP78IK8dTsWjRIH/a/n9dQJMbucMyEh70zxAWRnQoczzbi0imKC/nKRtyh03
 PEALLnC5H21cC9XR+jWrN9a5U2JUq+xg7Rs0f2bs4c9wWVEDGH8FWuccXGq/m71Xko
 xPsI9v92CY3/g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 82D6BC05FCE; Thu,  3 Feb 2022 15:07:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] Dual monitor with amd 5700 causes system to hang at
 startup.
Date: Thu, 03 Feb 2022 15:07:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215511-2300-dfxKZGQu5f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215511-2300@https.bugzilla.kernel.org/>
References: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

--- Comment #5 from Alex Deucher (alexdeucher@gmail.com) ---
Created attachment 300385
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300385&action=3Dedit
possible fix

This patch should fix it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
