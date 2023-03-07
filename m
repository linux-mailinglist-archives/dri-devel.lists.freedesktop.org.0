Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A986AD76D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 07:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EA510E0F9;
	Tue,  7 Mar 2023 06:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B102910E0F9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 06:29:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0595161221
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 06:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 678EEC4339C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678170556;
 bh=F1Gt3fj5y20DN/z04FTpbkQHAMsOFGuH9jHxVyJzBDg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZlWFBfPCf0ukZBPTQkNUT/D7bnRZs5t4x23RVUouVWtRVnXASiT8DEPxfi7NKqmRX
 ozvZZw/wIfjlMHIqBgJ5llfh1IjaaggP+PHX/0XC/ZrwY8adP9/aRQax/gmXzrmVwF
 jC/m6frPnsd36ZMJDVlekdOW+ICdbQHpkXRzDRr4QL+fp6CTyn6Ip233ipceIT8LQg
 FfINW/K4OpaJTBOs/IixlHuqPx8v2DLwJmnHfS2SdIDkP5L+F7xGn8Uxlr9rnvveaU
 NMLTaKxARHGzCBzsJ/wsIVHtXl9tLBeTWLJ6GQgB9dmOzvVmgZBMbSUaogyUmaBFIY
 jgdAIFexmg/eA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3F8D4C43141; Tue,  7 Mar 2023 06:29:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217141] [amdgpu] ring gfx_0.0.0 timeout steam deck AMD APU
Date: Tue, 07 Mar 2023 06:29:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217141-2300-xgZATJgwvc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217141-2300@https.bugzilla.kernel.org/>
References: <bug-217141-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217141

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
