Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3026665AB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 22:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9008010E0C0;
	Wed, 11 Jan 2023 21:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D347810E0C0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:37:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBB7A61EDF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:37:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5603AC433D2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673473039;
 bh=dTocmdqdcKzNLkSalvd/asZtyeKTXoDAg47SGSmRqnU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Jj+Uo5I/zzDu6I5EAn9pHYercsqlO3ArqeEXWNDqSCX4Bc60SKVQdrm+yXRiEOnwh
 AtM/bb8L0nXX8eCr9kIvsLULWHk4+bhxaZO0oWm8mciKfy7Bho3At9AWNQc1oWQnXj
 FVsCbSmSGutTDay4bjVQH3khDy2zivEKMAnWvnKf9Id3elbDIC0DeIk7tlpl2DdtHZ
 8AYBaTWXYib/uY5Sl1Ti4rqhzmTkVzxlab4qvc5oL9K2wOdkgPvBCOp36jAZYCTnKH
 Wks/Nx2PkX3P61RGogm3at3aUnrapH9S6rmFY5cohcF17GCd4/B45rHRQh0HO5nGyv
 VkprKRhrxp1pQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 44567C43141; Wed, 11 Jan 2023 21:37:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Wed, 11 Jan 2023 21:37:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status component assigned_to
Message-ID: <bug-216917-2300-RvVghUFFBx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
          Component|Platform_x86                |Video(DRI - non Intel)
           Assignee|drivers_platform_x86@kernel |drivers_video-dri@kernel-bu
                   |-bugs.osdl.org              |gs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
