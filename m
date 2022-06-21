Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26868553433
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 16:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BD310E65A;
	Tue, 21 Jun 2022 14:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E9910E61A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:08:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7CD69B8180C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AEA4C341C4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655820536;
 bh=VQG2Cac95ZGYMbWL3WntqzH2pNy6aXlsuKPKEI5mCR8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GSef77njOPt1+Rl0JAPyASqAoUwHFIsO/hS65nSdqeLlwUAOqkk4OTTfmj3wnPcPV
 iCWAquzBexwXIZf3M/rU6Rgr2DjGot4S75+NUNtd9FXZxe/jdiol89qjS6kFDSKwpH
 a4rinoivyI2AEDQbprTP1ffOJ6k8peSvGnFru0tSLf30XDGxHjRoVsH/W+vicBgjPC
 XiN9i+/c7Kgnqc2Pp/GiJZ0VnMjkIAA8k+skCtuLtVxPNthO0KnjCgkYHyENU2E8oB
 f66eiAqUPoQu2l5ozRKABigViBTsflD9YALM4JsRTTf/Vv7SKkK93YfhbPYFr8vu/F
 3hn1g0cbTGRWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 396D0CC13B4; Tue, 21 Jun 2022 14:08:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 21 Jun 2022 14:08:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216119-2300-BQY0Jv4bfC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #15 from Alex Deucher (alexdeucher@gmail.com) ---
Created attachment 301245
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301245&action=3Dedit
patch 3/4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
