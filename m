Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A2D6D354D
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 04:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B4410E14B;
	Sun,  2 Apr 2023 02:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E293610E11D
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 02:53:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DEDC860AB1
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 02:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28444C433D2
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 02:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680404035;
 bh=muiOyMNUnLBrghCmTlExOQW56GgrJ+wnyt27rEAd2K0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=J56zEDZ4pucSeaZ43Y/AthF2zcAXMq6Lgfjx058iRD4+QKlafoqphlNPav28GoZj8
 Jyv4gv4dmjpVNvGp65Psbq5ZpVqJRHA0lnvZe82HY4fv4ViiM9ZzQ4Uez0LUdWdt81
 nw9L2isEDVX0ByoIOpShknKkuMFDJkA1L+cI1f/Fd1zY7CjJWynGdL7/GUHBCQAIq6
 qXeyIYcMWLF/7AelW8b/SWuEn9xRJnYD1g/17melsxiF1uVkjDeZfYmth2YxOcYqez
 UMh4KKll7NtB9FHdusYTJZ8pyvjveM055hnJ/A64omTl3X2wypQtCOSaSoBaHCFo9p
 SAOWLqFYQ/6nw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 09D51C43142; Sun,  2 Apr 2023 02:53:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217278] ast 0000:03:00.0: PM: **** DPM device timeout ****
 during S4 resuming
Date: Sun, 02 Apr 2023 02:53:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: wendy.wang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217278-2300-u1wf9rt4SL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217278-2300@https.bugzilla.kernel.org/>
References: <bug-217278-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217278

--- Comment #3 from wendy.wang@intel.com ---
Created attachment 304074
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304074&action=3Dedit
Failure log in mainline v6.1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
